VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmFichiers 
   Caption         =   "Liste des fichiers"
   ClientHeight    =   4680
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6165
   Icon            =   "frmFichiers.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4680
   ScaleWidth      =   6165
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ListView lvFichiers 
      Height          =   2235
      Left            =   780
      TabIndex        =   0
      Top             =   660
      Width           =   4335
      _ExtentX        =   7646
      _ExtentY        =   3942
      View            =   2
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
End
Attribute VB_Name = "frmFichiers"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmFichiers
' Affichage de la liste complète des fichiers
' 20/12/98 PV
'  2/01/99 PV Optimisation: hide au lieu de unload sur fermeture; ListView au lieu de la liste standard
' 10/01/99 PV Toujours au-dessus de frmAfficheImage


Option Explicit

Private Declare Function SetWindowWord Lib "user32" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal wNewWord As Long) As Long

Const GWW_HWNDPARENT = (-8)
Dim OriginalParenthWnd As Long



Private Sub Form_Resize()
    lvFichiers.Move 0, 0, ScaleWidth, ScaleHeight
End Sub

Private Sub lvFichiers_DblClick()
    Me.Hide
End Sub

Private Sub lvFichiers_ItemClick(ByVal Item As MSComctlLib.ListItem)
    frmAfficheImage.cboFichiers.ListIndex = Item.Index - 1
End Sub

Private Sub lvFichiers_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 46 Then   ' Suppr
        frmAfficheImage.SupprimeImage
        'lvFichiers.SelectedItem.Text = "[Supprimé]"
        lvFichiers.ListItems.Remove lvFichiers.SelectedItem.Index

        Let frmFichiers.lvFichiers.SelectedItem = frmFichiers.lvFichiers.ListItems(frmAfficheImage.iPos + 1)
    End If
End Sub


' Optimisation
' La fermeture avec la croix ne fait que cacher la fenêtre
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode = 0 Then  ' Croix de fermeture
        Me.Hide
        Cancel = 1
        Exit Sub
    End If
    Cancel = 0
End Sub


Sub Form_Load()
' Set parent for the toolbar to display on top of:
    OriginalParenthWnd = SetWindowWord(Me.hwnd, GWW_HWNDPARENT, frmAfficheImage.hwnd)

    '  Me.Width = Form1.Width \ 3      ' Scale child form
    '  Me.Height = Form1.Height \ 3
End Sub


Private Sub Form_Unload(Cancel As Integer)
    Dim ret As Long

    ' Return the original parent handle to avoid a GP Fault
    ret = SetWindowWord(Me.hwnd, GWW_HWNDPARENT, OriginalParenthWnd)
End Sub

