VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmCache 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Caches internes"
   ClientHeight    =   5370
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9960
   Icon            =   "frmCachesSCRAW.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5370
   ScaleWidth      =   9960
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnVoirCacheLcr 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   44
      Top             =   4140
      Width           =   495
   End
   Begin VB.CommandButton btnToutVoir 
      Caption         =   "Tout charger"
      Height          =   255
      Left            =   2160
      TabIndex        =   22
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton btnVoirCacheMet 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   41
      Top             =   3840
      Width           =   495
   End
   Begin VB.CommandButton btnEffaceCacheHie 
      Caption         =   "Effacer"
      Height          =   255
      Left            =   3300
      TabIndex        =   20
      Top             =   1620
      Width           =   750
   End
   Begin VB.CommandButton btnVoirCacheHie 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   19
      Top             =   1620
      Width           =   495
   End
   Begin VB.CommandButton btnVoirCacheMil 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   37
      Top             =   3540
      Width           =   495
   End
   Begin VB.CommandButton btnVoirCacheUti 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   34
      Top             =   3240
      Width           =   495
   End
   Begin VB.CommandButton btnVoirCacheLer 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   31
      Top             =   2940
      Width           =   495
   End
   Begin VB.CommandButton btnVoirCacheCon 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   28
      Top             =   2640
      Width           =   495
   End
   Begin VB.CommandButton btnVoirCacheGer 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   25
      Top             =   2340
      Width           =   495
   End
   Begin VB.CommandButton btnVoirCacheDis 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   15
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton btnVoirCacheFab 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   11
      Top             =   1020
      Width           =   495
   End
   Begin VB.CommandButton btnVoirCachePro 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   7
      Top             =   720
      Width           =   495
   End
   Begin MSComctlLib.ListView lw 
      Height          =   4275
      Left            =   4080
      TabIndex        =   39
      Top             =   420
      Width           =   5835
      _ExtentX        =   10292
      _ExtentY        =   7541
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "N°"
         Object.Width           =   952
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Langue"
         Object.Width           =   1270
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Libellé"
         Object.Width           =   4939
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Autre"
         Object.Width           =   970
      EndProperty
   End
   Begin VB.CommandButton btnVoirCacheEtb 
      Caption         =   "Voir"
      Height          =   255
      Left            =   2760
      TabIndex        =   3
      Top             =   420
      Width           =   495
   End
   Begin VB.CommandButton btnEffaceCacheDis 
      Caption         =   "Effacer"
      Height          =   255
      Left            =   3300
      TabIndex        =   16
      Top             =   1320
      Width           =   750
   End
   Begin VB.CommandButton btnEffaceCacheFab 
      Caption         =   "Effacer"
      Height          =   255
      Left            =   3300
      TabIndex        =   12
      Top             =   1020
      Width           =   750
   End
   Begin VB.CommandButton btnEffaceCachePro 
      Caption         =   "Effacer"
      Height          =   255
      Left            =   3300
      TabIndex        =   8
      Top             =   720
      Width           =   750
   End
   Begin VB.CommandButton btnEffaceCacheEtb 
      Caption         =   "Effacer"
      Height          =   255
      Left            =   3300
      TabIndex        =   4
      Top             =   420
      Width           =   750
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
      Left            =   4500
      TabIndex        =   40
      Top             =   4860
      Width           =   1350
   End
   Begin VB.Label lblNbLcr 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   46
      Top             =   4140
      Width           =   795
   End
   Begin VB.Label lblLibellésRA 
      AutoSize        =   -1  'True
      Caption         =   "Libellés RA"
      Height          =   195
      Left            =   120
      TabIndex        =   45
      Top             =   4140
      Width           =   795
   End
   Begin VB.Label lblMéthodesAna 
      AutoSize        =   -1  'True
      Caption         =   "Méthodes d'analyse"
      Height          =   195
      Left            =   120
      TabIndex        =   43
      Top             =   3840
      Width           =   1410
   End
   Begin VB.Label lblNbMet 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   42
      Top             =   3840
      Width           =   795
   End
   Begin VB.Label lblHiérarchie 
      AutoSize        =   -1  'True
      Caption         =   "Hiérarchie"
      Height          =   195
      Left            =   120
      TabIndex        =   17
      Top             =   1620
      Width           =   720
   End
   Begin VB.Label lblNbHie 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   18
      Top             =   1620
      Width           =   795
   End
   Begin VB.Label lblMilieux 
      AutoSize        =   -1  'True
      Caption         =   "Milieux"
      Height          =   195
      Left            =   120
      TabIndex        =   35
      Top             =   3540
      Width           =   480
   End
   Begin VB.Label lblNbMil 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   36
      Top             =   3540
      Width           =   795
   End
   Begin VB.Label lblTitre 
      AutoSize        =   -1  'True
      Caption         =   "?"
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
      Left            =   4140
      TabIndex        =   38
      Top             =   120
      Width           =   105
   End
   Begin VB.Label lblNbUti 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   33
      Top             =   3240
      Width           =   795
   End
   Begin VB.Label lblUtilisateurs 
      AutoSize        =   -1  'True
      Caption         =   "Utilisateurs"
      Height          =   195
      Left            =   120
      TabIndex        =   32
      Top             =   3240
      Width           =   765
   End
   Begin VB.Label lblNbLer 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   30
      Top             =   2940
      Width           =   795
   End
   Begin VB.Label lblLibErcem 
      AutoSize        =   -1  'True
      Caption         =   "Libellés Ercem"
      Height          =   195
      Left            =   120
      TabIndex        =   29
      Top             =   2940
      Width           =   1020
   End
   Begin VB.Label lblCachesPerm 
      AutoSize        =   -1  'True
      Caption         =   "Caches permanents"
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
      Left            =   120
      TabIndex        =   21
      Top             =   2040
      Width           =   1935
   End
   Begin VB.Label lblNbCon 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   27
      Top             =   2640
      Width           =   795
   End
   Begin VB.Label lblConclusions 
      AutoSize        =   -1  'True
      Caption         =   "Conclusions"
      Height          =   195
      Left            =   120
      TabIndex        =   26
      Top             =   2640
      Width           =   855
   End
   Begin VB.Label lblNbGer 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   24
      Top             =   2340
      Width           =   795
   End
   Begin VB.Label lblGermes 
      AutoSize        =   -1  'True
      Caption         =   "Germes"
      Height          =   195
      Left            =   120
      TabIndex        =   23
      Top             =   2340
      Width           =   540
   End
   Begin VB.Label lblCachesDyn 
      AutoSize        =   -1  'True
      Caption         =   "Caches dynamiques"
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
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1950
   End
   Begin VB.Label lblNbDis 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   14
      Top             =   1320
      Width           =   795
   End
   Begin VB.Label lblDistributeurs 
      AutoSize        =   -1  'True
      Caption         =   "Distributeurs"
      Height          =   195
      Left            =   120
      TabIndex        =   13
      Top             =   1320
      Width           =   870
   End
   Begin VB.Label lblNbFab 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   10
      Top             =   1020
      Width           =   795
   End
   Begin VB.Label lblFabricants 
      AutoSize        =   -1  'True
      Caption         =   "Fabricants"
      Height          =   195
      Left            =   120
      TabIndex        =   9
      Top             =   1020
      Width           =   735
   End
   Begin VB.Label lblNbPro 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   6
      Top             =   720
      Width           =   795
   End
   Begin VB.Label lblProduits 
      AutoSize        =   -1  'True
      Caption         =   "Produits"
      Height          =   195
      Left            =   120
      TabIndex        =   5
      Top             =   720
      Width           =   570
   End
   Begin VB.Label lblNbEtb 
      Alignment       =   1  'Right Justify
      Caption         =   "?"
      Height          =   195
      Left            =   1860
      TabIndex        =   2
      Top             =   420
      Width           =   795
   End
   Begin VB.Label lblEtab 
      AutoSize        =   -1  'True
      Caption         =   "Etablissements"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   420
      Width           =   1050
   End
