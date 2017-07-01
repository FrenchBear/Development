VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRechercheLibelléRA 
   Caption         =   "Recherche de libellé RA"
   ClientHeight    =   3975
   ClientLeft      =   2820
   ClientTop       =   2475
   ClientWidth     =   7020
   Icon            =   "frmRechercheLibelléCRA.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   265
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   468
   Begin VB.CommandButton btnRechercher 
      Caption         =   "Chercher"
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
      Left            =   4200
      TabIndex        =   8
      Top             =   60
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
      Left            =   5640
      TabIndex        =   7
      Top             =   420
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
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
      Left            =   5640
      TabIndex        =   6
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnEffacer 
      Caption         =   "&Effacer"
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
      Left            =   4200
      TabIndex        =   5
      Top             =   420
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
      Left            =   4200
      TabIndex        =   4
      Top             =   780
      Width           =   1350
   End
   Begin VB.TextBox txtRecherche 
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
      Left            =   60
      TabIndex        =   1
      Top             =   240
      Width           =   3615
   End
   Begin MSComctlLib.ListView lvLibellés 
      Height          =   2835
      Left            =   60
      TabIndex        =   3
      Top             =   1200
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   5001
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "N°"
         Object.Width           =   1058
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Nom"
         Object.Width           =   9260
      EndProperty
   End
   Begin VB.Label lblStatus 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   60
      TabIndex        =   2
      Top             =   600
      Width           =   3615
   End
   Begin VB.Label lblNom 
      Caption         =   "&Nom :"
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
      Left            =   60
      TabIndex        =   0
      Top             =   0
      Width           =   555
   End
End
Attribute VB_Name = "frmRechercheLibelléRA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de recherche d'un libellé CRA à partir d'une partie de son libellé"
' frmRechercheLibelléRA
' Feuille de recherche d'un libellé RA à partir d'une partie de son libellé
' 27/07/1998 PV
' 29/07/1998 PV Indicateur de tri dans les en-têtes de colonnes
'  7/08/1998 PV Intervention opérateur
' 25/08/1998 PV ListViewFullRowSelect
' 08/03/1999 NC Internationalisation

Option Explicit

Private Sélectionné As LibelléRA
Private g_iRessource As eRessource
Private g_sNomRessource As String
Dim Trouvé As Collection

Private Sub btnAide_Click()
  Aide "frmchlcr"
End Sub

Private Sub btnAnnuler_Click()
  Set Sélectionné = Nothing
  Unload Me
End Sub

Public Function Cherche(ByVal iRessource As eRessource) As LibelléRA
  Set Sélectionné = Nothing
  g_iRessource = iRessource
  Show vbModal
  Set Cherche = Sélectionné
End Function

Private Sub btnOk_Click()
  Unload Me
End Sub

Private Sub btnRechercher_Click()
  Dim itmX As ListItem
  
  btnRechercher.Enabled = False
  btnAnnuler.Enabled = False
  btnEffacer.Enabled = False
  btnOK.Enabled = False
  lblStatus = sGetIntlLib("CO092", "Recherche en cours…")
  lvLibellés.ListItems.Clear
  lvLibellés.SetFocus
  
  Set Trouvé = RechercheLibelléRA(g_iRessource, txtRecherche)
  If Trouvé Is Nothing Then
    btnRechercher.Enabled = True
    btnAnnuler.Enabled = True
    btnEffacer.Enabled = True
    lblStatus = ""
    txtRecherche.SetFocus
    Exit Sub
  End If
  
  EffaceMarqueDeTri lvLibellés
  lvLibellés.Sorted = False
  Dim c
  For Each c In Trouvé
    Set itmX = lvLibellés.ListItems.Add()
    itmX.Text = c.lcr_indice
    itmX.SubItems(1) = c.lcr_libelle
  Next
  
  lblStatus = sprintf(sGetIntlLib("RRtxtTrou", "%1 libellé(s) dont le nom contient %2"), Trouvé.Count, txtRecherche)
  
  btnRechercher.Default = False
  btnRechercher.Enabled = True
  btnEffacer.Enabled = True
  btnAnnuler.Enabled = True
  If Trouvé.Count = 0 Then
    txtRecherche.SetFocus
  Else
    SendKeys " "
  End If
End Sub

Private Sub btnEffacer_Click()
  lvLibellés.ListItems.Clear
  lblStatus = ""
  txtRecherche = ""
  btnOK.Enabled = False
  btnRechercher.Default = True
  btnRechercher.Enabled = False
  Set Trouvé = Nothing
  On Error Resume Next
  txtRecherche.SetFocus
