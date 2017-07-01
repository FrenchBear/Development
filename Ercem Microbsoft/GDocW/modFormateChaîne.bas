Attribute VB_Name = "modFormateChaîne"
' module modFormateChaîne
' Justifie une chaîne à gauche ou à droite
' 2/2/99 PV

Option Explicit

Public Enum eJust
  ejDroite
  ejGauche
End Enum

Public Function sJustifieChaîne(ByVal s As String, iLargeur As Integer, eTypeJust As eJust) As String
  If Len(s) > iLargeur Then
    sJustifieChaîne = Left(s, iLargeur)
    Exit Function
  End If
  
  Select Case eTypeJust
    Case ejDroite: sJustifieChaîne = Space(iLargeur - Len(s)) & s
    Case ejGauche: sJustifieChaîne = s & Space(iLargeur - Len(s))
  End Select
End Function


