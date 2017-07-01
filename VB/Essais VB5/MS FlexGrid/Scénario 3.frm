VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7635
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8055
   LinkTopic       =   "Form1"
   ScaleHeight     =   7635
   ScaleWidth      =   8055
   StartUpPosition =   3  'Windows Default
   Begin MSFlexGridLib.MSFlexGrid fg3 
      Height          =   6615
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   7095
      _ExtentX        =   12515
      _ExtentY        =   11668
      _Version        =   327680
      Cols            =   4
      FocusRect       =   0
      FillStyle       =   1
      GridLines       =   0
      FormatString    =   "^      |Description       |>Date           |>Montant      "
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Utilisation de FlexGrid, scénario 3
' 21/4/97 PV
' Manuel de l'utilisateur VB, P. 301

Option Explicit

Sub Form_Load()
  Dim i As Integer, tot As Integer
  Dim t As String, s As String

  ' Crée des exemples de données.
  t = Chr(9)
  fg3.Rows = 1

  fg3.AddItem "*" + t + "Prix du billet d'avion "
  s = "" + t + "SFO-JFK" + t + "9-Avr-95" + t + "750,00"
  For i = 0 To 5
    fg3.AddItem s
  Next

  fg3.AddItem "*" + t + "Repas"
  s = "" + t + "Flint's BBQ" + t + "25-Avr-95" _
  + t + "35.00"
  For i = 0 To 5
    fg3.AddItem s
  Next

  fg3.AddItem "*" + t + "Hôtel"
  s = "" + t + "Center Plaza" + t + "25-Avr-95" _
  + t + "817.00"
  For i = 0 To 5
    fg3.AddItem s
  Next

  ' Calcule les totaux et met en forme les entrées
  ' des en-têtes.
  For i = fg3.Rows - 1 To 0 Step -1
    If fg3.TextArray(i * fg3.Cols) = "" Then
      tot = tot + Val(fg3.TextArray(i * fg3.Cols + 3))
    Else
      fg3.Row = i
      fg3.Col = 0
      fg3.ColSel = fg3.Cols - 1
      fg3.CellBackColor = &HC0C0C0
      fg3.CellFontBold = True
      fg3.CellFontWidth = 8
      fg3.TextArray(i * fg3.Cols + 3) = _
      Format(tot, "0")
      tot = 0
    End If
  Next

  ' Sélectionne la première ligne.
  fg3.Col = 1
  fg3.Row = 1
  fg3.ColSel = fg3.Cols - 1
End Sub

Sub Fg3_DblClick()
  Dim i As Integer, r As Integer

  ' Ignore la ligne du haut.
  r = fg3.MouseRow
  If r < 1 Then Exit Sub

  ' Trouve le champ à réduire ou développer.
  While r > 0 And fg3.TextArray(r * fg3.Cols) = ""
    r = r - 1
  Wend

  ' Affiche le symbole réduit/agrandi sur la
  ' première colonne.
  If fg3.TextArray(r * fg3.Cols) = "*" Then
    fg3.TextArray(r * fg3.Cols) = "+"
  Else
    fg3.TextArray(r * fg3.Cols) = "*"
  End If

  ' Agrandit les éléments placés sous
  ' l'en-tête en cours.
  r = r + 1
  If fg3.RowHeight(r) = 0 Then
    Do While fg3.TextArray(r * fg3.Cols) = ""
      fg3.RowHeight(r) = -1 ' Hauteur par défaut
                      ' de la ligne.
      r = r + 1
      If r >= fg3.Rows Then Exit Do
    Loop

  ' Réduit les éléments placés sous l'en-tête
  ' en cours.
  Else
    Do While fg3.TextArray(r * fg3.Cols) = ""
      fg3.RowHeight(r) = 0  ' Masque la ligne.
      r = r + 1
      If r >= fg3.Rows Then Exit Do
    Loop
  End If
End Sub
  
