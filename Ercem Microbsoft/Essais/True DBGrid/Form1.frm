VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form frmTest 
   Caption         =   "Essais True DBGrid"
   ClientHeight    =   8760
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10185
   LinkTopic       =   "Form1"
   ScaleHeight     =   8760
   ScaleWidth      =   10185
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnSupprimeLigne 
      Caption         =   "Supprime ligne"
      Height          =   435
      Left            =   4620
      TabIndex        =   3
      Top             =   2580
      Width           =   1215
   End
   Begin VB.CommandButton btnInsèreLigne 
      Caption         =   "Insère ligne"
      Height          =   435
      Left            =   3240
      TabIndex        =   2
      Top             =   2580
      Width           =   1215
   End
   Begin TrueOleDBGrid60.TDBGrid tdgVentilation 
      Height          =   2415
      Left            =   120
      OleObjectBlob   =   "Form1.frx":0000
      TabIndex        =   1
      Top             =   60
      Width           =   7755
   End
   Begin VB.ListBox lstTrace 
      Height          =   4155
      Left            =   180
      TabIndex        =   0
      Top             =   2580
      Width           =   2835
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Essais sur TrubDBGrid
' 3/11/99 PV

Option Explicit

Dim x As XArrayDB

Dim bGrilleModifiée As Boolean
Dim bCanEscape As Boolean



Private Sub btnInsèreLigne_Click()
  Dim fr As Integer, r As Integer
  If tdgVentilation.FirstRow = "" Then
    fr = 1
  Else
    fr = tdgVentilation.FirstRow
  End If
  r = tdgVentilation.Row
  x.InsertRows fr + r
  tdgVentilation.ReBind
  tdgVentilation.FirstRow = fr
  tdgVentilation.Row = r
End Sub

Private Sub btnSupprimeLigne_Click()
  Dim fr As Integer, r As Integer
  If tdgVentilation.FirstRow = "" Then Exit Sub
  fr = tdgVentilation.FirstRow
  r = tdgVentilation.Row
  If fr + r <= x.UpperBound(1) Then
    x.DeleteRows fr + r
    tdgVentilation.ReBind
    tdgVentilation.FirstRow = fr
    tdgVentilation.Row = r
  End If
End Sub


Private Sub Form_Load()

  tdgVentilation.Columns(0).Caption = "T1"
  tdgVentilation.Columns(1).Caption = "N1"
  tdgVentilation.Columns(2).Caption = "Z1"
  tdgVentilation.Columns(3).Caption = "N2"
  
  tdgVentilation.AllowAddNew = True
  tdgVentilation.AllowDelete = True

  Set x = New XArrayDB
  x.ReDim 1, 20, 0, 3
  
  x(1, 0) = "Ligne 1": x(1, 1) = 84: x(1, 2) = "un": x(1, 3) = 1
  x(2, 0) = "Ligne 2": x(2, 1) = 314: x(2, 2) = "deux": x(2, 3) = 2
  x(3, 0) = "Ligne 3": x(3, 1) = 1414: x(3, 2) = "trois": x(3, 3) = 3
  x(4, 0) = "Ligne 4": x(4, 1) = 836: x(4, 2) = "quatre": x(4, 3) = 4
  Dim i As Integer
  For i = 5 To 20
    x(i, 0) = "Ligne " & i
    x(i, 1) = Int(10000 * Rnd)
    x(i, 2) = ""
    x(i, 3) = Int(7 * Rnd + 1)
  Next
  tdgVentilation.Array = x


  tdgVentilation.Columns(2).Locked = True
  tdgVentilation.Columns(2).BackColor = RGB(220, 220, 220)
  
  tdgVentilation.Columns(3).ValueItems.Clear
  Pays 1, "France"
  Pays 2, "Suisse"
  Pays 3, "USA"
  Pays 4, "Allemagne"
  Pays 5, "Italie"
  Pays 6, "Danemark"
  
  'tdgVentilation.Columns(1).Style
End Sub

Private Sub Pays(iPays As Integer, sPays As String)
  Dim v As New ValueItem
  v.Value = iPays
  v.DisplayValue = sPays
  tdgVentilation.Columns(3).ValueItems.Add v
End Sub

Private Sub Trace(sMsg As String)
  lstTrace.AddItem sMsg
  lstTrace.ListIndex = lstTrace.ListCount - 1
End Sub

Private Sub tdgVentilation_AfterColEdit(ByVal ColIndex As Integer)
  Trace "AfterColEdit " & ColIndex
End Sub

Private Sub tdgVentilation_AfterColUpdate(ByVal ColIndex As Integer)
  Trace "AfterColUpdate " & ColIndex
