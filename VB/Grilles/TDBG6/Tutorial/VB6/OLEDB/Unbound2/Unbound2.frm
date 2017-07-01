VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TOBG.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - DataMode 2 Tutorial"
   ClientHeight    =   3285
   ClientLeft      =   1245
   ClientTop       =   1605
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   ScaleHeight     =   3285
   ScaleWidth      =   6585
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   3015
      Left            =   120
      OleObjectBlob   =   "Unbound2.frx":0000
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

' Use a 4 columns by 100 rows array as data source,
Dim MaxCol As Integer           ' Number of columns
Dim MaxRow As Long              ' Number of rows

Dim GridArray() As Variant

Private Sub Form_Load()
' Initialize the data array.  Data must be ready
' before the grid is loaded.  Form_Load or Main is a
' good place to initialize the data.
    MaxCol = 4
    MaxRow = 100
    
    Dim C As TrueOleDBGrid60.Column
    Dim Col2 As TrueOleDBGrid60.Column
    Dim Col3 As TrueOleDBGrid60.Column

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


Private Sub TDBGrid1_UnboundReadDataEx(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, StartLocation As Variant, ByVal Offset As Long, ApproximatePosition As Long)
' UnboundReadData is fired by an unbound grid whenever
' it requires data for display.  This event will fire
' when the grid is first shown, when Refresh or ReBind
' is used, when the grid is scrolled, and after a
' record in the grid is modified and the user commits
' the change by moving off of the current row.  The
' grid fetches data in "chunks", and the number of rows
' the grid is asking for is given by RowBuf.RowCount.

' RowBuf is the row buffer where you place the data
' the bookmarks for the rows that the grid is
' requesting to display.  It will also hold the number
' of rows that were successfully supplied to the grid.

' StartLocation is a bookmark which, together with
' Offset, specifies the row for the programmer to start
' transferring data.  A StartLocation of Null indicates
' a request for data from BOF or EOF.

' Offset specifies the relative position (from
' StartLocation) of the row for the programmer to start
' transferring data.  A positive number indicates a
' forward relative position while a negative number
' indicates a backward relative position.  Regardless
' of whether the rows to be read are before or after
' StartLocation, rows are always fetched going forward
' (this is why there is no ReadPriorRows parameter to
' the procedure).

' If you page down on the grid, for instance, the new
' top row of the grid will have an index greater than
' the StartLocation (Offset > 0).  If you page up on
' the grid, the new index is less than that of
' StartLocation, so Offset < 0.  If StartLocation is
' a bookmark to row N, the grid always asks for row
' data in the following order:
'   (N + Offset), (N + Offset + 1), (N + Offset + 2)...

' ApproximatePosition is a value you can set to indicate
' the ordinal position of (StartLocation + Offset).
' Setting this variable will enhance the ability of the
' grid to display its vertical scroll bar accurately.
' If the exact ordinal position of the new location is
' not known, you can set it to a reasonable,
' approximate value, or just ignore this parameter.
    
    Dim ColIndex As Integer, J As Integer
    Dim RowsFetched As Integer, I As Long
    Dim NewPosition As Long, Bookmark As Variant

    RowsFetched = 0
    
    For I = 0 To RowBuf.RowCount - 1
        ' Get the bookmark of the next available row
        Bookmark = GetRelativeBookmark(StartLocation, _
                   Offset + I)
    
        ' If the next row is BOF or EOF, then stop fetching
        ' and return any rows fetched up to this point.
        If IsNull(Bookmark) Then Exit For
    
        ' Place the record data into the row buffer
        For J = 0 To RowBuf.ColumnCount - 1
            ColIndex = RowBuf.ColumnIndex(I, J)
            RowBuf.Value(I, J) = GetUserData(Bookmark, _
                                 ColIndex)
        Next J
    
        ' Set the bookmark for the row
        RowBuf.Bookmark(I) = Bookmark
    
        ' Increment the count of fetched rows
        RowsFetched = RowsFetched + 1
    Next I
    
' Tell the grid how many rows were fetched
    RowBuf.RowCount = RowsFetched
    
