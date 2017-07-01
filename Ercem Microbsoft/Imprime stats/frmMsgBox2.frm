VERSION 5.00
Begin VB.Form frmMsgBox2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Title"
   ClientHeight    =   2040
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7680
   Icon            =   "frmMsgBox2.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2040
   ScaleWidth      =   7680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3960
      TabIndex        =   3
      Top             =   1620
      Width           =   1065
   End
   Begin VB.CommandButton btnOk 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2520
      TabIndex        =   2
      Top             =   1620
      Width           =   1215
   End
   Begin VB.TextBox txtMessage 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1395
      Left            =   720
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   120
      Width           =   6855
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   60
      Picture         =   "frmMsgBox2.frx":0442
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   0
      Top             =   420
      Width           =   480
   End
End
Attribute VB_Name = "frmMsgBox2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmMsgBox2
' MsgBox avec un bouton d'aide
' 16/01/98 PV

Option Explicit

Private sHelpFile As String

Public Sub MsgBox2(ByVal Prompt As String, Buttons As VbMsgBoxStyle, ByVal Title As String, ByVal HelpFile As String)
  sHelpFile = HelpFile
  frmMsgBox2.Caption = Title
  frmMsgBox2.txtMessage = Prompt
  Show vbModal
End Sub


Private Sub btnAide_Click()
  FileShellExecute frmMsgBox2.hwnd, sHelpFile
End Sub

Private Sub btnOk_Click()
  Unload Me
End Sub