End Sub

Private Sub tdgVentilation_AfterDelete()
  Trace "AfterDelete"
End Sub

Private Sub tdgVentilation_AfterInsert()
  Trace "AfterInsert"
End Sub

Private Sub tdgVentilation_AfterUpdate()
  Trace "AfterUpdate"
End Sub

Private Sub tdgVentilation_BeforeColEdit(ByVal ColIndex As Integer, ByVal KeyAscii As Integer, Cancel As Integer)
  Trace "BeforeColEdit " & ColIndex & " " & KeyAscii
End Sub

Private Sub tdgVentilation_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
  Trace "BeforeColUpdate " & ColIndex & " " & OldValue
  If ColIndex = 1 Then
    If Not IsNumeric(tdgVentilation.Text) Then
      MsgBox "La valeur doit être numérique"
      Cancel = True
    End If
  End If
End Sub

Private Sub tdgVentilation_BeforeDelete(Cancel As Integer)
  Trace "BeforeDelete"
End Sub

Private Sub tdgVentilation_BeforeInsert(Cancel As Integer)
  Trace "BeforeInsert"
End Sub

Private Sub tdgVentilation_BeforeRowColChange(Cancel As Integer)
  Trace "BeforeRowColChange"
End Sub

Private Sub tdgVentilation_BeforeUpdate(Cancel As Integer)
  Trace "BeforeUpdate"
End Sub

Private Sub tdgVentilation_ButtonClick(ByVal ColIndex As Integer)
  Trace "ButtonClick " & ColIndex
End Sub

Private Sub tdgVentilation_Change()
  Trace "Change"
End Sub

Private Sub tdgVentilation_ClassicAdd(NewRowBookmark As Variant, ByVal Col As Integer, Value As Variant)
  Trace "ClassicAdd"
End Sub

Private Sub tdgVentilation_ClassicDelete(Bookmark As Variant)
  Trace "ClassicDelete"
End Sub