' Set the approximate scroll bar position.  Only
' nonnegative values of IndexFromBookmark() are valid.
    NewPosition = IndexFromBookmark(StartLocation, Offset)
    If NewPosition >= 0 Then _
       ApproximatePosition = NewPosition
End Sub

Private Function StoreUserData(Bookmark As Variant, _
        Col As Integer, Userval As Variant) As Boolean
' StoreUserData is called from UnboundWriteData to
' write the newly changed information in the grid to
' the array.  This function is called once for each
' field that needs to be stored.  The grid cell that
' this function is called to store is referenced in
' the same way as in GetUserData.

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

Private Function DeleteRow(Bookmark As Variant) As Boolean
' DeleteRow is called to logically delete a record
' (row) from the array.  The row to be deleted is
' given by the Bookmark parameter.

    Dim I As Long, Index As Long
    Dim J As Integer

' Figure out which row index the bookmark refers to
    Index = IndexFromBookmark(Bookmark, 0)
    
    If Index < 0 Or Index >= MaxRow Then
        ' Row index is invalid, so exit the delete,
        ' indicating failure.
        DeleteRow = False
        Exit Function
    End If
    
' Decrement the number of rows in the dataset
    MaxRow = MaxRow - 1
    
' Shift the data in the array to fill the empty space
' vacated by the deleted row
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

Private Sub TDBGrid1_UnboundWriteData( ByVal RowBuf As TrueOleDBGrid60.RowBuffer, WriteLocation As Variant)
' UnboundWriteData event is fired when the user
' modifies an existing row within an unbound grid and
' attempts to commit the changes by moving to another
' row or calling the Update method of the grid.  This
' notifies the program that data has changed in the
' grid and it needs to be stored in the data source.

' RowBuf is the row buffer from which you retrieve the
' data to be stored in the data source.  Since only
' one row can be updated at a time, RowBuf.RowCount
' always equals 1.  If a particular column in the row
' has not been changed, its element in the RowBuf.Value
' array will be null.

' WriteLocation is a bookmark that identifies the row
' to be updated.

' Assume that a function StoreUserData(bookmark, col,
' value) takes a row bookmark, a column index, and a
' variant with the appropriate data to be stored in
' an array or database.  The function returns True if
' the data is acceptable and can be stored, False
' otherwise.
    
    Dim I As Integer
    
' Loop over all the columns of the row, storing
' non-Null values
    For I = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, I)) Then
            If Not StoreUserData(WriteLocation, I, _
               RowBuf.Value(0, I)) Then
                RowBuf.RowCount = 0 ' Tell the grid the
                                    ' update failed, so
            End If                  ' exit the event.
        End If
    Next I
End Sub

Private Sub TDBGrid1_UnboundAddData( ByVal RowBuf As TrueOleDBGrid60.RowBuffer, NewRowBookmark As Variant)
' UnboundAddData is fired when the user adds a new
' row of data to an unbound grid to alert your
' application that it must add a new row of data to
' its unbound dataset.  This event will NOT be fired
' if the grid's AllowAddNew property is set to False.

' Assume that a function StoreUserData(bookmark, col,
' value) takes a row bookmark, a column index, and a
' variant with the appropriate data to be stored in an
' array or database.  The function returns True if the
' data is acceptable and can be stored, False otherwise.

' First, get a bookmark for the new row.  Do this with
' a function, GetNewBookmark.  This function allocates
' a new row of data in the storage medium (array or
' database), and returns a variant containing a
' bookmark for the added row.
        
    Dim NewVal As Variant
    Dim I As Integer
    
' Create a new row in the array and get a bookmark for
' the new row
    NewRowBookmark = GetNewBookmark()

