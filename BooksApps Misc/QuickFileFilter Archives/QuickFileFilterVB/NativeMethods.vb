' NativeMethods class
' Regroup P/Invoke declarations, to follow Microsoft code analysis recommendations
'
' 2016-11-12    PV
' 2017-01-04    PV  v3, Visual Basic

Imports System.Runtime.InteropServices

Module NativeMethods
    <DllImport("shlwapi.dll", CharSet:=CharSet.Unicode, ExactSpelling:=True)>
    Public Function StrCmpLogicalW(x As [String], y As [String]) As Integer
    End Function

    ' Win32 API for menus
    <DllImport("user32.dll")>
    Public Function GetSystemMenu(hWnd As IntPtr, bRevert As Boolean) As IntPtr
    End Function

    <DllImport("user32.dll", CharSet:=CharSet.Unicode)>
    Public Function InsertMenu(hMenu As IntPtr, wPosition As Int32, wFlags As Int32, wIDNewItem As IntPtr, lpNewItem As String) As Boolean
    End Function

End Module
