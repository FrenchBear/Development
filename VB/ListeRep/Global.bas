Attribute VB_Name = "Global"
Option Explicit

Public Const AppName = "ListeRep"

Declare Function OemToChar Lib "user32" Alias "OemToCharA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long
Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long


' =================================================================================
' Conversions générales OEM - ANSI

Public Function sOEMtoANSI(ByVal sChaîne As String) As String
  Dim sRésultat As String
  sRésultat = sChaîne
  OemToChar sChaîne, sRésultat
  sOEMtoANSI = sRésultat
End Function

Public Function sANSItoOEM(ByVal sChaîne As String) As String
  Dim sRésultat As String
  sRésultat = sChaîne
  CharToOem sChaîne, sRésultat
  sANSItoOEM = sRésultat
End Function


