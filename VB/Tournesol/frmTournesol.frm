VERSION 5.00
Begin VB.Form frmTournesol 
   Caption         =   "Graines de tournesol"
   ClientHeight    =   5370
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6510
   LinkTopic       =   "Form1"
   ScaleHeight     =   5370
   ScaleWidth      =   6510
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmTournesol"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTournesol
' Étude de l'angle optimal de pousse des graines de tournesol
' 9/11/8 PV
' Calcule l'énergie de répulsion (somme des 1/d²) entre les
' graines poussant régulièrement espacées (angle) sur une
' spirale, en fonction de l'angle
' Le minimum est pour l'angle d'or, 137,5°

Option Explicit

Const pi As Double = 3.1416926536

Const nbp = 100   ' Nb de pousses
Const dr = 1      ' Delta rayon à chaque pousse

Public Function Calcul(ByVal dAngle As Single) As Single
  dAngle = dAngle / 180 * pi
  
  Dim t As Single, r As Single
  Dim i As Integer, j As Integer
  Dim rep As Single
  
  Dim x(nbp) As Single, y(nbp) As Single
  
  Cls
  Scale (-100, -100)-(100, 100)
  t = 0
  r = 0
  For i = 1 To nbp
    r = r + dr
    t = t + dAngle
    If t > 2 * pi Then t = t - 2 * pi
    
    x(i) = r * Cos(t)
    y(i) = r * Sin(t)
    
    Circle (x(i), y(i)), 1
    
    For j = 1 To i - 1
      rep = rep + 1 / ((x(i) - x(j)) * (x(i) - x(j)) + (y(i) - y(j)) * (y(i) - y(j)))
    Next
  Next
  Calcul = rep
End Function

Private Sub Form_Load()
  Show
  frmContrôle.Show
  frmContrôle.ZOrder 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
  End
End Sub
