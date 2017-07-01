Attribute VB_Name = "MSysSnd"
' *********************************************************************
'  Copyright ©1998 Karl E. Peterson, All Rights Reserved
' *********************************************************************
'  You are free to use this code within your own applications, but you
'  are expressly forbidden from selling or otherwise distributing this
'  source code without prior written consent.
' *********************************************************************
Option Explicit
'
' Registry APIs
'
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegEnumKeyEx Lib "advapi32.dll" Alias "RegEnumKeyExA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As Any) As Long
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long         ' Note that if you declare the lpData parameter as String, you must pass it By Value.
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
'
' Registry constants
'
Private Const HKEY_CURRENT_USER = &H80000001
Private Const ERROR_SUCCESS = 0&
Private Const ERROR_MORE_DATA = 234
'
' Reg Key Security Options
'
Private Const DELETE = &H10000
Private Const READ_CONTROL = &H20000
Private Const WRITE_DAC = &H40000
Private Const WRITE_OWNER = &H80000
Private Const SYNCHRONIZE = &H100000
Private Const STANDARD_RIGHTS_READ = (READ_CONTROL)
Private Const STANDARD_RIGHTS_WRITE = (READ_CONTROL)
Private Const STANDARD_RIGHTS_EXECUTE = (READ_CONTROL)
Private Const STANDARD_RIGHTS_REQUIRED = &HF0000
Private Const STANDARD_RIGHTS_ALL = &H1F0000
Private Const SPECIFIC_RIGHTS_ALL = &HFFFF
Private Const KEY_QUERY_VALUE = &H1
Private Const KEY_SET_VALUE = &H2
Private Const KEY_CREATE_SUB_KEY = &H4
Private Const KEY_ENUMERATE_SUB_KEYS = &H8
Private Const KEY_NOTIFY = &H10
Private Const KEY_CREATE_LINK = &H20
Private Const KEY_READ = ((STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
Private Const KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))
Private Const KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or KEY_QUERY_VALUE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or KEY_CREATE_LINK) And (Not SYNCHRONIZE))
Private Const KEY_EXECUTE = ((KEY_READ) And (Not SYNCHRONIZE))
'
' Sound APIs
'
Private Declare Function PlaySound Lib "winmm.dll" Alias "PlaySoundA" (ByVal lpszName As String, ByVal hModule As Long, ByVal dwFlags As Long) As Long
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
'
' Sound constants
'
Private Const SND_ASYNC = &H1         ' play asynchronously
Private Const SND_ALIAS = &H10000     ' name is a WIN.INI [sounds] entry
Private Const SND_FILENAME = &H20000  ' name is a file name
'
' Enumerated system sounds
'
Public Enum SystemSounds
   ssSystemDefault
   ssSystemAsterisk
   ssSystemExclamation
   ssSystemQuestion
   ssSystemHand
   ssSystemStart
   ssSystemExit
End Enum
'
' System sound definitions
'
Public Type SystemSoundDefinitions
   GroupName As String
   SoundName As String
   RegKey As String
   Current As String
   Default As String
End Type

Public Function PlayMidiFile(ByVal FileName As String, Optional ByVal Alias As String = "tune") As Boolean
   Dim nRet As Long
   Call StopMidiFile(Alias)
   If mciSendString("open " & FileName & " alias " & Alias, vbNullString, 0, 0) = 0 Then
      nRet = mciSendString("play " & Alias & " from 0", vbNullString, 0, 0)
      PlayMidiFile = (nRet = 0)
   End If
End Function

Public Sub StopMidiFile(Optional ByVal Alias As String = "tune")
   Call mciSendString("stop " & Alias, vbNullString, 0, 0)
   Call mciSendString("close " & Alias, vbNullString, 0, 0)
End Sub

Public Sub PlaySoundFile(ByVal FileName As String, Optional ByVal Wait As Boolean = False)
   If Wait Then
      Call PlaySound(FileName, 0&, SND_FILENAME)
   Else
      Call PlaySound(FileName, 0&, SND_ASYNC Or SND_FILENAME)
   End If
End Sub

Public Sub PlaySoundSystem(ByVal WhichSound As SystemSounds)
   Dim SoundAlias As String
   
   Select Case WhichSound
      Case ssSystemAsterisk
         SoundAlias = "SystemAsterisk"
      Case ssSystemExclamation
         SoundAlias = "SystemExclamation"
      Case ssSystemExit
         SoundAlias = "SystemExit"
      Case ssSystemHand
         SoundAlias = "SystemHand"
      Case ssSystemQuestion
         SoundAlias = "SystemQuestion"
      Case ssSystemStart
         SoundAlias = "SystemStart"
      Case Else 'play default sound
         SoundAlias = "Gobbledygook"
   End Select
   Call PlaySound(SoundAlias, 0, SND_ASYNC Or SND_ALIAS)
