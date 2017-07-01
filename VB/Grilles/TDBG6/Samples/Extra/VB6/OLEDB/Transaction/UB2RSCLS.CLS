VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RsGridCls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private WithEvents TDBG As TrueOleDBGrid60.TDBGrid
Attribute TDBG.VB_VarHelpID = -1

Private RS As RecordSet
Private MaxCol As Integer
Private MaxRow As Long
Private Flds As DAO.Fields

Public Sub Attach(g As TrueOleDBGrid60.TDBGrid)
    Set TDBG = g
End Sub

' Instantiate a working Recordset, MaxRow, MaxCol
Public Property Let RecordSet(RecSet As DAO.RecordSet)
    Set RS = RecSet
    Set Flds = RecSet.Fields
    If Not (RS.EOF And RS.BOF) Then RS.MoveLast
    MaxRow = RS.RecordCount
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
Private Sub TDBG_UnboundAddData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, NewRowBookmark As Variant)
    Dim Col As Integer
    
    On Error GoTo NoAdd

    RS.AddNew
    ' Save values in modified columns
    For Col = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, Col)) Then
            Flds(Col).Value = RowBuf.Value(0, Col)
        Else
            'The database handles default values, but if we wanted
            'we could set our own here.
        End If
    Next Col
    RS.Update

    ' Return the bookmark for this row
    NewRowBookmark = RS.LastModified
    
    MaxRow = MaxRow + 1
    TDBG.ApproxCount = MaxRow
    Exit Sub
NoAdd:
    RowBuf.RowCount = 0
End Sub

' Fired when a row is deleted
Private Sub TDBG_UnboundDeleteRow(Bookmark As Variant)
    On Error GoTo NoDelete
    
    ' Position to the desired row and execute delete
    RS.Bookmark = Bookmark
    RS.Delete
    
    MaxRow = MaxRow - 1
    TDBG.ApproxCount = MaxRow
    Exit Sub
    
NoDelete:
    Bookmark = Null
End Sub

' Fired when the grid requests values OR a bookmark
Private Sub TDBG_UnboundReadDataEx(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, StartLocation As Variant, ByVal offset As Long, ApproximatePosition As Long)
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
            RS.MoveLast
            RS.MoveNext
        Else
            ' StartLocation refers to BOF
            RS.MoveFirst
            RS.MovePrevious
        End If
        RS.Move offset
    Else
        RS.Move offset, StartLocation
    End If
        
    ' StartRow is the bookmark of the first requested row
    StartRow = RS.Bookmark
    Dim Pos As Long
    Pos = RS.AbsolutePosition
    
    For Row = 0 To Rows
        ' If out of bounce quit this loop
        If RS.BOF Or RS.EOF Then Exit For
       
        ' Retrieve values
        For Col = 0 To Cols
            ColIndex = RowBuf.ColumnIndex(Row, Col)
            RowBuf.Value(Row, Col) = Flds(ColIndex).Value
        Next Col
        
        ' Assign a bookmark for currently fetched row
        RowBuf.Bookmark(Row) = RS.Bookmark
        
        RowsFetched = RowsFetched + 1
        RS.MoveNext
    Next Row
    
    RowBuf.RowCount = RowsFetched
    
    ' Callibrate VScroll bar
    If Pos >= 0 Then ApproximatePosition = Pos
    
    Exit Sub
NoRead:
    RowBuf.RowCount = 0
    If Err.Number = 3021 Then Resume Next
End Sub

' Fired when a row has been modified
Private Sub TDBG_UnboundWriteData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, WriteLocation As Variant)
    Dim Col As Integer
    
    On Error GoTo NoUpdate
    
    ' Position to the desired row
    RS.Bookmark = WriteLocation
    RS.Edit
    ' Write only modified columns
    For Col = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, Col)) Then
            Flds(Col).Value = RowBuf.Value(0, Col)
        End If
    Next Col
    RS.Update
    
    Exit Sub
NoUpdate:
    RowBuf.RowCount = 0
End Sub
