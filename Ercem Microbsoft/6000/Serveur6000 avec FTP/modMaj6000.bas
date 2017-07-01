Attribute VB_Name = "modMaj6000"
' Maj6000
' Met � jour d'autres programmes
' 26/11/1997 PV
'  1/12/1997 PV Tempo suppl�mentaire pour les syst�mes les plus lents
' 14/10/1998 PV D�lais allong�s�
'  3/01/2000 PV Cas o� le fichier de C:\Program files est en lecture seule


Option Explicit


Const sNomApp As String = "MAJ6000"


Sub Main()
  Dim sCommand As String
  Dim sTitreFen�tre As String
  Dim sPathSource As String
  Dim sPathDest As String
  Dim sOptions As String
  
  sCommand = Command
  On Error GoTo Probl�meParam�tres
  sTitreFen�tre = sGetArg(sCommand)
  sPathSource = sGetArg(sCommand)
  sPathDest = sGetArg(sCommand)
  If sCommand <> "" Then sOptions = sGetArg(sCommand)
  FinArguments sCommand
  On Error GoTo 0
  
  'MsgBox "TitreFen�tre: �" & sTitreFen�tre & "�" & vbCrLf & "PathSource: �" & sPathSource & "�" & vbCrLf & "PathDest: �" & sPathDest & "�", vbInformation, "MAJ 6000"
  
  ' On attend cinq secondes que le syst�me se "calme"�
  Sleep 5
  ' 20 secondes maxi d'attente
  Dim i As Integer
  For i = 1 To 10
    On Error Resume Next
    AppActivate sTitreFen�tre
    If Err Then
      Err = 0
      
      ' Si le fichier destination existe et est en lecture seule, on enl�ve cet attribut avant la copie
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
        Sleep 10     ' En cas de probl�me de copie, on attend un peu et on recommence une deuxi�me fois
        FileCopy sPathSource, sPathDest
      End If
      If Err Then MsgBox "�chec au FileCopy �" & sPathSource & "� �" & sPathDest & "�" & vbCrLf & "Err=" & Err & ": " & Error, vbExclamation, sNomApp
      Err = 0
      Shell sPathDest & " " & sOptions, vbNormalFocus
      If Err Then MsgBox "�chec au Shell �" & sPathDest & "�" & vbCrLf & "Err=" & Err & ": " & Error, vbExclamation, sNomApp
      End
    End If
    
    Sleep 2
  Next
  MsgBox "Fen�tre �" & sTitreFen�tre & "� toujours active apr�s 15 secondes !", vbExclamation, sNomApp
  End
  
Probl�meParam�tres:
  MsgBox "Probl�me au d�codage des param�tres !" & vbCrLf & "Command: �" & Command & "�", vbExclamation, sNomApp
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

