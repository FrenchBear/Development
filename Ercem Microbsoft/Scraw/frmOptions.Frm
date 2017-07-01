VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options"
   ClientHeight    =   2520
   ClientLeft      =   2250
   ClientTop       =   4350
   ClientWidth     =   7830
   Icon            =   "frmOptions.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   168
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   522
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
      Left            =   6420
      TabIndex        =   12
      Tag             =   "Change la langue de l'interface"
      Top             =   1860
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
      Top             =   1860
      Width           =   5775
   End
   Begin VB.CheckBox chkAfficherEtiquettesDeBoutons 
      Caption         =   "&Légende des boutons"
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
      Left            =   420
      TabIndex        =   4
      Tag             =   "Affiche ou non un texte dans les boutons"
      Top             =   1080
      Width           =   5475
   End
   Begin VB.CheckBox chkNoWarningNC 
      Caption         =   "&Ne pas signaler l'utilisation des champs non imprimés sur un CRA"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   135
      TabIndex        =   5
      Tag             =   "Permet de ne pas signaler l'utilisation des nouveaux champs (affichés en jaune)"
      Top             =   1380
      Width           =   5775
   End
   Begin VB.CheckBox chkAfficherBarreDeBoutons 
      Caption         =   "&Barre de boutons"
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
      Left            =   135
      TabIndex        =   3
      Tag             =   "Affiche ou non la barre de boutons"
      Top             =   840
      Width           =   5775
   End
   Begin VB.CheckBox chkAfficherMenuSystème 
      Caption         =   "Menu &Système (mode avancé)"
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
      Left            =   135
      TabIndex        =   2
      Tag             =   "Affiche ou non le menu système (utile pour la DI)"
      Top             =   540
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
      Left            =   1815
      MaxLength       =   60
      TabIndex        =   1
      Tag             =   "Nom du programme à lancer, et chemin d'accès terminé par \"
      Top             =   60
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
      Left            =   6420
      TabIndex        =   9
      Tag             =   "Rétablit des options par défaut du programme"
      Top             =   900
      Width           =   1350
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
      Left            =   6420
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
      Left            =   6420
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
      Left            =   6420
      TabIndex        =   10
      Top             =   1380
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   11
      Top             =   2205
      Width           =   7830
      _ExtentX        =   13811
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
   Begin VB.Label lblPrefixe 
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
      Left            =   135
      TabIndex        =   0
      Top             =   120
      Width           =   1635
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de saisie des options générales de la siaisie des CRA sous Windows"
' frmOptions
' Feuille de saisie des options générales de la siaisie des RA sous Windows
' 26/02/1997 PV Barre de boutons
' 24/10/1997 PV Possibilité de ne pas signaler l'utilisation des champs non imprimés sur un RA
' 10/04/1998 PV Masquage du cadenas dans la barre d'état
' 01/02/1999 NC Internationalisation

Option Explicit

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
  chkAfficherMenuSystème = 0
  chkAfficherBarreDeBoutons = 0
  chkNoWarningNC = 0
End Sub

Private Sub btnLangue_Click()
  IntlSélectionneLangage
End Sub

Private Sub btnOk_Click()
  Dim iOptionsGénérales As Integer
  
  iOptionsGénérales = 0
  
'  If chkNoWarningNC Then
'    bNoWarningNC = True
'    iOptionsGénérales = iOptionsGénérales + 1
'  Else
'    bNoWarningNC = False
'  End If

  If chkAfficherMenuSystème Then
    bAfficherMenuSystème = True
    iOptionsGénérales = iOptionsGénérales + 2
  Else
    bAfficherMenuSystème = False
  End If
  
  If chkAfficherBarreDeBoutons Then
    bAfficherBarreDeBoutons = True
    iOptionsGénérales = iOptionsGénérales + 8
  Else
    bAfficherBarreDeBoutons = False
  End If
  
  If chkAfficherEtiquettesDeBoutons Then
    bAfficherEtiquettesDeBoutons = True
    iOptionsGénérales = iOptionsGénérales + 4
  Else
    bAfficherEtiquettesDeBoutons = False
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
  chkAfficherMenuSystème = IIf(bAfficherMenuSystème, vbChecked, vbUnchecked)
  chkAfficherBarreDeBoutons = IIf(bAfficherBarreDeBoutons, vbChecked, vbUnchecked)
  chkAfficherEtiquettesDeBoutons = IIf(bAfficherEtiquettesDeBoutons, vbChecked, vbUnchecked)
