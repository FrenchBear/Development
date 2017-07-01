VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "rdoClass"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private WithEvents TDBG As TrueDBGrid60.TDBGrid
Attribute TDBG.VB_VarHelpID = -1

Private rdoRS As rdoResultset
Private MaxCol As Integer
Private MaxRow As Long
Private Flds As rdoColumns

Public Sub Attach(g As TrueDBGrid60.TDBGrid)
    Set TDBG = g
End Sub

' Instantiate a working rdoResultset, MaxRow, MaxCol
Public Property Let ResultSet(ResSet As rdoResultset)
    Set rdoRS = ResSet
    Set Flds = ResSet.rdoColumns
    If Not (rdoRS.BOF And rdoRS.EOF) Then rdoRS.MoveLast
    MaxRow = rdoRS.RowCount
    MaxCol = Flds.Count
End Property

' Returns number of rows
Public Property Get RowCount() As Long
    RowCount = MaxRow
End Property

' Returns number of columns
Public Property Get ColCount() As Integer
    ColCount = MaxCol
End Property

' Fired upon adding a new row to the grid
Private Sub TDBG_UnboundAddData(ByVal RowBuf As TrueDBGrid60.RowBuffer, NewRowBookmark As Variant)
    Dim Col As Integer
    
    On Error GoTo NoAdd

    rdoRS.AddNew
    ' Save values in modified columns
    For Col = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, Col)) Then
            Flds(Col).Value = RowBuf.Value(0, Col)
        Else
            'The database handles default values, but if we wanted
            'we could set our own here.
        End If
    Next Col
    rdoRS.Update

    ' Return the bookmark for this row
    NewRowBookmark = rdoRS.LastModified
    
    MaxRow = MaxRow + 1
    TDBG.ApproxCount = MaxRow
    Exit Sub
NoAdd:
    RowBuf.RowCount = 0
    MsgBox Err.Number & vbCrLf & Err.Description
End Sub

' Fired when a row is deleted
Private Sub TDBG_UnboundDeleteRow(Bookmark As Variant)
    On Error GoTo NoDelete
    
    ' Position to the desired row and execute delete
    rdoRS.Bookmark = Bookmark
    rdoRS.Delete
    
    MaxRow = MaxRow - 1
    TDBG.ApproxCount = MaxRow
    Exit Sub
    
NoDelete:
    Bookmark = Null
    MsgBox Err.Number & vbCrLf & Err.Description
End Sub

' Fired when the grid requests values OR a bookmark
Private Sub TDBG_UnboundReadDataEx(ByVal RowBuf As TrueDBGrid60.RowBuffer, StartLocation As Variant, ByVal offset As Long, ApproximatePosition As Long)
    Dim ColIndex As Integer, Col As Integer
    Dim RowsFetched As Integer, Row As Long
    Dim StartRow As Variant
    
    Dim Cols As Long
    Dim Rows As Long
    Cols = RowBuf.ColumnCount - 1
    Rows = RowBuf.RowCount - 1
    
    RowsFetched = 0
    
    On Error GoTo NoRead
    If IsNull(StartLocation) Then
        If offset < 0 Then
            ' StartLocation refers to EOF
            rdoRS.MoveLast
            rdoRS.MoveNext
        Else
            ' StartLocation refers to BOF
            rdoRS.MoveFirst
            rdoRS.MovePrevious
        End If
        rdoRS.Move offset
    Else
        rdoRS.Move offset, StartLocation
    End If
        
    ' StartRow is the bookmark of the first requested row
    StartRow = rdoRS.Bookmark
    Dim Pos As Long
    Pos = rdoRS.AbsolutePosition
    
    For Row = 0 To Rows
        ' If out of bounce quit this loop
        If rdoRS.BOF Or rdoRS.EOF Then Exit For
       
        ' Retrieve values
        For Col = 0 To Cols
            ColIndex = RowBuf.ColumnIndex(Row, Col)
            RowBuf.Value(Row, Col) = Flds(ColIndex).Value
        Next Col
        
        ' Assign a bookmark for currently fetched row
        RowBuf.Bookmark(Row) = rdoRS.Bookmark
        
        RowsFetched = RowsFetched + 1
        rdoRS.MoveNext
    Next Row
    
    RowBuf.RowCount = RowsFetched
    
    ' Callibrate VScroll bar
    If Pos >= 0 Then ApproximatePosition = Pos
    
    Exit Sub
NoRead:
    RowBuf.RowCount = 0
    If Err.Number = 40022 Then Resume Next
End Sub

' Fired when a row has been modified
Private Sub TDBG_UnboundWriteData(ByVal RowBuf As TrueDBGrid60.RowBuffer, WriteLocation As Variant)
    Dim Col As Integer
    
    On Error GoTo NoUpdate
    
    ' Position to the desired row
    rdoRS.Bookmark = WriteLocation
    rdoRS.Edit
    ' Write only modified columns
    For Col = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, Col)) Then
            Flds(Col).Value = RowBuf.Value(0, Col)
        End If
    Next Col
    rdoRS.Update
    
    Exit Sub
NoUpdate:
    RowBuf.RowCount = 0
    MsgBox Err.Number & vbCrLf & Err.Description
End Sub
