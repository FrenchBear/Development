Attribute VB_Name = "mod6000"
' mod6000
' Déclarations globales pour serveur6000
' Gestion de l'environnement et des variables dynamiques
' Fonctions d'information disque
' 20/11/1997 PV
' 24/11/1997 PV Fonctions d'info disque
' 29/11/1997 PV GetDiskFreeSpaceEx; WNetGetConnection
'  2/12/1997 PV Pb d'environnement mal défini (ligne ne contenant pas =) traité (Erreur 5 au lancement)
' 28/08/1998 PV HaltSys
' 23/11/1998 PV NewWallPaper
'  1/12/1998 PV ListeFenêtres
'  6/03/2000 PV Modifs pour que ça tourne sous NT/2000

Option Explicit

Public Const sNomApp As String = "Serveur6000"

Public Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
Public Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

' Version de Windows
Public Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Integer

Public Type OSVERSIONINFO
   dwOSVersionInfoSize As Long
   dwMajorVersion As Long
   dwMinorVersion As Long
   dwBuildNumber As Long
   dwPlatformId As Long
   szCSDVersion As String * 128
End Type


' Taille disque disponible
Private Declare Function GetLogicalDrives Lib "kernel32" () As Long
Private Declare Function GetDiskFreeSpace Lib "kernel32" Alias "GetDiskFreeSpaceA" (ByVal lpRootPathName As String, lpSectorsPerCluster As Long, lpBytesPerSector As Long, lpNumberOfFreeClusters As Long, lpTotalNumberOfClusters As Long) As Long
Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal lpRootPathName As String) As Long
Private Declare Function GetDiskFreeSpaceEx Lib "kernel32" Alias "GetDiskFreeSpaceExA" (ByVal lpRootPathName As String, ByRef FreeBytesAvailableToCaller As Currency, ByRef TotalNumberOfBytes As Currency, ByRef TotalNumberOfFreeBytes As Currency) As Boolean


Private Type DiskInformation
  lpSectorsPerCluster As Long
  lpBytesPerSector As Long
  lpNumberOfFreeClusters As Long
  lpTotalNumberOfClusters As Long
End Type

Const DRIVE_UNKNOWN = 0
Const DRIVE_NO_ROOT_DIR = 1
Const DRIVE_REMOVABLE = 2
Const DRIVE_FIXED = 3
Const DRIVE_REMOTE = 4
Const DRIVE_CDROM = 5
Const DRIVE_RAMDISK = 6


' Mapping disque réseau
Declare Function WNetGetConnection Lib "mpr.dll" Alias "WNetGetConnectionA" (ByVal lpszLocalName As String, ByVal lpszRemoteName As String, cbRemoteName As Long) As Long


' Infos mémoire
Type MEMORYSTATUS
  dwLength As Long
  dwMemoryLoad As Long
  dwTotalPhys As Long
  dwAvailPhys As Long
  dwTotalPageFile As Long
  dwAvailPageFile As Long
  dwTotalVirtual As Long
  dwAvailVirtual As Long
End Type
Declare Sub GlobalMemoryStatus Lib "kernel32" (lpBuffer As MEMORYSTATUS)


' Reboot
Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Public Const EWX_FORCE = 4
Public Const EWX_LOGOFF = 0
Public Const EWX_REBOOT = 2
Public Const EWX_SHUTDOWN = 1



' Gestion privée de l'environnement, puisqu'on ne peut pas le modifier en VB !
Public colEnv As New Collection

 
 
' Infos système
Declare Sub GetSystemInfo Lib "kernel32" (lpSystemInfo As SYSTEM_INFO)

Type SYSTEM_INFO
  dwOemID As Long
  dwPageSize As Long
  lpMinimumApplicationAddress As Long
  lpMaximumApplicationAddress As Long
  dwActiveProcessorMask As Long
  dwNumberOrfProcessors As Long
  dwProcessorType As Long
  dwAllocationGranularity As Long
  wProcessorLevel As Integer
  wProcessorRevision As Integer
End Type



' Papier peint

Const SPI_SETDESKWALLPAPER = 20
Const SPIF_UPDATEINIFILE = &H1
Const SPIF_SENDWININICHANGE = &H2

Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long


' Fenêtres

Private Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long

'Declare constants used by GetWindow.
Const GW_CHILD = 5
Const GW_HWNDFIRST = 0
Const GW_HWNDLAST = 1
Const GW_HWNDNEXT = 2
Const GW_HWNDPREV = 3
Const GW_OWNER = 4


 
' ========================================================================
' Environnement


