VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SocketInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Const WS_VERSION_REQD = &H101
Private Const WS_VERSION_MAJOR = WS_VERSION_REQD \ &H100 And &HFF&
Private Const WS_VERSION_MINOR = WS_VERSION_REQD And &HFF&
Private Const MIN_SOCKETS_REQD = 1
Private Const SOCKET_ERROR = -1
Private Const WSADescription_Len = 256
Private Const WSASYS_Status_Len = 128

Private Type HOSTENT
    hName As Long
    hAliases As Long
    hAddrType As Integer
    hLength As Integer
    hAddrList As Long
End Type

Private Type WSADATA
    wversion As Integer
    wHighVersion As Integer
    szDescription(0 To WSADescription_Len) As Byte
    szSystemStatus(0 To WSASYS_Status_Len) As Byte
    iMaxSockets As Integer
    iMaxUdpDg As Integer
    lpszVendorInfo As Long
End Type

Private Declare Function WSAGetLastError Lib "WSOCK32.DLL" () As Long
Private Declare Function WSAStartup Lib "WSOCK32.DLL" (ByVal wVersionRequired&, lpWSAData As WSADATA) As Long
Private Declare Function WSACleanup Lib "WSOCK32.DLL" () As Long

Private Declare Function gethostname Lib "WSOCK32.DLL" (ByVal HostName$, ByVal HostLen As Long) As Long
Private Declare Function gethostbyname Lib "WSOCK32.DLL" (ByVal HostName$) As Long
Private Declare Sub RtlMoveMemory Lib "kernel32" (hpvDest As Any, ByVal hpvSource&, ByVal cbCopy&)



Private Function hibyte(ByVal wParam As Integer)
    hibyte = wParam \ &H100 And &HFF&
End Function

Private Function lobyte(ByVal wParam As Integer)
    lobyte = wParam And &HFF&
End Function



Private Sub Class_Initialize()
  Dim WSAD As WSADATA
  Dim iReturn As Integer
  Dim sLowByte As String, sHighByte As String, sMsg As String

  iReturn = WSAStartup(WS_VERSION_REQD, WSAD)

  If iReturn <> 0 Then
      MsgBox "Winsock.dll is not responding."
      Exit Sub
  End If

  If lobyte(WSAD.wversion) < WS_VERSION_MAJOR Or (lobyte(WSAD.wversion) = _
      WS_VERSION_MAJOR And hibyte(WSAD.wversion) < WS_VERSION_MINOR) Then

      sHighByte = Trim$(Str$(hibyte(WSAD.wversion)))
      sLowByte = Trim$(Str$(lobyte(WSAD.wversion)))
      sMsg = "Windows Sockets version " & sLowByte & "." & sHighByte
      sMsg = sMsg & " is not supported by winsock.dll "
      MsgBox sMsg
      Exit Sub
  End If

  'iMaxSockets is not used in winsock 2. So the following check is only
  'necessary for winsock 1. If winsock 2 is requested,
  'the following check can be skipped.

  If WSAD.iMaxSockets < MIN_SOCKETS_REQD Then
      sMsg = "This application requires a minimum of "
      sMsg = sMsg & Trim$(Str$(MIN_SOCKETS_REQD)) & " supported sockets."
      MsgBox sMsg
      Exit Sub
  End If
End Sub

Private Sub Class_Terminate()
  Dim lReturn As Long

  lReturn = WSACleanup()
  If lReturn <> 0 Then
      MsgBox "Socket error " & Trim$(Str$(lReturn)) & " occurred in Cleanup "
      Exit Sub
  End If
End Sub


Public Function sHostName() As String
  Dim HostName As String * 256
  Dim hostent_addr As Long
  Dim host As HOSTENT
  Dim hostip_addr As Long
  Dim temp_ip_address() As Byte
  Dim i As Integer
  Dim ip_address As String

  If gethostname(HostName, 256) = SOCKET_ERROR Then
      MsgBox "Windows Sockets error " & Str(WSAGetLastError())
      Exit Function
  Else
      sHostName = Left(Trim$(HostName), InStr(1, HostName, Chr(0)) - 1)
  End If
End Function


Public Function sAdresseIP() As String
  Dim HostName As String * 256
  Dim hostent_addr As Long
  Dim host As HOSTENT
  Dim hostip_addr As Long
  Dim temp_ip_address() As Byte
  Dim i As Integer
  Dim ip_address As String

  If gethostname(HostName, 256) = SOCKET_ERROR Then
      MsgBox "Windows Sockets error " & Str(WSAGetLastError())
      Exit Function
  Else
      HostName = Trim$(HostName)
  End If

  hostent_addr = gethostbyname(HostName)

  If hostent_addr = 0 Then
      MsgBox "Winsock.dll is not responding."
      Exit Function
  End If

  RtlMoveMemory host, hostent_addr, LenB(host)
  RtlMoveMemory hostip_addr, host.hAddrList, 4

  ' On ne récupère que la première adresse IP
  ReDim temp_ip_address(1 To host.hLength)
  RtlMoveMemory temp_ip_address(1), hostip_addr, host.hLength

  For i = 1 To host.hLength
    ip_address = ip_address & temp_ip_address(i) & "."
  Next
  ip_address = Mid$(ip_address, 1, Len(ip_address) - 1)

  sAdresseIP = ip_address

End Function
