Attribute VB_Name = "modOrthographe"
Attribute VB_Description = "Fonction de v�rification d'orthographe"
' modOthographe
' Fonction de v�rification d'orthographe
' 14/11/1997 PV
' 22/07/1998 PV Optimisation, pas de dialogue avec crad si le texte � v�rifier est vide !
'
' A int�grer: la gestion de la langue


Option Explicit

Function sOrthographe(ByVal sTexteAV�rifier As String) As String
  Dim sLigne As String
  Dim br As New Rev
  Dim sMotsNonReconnus As String
  
  If Trim(sTexteAV�rifier) = "" Then
    sOrthographe = ""
  Else
    br.AddField Trim(sTexteAV�rifier)
    Bloquer
      tcps.Envoie "ORTH " & br.Buffer
      sLigne = tcps.Re�oit
      br.Buffer = sLigne
      br.GetField sMotsNonReconnus
      AttendSynchro
    Rel�cher
    sOrthographe = sMotsNonReconnus
  End If
End Function

