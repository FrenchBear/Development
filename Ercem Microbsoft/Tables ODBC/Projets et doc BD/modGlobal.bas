Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des projets
' 12/07/1998 PV
' 17/07/1998 PV Identification de l'utilisateur et du syst�me
'  7/07/1999 PV sSourceODBCD�faut
' 11/08/1999 PV sbMessage int�gr� � bdS�l

Option Explicit

Public Const sSourceODBCD�fautD�faut = "serveur"


Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIProjets.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIProjets.ActiveForm.bdS�l.Message = sMessage
  MDIProjets.ActiveForm.bdS�l.RefreshMessage
End Sub

