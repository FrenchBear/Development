VERSION 5.00
Begin VB.Form frmAjoutSynonyme 
   Caption         =   "Ajout d'un synonyme"
   ClientHeight    =   1650
   ClientLeft      =   2295
   ClientTop       =   2865
   ClientWidth     =   6045
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1650
   ScaleWidth      =   6045
   Begin VB.CommandButton Command1 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   1380
      TabIndex        =   5
      Top             =   1140
      Width           =   1095
   End
   Begin VB.TextBox txtSynonyme 
      Height          =   315
      Left            =   1680
      TabIndex        =   1
      Top             =   120
      Width           =   4155
   End
   Begin VB.ComboBox cboImprimanteRéelle 
      Height          =   315
      Left            =   1680
      TabIndex        =   3
      Top             =   480
      Width           =   4155
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   1140
      Width           =   1095
   End
   Begin VB.Label Label2 
      Caption         =   "&Imprimante réelle :"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   540
      Width           =   1395
   End
   Begin VB.Label Label1 
      Caption         =   "&Synonyme :"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   1395
   End
End
Attribute VB_Name = "frmAjoutSynonyme"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnOk_Click()
  Dim itmX As ListItem
  Set itmX = frmSynonymes.lwSynonymes.ListItems.Add
  itmX.Text = txtSynonyme
  itmX.SubItems(1) = cboImprimanteRéelle
  frmSynonymes.bModifié = True
  Unload Me
End Sub

Private Sub cboImprimanteRéelle_Change()
  btnOk.Enabled = txtSynonyme <> "" And cboImprimanteRéelle <> ""
End Sub

Private Sub cboImprimanteRéelle_Click()
  btnOk.Enabled = txtSynonyme <> "" And cboImprimanteRéelle <> ""
End Sub

Private Sub Command1_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Dim p As Printer
  For Each p In Printers
    cboImprimanteRéelle.AddItem p.DeviceName
  Next
End Sub

Private Sub txtSynonyme_Change()
  btnOk.Enabled = txtSynonyme <> "" And cboImprimanteRéelle <> ""
End Sub
