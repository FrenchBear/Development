VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Ub2GridCls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private WithEvents TDBG As TrueDBGrid60.TDBGrid
Attribute TDBG.VB_VarHelpID = -1
Private GridArray() As Variant
Private MaxCol As Integer
Private MaxRow As Long

Public Sub Attach(g As TrueDBGrid60.TDBGrid)
    Set TDBG = g
End Sub

' Returns number of rows
Public Property Get RowCount()
    RowCount = MaxRow
End Property

' Returns number of columns
Public Property Get ColCount()
    ColCount = MaxCol
End Property

' Retrieves value from our array
Public Property Get Value(ByVal Rows As Long, ByVal Cols As Integer)
    Value = GridArray(Cols, Rows)
End Property

' Sets value from array
Public Property Let Value(ByVal Rows As Long, ByVal Cols As Integer, ByVal Val As Variant)
    GridArray(Cols, Rows) = Val
End Property

' Initialises array
Public Sub SetDims(ByVal Rows As Long, ByVal Cols As Integer)
    If Rows <= 0 And Cols > 0 Then
        ReDim GridArray(0 To Cols - 1, 0)
    ElseIf Rows <= 0 And Cols <= 0 Then
        ReDim GridArray(0, 0)
    ElseIf Rows > 0 And Cols <= 0 Then
        ReDim GridArray(0, 0 To Rows - 1)
    Else
        ReDim GridArray(0 To Cols - 1, 0 To Rows - 1)
    End If
    
    MaxRow = Rows
    MaxCol = Cols
End Sub

' Fired when a new record is added
Private Sub TDBG_UnboundAddData(ByVal RowBuf As TrueDBGrid60.RowBuffer, NewRowBookmark As Variant)
    Dim col As Integer
    
    On Error GoTo NoAdd
    
    ' Add one row
    MaxRow = MaxRow + 1
    ReDim Preserve GridArray(0 To MaxCol - 1, 0 To MaxRow - 1)
    
    ' Cells that have been modified are non Null
    For col = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, col)) Then
            GridArray(col, MaxRow - 1) = RowBuf.Value(0, col)
        Else
            ' Fill in a default value
            GridArray(col, MaxRow - 1) = TDBG.Columns(col).DefaultValue
        End If
    Next col
    
    ' Return the bookmark for this row
    NewRowBookmark = MaxRow - 1
    
    ' Calibrate the VScroll bar
    TDBG.ApproxCount = MaxRow
    
    Exit Sub
NoAdd:
    RowBuf.RowCount = 0
End Sub

' Fired upon deleting a row
Private Sub TDBG_UnboundDeleteRow(Bookmark As Variant)
    Dim row As Long, col As Integer
        
    On Error GoTo NoDelete
    MaxRow = MaxRow - 1
    
    ' Shift all rows up by one
    For row = Bookmark To MaxRow - 1
        For col = 0 To MaxCol - 1
            GridArray(col, row) = GridArray(col, row + 1)
        Next col
    Next row
    
    ' Resize the array
    If MaxRow > 0 Then
        ReDim Preserve GridArray(0 To MaxCol - 1, 0 To MaxRow - 1)
    Else
        ReDim Preserve GridArray(0 To MaxCol - 1, 0)
    End If
    
    ' Calibrate the VSCroll bar
    TDBG.ApproxCount = MaxRow
    Exit Sub

NoDelete:
    Bookmark = Null
End Sub

' Fired when the grid needs a bookmark or data
Private Sub TDBG_UnboundReadDataEx(ByVal RowBuf As TrueDBGrid60.RowBuffer, StartLocation As Variant, ByVal offset As Long, ApproximatePosition As Long)
    Dim ColIndex As Integer, J As Integer
    Dim RowsFetched As Integer, I As Long
    Dim NewPosition As Long, Bookmark As Long
    Dim StartRow As Long
    
    Dim Cols As Long, Rows As Long
    Cols = RowBuf.ColumnCount - 1
    Rows = RowBuf.RowCount - 1
    
    RowsFetched = 0
    
    If IsNull(StartLocation) Then
        ' StartLocation reffers to either BOF (-1) or EOF (MaxRow)
        StartRow = IIf(offset < 0, MaxRow + offset, -1 + offset)
    Else
        ' StartLocation is an actual bookmark
        StartRow = StartLocation + offset
    End If
    
    For I = 0 To Rows
        Bookmark = StartRow + I
        ' If we are out of bounds quit this loop
        If Bookmark < 0 Or Bookmark >= MaxRow Then Exit For
               
        ' Fill the RowBuffer with data
        For J = 0 To Cols
            ColIndex = RowBuf.ColumnIndex(I, J)
            RowBuf.Value(I, J) = GridArray(ColIndex, Bookmark)
        Next J
        
        ' Assign a bookmark for this row
        RowBuf.Bookmark(I) = Bookmark
        ' Increment number of rows fetched
        RowsFetched = RowsFetched + 1
    Next I
    
    RowBuf.RowCount = RowsFetched
    
    ' Callibrate the VScroll bar
    If StartRow >= 0 Then ApproximatePosition = StartRow
End Sub

' Fired when the user modifies an existing row
Private Sub TDBG_UnboundWriteData(ByVal RowBuf As TrueDBGrid60.RowBuffer, WriteLocation As Variant)
    Dim col As Integer
    
    On Error GoTo NoWrite
    
    ' Write modified cells
    For col = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, col)) Then
            GridArray(col, WriteLocation) = RowBuf.Value(0, col)
        End If
    Next col
    
    Exit Sub
NoWrite:
    RowBuf.RowCount = 0
End Sub
