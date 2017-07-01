VERSION 5.00
Begin VB.Form frmMain 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "Suivi des messages VB"
   ClientHeight    =   6720
   ClientLeft      =   1230
   ClientTop       =   1920
   ClientWidth     =   4545
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   OLEDropMode     =   1  'Manual
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   448
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   303
   Begin VB.Menu cmdCls 
      Caption         =   "&Effacer l'écran!"
   End
   Begin VB.Menu cmdQuitter 
      Caption         =   "&Quitter!"
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Ce programme affiche l'ensemble des messages
' pour une feuille. Le message MouseMove affiche
' un pixel

Option Explicit

Private Sub cmdCls_Click()
  Cls
End Sub

Private Sub cmdQuitter_Click()
  End
End Sub

Private Sub Form_Activate()
  Print "Activate"
End Sub

Private Sub Form_Click()
  Print "Click"
End Sub

Private Sub Form_DblClick()
  Print "DblClick"
End Sub

Private Sub Form_Deactivate()
  Print "Deactivate"
End Sub

Private Sub Form_DragDrop(Source As Control, X As Single, Y As Single)
  Print "DragDrop X:"; X; "  Y:"; Y
End Sub

Private Sub Form_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
'  Print "DragOver"
  Dim xsauve%, ysauve%

  xsauve% = frmMain.CurrentX
  ysauve% = frmMain.CurrentY
  PSet (X, Y)
  PSet (X - 1, Y - 1)
  PSet (X - 1, Y + 1)
  PSet (X + 1, Y - 1)
  PSet (X + 1, Y + 1)
  frmMain.CurrentX = xsauve%
  frmMain.CurrentY = ysauve%
End Sub

Private Sub Form_GotFocus()
  Print "GotFocus"
End Sub

Private Sub Form_Initialize()
  Debug.Print "Initialize"
End Sub

Private Sub Form_KeyDown(keycode As Integer, Shift As Integer)
  Print "KeyDown"
End Sub

Private Sub Form_KeyPress(keyascii As Integer)
  Print "KeyPress KeyAscii:"; keyascii
End Sub

Private Sub Form_KeyUp(keycode As Integer, Shift As Integer)
  Print "KeyUp KeyCode:"; keycode; " Shift:"; Shift
End Sub

Private Sub Form_LinkClose()
  Print "LinkClose"
End Sub

Private Sub Form_LinkError(LinkErr As Integer)
  Print "LinkError LinkErr:"; LinkErr
End Sub

Private Sub Form_LinkExecute(CmdStr As String, Cancel As Integer)
  Print "LinkExecute CmdStr="; Chr$(34); CmdStr; Chr$(34); " Cancel:"; Cancel
End Sub

Private Sub Form_LinkOpen(Cancel As Integer)
  Print "LinkOpen Cancel:"; Cancel
End Sub

Private Sub Form_Load()
  frmImage.Show
  Print "Load"
End Sub

Private Sub Form_LostFocus()
  Print "LostFocus"
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Print "MouseDown"
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim xsauve%, ysauve%

  xsauve% = frmMain.CurrentX
  ysauve% = frmMain.CurrentY
  PSet (X, Y)
  frmMain.CurrentX = xsauve%
  frmMain.CurrentY = ysauve%
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Print "MouseUp"
End Sub

Private Sub Form_OLECompleteDrag(Effect As Long)
  Print "OLECompleteDrag Effect="; Effect
End Sub

Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  Print "OLEDragDrop Effect="; Effect; " Button="; Button; " Shift="; Shift; " X="; X; " Y="; Y
End Sub

Private Sub Form_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  Print "OLEDragOver Effect="; Effect; " Button="; Button; " Shift="; Shift; " X="; X; " Y="; Y
End Sub

Private Sub Form_OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
  Print "OLEGiveFeedback Effect="; Effect; " DefaultCursors="; DefaultCursors
End Sub

Private Sub Form_OLESetData(Data As DataObject, DataFormat As Integer)
  Print "OLESetData DataFormat="; DataFormat
End Sub

Private Sub Form_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
  Print "OLEStartDrag AllowedEffects="; AllowedEffects
End Sub

Private Sub Form_Paint()
  Print "Paint"
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  Print "QueryUnload"
End Sub

Private Sub Form_Resize()
  Print "Resize"
End Sub

Private Sub Form_Terminate()
  Print "Terminate"
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Print "Unload"
End Sub

