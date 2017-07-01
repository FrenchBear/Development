VERSION 5.00
Begin VB.Form frmSplash 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1455
   ClientLeft      =   2580
   ClientTop       =   2670
   ClientWidth     =   5985
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1455
   ScaleWidth      =   5985
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnLangue 
      Caption         =   "&Langue"
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
      Left            =   3840
      TabIndex        =   2
      Tag             =   "Change la langue de l'interface"
      Top             =   3120
      Width           =   1350
   End
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
      Left            =   960
      TabIndex        =   0
      Top             =   3120
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
      Left            =   2400
      TabIndex        =   1
      Top             =   3120
      Width           =   1350
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   1350
      Left            =   60
      Picture         =   "frmSplash.frx":0000
      Top             =   60
      Width           =   1125
   End
   Begin VB.Label lblBienvenue 
      Caption         =   "Bienvenue"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2400
      Left            =   1320
      TabIndex        =   5
      Top             =   600
      Visible         =   0   'False
      Width           =   5490
   End
   Begin VB.Label lblChargement 
      AutoSize        =   -1  'True
      Caption         =   "Chargement en cours, patientez…"
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
      Left            =   1320
      TabIndex        =   4
      Top             =   600
      Width           =   3240
   End
   Begin VB.Label lblTitre 
      AutoSize        =   -1  'True
      Caption         =   "Microb'Soft - xxx"
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
      Left            =   1320
      TabIndex        =   3
      Top             =   180
      Width           =   1695
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille affichée pendant le chargement initial d'un programme Microb'Soft"
' frmSplash
' Feuille affichée pendant le chargement initial du programme Microb'Soft
' Pour patienter, et dissuader les utilisateurs de cliquer sur menus et boutons pendant ce temps
' PV Octobre 96
'  1/02/1999 PV Internationalisation

Option Explicit

Private Sub btnAide_Click()
  Aide "frmintro"
End Sub

Private Sub btnLangue_Click()
  Dim cSauveLangage As String

  cSauveLangage = cLangage
  IntlSélectionneLangage
  If cSauveLangage <> cLangage Then Unload Me
End Sub

Private Sub btnOk_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  lblTitre = sNomApp
  Move (Screen.Width - Width) \ 2, (Screen.Height - Height) \ 2 - 800
  
  Internationalisation
End Sub


Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  lblChargement = sGetIntlLib("Chargement", "Chargement en cours, patientez…")
  btnLangue.Caption = sGetIntlLib("btnLangue", "&Langue") & " (" & cLangage & ")"
  AjusteControle btnLangue
End Sub

