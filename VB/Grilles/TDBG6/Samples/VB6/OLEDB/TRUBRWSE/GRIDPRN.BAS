Attribute VB_Name = "Module3"
' ---------------------------------------------------------
'       Copyright ©1995-1998 APEX Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True DBGrid Pro 6 sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that APEX Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------


' ================================================================
' This module contains code for printing the contents of a
' Data Bound (DataMode=0) APEX [True] DBGrid.
'
' One of the follow conditional constants must be defined:
#Const TrueDBGrid6 = 1
'#Const TrueDBGridStd = 2
'#Const APEXDBGrid = 3
'
' To use the module, just include it in your project and
' make a call to the Public Sub PrintGrid().  The form of the
' call is as follows:
'
'    PrintGrid grid, recset, frm, prn [, rowlimit]
'
'         where:  * grid is one of the 3 grid type objects that
'                   can be used.  For example, TDBGrid1.
'                 * recset is a valid recordset, and is the recordset
'                   to which the grid object is bound.  If the recordset
'                   does not contain any records, nothing will be
'                   printed.  e.g. - Data1.Recordset
'                 * frm is the form which contains the specified
'                   grid object in the first argument.  This is
'                   necessary to obtain the ScaleMode so that the
'                   grid's Width property can be correctly interpretted.
'                 * prn is a valid Printer object.  The simplest to
'                   use is the Default printer, Printer.
'                 * rowlimit is an optional parameter which specifies
'                   the maximum number of records to be printed
'                   whenever the entire Recordset is to be printed.
'
'     There are also implied inputs which are taken from the grid's
'     properties:
'
'        1)  If the grid's SelBookmarks collection has a non-zero
'            Count, then only the selected rows will be printed.
'            If the Count is zero, then all rows in the recordset
'            will be printed, up to the specified rowlimit.  Records
'            are printed in the order in which they appear in the
'            SelBookmarks collection, so sorting (if desired) should
'            be performed and the SelBookmarks collection altered
'            prior to calling PrintGrid.
'        2)  Only visible columns are printed.
'        3)  If grid.SelStartCol is >= 0, then only the columns
'            from grid.SelStartCol to grid.SelEndCol, inclusive
'            are printed.
'        4)  Columns are printed in display order, so if the user
'            moves them around at runtime, the print order will
'            change as well.
'        5)  Column widths are determined from the grid column
'            width.
'        6)  Row heights are adjusted from row to row so that
'            all of the data in each cell can be printed.  Text
'            is appropriately wrapped when possible.
'        7)  Column Formatting is taken from the grid column
'            NumberFormat property.  This routine cannot support
'            FormatText Events.
'        8)  The Font used for grid printing is grid.Font.Name
'            and grid.Font.Size.  The existing Font for the printer
'            object is restored before PrintGrid returns.
'
'   Other implied inputs:
'         -  Only a single split containing all of the columns is
'            printed.
'         -  No evaluation of the grid width is taken into account
'            when printing, so if it is too wide, bad things may
'            happen.

Option Explicit
    
'
' Controlling constants for PrintGrid
'

'Set up some constants for the printer
Private Const pageMargins = 1440    ' 0.5 inch in twips
Private Const cellMargins = 72      ' 0.05 inch in twips
Private Const greyness = 224        ' RGB(greyness,greyness,greyness)
                                    ' is used for shading headers
'The following string is used to flag a continuation when printing
'of a single row spans a page boundary.
Private Const continuedString = "<---- Record Continued ---->"

'Set up some Cache variables
'Set up some constants to access the data in the cache.
Private Const rsField = 0           ' recordset field position
Private Const gcColm = 1            ' grid column object
Private Const gcWidth = 2           ' grid column width (twips)
Private Const gcFormat = 3          ' grid column format
Private Const gcText = 4            ' a working buffer
Private Const constLast = gcText    ' width of ccache

