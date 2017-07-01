VERSION 5.00
Begin VB.Form frmRecherche 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Rechercher"
   ClientHeight    =   2115
   ClientLeft      =   5040
   ClientTop       =   4110
   ClientWidth     =   5385
   Icon            =   "frmRecherche.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2115
   ScaleWidth      =   5385
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnRemplacerTout 
      Caption         =   "Remplacer &tout"
      Height          =   350
      Left            =   4080
      TabIndex        =   9
      Top             =   1680
      Width           =   1215
   End
   Begin VB.ComboBox cboRemplacer 
      Height          =   315
      Left            =   1260
      TabIndex        =   3
      Top             =   480
      Width           =   2655
   End
   Begin VB.CheckBox chkRespecterCasse 
      Caption         =   "Respecter la &casse"
      Height          =   255
      Left            =   2040
      TabIndex        =   5
      Top             =   960
      Width           =   1695
   End
   Begin VB.CommandButton btnRemplacer 
      Caption         =   "R&emplacer"
      Height          =   350
      Left            =   4080
      TabIndex        =   8
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   350
      Left            =   4080
      TabIndex        =   7
      Top             =   540
      Width           =   1215
   End
   Begin VB.CommandButton btnSuivant 
      Caption         =   "S&uivant"
      Default         =   -1  'True
      Height          =   350
      Left            =   4080
      TabIndex        =   6
      Top             =   60
      Width           =   1215
   End
   Begin VB.Frame fraDans 
      Caption         =   "Dans"
      Height          =   1215
      Left            =   60
      TabIndex        =   4
      Top             =   840
      Width           =   1815
      Begin VB.PictureBox Picture1 
         BorderStyle     =   0  'None
         Height          =   855
         Left            =   60
         ScaleHeight     =   855
         ScaleWidth      =   1695
         TabIndex        =   10
         Top             =   240
         Width           =   1695
         Begin VB.OptionButton optTexteSélectionné 
            Caption         =   "Texte &sélectionné"
            Height          =   255
            Left            =   0
            TabIndex        =   13
            Top             =   600
            Width           =   1650
         End
         Begin VB.OptionButton optTousLesFichiers 
            Caption         =   "T&ous les fichiers"
            Height          =   255
            Left            =   0
            TabIndex        =   12
            Top             =   300
            Width           =   1650
         End
         Begin VB.OptionButton optFichierEnCours 
            Caption         =   "&Fichier en cours"
            Height          =   255
            Left            =   0
            TabIndex        =   11
            Top             =   0
            Value           =   -1  'True
            Width           =   1650
         End
      End
   End
   Begin VB.ComboBox cboRechercher 
      Height          =   315
      Left            =   1260
      TabIndex        =   1
      Top             =   60
      Width           =   2655
   End
   Begin VB.Label lblRemplacer 
      AutoSize        =   -1  'True
      Caption         =   "Rem&placer par :"
      Height          =   195
      Left            =   60
      TabIndex        =   2
      Top             =   510
      Width           =   1125
   End
   Begin VB.Label lblRechercher 
      AutoSize        =   -1  'True
      Caption         =   "&Rechercher :"
      Height          =   195
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   930
   End
End
Attribute VB_Name = "frmRecherche"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnAnnuler_Click()
  Hide
End Sub

' Gère l'historique de combo rechercher et remplacer
Sub MémoriseHistorique()
  ' Si le texte à rechercher est dans l'historique, on le supprime
  ' avant de l'ajouter en tête
  ' Attention: Quand on fait un removeitem alors que l'élément
  ' sélectionné a été choisi dans la liste, la propriété text est effacée
  ' D'ou la variable sSauve…
  Dim i As Integer
  Dim sSauve As String
  
  sSauve = cboRechercher.Text
  For i = 0 To cboRechercher.ListCount - 1
    If cboRechercher.List(i) = sSauve Then
      cboRechercher.RemoveItem i
      Exit For
    End If
  Next
  cboRechercher.AddItem sSauve, 0
  cboRechercher.Text = sSauve
  
  If cboRemplacer.Visible Then
    sSauve = cboRemplacer.Text
    For i = 0 To cboRemplacer.ListCount - 1
      If cboRemplacer.List(i) = sSauve Then
        cboRemplacer.RemoveItem i
        Exit For
      End If
    Next
    cboRemplacer.AddItem sSauve, 0
    cboRemplacer.Text = sSauve
  End If
End Sub

Private Sub btnRemplacer_Click()
  Hide
  MémoriseHistorique
  mdiEditeur.DoRemplacer False
End Sub

Private Sub btnRemplacerTout_Click()
  Hide
  MémoriseHistorique
  mdiEditeur.DoRemplacer True
End Sub

Private Sub btnSuivant_Click()
  Hide
  MémoriseHistorique
  mdiEditeur.DoRechercher
End Sub

Private Sub cboRechercher_Change()
  btnSuivant.Enabled = (cboRechercher <> "")
  btnRemplacer.Enabled = (cboRechercher <> "")
  btnRemplacerTout.Enabled = (cboRechercher <> "")
End Sub

Private Sub Form_Activate()
  cboRechercher_Change
  cboRechercher.SetFocus
End Sub

Public Sub Rechercher()
  Caption = "Rechercher"
  lblRemplacer.Visible = False
  cboRemplacer.Visible = False
  btnRemplacer.Visible = False
  btnRemplacerTout.Visible = False
  
  Show 1
End Sub

Public Sub Remplacer()
  Caption = "Remplacer"
  lblRemplacer.Visible = True
  cboRemplacer.Visible = True
  btnRemplacer.Visible = True
  btnRemplacerTout.Visible = True
  
  Show 1
End Sub

