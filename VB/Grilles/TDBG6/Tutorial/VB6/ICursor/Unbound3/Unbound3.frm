VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - DataMode 3 Tutorial"
   ClientHeight    =   3060
   ClientLeft      =   1305
   ClientTop       =   1665
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   ScaleHeight     =   3060
   ScaleWidth      =   6585
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Height          =   2775
      Left            =   120
      OleObjectBlob   =   "Unbound3.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   6375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' General declarations
Option Explicit

' Use a 2 columns by 100 rows array as data source,
Dim MaxCol As Integer           'Number of columns
Dim MaxRow As Long              'Number of rows

Dim GridArray() As Variant

Private Sub Form_Load()
' Initialize the data array.  Data must be ready
' before the grid is loaded.  Form_Load or Main is a
' good place to initialize the data.
    MaxCol = 4
    MaxRow = 100
    
    Dim C As TrueDBGrid60.Column
    Dim Col2 As TrueDBGrid60.Column
    Dim Col3 As TrueDBGrid60.Column

    If MaxRow > 0 Then
        ' If MaxRow = 0, then (MaxRow - 1) equals -1.
        ' This causes an error in the statement below, so
        ' we handle this special case in the Else clause.
        ReDim GridArray(0 To MaxCol - 1, 0 To MaxRow - 1)
    Else
        ReDim GridArray(0 To MaxCol - 1, 0)
    End If
    
    Dim I As Integer, J As Long
    For I = 0 To MaxCol - 1
        For J = 0 To MaxRow - 1
            GridArray(I, J) = "Row" + Str$(J) + ", Col" _
                              + Str$(I)
        Next J
    Next I
 
' You can configure the grid either at design time or
' run time.  Assuming you have not done this at
' design-time, the following code configures a grid
' with 4 columns.  By default, the grid already has 2
' columns, so we just need to add 2 more (don't forget
' to make the new column visible).   The existing
' columns are numbered 0 and 1, so we will add new
' columns at positions 2 and 3.
    Set C = TDBGrid1.Columns.Add(2)
    C.Visible = True
    Set C = TDBGrid1.Columns.Add(3)
    C.Visible = True
    
' Make the grid aware of newly added columns
    TDBGrid1.ReBind
    
' For the sake of efficiency, we use Column objects
' to reference column properties instead of repeatedly
' going through the grid's Columns collection object.
    Set Col2 = TDBGrid1.Columns(2)
    Set Col3 = TDBGrid1.Columns(3)
    
' Set column heading text
    Col2.Caption = "Column 2"
    Col3.Caption = "Column 3"


' Inform the grid of how many rows are in the data set.
' This helps with scroll bar positioning.
    TDBGrid1.ApproxCount = MaxRow
End Sub

Private Function DeleteRow(Bookmark As Variant) As Boolean
' DeleteRow is called to logically delete a record
' (row) from the array.  The row to be deleted is
' given by the Bookmark parameter.

    Dim I As Long, Index As Long
    Dim J As Integer

' Figure out which row index the bookmark refers to
    Index = IndexFromBookmark(Bookmark, 0)
    
    If Index < 0 Or Index >= MaxRow Then
        'Row index is invalid, so exit the delete,
        ' indicating failure.
        DeleteRow = False
        Exit Function
    End If
    
' Decrement the number of rows in the dataset
    MaxRow = MaxRow - 1
    
' Shift the data in the array to fill the empty
' space vacated by the deleted row
    For I = Index To MaxRow - 1
        For J = 0 To MaxCol - 1
            GridArray(J, I) = GridArray(J, I + 1)
        Next J
    Next I
    
' Resize array to free storage space used by deleted
' row
    If MaxRow > 0 Then
        ' If MaxRow = 0, then (MaxRow - 1) equals -1.
        ' This causes an error in the statement below, so
        ' we handle this special case in the Else clause.
        ReDim Preserve GridArray(0 To MaxCol - 1, 0 _
              To MaxRow - 1)
    Else
        ReDim Preserve GridArray(0 To MaxCol - 1, 0)
    End If
    DeleteRow = True
    
' Calibrate scroll bars based on new dataset size
    TDBGrid1.ApproxCount = MaxRow
End Function

Private Sub TDBGrid1_ClassicWrite(Bookmark As Variant, _
        ByVal Col As Integer, Value As Variant)
' ClassicWrite is analogous to the Update event of
' the TrueGrid Pro VBX control.  When the user
' changes data in the grid and commits the change by
' moving off of the row in DataMode 3, the grid fires
' a ClassicRead event for each cell on that row.  This
' event is fired on a cell-by-cell basis.  The cell
' that this event is firing for is specified by the
' Bookmark (which tells which row the data to be
' stored is in) and the Col parameter (which gives
' the particular column index of this cell).  The
' only difference from the Update event of the VBX is
' that the row in which the data is to be stored is
' specified by a Bookmark and not an integral row
' index.  Thus, you must determine which row in your
' data source the bookmark refers to.  StoreUserData
' uses the IndexFromBookmark function to do that.