'Variables used globally within this module, but not available
'from outside this module.
Private CCache() As Variant ' Place to cache stuff
Private prn As Printer
Private rsClone As ADODB.Recordset
Private colmax As Integer
Private pageLeftMargin As Integer
Private totWidth As Integer
Private gpage As Integer

'Grid dependent declarations
#If TrueDBGrid6 Then
Private Grid As TDBGrid
#ElseIf TrueDBGridStd Then
Private Grid As TDBGridS
#ElseIf APEXDBGrid Then
Private Grid As DBGrid
#End If

Private Sub PrintHeaderInfo(First As Boolean)
    '
    'Prints the grid caption information for each page
    'If more than 1 page is necessary, then the "grid page"
    'is added to the grid's caption.
    '
    'Additionally, this routine builds the text in the CCache
    'gcText element as a working buffer.  This allows the column
    'headers to be wrapped and printed by PrintCachedRow below.
    '
    Dim order As Integer
    Dim saveText() As String
    Dim capt As String

    prn.FontBold = True
    prn.CurrentX = pageLeftMargin
    If prn.CurrentY < pageMargins Then _
        prn.CurrentY = pageMargins

    'initialization
    If Not First Then
        ReDim saveText(0 To colmax)
        For order = 0 To colmax
            saveText(order) = CCache(gcText, order)
            CCache(gcText, order) = CCache(gcColm, order).Caption
        Next order
        gpage = gpage + 1
    Else
        gpage = 1
    End If

    'if a grid Caption is present, then print it out, and
    'include the appropriate grid page number.  The grid
    'Caption should be greyed and centered.
    If Not IsNull(Grid.Caption) Then
        If Grid.Caption <> "" Then
            capt = Grid.Caption
            If Not First Then
                capt = capt & " (Page " & Str$(gpage) & ")"
            End If
            prn.FillStyle = 0
            prn.FillColor = RGB(greyness, greyness, greyness)
                
            order = prn.CurrentY
            prn.Line (pageLeftMargin, order)-(pageLeftMargin + totWidth, order + prn.TextHeight(capt)), , B
            prn.CurrentY = order
            prn.CurrentX = pageLeftMargin + (totWidth - prn.TextWidth(capt)) / 2
            prn.Print capt
            prn.FillStyle = 1
        End If
    End If
    
    PrintCachedRow True
    prn.FontBold = False
    
    'Stuff the cache working buffer with the header information
    If Not First Then
        For order = 0 To colmax
            CCache(gcText, order) = saveText(order)
        Next order
        ReDim saveText(0)
    End If
End Sub

