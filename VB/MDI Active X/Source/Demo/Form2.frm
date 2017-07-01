VERSION 5.00
Object = "{CF7901E8-F65A-11D3-AA42-000629C16DEA}#1.4#0"; "MDIActiveX6.ocx"
Begin VB.Form Form2 
   Caption         =   "Editor"
   ClientHeight    =   1020
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3150
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   ScaleHeight     =   1020
   ScaleWidth      =   3150
   StartUpPosition =   3  'Windows Default
   Begin MDIinActiveX6.MDIActiveX MDIActiveX1 
      Left            =   2100
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   794
      BorderStyle     =   0
   End
   Begin VB.TextBox Text1 
      Height          =   825
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Text            =   "Form2.frx":0000
      Top             =   0
      Width           =   1590
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Private Sub Form_Activate()
  Debug.Print "Editor-activate", Now
End Sub

Private Sub Form_Deactivate()
  Debug.Print "editor-deactivate", Now
End Sub

Private Sub Form_Load()
  Me.Caption = Me.Caption & " (Now you can change caption in Form_Load event!)"
  Me.Text1 = "Set position and size of the window in the new MDIActiveX.FormLoad event!"
End Sub

Private Sub Form_Resize()
Dim r As RECT

  Me.Text1.Left = 0
  Me.Text1.Top = 0
  GetClientRect Me.hwnd, r
  Me.Text1.Width = Me.ScaleX(r.Right, vbPixels, Me.ScaleMode)
  Me.Text1.Height = Me.ScaleY(r.Bottom, vbPixels, Me.ScaleMode) - Me.Text1.Top
  
End Sub

Private Sub MDIActiveX1_FormLoad()
  Me.MDIActiveX1.Move Me.MDIActiveX1.MDIForm.Width / 2 - 2500, Me.MDIActiveX1.MDIForm.Height / 2 - 1000, 5000, 2000
End Sub

