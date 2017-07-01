Attribute VB_Name = "modShellWait"
' modShellWait
' Launches a program with Shell, and wait for its completion
' without blocking refresh of other forms
' 18/05/1998 PV
' 31/03/2005 PV     Wrong constants fixed


Option Explicit

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Const SW_SHOWNORMAL = 1
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Integer, ByVal dwProcessId As Long) As Long
Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Private Const INFINITE = &HFFFF
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Const SYNCHRONIZE = &H100000
Private Const PROCESS_ALL_ACCESS = &H1F0FFF
Private Const PROCESS_QUERY_INFORMATION = &H400



Public Sub ShellWait(ByVal sCommande As String)
  Dim hprog As Long, hProc As Long, RetVal As Long
  On Error Resume Next
  hprog = Shell(sCommande, vbNormalFocus) 'returns taskID
  If Err Then
    MsgBox "Command failed:" & vbCrLf & sCommande & vbCrLf & vbCrLf & "Err=" & Err & " (" & Err.Source & "): " & Err.Description, vbExclamation
    Return
  End If
  On Error GoTo 0
  'Get process handle
  Do While IsProcessActive(hprog)
     DoEvents
     Sleep 250
  Loop
  hProc = OpenProcess(SYNCHRONIZE, False, hprog)
  'wait until the process terminates
  If hProc <> 0 Then
    RetVal = WaitForSingleObject(hProc, INFINITE)
    CloseHandle hProc
  End If
End Sub


Public Function IsProcessActive(ByVal hprog As Long) As Boolean
  Dim hProc As Long, RetVal As Long
  Const STILL_ACTIVE = 259
  hProc = OpenProcess(PROCESS_QUERY_INFORMATION, False, hprog)
  If hProc <> 0 Then
    GetExitCodeProcess hProc, RetVal
  End If
  IsProcessActive = (RetVal = STILL_ACTIVE)
  CloseHandle hProc
End Function

