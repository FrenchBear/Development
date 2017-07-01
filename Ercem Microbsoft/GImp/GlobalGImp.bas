Attribute VB_Name = "GlobalGImp"
Attribute VB_Description = "D�clarations globales du module GImp"
' GlobalGImp
' D�clarations globales du gestionnaire d'impression
' 25/10/2000 PV
' 20/04/2001 PV sIdModif

Public sImprimanteLaser As String      ' Impression documents
Public sImprimanteLaserPlannings As String
Public sImprimanteLaserEtiquettes As String


Option Explicit

Public Const sApplicationGlobale = "Microb'Soft GIMP"  ' Sommet de la registry

Global Const sPr�fixeAideD�faut As String = "http://www.silliker/microbsoft/secretariat/"
Public Const sD�mon = "gimpd"

Public iMaxRef As Long                          ' Derni�re r�f�rence affect�e
Public Const iMinRef = 10000                    ' Plus petite r�f�rence autoris�e


Global Const coulLettresAutresSys = 16711680     ' RGB(0, 0, 255)


' Options m�moris�es dans la registry
Public sImprimanteAiguillesBL As String         ' Impression bons de livraison
Public sImprimanteAiguillesFP As String         ' Impression fiches de pr�l�vement

' Options des GImp
Public bAfficherMenuSyst�me As Boolean          ' Affichage du menu sp�cial
Public bAfficherBarreDeBoutons As Boolean       ' Affichage de la barre de boutons
Public bDemanderNbExQuandImpression As Boolean  ' Vrai s'il faut demander le nb d'exemplaires � l'impression des jourvaux et �tiquettes
Public bMasquerBloqu�                           ' Masque le cadenas sur les machines les plus lentes

' D�mon et protocole
Public Const iPortD�mon = 6322                  ' gimpd
Public Const iMinRelease = 2                    ' Niveau minimum de protocole demand� � msd

' Barri�res
Public Const MaxJoursPass� = 15                 ' Maximum de jours en cr�ation/d�placement dans le pass� par rapport au jour courant


' Cha�ne pour TraceSession
Public Function sIdModif() As String
  Dim s As New SysInfo
  sIdModif = LCase("GImp " & App.Major & "." & App.Minor & "." & App.Revision & "/" & sVersionD�mon & " " & s.ComputerName & ", " & iNumOp�rateur)
End Function

