VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ADOCls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private WithEvents TDBG As TrueDBGrid60.TDBGrid
Attribute TDBG.VB_VarHelpID = -1

Private rs As ADODB.RecordSet
Private MaxCol As Integer
Private MaxRow As Long
Private Flds As ADODB.Fields

Public Sub Attach(g As TrueDBGrid60.TDBGrid)
    Set TDBG = g
End Sub

' Instantiate a working Recordset, MaxRow, MaxCol
Public Property Let RecordSet(RecSet As ADODB.RecordSet)
    Set rs = RecSet
    Set Flds = RecSet.Fields
    If Not (rs.EOF And rs.BOF) Then rs.MoveLast
    MaxRow = rs.RecordCount
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
            rs.MoveLast
            rs.MoveNext
        Else
            ' StartLocation refers to BOF
            rs.MoveFirst
            rs.MovePrevious
        End If
        rs.Move offset
    Else
        rs.Move offset, StartLocation
    End If
        
    ' StartRow is the bookmark of the first requested row
    StartRow = rs.Bookmark
    Dim Pos As Long
    Pos = rs.AbsolutePosition
    
    For Row = 0 To Rows
        ' If out of bounce quit this loop
        If rs.BOF Or rs.EOF Then Exit For
       
        ' Retrieve values
        For Col = 0 To Cols
            ColIndex = RowBuf.ColumnIndex(Row, Col)
            RowBuf.Value(Row, Col) = Flds(ColIndex).Value
        Next Col
        
        ' Assign a bookmark for currently fetched row
        RowBuf.Bookmark(Row) = rs.Bookmark
        
        RowsFetched = RowsFetched + 1
        rs.MoveNext
    Next Row
    
    RowBuf.RowCount = RowsFetched
    
    ' Callibrate VScroll bar
    If Pos >= 0 Then ApproximatePosition = Pos
    
    Exit Sub
NoRead:
    RowBuf.RowCount = 0
    If Err.Number = 3021 Then Resume Next
End Sub

' Fired upon adding a new row to the grid
Private Sub TDBG_UnboundAddData(ByVal RowBuf As TrueDBGrid60.RowBuffer, NewRowBookmark As Variant)
    Dim Col As Integer
    
    On Error GoTo NoAdd

    rs.AddNew
    ' Save values in modified columns
    For Col = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, Col)) Then
            Flds(Col).Value = RowBuf.Value(0, Col)
        Else
            'The database handles default values, but if we wanted
            'we could set our own here.
        End If
    Next Col
    rs.Update

    ' Return the bookmark for this row
    NewRowBookmark = rs.Bookmark
    
    MaxRow = MaxRow + 1
    TDBG.ApproxCount = MaxRow
    Exit Sub
NoAdd:
    RowBuf.RowCount = 0
End Sub

' Fired when a row has been modified
Private Sub TDBG_UnboundWriteData(ByVal RowBuf As TrueDBGrid60.RowBuffer, WriteLocation As Variant)
    Dim Col As Integer
    
    On Error GoTo NoUpdate
    
    ' Position to the desired row
    rs.Bookmark = WriteLocation
    
    ' Write only modified columns
    For Col = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, Col)) Then
            Flds(Col).Value = RowBuf.Value(0, Col)
        End If
    Next Col
    rs.Update
    
    Exit Sub
NoUpdate:
    RowBuf.RowCount = 0
End Sub

' Fired when a row is deleted
Private Sub TDBG_UnboundDeleteRow(Bookmark As Variant)
    On Error GoTo NoDelete
    
    ' Position to the desired row and execute delete
    rs.Bookmark = Bookmark
    rs.Delete
    
    MaxRow = MaxRow - 1
    TDBG.ApproxCount = MaxRow
    Exit Sub
    
NoDelete:
    Bookmark = Null
End Sub

