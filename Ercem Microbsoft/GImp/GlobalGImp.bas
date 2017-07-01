Attribute VB_Name = "GlobalGImp"
Attribute VB_Description = "Déclarations globales du module GImp"
' GlobalGImp
' Déclarations globales du gestionnaire d'impression
' 25/10/2000 PV
' 20/04/2001 PV sIdModif

Public sImprimanteLaser As String      ' Impression documents
Public sImprimanteLaserPlannings As String
Public sImprimanteLaserEtiquettes As String


Option Explicit

Public Const sApplicationGlobale = "Microb'Soft GIMP"  ' Sommet de la registry

Global Const sPréfixeAideDéfaut As String = "http://www.silliker/microbsoft/secretariat/"
Public Const sDémon = "gimpd"

Public iMaxRef As Long                          ' Dernière référence affectée
Public Const iMinRef = 10000                    ' Plus petite référence autorisée


Global Const coulLettresAutresSys = 16711680     ' RGB(0, 0, 255)


' Options mémorisées dans la registry
Public sImprimanteAiguillesBL As String         ' Impression bons de livraison
Public sImprimanteAiguillesFP As String         ' Impression fiches de prélèvement

' Options des GImp
Public bAfficherMenuSystème As Boolean          ' Affichage du menu spécial
Public bAfficherBarreDeBoutons As Boolean       ' Affichage de la barre de boutons
Public bDemanderNbExQuandImpression As Boolean  ' Vrai s'il faut demander le nb d'exemplaires à l'impression des jourvaux et étiquettes
Public bMasquerBloqué                           ' Masque le cadenas sur les machines les plus lentes

' Démon et protocole
Public Const iPortDémon = 6322                  ' gimpd
Public Const iMinRelease = 2                    ' Niveau minimum de protocole demandé à msd

' Barrières
Public Const MaxJoursPassé = 15                 ' Maximum de jours en création/déplacement dans le passé par rapport au jour courant


' Chaîne pour TraceSession
Public Function sIdModif() As String
  Dim s As New SysInfo
  sIdModif = LCase("GImp " & App.Major & "." & App.Minor & "." & App.Revision & "/" & sVersionDémon & " " & s.ComputerName & ", " & iNumOpérateur)
End Function

