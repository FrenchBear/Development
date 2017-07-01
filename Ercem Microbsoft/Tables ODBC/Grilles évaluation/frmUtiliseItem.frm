VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmUtiliseItem 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Utilisation de l'item sélectionné"
   ClientHeight    =   4545
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7560
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmUtiliseItem.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   7560
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnFermer 
      Cancel          =   -1  'True
      Caption         =   "&Fermer"
      Height          =   375
      Left            =   6180
      TabIndex        =   2
      Top             =   60
      Width           =   1335
   End
   Begin VB.TextBox txtNumItem 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1020
      Locked          =   -1  'True
      TabIndex        =   0
      Top             =   60
      Width           =   855
   End
   Begin MSComctlLib.ListView lwGrilles 
      Height          =   4035
      Left            =   60
      TabIndex        =   3
      Top             =   480
      Width           =   7455
      _ExtentX        =   13150
      _ExtentY        =   7117
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "N° grille"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Titre de la grille"
         Object.Width           =   10583
      EndProperty
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "N° Item :"
      Height          =   210
      Left            =   60
      TabIndex        =   1
      Top             =   120
      Width           =   870
   End
End
Attribute VB_Name = "frmUtiliseItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmUtiliseItem
' Affiche les n°s de grilles où l'item est utilisé
' 30/11/99 NC

Option Explicit

Private Sub btnFermer_Click()
  Unload Me
End Sub

Public Sub AfficheUtiliseItem(ByVal iItem As Long)
  lwGrilles.ListItems.Clear
  Show
  ZOrder 0
  txtNumItem = iItem
  Screen.MousePointer = vbHourglass
  Dim cGri As New BDCurseur
  cGri.OpenCurseur ("select unique cg_numgri, tit_titre1 from corgri,items, titgri where it_numit=cg_numit and cg_numgri=tit_numgri and it_numit=" & iItem & " and tit_langue='" & cLangage & "'" & " and it_langue='" & cLangage & "'")
  While Not cGri.EOF
    Dim itmX As ListItem
    Set itmX = lwGrilles.ListItems.Add
    itmX.Text = cGri!cg_numgri
    itmX.SubItems(1) = cGri!tit_Titre1
    cGri.MoveNext
  Wend
  cGri.CloseCurseur
  Screen.MousePointer = vbDefault
End Sub

Private Sub lwGrilles_ColumnClick(ByVal ColumnHeader As ColumnHeader)
  lwGrilles.Sorted = True
  If lwGrilles.SortKey = ColumnHeader.Index - 1 Then
    lwGrilles.SortOrder = 1 - lwGrilles.SortOrder
  Else
    lwGrilles.SortKey = ColumnHeader.Index - 1
    lwGrilles.SortOrder = 0
  End If
End Sub
