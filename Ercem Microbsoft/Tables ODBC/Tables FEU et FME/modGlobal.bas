Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des FEU
' 13/02/1998 PV
' 16/07/1998 PV Traçabilité, cSystèmeCA
' 11/08/1998 PV Fin de app.exeName (--> App.ExeName)
' 11/08/1999 PV sbMessage intégré à bdSél
' 16/08/2001 PV Chien de garde


Option Explicit


Public Const sSourceODBCDéfautDéfaut = "serveur"


' Chien de garde
Public tMédor As Single




Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIFEUetFME.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIFEUetFME.ActiveForm.bdSél.Message = sMessage
  MDIFEUetFME.ActiveForm.bdSél.RefreshMessage
End Sub


' =================================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  MDIFEUetFME.ResetChienDeGarde
End Sub


