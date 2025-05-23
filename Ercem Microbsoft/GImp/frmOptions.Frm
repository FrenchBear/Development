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
      TabIndex        =   11
      Tag             =   "Change la langue de l'interface"
      Top             =   2100
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
      Left            =   60
      TabIndex        =   5
      Tag             =   "Masque le cadenas dans la barre d'�tat"
      Top             =   1860
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
      Left            =   60
      TabIndex        =   4
      Tag             =   "Affiche ou non la barre de boutons"
      Top             =   1440
      Width           =   5775
   End
   Begin VB.CheckBox chkDemanderNbExQuandImpression 
      Caption         =   "&Choix du nombre d'exemplaires � l'impression pour les journaux et les �tiquettes"
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
      Left            =   60
      TabIndex        =   3
      Tag             =   "1 exemplaire par d�faut si l'option n'est pas coch�e"
      Top             =   900
      Width           =   5775
   End
   Begin VB.CheckBox chkAfficherMenuSyst�me 
      Caption         =   "Afficher le menu &Syst�me"
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
      Left            =   60
      TabIndex        =   2
      Tag             =   "Affiche ou non le menu syst�me (utile pour la DI)"
      Top             =   600
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
      Left            =   1740
      MaxLength       =   60
      TabIndex        =   1
      Tag             =   "Nom du programme � lancer, et chemin d'acc�s termin� par \"
      Top             =   120
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
      Left            =   6540
      TabIndex        =   8
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
      Left            =   6540
      TabIndex        =   7
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
      TabIndex        =   6
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
      TabIndex        =   9
      Top             =   1500
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   10
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
   Begin VB.Label lblPr�fixeAide 
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
      Left            =   60
      TabIndex        =   0
      Top             =   180
      Width           =   1635
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Options g�n�rales des plannings"
' Feuille frmOptions
' Options g�n�rales du gestionnaire d'impression
' 26/02/1997 PV Barre de boutons
' 20/04/1998 PV Masquage de l'indicateur bloqu�/rel�ch�
' 20/01/1999 PV Internationalisation

Option Explicit

Const iOptionsD�faut = 8             ' Barre de boutons

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
'  chkPasSignalerEcartUnit� = 0
  chkAfficherMenuSyst�me = 0
  chkAfficherBarreDeBoutons = 0
  chkDemanderNbExQuandImpression = 0
End Sub


Private Sub btnLangue_Click()
  IntlS�lectionneLangage
  GotFocus
End Sub


Private Sub btnOk_Click()
  Dim iOptionsG�n�rales As Integer
  
  iOptionsG�n�rales = 0
'  If chkPasSignalerEcartUnit� Then
'    bPasSignalerEcartUnit� = True
'    iOptionsG�n�rales = iOptionsG�n�rales + 1
'  Else
'    bPasSignalerEcartUnit� = False
'  End If
  
  If chkAfficherMenuSyst�me Then
    bAfficherMenuSyst�me = True
    iOptionsG�n�rales = iOptionsG�n�rales + 2
  Else
    bAfficherMenuSyst�me = False
  End If
  
  If chkDemanderNbExQuandImpression Then
    bDemanderNbExQuandImpression = True
    iOptionsG�n�rales = iOptionsG�n�rales + 4
  Else
    bDemanderNbExQuandImpression = False
  End If
  
  If chkAfficherBarreDeBoutons Then
    bAfficherBarreDeBoutons = True
    iOptionsG�n�rales = iOptionsG�n�rales + 8
  Else
    bAfficherBarreDeBoutons = False
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
  
'  chkPasSignalerEcartUnit� = IIf(bPasSignalerEcartUnit�, 1, 0)
  chkAfficherMenuSyst�me = IIf(bAfficherMenuSyst�me, 1, 0)
  chkAfficherBarreDeBoutons = IIf(bAfficherBarreDeBoutons, 1, 0)
  chkDemanderNbExQuandImpression = IIf(bDemanderNbExQuandImpression, 1, 0)
  chkMasquerBloqu� = IIf(bMasquerBloqu�, vbChecked, vbUnchecked)
  txtPr�fixeAide = sPr�fixeAide
