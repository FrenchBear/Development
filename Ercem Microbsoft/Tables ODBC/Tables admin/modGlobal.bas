Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables administratives
' 04/02/1998 PV
' 15/07/1998 PV Identification de l'utilisateur et du syst�me Unix
'  5/08/1998 PV bOkUtilisateur (restreint au Service Informatique)
' 11/08/1998 PV Fin de App.ExeName (--> App.ExeName)
' 19/04/1999 PV bLectureSeule
'  7/07/1999 PV sSourceODBCD�faut
' 11/08/1999 PV sbMessage int�gr� � bdS�l
' 23/08/1999 PV M�canisme F5 (m�moire) pour les utilisateurs
' 12/01/2000 PV Libell�s de CRA (eRessource)
'  9/08/2001 PV Chien de garde


Option Explicit

Public Const sSourceODBCD�fautD�faut = ""


Public Enum eRessource              ' Divers classes de libell�s
  rSecteurPr�l�vement = 1
  rInterventionOp�rateur
  rModeConditionnement
  rNiveau�laboration
  r�tatDivision
  r�tatPhysique
  rTechnologieFabrication
  rAspect�chantillon
  rConditionsPr�l�vement
  rCadrePr�l�vement
  rLieuPr�l�vement
  rContenant
End Enum


' Chien de garde
Public tM�dor As Single


' M�morisation des champs (m�canisme F5)
Public colM�moireUtilisateur As New Collection
Public colM�moireLettres As New Collection
Public colM�moireUnit� As New Collection
Public colM�moireUnit�Ventilation As New Collection
Public colM�moireSyst�me As New Collection
Public colM�moirePays As New Collection
Public colM�moireJourF�ri� As New Collection
Public colM�moireLangue As New Collection
Public colM�moiretraitepar As New Collection
Public colM�moireSecr�tariat As New Collection
Public colM�moireSite As New Collection
Public colM�moireRayon As New Collection
Public colM�moireProprio As New Collection
Public colM�moireLibErcem As New Collection
Public colM�moireSM As New Collection
Public colM�moireRA As New Collection
Public colM�moireSI As New Collection
Public colM�moireSD As New Collection
Public colM�moireZoneComm As New Collection
Public colM�moireConclusion As New Collection
Public colM�moireGerme As New Collection



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIAdministration.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIAdministration.ActiveForm.bdS�l.Message = sMessage
  MDIAdministration.ActiveForm.bdS�l.RefreshMessage
End Sub


Public Sub InitTra�abilit�(colChamps As Collection, sPr�fixe As String, bCr�ation As Boolean)
  ' Tra�abilit� ancien style
  If bCr�ation Then
    colChamps(sPr�fixe & "_datecreat") = Today
    colChamps(sPr�fixe & "_heurecreat") = 100 * Hour(Now) + Minute(Now)
    colChamps(sPr�fixe & "_opercreat") = iNumOp�rateur
  End If
  
  colChamps(sPr�fixe & "_datemodif") = Today
  colChamps(sPr�fixe & "_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps(sPr�fixe & "_opermodif") = iNumOp�rateur
End Sub


' =================================================================================
' Pluriels dans les libell�s

Function s(n As Integer) As String
  If n > 1 Then
    s = "s"
  Else
    s = ""
  End If
End Function

' =================================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  MDIAdministration.ResetChienDeGarde
End Sub
