Attribute VB_Name = "modOrthographe"
Attribute VB_Description = "Fonction de vérification d'orthographe"
' modOthographe
' Fonction de vérification d'orthographe
' 14/11/1997 PV
' 22/07/1998 PV Optimisation, pas de dialogue avec crad si le texte à vérifier est vide !
'
' A intégrer: la gestion de la langue


Option Explicit

Function sOrthographe(ByVal sTexteAVérifier As String) As String
  Dim sLigne As String
  Dim br As New Rev
  Dim sMotsNonReconnus As String
  
  If Trim(sTexteAVérifier) = "" Then
    sOrthographe = ""
  Else
    br.AddField Trim(sTexteAVérifier)
    Bloquer
      tcps.Envoie "ORTH " & br.Buffer
      sLigne = tcps.Reçoit
      br.Buffer = sLigne
      br.GetField sMotsNonReconnus
      AttendSynchro
    Relâcher
    sOrthographe = sMotsNonReconnus
  End If
End Function