'  chkNoWarningNC = IIf(bNoWarningNC, vbChecked, vbUnchecked)
  chkMasquerBloqué = IIf(bMasquerBloqué, vbChecked, vbUnchecked)
  txtPréfixeAide = sPréfixeAide
End Sub

Public Sub InitOptions()
  Dim iOptionsGénérales As Integer
  
  iOptionsGénérales = GetSetting(sApplicationGlobale, "Options", "OptionsGénérales", 12)
  sPréfixeAide = GetSetting(sApplicationGlobale, "Options", "PréfixeAide", sPréfixeAideDéfaut)
  sPréfixeAide = Replace(sPréfixeAide, "ercem.com", "silliker")
  
'  bNoWarningNC = (iOptionsGénérales And 1) <> 0
  bAfficherMenuSystème = (iOptionsGénérales And 2) <> 0
  bAfficherEtiquettesDeBoutons = (iOptionsGénérales And 4) <> 0
  bAfficherBarreDeBoutons = (iOptionsGénérales And 8) <> 0
  bMasquerBloqué = (iOptionsGénérales And 16) <> 0
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

Private Sub chkAfficherMenuSystème_GotFocus(): GotFocus: End Sub
Private Sub chkAfficherBarreDeBoutons_GotFocus(): GotFocus: End Sub
Private Sub chkAfficherEtiquettesDeBoutons_GotFocus(): GotFocus: End Sub
Private Sub chkNoWarningNC_GotFocus(): GotFocus: End Sub
Private Sub chkMasquerBloqué_GotFocus(): GotFocus: End Sub
Private Sub txtPréfixeAide_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnDéfaut_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub



' ==============================================================================
' Quelques options sont accessibles directement depuis les barres de boutons…

Public Sub PasDeBarreDeBoutons()
  Dim iOptionsGénérales As Integer
  
  iOptionsGénérales = GetSetting(sApplicationGlobale, "Options", "OptionsGénérales", 0)
  iOptionsGénérales = iOptionsGénérales And Not 8
  SaveSetting sApplicationGlobale, "Options", "OptionsGénérales", iOptionsGénérales
  bAfficherBarreDeBoutons = False
End Sub


Public Sub AfficherEtiquettesDeBoutons(ByVal bOkAffichage As Boolean)
  Dim iOptionsGénérales As Integer
  
  iOptionsGénérales = GetSetting(sApplicationGlobale, "Options", "OptionsGénérales", 0)
  If bOkAffichage Then
    iOptionsGénérales = iOptionsGénérales Or 4
  Else
    iOptionsGénérales = iOptionsGénérales And Not 4
  End If
  SaveSetting sApplicationGlobale, "Options", "OptionsGénérales", iOptionsGénérales
  bAfficherEtiquettesDeBoutons = bOkAffichage
End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "OSCaption"
  
  SetLib btnOk, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnDéfaut, "Caption", "btnDéfaut"
  SetLib btnDéfaut, "Tag", "btnDéfaut.tag"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnLangue, "Tag", "btnLangue.tag"
  
  btnLangue.Caption = sGetIntlLib("btnLangue", "&Langue") & " (" & cLangage & ")"
  AjusteControle btnLangue
  
  SetLib lblPrefixe, "Caption", "OSlblPrefixe"
  SetLib txtPréfixeAide, "Tag", "OStxtPréfixeAide.tag"
  SetLib chkAfficherMenuSystème, "Caption", "OSchkAfficherMS"
  SetLib chkAfficherMenuSystème, "Tag", "OSchkAfficherMS.tag"
  SetLib chkAfficherBarreDeBoutons, "Caption", "OSchkAfficherBDB"
  SetLib chkAfficherBarreDeBoutons, "Tag", "OSchkAfficherBDB.tag"
  SetLib chkAfficherEtiquettesDeBoutons, "Caption", "OSchkAfficherEDB"
  SetLib chkAfficherEtiquettesDeBoutons, "Tag", "OSchkAfficherEDB.tag"
  SetLib chkNoWarningNC, "Caption", "OSchkNoWarningNC"
  SetLib chkNoWarningNC, "Tag", "OSchkNoWarningNC.tag"
  SetLib chkMasquerBloqué, "Caption", "OSchkMasquerBloqué"
  SetLib chkMasquerBloqué, "Tag", "OSchkMasquerBloq.tag"
  
End Sub

