VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5070
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7860
   LinkTopic       =   "Form1"
   ScaleHeight     =   5070
   ScaleWidth      =   7860
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picSplitter 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      Height          =   4620
      Left            =   3540
      ScaleHeight     =   2011.747
      ScaleMode       =   0  'User
      ScaleWidth      =   780
      TabIndex        =   3
      Top             =   60
      Visible         =   0   'False
      Width           =   72
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   2
      Top             =   4755
      Width           =   7860
      _ExtentX        =   13864
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   4575
      Left            =   3840
      TabIndex        =   1
      Top             =   60
      Width           =   3915
      _ExtentX        =   6906
      _ExtentY        =   8070
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.TreeView TreeView1 
      Height          =   4575
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   3135
      _ExtentX        =   5530
      _ExtentY        =   8070
      _Version        =   393217
      Style           =   7
      Appearance      =   1
   End
   Begin VB.Image imgSplitter 
      Height          =   4635
      Left            =   3240
      MousePointer    =   9  'Size W E
      Top             =   60
      Width           =   150
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Const sglSplitLimit = 300       ' Minimum width of a pane
Private m_bMoving As Boolean            ' Splitter moving occurs

Private Sub Form_Resize()
    On Error Resume Next
    
    ' Horizontal size of TreeView/ListView is based on imgSpliter position
    TreeView1.Width = imgSplitter.Left - 60
    TreeView1.Top = 60 + 15
    TreeView1.Height = ScaleHeight - 60 - StatusBar1.Height - 60
    ListView1.Left = imgSplitter.Left + 60
    ListView1.Width = ScaleWidth - ListView1.Left - 60
    ListView1.Top = 60
    ListView1.Height = ScaleHeight - 60 - StatusBar1.Height - 60 + 30
    
    imgSplitter.Height = TreeView1.Height
End Sub


' ===============================================================================
' Splitter management

Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  With imgSplitter
      picSplitter.Move .Left, .Top, .Width \ 2, .Height
  End With
  picSplitter.Visible = True
  m_bMoving = True
End Sub


Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim sglPos As Single
  
  If m_bMoving Then
      sglPos = x + imgSplitter.Left
      If sglPos < sglSplitLimit Then
          picSplitter.Left = sglSplitLimit
      ElseIf sglPos > Me.ScaleWidth - sglSplitLimit - 60 Then
          picSplitter.Left = Me.ScaleWidth - sglSplitLimit - 60
      Else
          picSplitter.Left = sglPos
      End If
  End If
End Sub


Private Sub imgSplitter_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  picSplitter.Visible = False
  m_bMoving = False
  imgSplitter.Left = picSplitter.Left
  Form_Resize
End Sub

