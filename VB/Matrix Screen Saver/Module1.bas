Attribute VB_Name = "Module1"
Public Declare Function TextOut Lib "gdi32.dll" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Public Declare Function BitBlt Lib "gdi32.dll" (ByVal hdcDest As Long, ByVal nXDest As Long, ByVal nYDest As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hdcSrc As Long, ByVal nXSrc As Long, ByVal nYSrc As Long, ByVal dwRop As Long) As Long
Public Declare Function EnumDisplaySettings Lib "user32.dll" Alias "EnumDisplaySettingsA" (ByVal lpszDeviceName As String, ByVal iModeNum As Long, lpDevMode As DEVMODE) As Long
Public Declare Function PlaySound Lib "winmm.dll" Alias "PlaySoundA" (ByVal lpszName As String, ByVal hModule As Long, ByVal dwFlags As Long) As Long
Public Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Public Declare Function GetPrivateProfileInt Lib "kernel32" Alias "GetPrivateProfileIntA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal nDefault As Long, ByVal lpFileName As String) As Long
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As String, ByVal lpFileName As String) As Long

Public Type POINTAPI
        x As Long
        y As Long
End Type

Public Const SWP_NOMOVE = 2
Public Const SWP_NOSIZE = 1
Public Const HWND_TOPMOST = -1
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

'Public Const SND_ALIAS = &H10000
'Public Const SND_ALIAS_ID = &H110000
'Public Const SND_APPLICATION = &H80
Public Const SND_ASYNC = &H1
'Public Const SND_FILENAME = &H20000
'Public Const SND_LOOP = &H8
'Public Const SND_MEMORY = &H4
Public Const SND_NODEFAULT = &H2
'Public Const SND_NOSTOP = &H10
'Public Const SND_NOWAIT = &H2000
Public Const SND_PURGE = &H40
'Public Const SND_RESOURCE = &H4004
'Public Const SND_SYNC = &H0


Public Type DEVMODE
    dmDeviceName As String * 32
    dmSpecVersion As Integer
    dmDriverVersion As Integer
    dmSize As Integer
    dmDriverExtra As Integer
    dmFields As Long
    dmOrientation As Integer
    dmPaperSize As Integer
    dmPaperLength As Integer
    dmPaperWidth As Integer
    dmScale As Integer
    dmCopies As Integer
    dmDefaultSource As Integer
    dmPrintQuality As Integer
    dmColor As Integer
    dmDuplex As Integer
    dmYResolution As Integer
    dmTTOption As Integer
    dmCollate As Integer
    dmFormName As String * 32
    dmUnusedPadding As Integer
    dmBitsPerPixel As Integer
    dmPelsWidth As Long
    dmPelsHeight As Long
    dmDisplayFlags As Long
    dmDisplayFrequency As Long
    ' The following only appear in Windows 95, 98, 2000
    dmICMMethod As Long
    dmICMIntent As Long
    dmMediaType As Long
    dmDitherType As Long
    dmReserved1 As Long
    dmReserved2 As Long
    ' The following only appear in Windows 2000
    dmPanningWidth As Long
    dmPanningHeight As Long
End Type

Public Const ENUM_CURRENT_SETTINGS = -1

Public Const BLACKNESS = &H42
' Const CAPTUREBLT = ???
Public Const DSTINVERT = &H550009
Public Const MERGECOPY = &HC000CA
Public Const MERGEPAINT = &HBB0226
' Const NOMIRRORBITMAP = ???
Public Const NOTSRCCOPY = &H330008
Public Const NOTSRCERASE = &H1100A6
Public Const PATCOPY = &HF00021
Public Const PATINVERT = &H5A0049
Public Const PATPAINT = &HFB0A09
Public Const SRCAND = &H8800C6
Public Const SRCCOPY = &HCC0020
Public Const SRCERASE = &H440328
Public Const SRCINVERT = &H660046
Public Const SRCPAINT = &HEE0086
Public Const WHITENESS = &HFF0062