' Recopie l'environnement dans la collection colEnv pour une gestion privée à Serveur6000
Public Sub InitEnv()
  Dim i As Integer
  i = 1
  While Environ(i) <> ""
    Dim sKey As String
    Dim p As Integer
    
    p = InStr(Environ(i), "=")
    If p > 0 Then
      sKey = Left(Environ(i), p - 1)
      colEnv.Add Environ(i), sKey
    End If
    i = i + 1
  Wend
  
  ' On ajoute des variables supplémentaires
  
  ' Le répertoire Windows est déjà dans l'environnement !
  'Dim sWinDir As String, sWinDir100 As String * 100, iLen As Integer
  'iLen = GetWindowsDirectory(sWinDir100, 100)
  'sWinDir = Left(sWinDir100, iLen)
  'colEnv.Add "WINDIR=" & sWinDir, "WINDIR"
  
  ' Versions
  Dim sType As String   ' Type de retour de valeur, inutilisé
  colEnv.Add "SERVEUR6000=" & App.Major & "." & App.Minor & "." & App.Revision, "SERVEUR6000"
  colEnv.Add "OSPLATFORM=" & iGetOSPlatform
  colEnv.Add "OSVERSION=" & iGetOSMajorVersion & "." & iGetOSMinorVersion
  
  ' Plus n'est pas forcément installé !
  Dim sPlusVersion As String
  On Error Resume Next
  sPlusVersion = RécupèreValeurRegistry("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Plus! VersionNumber", sType)
  If Err Then sPlusVersion = "(pas installé)"
  On Error GoTo 0
  colEnv.Add "PLUSVERSION=" & sPlusVersion, "PLUSVERSION"
  
  ' Identification réseau de l'utilisateur
  ' Pas très intéressant à Ercem (msdos pour tout le monde)
  Dim sUserName As String
  Dim strBuffer As String * 255, lngBufferLength As Long
  Dim lngRet As Long
  lngBufferLength = 255
  lngRet = GetUserName(strBuffer, lngBufferLength)
  sUserName = Left$(strBuffer, lngBufferLength - 1)
  On Error Resume Next  ' UserName existe dans l'environnement NT
  colEnv.Add "USERNAME=" & sUserName, "USERNAME"
  On Error GoTo 0
  
  ' Les variables dynamiques (TIME, VISIBLE, …) ne sont pas stockées dans la registry privée
  ' mais évaluées par d'autres moyens au moment de la lecture de la valeur
End Sub


' Retourne une variable d'environnement
' Évalue les variables dynamiques
Public Function GetEnv(Index As Integer, ByVal sKey As String) As String
  
  ' Valeurs spéciales, dynamiques
  Select Case UCase(sKey)
    Case "VISIBLE": GetEnv = IIf(frmServeur6000.cmdVisible.Checked, "On", "Off"): Exit Function
    Case "SYSTRAY": GetEnv = IIf(frmServeur6000.cmdSysTray.Checked, "On", "Off"): Exit Function
    Case "ECHO":    GetEnv = IIf(frmServeur6000.GetEcho(Index), "On", "Off"): Exit Function
    Case "PROMPT":
      If (Index > 0) Then GetEnv = frmServeur6000.GetPrompt(Index): Exit Function
    Case "DATE":    GetEnv = Format(Date, "dd/mm/yyyy"): Exit Function
    Case "TIME":    GetEnv = Format(Time, "hh:mm:ss"): Exit Function
  End Select
  
  Dim sRet As String
  Dim p As Integer
  
  On Error GoTo Problème
  sRet = colEnv(sKey)
  On Error GoTo 0
  p = InStr(sRet, "=")
  GetEnv = Mid(sRet, p + 1)
  Exit Function
  
Problème:
  GetEnv = ""
End Function


' Définit une variable d'environnement
Public Sub SetEnv(Index As Integer, ByVal sKey As String, ByVal sValue As String)

  ' Traitement des variables d'environnement spéciales
  Select Case UCase(sKey)
    Case "SYSTRAY":
      If UCase(sValue) = "ON" Then
        If Not frmServeur6000.cmdSysTray.Checked Then frmServeur6000.cmdSysTray_Click
      ElseIf UCase(sValue) = "OFF" Then
        If frmServeur6000.cmdSysTray.Checked Then frmServeur6000.cmdSysTray_Click
      End If
      Exit Sub
      
    Case "VISIBLE":
      If UCase(sValue) = "ON" Then
        If Not frmServeur6000.cmdVisible.Checked Then frmServeur6000.cmdVisible_Click
      ElseIf UCase(sValue) = "OFF" Then
        If frmServeur6000.cmdVisible.Checked Then frmServeur6000.cmdVisible_Click
      End If
      Exit Sub
      
    Case "ECHO":
      If UCase(sValue) = "ON" Then
        frmServeur6000.SetEcho Index, True
      ElseIf UCase(sValue) = "OFF" Then
        frmServeur6000.SetEcho Index, False
      End If
      Exit Sub
    
    Case "PROMPT":
      ' Pour les sessions TCP, chaque session a son prompt
      If (Index > 0) Then
        frmServeur6000.SetPrompt Index, sValue
        Exit Sub
      End If
    
    ' Pour passer en mode spécial adaministration
    ' c'est à dire un dialogue généré par un autre programme
    ' On coupe l'écho, et on met un prompt spécial % et fin de ligne, facile à
    ' détecter et à analyser comme fin de réponse
    Case "ADMIN":
      If (Index > 0) Then
        frmServeur6000.SetPrompt Index, "%" & vbCrLf
        frmServeur6000.SetEcho Index, False
        Exit Sub
      End If
    
    Case "DATE"
      CmdDate Index, sValue
      Exit Sub

    Case "TIME"
      CmdTime Index, sValue
      Exit Sub
  End Select

  ' Variable classique
  On Error Resume Next
  colEnv.Remove sKey
  On Error GoTo 0
  colEnv.Add sKey & "=" & sValue, sKey
