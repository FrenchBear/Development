Attribute VB_Name = "AccEtat"
Attribute VB_Description = "Petit module pour décoder les valeur du champ ""état labo"" et ""état PH"""
' AccEtat
' Petit module pour décoder les valeur du champ "état labo" et "état PH"
' 17/9/97 PV

Option Explicit

Public Function sLibelléEtatLabo(ByVal Etat) As String
  If Etat = "" Then
    sLibelléEtatLabo = ""
    Exit Function
  End If
  Select Case Etat
    Case "0": sLibelléEtatLabo = sGetIntlLib("ELEtatL0", "Série préparée")
    Case "1": sLibelléEtatLabo = sGetIntlLib("ELEtatL1", "Lecture commencée")
    Case "2": sLibelléEtatLabo = sGetIntlLib("ELEtatL2", "Lecture terminée")
    Case "3": sLibelléEtatLabo = sGetIntlLib("ELEtatL3", "Validé V")
    Case "4": sLibelléEtatLabo = sGetIntlLib("ELEtatL4", "Validé définitif")
    Case Else: sLibelléEtatLabo = sprintf(sGetIntlLib("ELEtatAut", "État labo"), Etat)
  End Select
End Function


Public Function sLibelléEtatPH(ByVal Etat) As String
  If Etat = "" Then
    sLibelléEtatPH = ""
    Exit Function
  End If
  Select Case Etat
    Case "1": sLibelléEtatPH = sGetIntlLib("ELEtatPH1", "Saisie minimum, saisie labo")
    Case "2": sLibelléEtatPH = sGetIntlLib("ELEtatPH2", "Saisie partie haute SL, non validée")
    Case "3": sLibelléEtatPH = sGetIntlLib("ELEtatPH3", "Saisie partie haute validée")
    Case Else: sLibelléEtatPH = sprintf(sGetIntlLib("ELEtatPHAut", "État PH"), Etat)
  End Select
End Function

