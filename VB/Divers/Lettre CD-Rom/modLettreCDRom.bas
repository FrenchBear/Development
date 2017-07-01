Attribute VB_Name = "Module1"
Option Explicit
Declare Function GetDriveType Lib "kernel32" Alias _
      "GetDriveTypeA" (ByVal nDrive As String) As Long

Declare Function GetLogicalDriveStrings Lib "kernel32" Alias _
      "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, _
      ByVal lpBuffer As String) As Long

Public Const DRIVE_CDROM As Long = 5

Function GetFirstCdRomDriveLetter() As String
    Dim lDriveType As Long
    Dim strDrive As String
    Dim lStart As Long: lStart = 1
    Dim strDrives As String
    strDrives = Space(150)
    Dim lRetVal As Long
    lRetVal = GetLogicalDriveStrings(150, strDrives)

    If lRetVal = 0 Then
        GetFirstCdRomDriveLetter = vbNullString
        Exit Function
    End If

    strDrive = Mid(strDrives, lStart, 3)

    Do
        lDriveType = GetDriveType(strDrive)
        If lDriveType = DRIVE_CDROM Then
            GetFirstCdRomDriveLetter = strDrive
            Exit Function
        End If
        lStart = lStart + 4
        strDrive = Mid(strDrives, lStart, 3)
    Loop While (Mid(strDrives, lStart, 1) <> vbNullChar)
End Function



