VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.2#0"; "COMCTL32.OCX"
Begin VB.Form frmTestListView 
   Caption         =   "Test du contrôle ListView"
   ClientHeight    =   3315
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   5985
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3315
   ScaleWidth      =   5985
   Begin VB.CommandButton Command1 
      Caption         =   "Générer une liste"
      Height          =   495
      Left            =   4620
      TabIndex        =   1
      Top             =   2640
      Width           =   1215
   End
   Begin ComctlLib.ListView lwUtilisateurs 
      Height          =   2295
      Left            =   180
      TabIndex        =   0
      Top             =   180
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   4048
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Numéro"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Nom"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Lettres"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "frmTestListView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  Dim i As Integer
  Dim itmX As ListItem
  
  For i = 1 To 10
    Set itmX = lwUtilisateurs.ListItems.Add()
    itmX.Text = "ListItem " & i
    itmX.SubItems(1) = Rnd
    itmX.SubItems(2) = "Subitem 2"
  Next i

End Sub

Private Sub lwUtilisateurs_ColumnClick(ByVal ColumnHeader As ColumnHeader)
  If lwUtilisateurs.SortKey = ColumnHeader.Index - 1 Then
    lwUtilisateurs.SortOrder = 1 - lwUtilisateurs.SortOrder
  Else
    lwUtilisateurs.SortKey = ColumnHeader.Index - 1
  End If
End Sub

Private Sub lwUtilisateurs_ItemClick(ByVal Item As ListItem)
  MsgBox "Item: " & Item.Index
End Sub
