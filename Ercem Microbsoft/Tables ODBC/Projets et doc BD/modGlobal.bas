Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des projets
' 12/07/1998 PV
' 17/07/1998 PV Identification de l'utilisateur et du système
'  7/07/1999 PV sSourceODBCDéfaut
' 11/08/1999 PV sbMessage intégré à bdSél

Option Explicit

Public Const sSourceODBCDéfautDéfaut = "serveur"


Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIProjets.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIProjets.ActiveForm.bdSél.Message = sMessage
  MDIProjets.ActiveForm.bdSél.RefreshMessage
End Sub

