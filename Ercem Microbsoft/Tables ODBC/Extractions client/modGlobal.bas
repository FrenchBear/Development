Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des extractions client
' 17/12/2001 PV


Option Explicit

Public Const sSourceODBCD�fautD�faut = ""

Public bDebug As Boolean

' Chien de garde
Public tM�dor As Single


' Droits d'acc�s
Public bAdminServeur As Boolean        ' Vrai pour di et droits&64



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIExtCli.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIExtCli.ActiveForm.bdS�l.Message = sMessage
  MDIExtCli.ActiveForm.bdS�l.RefreshMessage
End Sub



' =================================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  MDIExtCli.ResetChienDeGarde
End Sub

