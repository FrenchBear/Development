VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
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
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   240
      Top             =   840
   End
   Begin VB.CommandButton btnOk 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   2400
      TabIndex        =   0
      Top             =   1260
      Width           =   1215
   End
   Begin MSComctlLib.ImageList ilIcônes 
      Left            =   0
      Top             =   1020
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   4
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMsgBoxTimer.frx":000C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMsgBoxTimer.frx":0326
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMsgBoxTimer.frx":0640
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMsgBoxTimer.frx":095A
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Image imgIcône 
      Appearance      =   0  'Flat
      Height          =   480
      Left            =   180
      Top             =   240
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
' Affiche une msgbox avec validation automatique au bout d'une durée choisie
' Permet de répondre aux messages auxquels on ne répond pas, comme un message
' indiquant qu'un programme fonctionne déjà…
' 15/08/1998 PV

Option Explicit

Public Sub MsgBoxTimer(Prompt As String, Optional Buttons As VbMsgBoxStyle = vbOKOnly, Optional Title As String, Optional iDurée As Integer = 30)
  Caption = Title
  lblMessage = Prompt
  Move (Screen.Width - Width) \ 2, (Screen.Height - Height) \ 2
  
  ' On affiche l'icône choisi
  Dim i As Integer
  Select Case Buttons And (vbCritical Or vbQuestion Or vbExclamation Or vbInformation)
    Case vbCritical:    i = 1
    Case vbQuestion:    i = 2
    Case vbExclamation: i = 3
    Case vbInformation: i = 4
  End Select
  If i Then
    Set imgIcône.Picture = ilIcônes.ListImages(i).ExtractIcon
  Else
    Set imgIcône.Picture = LoadPicture
  End If
  
  Timer1.Interval = 1000 * iDurée
  Timer1.Enabled = True
  Show vbModal
End Sub

Private Sub btnOk_Click()
  Timer1.Enabled = False
  Unload Me
End Sub

Private Sub Timer1_Timer()
  Timer1.Enabled = False
  Unload Me
End Sub
