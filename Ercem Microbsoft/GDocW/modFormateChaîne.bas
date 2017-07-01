Attribute VB_Name = "modFormateCha�ne"
' module modFormateCha�ne
' Justifie une cha�ne � gauche ou � droite
' 2/2/99 PV

Option Explicit

Public Enum eJust
  ejDroite
  ejGauche
End Enum

Public Function sJustifieCha�ne(ByVal s As String, iLargeur As Integer, eTypeJust As eJust) As String
  If Len(s) > iLargeur Then
    sJustifieCha�ne = Left(s, iLargeur)
    Exit Function
  End If
  
  Select Case eTypeJust
    Case ejDroite: sJustifieCha�ne = Space(iLargeur - Len(s)) & s
    Case ejGauche: sJustifieCha�ne = s & Space(iLargeur - Len(s))
  End Select
End Function


