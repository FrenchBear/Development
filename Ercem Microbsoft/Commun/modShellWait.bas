Attribute VB_Name = "modShellWait"
' modShellWait
' Exécution d'un programme avec shell, et attente de la fin du programme
' 18/05/1998 PV

Option Explicit

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Const SW_SHOWNORMAL = 1
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Private Const INFINITE = &HFFFF
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)



Public Sub ShellWait(ByVal sCommande As String)
  Dim hprog, hProc, RetVal As Long
  Const PROCESS_ALL_ACCESS = 0
  On Error Resume Next
  hprog = Shell(sCommande, vbNormalFocus) 'returns taskID
  If Err Then
    'MsgBox2i "CR282", sCommande, Err, Err.Source, Err.Description
    MsgBox "Échec à la comande:" & vbCrLf & sCommande & vbCrLf & vbCrLf & "Err=" & Err & " (" & Err.Source & "): " & Err.Description, vbExclamation, sNomApp
    Return
  End If
  On Error GoTo 0
  'Get process handle
  Do While IsActive(hprog)
     DoEvents
     Sleep 250
  Loop
  hProc = OpenProcess(PROCESS_ALL_ACCESS, False, hprog)
  'wait until the process terminates
  If hProc <> 0 Then
    RetVal = WaitForSingleObject(hProc, INFINITE)
    CloseHandle hProc
  End If
End Sub

Private Function IsActive(hprog) As Long
  Dim hProc, RetVal As Long
  Const PROCESS_QUERY_INFORMATION = 0
  Const STILL_ACTIVE = 259
  hProc = OpenProcess(PROCESS_QUERY_INFORMATION, False, hprog)
  If hProc <> 0 Then
    GetExitCodeProcess hProc, RetVal
  End If
  IsActive = (RetVal = STILL_ACTIVE)
  CloseHandle hProc
End Function

