VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options"
   ClientHeight    =   3075
   ClientLeft      =   2250
   ClientTop       =   4350
   ClientWidth     =   7995
   Icon            =   "frmOptions.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   205
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   533
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
      Left            =   6540
      TabIndex        =   12
      Top             =   2100
      Width           =   1350
   End
   Begin VB.CheckBox chkMasquerBloqué 
      Caption         =   "&Masquer l'indicateur bloqué / relâché"
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
      Left            =   120
      TabIndex        =   6
      Tag             =   "Masque le cadenas dans la barre d'état"
      Top             =   2460
      Width           =   5775
   End
   Begin VB.CheckBox chkAfficherBarreDeBoutons 
      Caption         =   "Afficher la &barre de boutons"
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
      Left            =   120
      TabIndex        =   5
      Tag             =   "Affiche ou non la barre de boutons"
      Top             =   2040
      Width           =   5775
   End
   Begin VB.CheckBox chkDemanderNbExQuandImpression 
      Caption         =   "&Choix du nombre d'exemplaires à l'impression pour les journaux et les étiquettes"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   120
      TabIndex        =   4
      Tag             =   "1 exemplaire par défaut si l'option n'est pas cochée"
      Top             =   1500
      Width           =   5775
   End
   Begin VB.CheckBox chkAfficherMenuSystème 
      Caption         =   "Afficher le menu &Système"
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
      Left            =   120
      TabIndex        =   3
      Tag             =   "Affiche ou non le menu système (utile pour la DI)"
      Top             =   1200
      Width           =   5775
   End
   Begin VB.TextBox txtPréfixeAide 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1800
      MaxLength       =   60
      TabIndex        =   2
      Tag             =   "Nom du programme à lancer, et chemin d'accès terminé par \"
      Top             =   720
      Width           =   4515
   End
   Begin VB.CommandButton btnDéfaut 
      Caption         =   "&Défaut"
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
      Left            =   6540
      TabIndex        =   9
      Top             =   900
      Width           =   1350
   End
   Begin VB.CheckBox chkPasSignalerEcartUnité 
      Caption         =   "&Ne pas signaler les écarts d'unité entre le fichier établissement et les interventions"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   120
      TabIndex        =   0
      Tag             =   "Ne pas avertir des écarts d'unité lors de l'ajout d'intervention"
      Top             =   120
      Width           =   5775
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
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
      Left            =   6540
      TabIndex        =   8
      Top             =   480
      Width           =   1350
   End
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
      Left            =   6540
      TabIndex        =   7
      Top             =   60
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
      Left            =   6540
      TabIndex        =   10
      Top             =   1500
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   11
      Top             =   2760
      Width           =   7995
      _ExtentX        =   14102
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
   Begin VB.Label lblPréfixeAide 
      AutoSize        =   -1  'True
      Caption         =   "&Préfixe de l'aide :"
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
      Left            =   120
      TabIndex        =   1
      Top             =   780
      Width           =   1635
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Options générales des plannings"
' Feuille frmOptions
' Options générales des plannings
' 26/02/1997 PV Barre de boutons
' 20/04/1998 PV Masquage de l'indicateur bloqué/relâché
' 20/01/1999 PV Internationalisation

Option Explicit

Const iOptionsDéfaut = 8             ' Barre de boutons

' Le bouton Aide tient compte du nouveau préfixe immédiatement, cela permet de tester…
Private Sub btnAide_Click()
  Dim sOldPréfixeAide As String
  sOldPréfixeAide = sPréfixeAide
  sPréfixeAide = txtPréfixeAide
  Aide "frmopt"
  sPréfixeAide = sOldPréfixeAide
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnDéfaut_Click()
  txtPréfixeAide = sPréfixeAideDéfaut
  chkPasSignalerEcartUnité = 0
  chkAfficherMenuSystème = 0
  chkAfficherBarreDeBoutons = 0
  chkDemanderNbExQuandImpression = 0
End Sub


Private Sub btnLangue_Click()
  IntlSélectionneLangage
  GotFocus
End Sub


Private Sub btnOK_Click()
  Dim iOptionsGénérales As Integer
  
  iOptionsGénérales = 0
  If chkPasSignalerEcartUnité Then
    bPasSignalerEcartUnité = True
    iOptionsGénérales = iOptionsGénérales + 1
  Else
    bPasSignalerEcartUnité = False
  End If
  
  If chkAfficherMenuSystème Then
    bAfficherMenuSystème = True
    iOptionsGénérales = iOptionsGénérales + 2
  Else
    bAfficherMenuSystème = False
  End If
  
  If chkDemanderNbExQuandImpression Then
    bDemanderNbExQuandImpression = True
    iOptionsGénérales = iOptionsGénérales + 4
  Else
    bDemanderNbExQuandImpression = False
  End If
  
  If chkAfficherBarreDeBoutons Then
    bAfficherBarreDeBoutons = True
    iOptionsGénérales = iOptionsGénérales + 8
  Else
    bAfficherBarreDeBoutons = False
  End If
  
  If chkMasquerBloqué Then
    bMasquerBloqué = True
    iOptionsGénérales = iOptionsGénérales + 16
  Else
    bMasquerBloqué = False
  End If
  
  sPréfixeAide = txtPréfixeAide
    
  SaveSetting sApplicationGlobale, "Options", "OptionsGénérales", iOptionsGénérales
  SaveSetting sApplicationGlobale, "Options", "PréfixeAide", sPréfixeAide
  Unload Me
