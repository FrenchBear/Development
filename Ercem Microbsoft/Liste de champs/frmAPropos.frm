VERSION 5.00
Begin VB.Form frmAPropos 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "A propos de…"
   ClientHeight    =   1620
   ClientLeft      =   1740
   ClientTop       =   2055
   ClientWidth     =   5490
   Icon            =   "frmAPropos.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1620
   ScaleWidth      =   5490
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnOK 
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
      Left            =   2580
      TabIndex        =   2
      Top             =   1140
      Width           =   1065
   End
   Begin VB.Label lblBuild 
      AutoSize        =   -1  'True
      Caption         =   "Version :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1500
      TabIndex        =   3
      Top             =   780
      Width           =   840
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   1275
      Left            =   120
      Picture         =   "frmAPropos.frx":014A
      Top             =   120
      Width           =   1110
   End
   Begin VB.Image imgAuteur 
      Height          =   570
      Left            =   180
      Picture         =   "frmAPropos.frx":44A0
      Stretch         =   -1  'True
      Top             =   180
      Visible         =   0   'False
      Width           =   435
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "(c) 1997  Groupe ERCEM / P.VIOLENT"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1500
      TabIndex        =   1
      Top             =   420
      Width           =   3480
   End
   Begin VB.Label lblTitre 
      AutoSize        =   -1  'True
      Caption         =   "Editeur de liste de colonnes"
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
      Top             =   120
      Width           =   2715
   End
End
Attribute VB_Name = "frmAPropos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmAPropos
' Boîte à propos générique pour les clients Microb'Soft
' octobre 96 PV
' 2/9/97 Version générique

Option Explicit

Private Sub btnOK_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Move (Screen.Width - Width) / 2, (Screen.Height - Height) / 2
  'lblTitre = sNomApp
  lblBuild = "Version " & App.Major & "." & App.Minor & "." & App.Revision
End Sub

Private Sub Image1_Click()
  Image1.Stretch = True
  Image1.Picture = imgAuteur.Picture
End Sub

