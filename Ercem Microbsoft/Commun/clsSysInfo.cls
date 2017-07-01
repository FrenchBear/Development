VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SysInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' SysInfo
' 11/04/00 PV
' 20/05/00 PV Méthode d'origine pour déterminer si le login est authentifié foireuse... (bug sur Uranus)

Option Explicit

Public OSPlatform As Integer      ' 1=95/98, 2=NT/2000
Public OSMajorVersion As Integer  ' Codes système
Public OSMinorVersion As Integer  ' Codes système
Public OSVersion As Integer       ' N° simple maison: 95, 98, 3, 4, 2000

Public UserName As String         ' Nom utilisateur
Public Domain As String           ' Domaine ou groupe de travail
Public LMLogon                    ' Vrai si l'utilisateur/mot de passe est validé par un contrôleur de domaine

Public ComputerName As String     ' Nom d'ordinateur


' Version de Windows
Private Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Integer

Private Type OSVERSIONINFO
   dwOSVersionInfoSize As Long
   dwMajorVersion As Long
   dwMinorVersion As Long
   dwBuildNumber As Long
   dwPlatformId As Long
   szCSDVersion As String * 128
End Type


Private Sub Class_Initialize()
  Dim osinfo As OSVERSIONINFO
  Dim retvalue As Integer

  osinfo.dwOSVersionInfoSize = 148
  osinfo.szCSDVersion = Space$(128)
  retvalue = GetVersionExA(osinfo)
   
  OSPlatform = osinfo.dwPlatformId
  OSMajorVersion = osinfo.dwMajorVersion
  OSMinorVersion = osinfo.dwMinorVersion
  
  Dim WSHNetwork As Object
  Set WSHNetwork = CreateObject("WScript.Network")
  On Error Resume Next
  UserName = UCase(WSHNetwork.UserName)
  Domain = UCase(WSHNetwork.UserDomain)
  On Error GoTo 0
  ComputerName = UCase(WSHNetwork.ComputerName)
  
  With osinfo
    Select Case OSPlatform
      Case 1
        If .dwMinorVersion = 0 Then
          OSVersion = 95
        ElseIf .dwMinorVersion = 10 Then
          OSVersion = 98
        Else
          OSVersion = 99
        End If
        
        ' Manque le domaine
        Dim hKey As Long
        hKey = R0OuvreRegistry("HKEY_LOCAL_MACHINE\Network\Logon")
        Dim sV As String
        Dim lRetVal As Long
        'lRetVal = R0QueryValueEx(hKey, "logonvalidated", REG_BINARY, sV)
        'Domain = ""
        'If lRetVal = 0 Then
        '  If Left(sV, 2) = "01" Then
            Domain = RécupèreValeurRegistry("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP", "Workgroup", "REG_SZ")
        '  End If
        'End If
        
        ' On détermine si le login est validé
        LMLogon = False
        lRetVal = R0QueryValueEx(hKey, "LMLogon", REG_BINARY, sV)
        If lRetVal = 0 Then
          If Left(sV, 2) = "01" Then
            LMLogon = True
          End If
        End If
        R0FermeRegistry hKey
        
         
      Case 2
        If .dwMajorVersion = 3 Then
          OSVersion = 3
        ElseIf .dwMajorVersion = 4 Then
          OSVersion = 4
        ElseIf .dwMajorVersion = 5 Then
          OSVersion = 2000
        Else
          OSVersion = 99
        End If
        ' Sous NT/2000, les infos de WScript.Network sont Ok
        LMLogon = True    ' Sous NT/2000 on est toujours validé
        
      Case Else   ' ?
        OSVersion = 99
        
    End Select
  End With
End Sub
