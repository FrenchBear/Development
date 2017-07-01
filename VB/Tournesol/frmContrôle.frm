VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmContrôle 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Contrôle du tournesol"
   ClientHeight    =   2160
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2160
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnFichier 
      Caption         =   "Fichier .txt"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   1215
   End
   Begin VB.TextBox txtAngle 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   900
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   780
      Width           =   735
   End
   Begin MSComctlLib.Slider slAngle 
      Height          =   525
      Left            =   60
      TabIndex        =   0
      Top             =   1260
      Width           =   4575
      _ExtentX        =   8070
      _ExtentY        =   926
      _Version        =   393216
      LargeChange     =   10
      Max             =   180
      TickFrequency   =   10
   End
   Begin VB.Label lblAngle 
      AutoSize        =   -1  'True
      Caption         =   "180"
      Height          =   210
      Index           =   2
      Left            =   4260
      TabIndex        =   6
      Top             =   1800
      Width           =   360
   End
   Begin VB.Label lblAngle 
      AutoSize        =   -1  'True
      Caption         =   "90"
      Height          =   210
      Index           =   1
      Left            =   2220
      TabIndex        =   5
      Top             =   1800
      Width           =   240
   End
   Begin VB.Label lblAngle 
      AutoSize        =   -1  'True
      Caption         =   "0"
      Height          =   210
      Index           =   0
      Left            =   180
      TabIndex        =   4
      Top             =   1740
      Width           =   120
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Angle :"
      Height          =   210
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   660
   End
End
Attribute VB_Name = "frmContrôle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub ChangeAngle()
  txtAngle = slAngle
  frmTournesol.Calcul Val(txtAngle)
End Sub

Private Sub slAngle_Change()
  ChangeAngle
End Sub

'Private Sub slAngle_Click()
'  ChangeAngle
'End Sub

Private Sub slAngle_Scroll()
  ChangeAngle
End Sub


Private Sub btnFichier_Click()
  Open "c:\rep.txt" For Output As #1
  
  Dim i As Single, rep As Single
  For i = 8 To 178 Step 0.5
    rep = frmTournesol.Calcul(i)
    Print #1, i; vbTab; rep
  Next
  Close #1
End Sub

Private Sub Form_Unoad()
  End
End Sub

