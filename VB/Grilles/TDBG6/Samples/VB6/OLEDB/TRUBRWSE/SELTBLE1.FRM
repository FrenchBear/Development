VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form PickTable 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Table List (OLE DB)"
   ClientHeight    =   2325
   ClientLeft      =   1635
   ClientTop       =   1545
   ClientWidth     =   4440
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "SELTBLE1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2325
   ScaleWidth      =   4440
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   1815
      Left            =   120
      OleObjectBlob   =   "SELTBLE1.frx":030A
      TabIndex        =   2
      Top             =   240
      Width           =   2895
   End
   Begin VB.CommandButton Cancel 
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   540
      Left            =   3360
      TabIndex        =   1
      Top             =   960
      Width           =   990
   End
   Begin VB.CommandButton OK 
      BackColor       =   &H80000005&
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   540
      Left            =   3360
      TabIndex        =   0
      Top             =   240
      Width           =   990
   End
End
Attribute VB_Name = "PickTable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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

'Number of tables to be displayed
Dim noTables As Integer

Private Sub Cancel_Click()
    'User has cancelled choice so the selCancel flag is set and the form unloaded
    Screen.MousePointer = vbHourglass
    selCancel = True
    Unload PickTable
End Sub

Private Sub Form_Activate()
    OK.SetFocus
End Sub

Private Sub Form_Load()
    With TDBGrid1
        .ExtendRightColumn = True
        .ColumnHeaders = False
        .RecordSelectors = False
        .MarqueeStyle = dbgHighlightCell
        .Splits(0).Columns(0).DividerStyle = dbgNone
    End With
    
    'Remove one of the Default columns
    TDBGrid1.Columns.Remove 1

    'Turn off column dividers
     TDBGrid1.Columns(0).DividerStyle = dbgNoDividers
 
    'Center the Form on the Screen
    CenterForm PickTable
End Sub

Private Sub OK_Click()
    'If user clicks OK then selTable contains the value the user has chosen
    Screen.MousePointer = vbHourglass
    selTable = TDBGrid1.Text
    Unload PickTable
End Sub

Private Sub TDBGrid1_DblClick()
    'Simulate the click of the OK button
    OK_Click
End Sub

' MakeBookmark function
Private Function MakeBookmark(Index As Long) As Variant
    ' This support function is used only by the remaining
    ' support functions.  It is not used directly by the
    ' unbound events.  It is a good idea to create a
    ' MakeBookmark function such that all bookmarks can
    ' be created in the same way.  Thus the method by
    ' which bookmarks are created is consistent and easy
    ' to modify.  This function creates a bookmark when
    ' given an array row index.

    ' Since we have data stored in an array, we will just
    ' use the array index as our bookmark.  We will convert
    ' it to a string first, using the Str$ function.  Thus,
    ' if Index = 27, the Bookmark that is created is the
    ' string " 27".  (Str$ always leaves a leading space
    ' for the sign of the number.)
    
    MakeBookmark = Str$(Index)
End Function

' IndexFromBookmark function
Private Function IndexFromBookmark(Bookmark As Variant, _
        Offset As Long) As Long
    ' This support function is used only by the remaining
    ' support functions.  It is not used directly by the
    ' unbound events.
    
    ' IndexFromBookmark computes the row index that
    ' corresponds to a row that is (Offset) rows from the
    ' row specified by the Bookmark parameter.  For
    ' example, if Bookmark refers to the index 50 of the
    ' dataset array and Offset = -10, then
    ' IndexFromBookmark will return 50 + (-10), or 40.
    ' Thus to get the index of the row specified by the
    ' bookmark itself, call IndexFromBookmark with an
    ' Offset of 0.  If the given Bookmark is Null, it
    ' refers to BOF or EOF.  If Offset < 0, the grid is
    ' requesting rows before the row specified by
    ' Bookmark, and so we must be at EOF because prior
    ' rows do not exist for BOF.  Conversely, if
    ' Offset > 0, we are at BOF.
    
    Dim Index As Long
    
    If IsNull(Bookmark) Then
        If Offset < 0 Then
            ' Bookmark refers to EOF.  Since (noTables - 1)
            ' is the index of the last record, we can use
            ' an index of (noTables) to represent EOF.
            Index = (noTables + 1) + Offset
        Else
            ' Bookmark refers to BOF.  Since 0 is the index
            ' of the first record, we can use an index of
            ' -1 to represent BOF.
            Index = 0 + Offset
        End If
    Else
        ' Convert string to long integer
        Index = Val(Bookmark) + Offset
    End If
    
    ' Check to see if the row index is valid:
    '  (0 <= Index < noRows).
    ' If not, set it to a large negative number to
    ' indicate that it is invalid.
    If Index > 0 And Index <= noRows Then
       IndexFromBookmark = Index
    Else
       IndexFromBookmark = -9999
    End If