End Sub

Private Sub Form_Load()
  Internationalisation
  
  chkPasSignalerEcartUnité = IIf(bPasSignalerEcartUnité, 1, 0)
  chkAfficherMenuSystème = IIf(bAfficherMenuSystème, 1, 0)
  chkAfficherBarreDeBoutons = IIf(bAfficherBarreDeBoutons, 1, 0)
  chkDemanderNbExQuandImpression = IIf(bDemanderNbExQuandImpression, 1, 0)
  chkMasquerBloqué = IIf(bMasquerBloqué, vbChecked, vbUnchecked)
  txtPréfixeAide = sPréfixeAide
End Sub

Public Sub InitOptions()
  Dim iOptionsGénérales As Integer
  
  iOptionsGénérales = GetSetting(sApplicationGlobale, "Options", "OptionsGénérales", iOptionsDéfaut)
  sPréfixeAide = GetSetting(sApplicationGlobale, "Options", "PréfixeAide", sPréfixeAideDéfaut)
  sPréfixeAide = Replace(sPréfixeAide, "ercem.com", "silliker", , , vbTextCompare)
  bPasSignalerEcartUnité = (iOptionsGénérales And 1) <> 0
  bAfficherMenuSystème = (iOptionsGénérales And 2) <> 0
  bDemanderNbExQuandImpression = (iOptionsGénérales And 4) <> 0
  bAfficherBarreDeBoutons = (iOptionsGénérales And 8) <> 0
  bMasquerBloqué = (iOptionsGénérales And 16) <> 0
  
  If sPréfixeAide = "http://www.silliker/microbsoft/" Then
    sPréfixeAide = "http://www.silliker/microbsoft/secretariat/"
    SaveSetting sApplicationGlobale, "Options", "PréfixeAide", sPréfixeAide
  End If
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub


Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  
  On Error GoTo FinGotFocus
  ActiveControl.SelStart = 0
  ActiveControl.SelLength = 100
FinGotFocus:
End Sub

Private Sub chkPasSignalerEcartUnité_GotFocus(): GotFocus: End Sub
Private Sub chkAfficherMenuSystème_GotFocus(): GotFocus: End Sub
Private Sub chkDemanderNbExQuandImpression_GotFocus(): GotFocus: End Sub
Private Sub chkAfficherBarreDeBoutons_GotFocus(): GotFocus: End Sub
Private Sub chkMasquerBloqué_GotFocus(): GotFocus: End Sub
Private Sub txtPréfixeAide_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnDéfaut_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub
Private Sub btnLangue_GotFocus(): GotFocus: End Sub



' ==============================================================================
' Quelques options sont accessibles directement depuis les barres de boutons…

Public Sub PasDeBarreDeBoutons()
  Dim iOptionsGénérales As Integer
  
  iOptionsGénérales = GetSetting(sApplicationGlobale, "Options", "OptionsGénérales", 0)
  iOptionsGénérales = iOptionsGénérales And Not 8
  SaveSetting sApplicationGlobale, "Options", "OptionsGénérales", iOptionsGénérales
  bAfficherBarreDeBoutons = False
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "OPCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnDéfaut, "Caption", "btnDéfaut"
  btnLangue.Caption = sGetIntlLib("btnLangue", "&Langue") & " (" & cLangage & ")"
  AjusteControle btnLangue
  
  SetLib btnAide, "Tag", "OPbtnAide.tag"
  SetLib btnLangue, "Tag", "OPbtnLangue.tag"
  
  SetLib chkPasSignalerEcartUnité, "Caption", "OPchkPasSignalerEU"
  SetLib chkPasSignalerEcartUnité, "Tag", "OPchkPasSignalerEU.t"
  
  SetLib lblPréfixeAide, "Caption", "OPlblPréfixeAide"
  SetLib txtPréfixeAide, "Tag", "OPtxtPréfixeAide.tag"
  
  SetLib chkAfficherMenuSystème, "Caption", "OPchkAfficherMS"
  SetLib chkAfficherMenuSystème, "Tag", "OPchkAfficherMS.tag"
  
  SetLib chkDemanderNbExQuandImpression, "Caption", "OPchkDemanderNbExImp"
  SetLib chkDemanderNbExQuandImpression, "Tag", "OPchkDemNbEx.tag"
  
  SetLib chkAfficherBarreDeBoutons, "Caption", "OPchkAfficherBB"
  SetLib chkAfficherBarreDeBoutons, "Tag", "OPchkAfficherBB.tag"
  
  SetLib chkMasquerBloqué, "Caption", "OPchkMasquerBloqué"
  SetLib chkMasquerBloqué, "Tag", "OPchkMasqBloq.tag"
End Sub

