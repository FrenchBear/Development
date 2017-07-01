VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRechercheCadreDePr�l�vement 
   Caption         =   "Recherche de cadre de pr�l�vement"
   ClientHeight    =   3975
   ClientLeft      =   2820
   ClientTop       =   2475
   ClientWidth     =   6615
   Icon            =   "frmRechercheCadreDePr�l�vement.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   265
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   441
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
      Height          =   375
      Left            =   3240
      TabIndex        =   5
      Top             =   600
      Width           =   1035
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
      Height          =   375
      Left            =   4380
      TabIndex        =   6
      Top             =   600
      Width           =   1035
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
      Height          =   375
      Left            =   5520
      TabIndex        =   3
      Top             =   120
      Width           =   1035
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
      Height          =   375
      Left            =   5520
      TabIndex        =   7
      Top             =   600
      Width           =   1035
   End
   Begin VB.CommandButton btnRechercher 
      Caption         =   "Chercher"
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
      Height          =   375
      Left            =   4380
      TabIndex        =   2
      Top             =   120
      Width           =   1035
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
      Left            =   660
      TabIndex        =   1
      Top             =   120
      Width           =   3615
   End
   Begin MSComctlLib.ListView lwCadresDePr�l�vement 
      Height          =   2835
      Left            =   60
      TabIndex        =   8
      Top             =   1080
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   5001
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
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
      Height          =   435
      Left            =   60
      TabIndex        =   4
      Top             =   540
      Width           =   3075
   End
   Begin VB.Label Label1 
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
      Top             =   180
      Width           =   555
   End
End
Attribute VB_Name = "frmRechercheCadreDePr�l�vement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de recherche d'un cadre de pr�l�vement � partir d'une partie de son libell�"
' frmRechercheCadreDePr�l�vement
' Feuille de recherche d'un cadre de pr�l�vement � partir d'une partie de son libell�
' 2/9/97 PV
' 29/07/1998 PV Indicateur de tri dans les en-t�tes de colonnes
' 25/08/1998 PV ListViewFullRowSelect

Option Explicit

Private S�lectionn� As CadreDePr�l�vement
Dim Trouv� As Collection

Private Sub btnAide_Click()
  Aide "frmchcpr"
End Sub

Private Sub btnAnnuler_Click()
  Set S�lectionn� = Nothing
  Hide
End Sub

Public Function Cherche() As CadreDePr�l�vement
  Set S�lectionn� = Nothing
  Show 1
  Set Cherche = S�lectionn�
End Function

Private Sub btnOk_Click()
  Hide
End Sub

Private Sub btnRechercher_Click()
  Dim itmX As ListItem
  
  btnRechercher.Enabled = False
  btnAnnuler.Enabled = False
  btnEffacer.Enabled = False
  btnOk.Enabled = False
  lblStatus = "Recherche en cours�"
  lwCadresDePr�l�vement.ListItems.Clear
  lwCadresDePr�l�vement.SetFocus
  
  Set Trouv� = RechercheCadreDePr�l�vement(txtRecherche)
  If Trouv� Is Nothing Then
    btnRechercher.Enabled = True
    btnAnnuler.Enabled = True
    btnEffacer.Enabled = True
    lblStatus = ""
    txtRecherche.SetFocus
    Exit Sub
  End If
  
  EffaceMarqueDeTri lwCadresDePr�l�vement
  lwCadresDePr�l�vement.Sorted = False
  Dim c
  For Each c In Trouv�
    Set itmX = lwCadresDePr�l�vement.ListItems.Add()
    itmX.Text = c.cpr_indice
    itmX.SubItems(1) = c.cpr_libelle
  Next
  lblStatus = Trouv�.Count & " cadres de pr�l�vement(s) dont le nom contient " & txtRecherche
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
  lwCadresDePr�l�vement.ListItems.Clear
  lblStatus = ""
  txtRecherche = ""
  btnOk.Enabled = False
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
  ListViewFullRowSelect lwCadresDePr�l�vement
  btnEffacer_Click
End Sub

Private Sub Form_Resize()
  If ScaleWidth > 350 And ScaleHeight > 100 Then
    lwCadresDePr�l�vement.Width = ScaleWidth - 9
    lwCadresDePr�l�vement.Height = ScaleHeight - 77
    btnAide.Left = 216 + ScaleWidth - 441
    btnRechercher.Left = 292 + ScaleWidth - 441
    btnEffacer.Left = 292 + ScaleWidth - 441
    btnOk.Left = 368 + ScaleWidth - 441
    btnAnnuler.Left = 368 + ScaleWidth - 441
    txtRecherche.Width = 241 + ScaleWidth - 441
    lblStatus.Width = 205 + ScaleWidth - 441
    
    btnAide.Refresh
    btnRechercher.Refresh
    btnEffacer.Refresh
    btnOk.Refresh
    btnAnnuler.Refresh
  End If
End Sub


Private Sub lwCadresDePr�l�vement_ColumnClick(ByVal ColumnHeader As ColumnHeader)
  TrieListView lwCadresDePr�l�vement, ColumnHeader.Index
End Sub

Private Sub lwCadresDePr�l�vement_DblClick()
  If btnOk.Enabled Then btnOk_Click
End Sub

Private Sub lwCadresDePr�l�vement_ItemClick(ByVal Item As ListItem)
  btnOk.Enabled = True
  btnOk.Default = True
  Set S�lectionn� = Trouv�("F" & Item.Text)
End Sub

Private Sub lwCadresDePr�l�vement_KeyPress(KeyAscii As Integer)
  If KeyAscii = 13 Then btnOk_Click
End Sub

Private Sub txtRecherche_GotFocus()
  btnOk.Enabled = False
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
  Set S�lectionn� = Nothing
End Sub

