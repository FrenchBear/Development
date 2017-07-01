VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - DataMode 1 Tutorial"
   ClientHeight    =   3270
   ClientLeft      =   1245
   ClientTop       =   1575
   ClientWidth     =   6840
   LinkTopic       =   "Form1"
   ScaleHeight     =   3270
   ScaleWidth      =   6840
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   3015
      Left            =   120
      OleObjectBlob   =   "Tutor16.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   6615
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' General declarations
Option Explicit

' Special Note:  Variables that store Row indices will be
' of data type Long (It is reasonable to assume there may
' be larger than 32,767 rows).  Those storing Column
' indices will be of type Integer. (It is very unlikely
' there will be more than 32,767 columns.)

Dim MaxCol As Integer           ' Number of columns
Dim MaxRow As Long              ' Number of rows
Dim GridArray() As Variant      ' Array to store the data

Private Sub Form_Load()
' Initialize the data array.  Data must be ready
' before the grid is loaded.  Form_Load or Main is a
' good place to initialize the data.
    
    Dim I As Integer   ' column index
    Dim J As Long      ' row index
    Dim C As TrueOleDBGrid60.Column
    Dim Col2 As TrueOleDBGrid60.Column
    Dim Col3 As TrueOleDBGrid60.Column
    
' Use a 4 columns by 100 rows array as data source.
' Since user will be allowed to add data to the grid,
' the array may grow in size.

' This tutorial project assumes there are 3 columns in
' the grid for simplicity.  If you wish to change this
' number, you will need to modify the code below to
' add the correct number of columns.
    MaxCol = 4
    
' You can change MaxRow to show a different number of
' rows when the program loads.  MaxRow must be >= 0.
    MaxRow = 100
    
    If MaxRow > 0 Then
        ' If MaxRow = 0, then (MaxRow - 1) equals -1.  This
        ' causes an error in the statement below, so we
        ' handle this special case in the Else clause.
        ReDim GridArray(0 To MaxCol - 1, 0 To MaxRow - 1)
    Else
        ReDim GridArray(0 To MaxCol - 1, 0)
    End If
    
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

Private Sub TDBGrid1_UnboundReadData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, StartLocation As Variant, ByVal ReadPriorRows As Boolean)
' UnboundReadData is fired by an unbound grid whenever
' it requires data for display.  This event will fire
' when the grid is first shown, when Refresh or ReBind
' is used, when the grid is scrolled, and after a
' record in the grid is modified and the user commits
' the change by moving off of the current row.  The
' grid fetches data in "chunks", and the number of rows
' the grid is asking for is given by RowBuf.RowCount.

' RowBuf is the row buffer where you place the data and
' the bookmarks for the rows that the grid is requesting
' to display.  It will also hold the number of rows that
' were successfully supplied to the grid.

' StartLocation is a bookmark which specifies the row
' before or after the desired data, depending on the
' value of ReadPriorRows.  If we are reading rows after
' StartLocation (ReadPriorRows = False), then the first
' row of data the grid wants is the row after
' StartLocation, and if we are reading rows before
' StartLocation (ReadPriorRows = True) then the first
' row of data the grid wants is the row before
' StartLocation.

' ReadPriorRows is a boolean value indicating whether
' we are reading rows before (ReadPriorRows = True) or
' after (ReadPriorRows = False) StartLocation.

    Dim Bookmark As Variant
    Dim I As Long, RelPos As Long
    Dim J As Integer, RowsFetched As Integer
    
' Get a bookmark for the start location
    Bookmark = StartLocation
        
    If ReadPriorRows Then
        RelPos = -1 ' Requesting data in rows prior to
                    ' StartLocation
    Else
        RelPos = 1  ' Requesting data in rows after
                    ' StartLocation
    End If
    
    RowsFetched = 0
    For I = 0 To RowBuf.RowCount - 1
        ' Get the bookmark of the next available row
        Bookmark = GetRelativeBookmark(Bookmark, RelPos)
    
        ' If the next row is BOF or EOF, then stop
        ' fetching and return any rows fetched up to this
        ' point.
        If IsNull(Bookmark) Then Exit For
    
        ' Place the record data into the row buffer
        For J = 0 To RowBuf.ColumnCount - 1
            RowBuf.Value(I, J) = GetUserData(Bookmark, J)
        Next J
    
        ' Set the bookmark for the row
        RowBuf.Bookmark(I) = Bookmark
    
        ' Increment the count of fetched rows
        RowsFetched = RowsFetched + 1
    Next I
    
