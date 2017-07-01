VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmEtbAttachés 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Etablissements rattachés à une FEU"
   ClientHeight    =   5475
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6390
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmEtbAttachés.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5475
   ScaleWidth      =   6390
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnFermer 
      Cancel          =   -1  'True
      Caption         =   "&Fermer"
      Height          =   375
      Left            =   4980
      TabIndex        =   3
      Top             =   60
      Width           =   1335
   End
   Begin MSComctlLib.ListView lwEtablissements 
      Height          =   4935
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   8705
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "N°"
         Object.Width           =   882
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Préfixe"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Nom"
         Object.Width           =   5644
      EndProperty
   End
   Begin MSWLess.WLText txtNumFeu 
      Height          =   315
      Left            =   1020
      TabIndex        =   0
      Top             =   60
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "N° FEU :"
      Height          =   210
      Left            =   60
      TabIndex        =   1
      Top             =   120
      Width           =   795
   End
End
Attribute VB_Name = "frmEtbAttachés"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmEtbAttachés
' Affiche la liste des établissements rattachés à une FEU
' 13/02/98 PV

Option Explicit

Private Sub btnFermer_Click()
  Unload Me
End Sub

Public Sub AfficheEtbAttachés(ByVal iFeu As Long)
  lwEtablissements.ListItems.Clear
  Show
  ZOrder 0
  txtNumFeu = iFeu
  Screen.MousePointer = vbHourglass
  Dim cEtb As New BDCurseur
  cEtb.OpenCurseur "select etb_numetb,etb_prefixe,etb_nom from etablissement where etb_feu=" & iFeu
  While Not cEtb.EOF
    Dim itmX As ListItem
    Set itmX = lwEtablissements.ListItems.Add
    itmX.Text = cEtb!etb_numetb
    itmX.SubItems(1) = cEtb!etb_prefixe
    itmX.SubItems(2) = cEtb!etb_nom
    cEtb.MoveNext
  Wend
  cEtb.CloseCurseur
  Screen.MousePointer = vbDefault
End Sub

Private Sub lwEtablissements_ColumnClick(ByVal ColumnHeader As ColumnHeader)
  lwEtablissements.Sorted = True
  If lwEtablissements.SortKey = ColumnHeader.Index - 1 Then
    lwEtablissements.SortOrder = 1 - lwEtablissements.SortOrder
  Else
    lwEtablissements.SortKey = ColumnHeader.Index - 1
    lwEtablissements.SortOrder = 0
  End If
End Sub