End
Attribute VB_Name = "frmCache"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Visualisation des caches mémoire internes du programme scraw"
' frmCache
' Visualisation des caches mémoire internes du programme scraw
'  3/09/1997 PV
' 17/10/1997 Cache hiérarchie
' 22/10/1997 Cache méthodes
' 27/10/1997 Remplissage du cache s'il est vide au moment du clic sur voir pour les caches permanents
' 22/07/1998 PV Libellés RA
' 21/12/1998 PV Fin des cadres de prélèvement, aspects à réception, lieux de prélèvement, conditionnements
' 27/01/1999 NC Internationalisation


Option Explicit


Private Sub btnOk_Click()
  Unload Me
End Sub


Sub DoActionSuivante(ByVal sAction As String)
  Select Case sAction
    Case "btnVoirCacheGer_Click": btnVoirCacheGer_Click
    Case "btnVoirCacheCon_Click": btnVoirCacheCon_Click
    Case "btnVoirCacheUti_Click": btnVoirCacheUti_Click
    Case "btnVoirCacheLer_Click": btnVoirCacheLer_Click
    Case "btnVoirCacheMil_Click": btnVoirCacheMil_Click
    Case "btnVoirCacheMet_Click": btnVoirCacheMet_Click
    Case "btnVoirCacheLcr_Click": btnVoirCacheLcr_Click
    Case Else: MsgBox "frmCache.DoActionSuivante: Action suivante " & sAction & " inconnue !", vbCritical, sNomApp: Stop
  End Select
