VERSION 5.00
Begin VB.Form frmMsgBoxTimer 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "frmMsgBoxTimer"
   ClientHeight    =   1695
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5775
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMsgBoxTimer.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1695
   ScaleWidth      =   5775
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   5000
      Left            =   240
      Top             =   960
   End
   Begin VB.CommandButton btnOk 
      Cancel          =   -1  'True
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   2400
      TabIndex        =   0
      Top             =   1260
      Width           =   1215
   End
   Begin VB.Image imgIcônes 
      Height          =   480
      Index           =   0
      Left            =   0
      Picture         =   "frmMsgBoxTimer.frx":000C
      Top             =   1020
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcônes 
      Height          =   480
      Index           =   1
      Left            =   0
      Picture         =   "frmMsgBoxTimer.frx":044E
      Top             =   1500
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcônes 
      Height          =   480
      Index           =   2
      Left            =   480
      Picture         =   "frmMsgBoxTimer.frx":0890
      Top             =   1020
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcônes 
      Height          =   480
      Index           =   3
      Left            =   480
      Picture         =   "frmMsgBoxTimer.frx":0CD2
      Top             =   1500
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcône 
      Appearance      =   0  'Flat
      Height          =   480
      Left            =   120
      Top             =   180
      Width           =   480
   End
   Begin VB.Label lblMessage 
      Height          =   975
      Left            =   900
      TabIndex        =   1
      Top             =   120
      Width           =   4815
   End
End
Attribute VB_Name = "frmMsgBoxTimer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmMsgBoxTimer

Option Explicit

Public Sub MsgBoxTimer(Prompt As String, Optional Buttons As VbMsgBoxStyle = vbOKOnly, Optional Title As String = "")
  Caption = Title
  lblMessage = Prompt
  Move (Screen.Width - Width) \ 2, (Screen.Height - Height) \ 2
  
  Select Case Buttons And (vbCritical Or vbQuestion Or vbExclamation Or vbInformation)
    Case vbCritical:    Set imgIcône.Picture = imgIcônes(0).Picture
    Case vbQuestion:    Set imgIcône.Picture = imgIcônes(1).Picture
    Case vbExclamation: Set imgIcône.Picture = imgIcônes(2).Picture
    Case vbInformation: Set imgIcône.Picture = imgIcônes(3).Picture
    Case Else:          Set imgIcône.Picture = LoadPicture
  End Select
  
  Show vbModal
End Sub

Private Sub btnOk_Click()
  Unload Me
End Sub

Private Sub Timer1_Timer()
  Unload Me
End Sub
