VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmRetards 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Documents en retard"
   ClientHeight    =   3345
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7005
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmRetards.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3345
   ScaleWidth      =   7005
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtDélai 
      Height          =   315
      Index           =   5
      Left            =   4080
      TabIndex        =   13
      Tag             =   "Entrez le N° CRA 1 à 99, vide pour une EH"
      Top             =   1860
      Width           =   600
   End
   Begin VB.TextBox txtDélai 
      Height          =   315
      Index           =   4
      Left            =   4080
      TabIndex        =   11
      Tag             =   "Entrez le N° CRA 1 à 99, vide pour une EH"
      Top             =   1560
      Width           =   600
   End
   Begin VB.TextBox txtDélai 
      Height          =   315
      Index           =   3
      Left            =   4080
      TabIndex        =   9
      Tag             =   "Entrez le N° CRA 1 à 99, vide pour une EH"
      Top             =   1260
      Width           =   600
   End
   Begin VB.TextBox txtDélai 
      Height          =   315
      Index           =   2
      Left            =   4080
      TabIndex        =   7
      Tag             =   "Entrez le N° CRA 1 à 99, vide pour une EH"
      Top             =   960
      Width           =   600
   End
   Begin VB.TextBox txtDélai 
      Height          =   315
      Index           =   1
      Left            =   4080
      TabIndex        =   5
      Tag             =   "Entrez le N° CRA 1 à 99, vide pour une EH"
      Top             =   660
      Width           =   600
   End
   Begin VB.TextBox txtDélai 
      Height          =   315
      Index           =   0
      Left            =   4080
      TabIndex        =   3
      Tag             =   "Entrez le N° CRA 1 à 99, vide pour une EH"
      Top             =   360
      Width           =   600
   End
   Begin VB.CheckBox chkEtat 
      Caption         =   "6 Attente d'envoi"
      Height          =   195
      Index           =   5
      Left            =   60
      TabIndex        =   12
      Top             =   1920
      Width           =   3795
   End
   Begin VB.CheckBox chkEtat 
      Caption         =   "5 Attente d'édition définitive"
      Height          =   195
      Index           =   4
      Left            =   60
      TabIndex        =   10
      Top             =   1620
      Width           =   3795
   End
   Begin VB.CheckBox chkEtat 
      Caption         =   "4 Attente de résultats labo"
      Height          =   195
      Index           =   3
      Left            =   60
      TabIndex        =   8
      Top             =   1320
      Width           =   3795
   End
   Begin VB.CheckBox chkEtat 
      Caption         =   "3 Attente de validation assistant"
      Height          =   195
      Index           =   2
      Left            =   60
      TabIndex        =   6
      Top             =   1020
      Width           =   3795
   End
   Begin VB.CheckBox chkEtat 
      Caption         =   "2 Attente d'édition de relecture"
      Height          =   195
      Index           =   1
      Left            =   60
      TabIndex        =   4
      Top             =   720
      Width           =   3795
   End
   Begin VB.CheckBox chkEtat 
      Caption         =   "0 Attente de saisie"
      Height          =   195
      Index           =   0
      Left            =   60
      TabIndex        =   1
      Top             =   420
      Width           =   3795
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   5595
      TabIndex        =   20
      Top             =   1020
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   5595
      TabIndex        =   19
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   5595
      TabIndex        =   18
      Top             =   60
      Width           =   1350
   End
   Begin VB.ComboBox cboType 
      Height          =   330
      ItemData        =   "frmRetards.frx":0442
      Left            =   2160
      List            =   "frmRetards.frx":044C
      Style           =   2  'Dropdown List
      TabIndex        =   17
      Top             =   2640
      Width           =   1215
   End
   Begin VB.TextBox txtLettres 
      Height          =   315
      Left            =   2160
      TabIndex        =   15
      Tag             =   "Entrez le N° CRA 1 à 99, vide pour une EH"
      Top             =   2280
      Width           =   1200
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   21
      Top             =   3030
      Width           =   7005
      _ExtentX        =   12356
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "à J+ (ou plus)"
      Height          =   210
      Left            =   4080
      TabIndex        =   2
      Top             =   120
      Width           =   1290
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Sélectionner les documents à l'état :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   3450
   End
   Begin VB.Label lblTypeDocument 
      AutoSize        =   -1  'True
      Caption         =   "&Type de document :"
      Height          =   210
      Left            =   60
      TabIndex        =   16
      Top             =   2700
      Width           =   1875
   End
   Begin VB.Label lblLettres 
      AutoSize        =   -1  'True
      Caption         =   "&Lettres :"
      Height          =   210
      Left            =   60
      TabIndex        =   14
      Top             =   2340
      Width           =   810
   End
End
Attribute VB_Name = "frmRetards"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmRetards
' Sélection de documents en retard
' 02/02/1999 PV

Option Explicit



' Point d'entrée
Public Sub DoForm()
  Show vbModal
End Sub


Private Sub btnOk_Click()
  MsgBox "A implanter"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnAide_Click()
  Aide "frmdret"
End Sub




Private Sub Form_Load()
  Internationalisation
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub


Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Then AutoSelect ActiveControl
End Sub

Private Sub cboTypeDocument_GotFocus(): GotFocus: End Sub
Private Sub txtNoDocument_GotFocus(): GotFocus: End Sub
Private Sub txtClé_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub


'===========================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "DRCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  '''
End Sub