' Loop over all the columns of the row, storing
' non-Null values
    For I = 0 To RowBuf.ColumnCount - 1
        ' Note that since only one row of data may be
        ' added at a time, the first index of the row
        ' buffer Value array is always 0.
        NewVal = RowBuf.Value(0, I)
        If IsNull(NewVal) Then
            ' The row buffer does not contain a value for
            ' this column.  A default value should be set.
            ' A convenient value is the default value for
            ' the column.
            NewVal = TDBGrid1.Columns(I).DefaultValue
        End If
    
        ' Now store the new values.
        If Not StoreUserData(NewRowBookmark, I, NewVal) Then
            ' Storage of the data has failed.  Delete the
            ' added row using a function, DeleteRow, which
            ' takes a bookmark as an argument.  Also,
            ' indicate that the update has failed by setting
            ' RowCount to 0.
            DeleteRow NewRowBookmark
            RowBuf.RowCount = 0
            Exit Sub          ' It failed, so exit the event.
        End If
    Next I
End Sub

Private Sub TDBGrid1_UnboundDeleteRow(Bookmark As Variant)
' UnboundDeleteRow is fired when the user deletes an
' existing row in the Unbound grid.  This event alerts
' the user that the program must delete the row
' specified by the Bookmark parameter from the dataset.
' Here, an auxiliary function (DeleteRow) is used to do
' this.

    If Not DeleteRow(Bookmark) Then Bookmark = Null
End Sub

Private Function GetNewBookmark() As Variant
' GetNewBookmark is called when we need to create a
' bookmark for a newly added record (row).

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

Private Function MakeBookmark(Index As Long) As Variant
' This support function is used only by the remaining
' support functions.  It is not used directly by the
' unbound events.  It is a good idea to create a
' MakeBookmark function such that all bookmarks can be
' created in the same way.  Thus the method by which
' bookmarks are created is consistent and easy to
' modify.  This function creates a bookmark when given
' an array row index.

' Since we have data stored in an array, we will just
' use the array index as our bookmark.  We will convert
' it to a string first, using the CStr function.
     
    MakeBookmark = CStr(Index)
End Function
Private Function IndexFromBookmark(Bookmark As Variant, _
        Offset As Long) As Long
' This support function is used only by the remaining
' support functions.  It is not used directly by the
' unbound events.

' IndexFromBookmark computes the row index that
' corresponds to a row that is (Offset) rows from the
' row specified by the Bookmark parameter.  For example,
' if Bookmark refers to the index 50 of the dataset
' array and Offset = -10, then IndexFromBookmark will
' return 50 + (-10), or 40.  Thus to get the index of
' the row specified by the bookmark itself, call
' IndexFromBookmark with an Offset of 0.  If the given
' Bookmark is Null, it refers to BOF or EOF.  If
' Offset < 0, the grid is requesting rows before the
' row specified by Bookmark, and so we must be at EOF
' because prior rows do not exist for BOF.  Conversely,
' if Offset > 0, we are at BOF.
    
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
'   (0 <= Index < MaxRow).
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
' GetRelativeBookmark is used to get a bookmark for a
' row that is a specified number of rows away from the
' given row.  Offset specifies the number of rows to
' move.  A positive Offset indicates that the desired
' row is after the one referred to by Bookmark, and a
' negative Offset means it is before the one referred
' to by Bookmark.
    
    Dim Index As Long
    
' Compute the row index for the desired row
    Index = IndexFromBookmark(Bookmark, Offset)
    If Index < 0 Or Index >= MaxRow Then
        ' Index refers to a row before the first or after
        ' the last, so just return Null.
        GetRelativeBookmark = Null
    Else
        GetRelativeBookmark = MakeBookmark(Index)
    End If
End Function

Private Function GetUserData(Bookmark As Variant, _
        Col As Integer) As Variant
' In this example, GetUserData is called by
' UnboundReadData to ask the user what data should be
' displayed in a specific cell in the grid.  The grid
' row the cell is in is the one referred to by the
' Bookmark parameter, and the column it is in it given
' by the Col parameter.  GetUserData is called on a
' cell-by-cell basis.
    
    Dim Index As Long
        
' Figure out which row the bookmark refers to
    Index = IndexFromBookmark(Bookmark, 0)
    
    If Index < 0 Or Index >= MaxRow Or _
       Col < 0 Or Col >= MaxCol Then
        ' Cell position is invalid, so just return null to
        ' indicate failure
        GetUserData = Null
    Else
        GetUserData = GridArray(Col, Index)
    End If
End Function


