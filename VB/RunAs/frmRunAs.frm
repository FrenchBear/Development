VERSION 5.00
Begin VB.Form frmRunAs 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "RunAs"
   ClientHeight    =   2190
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3840
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2190
   ScaleWidth      =   3840
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtProg 
      Height          =   315
      Left            =   1260
      TabIndex        =   8
      Top             =   1140
      Width           =   2500
   End
   Begin VB.TextBox txtDomain 
      Height          =   315
      Left            =   1260
      TabIndex        =   6
      Top             =   780
      Width           =   2500
   End
   Begin VB.TextBox txtPwd 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   1260
      PasswordChar    =   "*"
      TabIndex        =   4
      Top             =   420
      Width           =   2500
   End
   Begin VB.TextBox txtUser 
      Height          =   315
      Left            =   1260
      TabIndex        =   2
      Top             =   60
      Width           =   2500
   End
   Begin VB.CommandButton cmdRun 
      Caption         =   "Run"
      Height          =   495
      Left            =   60
      TabIndex        =   0
      Top             =   1620
      Width           =   1215
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Prog"
      Height          =   195
      Left            =   60
      TabIndex        =   7
      Top             =   1200
      Width           =   330
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Domain"
      Height          =   195
      Left            =   60
      TabIndex        =   5
      Top             =   840
      Width           =   540
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Password"
      Height          =   195
      Left            =   60
      TabIndex        =   3
      Top             =   480
      Width           =   690
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "User"
      Height          =   195
      Left            =   60
      TabIndex        =   1
      Top             =   120
      Width           =   330
   End
End
Attribute VB_Name = "frmRunAs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdRun_Click()
    RunAsUser txtUser.Text, txtPwd.Text, txtDomain.Text, txtProg.Text, "c:\"
End Sub

