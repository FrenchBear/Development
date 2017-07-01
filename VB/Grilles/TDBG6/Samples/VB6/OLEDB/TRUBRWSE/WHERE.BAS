Attribute VB_Name = "Module2"
' ---------------------------------------------------------
'       Copyright ©1995-1998 APEX Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True DBGrid Pro 6 sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that APEX Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------

#If Win16 Then
 Declare Function GetPrivateProfileString Lib "Kernel" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Integer, ByVal lpFileName As String) As Integer
#ElseIf Win32 Then
 Declare Function GetPrivateProfileString Lib "Kernel32" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Integer, ByVal lpFileName As String) As Integer
#End If

Function ExtractBase(ByVal PathName As String) As String
  ' Return the basename portion of a full pathname
  F$ = ExtractFile(PathName)
  N% = InStr(F$, ".")

  If N% > 0 Then F$ = Left$(F$, N% - 1)

  ExtractBase = F$
End Function

Function ExtractFile(ByVal PathName As String) As String
  ' Return the filename portion of a full pathname
   F$ = PathName

   Do
     N% = InStr(F$, "\")
     If N% > 0 Then F$ = Right$(F$, Len(F$) - N%)
   Loop While N% > 0

   ExtractFile = F$
End Function

Function ExtractPath(ByVal PathName As String) As String
  ' Return the directory path portion of a full pathname
  F$ = PathName
  
  Do
    N% = InStr(F$, "\")
    If N% > 0 Then F$ = Right$(F$, Len(F$) - N%)
  Loop While N% > 0

  ExtractPath = Left$(PathName, Len(PathName) - Len(F$))
End Function
