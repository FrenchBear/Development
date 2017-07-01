VERSION 5.00
Begin VB.Form MDIChild 
   Caption         =   "Normal VB MDIChild"
   ClientHeight    =   1905
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4860
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   1905
   ScaleWidth      =   4860
   Begin VB.CommandButton Command2 
      Caption         =   "Change &Caption"
      Height          =   330
      Left            =   2250
      TabIndex        =   3
      Top             =   810
      Width           =   1905
   End
   Begin VB.PictureBox Picture1 
      Height          =   330
      Left            =   3510
      Picture         =   "MDIChild.frx":0000
      ScaleHeight     =   270
      ScaleWidth      =   270
      TabIndex        =   2
      Top             =   225
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Change &Icon"
      Height          =   330
      Left            =   180
      TabIndex        =   1
      Top             =   810
      Width           =   1905
   End
   Begin VB.Label Label1 
      Caption         =   "Standard VB MDI Child form without own menu."
      Height          =   555
      Left            =   180
      TabIndex        =   0
      Top             =   90
      Width           =   2805
   End
End
Attribute VB_Name = "MDIChild"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Me.Icon = Me.Picture1.Picture
End Sub

Private Sub Command2_Click()
  Me.Caption = "Es ist der " & Now
End Sub


Private Sub Form_Activate()
  Debug.Print "MDIChild activate"
End Sub

Private Sub Form_Deactivate()
  Debug.Print "MDIChild Deactivate"
End Sub

