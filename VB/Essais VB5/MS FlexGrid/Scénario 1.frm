VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5745
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7875
   LinkTopic       =   "Form1"
   ScaleHeight     =   5745
   ScaleWidth      =   7875
   StartUpPosition =   3  'Windows Default
   Begin MSFlexGridLib.MSFlexGrid fg1 
      Height          =   5295
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   9340
      _Version        =   327680
      Rows            =   20
      Cols            =   4
      MergeCells      =   2
      FormatString    =   "<Région            |<Produit          |<Employé        |>Ventes       "
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Utilisation de FlexGrid, scénario 1
' 21/4/97 PV
' Manuel de l'utilisateur VB, P. 292

Option Explicit

Sub Form_Load()
  Dim I As Integer
  ' Crée tableau.
  For I = fg1.FixedRows To fg1.Rows - 1
    ' Région.
    fg1.TextArray(Fgi(I, 0)) = RandomString(0)
    ' Produit.
    fg1.TextArray(Fgi(I, 1)) = RandomString(1)
    ' Employé.
    fg1.TextArray(Fgi(I, 2)) = RandomString(2)
    fg1.TextArray(Fgi(I, 3)) = _
    Format(Rnd * 10000, "#.00")
  Next

  ' Paramétrage de la fusion.
  fg1.MergeCol(0) = True
  fg1.MergeCol(1) = True
  fg1.MergeCol(2) = True

  ' Trie pour voir le résultat.
  DoSort
End Sub

Function Fgi(r As Integer, c As Integer) As Integer
  Fgi = c + fg1.Cols * r
End Function

Sub DoSort()
  fg1.Col = 0
  fg1.ColSel = fg1.Cols - 1
  fg1.Sort = 1  ' Ordre croissant générique.
End Sub
  
Function RandomString(kind As Integer)
  Dim s As String
  Select Case kind

    Case 0  ' Région.
      Select Case (Rnd * 1000) Mod 5
        Case 0: s = "1. Nord-Ouest"
        Case 1: s = "2. Sud-Ouest"
        Case 2: s = "3. Nord-Est"
        Case 3: s = "4. Sud-Est"
        Case Else: s = "5. Étranger"
      End Select

    Case 1  ' Produit.
      Select Case (Rnd * 1000) Mod 5
        Case 0: s = "1. Wahoos"
        Case 1: s = "2. Trinkets"
        Case 2: s = "3. Foobars"
        Case Else: s = "4. Applets"
      End Select

    Case 2  ' Employé.
      Select Case (Rnd * 1000) Mod 4
        Case 0: s = "Marie"
        Case 1: s = "Sarah"
        Case 2: s = "Donna"
        Case Else: s = "Paula"
      End Select
  End Select
  RandomString = s
End Function
  

Sub Fg1_MouseDown(Button As Integer, _
Shift As Integer, X As Single, Y As Single)
  fg1.Tag = ""
  If fg1.MouseRow <> 0 Then Exit Sub
  fg1.Tag = Str(fg1.MouseCol)
  MousePointer = vbSizeWE
End Sub
    
Sub Fg1_MouseUp(Button As Integer, Shift As _
Integer, X As Single, Y As Single)
  MousePointer = vbDefault
  If fg1.Tag = "" Then Exit Sub
  fg1.Redraw = False
  fg1.ColPosition(Val(fg1.Tag)) = fg1.MouseCol
  DoSort
  fg1.Redraw = True
End Sub


