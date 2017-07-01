VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FDR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe FDR
' Contient à la fois le nom de la structure client et la feuille de route
' Sert pour le cache de l'appel à la fonction FDR de msd
' 24/10/2000 PV

Option Explicit

Public iNiveau As Integer     ' de 2 (secteur) à 5 (groupe)
Public iNumXXX As Long
Public sNom As String         ' Nom de l'élément de la structure
Public sFdr As String         ' Texte de la feuille de route
Public iParent                ' Long, mais peut être null (secteur)

Function Copie() As FDR
  Dim k As New FDR
  With k
    .iNiveau = iNiveau
    .iNumXXX = iNumXXX
    .sNom = sNom
    .sFdr = sFdr
    .iParent = iParent
  End With
  Set Copie = k
End Function