End Function

' GetUserData function
Private Function GetUserData(Bookmark As Variant, _
        Col As Integer) As Variant
    ' In this example, GetUserData is called by
    ' UnboundReadData to ask the user what data should
    ' be displayed in a specific cell in the grid.  The
    ' grid row the cell is in is the one referred to by
    ' the Bookmark parameter, and the column it is in it
    ' given by the Col parameter.  GetUserData is called
    ' on a cell-by-cell basis.
    
    Dim Index As Long
        
    ' Figure out which row the bookmark refers to
    Index = IndexFromBookmark(Bookmark, 0)
    
    If Index <= 0 Or Index > noRows Then
        ' Cell position is invalid, so just return null
        ' to indicate failure
        GetUserData = Null
    Else
        GetUserData = selList(Index)
    End If
End Function

' UnboundGetRelativeBookmark event
Private Sub TDBGrid1_UnboundGetRelativeBookmark( _
        StartLocation As Variant, ByVal Offset As Long, _
        NewLocation As Variant, ApproximatePosition As Long)
    ' TDBGrid1 calls this routine each time it needs to
    ' reposition itself.  StartLocation is a bookmark
    ' supplied by the grid to indicate the "current"
    ' position -- the row we are moving from.  Offset is
    ' the number of rows we must move from StartLocation
    ' in order to arrive at the desired destination row.
    ' A positive offset means the desired record is after
    ' the StartLocation, and a negative offset means the
    ' desired record is before StartLocation.

    ' If StartLocation is NULL, then we are positioning
    ' from either BOF or EOF.  Once we determine the
    ' correct index for StartLocation, we will simply add
    ' the offset to get the correct destination row.
    ' GetRelativeBookmark already does all of this, so we
    ' just call it here.
    NewLocation = GetRelativeBookmark(StartLocation, Offset)
    
    ' If we are on a valid data row (i.e., not at BOF or
    ' EOF), then set the ApproximatePosition (the ordinal
    ' row number) to improve scroll bar accuracy.  We can
    ' call IndexFromBookmark to do this.
    If Not IsNull(NewLocation) Then
       ApproximatePosition = IndexFromBookmark(NewLocation, 0)
    End If
End Sub

' GetRelativeBookmark function
Private Function GetRelativeBookmark(Bookmark As Variant, _
        Offset As Long) As Variant
    ' GetRelativeBookmark is used to get a bookmark for
    ' a row that is a specified number of rows away from
    ' the given row.  Offset specifies the number of rows
    ' to move.  A positive Offset indicates that the
    ' desired row is after the one referred to by Bookmark,
    ' and a negative Offset means it is before the one
    ' referred to by Bookmark.
    
    Dim Index As Long
    
    ' Compute the row index for the desired row
    Index = IndexFromBookmark(Bookmark, Offset)
    If Index <= 0 Or Index > noRows Then
        ' Index refers to a row before the first or
        ' after the last, so just return Null.
        GetRelativeBookmark = Null
    Else
        GetRelativeBookmark = MakeBookmark(Index)
    End If
End Function

' ClassicRead event
Private Sub TDBGrid1_ClassicRead(Bookmark As Variant, _
        ByVal Col As Integer, Value As Variant)
    ' ClassicRead is analogous to the Fetch event of the
    ' TrueGrid Pro VBX control.  When the grid needs data
    ' in DataMode 3, it fires a ClassicRead event for
    ' each visible cell on the grid to retrieve the data
    ' that will be shown there, so it fires on a
    ' cell-by-cell basis.  The cell that this event is
    ' firing for is specified by the Bookmark (which
    ' tells which row to fetch the data from) and the
    ' Col parameter (which gives the column index).  The
    ' only difference from the Fetch event of the VBX is
    ' that the row to fetch is specified by a Bookmark
    ' and not an integral row index.  Thus, you must
    ' determine which row in your data source the bookmark.
    ' GetUserData uses the IndexFromBookmark function to
    ' do that.
    
    ' Assume that a function GetUserData(Bookmark, Col,
    ' Value) takes a row bookmark, a column index, and
    ' a variant which will hold the appropriate data to
    ' be fetched from the array or database.  The function
    ' returns the fetched data in the Value parameter if
    ' the fetch is successful, otherwise, it returns Null.
    
    Value = GetUserData(Bookmark, Col)
End Sub