Private Sub tdgVentilation_ClassicRead(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
  Trace "ClassicRead"
End Sub

Private Sub tdgVentilation_ClassicWrite(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
  Trace "ClassicWrite"
End Sub

Private Sub tdgVentilation_Click()
  Trace "Click"
End Sub

Private Sub tdgVentilation_ColEdit(ByVal ColIndex As Integer)
  Trace "ColEdit " & ColIndex
End Sub

Private Sub tdgVentilation_Collapse(ByVal Band As Integer, Cancel As Integer)
  Trace "Collapse"
End Sub

Private Sub tdgVentilation_ColMove(ByVal Position As Integer, Cancel As Integer)
  Trace "ColMove " & Position
End Sub

Private Sub tdgVentilation_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
  Trace "ColResize " & ColIndex
End Sub

Private Sub tdgVentilation_ComboSelect(ByVal ColIndex As Integer)
  Trace "ComboSelect " & ColIndex
End Sub

Private Sub tdgVentilation_DataSourceChanged()
  Trace "DataSourceChanged"
End Sub

Private Sub tdgVentilation_DblClick()
  Trace "DblClick"
End Sub

Private Sub tdgVentilation_DragCell(ByVal SplitIndex As Integer, RowBookmark As Variant, ByVal ColIndex As Integer)
  Trace "DragCell " & SplitIndex
End Sub

Private Sub tdgVentilation_Error(ByVal DataError As Integer, Response As Integer)
  Trace "Error " & DataError
End Sub

Private Sub tdgVentilation_Expand(ByVal Band As Integer, Cancel As Integer)
  Trace "Expand " & Band
End Sub

Private Sub tdgVentilation_FetchCellStyle(ByVal Condition As Integer, ByVal Split As Integer, Bookmark As Variant, ByVal Col As Integer, ByVal CellStyle As TrueOleDBGrid60.StyleDisp)
  Trace "FetchCellStyle " & Condition & " " & Split
End Sub

Private Sub tdgVentilation_FetchCellTips(ByVal SplitIndex As Integer, ByVal ColIndex As Integer, ByVal RowIndex As Long, CellTip As String, ByVal FullyDisplayed As Boolean, ByVal TipStyle As TrueOleDBGrid60.StyleDisp)
  Trace "FetchCellTips " & SplitIndex
End Sub

Private Sub tdgVentilation_FetchRowStyle(ByVal Split As Integer, Bookmark As Variant, ByVal RowStyle As TrueOleDBGrid60.StyleDisp)
  Trace "FetchRowStyle " & Split
End Sub

Private Sub tdgVentilation_FirstRowChange(ByVal SplitIndex As Integer)
  Trace "FirstRowChange " & SplitIndex
End Sub

Private Sub tdgVentilation_FootClick(ByVal ColIndex As Integer)
  Trace "FootClick " & ColIndex
End Sub

Private Sub tdgVentilation_FormatText(ByVal ColIndex As Integer, Value As Variant, Bookmark As Variant)
  Trace "FormatText"
End Sub

Private Sub tdgVentilation_GotFocus()
  Trace "GotFocus"
End Sub

Private Sub tdgVentilation_GroupColMove(ByVal Position As Integer, ByVal ColIndex As Integer, Cancel As Integer)
  Trace "GroupColMove"
End Sub

Private Sub tdgVentilation_GroupHeadClick(ByVal ColIndex As Integer)
  Trace "GroupHeadClick " & ColIndex
End Sub

Private Sub tdgVentilation_HeadClick(ByVal ColIndex As Integer)
  Trace "HeadClick " & ColIndex
End Sub

Private Sub tdgVentilation_KeyDown(KeyCode As Integer, Shift As Integer)
  Trace "KeyDown " & KeyCode & " " & Shift
End Sub

Private Sub tdgVentilation_KeyPress(KeyAscii As Integer)
  Trace "KeyPress " & KeyAscii
End Sub

Private Sub tdgVentilation_KeyUp(KeyCode As Integer, Shift As Integer)
  Trace "KeyUp " & KeyCode & " " & Shift
End Sub

Private Sub tdgVentilation_LayoutReady()
  Trace "LayoutReady"
End Sub

Private Sub tdgVentilation_LeftColChange(ByVal SplitIndex As Integer)
  Trace "LeftColChange " & SplitIndex
End Sub

Private Sub tdgVentilation_LostFocus()
  Trace "LostFocus"
End Sub

Private Sub tdgVentilation_OnAddNew()
  Trace "OnAddNew"
End Sub

Private Sub tdgVentilation_OnInit()
  Trace "OnInit"
End Sub

Private Sub tdgVentilation_OwnerDrawCell(ByVal hDC As Long, ByVal Bookmark As Variant, ByVal Split As Integer, ByVal Col As Integer, ByVal Left As Integer, ByVal Top As Integer, ByVal Right As Integer, ByVal Bottom As Integer, Done As Integer)
  Trace "OwnerDrawCell"
End Sub

Private Sub tdgVentilation_Paint()
  Trace "Paint"
End Sub

Private Sub tdgVentilation_PostEvent(ByVal MsgId As Integer)
  Trace "PostEvent " & MsgId
End Sub

Private Sub tdgVentilation_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Trace "RowColChange " & LastRow & "/" & LastCol & " -> " & tdgVentilation.Row & "/" & tdgVentilation.Col
End Sub

Private Sub tdgVentilation_RowResize(Cancel As Integer)
  Trace "RowResize"
End Sub

Private Sub tdgVentilation_Scroll(Cancel As Integer)
  Trace "Scroll"
End Sub

Private Sub tdgVentilation_SelChange(Cancel As Integer)
  Trace "SelChange"
End Sub

Private Sub tdgVentilation_SplitChange()
  Trace "SplitChange"
End Sub

Private Sub tdgVentilation_UnboundAddData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, NewRowBookmark As Variant)
  Trace "UnboundAddData"
End Sub

Private Sub tdgVentilation_UnboundColumnFetch(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
  Trace "UnboundColumnFetch " & Bookmark
End Sub

Private Sub tdgVentilation_UnboundDeleteRow(Bookmark As Variant)
  Trace "UnboundDeleteRow " & Bookmark
End Sub

Private Sub tdgVentilation_UnboundGetRelativeBookmark(StartLocation As Variant, ByVal offset As Long, NewLocation As Variant, ApproximatePosition As Long)
  Trace "UnboundGetRelativeBookmark"
End Sub

Private Sub tdgVentilation_UnboundReadData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, StartLocation As Variant, ByVal ReadPriorRows As Boolean)
  Trace "UnboundReadData"
End Sub

Private Sub tdgVentilation_UnboundReadDataEx(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, StartLocation As Variant, ByVal offset As Long, ApproximatePosition As Long)
  Trace "UnboundReadDataEx"
End Sub

Private Sub tdgVentilation_UnboundWriteData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, WriteLocation As Variant)
  Trace "UnboundWriteData"
End Sub

Private Sub tdgVentilation_Validate(Cancel As Boolean)
  Trace "Validate"
End Sub

Private Sub tdgVentilation_ValueItemError(ByVal ColIndex As Integer)
  Trace "ValueItemError " & ColIndex
End Sub

