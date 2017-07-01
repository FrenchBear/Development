VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "RsGridCls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private WithEvents DBG As MSDBGrid.DBGrid
Attribute DBG.VB_VarHelpID = -1

Private RS As RecordSet
Private MaxCol As Integer
Private MaxRow As Long
Private Flds As DAO.Fields

Public Sub Attach(g As MSDBGrid.DBGrid)
    Set DBG = g
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
Private Sub DBG_UnboundAddData(ByVal RowBuf As MSDBGrid.RowBuffer, NewRowBookmark As Variant)
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
    DBG.ApproxCount = MaxRow
    Exit Sub
NoAdd:
    RowBuf.RowCount = 0
    MsgBox Err.Description
End Sub

' Fired when a row is deleted
Private Sub DBG_UnboundDeleteRow(Bookmark As Variant)
    On Error GoTo NoDelete
    
    ' Position to the desired row and execute delete
    RS.Bookmark = Bookmark
    RS.Delete
    
    MaxRow = MaxRow - 1
    DBG.ApproxCount = MaxRow
    Exit Sub
    
NoDelete:
    Bookmark = Null
    MsgBox Err.Description

End Sub

Private Sub DBG_UnboundGetRelativeBookmark(StartLocation As Variant, ByVal OffSet As Long, NewLocation As Variant, ApproximatePosition As Long)
    If IsNull(StartLocation) Then
        If OffSet < 0 Then
            ' StartLocation refers to EOF
            RS.MoveLast
            RS.MoveNext
        Else
            ' StartLocation refers to BOF
            RS.MoveFirst
            RS.MovePrevious
        End If
        RS.Move OffSet
    Else
        RS.Move OffSet, StartLocation
    End If
    
    If RS.EOF Or RS.BOF Then
        NewLocation = Null
    Else
        NewLocation = RS.Bookmark
        ApproximatePosition = RS.AbsolutePosition
    End If
End Sub

' Fired when the grid requests values
Private Sub DBG_UnboundReadData(ByVal RowBuf As MSDBGrid.RowBuffer, StartLocation As Variant, ByVal ReadPriorRows As Boolean)
    Dim RowsFetched As Integer      'track count of RowBuf rows set
    RowsFetched = 0
    
    On Error GoTo NoRead
    
    'Unfortunately, the VB DBGrid help is misleading, even though
    'the example is clear.
    '
    '  ReadPriorRows = True means the RowBuffer wants the rows
    '                  BEFORE the StartLocation.
    '
    'Therefore, we must move backward in the database when filling
    'the buffer.  We always move forward in the RowBuffer itself.

    If IsNull(StartLocation) Then
        If ReadPriorRows Then
            RS.MoveLast
            RS.MoveNext
        Else
            RS.MoveFirst
            RS.MovePrevious
        End If
    Else
        RS.Bookmark = StartLocation
    End If

    'use rowlimit and collimit as the number of rows and columns
    'requested by the row buffer
    
    Dim RowLimit As Integer, ColLimit As Integer   'row and column limits for loop
    RowLimit = RowBuf.RowCount - 1
    ColLimit = RowBuf.ColumnCount - 1
    
    Dim Row As Integer, Col As Integer         'row and column counters for RowBuf
    
    For Row = 0 To RowLimit
        
        If ReadPriorRows Then
            RS.MovePrevious
        Else
            RS.MoveNext
        End If
        
        'check to see if we are passed the Recordset end.
        If RS.EOF Or RS.BOF Then Exit For

        'fill in the RowBuffer columns from the field objects' array
        'using the default property of the field (Value).  Since our
        'RowBuffer values are variants, they can handle anything.

        For Col = 0 To ColLimit
            If Not IsNull(Flds(Col)) Then
                RowBuf.Value(Row, Col) = RS.Fields(Col).Value
            End If
            
        Next Col

        'give the current row bookmark to the rowbuffer.  The recordset
        'is kept in sync with the desired row throughout the event.
        RowBuf.Bookmark(Row) = RS.Bookmark
        
        RowsFetched = RowsFetched + 1       'track rows fetched

    Next Row
    
    'Tell the RowBuffer how many rows were fetched
    RowBuf.RowCount = RowsFetched
    Exit Sub
    
NoRead:
    RowBuf.RowCount = 0
    Debug.Print "NoRead!"
End Sub

' Fired when a row has been modified
Private Sub DBG_UnboundWriteData(ByVal RowBuf As MSDBGrid.RowBuffer, WriteLocation As Variant)
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
    MsgBox Err.Description
End Sub
