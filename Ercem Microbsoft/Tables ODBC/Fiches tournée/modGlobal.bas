Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des ressources globales des fiches tournée
' 03/08/1999 PV Fin de sNomApp (--> App.Title)
' 11/08/1999 PV sbMessage intégré à bdSél
' 16/08/2001 PV Chien de garde


Option Explicit

Public Const sSourceODBCDéfautDéfaut = ""


' Drag'n'nDrop
Public sFTSource As String
Public lftSource As DétailFT


' Mémorisation des champs (mécanisme F5)
Public colMémoireFTour As New Collection
Public colMémoireDTour As New Collection


' Chien de garde
Public tMédor As Single



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIFTour.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIFTour.ActiveForm.bdSél.Message = sMessage
  MDIFTour.ActiveForm.bdSél.RefreshMessage
End Sub


' =================================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  MDIFTour.ResetChienDeGarde
End Sub


