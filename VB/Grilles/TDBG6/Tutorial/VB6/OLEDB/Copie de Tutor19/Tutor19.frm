VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - DataMode 4 Tutorial"
   ClientHeight    =   8415
   ClientLeft      =   1455
   ClientTop       =   1755
   ClientWidth     =   7065
   LinkTopic       =   "Form1"
   ScaleHeight     =   8415
   ScaleWidth      =   7065
   Begin VB.ListBox lstTrace 
      Height          =   3960
      Left            =   240
      TabIndex        =   1
      Top             =   4320
      Width           =   3195
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   3975
      Left            =   240
      OleObjectBlob   =   "Tutor19.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   6675
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' General declarations
Option Explicit

Dim X As New XArrayDB

Private Sub Form_Load()
' Allocate space for 100 rows, 4 columns
    X.ReDim 0, 99, 0, 3

    Dim row As Long, Col As Integer

' The LowerBound and UpperBound properties correspond
' to the LBound and UBound functions in Visual Basic.
' Hard-coded dimensions can be used instead, if known.
    For row = X.LowerBound(1) To X.UpperBound(1)
        For Col = X.LowerBound(2) To X.UpperBound(2)
            X(row, Col) = "Row " & row & ", Col " & Col
        Next Col
    Next row

' Bind True DBGrid Control to this XArray instance
    Set TDBGrid1.Array = X
End Sub


Private Sub Trace(sMsg As String)
  lstTrace.AddItem sMsg
  lstTrace.ListIndex = lstTrace.ListCount - 1
End Sub


Private Sub TDBGrid1_AfterColEdit(ByVal ColIndex As Integer)
  Trace "AfterColEdit"
End Sub

Private Sub TDBGrid1_AfterColUpdate(ByVal ColIndex As Integer)
  Trace "AfterColUpdate"
End Sub

Private Sub TDBGrid1_AfterDelete()
  Trace "AfterDelete"
End Sub

Private Sub TDBGrid1_AfterInsert()
  Trace "AfterInsert"
End Sub

Private Sub TDBGrid1_AfterUpdate()
  Trace "AfterUpdate"
End Sub

Private Sub TDBGrid1_BeforeColEdit(ByVal ColIndex As Integer, ByVal KeyAscii As Integer, Cancel As Integer)
  Trace "BeforeColEdit"
End Sub

Private Sub TDBGrid1_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
  Trace "BeforeColUpdate"
End Sub

Private Sub TDBGrid1_BeforeDelete(Cancel As Integer)
  Trace "BeforeDelete"
End Sub

Private Sub TDBGrid1_BeforeInsert(Cancel As Integer)
  Trace "BeforeInsert"
End Sub

Private Sub TDBGrid1_BeforeRowColChange(Cancel As Integer)
  Trace "BeforeRowColChange"
End Sub

Private Sub TDBGrid1_BeforeUpdate(Cancel As Integer)
  Trace "BeforeUpdate"
  
  Trace "A valider: (" & X(TDBGrid1.row, 0) & ") (" & X(TDBGrid1.row, 1) & ")"
End Sub

Private Sub TDBGrid1_ButtonClick(ByVal ColIndex As Integer)
  Trace "ButtonClick"
End Sub

Private Sub TDBGrid1_Change()
  Trace "Change"
End Sub

Private Sub TDBGrid1_ClassicAdd(NewRowBookmark As Variant, ByVal Col As Integer, Value As Variant)
  Trace "ClassicAdd"
End Sub

Private Sub TDBGrid1_ClassicDelete(Bookmark As Variant)
  Trace "ClassicDelete"
End Sub