Private Sub PrintCachedRow(grey As Boolean)
    '
    ' Prints a row of data stored in the CCache(gcText,n) elements
    ' If the "grey" argument is true, then fill the cells with
    ' a grey background
    '
    Dim order As Integer, start As Integer
    Dim sx As Integer, sy As Integer, sh As Integer
    Dim dx As Integer, dy As Integer
    Dim more As Boolean, greycolor As Long
    Dim testStr As String, testWidth
    prn.CurrentX = pageLeftMargin
    
    'remember the current position, and get the standard character
    'text height for calculation of grid line drawing.
    more = True
    sx = prn.CurrentX
    sy = prn.CurrentY
    sh = prn.TextHeight("A")
    
    'adjust the printer object's fill based upon the grey argument
    If grey Then
        greycolor = RGB(greyness, greyness, greyness)
        prn.FillStyle = 0
        prn.FillColor = greycolor
    End If

    'more indicates whether or not all of the lines necessary
    'for the grid row have been printed.
    While more      'more is true if a column has unprinted data
        dx = sx
        dy = prn.CurrentY

        For order = 0 To colmax
            'If the column width is less than twice the cell margins
            'it is treated as invisible, and not printed at all.
            If CCache(gcWidth, order) > 2 * cellMargins Then
                start = dx              'starting point of the current column
                dx = start + CCache(gcWidth, order) 'end of current column
                
                'a box with fillcolor must be drawn first, or the fill will
                'overwrite the column separators and text.  The following
                'adds the grey shading to the cell background.
                If grey Then
                    prn.Line (start, dy)-(dx, dy + sh), greycolor, B
                End If
                
                'draw the vertical divider ob the left of the cell.
                prn.Line (start, dy)-(start, dy + sh)

                'get the text that fits within the cell and print it
                'it is assumed that all data will be left justified.
                prn.CurrentX = start + cellMargins  'start at the left margin
                prn.CurrentY = dy

                'determine the number of twips that are available for
                'printing in this column, and make a copy of the data
                'string.
                testWidth = CCache(gcWidth, order) - 2 * cellMargins
                testStr = CCache(gcText, order)

                'remove characters from the test string, until the string
                'will fit into the space allowed.
                While prn.TextWidth(testStr) > testWidth
                    testStr = Mid(testStr, 1, Len(testStr) - 1)
                Wend
                
                If Len(testStr) = 0 Then
                    'if no characters will fit, we cannot print
                    'anything, so throw the data away.
                    testStr = ""
                    CCache(gcText, order) = ""
                ElseIf Len(testStr) = Len(CCache(gcText, order)) Then
                    'if all the data will fit, then clear the all the
                    'text from the cache.
                    CCache(gcText, order) = ""
                Else
                    'continue to shrink down the test string if not on
                    'a word boundary
                    Dim blk As Integer, break As Boolean
                    break = False
                    If Mid(CCache(gcText, order), Len(testStr) + 1, 1) <> " " Then
                        blk = Len(testStr)
                        While blk > 0 And Not break
                            If Mid(testStr, blk, 1) <> " " Then
                                blk = blk - 1
                            Else
                                break = True
                            End If
                        Wend
                        If blk > 0 Then
                            testStr = Mid(testStr, 1, blk)
                        End If
                    End If
                    
                    'now remove any leading blanks from the remainder
                    'of the string
                    blk = Len(testStr) + 1
                    While blk <= Len(CCache(gcText, order)) And Mid(CCache(gcText, order), blk, 1) = " "
                        blk = blk + 1
                    Wend
                    
                    'the cache data text must be adjusted to contain only
                    'that data which could not be printed on the current
                    'line, but must be printed on the next line.
                    If blk > Len(CCache(gcText, order)) Then
                        'if the remaining text is all blank, we are done,
                        'so clear all of the cached text.
                        CCache(gcText, order) = ""
                    Else
                        'save only the remaining text, ignoring the leading
                        'blanks.
                        CCache(gcText, order) = Mid(CCache(gcText, order), blk)
                    End If
                End If
                
                'testStr contains what fits within the cell margins, and
                'therefore what needs to be printed.  Print the string.
                prn.Print testStr;
            End If
        Next order
        
        'draw the vertical divider on the right of the last cell.
        prn.Line (dx, dy)-(dx, dy + sh)
        prn.CurrentX = dx
        prn.CurrentY = dy
        prn.Print   'position to the next available line

        'if all of the cached strings have zero length, then
        'we are done with this row.  Adjust the "more" flag.
        more = False
        For order = 0 To colmax
            If Len(CCache(gcText, order)) <> 0 Then
                more = True
                Exit For
            End If
        Next order
        
        'if there is more data for this row, but will not fit
        'on the current page, start a new page and set it up
        'with the appropriate headers.
        If more And prn.CurrentY > prn.Height - 3 * pageMargins / 2 Then
            prn.Print
            prn.CurrentX = pageLeftMargin + (totWidth - prn.TextWidth(continuedString)) / 2
            prn.Print continuedString
            prn.NewPage
            prn.CurrentY = 0
            PrintHeaderInfo False
            sy = prn.CurrentY
            dy = sy
        End If
    Wend

    'restore the original Fill Style
    If grey Then
        prn.FillStyle = 1
    End If
    
    'draw a box around the entire row.  This provides row
    'dividers for both top and bottom of the row.  If a row
    'has been split across pages, the last line does NOT
    'have a closing (bottom) divider (by design to show
    'that a continuation is taking place).
    dy = prn.CurrentY
    prn.Line (sx, sy)-(dx, dy), , B
    
    'position for the next row.
    prn.CurrentX = 0
    prn.CurrentY = dy
    
    'this row is complete, but a new page may be required.  If so, start
    'a new one with the appropriate header information.
    If prn.CurrentY > prn.Height - 3 * pageMargins / 2 Then
        prn.NewPage
        prn.CurrentY = 0
        PrintHeaderInfo False
    End If
