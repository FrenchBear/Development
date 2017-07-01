Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion du fichier DD
' 06/07/1998 PV
' 16/06/1998 PV Traçabilité, identification de l'utilisateur et du système
' 11/08/1998 PV Fin de app.exeName (--> App.ExeName)
'  7/07/1999 PV sSourceODBCDéfaut


Option Explicit


Public Const sNomApp = "Gestion du fichier DD"
Public Const sSourceODBCDéfaut = "serveur"

Public Sub SetStatus(ByVal sMessage As String)
  MDIFichierDD.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(ByVal sMessage As String)
  MDIFichierDD.ActiveForm.sbMessage.SimpleText = sMessage
  MDIFichierDD.ActiveForm.sbMessage.Refresh
End Sub

