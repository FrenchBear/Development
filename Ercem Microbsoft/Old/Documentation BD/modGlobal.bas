Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables documentaires
' 12/02/1998 PV
' 16/07/1998 PV Traçabilité, identification de l'utilisateur et du système
' 11/08/1998 PV Fin de App.ExeName (--> App.exeName)
'  7/07/1999 PV sSourceODBCDéfaut
' 11/08/1999 PV sbMessage intégré à bdSél


Option Explicit


Public Const sSourceODBCDéfautDéfaut = "serveur"


Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIDocBD.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIDocBD.ActiveForm.bdSél.Message = sMessage
  MDIDocBD.ActiveForm.bdSél.RefreshMessage
End Sub