' Assume that a function StoreUserData(Bookmark, Col,
' Value) takes a row bookmark, a column index, and a
' variant data value and stores the contents of the
' specified cell to the array or database.  The function
' returns True if the Update is successful, otherwise,
' it returns False.

    If Not StoreUserData(Bookmark, Col, Value) Then
        Bookmark = Null   ' Tell the grid the update failed.
    End If
End Sub

Private Sub TDBGrid1_ClassicAdd(NewRowBookmark As Variant, _
        ByVal Col As Integer, Value As Variant)
' ClassicAdd is fired when the user adds a new row
' of data through code or by typing in the AddNew row
' (the one with the asterisk in the record selector
' column.  It alerts your application that it must add
' a new row of data to its unbound dataset.  This event
' will NOT be fired if the grid's AllowAddNew property
' is set to False.

' Assume that a function StoreUserData(Bookmark, Col,
' Value) takes a row bookmark, a column index, and a
' variant with the appropriate data to be stored in an
' array or database.  The function returns True if the
' data is acceptable and can be stored, False otherwise.
        
    If IsNull(NewRowBookmark) Then
       ' First, get a bookmark for the new row.  Do this
       ' with a VB function, GetNewBookmark.  This
       ' function allocates a new row of data in the storage
       ' medium (array or database), and returns a variant
       ' containing a bookmark for the added row.
       NewRowBookmark = GetNewBookmark()
    End If
    
    ' Now store the new value.
    If Not StoreUserData(NewRowBookmark, Col, Value) Then
            ' Storage of the data has failed.  Delete the
            ' added row using a VB function, DeleteRow,
            ' which takes a bookmark as an argument.  Also,
            ' fail the update by setting NewRowBookmark to
            ' Null.
            DeleteRow NewRowBookmark
            NewRowBookmark = Null   'Tell the grid the
                                    ' update failed.
    End If
End Sub

Private Sub TDBGrid1_ClassicDelete(Bookmark As Variant)
' ClassicDelete is fired when the user deletes an
' existing row in the Unbound grid.  This event
' alerts the user that the program must delete the
' row specified by the Bookmark parameter from the
' dataset.  Here, an auxiliary function (DeleteRow)
' is used to do this.

    If Not DeleteRow(Bookmark) Then Bookmark = Null
End Sub

Private Function StoreUserData(Bookmark As Variant, _
        Col As Integer, Userval As Variant) As Boolean
' StoreUserData is called from UnboundWriteData to
' write the newly changed information in the grid
' to the array.  This function is called once for
' each field that needs to be stored.  The grid
' cell that this function is called to store is
' referenced in the same way as in GetUserData.

    Dim Index As Long
    
' Figure out which row the bookmark refers to
    Index = IndexFromBookmark(Bookmark, 0)
    
    If Index < 0 Or Index >= MaxRow Or Col < 0 Or _
       Col >= MaxCol Then
        ' Cell position is invalid, so just return null
        ' to indicate failure
        StoreUserData = False
    Else
        StoreUserData = True
        GridArray(Col, Index) = Userval
    End If
End Function

Private Function GetNewBookmark() As Variant
' GetNewBookmark is called when we need to create
' a bookmark for a newly added record (row).

' Reserve space for the new row in the array
    ReDim Preserve GridArray(0 To MaxCol - 1, 0 To MaxRow)
    
' Since the row index of the last record is
' (MaxRow - 1), the next available index for the row
' to be added is (MaxRow), so create a bookmark for
' the new row using MaxRow as an index.
    GetNewBookmark = MakeBookmark(MaxRow)
    
' Increment the number of rows in our dataset
    MaxRow = MaxRow + 1
    
' Calibrate the scroll bars based on the new dataset
' size.
    TDBGrid1.ApproxCount = MaxRow
End Function

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
            ' Bookmark refers to EOF.  Since (MaxRow - 1)
            ' is the index of the last record, we can use
            ' an index of (MaxRow) to represent EOF.
            Index = MaxRow + Offset
        Else
            ' Bookmark refers to BOF.  Since 0 is the index
            ' of the first record, we can use an index of
            ' -1 to represent BOF.
            Index = -1 + Offset
        End If
    Else
        ' Convert string to long integer
        Index = Val(Bookmark) + Offset
    End If
    
' Check to see if the row index is valid:
'  (0 <= Index < MaxRow).
' If not, set it to a large negative number to
' indicate that it is invalid.
    If Index >= 0 And Index < MaxRow Then
       IndexFromBookmark = Index
    Else
       IndexFromBookmark = -9999
    End If
End Function

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
    If Index < 0 Or Index >= MaxRow Then
        ' Index refers to a row before the first or
        ' after the last, so just return Null.
        GetRelativeBookmark = Null
    Else
        GetRelativeBookmark = MakeBookmark(Index)
    End If
End Function

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
    
    If Index < 0 Or Index >= MaxRow Or Col < 0 Or _
       Col >= MaxCol Then
        ' Cell position is invalid, so just return null
        ' to indicate failure
        GetUserData = Null
    Else
        GetUserData = GridArray(Col, Index)
    End If
End Function


