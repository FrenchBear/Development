Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des ressources globales des fiches tourn�e
' 03/08/1999 PV Fin de sNomApp (--> App.Title)
' 11/08/1999 PV sbMessage int�gr� � bdS�l
' 16/08/2001 PV Chien de garde


Option Explicit

Public Const sSourceODBCD�fautD�faut = ""


' Drag'n'nDrop
Public sFTSource As String
Public lftSource As D�tailFT


' M�morisation des champs (m�canisme F5)
Public colM�moireFTour As New Collection
Public colM�moireDTour As New Collection


' Chien de garde
Public tM�dor As Single



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIFTour.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIFTour.ActiveForm.bdS�l.Message = sMessage
  MDIFTour.ActiveForm.bdS�l.RefreshMessage
End Sub


' =================================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  MDIFTour.ResetChienDeGarde
End Sub