End Sub



' ========================================================================
' Informations disque

' Ne fonctionne pas sur les partitions de plus de 2Go OSR2 (retourne 2Go)
' Utiliser VbGetDiskFreeSpaceEx
Public Function DiskFreeSpace(ByVal sRootPathname As String) As Long
  Dim info As DiskInformation
  Dim lAnswer As Long
  Dim lpRootPathName As String
  Dim lpSectorsPerCluster As Long
  Dim lpBytesPerSector As Long
  Dim lpNumberOfFreeClusters As Long
  Dim lpTotalNumberOfClusters As Long
  Dim lBytesPerCluster As Long
  Dim lNumFreeBytes As Double
  
  lAnswer = GetDiskFreeSpace(sRootPathname, lpSectorsPerCluster, lpBytesPerSector, lpNumberOfFreeClusters, lpTotalNumberOfClusters)
  lBytesPerCluster = lpSectorsPerCluster * lpBytesPerSector
  lNumFreeBytes = lBytesPerCluster * lpNumberOfFreeClusters
  DiskFreeSpace = lNumFreeBytes
End Function


Public Function DiskTotalSpace(ByVal sRootPathname As String) As Long
  Dim info As DiskInformation
  Dim lAnswer As Long
  Dim lpSectorsPerCluster As Long
  Dim lpBytesPerSector As Long
  Dim lpNumberOfFreeClusters As Long
  Dim lpTotalNumberOfClusters As Long
  Dim lBytesPerCluster As Long
  Dim lNumFreeBytes As Double
  
  lAnswer = GetDiskFreeSpace(sRootPathname, lpSectorsPerCluster, lpBytesPerSector, lpNumberOfFreeClusters, lpTotalNumberOfClusters)
  lBytesPerCluster = lpSectorsPerCluster * lpBytesPerSector
  lNumFreeBytes = lBytesPerCluster * lpTotalNumberOfClusters
  DiskTotalSpace = lNumFreeBytes
End Function


Public Function DiskType(ByVal sRootPathname As String) As String
  Select Case GetDriveType(sRootPathname)
    Case DRIVE_UNKNOWN: DiskType = "?"
    Case DRIVE_NO_ROOT_DIR: DiskType = "Disque inexistant"
    Case DRIVE_REMOVABLE: DiskType = "Disque amovible"
    Case DRIVE_FIXED: DiskType = "Disque fixe"
    Case DRIVE_REMOTE: DiskType = "Disque réseau"
    Case DRIVE_CDROM: DiskType = "CD-Rom"
    Case DRIVE_RAMDISK: DiskType = "Disque RAM"
  End Select
End Function

Public Function RemoteDrive(ByVal sRootPathname As String) As String
  Dim sRemote As String
  Dim l As Long
  sRemote = Space(100)
  l = Len(sRemote)
  WNetGetConnection Left(sRootPathname, 2), sRemote, l
  RemoteDrive = Left(sRemote, InStr(sRemote, Chr(0)) - 1)
End Function

Public Function VolumeLabel(ByVal sRootPathname As String) As String
  VolumeLabel = Dir(sRootPathname, vbVolume)
End Function

Public Function UnitésDisque() As Long
  UnitésDisque = GetLogicalDrives
End Function


' Interface OSR2
' A tester sur un système non OSR2
Public Function VbGetDiskFreeSpaceEx(ByVal sRootPathname As String, ByRef FreeBytesAvailableToCaller As Currency, ByRef TotalNumberOfBytes As Currency, ByRef TotalNumberOfFreeBytes As Currency) As Boolean
  Dim bRet As Integer
  
  On Error GoTo ProblèmeEx
  bRet = GetDiskFreeSpaceEx(sRootPathname, FreeBytesAvailableToCaller, TotalNumberOfBytes, TotalNumberOfFreeBytes)
  On Error GoTo 0
  If bRet Then
    FreeBytesAvailableToCaller = FreeBytesAvailableToCaller * 10000
    TotalNumberOfBytes = TotalNumberOfBytes * 10000
    TotalNumberOfFreeBytes = TotalNumberOfFreeBytes * 10000
  End If
  VbGetDiskFreeSpaceEx = bRet
  Exit Function
  
