VERSION 5.00
Begin VB.Form frmMsgBox2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Avertissement Microb'Soft"
   ClientHeight    =   2400
   ClientLeft      =   1905
   ClientTop       =   2610
   ClientWidth     =   5955
   Icon            =   "frmMsgBox2.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MousePointer    =   1  'Arrow
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2400
   ScaleWidth      =   5955
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
      Left            =   120
      Picture         =   "frmMsgBox2.frx":0442
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   4
      Top             =   780
      Width           =   480
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
      Left            =   780
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   3
      Top             =   480
      Width           =   5115
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
      Left            =   1680
      TabIndex        =   0
      Top             =   1980
      Width           =   1350
   End
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
      Left            =   3120
      TabIndex        =   1
      Top             =   1980
      Width           =   1350
   End
   Begin VB.Label lblCode 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   2040
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label lblAvertissement 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   780
      TabIndex        =   2
      Top             =   120
      Width           =   5115
   End
End
Attribute VB_Name = "frmMsgBox2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Variante de MsgBox, avec plus de place, une référence, et un accès à l'aide"
' frmMsgBox2
' Variante de MsgBox, avec plus de place, une référence, et un accès à l'aide
' PV
' 26/01/1999 PV Internationalisation
' 24/03/1999 PV lblCode (méthode précédente farfelue…)

Option Explicit

Private sAvertissement As String


Private Sub btnAide_Click()
  Aide lblCode.Caption
End Sub

Private Sub btnOk_Click()
  Unload Me
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub

Private Sub Form_Load()
  Internationalisation
End Sub




'========================================================
' Internationalisation

Public Sub Internationalisation()
  'sAvertissement = sGetIntlLib("lblAvertissement", "Avertissement")
  'Caption = sAvertissement & " - " & sNomApp
  Caption = sNomApp
  
  SetLib btnOk, "Caption", "btnOK"
  SetLib btnAide, "Caption", "btnAide"
  
  AjusteControle lblAvertissement
  AjusteControle txtMessage
End Sub
