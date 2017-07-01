VERSION 5.00
Object = "{6CFC5737-D17D-4E47-BBCE-FFD02034A18A}#1.0#0"; "ggrid.ocx"
Begin VB.Form frmTestGGrid 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7770
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   7770
   StartUpPosition =   3  'Windows Default
   Begin GGRIDLib.GGrid GGrid1 
      Height          =   2235
      Left            =   120
      TabIndex        =   0
      Top             =   540
      Width           =   7395
      _Version        =   65536
      _ExtentX        =   13044
      _ExtentY        =   3942
      _StockProps     =   0
   End
End
Attribute VB_Name = "frmTestGGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Click()
    Dim i As Integer, j As Integer
    For i = 1 To 4
        For j = 1 To 4
            GGrid1.EditCell i, j
        Next
    Next
End Sub

Private Sub Form_Load()
    GGrid1.Rows = 4
    GGrid1.Cols = 4
    GGrid1.FixedCols = 1
    GGrid1.FixedRows = 1
    
    GGrid1.SetCellBkColor 3, 3, RGB(255, 200, 200)
    GGrid1.EnsureVisible 3, 3
    GGrid1.SetCheckBoxStyle 3, 3
    GGrid1.SetChecked 3, 3, True
    GGrid1.SetComboBoxStyle 2, 2
    GGrid1.SetComboBoxEditStyle 1, 1
    GGrid1.SetDateStyle 1, 2
    GGrid1.SetDateTimeStyle 1, 3
    GGrid1.SetItemText 1, 2, "28/8/04"
    GGrid1.SetItemText 1, 3, "28/8/04 13:54"
    GGrid1.SetOptions 2, 2, "A" & vbTab & "B" & vbTab & "C"
    GGrid1.SetOptions 1, 1, "Lundi" & vbTab & "Mardi" & vbTab & "Mercredi" & vbTab & "Jeudi" & vbTab & "Vendredi" & vbTab & "Samedi" & vbTab & "Dimanche"
    GGrid1.SetTimeStyle 2, 1
    GGrid1.SetItemText 2, 1, "13:54"
        
    GGrid1.SetHeaderSort True
End Sub


Private Sub GGrid1_CellClicked(ByVal Row As Integer, ByVal Col As Integer)
    Debug.Print "GGrid1_CellClicked(" & Row & ", " & Col & ")"
End Sub

Private Sub GGrid1_CellCtrlClicked(ByVal Row As Integer, ByVal Col As Integer)
    Debug.Print "GGrid1_CellCtrlClicked(" & Row & ", " & Col & ")"
End Sub

Private Sub GGrid1_CellCtrlDblClick(ByVal Row As Integer, ByVal Col As Integer)
    Debug.Print "GGrid1_CellCtrlDblClicked(" & Row & ", " & Col & ")"
End Sub

Private Sub GGrid1_CellDblClk(ByVal Row As Integer, ByVal Col As Integer)
    Debug.Print "GGrid1_CellDblClk(" & Row & ", " & Col & ")"
End Sub


Private Sub GGrid1_CellEditEnded(ByVal Row As Integer, ByVal Col As Integer, Validated As Boolean)
    Debug.Print "GGrid1_CellEditEnded(" & Row & ", " & Col & ", " & Validated & ")"
End Sub

Private Sub GGrid1_CellEditStarted(ByVal Row As Integer, ByVal Col As Integer)
    Debug.Print "GGrid1_CellEditStarted(" & Row & ", " & Col & ")"
End Sub

Private Sub GGrid1_CellEnter(ByVal Row As Integer, ByVal Col As Integer)
    Debug.Print "GGrid1_CellEnter(" & Row & ", " & Col & ")"
End Sub

Private Sub GGrid1_CellHelpAsked(ByVal Row As Integer, ByVal Col As Integer)
    Debug.Print "GGrid1_CellHelpAsked(" & Row & ", " & Col & ")"
End Sub

Private Sub GGrid1_CellInfo(ByVal Row As Integer, ByVal Col As Integer, Text As String)
    Debug.Print "GGrid1_CellInfo(" & Row & ", " & Col & ", """ & Text & """)"
End Sub

Private Sub GGrid1_CellShiftClicked(ByVal Row As Integer, ByVal Col As Integer)
    Debug.Print "GGrid1_CellShiftClicked(" & Row & ", " & Col & ")"
End Sub

Private Sub GGrid1_CellShiftDblClick(ByVal Row As Integer, ByVal Col As Integer)
    Debug.Print "GGrid1_CellShiftDblClicked(" & Row & ", " & Col & ")"
End Sub

Private Sub GGrid1_DragDrop(Source As Control, X As Single, Y As Single)
    Debug.Print "GGrid1_DargDrop(" & X & ", " & X & ")"
End Sub

Private Sub GGrid1_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
    Debug.Print "GGrid1_DragOver(" & X & ", " & Y & ", " & State & ")"
End Sub

Private Sub GGrid1_GotFocus()
    Debug.Print "GGrid1_GotFocus"
End Sub

Private Sub GGrid1_KeyDown(KeyCode As Long, ByVal Shift As Integer)
    Debug.Print "GGrid1_KeyDown(" & KeyCode & ", " & Shift & ")"
End Sub

Private Sub GGrid1_LostFocus()
    Debug.Print "GGrid1_LostFocus"
End Sub

Private Sub GGrid1_Validate(Cancel As Boolean)
    Debug.Print "GGrid1_Validate"
End Sub
