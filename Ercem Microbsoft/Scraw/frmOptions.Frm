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
   Begin VB.CheckBox chkMasquerBloqu� 
      Caption         =   "&Masquer l'indicateur bloqu� / rel�ch�"
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
      Tag             =   "Masque le cadenas dans la barre d'�tat"
      Top             =   1860
      Width           =   5775
   End
   Begin VB.CheckBox chkAfficherEtiquettesDeBoutons 
      Caption         =   "&L�gende des boutons"
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
      Caption         =   "&Ne pas signaler l'utilisation des champs non imprim�s sur un CRA"
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
      Tag             =   "Permet de ne pas signaler l'utilisation des nouveaux champs (affich�s en jaune)"
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
   Begin VB.CheckBox chkAfficherMenuSyst�me 
      Caption         =   "Menu &Syst�me (mode avanc�)"
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
      Tag             =   "Affiche ou non le menu syst�me (utile pour la DI)"
      Top             =   540
      Width           =   5775
   End
   Begin VB.TextBox txtPr�fixeAide 
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
      Tag             =   "Nom du programme � lancer, et chemin d'acc�s termin� par \"
      Top             =   60
      Width           =   4515
   End
   Begin VB.CommandButton btnD�faut 
      Caption         =   "&D�faut"
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
      Tag             =   "R�tablit des options par d�faut du programme"
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
      Caption         =   "&Pr�fixe de l'aide :"
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
Attribute VB_Description = "Feuille de saisie des options g�n�rales de la siaisie des CRA sous Windows"
' frmOptions
' Feuille de saisie des options g�n�rales de la siaisie des RA sous Windows
' 26/02/1997 PV Barre de boutons
' 24/10/1997 PV Possibilit� de ne pas signaler l'utilisation des champs non imprim�s sur un RA
' 10/04/1998 PV Masquage du cadenas dans la barre d'�tat
' 01/02/1999 NC Internationalisation

Option Explicit

' Le bouton Aide tient compte du nouveau pr�fixe imm�diatement, cela permet de tester�
Private Sub btnAide_Click()
  Dim sOldPr�fixeAide As String
  sOldPr�fixeAide = sPr�fixeAide
  sPr�fixeAide = txtPr�fixeAide
  Aide "frmopt"
  sPr�fixeAide = sOldPr�fixeAide
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnD�faut_Click()
  txtPr�fixeAide = sPr�fixeAideD�faut
  chkAfficherMenuSyst�me = 0
  chkAfficherBarreDeBoutons = 0
  chkNoWarningNC = 0
End Sub

Private Sub btnLangue_Click()
  IntlS�lectionneLangage
End Sub

Private Sub btnOk_Click()
  Dim iOptionsG�n�rales As Integer
  
  iOptionsG�n�rales = 0
  
'  If chkNoWarningNC Then
'    bNoWarningNC = True
'    iOptionsG�n�rales = iOptionsG�n�rales + 1
'  Else
'    bNoWarningNC = False
'  End If

  If chkAfficherMenuSyst�me Then
    bAfficherMenuSyst�me = True
    iOptionsG�n�rales = iOptionsG�n�rales + 2
  Else
    bAfficherMenuSyst�me = False
  End If
  
  If chkAfficherBarreDeBoutons Then
    bAfficherBarreDeBoutons = True
    iOptionsG�n�rales = iOptionsG�n�rales + 8
  Else
    bAfficherBarreDeBoutons = False
  End If
  
  If chkAfficherEtiquettesDeBoutons Then
    bAfficherEtiquettesDeBoutons = True
    iOptionsG�n�rales = iOptionsG�n�rales + 4
  Else
    bAfficherEtiquettesDeBoutons = False
  End If
  
  If chkMasquerBloqu� Then
    bMasquerBloqu� = True
    iOptionsG�n�rales = iOptionsG�n�rales + 16
  Else
    bMasquerBloqu� = False
  End If

  sPr�fixeAide = txtPr�fixeAide
    
  SaveSetting sApplicationGlobale, "Options", "OptionsG�n�rales", iOptionsG�n�rales
  SaveSetting sApplicationGlobale, "Options", "Pr�fixeAide", sPr�fixeAide
  Unload Me
End Sub

Private Sub Form_Load()
  Internationalisation
  chkAfficherMenuSyst�me = IIf(bAfficherMenuSyst�me, vbChecked, vbUnchecked)
  chkAfficherBarreDeBoutons = IIf(bAfficherBarreDeBoutons, vbChecked, vbUnchecked)
  chkAfficherEtiquettesDeBoutons = IIf(bAfficherEtiquettesDeBoutons, vbChecked, vbUnchecked)
