Attribute VB_Name = "modCalendrier"
' modCalendrier
' Gestion des fonctions diverses autour du calendrier
' 23/12/1997 PV

Option Explicit

Private colJoursF�ries As New Collection


' Teste la table calendrier sur le serveur
' On g�re un cache local pour les performances
Function IsJourF�ri�(ByVal d As Date, ByRef sF�te As String) As Boolean
  ' On commence par regarder dans le cache�
  On Error Resume Next
  sF�te = colJoursF�ries("D" & Format(d, "ddmmyyyy"))
  If Err = 0 Then
    On Error GoTo 0
    
    IsJourF�ri� = Left(sF�te, 1) = "V"
    sF�te = Mid(sF�te, 2)
    Exit Function
  End If
  
  ' Et si on ne trouve pas, on interroge le d�mon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    Dim sLigne As String
    Dim bRet As Boolean
    
    br.AddField d
    tcps.Envoie "FETE " & br.Buffer
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField bRet, sF�te
    IsJourF�ri� = bRet
    AttendSynchro
  Rel�cher
  
  colJoursF�ries.Add IIf(bRet, "V", "F") & sF�te, "D" & Format(d, "ddmmyyyy")
End Function

