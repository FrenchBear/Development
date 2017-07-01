Attribute VB_Name = "GlobalScraw"
Attribute VB_Description = "D�clarations globales du programme de saisie des CRA"
' module GlobalScraw
' D�clarations globales du programme de saisie des RA
'  2/09/1997 PV
' 10/04/1998 PV bMasquerBloqu�
' 10/08/1998 PV Fin de la signalisation des champs non imprim�s sur le RA. iMinRelease=2. bNouvellePr�sentation
' 15/10/1998 PV iMinRelease � 3 (champ cCorrection en +)
' 17/12/1998 PV iPr�sentation integer
' 29/03/1999 PV Fin de iPr�sentation
' 23/10/1998 PV iMinRelease � 5 (contr�le des plannings)
' 18/11/2000 PV Choix des imprimantes plus commun avec les plannings
' 27/11/2000 PV Gestion du bac
' 20/04/2001 PV sIdModif


Option Explicit

Public Const sApplicationGlobale = "Microb'Soft SCRAW"  ' Sommet de la registry

Public Const sD�mon = "crad"
Public Const sPr�fixeAideD�faut As String = "http://www.silliker/microbsoft/labo/scraw/"

' Options globales
Public bAfficherMenuSyst�me As Boolean          ' Affichage du menu sp�cial
Public bAfficherBarreDeBoutons As Boolean       ' Affichage de la barre de boutons
Public bAfficherEtiquettesDeBoutons As Boolean  ' Affichage de la d�gende des boutons
'Public bNoWarningNC As Boolean                 ' Possibilit� de ne pas signaler l'utilisation des champs non imprim�s sur un RA
Public bMasquerBloqu�                           ' Masque le cadenas sur les machines les plus lentes

' Impression des FRT
Public sImprimanteLaser As String
Public iBacLaser As Integer                     ' Bac d'alimentation


' Identification du protocole
Public Const iPortD�mon = 6321
Public Const iMinRelease = 5                    ' Niveau minimum de protocole demand� au d�mon

Public Const dAbsence As Date = #1/1/1980#      ' ABSENCE dans un champ date


' Infos sur la biblio Unix litcra
Public VERSION_CRA As Integer                   ' Version de la biblio
Public MAXLIGNERES As Integer                   ' Nb maxi de germes par rapport



' Cha�ne pour TraceSession
Public Function sIdModif() As String
  Dim s As New SysInfo
  sIdModif = LCase("SCRAW " & App.Major & "." & App.Minor & "." & App.Revision & "/" & sVersionD�mon & " " & s.ComputerName & ", " & iNumOp�rateur)
End Function

