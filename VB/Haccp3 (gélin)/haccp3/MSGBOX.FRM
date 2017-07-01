VERSION 4.00
Begin VB.Form formMsgBox 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Form1"
   ClientHeight    =   4815
   ClientLeft      =   1275
   ClientTop       =   1530
   ClientWidth     =   5865
   Height          =   5220
   Left            =   1215
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4815
   ScaleWidth      =   5865
   ShowInTaskbar   =   0   'False
   Top             =   1185
   Width           =   5985
   Begin VB.Frame Frame1 
      Height          =   4155
      Left            =   60
      TabIndex        =   2
      Top             =   60
      Width           =   5715
      Begin VB.CommandButton btnInfos 
         Caption         =   "Pour en savoir plus..."
         Height          =   375
         Left            =   1920
         TabIndex        =   4
         Top             =   3660
         Width           =   1875
      End
      Begin VB.Image Image1 
         Height          =   480
         Left            =   2580
         Picture         =   "MSGBOX.frx":0000
         Top             =   180
         Width           =   480
      End
      Begin VB.Label lblMessage 
         Caption         =   "Label1"
         Height          =   2835
         Left            =   120
         TabIndex        =   3
         Top             =   720
         Width           =   5475
      End
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   3180
      TabIndex        =   1
      Top             =   4320
      Width           =   1275
   End
   Begin VB.CommandButton btnOk 
      Cancel          =   -1  'True
      Caption         =   "Ok"
      Height          =   375
      Left            =   1380
      TabIndex        =   0
      Top             =   4320
      Width           =   1275
   End
End
Attribute VB_Name = "formMsgBox"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub Label1_Click()

End Sub


Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub

Private Sub btnInfos_Click()
    AideHACCP Val(btnInfos.Tag)
End Sub


Private Sub btnOk_Click()
    Unload Me
End Sub


Private Sub Form_Load()
    CenterInScreen Me
    HourGlass "hide"
End Sub