ProblèmeEx:
  VbGetDiskFreeSpaceEx = False
End Function


' ========================================================================
' Informations processeur

Public Function ProcInfo() As String
  Dim sRet As String
  Dim si As SYSTEM_INFO
  GetSystemInfo si
  ProcInfo = si.dwProcessorType
End Function


' ========================================================================
' Relais HMsgBox

Public Function HMsgBox(sMsg, Optional Buttons As VbMsgBoxStyle = vbOKOnly) As String
  HMsgBox = frmMsgHtml.HMsgBox(sMsg, Buttons, sNomApp)
End Function


' ========================================================================
' Redémarrage du système

Public Sub HaltSys(ByVal bForcé As Boolean, ByVal bReboot As Boolean)
  ExitWindowsEx IIf(bForcé, EWX_FORCE, 0) + IIf(bReboot, EWX_REBOOT, EWX_SHUTDOWN), 0
End Sub


' ========================================================================
' Changement de papier peint

Function NewWallpaper(ByVal sFichier As String)
  sFichier = sFichier & Chr(0)
  SystemParametersInfo SPI_SETDESKWALLPAPER, 0&, sFichier, SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE
End Function



' ========================================================================
' Liste des fenêtres

Function sListeFenêtres() As String
   Dim CurrWnd, length As Integer
   Dim sRet As String, iNumF As Integer
   Dim sNomF As String
   
   'Get the hWnd of the first item in the master list
   'so we can process the task list entries (top-level only).
   CurrWnd = GetWindow(frmServeur6000.hwnd, GW_HWNDFIRST)

   iNumF = 0
   'Loop while the hWnd returned by GetWindow is valid.
   While CurrWnd <> 0
      'Get the length of task name identified by CurrWnd in the list.
      length = GetWindowTextLength(CurrWnd)

      'Get task name of the task in the master list.
      sNomF = Space(length + 1)
      length = GetWindowText(CurrWnd, sNomF, length + 1)

      'If there is a task name in the list, add the item to the list.
      If length > 0 Then
         iNumF = iNumF + 1
         If iNumF > 1 Then sRet = sRet & vbCrLf
         sRet = sRet & "FENETRE" & Format(iNumF) & "=" & Left(sNomF, length)
      End If

      'Get the next task list item in the master list.
      CurrWnd = GetWindow(CurrWnd, GW_HWNDNEXT)
   Wend
   sListeFenêtres = sRet
End Function



' ========================================================================
' Retourne la famille de Windows
' 1=95/98, 2=NT/2000

Public Function iGetOSPlatform() As Integer
   Dim osinfo As OSVERSIONINFO
   Dim retvalue As Integer

   osinfo.dwOSVersionInfoSize = 148
   osinfo.szCSDVersion = Space$(128)
   retvalue = GetVersionExA(osinfo)
   
   iGetOSPlatform = osinfo.dwPlatformId

'   With osinfo
'   Select Case .dwPlatformId
'      Case 1
'         If .dwMinorVersion = 0 Then
'            getVersion = "Windows 95"
'         ElseIf .dwMinorVersion = 10 Then
'            getVersion = "Windows 98"
'         End If
'      Case 2
'         If .dwMajorVersion = 3 Then
'            getVersion = "Windows NT 3.51"
'         ElseIf .dwMajorVersion = 4 Then
'            getVersion = "Windows NT 4.0"
'         ElseIf .dwMajorVersion = 5 Then
'            getVersion = "Windows 2000"
'         End If
'      Case Else
'         getVersion = "Failed"
'   End Select
'   End With
End Function


Public Function iGetOSMajorVersion() As Integer
  Dim osinfo As OSVERSIONINFO
  Dim retvalue As Integer

  osinfo.dwOSVersionInfoSize = 148
  osinfo.szCSDVersion = Space$(128)
  retvalue = GetVersionExA(osinfo)
  
  iGetOSMajorVersion = osinfo.dwMajorVersion
End Function

Public Function iGetOSMinorVersion() As Integer
  Dim osinfo As OSVERSIONINFO
  Dim retvalue As Integer

  osinfo.dwOSVersionInfoSize = 148
  osinfo.szCSDVersion = Space$(128)
  retvalue = GetVersionExA(osinfo)
  
  iGetOSMinorVersion = osinfo.dwMinorVersion
End Function