Private Sub TDBGrid1_ClassicRead(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
  Trace "ClassicRead"
End Sub

Private Sub TDBGrid1_ClassicWrite(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
  Trace "ClassicWrite"
End Sub

Private Sub TDBGrid1_Click()
  Trace "Click"
End Sub

Private Sub TDBGrid1_ColEdit(ByVal ColIndex As Integer)
  Trace "ColEdit"
End Sub

Private Sub TDBGrid1_Collapse(ByVal Band As Integer, Cancel As Integer)
  Trace "Collapse"
End Sub

Private Sub TDBGrid1_ColMove(ByVal Position As Integer, Cancel As Integer)
  Trace "ColMove"
End Sub

Private Sub TDBGrid1_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
  Trace "ColResize"
End Sub

Private Sub TDBGrid1_ComboSelect(ByVal ColIndex As Integer)
  Trace "ComboSelect"
End Sub

Private Sub TDBGrid1_DataSourceChanged()
  Trace "DataSourceChanged"
End Sub

Private Sub TDBGrid1_DblClick()
  Trace "DblClick"
End Sub

Private Sub TDBGrid1_DragCell(ByVal SplitIndex As Integer, RowBookmark As Variant, ByVal ColIndex As Integer)
  Trace "DragCell"
End Sub

Private Sub TDBGrid1_DragDrop(Source As Control, X As Single, Y As Single)
  Trace "DragDrop"
End Sub

Private Sub TDBGrid1_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  Trace "DragOver"
End Sub

Private Sub TDBGrid1_Error(ByVal DataError As Integer, Response As Integer)
  Trace "Error"
End Sub

Private Sub TDBGrid1_Expand(ByVal Band As Integer, Cancel As Integer)
  Trace "Expand"
End Sub

Private Sub TDBGrid1_FetchCellStyle(ByVal Condition As Integer, ByVal Split As Integer, Bookmark As Variant, ByVal Col As Integer, ByVal CellStyle As TrueOleDBGrid60.StyleDisp)
  Trace "FetchCellStyle"
End Sub

Private Sub TDBGrid1_FetchCellTips(ByVal SplitIndex As Integer, ByVal ColIndex As Integer, ByVal RowIndex As Long, CellTip As String, ByVal FullyDisplayed As Boolean, ByVal TipStyle As TrueOleDBGrid60.StyleDisp)
  Trace "FetchCellTips"
End Sub

Private Sub TDBGrid1_FetchRowStyle(ByVal Split As Integer, Bookmark As Variant, ByVal RowStyle As TrueOleDBGrid60.StyleDisp)
  Trace "FetchRowStyle"
End Sub

Private Sub TDBGrid1_FirstRowChange(ByVal SplitIndex As Integer)
  Trace "FirstRowChange"
End Sub

Private Sub TDBGrid1_FootClick(ByVal ColIndex As Integer)
  Trace "FootClick"
End Sub

Private Sub TDBGrid1_FormatText(ByVal ColIndex As Integer, Value As Variant, Bookmark As Variant)
  Trace "FormatText"
End Sub

Private Sub TDBGrid1_GotFocus()
  Trace "GotFocus"
End Sub

Private Sub TDBGrid1_GroupColMove(ByVal Position As Integer, ByVal ColIndex As Integer, Cancel As Integer)
  Trace "GroupColMove"
End Sub

Private Sub TDBGrid1_GroupHeadClick(ByVal ColIndex As Integer)
  Trace "GroupHeadClick"
End Sub

Private Sub TDBGrid1_HeadClick(ByVal ColIndex As Integer)
  Trace "HeadClick"
End Sub

Private Sub TDBGrid1_KeyDown(KeyCode As Integer, Shift As Integer)
  Trace "KeyDown"
End Sub

Private Sub TDBGrid1_KeyPress(KeyAscii As Integer)
  Trace "KeyPress"
End Sub

Private Sub TDBGrid1_KeyUp(KeyCode As Integer, Shift As Integer)
  Trace "KeyUp"
End Sub

Private Sub TDBGrid1_LayoutReady()
  Trace "LayoutReady"
End Sub

Private Sub TDBGrid1_LeftColChange(ByVal SplitIndex As Integer)
  Trace "LeftColChange"
End Sub

Private Sub TDBGrid1_LostFocus()
  Trace "LostFocus"
End Sub

Private Sub TDBGrid1_OnAddNew()
  Trace "OnAddNew"
End Sub

Private Sub TDBGrid1_OnInit()
  Trace "OnInit"
End Sub

Private Sub TDBGrid1_OwnerDrawCell(ByVal hDC As Long, ByVal Bookmark As Variant, ByVal Split As Integer, ByVal Col As Integer, ByVal Left As Integer, ByVal Top As Integer, ByVal Right As Integer, ByVal Bottom As Integer, Done As Integer)
  Trace "OwnerDrawCell"
End Sub

Private Sub TDBGrid1_Paint()
  Trace "Paint"
End Sub

Private Sub TDBGrid1_PostEvent(ByVal MsgId As Integer)
  Trace "PostEvent"
End Sub

Private Sub TDBGrid1_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Trace "RowColChange " & LastRow & "/" & LastCol
End Sub

Private Sub TDBGrid1_RowResize(Cancel As Integer)
  Trace "RowResize"
End Sub

Private Sub TDBGrid1_Scroll(Cancel As Integer)
  Trace "Scroll"
End Sub

Private Sub TDBGrid1_SelChange(Cancel As Integer)
  Trace "SelChange"
End Sub

Private Sub TDBGrid1_SplitChange()
  Trace "SplitChange"
End Sub

Private Sub TDBGrid1_UnboundAddData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, NewRowBookmark As Variant)
  Trace "UnboundAddData"
End Sub

Private Sub TDBGrid1_UnboundColumnFetch(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
  Trace "UnboundColumnFetch"
End Sub

Private Sub TDBGrid1_UnboundDeleteRow(Bookmark As Variant)
  Trace "UnboundDeleteRow"
End Sub

Private Sub TDBGrid1_UnboundGetRelativeBookmark(StartLocation As Variant, ByVal offset As Long, NewLocation As Variant, ApproximatePosition As Long)
  Trace "UnboundGetRelativeBookmark"
End Sub

Private Sub TDBGrid1_UnboundReadData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, StartLocation As Variant, ByVal ReadPriorRows As Boolean)
  Trace "UnboundReadData"
End Sub

Private Sub TDBGrid1_UnboundReadDataEx(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, StartLocation As Variant, ByVal offset As Long, ApproximatePosition As Long)
  Trace "UnboundReadDataEx"
End Sub

Private Sub TDBGrid1_UnboundWriteData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, WriteLocation As Variant)
  Trace "UnboundWriteData"
End Sub

Private Sub TDBGrid1_Validate(Cancel As Boolean)
  Trace "Validate"
End Sub

Private Sub TDBGrid1_ValueItemError(ByVal ColIndex As Integer)
  Trace "ValueItemError"
End Sub