End Sub

Sub btnToutVoir_Click()
  btnVoirCacheGer_Click
  btnVoirCacheCon_Click
  btnVoirCacheUti_Click
  btnVoirCacheLer_Click
  btnVoirCacheMil_Click
  btnVoirCacheMet_Click
  btnVoirCacheLcr_Click
End Sub





' On sous-traite l'effacement des caches aux classes elle-mêmes
Private Sub btnEffaceCacheEtb_Click()
  EffaceCacheEtablissements
  lblNbEtb = 0
End Sub

Private Sub btnEffaceCachePro_Click()
  EffaceCacheProduits
  lblNbPro = 0
End Sub

Private Sub btnEffaceCacheFab_Click()
  EffaceCacheFabricants
  lblNbFab = 0
End Sub

Private Sub btnEffaceCacheDis_Click()
  EffaceCacheDistributeurs
  lblNbDis = 0
End Sub

Private Sub btnEffaceCacheHie_Click()
  EffaceCacheHiérarchies
  lblNbHie = 0
End Sub




Private Sub btnVoirCacheEtb_Click()
  lblTitre = "Établissements"
  ListeEtablissements lw
End Sub

Private Sub btnVoirCachePro_Click()
  lblTitre = "Produits"
  ListeProduits lw
End Sub

Private Sub btnVoirCacheFab_Click()
  lblTitre = "Fabricants"
  ListeFabricants lw
End Sub

Private Sub btnVoirCacheDis_Click()
  lblTitre = "Distributeurs"
  ListeDistributeurs lw
End Sub

Private Sub btnVoirCacheHie_Click()
  lblTitre = "Hiérarchie établissement"
  ListeHiérarchies lw
End Sub


' Caches permanents
Private Sub btnVoirCacheGer_Click()
  If bBlocageEnCours Then
    ActionSuivante Me, "btnVoirCacheGer_Click"
    Exit Sub
  End If

  If gger_iNbGermes = 0 Then
    InitGermes
    lblNbGer = gger_iNbGermes
  End If

  lblTitre = "Germes"
  ListeGermes lw
End Sub

Private Sub btnVoirCacheCon_Click()
  If bBlocageEnCours Then
    ActionSuivante Me, "btnVoirCacheCon_Click"
    Exit Sub
  End If

  If gcon_iNbConclusions = 0 Then
    InitConclusions
    lblNbCon = gcon_iNbConclusions
  End If

  lblTitre = "Conclusions"
  ListeConclusions lw
End Sub

