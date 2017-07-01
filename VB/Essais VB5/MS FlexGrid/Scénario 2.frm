VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "MS FlexGrid scénario 2, édition"
   ClientHeight    =   6780
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7995
   LinkTopic       =   "Form1"
   ScaleHeight     =   6780
   ScaleWidth      =   7995
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtEdit 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   2280
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   700
      Visible         =   0   'False
      Width           =   1335
   End
   Begin MSFlexGridLib.MSFlexGrid fg2 
      Height          =   5655
      Left            =   720
      TabIndex        =   0
      Top             =   240
      Width           =   6615
      _ExtentX        =   11668
      _ExtentY        =   9975
      _Version        =   327680
      Rows            =   20
      Cols            =   6
      FocusRect       =   2
      FillStyle       =   1
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Utilisation de FlexGrid, scénario 2
' 21/4/97 PV
' Manuel de l'utilisateur VB, P. 296

Option Explicit

Sub Form_Load()
  Dim i As Integer

  ' Rétrécit la première colonne.
  fg2.ColWidth(0) = fg2.ColWidth(0) / 2
  fg2.ColAlignment(0) = 1 ' Centrer.

  ' Donne un en-tête aux lignes et aux
  ' colonnes.
  For i = fg2.FixedRows To fg2.Rows - 1
    fg2.TextArray(Fgi(i, 0)) = i
  Next
  For i = fg2.FixedCols To fg2.Cols - 1
    fg2.TextArray(Fgi(0, i)) = i
  Next

  ' Initialise la zone de texte (ainsi elle
  ' se charge maintenant).
  txtEdit = ""
End Sub
    
Function Fgi(r As Integer, c As Integer) As Integer
  Fgi = c + fg2.Cols * r
End Function

Sub Fg2_KeyPress(KeyAscii As Integer)
  MSFlexGridEdit fg2, txtEdit, KeyAscii
End Sub

Sub Fg2_DblClick()
  MSFlexGridEdit fg2, txtEdit, 32 ' Simule un espace.
End Sub
  
Sub MSFlexGridEdit(MSFlexGrid As Control, _
Edt As Control, KeyAscii As Integer)

  ' Utilise le caractère qui a été tapé.
  Select Case KeyAscii

  ' Un espace signifie “modifier le texte en cours”.
  Case 0 To 32
    Edt = MSFlexGrid
    Edt.SelStart = 1000

  ' Tout autre élément signifie “remplacer le
  ' texte en cours”.
  Case Else
    Edt = Chr(KeyAscii)
    Edt.SelStart = 1
  End Select

  ' Affiche Edt au bon endroit.
  Edt.Move MSFlexGrid.Left + MSFlexGrid.CellLeft, MSFlexGrid.Top + MSFlexGrid.CellTop, MSFlexGrid.CellWidth, MSFlexGrid.CellHeight
  Edt.Visible = True

  ' Et laisse l'opération s'effectuer.
  Edt.SetFocus
End Sub
  
Sub txtEdit_KeyPress(KeyAscii As Integer)
  ' Supprime les retours pour éliminer le bip.
  If KeyAscii = 13 Then KeyAscii = 0
End Sub

Sub txtEdit_KeyDown(KeyCode As Integer, _
Shift As Integer)
  EditKeyCode fg2, txtEdit, KeyCode, Shift
End Sub

Sub EditKeyCode(MSFlexGrid As Control, Edt As _
Control, KeyCode As Integer, Shift As Integer)

  ' Traitement de contrôle d'édition standard.
  Select Case KeyCode

  Case 27 ' ÉCHAP : masque, renvoie le focus
        ' à MSFlexGrid.
    Edt.Visible = False
    MSFlexGrid.SetFocus

  Case 13 ' ENTRÉE renvoie le focus à MSFlexGrid.
    MSFlexGrid.SetFocus

  Case 38   ' Haut.
    MSFlexGrid.SetFocus
    DoEvents
    If MSFlexGrid.Row > MSFlexGrid.FixedRows Then
      MSFlexGrid.Row = MSFlexGrid.Row - 1
    End If

  Case 40   ' Bas.
    MSFlexGrid.SetFocus
    DoEvents
    If MSFlexGrid.Row < MSFlexGrid.Rows - 1 Then
      MSFlexGrid.Row = MSFlexGrid.Row + 1
    End If
  End Select
End Sub
    

Sub Fg2_GotFocus()
  If txtEdit.Visible = False Then Exit Sub
  fg2 = txtEdit
  txtEdit.Visible = False
End Sub

Sub Fg2_LeaveCell()
  If txtEdit.Visible = False Then Exit Sub
  fg2 = txtEdit
  txtEdit.Visible = False
End Sub
    

