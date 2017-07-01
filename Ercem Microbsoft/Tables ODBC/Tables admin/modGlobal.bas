Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables administratives
' 04/02/1998 PV
' 15/07/1998 PV Identification de l'utilisateur et du système Unix
'  5/08/1998 PV bOkUtilisateur (restreint au Service Informatique)
' 11/08/1998 PV Fin de App.ExeName (--> App.ExeName)
' 19/04/1999 PV bLectureSeule
'  7/07/1999 PV sSourceODBCDéfaut
' 11/08/1999 PV sbMessage intégré à bdSél
' 23/08/1999 PV Mécanisme F5 (mémoire) pour les utilisateurs
' 12/01/2000 PV Libellés de CRA (eRessource)
'  9/08/2001 PV Chien de garde


Option Explicit

Public Const sSourceODBCDéfautDéfaut = ""


Public Enum eRessource              ' Divers classes de libellés
  rSecteurPrélèvement = 1
  rInterventionOpérateur
  rModeConditionnement
  rNiveauÉlaboration
  rÉtatDivision
  rÉtatPhysique
  rTechnologieFabrication
  rAspectÉchantillon
  rConditionsPrélèvement
  rCadrePrélèvement
  rLieuPrélèvement
  rContenant
End Enum


' Chien de garde
Public tMédor As Single


' Mémorisation des champs (mécanisme F5)
Public colMémoireUtilisateur As New Collection
Public colMémoireLettres As New Collection
Public colMémoireUnité As New Collection
Public colMémoireUnitéVentilation As New Collection
Public colMémoireSystème As New Collection
Public colMémoirePays As New Collection
Public colMémoireJourFérié As New Collection
Public colMémoireLangue As New Collection
Public colMémoiretraitepar As New Collection
Public colMémoireSecrétariat As New Collection
Public colMémoireSite As New Collection
Public colMémoireRayon As New Collection
Public colMémoireProprio As New Collection
Public colMémoireLibErcem As New Collection
Public colMémoireSM As New Collection
Public colMémoireRA As New Collection
Public colMémoireSI As New Collection
Public colMémoireSD As New Collection
Public colMémoireZoneComm As New Collection
Public colMémoireConclusion As New Collection
Public colMémoireGerme As New Collection



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIAdministration.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIAdministration.ActiveForm.bdSél.Message = sMessage
  MDIAdministration.ActiveForm.bdSél.RefreshMessage
End Sub


Public Sub InitTraçabilité(colChamps As Collection, sPréfixe As String, bCréation As Boolean)
  ' Traçabilité ancien style
  If bCréation Then
    colChamps(sPréfixe & "_datecreat") = Today
    colChamps(sPréfixe & "_heurecreat") = 100 * Hour(Now) + Minute(Now)
    colChamps(sPréfixe & "_opercreat") = iNumOpérateur
  End If
  
  colChamps(sPréfixe & "_datemodif") = Today
  colChamps(sPréfixe & "_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps(sPréfixe & "_opermodif") = iNumOpérateur
End Sub


' =================================================================================
' Pluriels dans les libellés

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
