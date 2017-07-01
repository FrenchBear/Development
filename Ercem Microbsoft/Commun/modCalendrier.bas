Attribute VB_Name = "modCalendrier"
' modCalendrier
' Gestion des fonctions diverses autour du calendrier
' 23/12/1997 PV

Option Explicit

Private colJoursFéries As New Collection


' Teste la table calendrier sur le serveur
' On gère un cache local pour les performances
Function IsJourFérié(ByVal d As Date, ByRef sFête As String) As Boolean
  ' On commence par regarder dans le cache…
  On Error Resume Next
  sFête = colJoursFéries("D" & Format(d, "ddmmyyyy"))
  If Err = 0 Then
    On Error GoTo 0
    
    IsJourFérié = Left(sFête, 1) = "V"
    sFête = Mid(sFête, 2)
    Exit Function
  End If
  
  ' Et si on ne trouve pas, on interroge le démon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    Dim sLigne As String
    Dim bRet As Boolean
    
    br.AddField d
    tcps.Envoie "FETE " & br.Buffer
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField bRet, sFête
    IsJourFérié = bRet
    AttendSynchro
  Relâcher
  
  colJoursFéries.Add IIf(bRet, "V", "F") & sFête, "D" & Format(d, "ddmmyyyy")
End Function

