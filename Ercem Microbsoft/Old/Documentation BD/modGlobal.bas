Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables documentaires
' 12/02/1998 PV
' 16/07/1998 PV Tra�abilit�, identification de l'utilisateur et du syst�me
' 11/08/1998 PV Fin de App.ExeName (--> App.exeName)
'  7/07/1999 PV sSourceODBCD�faut
' 11/08/1999 PV sbMessage int�gr� � bdS�l


Option Explicit


Public Const sSourceODBCD�fautD�faut = "serveur"


Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIDocBD.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIDocBD.ActiveForm.bdS�l.Message = sMessage
  MDIDocBD.ActiveForm.bdS�l.RefreshMessage
End Sub

