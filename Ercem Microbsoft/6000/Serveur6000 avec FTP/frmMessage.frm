VERSION 5.00
Begin VB.Form frmMessage 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Message Serveur6000"
   ClientHeight    =   3195
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
   Icon            =   "frmMessage.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tim 
      Left            =   120
      Top             =   2640
   End
   Begin VB.CommandButton btnOk 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   1680
      TabIndex        =   0
      Top             =   2700
      Width           =   1215
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Origine du message :"
      Height          =   210
      Left            =   660
      TabIndex        =   3
      Top             =   1920
      Width           =   2025
   End
   Begin VB.Label lblOrigine 
      Height          =   255
      Left            =   660
      TabIndex        =   2
      Top             =   2220
      Width           =   3915
   End
   Begin VB.Label lblMessage 
      Height          =   1515
      Left            =   660
      TabIndex        =   1
      Top             =   180
      Width           =   3915
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   60
      Picture         =   "frmMessage.frx":0442
      Top             =   120
      Width           =   480
   End
End
Attribute VB_Name = "frmMessage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmMessage
' Feuille d'affichage de boîte de message
' Le msgbox ne suffit pas…
' 26/11/97 PV

Option Explicit

Private iNbBeep As Integer

Private Sub btnOk_Click()
  tim.Interval = 0
  Unload Me
End Sub

Private Sub Form_Load()
  tim.Interval = 1000
End Sub

Private Sub tim_Timer()
  Beep
  iNbBeep = iNbBeep + 1
  If iNbBeep = 5 Then tim.Interval = 5000
  If iNbBeep = 10 Then tim.Interval = 60000
  If iNbBeep = 30 Then tim.Interval = 0
End Sub
