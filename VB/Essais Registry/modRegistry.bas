Attribute VB_Name = "modRegistry"
' modRegistry
' Fonctions d'accès à la registry
' 31/05/98 PV

Option Explicit

Global Const REG_SZ As Long = 1
Global Const REG_DWORD As Long = 4

Global Const HKEY_CLASSES_ROOT = &H80000000
Global Const HKEY_CURRENT_USER = &H80000001
Global Const HKEY_LOCAL_MACHINE = &H80000002
Global Const HKEY_USERS = &H80000003

Global Const ERROR_NONE = 0
Global Const ERROR_BADDB = 1
Global Const ERROR_BADKEY = 2
Global Const ERROR_CANTOPEN = 3
Global Const ERROR_CANTREAD = 4
Global Const ERROR_CANTWRITE = 5
Global Const ERROR_OUTOFMEMORY = 6
Global Const ERROR_INVALID_PARAMETER = 7
Global Const ERROR_ACCESS_DENIED = 8
Global Const ERROR_INVALID_PARAMETERS = 87
Global Const ERROR_NO_MORE_ITEMS = 259

Global Const KEY_ALL_ACCESS = &H3F

Global Const REG_OPTION_NON_VOLATILE = 0

Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegQueryValueExString Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Declare Function RegQueryValueExLong Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Long, lpcbData As Long) As Long
Declare Function RegQueryValueExNULL Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As Long, lpcbData As Long) As Long
Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long


Private Function SetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
  Dim lValue As Long
  Dim sValue As String
  Select Case lType
    Case REG_SZ
      sValue = vValue & Chr$(0)
      SetValueEx = RegSetValueExString(hKey, sValueName, 0&, lType, sValue, Len(sValue))
    Case REG_DWORD
      lValue = vValue
      SetValueEx = RegSetValueExLong(hKey, sValueName, 0&, lType, lValue, 4)
  End Select
End Function


Private Function QueryValueEx(ByVal lhKey As Long, ByVal szValueName As String, vValue As Variant) As Long
  Dim cch As Long
  Dim lrc As Long
  Dim lType As Long
  Dim lValue As Long
  Dim sValue As String

  On Error GoTo QueryValueExError

  ' Determine the size and type of data to be read
  lrc = RegQueryValueExNULL(lhKey, szValueName, 0&, lType, 0&, cch)
  If lrc <> ERROR_NONE Then Error 5

  Select Case lType
    ' For strings
    Case REG_SZ:
      sValue = String(cch, 0)
      lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)
      If lrc = ERROR_NONE Then
          vValue = Left$(sValue, cch - 1)
      Else
          vValue = Empty
      End If
    ' For DWORDS
    Case REG_DWORD:
      lrc = RegQueryValueExLong(lhKey, szValueName, 0&, lType, lValue, cch)
      If lrc = ERROR_NONE Then vValue = lValue
    Case Else
      'all other data types not supported
      lrc = -1
  End Select

QueryValueExExit:
  QueryValueEx = lrc
  Exit Function
QueryValueExError:
  Resume QueryValueExExit
End Function


Private Sub CreateNewKey(sNewKeyName As String, lPredefinedKey As Long)
    Dim hNewKey As Long         'handle to the new key
    Dim lRetVal As Long         'result of the RegCreateKeyEx function

    lRetVal = RegCreateKeyEx(lPredefinedKey, sNewKeyName, 0&, _
              vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, _
              0&, hNewKey, lRetVal)
    RegCloseKey (hNewKey)
End Sub

' =============================================================================

Public Sub SetKeyValue(sKeyName As String, sValueName As String, vValueSetting As Variant, lValueType As Long)
  Dim lRetVal As Long         'result of the SetValueEx function
  Dim hKey As Long         'handle of open key

  'open the specified key
  lRetVal = RegOpenKeyEx(HKEY_CURRENT_USER, sKeyName, 0, KEY_ALL_ACCESS, hKey)
  lRetVal = SetValueEx(hKey, sValueName, lValueType, vValueSetting)
  RegCloseKey (hKey)
End Sub

Public Function GetKeyValueExpress(hDomaine As Long, sKeyName As String, sValueName As String) As Variant
  Dim lRetVal As Long         'result of the SetValueEx function
  Dim hKey As Long            'handle of open key
  Dim vValue As Variant
  lRetVal = RegOpenKeyEx(hDomaine, sKeyName, 0, KEY_ALL_ACCESS, hKey)
  lRetVal = QueryValueEx(hKey, sValueName, vValue)
  RegCloseKey hKey
  GetKeyValue = vValue
End Function


Public Function sRegStrErr(ByVal lStatus As Long) As String
  Select Case lStatus
    Case ERROR_NONE:                sRegStrErr = "ERROR_NONE"
    Case ERROR_BADDB:               sRegStrErr = "ERROR_BADDB"
    Case ERROR_BADKEY:              sRegStrErr = "ERROR_BADKEY"
    Case ERROR_CANTOPEN:            sRegStrErr = "ERROR_CANTOPEN"
    Case ERROR_CANTREAD:            sRegStrErr = "ERROR_CANTREAD"
    Case ERROR_CANTWRITE:           sRegStrErr = "ERROR_CANTWRITE"
    Case ERROR_OUTOFMEMORY:         sRegStrErr = "ERROR_OUTOFMEMORY"
    Case ERROR_INVALID_PARAMETER:   sRegStrErr = "ERROR_INVALID_PARAMETER"
    Case ERROR_ACCESS_DENIED:       sRegStrErr = "ERROR_ACCESS_DENIED"
    Case ERROR_INVALID_PARAMETERS:  sRegStrErr = "ERROR_INVALID_PARAMETERS"
    Case ERROR_NO_MORE_ITEMS:       sRegStrErr = "ERROR_NO_MORE_ITEMS"
    Case Else:                      sRegStrErr = "? " & lStatus
  End Select
End Function
