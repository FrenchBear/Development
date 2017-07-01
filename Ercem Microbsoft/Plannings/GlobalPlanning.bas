Attribute VB_Name = "GlobalPlanning"
Attribute VB_Description = "D�clarations globales du module planning"
' GlobalPlanning
' D�clarations globales du module planning
'  2/09/1997 PV S�par� de global.bas mis dans commun
' 11/09/1997 PV Fin de sLettres1
' 10/04/1998 PV bMasquerBloqu�
' 24/07/1998 PV Purge de classement DD; RenameMenu
' 18/03/1999 PV iMinRelease=5
' 27/07/1999 PV Contr�le du Workgroup
' 31/12/1999 PV MaxJoursPass�
' 10/03/2000 PV iMinRelease=7: Gestion des huiles
' 27/03/2000 PV iMinRelease=8: Gestion N�/dur�e EH
' 28/03/2000 PV iMinRelease=9: N� eh char(10), secr�tariat et labo
' 21/09/2000 PV iMinRelease=10: Validation � la ligne; planning national
'  1/10/2000 PV ToMin
' 25/10/2000 PV ToMin -> bToMin dans Global
' 31/10/2000 PV iMinRelease=11: etb_/pla_fptandard et pla_refcmd
' 16/11/2000 PV LaserPlannings et LaserEtiquettes et LaserDocuments
' 27/11/2000 PV iMinRelease=20: LPL12/EPL12 (erreur msd, version pr�c�dente proto 19)
'  6/12/2000 PV Gestion des bacs
' 20/04/2001 PV sIdModif


Option Explicit

Public Const sApplicationGlobale = "Microb'Soft"

Global Const sPr�fixeAideD�faut As String = "http://www.silliker/microbsoft/secretariat/"
Public Const sD�mon = "msd"

Public iMaxRef As Long                          ' Derni�re r�f�rence affect�e
Public Const iMinRef = 10000                    ' Plus petite r�f�rence autoris�e


Global Const coulLettresAutresSys = 16711680    ' RGB(0, 0, 255)


' Options m�moris�es dans la registry
Public sImprimanteAP As String                  ' Impression des avis de passage
Public sImprimanteFP As String                  ' Impression fiches de pr�l�vement
Public iBacAP As Integer                        ' Bac d'alimentation des AP
Public iBacFP As Integer                        ' Bac d'alimentation des FP
Public sImprimantePlannings As String           ' Impression plannings
Public iBacPlannings As Integer                 ' Bac d'alimentation des AP
Public sImprimanteEtiquettes As String          ' Impression �tiquettes
Public iBacEtiquettes As Integer                ' Bac d'alimentation des AP
Public sImprimanteDocuments As String           ' Impression documents

' Options des plannings
Public bPasSignalerEcartUnit� As Boolean        ' Affichage du message PL042
Public bAfficherMenuSyst�me As Boolean          ' Affichage du menu sp�cial
Public bAfficherBarreDeBoutons As Boolean       ' Affichage de la barre de boutons
Public bDemanderNbExQuandImpression As Boolean  ' Vrai s'il faut demander le nb d'exemplaires � l'impression des jourvaux et �tiquettes
Public bMasquerBloqu�                           ' Masque le cadenas sur les machines les plus lentes

' D�mon et protocole
Public Const iPortD�mon = 6320
Public Const iMinRelease = 21                   ' Niveau minimum de protocole demand� � msd

' Barri�res
Public Const MaxJoursPass� = 35                 ' Maximum de jours en cr�ation/d�placement dans le pass� par rapport au jour courant



Public Sub SetStatus(Optional sMsg As String = "")
  frmPlanning.sbStatus.Panels("Info").Text = sMsg
  frmPlanning.sbStatus.Refresh
End Sub


' Cha�ne pour TraceSession
Public Function sIdModif() As String
  Dim s As New SysInfo
  sIdModif = LCase("Planning " & App.Major & "." & App.Minor & "." & App.Revision & "/" & sVersionD�mon & " " & s.ComputerName & ", " & iNumOp�rateur)
End Function

