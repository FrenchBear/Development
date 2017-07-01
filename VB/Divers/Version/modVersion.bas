Attribute VB_Name = "Version"
' Version
' Accès à ver.dll depuis le VB5
' 18/04/1998 PV

Option Explicit

' The Global constants below are defined in the VER.H header file, also
' included in Microsoft C/C++ 7.0, and the Windows SDK.

Type VS_FIXEDFILEINFO
   dwSignature As Long
   dwStrucVersionl As Integer     '  e.g. = &h0000 = 0
   dwStrucVersionh As Integer     '  e.g. = &h0042 = .42
   dwFileVersionMSl As Integer    '  e.g. = &h0003 = 3
   dwFileVersionMSh As Integer    '  e.g. = &h0075 = .75
   dwFileVersionLSl As Integer    '  e.g. = &h0000 = 0
   dwFileVersionLSh As Integer    '  e.g. = &h0031 = .31
   dwProductVersionMSl As Integer '  e.g. = &h0003 = 3
   dwProductVersionMSh As Integer '  e.g. = &h0010 = .1
   dwProductVersionLSl As Integer '  e.g. = &h0000 = 0
   dwProductVersionLSh As Integer '  e.g. = &h0031 = .31
   dwFileFlagsMask As Long        '  = &h3F for version "0.42"
   dwFileFlags As Long            '  e.g. VFF_DEBUG Or VFF_PRERELEASE
   dwFileOS As Long               '  e.g. VOS_DOS_WINDOWS16
   dwFileType As Long             '  e.g. VFT_DRIVER
   dwFileSubtype As Long          '  e.g. VFT2_DRV_KEYBOARD
   dwFileDateMS As Long           '  e.g. 0
   dwFileDateLS As Long           '  e.g. 0
End Type

Declare Function GetFileVersionInfo Lib "Version.dll" Alias "GetFileVersionInfoA" (ByVal lptstrFilename As String, ByVal dwHandle As Long, ByVal dwlen As Long, lpData As Any) As Long
Declare Function GetFileVersionInfoSize Lib "Version.dll" Alias "GetFileVersionInfoSizeA" (ByVal lptstrFilename As String, lpdwHandle As Long) As Long
Declare Function VerQueryValue Lib "Version.dll" Alias "VerQueryValueA" (pBlock As Any, ByVal lpSubBlock As String, lplpBuffer As Any, puLen As Long) As Long
Declare Sub MoveMemory Lib "kernel32" Alias "RtlMoveMemory" (dest As Any, ByVal Source As Long, ByVal length As Long)
Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal Path As String, ByVal cbBytes As Long) As Long

' ===== From Win32 Ver.h =================
' ----- VS_VERSION.dwFileFlags -----
Public Const VS_FFI_SIGNATURE = &HFEEF04BD
Public Const VS_FFI_STRUCVERSION = &H10000
Public Const VS_FFI_FILEFLAGSMASK = &H3F&

' ----- VS_VERSION.dwFileFlags -----
Public Const VS_FF_DEBUG = &H1
Public Const VS_FF_PRERELEASE = &H2
Public Const VS_FF_PATCHED = &H4
Public Const VS_FF_PRIVATEBUILD = &H8
Public Const VS_FF_INFOINFERRED = &H10
Public Const VS_FF_SPECIALBUILD = &H20

' ----- VS_VERSION.dwFileOS -----
Public Const VOS_UNKNOWN = &H0
Public Const VOS_DOS = &H10000
Public Const VOS_OS216 = &H20000
Public Const VOS_OS232 = &H30000
Public Const VOS_NT = &H40000

Public Const VOS__BASE = &H0
Public Const VOS__WINDOWS16 = &H1
Public Const VOS__PM16 = &H2
Public Const VOS__PM32 = &H3
Public Const VOS__WINDOWS32 = &H4

Public Const VOS_DOS_WINDOWS16 = &H10001
Public Const VOS_DOS_WINDOWS32 = &H10004
Public Const VOS_OS216_PM16 = &H20002
Public Const VOS_OS232_PM32 = &H30003
Public Const VOS_NT_WINDOWS32 = &H40004

' ----- VS_VERSION.dwFileType -----
Public Const VFT_UNKNOWN = &H0
Public Const VFT_APP = &H1
Public Const VFT_DLL = &H2
Public Const VFT_DRV = &H3
Public Const VFT_FONT = &H4
Public Const VFT_VXD = &H5
Public Const VFT_STATIC_LIB = &H7

' ----- VS_VERSION.dwFileSubtype for VFT_WINDOWS_DRV -----
Public Const VFT2_UNKNOWN = &H0
Public Const VFT2_DRV_PRINTER = &H1
Public Const VFT2_DRV_KEYBOARD = &H2
Public Const VFT2_DRV_LANGUAGE = &H3
Public Const VFT2_DRV_DISPLAY = &H4
Public Const VFT2_DRV_MOUSE = &H5
Public Const VFT2_DRV_NETWORK = &H6
Public Const VFT2_DRV_SYSTEM = &H7
Public Const VFT2_DRV_INSTALLABLE = &H8
Public Const VFT2_DRV_SOUND = &H9
Public Const VFT2_DRV_COMM = &HA


Function GetVersion(ByVal FullFileName As String, ByRef VerInfo As VS_FIXEDFILEINFO) As Boolean
' Get the version of a particular file
' See KB article Q112731

  Dim BufSize As Long, dwHandle As Long
  Dim lpvData() As Byte, r As Integer, lVerPointer As Long

  'Get the buffer size required for the GetFileVersionInfo call
  BufSize = GetFileVersionInfoSize(FullFileName$, dwHandle)
  If BufSize = 0 Then
    GetVersion = False
  Else
    ' Retrieve the data into a string buffer, and then ...
    ReDim lpvData(BufSize)
    r = GetFileVersionInfo(FullFileName, dwHandle, BufSize, lpvData(0))
    ' ... copy it into the user defined structure
    r = VerQueryValue(lpvData(0), "\", lVerPointer, BufSize)
    MoveMemory VerInfo, lVerPointer, Len(VerInfo)
    
    GetVersion = True
  End If
End Function


Function GetVersionStr(ByVal FullFileName As String) As String
  Dim VerInfo As VS_FIXEDFILEINFO
  
  If Not GetVersion(FullFileName, VerInfo) Then
    GetVersionStr = ""
  Else
    GetVersionStr = VerInfo.dwFileVersionMSh & "." & VerInfo.dwFileVersionMSl & "." & VerInfo.dwFileVersionLSh & "." & VerInfo.dwFileVersionLSl
  End If
End Function