End Sub

Private Sub SetTextCache()
    '
    ' Sets up the CCache text cache for the current row of
    ' the rsClone.  Handles formatting, Nulls, etc.
    '
    Dim order As Integer
    Dim data As Variant

    'First, convert everything to text, formatting as necessary.
    'This will allow us to process the data with text wrapping.
    For order = 0 To colmax
        If VarType(CCache(rsField, order)) = vbNull Then
            'Unbound columns handled here.  The rsClone position has
            'already been set prior to this call
            data = CCache(gcColm, order).CellValue(rsClone.Bookmark)
        Else
            'Bound columns handled here
            data = CCache(rsField, order)
        End If
        If IsNull(data) Then
            CCache(gcText, order) = ""
        ElseIf VarType(data) = vbString Then
            CCache(gcText, order) = data
        ElseIf CCache(gcFormat, order) <> "" Then
            CCache(gcText, order) = Format(data, CCache(gcFormat, order))
        Else
            CCache(gcText, order) = CStr(data)
        End If
    Next order
End Sub

'PrintGrid Routine
'
' This is the public routine called by other modules.  It is the only
' Public name available from this module.
'
' The Sub declaration varies depending upon the grid selected.
'
#If TrueDBGrid6 Then
Public Sub PrintGrid(tgrid As TrueOleDBGrid60.TDBGrid, rs As ADODB.Recordset, frm As Form, prntr As Printer, Optional rowlimit As Variant)

