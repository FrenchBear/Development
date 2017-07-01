'
' The following declaration provides access to the InvokeWindowProc function in
' the VBX version of MsgHook.  For information about InvokeWindowProc please
' see msghook.hlp
'
Declare Function InvokeWindowProc Lib "msghook.vbx" (ByVal hwnd As Integer, ByVal msg As Integer, ByVal wparam As Integer, ByVal lparam As Long) As Long

