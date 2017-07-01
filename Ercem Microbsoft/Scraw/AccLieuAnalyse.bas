Attribute VB_Name = "AccLieuAnalyse"
Attribute VB_Description = "Petit module pour d�coder les valeur du champ ""lieu analyse"""
' AccLieuAnalyse
' Petit module pour d�coder les valeur du champ "lieu analyse"
' Pour l'instant implant� "cod� endur", mais pourra communiquer ult�rieurement avec un d�mon
' 17/9/97 PV

Option Explicit

Public Function sLibell�LieuAnalyse(ByVal sLieu As String) As String
  Select Case sLieu
'    Case "R": sLibell�LieuAnalyse = "Fontaine"
'    Case "H": sLibell�LieuAnalyse = "Roanne"
'    Case "T": sLibell�LieuAnalyse = "La Rochelle"
'    Case "C": sLibell�LieuAnalyse = "Cergy"
'    Case "C": sLibell�LieuAnalyse = "Cergy"
'    Case "W": sLibell�LieuAnalyse = "Serveur, Grenoble"
    
    Case "R": sLibell�LieuAnalyse = "Labo de microbiologie, Fontaine"
    Case "K": sLibell�LieuAnalyse = "Birmingham"
    Case "P": sLibell�LieuAnalyse = "STFN, Massy"
    Case "A": sLibell�LieuAnalyse = "STFS Grenoble, secours"
    Case "W": sLibell�LieuAnalyse = "Serveur, Grenoble"
    Case "S": sLibell�LieuAnalyse = "Facturation, Grenoble"
    Case "C": sLibell�LieuAnalyse = "Syst�me Microb'Soft, Cergy"
    Case "G": sLibell�LieuAnalyse = "STFS, Grenoble"
    Case "Y": sLibell�LieuAnalyse = "Agence de Lyon, Lyon"
    Case "V": sLibell�LieuAnalyse = "Secours, Massy"
    Case "T": sLibell�LieuAnalyse = "Syst�me Microb'Soft, La Rochelle"
    Case "H": sLibell�LieuAnalyse = "Labo, Roanne"
    Case "B": sLibell�LieuAnalyse = "Silliker Italia, Bergamo"
    Case "X": sLibell�LieuAnalyse = "Silliker Belgique, Sint Niklaas"
    Case "E": sLibell�LieuAnalyse = "Syst�me Microb'Soft, Cergy"
    Case "O": sLibell�LieuAnalyse = "Syst�me Microb'Soft, Osny"
    Case "N": sLibell�LieuAnalyse = "Syst�me Satti, Osny"
    Case "D": sLibell�LieuAnalyse = "Syst�me Satti, Cergy"
    Case "U": sLibell�LieuAnalyse = "Syst�me Satti, La Rochelle"
    Case "F": sLibell�LieuAnalyse = "Silliker Belgique, Sint Niklaas"
    Case "Q": sLibell�LieuAnalyse = "Base activit� centrale, Grenoble"
    
    Case "": sLibell�LieuAnalyse = ""
    Case Else: sLibell�LieuAnalyse = sprintf(sGetIntlLib("CR204", "Lieu d'analyse %1"), sLieu)
  End Select
End Function


