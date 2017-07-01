VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "CNetWksta"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' *********************************************************
'  Copyright (C)1997, Karl E. Peterson
' *********************************************************
Option Explicit
'
' Win32 APIs to determine OS information.
'
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
Private Type OSVERSIONINFO
   dwOSVersionInfoSize As Long
   dwMajorVersion As Long
   dwMinorVersion As Long
   dwBuildNumber As Long
   dwPlatformId As Long
   szCSDVersion As String * 128
End Type
Private Const VER_PLATFORM_WIN32s = 0
Private Const VER_PLATFORM_WIN32_WINDOWS = 1
Private Const VER_PLATFORM_WIN32_NT = 2
'
' Win32 NetAPIs.
'
Private Declare Function NetWkstaGetInfo Lib "Netapi32.dll" (lpServer As Any, ByVal Level As Long, lpBuffer As Any) As Long
Private Declare Function NetWkstaUserGetInfo Lib "Netapi32.dll" (ByVal reserved As Any, ByVal Level As Long, lpBuffer As Any) As Long
Private Declare Function NetApiBufferFree Lib "Netapi32.dll" (ByVal lpBuffer As Long) As Long
'
' Data handling APIs
'
Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (pTo As Any, uFrom As Any, ByVal lSize As Long)
Private Declare Function lstrlenW Lib "kernel32" (ByVal lpString As Long) As Long
Private Declare Function lstrcpyW Lib "kernel32" (lpString1 As Byte, ByVal lpString2 As Long) As Long

Private Type WKSTA_INFO_102
   wki102_platform_id As Long
   wki102_computername As Long
   wki102_langroup As Long
   wki102_ver_major As Long
   wki102_ver_minor As Long
   wki102_lanroot As Long
   wki102_logged_on_users As Long
End Type

Private Type WkstaInfo102
   PlatformId As Long
   ComputerName As String
   LanGroup As String
   VerMajor As Long
   VerMinor As Long
   LanRoot As String
   LoggedOnUsers As Long
End Type

Private Type WKSTA_USER_INFO_1
   wkui1_username As Long
   wkui1_logon_domain As Long
   wkui1_oth_domains As Long
   wkui1_logon_server As Long
End Type

Private Type WkstaUserInfo1
   UserName As String
   LogonDomain As String
   OtherDomains As String
   LogonServer As String
End Type

Private Const NERR_Success As Long = 0&
'
' Member variables
'
Private m_Wks As WkstaInfo102
Private m_User As WkstaUserInfo1
Private m_IsWinNT As Boolean
   
' *********************************************************
'  Initialization
' *********************************************************
Private Sub Class_Initialize()
   Dim os As OSVERSIONINFO
   '
   ' Check to make sure we're running NT!
   '
   os.dwOSVersionInfoSize = Len(os)
   Call GetVersionEx(os)
   If os.dwPlatformId = VER_PLATFORM_WIN32_NT Then
      m_IsWinNT = True
      Me.Refresh
   End If
End Sub

' *********************************************************
'  Public Properties (Workstation)
' *********************************************************
Public Property Get ComputerName() As String
   ComputerName = m_Wks.ComputerName
End Property

Public Property Get Domain() As String
   Domain = m_Wks.LanGroup
End Property

Public Property Get LanRoot() As String
   LanRoot = m_Wks.LanRoot
End Property

Public Property Get LoggedOnUsers() As Long
   LoggedOnUsers = m_Wks.LoggedOnUsers
End Property

Public Property Get PlatformId() As Long
   PlatformId = m_Wks.PlatformId
End Property

Public Property Get VerMajor() As Long
   VerMajor = m_Wks.VerMajor
End Property

Public Property Get VerMinor() As Long
   VerMinor = m_Wks.VerMinor
End Property

' *********************************************************
'  Public Properties (Workstation User)
' *********************************************************
Public Property Get LogonDomain() As String
   LogonDomain = m_User.LogonDomain
End Property

Public Property Get LogonServer() As String
   LogonServer = m_User.LogonServer
End Property

Public Property Get OtherDomains() As String
   OtherDomains = m_User.OtherDomains
End Property

Public Property Get UserName() As String
   UserName = m_User.UserName
End Property

' *********************************************************
'  Public Methods
' *********************************************************
Public Sub Refresh()
   Dim lpBuffer As Long
   Dim nRet As Long
   Dim wki As WKSTA_INFO_102
   Dim wkui As WKSTA_USER_INFO_1
   '
   ' These functions only exist in Windows NT!!!
   '
   If Not m_IsWinNT Then Exit Sub
   '
   ' Obtain workstation information
   '
   nRet = NetWkstaGetInfo(ByVal 0&, 102&, lpBuffer)
   If nRet = NERR_Success Then
      '
      ' Transfer data to VB-friendly structure
      '
      CopyMem wki, ByVal lpBuffer, Len(wki)
      m_Wks.PlatformId = wki.wki102_platform_id
      m_Wks.ComputerName = PointerToStringW(wki.wki102_computername)
      m_Wks.LanGroup = PointerToStringW(wki.wki102_langroup)
      m_Wks.VerMajor = wki.wki102_ver_major
      m_Wks.VerMinor = wki.wki102_ver_minor
      m_Wks.LanRoot = PointerToStringW(wki.wki102_lanroot)
      m_Wks.LoggedOnUsers = wki.wki102_logged_on_users
      '
      ' Clean up
      '
      If lpBuffer Then
         Call NetApiBufferFree(lpBuffer)
      End If
   End If
   '
   ' Obtain user information for this workstation
   '
   nRet = NetWkstaUserGetInfo(0&, 1&, lpBuffer)
   If nRet = NERR_Success Then
      '
      ' Transfer data to VB-friendly structure
      '
      CopyMem wkui, ByVal lpBuffer, Len(wkui)
      m_User.UserName = PointerToStringW(wkui.wkui1_username)
      m_User.LogonDomain = PointerToStringW(wkui.wkui1_logon_domain)
      m_User.OtherDomains = PointerToStringW(wkui.wkui1_oth_domains)
      m_User.LogonServer = PointerToStringW(wkui.wkui1_logon_server)
      '
      ' Clean up
      '
      If lpBuffer Then
         Call NetApiBufferFree(lpBuffer)
      End If
   End If
End Sub

' *********************************************************
'  Private Methods
' *********************************************************
Private Function PointerToStringW(lpStringW As Long) As String
   Dim buffer() As Byte
   Dim nLen As Long
   
   If lpStringW Then
      nLen = lstrlenW(lpStringW) * 2
      If nLen Then
         ReDim buffer(0 To (nLen - 1)) As Byte
         CopyMem buffer(0), ByVal lpStringW, nLen
         PointerToStringW = buffer
      End If
   End If
End Function


