VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Fraction"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public Numérateur As Long
Public Dénominateur As Long
Public Valeur As Double

Public Sub Définit(N As Long, D As Long)
    If D = 0 Then Stop
    Numérateur = N
    Dénominateur = D
    Valeur = N / D
End Sub

Public Sub Affiche()
    Debug.Print Numérateur; "/"; Dénominateur; "="; Valeur
End Sub

Public Sub Inverse()
    If Numérateur = 0 Or Valeur = 0 Then Stop
    Dim t As Long
    t = Numérateur
    Numérateur = Dénominateur
    Dénominateur = t
    Valeur = 1 / Valeur
End Sub

Public Sub Ajoute(g As Fraction)
' Pour la valeur flottante, c'est simple !
    Valeur = Valeur + g.Valeur

    Dim n1 As Long, n2 As Long, D1 As Long, D2 As Long
    n1 = Numérateur
    D1 = Dénominateur
    n2 = g.Numérateur
    D2 = g.Dénominateur

    Dénominateur = D1 * D2
    Numérateur = n1 * D2 + n2 * D1

    ' Simplification de la fraction
    Dim P As Long
    P = PGCD(Numérateur, Dénominateur)
    If P > 1 Then
        Numérateur = Numérateur / P
        Dénominateur = Dénominateur / P
    End If
End Sub