End Sub

Public Sub PlaySoundSystemName(ByVal SoundName As String)
   Call PlaySound(SoundName, 0, SND_ASYNC Or SND_ALIAS)
End Sub

Public Function SystemSoundNames(Snds() As SystemSoundDefinitions) As Long
   Dim nRet As Long
   Dim hKey As Long
   Dim Ndx As Long
   Dim nSnds As Long
   Dim Buffer As String
   Dim BufLen As Long
   Dim Group As String
   Dim Groups() As String
   Dim GroupKeys() As String
   Dim SubKey As String
   Dim FileTime As Currency
   Dim i As Long
   
   Buffer = Space$(1024)
   SubKey = "AppEvents\Schemes\Apps"
   nRet = RegOpenKeyEx(HKEY_CURRENT_USER, SubKey, 0&, KEY_ALL_ACCESS, hKey)
   If nRet = ERROR_SUCCESS Then
      '
      ' Get group names
      '
      Do
         BufLen = Len(Buffer)
         nRet = RegEnumKeyEx(hKey, Ndx, Buffer, BufLen, ByVal 0, vbNullString, ByVal 0, FileTime)
         If nRet = ERROR_SUCCESS Then
            ReDim Preserve GroupKeys(0 To Ndx) As String
            GroupKeys(Ndx) = Left(Buffer, BufLen)
            Ndx = Ndx + 1
         Else
            Exit Do
         End If
      Loop
      Call RegCloseKey(hKey)
      '
      ' Iterate each group
      '
      ReDim Groups(LBound(GroupKeys) To UBound(GroupKeys)) As String
      For i = LBound(GroupKeys) To UBound(GroupKeys)
         SubKey = "AppEvents\Schemes\Apps\" & GroupKeys(i)
         Groups(i) = RegGetSetting(SubKey, "*")
         Ndx = 0
         nRet = RegOpenKeyEx(HKEY_CURRENT_USER, SubKey, 0&, KEY_ALL_ACCESS, hKey)
         If nRet = ERROR_SUCCESS Then
            Do
               BufLen = Len(Buffer)
               nRet = RegEnumKeyEx(hKey, Ndx, Buffer, BufLen, ByVal 0, vbNullString, ByVal 0, FileTime)
               If nRet = ERROR_SUCCESS Then
                  ReDim Preserve Snds(0 To nSnds) As SystemSoundDefinitions
                  With Snds(nSnds)
                     .GroupName = Groups(i)
                     .SoundName = Left(Buffer, BufLen)
                     .RegKey = SubKey & "\" & .SoundName
                     .Current = RegGetSetting(.RegKey & "\.Current", "*")
                     .Default = RegGetSetting(.RegKey & "\.Default", "*")
                  End With
                  Ndx = Ndx + 1
                  nSnds = nSnds + 1
               Else
                  Exit Do
               End If
            Loop
            Call RegCloseKey(hKey)
         End If
      Next i
   End If
   SystemSoundNames = nSnds
End Function

Public Function RegGetSetting(ByVal Section As String, ByVal Key As String, Optional ByVal Default As String = "") As String
   ' Section   Required. String expression containing the name of the section where the key setting is found.
   '           If omitted, key setting is assumed to be in default subkey.
   ' Key       Required. String expression containing the name of the key setting to return.
   ' Default   Optional. Expression containing the value to return if no value is set in the key setting.
   '           If omitted, default is assumed to be a zero-length string ("").
   Dim nRet As Long
   Dim hKey As Long
   Dim nType As Long
   Dim nBytes As Long
   Dim Buffer As String

   ' Assume failure and set return to Default
   RegGetSetting = Default

   ' Open key
   nRet = RegOpenKeyEx(HKEY_CURRENT_USER, Section, 0&, KEY_ALL_ACCESS, hKey)
   If nRet = ERROR_SUCCESS Then
      ' Set appropriate value for default query
      If Key = "*" Then Key = vbNullString

      ' Determine how large the buffer needs to be
      nRet = RegQueryValueEx(hKey, Key, 0&, nType, ByVal Buffer, nBytes)
      If nRet = ERROR_SUCCESS Then
         ' Build buffer and get data
         If nBytes > 0 Then
            Buffer = Space(nBytes)
            nRet = RegQueryValueEx(hKey, Key, 0&, nType, ByVal Buffer, Len(Buffer))
            If nRet = ERROR_SUCCESS Then
               ' Trim NULL and return successful query!
               RegGetSetting = Left(Buffer, nBytes - 1)
            End If
         End If
         Call RegCloseKey(hKey)
      End If
   End If
End Function

