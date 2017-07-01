VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRechercheDistributeur 
   Caption         =   "Recherche de distributeur"
   ClientHeight    =   3975
   ClientLeft      =   1560
   ClientTop       =   2415
   ClientWidth     =   7020
   Icon            =   "frmRechercheDistributeur.frx":0000
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
   Begin MSComctlLib.ListView lwDistributeurs 
      Height          =   2775
      Left            =   60
      TabIndex        =   3
      Top             =   1200
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   4895
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
         Object.Width           =   1323
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Distributeur"
         Object.Width           =   7673
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
Attribute VB_Name = "frmRechercheDistributeur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille classique de recherche de distributeur"
' frmRechercheDistributeur
' Feuille classique de recherche de distributeur
' 15/10/97 PV Affichage "commence par" / "contient" en fin de recherche selon le motif recherché
' 29/07/1998 PV Indicateur de tri dans les en-têtes de colonnes
' 25/08/1998 PV ListViewFullRowSelect
' 01/02/1999 NC Internationalisation


Option Explicit

Private Sélectionné As Distributeur
Private Trouvé As Collection


Private Sub btnAide_Click()
  Aide "frmchdis"
End Sub

Private Sub btnAnnuler_Click()
  Set Sélectionné = Nothing
  Hide
End Sub

Public Function Cherche() As Distributeur
  txtRecherche = ""
  Set Sélectionné = Nothing
  Show 1
  Set Cherche = Sélectionné
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
  lblStatus = sGetIntlLib("CO092", "Recherche en cours…")
  lwDistributeurs.ListItems.Clear
  
  Set Trouvé = RechercheDistributeur(txtRecherche)
  If Trouvé Is Nothing Then
    btnRechercher.Enabled = True
    btnAnnuler.Enabled = True
    btnEffacer.Enabled = True
    lblStatus = ""
    txtRecherche.SetFocus
    Exit Sub
  End If
  
  EffaceMarqueDeTri lwDistributeurs
  lwDistributeurs.Sorted = False
  Dim p
  For Each p In Trouvé
    Set itmX = lwDistributeurs.ListItems.Add()
    itmX.Text = p.dis_numdis
    itmX.SubItems(1) = p.dis_nom
  Next
  
  lblStatus = Trouvé.Count & " distributeur(s) dont le nom " & IIf(Left(txtRecherche, 1) = "*", "contient", "commence par") & " " & txtRecherche
  btnRechercher.Default = False
  btnRechercher.Enabled = True
  btnEffacer.Enabled = True
  btnAnnuler.Enabled = True
  If Trouvé.Count = 0 Then
    txtRecherche.SetFocus
  Else
    lwDistributeurs.SetFocus
    SendKeys " "
  End If
End Sub

Private Sub btnEffacer_Click()
  lwDistributeurs.ListItems.Clear
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
  If txtRecherche = "" Then txtRecherche.SetFocus
End Sub

Private Sub Form_Load()
  Internationalisation
  btnEffacer_Click
End Sub

Private Sub Form_Resize()
  If ScaleWidth > 350 And ScaleHeight > 100 Then
    lwDistributeurs.Width = ScaleWidth - 5
    lwDistributeurs.Height = ScaleHeight - 82
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

Private Sub lwDistributeurs_ColumnClick(ByVal ColumnHeader As ColumnHeader)
  TrieListView lwDistributeurs, ColumnHeader.Index
End Sub

Private Sub lwDistributeurs_DblClick()
  If btnOK.Enabled Then btnOk_Click
End Sub

Private Sub lwDistributeurs_ItemClick(ByVal Item As ListItem)
  btnOK.Enabled = True
  btnOK.Default = True
  Set Sélectionné = Trouvé("D" & Item.Text)
End Sub

Private Sub lwDistributeurs_KeyPress(KeyAscii As Integer)
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
  If bBlocageEnCours Then Beep: Cancel = True: Exit Sub
  Set Sélectionné = Nothing
End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "RTCaption"
  
  SetLib btnRechercher, "Caption", "btnRechercher"
  SetLib btnEffacer, "Caption", "btnEffacer"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
      
  SetLib lblNom, "Caption", "RTlblNom"
  SetLib lwDistributeurs.ColumnHeaders(1), "Text", "RTchNo"
  SetLib lwDistributeurs.ColumnHeaders(2), "Text", "RTchDistributeur"
End Sub