'  chkNoWarningNC = IIf(bNoWarningNC, vbChecked, vbUnchecked)
  chkMasquerBloqu� = IIf(bMasquerBloqu�, vbChecked, vbUnchecked)
  txtPr�fixeAide = sPr�fixeAide
End Sub

Public Sub InitOptions()
  Dim iOptionsG�n�rales As Integer
  
  iOptionsG�n�rales = GetSetting(sApplicationGlobale, "Options", "OptionsG�n�rales", 12)
  sPr�fixeAide = GetSetting(sApplicationGlobale, "Options", "Pr�fixeAide", sPr�fixeAideD�faut)
  sPr�fixeAide = Replace(sPr�fixeAide, "ercem.com", "silliker")
  
'  bNoWarningNC = (iOptionsG�n�rales And 1) <> 0
  bAfficherMenuSyst�me = (iOptionsG�n�rales And 2) <> 0
  bAfficherEtiquettesDeBoutons = (iOptionsG�n�rales And 4) <> 0
  bAfficherBarreDeBoutons = (iOptionsG�n�rales And 8) <> 0
  bMasquerBloqu� = (iOptionsG�n�rales And 16) <> 0
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

Private Sub chkAfficherMenuSyst�me_GotFocus(): GotFocus: End Sub
Private Sub chkAfficherBarreDeBoutons_GotFocus(): GotFocus: End Sub
Private Sub chkAfficherEtiquettesDeBoutons_GotFocus(): GotFocus: End Sub
Private Sub chkNoWarningNC_GotFocus(): GotFocus: End Sub
Private Sub chkMasquerBloqu�_GotFocus(): GotFocus: End Sub
Private Sub txtPr�fixeAide_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnD�faut_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub



' ==============================================================================
' Quelques options sont accessibles directement depuis les barres de boutons�

Public Sub PasDeBarreDeBoutons()
  Dim iOptionsG�n�rales As Integer
  
  iOptionsG�n�rales = GetSetting(sApplicationGlobale, "Options", "OptionsG�n�rales", 0)
  iOptionsG�n�rales = iOptionsG�n�rales And Not 8
  SaveSetting sApplicationGlobale, "Options", "OptionsG�n�rales", iOptionsG�n�rales
  bAfficherBarreDeBoutons = False
End Sub


Public Sub AfficherEtiquettesDeBoutons(ByVal bOkAffichage As Boolean)
  Dim iOptionsG�n�rales As Integer
  
  iOptionsG�n�rales = GetSetting(sApplicationGlobale, "Options", "OptionsG�n�rales", 0)
  If bOkAffichage Then
    iOptionsG�n�rales = iOptionsG�n�rales Or 4
  Else
    iOptionsG�n�rales = iOptionsG�n�rales And Not 4
  End If
  SaveSetting sApplicationGlobale, "Options", "OptionsG�n�rales", iOptionsG�n�rales
  bAfficherEtiquettesDeBoutons = bOkAffichage
End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "OSCaption"
  
  SetLib btnOk, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnD�faut, "Caption", "btnD�faut"
  SetLib btnD�faut, "Tag", "btnD�faut.tag"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnLangue, "Tag", "btnLangue.tag"
  
  btnLangue.Caption = sGetIntlLib("btnLangue", "&Langue") & " (" & cLangage & ")"
  AjusteControle btnLangue
  
  SetLib lblPrefixe, "Caption", "OSlblPrefixe"
  SetLib txtPr�fixeAide, "Tag", "OStxtPr�fixeAide.tag"
  SetLib chkAfficherMenuSyst�me, "Caption", "OSchkAfficherMS"
  SetLib chkAfficherMenuSyst�me, "Tag", "OSchkAfficherMS.tag"
  SetLib chkAfficherBarreDeBoutons, "Caption", "OSchkAfficherBDB"
  SetLib chkAfficherBarreDeBoutons, "Tag", "OSchkAfficherBDB.tag"
  SetLib chkAfficherEtiquettesDeBoutons, "Caption", "OSchkAfficherEDB"
  SetLib chkAfficherEtiquettesDeBoutons, "Tag", "OSchkAfficherEDB.tag"
  SetLib chkNoWarningNC, "Caption", "OSchkNoWarningNC"
  SetLib chkNoWarningNC, "Tag", "OSchkNoWarningNC.tag"
  SetLib chkMasquerBloqu�, "Caption", "OSchkMasquerBloqu�"
  SetLib chkMasquerBloqu�, "Tag", "OSchkMasquerBloq.tag"
  
End Sub