End Sub

Private Sub Form_Activate()
  txtRecherche = ""
  txtRecherche.SetFocus
End Sub

Private Sub Form_Load()
  Internationalisation
  
  Select Case g_iRessource
    Case rSecteurPrélèvement:     g_sNomRessource = sGetIntlLib("RRtxtSP", "Stade de prélèvement")
    Case rInterventionOpérateur:  g_sNomRessource = sGetIntlLib("RRtxtIO", "Intervention opérateur")
    Case rModeConditionnement:    g_sNomRessource = sGetIntlLib("RRtxtMC", "Mode de conditionnement")
    Case rNiveauÉlaboration:      g_sNomRessource = sGetIntlLib("RRtxtNE", "Niveau d'élaboration")
    Case rÉtatdivision:           g_sNomRessource = sGetIntlLib("RRtxtED", "État de division")
    Case rÉtatPhysique:           g_sNomRessource = sGetIntlLib("RRtxtEP", "État physique")
    Case rTechnologieFabrication: g_sNomRessource = sGetIntlLib("RRtxtTF", "Technologie de fabrication")
    Case rAspectEchantillon:      g_sNomRessource = sGetIntlLib("RRtxtAE", "Aspect de l'échantillon")
    Case rConditionsPrélèvement:  g_sNomRessource = sGetIntlLib("RRtxtCP", "Conditions de prélèvement")
    Case rCadrePrélèvement:       g_sNomRessource = sGetIntlLib("RRtxtCA", "Cadre de prélèvement")
    Case rLieuPrélèvement:        g_sNomRessource = sGetIntlLib("RRtxtLP", "Lieu de prélèvement")
    Case rContenant:              g_sNomRessource = sGetIntlLib("RRtxtCO", "Contenant")
  End Select
  
  Caption = sprintf(sGetIntlLib("CR326", "Recherche - %1"), g_sNomRessource)
  btnEffacer_Click
End Sub

Private Sub Form_Resize()
  If ScaleWidth > 350 And ScaleHeight > 100 Then
    lvLibellés.Width = ScaleWidth - 5
    lvLibellés.Height = ScaleHeight - 82
    btnAide.Left = 280 + ScaleWidth - 469
    btnRechercher.Left = 280 + ScaleWidth - 469
    btnEffacer.Left = 280 + ScaleWidth - 469
    btnOK.Left = 376 + ScaleWidth - 469
    btnAnnuler.Left = 376 + ScaleWidth - 469
    
    txtRecherche.Width = 241 + ScaleWidth - 469
    lblStatus.Width = 205 + ScaleWidth - 469
    
    btnAide.Refresh
    btnRechercher.Refresh
    btnEffacer.Refresh
    btnOK.Refresh
    btnAnnuler.Refresh
  End If
End Sub


Private Sub lvLibellés_ColumnClick(ByVal ColumnHeader As ColumnHeader)
  TrieListView lvLibellés, ColumnHeader.Index
End Sub

Private Sub lvLibellés_DblClick()
  If btnOK.Enabled Then btnOk_Click
End Sub

Private Sub lvLibellés_ItemClick(ByVal Item As ListItem)
  btnOK.Enabled = True
  btnOK.Default = True
  Set Sélectionné = Trouvé("F" & g_iRessource & "," & Item.Text)
End Sub

Private Sub lvLibellés_KeyPress(KeyAscii As Integer)
  If KeyAscii = 13 Then btnOk_Click
End Sub

Private Sub txtRecherche_GotFocus()
  btnOK.Enabled = False
  btnRechercher.Default = True
End Sub

Private Sub txtRecherche_Change()
  If txtRecherche <> "" Then
    btnRechercher.Enabled = True
    btnRechercher.Default = True
  Else
    btnRechercher.Enabled = False
  End If
End Sub




Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub



Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If UnloadMode = vbFormControlMenu Then Set Sélectionné = Nothing
End Sub




'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "RRCaption"
  
  SetLib btnRechercher, "Caption", "btnRechercher"
  SetLib btnEffacer, "Caption", "btnEffacer"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
      
  SetLib lblNom, "Caption", "RRlblNom"
  SetLib lvLibellés.ColumnHeaders(1), "Text", "RRchNo"
  SetLib lvLibellés.ColumnHeaders(2), "Text", "RRchNom"
End Sub