Private Sub btnVoirCacheUti_Click()
  ' Pas d'initialisation ni de pb de ré-entrance, obligatoirement déjà en mémoire
  
  lblTitre = "Utilisateurs"
  ListeUtilisateurs lw
End Sub

Private Sub btnVoirCacheLer_Click()
  If bBlocageEnCours Then
    ActionSuivante Me, "btnVoirCacheLer_Click"
    Exit Sub
  End If

  If gler_iNbLibellésErcem = 0 Then
    bInitLibellésErcem 0
    lblNbLer = gler_iNbLibellésErcem
  End If
  
  lblTitre = "Libellés Ercem"
  ListeLibellésErcem lw
End Sub

Private Sub btnVoirCacheMil_Click()
  If bBlocageEnCours Then
    ActionSuivante Me, "btnVoirCacheMil_Click"
    Exit Sub
  End If

  If gmil_iNbMilieux = 0 Then
    InitMilieux
    lblNbMil = gmil_iNbMilieux
  End If

  lblTitre = "Milieux"
  ListeMilieux lw
End Sub

Private Sub btnVoirCacheMet_Click()
  If bBlocageEnCours Then
    ActionSuivante Me, "btnVoirCacheMet_Click"
    Exit Sub
  End If

  If gmet_iNbMéthodes = 0 Then
    InitMéthodes
    lblNbMet = gmet_iNbMéthodes
  End If

  lblTitre = "Méthodes d'analyse"
  ListeMéthodes lw
End Sub

Private Sub btnVoirCacheLcr_Click()
  If bBlocageEnCours Then
    ActionSuivante Me, "btnVoirCacheLcr_Click"
    Exit Sub
  End If

  If glcr_iNbLibellésRA = 0 Then
    InitLibellésRA
    lblNbLcr = glcr_iNbLibellésRA
  End If

  lblTitre = "Libellés de RA"
  ListeLibellésRA lw
End Sub



Private Sub Form_Load()
  Internationalisation
  
  lblNbEtb = getb_iCacheCount
  lblNbPro = gpro_iCacheCount
  lblNbFab = gfab_iCacheCount
  lblNbDis = gdis_iCacheCount
  lblNbHie = ghie_iCacheCount
  
  lblNbGer = gger_iNbGermes
  lblNbCon = gcon_iNbConclusions
  lblNbLer = gler_iNbLibellésErcem
  lblNbUti = guti_iNbUtilisateurs
  lblNbMil = gmil_iNbMilieux
  lblNbMet = gmet_iNbMéthodes
  lblNbLcr = glcr_iNbLibellésRA
End Sub

Private Sub Label6_Click()

End Sub



' ============================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "CACaption"
   
  SetLib btnOk, "Caption", "btnOK"
   
  SetLib lblCachesDyn, "Caption", "CAlblCachesDyn"
  SetLib lblEtab, "Caption", "CAlblEtab"
  SetLib lblProduits, "Caption", "CAlblProduits"
  SetLib lblFabricants, "Caption", "CAlblFabricants"
  SetLib lblDistributeurs, "Caption", "CAlblDistributeurs"
  SetLib lblHiérarchie, "Caption", "CAlblHierarchie"
  SetLib lblCachesPerm, "Caption", "CAlblCachesPerm"
  SetLib lblGermes, "Caption", "CAlblGermes"
  SetLib lblConclusions, "Caption", "CAlblConclusions"
  SetLib lblLibErcem, "Caption", "CAlblLibErcem"
  SetLib lblUtilisateurs, "Caption", "CAlblUtilisateurs"
  SetLib lblMilieux, "Caption", "CAlblMilieux"
  SetLib lblMéthodesAna, "Caption", "CAlblMéthodesAna"
  SetLib lblLibellésRA, "Caption", "CAlblLibellésCRA"
  SetLib lw.ColumnHeaders(1), "Text", "CAchNo"
  SetLib lw.ColumnHeaders(2), "Text", "CAchLangue"
  SetLib lw.ColumnHeaders(3), "Text", "CachLibellé"
  SetLib lw.ColumnHeaders(4), "Text", "CAchAutre"
End Sub

