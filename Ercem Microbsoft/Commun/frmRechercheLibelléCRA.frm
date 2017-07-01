VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRechercheLibell�RA 
   Caption         =   "Recherche de libell� RA"
   ClientHeight    =   3975
   ClientLeft      =   2820
   ClientTop       =   2475
   ClientWidth     =   7020
   Icon            =   "frmRechercheLibell�CRA.frx":0000
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
   Begin MSComctlLib.ListView lvLibell�s 
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
         Text            =   "N�"
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
Attribute VB_Name = "frmRechercheLibell�RA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de recherche d'un libell� CRA � partir d'une partie de son libell�"
' frmRechercheLibell�RA
' Feuille de recherche d'un libell� RA � partir d'une partie de son libell�
' 27/07/1998 PV
' 29/07/1998 PV Indicateur de tri dans les en-t�tes de colonnes
'  7/08/1998 PV Intervention op�rateur
' 25/08/1998 PV ListViewFullRowSelect
' 08/03/1999 NC Internationalisation

Option Explicit

Private S�lectionn� As Libell�RA
Private g_iRessource As eRessource
Private g_sNomRessource As String
Dim Trouv� As Collection

Private Sub btnAide_Click()
  Aide "frmchlcr"
End Sub

Private Sub btnAnnuler_Click()
  Set S�lectionn� = Nothing
  Unload Me
End Sub

Public Function Cherche(ByVal iRessource As eRessource) As Libell�RA
  Set S�lectionn� = Nothing
  g_iRessource = iRessource
  Show vbModal
  Set Cherche = S�lectionn�
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
  lblStatus = sGetIntlLib("CO092", "Recherche en cours�")
  lvLibell�s.ListItems.Clear
  lvLibell�s.SetFocus
  
  Set Trouv� = RechercheLibell�RA(g_iRessource, txtRecherche)
  If Trouv� Is Nothing Then
    btnRechercher.Enabled = True
    btnAnnuler.Enabled = True
    btnEffacer.Enabled = True
    lblStatus = ""
    txtRecherche.SetFocus
    Exit Sub
  End If
  
  EffaceMarqueDeTri lvLibell�s
  lvLibell�s.Sorted = False
  Dim c
  For Each c In Trouv�
    Set itmX = lvLibell�s.ListItems.Add()
    itmX.Text = c.lcr_indice
    itmX.SubItems(1) = c.lcr_libelle
  Next
  
  lblStatus = sprintf(sGetIntlLib("RRtxtTrou", "%1 libell�(s) dont le nom contient %2"), Trouv�.Count, txtRecherche)
  
  btnRechercher.Default = False
  btnRechercher.Enabled = True
  btnEffacer.Enabled = True
  btnAnnuler.Enabled = True
  If Trouv�.Count = 0 Then
    txtRecherche.SetFocus
  Else
    SendKeys " "
  End If
End Sub

Private Sub btnEffacer_Click()
  lvLibell�s.ListItems.Clear
  lblStatus = ""
  txtRecherche = ""
  btnOK.Enabled = False
  btnRechercher.Default = True
  btnRechercher.Enabled = False
  Set Trouv� = Nothing
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
    Case rSecteurPr�l�vement:     g_sNomRessource = sGetIntlLib("RRtxtSP", "Stade de pr�l�vement")
    Case rInterventionOp�rateur:  g_sNomRessource = sGetIntlLib("RRtxtIO", "Intervention op�rateur")
    Case rModeConditionnement:    g_sNomRessource = sGetIntlLib("RRtxtMC", "Mode de conditionnement")
    Case rNiveau�laboration:      g_sNomRessource = sGetIntlLib("RRtxtNE", "Niveau d'�laboration")
    Case r�tatdivision:           g_sNomRessource = sGetIntlLib("RRtxtED", "�tat de division")
    Case r�tatPhysique:           g_sNomRessource = sGetIntlLib("RRtxtEP", "�tat physique")
    Case rTechnologieFabrication: g_sNomRessource = sGetIntlLib("RRtxtTF", "Technologie de fabrication")
    Case rAspectEchantillon:      g_sNomRessource = sGetIntlLib("RRtxtAE", "Aspect de l'�chantillon")
    Case rConditionsPr�l�vement:  g_sNomRessource = sGetIntlLib("RRtxtCP", "Conditions de pr�l�vement")
    Case rCadrePr�l�vement:       g_sNomRessource = sGetIntlLib("RRtxtCA", "Cadre de pr�l�vement")
    Case rLieuPr�l�vement:        g_sNomRessource = sGetIntlLib("RRtxtLP", "Lieu de pr�l�vement")
    Case rContenant:              g_sNomRessource = sGetIntlLib("RRtxtCO", "Contenant")
  End Select
  
  Caption = sprintf(sGetIntlLib("CR326", "Recherche - %1"), g_sNomRessource)
  btnEffacer_Click
End Sub

Private Sub Form_Resize()
  If ScaleWidth > 350 And ScaleHeight > 100 Then
    lvLibell�s.Width = ScaleWidth - 5
    lvLibell�s.Height = ScaleHeight - 82
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


Private Sub lvLibell�s_ColumnClick(ByVal ColumnHeader As ColumnHeader)
  TrieListView lvLibell�s, ColumnHeader.Index
End Sub

Private Sub lvLibell�s_DblClick()
  If btnOK.Enabled Then btnOk_Click
End Sub

Private Sub lvLibell�s_ItemClick(ByVal Item As ListItem)
  btnOK.Enabled = True
  btnOK.Default = True
  Set S�lectionn� = Trouv�("F" & g_iRessource & "," & Item.Text)
End Sub

Private Sub lvLibell�s_KeyPress(KeyAscii As Integer)
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
  If UnloadMode = vbFormControlMenu Then Set S�lectionn� = Nothing
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
  SetLib lvLibell�s.ColumnHeaders(1), "Text", "RRchNo"
  SetLib lvLibell�s.ColumnHeaders(2), "Text", "RRchNom"
End Sub


