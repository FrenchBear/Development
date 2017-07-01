VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRechercheLettres 
   Caption         =   "Recherche de lettres"
   ClientHeight    =   3975
   ClientLeft      =   2895
   ClientTop       =   2730
   ClientWidth     =   7020
   Icon            =   "frmRechercheLettres.frx":0000
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
      TabIndex        =   4
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
      TabIndex        =   5
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
      TabIndex        =   6
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
      TabIndex        =   8
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
      Width           =   3975
   End
   Begin MSComctlLib.ListView lvLettres 
      Height          =   2655
      Left            =   60
      TabIndex        =   3
      Top             =   1200
      Width           =   6915
      _ExtentX        =   12197
      _ExtentY        =   4683
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
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Let"
         Object.Width           =   873
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Sys"
         Object.Width           =   529
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Personne"
         Object.Width           =   5741
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Unité"
         Object.Width           =   3175
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
      Height          =   555
      Left            =   60
      TabIndex        =   2
      Top             =   600
      Width           =   3975
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
Attribute VB_Name = "frmRechercheLettres"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Boîte de recherche de lettres d'assistant à partir d'une partie de son nom"
' frmRechercheLettres
' Boîte de recherche de lettres d'assistant à partir d'une partie de son nom
' Pas commun avec Scraw, puisque scraw n'a pas les infos sur les unités
' Nov 96 PV
' 28/07/1998 PV Indicateur de tri dans les en-têtes de colonnes
'  4/08/1998 PV Affichage de la lettre du système qui gère les lettres
' 25/08/1998 PV ListViewFullRowSelect
' 27/01/1999 NC Internationalisation


Option Explicit

Private Sélectionné As String
Dim Trouvé As Collection

Private Sub btnAide_Click()
  Aide "frmchlet"
End Sub

Private Sub btnAnnuler_Click()
  Sélectionné = ""
  Hide
End Sub

Public Function Cherche() As String
  Sélectionné = ""
  Show vbModal
  Cherche = Sélectionné
End Function

Private Sub btnOk_Click()
  Hide
End Sub

Private Sub btnRechercher_Click()
  Dim itmX As ListItem
  
  btnRechercher.Enabled = False
  btnAnnuler.Enabled = False
  btnEffacer.Enabled = False
  btnOK.Enabled = False
  lblStatus = "Recherche en cours…"
  lvLettres.ListItems.Clear
  lvLettres.SetFocus
    
  Set Trouvé = RechercheLettres(txtRecherche)
  If Trouvé Is Nothing Then
    btnRechercher.Enabled = True
    btnAnnuler.Enabled = True
    btnEffacer.Enabled = True
    lblStatus = ""
    txtRecherche.SetFocus
    Exit Sub
  End If
  
  EffaceMarqueDeTri lvLettres
  lvLettres.Sorted = False
  Dim l As Lettre, nb As Integer
  For Each l In Trouvé
    If InStr(1, l.let_systeme, cSystèmeCA) <> 0 Then
      Set itmX = lvLettres.ListItems.Add()
      itmX.Text = l.let_lettres
      itmX.SubItems(1) = l.let_systeme
      itmX.SubItems(2) = sNomUtilisateur(l.let_pers)
      itmX.SubItems(3) = sCodeUnité(l.let_unite)
      nb = nb + 1
    End If
  Next
  
  lblStatus = sprintf(sGetIntlLib("RLsStatus", "%1 lettre(s) associée(s) à un nom qui contient %2 sur le système Unix %3"), nb, txtRecherche, sSystèmeDistant)
  btnRechercher.Default = False
  btnRechercher.Enabled = True
  btnEffacer.Enabled = True
  btnAnnuler.Enabled = True
  If nb = 0 Then
    txtRecherche.SetFocus
  Else
    SendKeys " "
  End If
  
  LVSetAllColWidths lvLettres, LVSCW_AUTOSIZE_USEHEADER
End Sub

Private Sub btnEffacer_Click()
  lvLettres.ListItems.Clear
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
  btnEffacer_Click
End Sub

Private Sub Form_Resize()
  If ScaleWidth > 350 And ScaleHeight > 100 Then
    lvLettres.Width = ScaleWidth - 5
    lvLettres.Height = ScaleHeight - 82
    btnAide.Left = 280 + ScaleWidth - 469
    btnRechercher.Left = 280 + ScaleWidth - 469
    btnEffacer.Left = 280 + ScaleWidth - 469
    btnOK.Left = 376 + ScaleWidth - 469
    btnAnnuler.Left = 376 + ScaleWidth - 469
    
    txtRecherche.Width = 265 + ScaleWidth - 469
    lblStatus.Width = 265 + ScaleWidth - 469
    
    btnAide.Refresh
    btnRechercher.Refresh
    btnEffacer.Refresh
    btnOK.Refresh
    btnAnnuler.Refresh
  End If
End Sub


Private Sub Label1_Click()

End Sub

Private Sub lvLettres_ColumnClick(ByVal ColumnHeader As ColumnHeader)
  TrieListView lvLettres, ColumnHeader.Index
End Sub

Private Sub lvLettres_DblClick()
  If btnOK.Enabled Then btnOk_Click
End Sub

Private Sub lvLettres_ItemClick(ByVal Item As ListItem)
  btnOK.Enabled = True
  btnOK.Default = True
  Sélectionné = Item.Text
End Sub

Private Sub txtRecherche_GotFocus()
  btnOK.Enabled = False
  btnRechercher.Default = True
  AutoSelect ActiveControl
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
  If bBlocageEnCours Then Beep: Cancel = True: Exit Sub
  Let Sélectionné = ""
End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "RLCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnEffacer, "Caption", "btnEffacer"
  SetLib btnRechercher, "Caption", "btnRechercher"
  
  SetLib lblNom, "Caption", "RLlblNom"
  AjusteControle lblStatus
  
  SetLib lvLettres.ColumnHeaders(1), "Text", "RLchLet"
  SetLib lvLettres.ColumnHeaders(2), "Text", "RLchSys"
  SetLib lvLettres.ColumnHeaders(3), "Text", "RLchPersonne"
  SetLib lvLettres.ColumnHeaders(4), "Text", "RLchUnité"
End Sub


