Attribute VB_Name = "AccLieuAnalyse"
Attribute VB_Description = "Petit module pour décoder les valeur du champ ""lieu analyse"""
' AccLieuAnalyse
' Petit module pour décoder les valeur du champ "lieu analyse"
' Pour l'instant implanté "codé endur", mais pourra communiquer ultérieurement avec un démon
' 17/9/97 PV

Option Explicit

Public Function sLibelléLieuAnalyse(ByVal sLieu As String) As String
  Select Case sLieu
'    Case "R": sLibelléLieuAnalyse = "Fontaine"
'    Case "H": sLibelléLieuAnalyse = "Roanne"
'    Case "T": sLibelléLieuAnalyse = "La Rochelle"
'    Case "C": sLibelléLieuAnalyse = "Cergy"
'    Case "C": sLibelléLieuAnalyse = "Cergy"
'    Case "W": sLibelléLieuAnalyse = "Serveur, Grenoble"
    
    Case "R": sLibelléLieuAnalyse = "Labo de microbiologie, Fontaine"
    Case "K": sLibelléLieuAnalyse = "Birmingham"
    Case "P": sLibelléLieuAnalyse = "STFN, Massy"
    Case "A": sLibelléLieuAnalyse = "STFS Grenoble, secours"
    Case "W": sLibelléLieuAnalyse = "Serveur, Grenoble"
    Case "S": sLibelléLieuAnalyse = "Facturation, Grenoble"
    Case "C": sLibelléLieuAnalyse = "Système Microb'Soft, Cergy"
    Case "G": sLibelléLieuAnalyse = "STFS, Grenoble"
    Case "Y": sLibelléLieuAnalyse = "Agence de Lyon, Lyon"
    Case "V": sLibelléLieuAnalyse = "Secours, Massy"
    Case "T": sLibelléLieuAnalyse = "Système Microb'Soft, La Rochelle"
    Case "H": sLibelléLieuAnalyse = "Labo, Roanne"
    Case "B": sLibelléLieuAnalyse = "Silliker Italia, Bergamo"
    Case "X": sLibelléLieuAnalyse = "Silliker Belgique, Sint Niklaas"
    Case "E": sLibelléLieuAnalyse = "Système Microb'Soft, Cergy"
    Case "O": sLibelléLieuAnalyse = "Système Microb'Soft, Osny"
    Case "N": sLibelléLieuAnalyse = "Système Satti, Osny"
    Case "D": sLibelléLieuAnalyse = "Système Satti, Cergy"
    Case "U": sLibelléLieuAnalyse = "Système Satti, La Rochelle"
    Case "F": sLibelléLieuAnalyse = "Silliker Belgique, Sint Niklaas"
    Case "Q": sLibelléLieuAnalyse = "Base activité centrale, Grenoble"
    
    Case "": sLibelléLieuAnalyse = ""
    Case Else: sLibelléLieuAnalyse = sprintf(sGetIntlLib("CR204", "Lieu d'analyse %1"), sLieu)
  End Select
End Function