End Sub

Public Sub InitOptions()
  Dim iOptionsG�n�rales As Integer
  
  iOptionsG�n�rales = GetSetting(sApplicationGlobale, "Options", "OptionsG�n�rales", iOptionsD�faut)
  sPr�fixeAide = GetSetting(sApplicationGlobale, "Options", "Pr�fixeAide", sPr�fixeAideD�faut)
'  bPasSignalerEcartUnit� = (iOptionsG�n�rales And 1) <> 0
  bAfficherMenuSyst�me = (iOptionsG�n�rales And 2) <> 0
  bDemanderNbExQuandImpression = (iOptionsG�n�rales And 4) <> 0
  bAfficherBarreDeBoutons = (iOptionsG�n�rales And 8) <> 0
  bMasquerBloqu� = (iOptionsG�n�rales And 16) <> 0
  
  If sPr�fixeAide = "http://www.silliker/microbsoft/" Then
    sPr�fixeAide = "http://www.silliker/microbsoft/secretariat/"
    SaveSetting sApplicationGlobale, "Options", "Pr�fixeAide", sPr�fixeAide
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

Private Sub chkPasSignalerEcartUnit�_GotFocus(): GotFocus: End Sub
Private Sub chkAfficherMenuSyst�me_GotFocus(): GotFocus: End Sub
Private Sub chkDemanderNbExQuandImpression_GotFocus(): GotFocus: End Sub
Private Sub chkAfficherBarreDeBoutons_GotFocus(): GotFocus: End Sub
Private Sub chkMasquerBloqu�_GotFocus(): GotFocus: End Sub
Private Sub txtPr�fixeAide_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnD�faut_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub
Private Sub btnLangue_GotFocus(): GotFocus: End Sub



' ==============================================================================
' Quelques options sont accessibles directement depuis les barres de boutons�

Public Sub PasDeBarreDeBoutons()
  Dim iOptionsG�n�rales As Integer
  
  iOptionsG�n�rales = GetSetting(sApplicationGlobale, "Options", "OptionsG�n�rales", 0)
  iOptionsG�n�rales = iOptionsG�n�rales And Not 8
  SaveSetting sApplicationGlobale, "Options", "OptionsG�n�rales", iOptionsG�n�rales
  bAfficherBarreDeBoutons = False
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "OPCaption"
  
  SetLib btnOk, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnD�faut, "Caption", "btnD�faut"
  btnLangue.Caption = sGetIntlLib("btnLangue", "&Langue") & " (" & cLangage & ")"
  AjusteControle btnLangue
  
'  SetLib chkPasSignalerEcartUnit�, "Caption", "OPchkPasSignalerEU"
'  SetLib chkPasSignalerEcartUnit�, "Tag", "OPchkPasSignalerEU.t"
  
  SetLib lblPr�fixeAide, "Caption", "OPlblPr�fixeAide"
  SetLib txtPr�fixeAide, "Tag", "OPtxtPr�fixeAide.tag"
  
  SetLib chkAfficherMenuSyst�me, "Caption", "OPchkAfficherMS"
  SetLib chkAfficherMenuSyst�me, "Tag", "OPchkAfficherMS.tag"
  
  SetLib chkDemanderNbExQuandImpression, "Caption", "OPchkDemanderNbExImp"
  SetLib chkDemanderNbExQuandImpression, "Tag", "OPchkDemNbEx.tag"
  
  SetLib chkAfficherBarreDeBoutons, "Caption", "OPchkAfficherBB"
  SetLib chkAfficherBarreDeBoutons, "Tag", "OPchkAfficherBB.tag"
  
  SetLib chkMasquerBloqu�, "Caption", "OPchkMasquerBloqu�"
  SetLib chkMasquerBloqu�, "Tag", "OPchkMasqBloq.tag"
End Sub

