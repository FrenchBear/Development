Attribute VB_Name = "Module1"
Option Explicit
Private Declare Sub keybd_event Lib "user32" ( _
         ByVal bVk As Byte, _
         ByVal bScan As Byte, _
         ByVal dwFlags As Long, _
         ByVal dwExtraInfo As Long)

Const KEYEVENTF_KEYUP = &H2
Const VK_LWIN = &H5B

Public Function MinAllWindows()
    Call keybd_event(VK_LWIN, 0, 0, 0)
    Call keybd_event(77, 0, 0, 0)
    Call keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0)
End Function


