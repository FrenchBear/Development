VERSION 5.00
Begin VB.Form frmAPropos 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "A propos d'AfficheImage"
   ClientHeight    =   1515
   ClientLeft      =   3165
   ClientTop       =   2160
   ClientWidth     =   7185
   ControlBox      =   0   'False
   Icon            =   "frmAPropos.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1515
   ScaleWidth      =   7185
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnOK 
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
      Left            =   3480
      TabIndex        =   2
      Top             =   1080
      Width           =   1065
   End
   Begin VB.Image Image1 
      Height          =   1140
      Left            =   240
      Picture         =   "frmAPropos.frx":000C
      Stretch         =   -1  'True
      Top             =   160
      Width           =   975
   End
   Begin VB.Image imgAuteur 
      Height          =   570
      Left            =   360
      Picture         =   "frmAPropos.frx":044E
      Stretch         =   -1  'True
      Top             =   360
      Visible         =   0   'False
      Width           =   435
   End
   Begin VB.Label lblBuild 
      AutoSize        =   -1  'True
      Caption         =   "Build :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1500
      TabIndex        =   3
      Top             =   800
      Width           =   555
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "(c) 1997  P.VIOLENT"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1500
      TabIndex        =   1
      Top             =   470
      Width           =   1755
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "AfficheImage - Programme d'affichage d'images simple"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1500
      TabIndex        =   0
      Top             =   180
      Width           =   5490
   End
End
Attribute VB_Name = "frmAPropos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnOK_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Move (Screen.Width - Width) / 2, (Screen.Height - Height) / 2
  lblBuild = "Version " & App.Major & "." & App.Minor & "." & App.Revision
End Sub

Private Sub Image1_Click()
  Image1.Stretch = True
  Image1.Picture = imgAuteur.Picture
End Sub

