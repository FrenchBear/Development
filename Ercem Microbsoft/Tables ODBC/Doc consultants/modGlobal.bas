Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des documents consultants
' 05/05/1998 PV
' 16/07/1998 PV Identification de l'utilisateur, cSyst�meCA
' 11/08/1998 PV Fin de app.exename (--> App.ExeName)
'  7/07/1999 PV sSourceODBCD�faut


Option Explicit

Public Const sSourceODBCD�fautD�faut = "serveur"

Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIDocConsultants.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIDocConsultants.ActiveForm.bdS�l.Message = sMessage
  MDIDocConsultants.ActiveForm.bdS�l.RefreshMessage
End Sub

