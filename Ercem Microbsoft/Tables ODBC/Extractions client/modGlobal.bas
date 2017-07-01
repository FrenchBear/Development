Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des extractions client
' 17/12/2001 PV


Option Explicit

Public Const sSourceODBCDéfautDéfaut = ""

Public bDebug As Boolean

' Chien de garde
Public tMédor As Single


' Droits d'accès
Public bAdminServeur As Boolean        ' Vrai pour di et droits&64



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIExtCli.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIExtCli.ActiveForm.bdSél.Message = sMessage
  MDIExtCli.ActiveForm.bdSél.RefreshMessage
End Sub



' =================================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  MDIExtCli.ResetChienDeGarde
End Sub