' Tell the grid how many rows we fetched
    RowBuf.RowCount = RowsFetched
End Sub

Private Sub TDBGrid1_UnboundGetRelativeBookmark( _
    StartLocation As Variant, ByVal Offset As Long, _
    NewLocation As Variant, ApproximatePosition As Long)
    
    Dim Index As Long
    
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
    If IsNull(StartLocation) Then
        If Offset < 0 Then
            ' The row to position to is before the current
            ' one, therefore we must be at EOF (There are
            ' no rows before BOF).  Since (MaxRow-1) is
            ' the index of the last record, we can use an
            ' index of (MaxRow) to represent EOF.
            Index = MaxRow + Offset
        Else
            ' The row to position to is after the current
            ' one, therefore we must be at BOF (There are
            ' no rows after EOF).  Since 0 is the index of
            ' the first record, we can use an index of -1
            ' to represent BOF.
            Index = -1 + Offset
        End If
    Else
        ' We are not at BOF or EOF, so just get the index
        ' of the current row and add the offset to it.
        Index = Val(StartLocation) + Offset
    End If
    
' Is the new Index valid?
    If Index >= 0 And Index < MaxRow Then
       ' Here, 0 <= Index < MaxRow, so the new location is
       ' valid.
       ApproximatePosition = Index
       NewLocation = MakeBookmark(Index)
    Else
       ' The new index is out-of-bounds -- the new location
       ' refers to a position before the first record or
       ' after the last one.  Thus the index is invalid,
       ' and we return Null.
       NewLocation = Null
    End If
End Sub

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
        ReadPriorRows As Boolean) As Long

' This support function is used only by the remaining
' support functions.  It is not used directly by the
' unbound events.
    
' This function is the inverse of MakeBookmark.  Given
' a bookmark, IndexFromBookmark returns the row index
' that the given bookmark refers to.  If the given
' bookmark is Null, then it refers to BOF or EOF.  In
' such a case, we need to use ReadPriorRows to
' distinguish between the two.  If ReadPriorRows = True,
' the grid is requesting rows before the current
' location, so we must be at EOF, because no rows exist
' before BOF.  Conversely, if ReadPriorRows = False,
' we must be at BOF.
    
    Dim Index As Long
      
    If IsNull(Bookmark) Then
        If ReadPriorRows Then
            ' Bookmark refers to EOF.  Since (MaxRow - 1)
            ' is the index of the last record, we can use
            ' an index of (MaxRow) to represent EOF.
            IndexFromBookmark = MaxRow
        Else
            ' Bookmark refers to BOF.  Since 0 is the
            ' index of the first record, we can use an
            ' index of -1 to represent BOF.
            IndexFromBookmark = -1
        End If
    Else
        ' Convert string to long integer
        Index = Val(Bookmark)
        
        ' Check to see if the row index is valid:
        '  (0 <= Index < MaxRow).
        ' If not, set it to a large negative number to
        ' indicate that the bookmark is invalid.
        If Index < 0 Or Index >= MaxRow Then Index = -9999
        IndexFromBookmark = Index
    End If
End Function

Private Function GetRelativeBookmark(Bookmark As Variant, _
        RelPos As Long) As Variant
' GetRelativeBookmark is used to get a bookmark for a
' row that is a given number of rows away from the given
' row.  This specific example will always use either -1
' or +1 for a relative position, since we will always be
' retrieving either the row previous to the current one,
' or the row following the current one.

' IndexFromBookmark expects a Bookmark and a Boolean
' value: this Boolean value is True if the next row to
' read is before the current one [in this case,
' (RelPos < 0) is True], or False if the next row to
' read is after the current one [(RelPos < 0) is False].
' This is necessary to distinguish between BOF and EOF
' in the IndexFromBookmark function if our bookmark is
' Null.  Once we get the correct row index from
' IndexFromBookmark, we simply add RelPos to it to get
' the desired row index and create a bookmark using
' that index.

    Dim Index As Long
    
    Index = IndexFromBookmark(Bookmark, RelPos < 0) + RelPos
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
    Index = IndexFromBookmark(Bookmark, False)
    
    If Index < 0 Or Index >= MaxRow Or _
       Col < 0 Or Col >= MaxCol Then
        ' Cell position is invalid, so just return null
        ' to indicate failure
        GetUserData = Null
    Else
        GetUserData = GridArray(Col, Index)
    End If
End Function

