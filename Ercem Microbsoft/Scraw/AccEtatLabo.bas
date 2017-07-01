Attribute VB_Name = "AccEtat"
Attribute VB_Description = "Petit module pour d�coder les valeur du champ ""�tat labo"" et ""�tat PH"""
' AccEtat
' Petit module pour d�coder les valeur du champ "�tat labo" et "�tat PH"
' 17/9/97 PV

Option Explicit

Public Function sLibell�EtatLabo(ByVal Etat) As String
  If Etat = "" Then
    sLibell�EtatLabo = ""
    Exit Function
  End If
  Select Case Etat
    Case "0": sLibell�EtatLabo = sGetIntlLib("ELEtatL0", "S�rie pr�par�e")
    Case "1": sLibell�EtatLabo = sGetIntlLib("ELEtatL1", "Lecture commenc�e")
    Case "2": sLibell�EtatLabo = sGetIntlLib("ELEtatL2", "Lecture termin�e")
    Case "3": sLibell�EtatLabo = sGetIntlLib("ELEtatL3", "Valid� V")
    Case "4": sLibell�EtatLabo = sGetIntlLib("ELEtatL4", "Valid� d�finitif")
    Case Else: sLibell�EtatLabo = sprintf(sGetIntlLib("ELEtatAut", "�tat labo"), Etat)
  End Select
End Function


Public Function sLibell�EtatPH(ByVal Etat) As String
  If Etat = "" Then
    sLibell�EtatPH = ""
    Exit Function
  End If
  Select Case Etat
    Case "1": sLibell�EtatPH = sGetIntlLib("ELEtatPH1", "Saisie minimum, saisie labo")
    Case "2": sLibell�EtatPH = sGetIntlLib("ELEtatPH2", "Saisie partie haute SL, non valid�e")
    Case "3": sLibell�EtatPH = sGetIntlLib("ELEtatPH3", "Saisie partie haute valid�e")
    Case Else: sLibell�EtatPH = sprintf(sGetIntlLib("ELEtatPHAut", "�tat PH"), Etat)
  End Select
End Function

