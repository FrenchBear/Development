Attribute VB_Name = "modMaj6000"
' Maj6000
' Met à jour d'autres programmes
' 26/11/1997 PV
'  1/12/1997 PV Tempo supplémentaire pour les systèmes les plus lents
' 14/10/1998 PV Délais allongés…
'  3/01/2000 PV Cas où le fichier de C:\Program files est en lecture seule


Option Explicit


Const sNomApp As String = "MAJ6000"


Sub Main()
  Dim sCommand As String
  Dim sTitreFenêtre As String
  Dim sPathSource As String
  Dim sPathDest As String
  Dim sOptions As String
  
  sCommand = Command
  On Error GoTo ProblèmeParamètres
  sTitreFenêtre = sGetArg(sCommand)
  sPathSource = sGetArg(sCommand)
  sPathDest = sGetArg(sCommand)
  If sCommand <> "" Then sOptions = sGetArg(sCommand)
  FinArguments sCommand
  On Error GoTo 0
  
  'MsgBox "TitreFenêtre: «" & sTitreFenêtre & "»" & vbCrLf & "PathSource: «" & sPathSource & "»" & vbCrLf & "PathDest: «" & sPathDest & "»", vbInformation, "MAJ 6000"
  
  ' On attend cinq secondes que le système se "calme"…
  Sleep 5
  ' 20 secondes maxi d'attente
  Dim i As Integer
  For i = 1 To 10
    On Error Resume Next
    AppActivate sTitreFenêtre
    If Err Then
      Err = 0
      
      ' Si le fichier destination existe et est en lecture seule, on enlève cet attribut avant la copie
      If bExist(sPathDest) Then
        Dim a As VbFileAttribute
        a = GetAttr(sPathDest)
        If (a And vbReadOnly) = vbReadOnly Then
          a = a And Not vbReadOnly
          SetAttr sPathDest, a
        End If
      End If
      
      FileCopy sPathSource, sPathDest
      If Err Then
        Err = 0
        Sleep 10     ' En cas de problème de copie, on attend un peu et on recommence une deuxième fois
        FileCopy sPathSource, sPathDest
      End If
      If Err Then MsgBox "Échec au FileCopy «" & sPathSource & "» «" & sPathDest & "»" & vbCrLf & "Err=" & Err & ": " & Error, vbExclamation, sNomApp
      Err = 0
      Shell sPathDest & " " & sOptions, vbNormalFocus
      If Err Then MsgBox "Échec au Shell «" & sPathDest & "»" & vbCrLf & "Err=" & Err & ": " & Error, vbExclamation, sNomApp
      End
    End If
    
    Sleep 2
  Next
  MsgBox "Fenêtre «" & sTitreFenêtre & "» toujours active après 15 secondes !", vbExclamation, sNomApp
  End
  
ProblèmeParamètres:
  MsgBox "Problème au décodage des paramètres !" & vbCrLf & "Command: «" & Command & "»", vbExclamation, sNomApp
End Sub


Static Sub Sleep(tWait As Single)
  Dim t As Single
  t = Timer
  While Timer - t < tWait
    DoEvents
  Wend
End Sub


' =================================================================================
' Teste l'existence d'un fichier

Public Function bExist(ByVal sNomfic As String) As Boolean
  bExist = Dir(sNomfic) <> ""
End Function

