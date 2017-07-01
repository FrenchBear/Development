Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des documents consultants
' 05/05/1998 PV
' 16/07/1998 PV Identification de l'utilisateur, cSystèmeCA
' 11/08/1998 PV Fin de app.exename (--> App.ExeName)
'  7/07/1999 PV sSourceODBCDéfaut


Option Explicit

Public Const sSourceODBCDéfautDéfaut = "serveur"

Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIDocConsultants.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIDocConsultants.ActiveForm.bdSél.Message = sMessage
  MDIDocConsultants.ActiveForm.bdSél.RefreshMessage
End Sub

