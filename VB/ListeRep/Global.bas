Attribute VB_Name = "Global"
Option Explicit

Public Const AppName = "ListeRep"

Declare Function OemToChar Lib "user32" Alias "OemToCharA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long
Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long


' =================================================================================
' Conversions g�n�rales OEM - ANSI

Public Function sOEMtoANSI(ByVal sCha�ne As String) As String
  Dim sR�sultat As String
  sR�sultat = sCha�ne
  OemToChar sCha�ne, sR�sultat
  sOEMtoANSI = sR�sultat
End Function

Public Function sANSItoOEM(ByVal sCha�ne As String) As String
  Dim sR�sultat As String
  sR�sultat = sCha�ne
  CharToOem sCha�ne, sR�sultat
  sANSItoOEM = sR�sultat
End Function


