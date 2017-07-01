VERSION 5.00
Begin VB.Form frmTest 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnMsgBox 
      Caption         =   "MsgBox"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1860
      TabIndex        =   1
      Top             =   1500
      Width           =   1500
   End
   Begin VB.CommandButton btnMsgBoxTimer 
      Caption         =   "MsgBoxTimer"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1860
      TabIndex        =   0
      Top             =   960
      Width           =   1500
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnMsgBox_Click()
  MsgBox "Ce programme fonctionne déjà." & vbCrLf & vbCrLf & "Vous ne pouvez lancer qu'une seule copie du programme à la fois.", vbCritical, "Test"
End Sub

Private Sub btnMsgBoxTimer_Click()
  frmMsgBoxTimer.MsgBoxTimer "Ce programme fonctionne déjà." & vbCrLf & vbCrLf & "Vous ne pouvez lancer qu'une seule copie du programme à la fois.", vbCritical, "Test"
End Sub
