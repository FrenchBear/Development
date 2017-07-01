VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSynonymes 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Synonymes"
   ClientHeight    =   2970
   ClientLeft      =   1680
   ClientTop       =   3135
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2970
   ScaleWidth      =   6585
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   1380
      TabIndex        =   5
      Top             =   2460
      Width           =   1095
   End
   Begin VB.CommandButton btnSupprimer 
      Caption         =   "&Supprimer"
      Height          =   375
      Left            =   3900
      TabIndex        =   4
      Top             =   2460
      Width           =   1095
   End
   Begin VB.CommandButton btnAjouter 
      Caption         =   "&Ajouter"
      Height          =   375
      Left            =   2640
      TabIndex        =   3
      Top             =   2460
      Width           =   1095
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   2460
      Width           =   1095
   End
   Begin MSComctlLib.ListView lwSynonymes 
      Height          =   1995
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   3519
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   327680
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MouseIcon       =   "frmSynonymes.frx":0000
      NumItems        =   0
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Liste des synonymes d'imprimantes :"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2535
   End
End
Attribute VB_Name = "frmSynonymes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public bModifié As Boolean

Private Sub btnAjouter_Click()
  frmAjoutSynonyme.Show 1
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnOk_Click()
  If bModifié Then
    On Error Resume Next
    DeleteSetting "WPrint", "Synonymes"
    On Error GoTo 0
    Dim l As ListItem
    For Each l In lwSynonymes.ListItems
      SaveSetting "WPrint", "Synonymes", l.Text, l.SubItems(1)
    Next
    ' On relit le tableau en mémoire
    LitSynonymes
  End If
  Unload Me
End Sub

Private Sub AfficheSynonymes()
  If Not IsEmpty(tSynonymes) Then
    Dim i As Integer
    For i = 0 To UBound(tSynonymes, 1)
      Dim itmX As ListItem
      Set itmX = lwSynonymes.ListItems.Add
      itmX.Text = tSynonymes(i, 0)
      itmX.SubItems(1) = tSynonymes(i, 1)
    Next
  End If
End Sub

Private Sub btnSupprimer_Click()
  
  If Not lwSynonymes.SelectedItem Is Nothing Then
    lwSynonymes.ListItems.Remove lwSynonymes.SelectedItem.Index
    bModifié = True
  End If
End Sub

Private Sub Form_Load()
  lwSynonymes.View = lvwReport
  Dim ch As ColumnHeader
  Set ch = lwSynonymes.ColumnHeaders.Add
  ch.Text = "Imprimante"
  ch.Width = 2800
  Set ch = lwSynonymes.ColumnHeaders.Add
  ch.Text = "Synonyme"
  ch.Width = 2800
  
  AfficheSynonymes
  bModifié = False
End Sub

