VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRechercheEtablissement 
   Caption         =   "Recherche d'�tablissement"
   ClientHeight    =   4560
   ClientLeft      =   1245
   ClientTop       =   2205
   ClientWidth     =   8220
   Icon            =   "frmRechercheEtablissement.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   304
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   548
   ShowInTaskbar   =   0   'False
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
      Left            =   5400
      TabIndex        =   10
      Top             =   780
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
      Left            =   5400
      TabIndex        =   8
      Top             =   420
      Width           =   1350
   End
   Begin VB.TextBox txtRecherchePr�fixe 
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
      Width           =   1695
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
      Left            =   6840
      TabIndex        =   7
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
      Left            =   6840
      TabIndex        =   9
      Top             =   420
      Width           =   1350
   End
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
      Left            =   5400
      TabIndex        =   6
      Top             =   60
      Width           =   1350
   End
   Begin VB.TextBox txtRechercheNom 
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
      TabIndex        =   3
      Top             =   240
      Width           =   3495
   End
   Begin MSComctlLib.ListView lvEtablissements 
      Height          =   3315
      Left            =   60
      TabIndex        =   5
      Top             =   1200
      Width           =   8115
      _ExtentX        =   14314
      _ExtentY        =   5847
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      _Version        =   393217
      SmallIcons      =   "ilProprio"
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
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "N�"
         Object.Width           =   1984
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Pr�fixe"
         Object.Width           =   2011
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Nom"
         Object.Width           =   6085
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "CPost"
         Object.Width           =   1455
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Ville"
         Object.Width           =   3969
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
      Height          =   435
      Left            =   60
      TabIndex        =   4
      Top             =   660
      Width           =   5235
   End
   Begin VB.Label lblPr�fixe 
      AutoSize        =   -1  'True
      Caption         =   "&Pr�fixe :"
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
      Top             =   0
      Width           =   780
   End
   Begin VB.Label lblNom 
      AutoSize        =   -1  'True
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
      Height          =   210
      Left            =   1800
      TabIndex        =   2
      Top             =   0
      Width           =   555
   End
End
Attribute VB_Name = "frmRechercheEtablissement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de recherche des �tablissements"
' frmRechercheEtablissement
' Feuille de recherche des �tablissements
' Octobre 96 PV
' 30/01/1998 PV AutoSelect
' 04/06/1998 PV Logos
' 28/07/1998 PV Indicateur de tri dans les en-t�tes de colonnes
' 25/08/1998 PV ListViewFullRowSelect
' 27/01/1999 NC Internationalisation
' 12/08/1999 PV Recherche *�/*� interdite
' 24/08/1999 PV Utilisation de ForceTextBoxCase


Option Explicit

Private S�lectionn� As Etablissement
Private S�lectionn�2 As New Collection
Private Trouv� As Collection

Private Sub btnAide_Click()
  Aide "frmchetb"
End Sub

Private Sub btnAnnuler_Click()
  Set S�lectionn� = Nothing
  Hide
End Sub

Public Function Cherche() As Etablissement
  txtRecherchePr�fixe = ""
  txtRechercheNom = ""
  Set S�lectionn� = Nothing
  lvEtablissements.MultiSelect = False
  Show vbModal
  Set Cherche = S�lectionn�
End Function

Public Function Cherche2() As Collection
  Dim i As Integer
  For i = 1 To S�lectionn�2.count
    S�lectionn�2.Remove 1
  Next
  Set S�lectionn� = Nothing
  lvEtablissements.MultiSelect = True
  Show vbModal
  Set Cherche2 = S�lectionn�2
End Function

Private Sub btnOk_Click()
  Dim li As ListItem
  For Each li In lvEtablissements.ListItems
    If li.Selected Then S�lectionn�2.Add Trouv�("E" & li.Text)
  Next
  
  Hide
End Sub

