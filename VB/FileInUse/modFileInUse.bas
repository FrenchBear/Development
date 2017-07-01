Attribute VB_Name = "modFileInUse"
' modFileInUse
' Tests if a file is currently open
' From http://vbnet.mvps.org/index.html?code/fileapi/createfile_inuse.htm

Option Explicit

Private Const GENERIC_READ As Long = &H80000000
Private Const INVALID_HANDLE_VALUE As Long = -1
Private Const OPEN_EXISTING As Long = 3
Private Const FILE_ATTRIBUTE_NORMAL As Long = &H80

Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, ByVal lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hFile As Long) As Long

Public Function isFileInUse(ByVal sPathname As String) As Boolean
    ' If file does not exist, just return False
    If Dir(sPathname) = "" Then Exit Function
    
    Dim hFile As Long
    hFile = CreateFile(sPathname, _
                         GENERIC_READ, _
                         0, 0, _
                         OPEN_EXISTING, _
                         FILE_ATTRIBUTE_NORMAL, 0&)

    'this will evaluate to either
    '-1 (FILE_IN_USE) or 0 (FILE_FREE)
     isFileInUse = hFile = INVALID_HANDLE_VALUE
    
     CloseHandle hFile
End Function