#ElseIf TrueDBGridStd Then
Public Sub PrintGrid(tgrid As TDBGridS, rs As ADODB.Recordset, frm As Form, prntr As Printer, Optional rowlimit As Variant)
#ElseIf APEXDBGrid Then
Public Sub PrintGrid(tgrid As DBGrid, rs As ADODB.Recordset, frm As Form, prntr As Printer, Optional rowlimit As Variant)
#End If
    'if there is no data, then there is nothing to print.
    If rs.BOF And rs.EOF Then Exit Sub


    Dim colm As TrueOleDBGrid60.Column, colms As TrueOleDBGrid60.Columns    ' grid objects
    Set Grid = tgrid
    Set colms = Grid.Columns
        
    'Determine how many columns need to be handled.  Only print
    'selected columns if any are selected, or all visible columns
    'otherwise.
    Dim selStart As Integer, selEnd As Integer
    If Grid.SelStartCol >= 0 Then
        selStart = Grid.SelStartCol
        selEnd = Grid.SelEndCol
        colmax = selEnd - selStart + 1
    Else
        selStart = 0
        selEnd = colms.Count - 1
        colmax = selEnd
    End If

    'Set up the clone. We will cache the fields
    Set rsClone = rs.Clone

    'Set up the cache.  Sometimes, variants are really cool
    ReDim CCache(0 To constLast, 0 To colmax)

    'Save the current printer properties that will be modified
    'so they can be restored before returning to the caller
    Dim oldFillStyle As Integer, oldFillColor As Long
    Set prn = prntr         'set the module global
    oldFillStyle = prn.FillStyle
    oldFillColor = prn.FillColor
    
    Dim oldFont As Font
    Set oldFont = prn.Font
    
    Dim prnFont As New StdFont
    prnFont.Name = Grid.Font.Name
    prnFont.Size = Grid.Font.Size
    
    Set prn.Font = prnFont

    'Loop within a loop so we can determine the column
    'order once, and store required info in the cache
    'in the order we want it.
    Dim order As Integer
    
    'first set the ScaleMode of the form to twips.  This
    'will cause the grid properties to always return Column
    'widths in twips as required by the Printer object.
    Dim oldScaleMode As Integer, colcnt As Integer
    oldScaleMode = frm.ScaleMode
    frm.ScaleMode = 1
    colcnt = -1
    For order = selStart To selEnd
        For Each colm In colms
            If colm.order = order And colm.Visible Then
                colcnt = colcnt + 1
                If colm.DataField <> "" Then
                    'if DataField is not empty, a bound column
                    Set CCache(rsField, colcnt) = rsClone.Fields(colm.DataField)
                Else
                    'DataField is empty.  Flag an ubound column
                    'with a Null rsField entry.
                    CCache(rsField, colcnt) = Null
                End If
                'cache the column object for general properties
                Set CCache(gcColm, colcnt) = colm
                
                'cache the width and format since they are used
                'for each cell printed, and so be more efficient.
                'The width must be cached, since twips must be
                'used and the ScaleMode will be restored following
                'this loop.
                CCache(gcWidth, colcnt) = colm.Width
                CCache(gcFormat, colcnt) = colm.NumberFormat
            End If
        Next colm
    Next order
    frm.ScaleMode = oldScaleMode    'restore the form's scale mode

    'Reduce the cache size to that actually required.
    If colcnt < colmax Then
        colmax = colcnt
        ReDim Preserve CCache(0 To constLast, 0 To colmax)
    End If

    'Now process the data.
    oldScaleMode = prn.ScaleMode
        
    ' set coordinates to twips.  twips are used for drawing.
    prn.Scale

    'Start with the caption and headers.  Add up all the
    'column widths.
    totWidth = 0
    For order = 0 To colmax
        totWidth = totWidth + CCache(gcWidth, order)
        CCache(gcText, order) = CCache(gcColm, order).Caption
    Next order
    
    'Center the grid horizontally if possible
    pageLeftMargin = (prn.Width - totWidth) / 2
    If pageLeftMargin < pageMargins Then _
        pageLeftMargin = pageMargins
    
    'remove 0.25 inch offset.  This is for laser printers.
    pageLeftMargin = pageLeftMargin - 360

    'print the initial header of the grid.  Other headers
    'will be handled by the row printing.
    PrintHeaderInfo True
    
    'If there are Selected rows, print them, otherwise
    'print the entire recordset up to the rowlimit.
    If Grid.SelBookmarks.Count > 0 Then
        Dim bkMax As Integer
        Dim sbooks As TrueOleDBGrid60.SelBookmarks
        
        Set sbooks = Grid.SelBookmarks
        bkMax = sbooks.Count - 1
        For order = 0 To bkMax
            'Position to the next Selected Row
            rsClone.Bookmark = sbooks(order)
            
            'Set the data cache
            SetTextCache
            
            'Print the cached data
            PrintCachedRow False
        Next order
    Else
        Dim rowlim As Long
        'if the optional rowlimit is not present, set the
        'rowlimit to the maximum possible Long value
        If IsMissing(rowlimit) Then
            rowlim = &H7FFFFFFF
        ElseIf VarType(rowlimit) <> vbInteger And VarType(rowlimit) <> vbLong Then
            'if the rowlimit is not a valid number, print
            'all the rows.
            rowlim = &H7FFFFFFF
        Else
            rowlim = rowlimit
        End If
        
        'print using the clone beginning with the first
        'row of the recordset.
        rsClone.MoveFirst
        While Not rsClone.EOF And rowlim > 0
        
            SetTextCache
            
            'Now output the data to the printer
            PrintCachedRow False
            
            'Move to the next record
            rsClone.MoveNext
            rowlim = rowlim - 1
        Wend
    End If
    
    ReDim CCache(0)         ' release allocations and object
    Set rsClone = Nothing   ' release clone

    'restore the Printer Object settings
    Set prn.Font = oldFont
    prn.FillStyle = oldFillStyle
    prn.FillColor = oldFillColor
    
    'release the module global objects
    Set prn = Nothing
    Set Grid = Nothing
End Sub