Private Sub btnRechercher_Click()
  Dim itmX As ListItem
  Static sLastRecherchePrefixe As String
  Static sLastRechercheNom As String
  
  ' Du bon usage des index� (la deuxi�me fois on passe)
  If sLastRecherchePrefixe <> txtRecherchePr�fixe Or sLastRechercheNom <> txtRechercheNom Then
    sLastRechercheNom = txtRechercheNom
    sLastRecherchePrefixe = txtRecherchePr�fixe
    If (Left(txtRecherchePr�fixe, 1) = "*" Or txtRecherchePr�fixe = "") And (Left(txtRechercheNom, 1) = "*" Or txtRechercheNom = "") Then
      MsgBox2i "CO059"  'Vous devez obligatoirement pr�ciser un pr�fixe ou un nom d'�tablissement ne commen�ant pas par *
      If Not bShiftPressed Then Exit Sub
    End If
  End If
  
  btnRechercher.Enabled = False
  btnAnnuler.Enabled = False
  btnEffacer.Enabled = False
  btnOK.Enabled = False
  lblStatus = sGetIntlLib("CO092", "Recherche en cours�")
  lvEtablissements.ListItems.Clear
  
  Set Trouv� = RechercheEtablissement(txtRecherchePr�fixe, txtRechercheNom)
  If Trouv� Is Nothing Then
    btnRechercher.Enabled = True
    btnAnnuler.Enabled = True
    btnEffacer.Enabled = True
    txtRecherchePr�fixe.SetFocus
    lblStatus = ""
    Exit Sub
  End If
  
  EffaceMarqueDeTri lvEtablissements
  lvEtablissements.Sorted = False
  Dim e As Etablissement
  For Each e In Trouv�
    Set itmX = lvEtablissements.ListItems.Add()
    
    On Error Resume Next
    itmX.SmallIcon = e.etb_proprio
    If Err Then itmX.SmallIcon = "S"
    On Error GoTo 0
    
    itmX.Text = e.etb_numetb
    itmX.SubItems(1) = e.etb_prefixe
    itmX.SubItems(2) = e.etb_nom
    itmX.SubItems(3) = e.etb_cpost
    itmX.SubItems(4) = e.etb_bdist
  Next
  lblStatus = sprintf(sGetIntlLib("REtxtTrou", "%1 �tablissement(s) trouv�(s) dont le pr�fixe commence par %2"), Trouv�.count, txtRecherchePr�fixe)
  'lblStatus = Trouv�.Count & " �tablissement(s) trouv�(s) dont le pr�fixe commence par " & txtRecherchePr�fixe
  If txtRechercheNom <> "" Then lblStatus = lblStatus & sprintf(sGetIntlLib("REtxtContient", "et dont le nom contient"), txtRechercheNom)
  btnRechercher.Enabled = True
  btnAnnuler.Enabled = True
  btnEffacer.Enabled = True
  btnRechercher.Default = False
  If Trouv�.count > 0 Then
    lvEtablissements.SetFocus
    SendKeys " "
  Else
    txtRecherchePr�fixe.SetFocus
  End If
End Sub

Private Sub btnEffacer_Click()
  lvEtablissements.ListItems.Clear
  lblStatus = ""
  txtRecherchePr�fixe = ""
  txtRechercheNom = ""
  btnOK.Enabled = False
  btnRechercher.Default = True
  btnRechercher.Enabled = False
  Set Trouv� = Nothing
  On Error Resume Next
  txtRecherchePr�fixe.SetFocus
End Sub

Private Sub Form_Activate()
  If txtRecherchePr�fixe = "" And txtRechercheNom = "" Then txtRecherchePr�fixe.SetFocus
End Sub

Private Sub Form_Load()
  Internationalisation
  
  ' On affecte l'image list
  lvEtablissements.SmallIcons = frmLogo.ilProprio
  btnEffacer_Click
  
  ForceTextBoxCase txtRecherchePr�fixe, 1
  ForceTextBoxCase txtRechercheNom, 1
End Sub

Private Sub Form_Resize()
  If ScaleWidth > 410 And ScaleHeight > 100 Then
    lvEtablissements.Width = ScaleWidth - 7
    lvEtablissements.Height = ScaleHeight - 83
    btnAide.Left = 360 + ScaleWidth - 550
    btnRechercher.Left = 360 + ScaleWidth - 550
    btnEffacer.Left = 360 + ScaleWidth - 550
    btnOK.Left = 456 + ScaleWidth - 550
    btnAnnuler.Left = 456 + ScaleWidth - 550
    
    txtRechercheNom.Width = 233 + ScaleWidth - 550
    lblStatus.Width = 349 + ScaleWidth - 550
    
    btnAide.Refresh
    btnRechercher.Refresh
    btnOK.Refresh
    btnAnnuler.Refresh
    btnEffacer.Refresh
  End If
End Sub

Private Sub lvEtablissements_ColumnClick(ByVal ColumnHeader As ColumnHeader)
  TrieListView lvEtablissements, ColumnHeader.Index
End Sub

Private Sub lvEtablissements_DblClick()
  If btnOK.Enabled Then btnOk_Click
End Sub

Private Sub lvEtablissements_ItemClick(ByVal Item As ListItem)
  btnOK.Enabled = True
  btnOK.Default = True
  Set S�lectionn� = Trouv�("E" & Item.Text)
End Sub

Private Sub lvEtablissements_KeyPress(KeyAscii As Integer)
  If KeyAscii = 13 Then btnOk_Click
End Sub

Private Sub txtRechercheNom_Change()
  btnRechercher.Default = True
End Sub

Private Sub txtRecherchePr�fixe_Change()
  If txtRecherchePr�fixe <> "" Then
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
  If bBlocageEnCours Then Beep: Cancel = True: Exit Sub
  Set S�lectionn� = Nothing
End Sub



Private Sub txtRecherchePr�fixe_GotFocus()
  AutoSelect ActiveControl
End Sub

Private Sub txtRechercheNom_GotFocus()
  AutoSelect ActiveControl
End Sub




'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "RECaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnEffacer, "Caption", "btnEffacer"
  SetLib btnRechercher, "Caption", "btnRechercher"
  
  SetLib lblPr�fixe, "Caption", "RElblPr�fixe"
  SetLib lblNom, "Caption", "RElblNom"
  
  SetLib lvEtablissements.ColumnHeaders(1), "Text", "REchNo"
  SetLib lvEtablissements.ColumnHeaders(2), "Text", "REchPr�fixe"
  SetLib lvEtablissements.ColumnHeaders(3), "Text", "REchNom"
  SetLib lvEtablissements.ColumnHeaders(4), "Text", "REchCPost"
  SetLib lvEtablissements.ColumnHeaders(5), "Text", "REchVille"
  
  AjusteControle lblStatus
End Sub

