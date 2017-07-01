Attribute VB_Name = "modReboot"
' Force le redémarrage du micro
' 1/3/00 PV

Option Explicit

' Reboot
Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Public Const EWX_FORCE = 4
Public Const EWX_LOGOFF = 0
Public Const EWX_REBOOT = 2
Public Const EWX_SHUTDOWN = 1

Sub Main()
  ExitWindowsEx EWX_FORCE + EWX_REBOOT, 0
End Sub
