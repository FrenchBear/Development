Attribute VB_Name = "modRegistry"
' Module modRegistry
' Fonctions d'accès à la registry depuis le VB
' 20/11/1997 PV
' 30/11/1997 PV EnumèreValeursRegistry
' 21/08/1998 PV Ajout du chemin dans les messages d'erreur
' 25/08/1998 PV EnumèreClésRegistry, exportation des fonctions R0xxx
'  7/04/2000 PV OpenRegKeyEx tente une ouverture en lecture si le mode KEY_ALL_ACCESS échoue (pour Windows 2000)
' 22/07/2004 PV Proto RegEnumValue corrigé...

Option Explicit

Global Const REG_NONE As Long = 0
Global Const REG_SZ As Long = 1
Global Const REG_BINARY As Long = 3
Global Const REG_DWORD As Long = 4

Private Const HKEY_CLASSES_ROOT = &H80000000
Private Const HKEY_CURRENT_USER = &H80000001
Private Const HKEY_LOCAL_MACHINE = &H80000002
Private Const HKEY_USERS = &H80000003
Private Const HKEY_CURRENT_CONFIG = &H80000005
Private Const HKEY_DYN_DATA = &H80000006

Private Const ERROR_SUCCESS = 0
Private Const ERROR_NONE = 0
Private Const ERROR_BADDB = 1
Private Const ERROR_BADKEY = 2
Private Const ERROR_CANTOPEN = 3
Private Const ERROR_CANTREAD = 4
Private Const ERROR_CANTWRITE = 5
Private Const ERROR_OUTOFMEMORY = 6
Private Const ERROR_INVALID_PARAMETER = 7
Private Const ERROR_ACCESS_DENIED = 8
Private Const ERROR_INVALID_PARAMETERS = 87
Private Const ERROR_MORE_DATA = 234
Private Const ERROR_NO_MORE_ITEMS = 259

Public Const READ_CONTROL = &H20000
Public Const SYNCHRONIZE = &H100000
Public Const STANDARD_RIGHTS_ALL = &H1F0000
Public Const STANDARD_RIGHTS_EXECUTE = (READ_CONTROL)
Public Const STANDARD_RIGHTS_READ = (READ_CONTROL)
Public Const STANDARD_RIGHTS_REQUIRED = &HF0000
Public Const STANDARD_RIGHTS_WRITE = (READ_CONTROL)

Public Const KEY_QUERY_VALUE = &H1
Public Const KEY_SET_VALUE = &H2
Public Const KEY_CREATE_SUB_KEY = &H4
Public Const KEY_ENUMERATE_SUB_KEYS = &H8
Public Const KEY_NOTIFY = &H10
Public Const KEY_CREATE_LINK = &H20
Public Const KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or KEY_QUERY_VALUE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or KEY_CREATE_LINK) And (Not SYNCHRONIZE))
Public Const KEY_READ = ((STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
Public Const KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))
Public Const KEY_EXECUTE = ((KEY_READ) And (Not SYNCHRONIZE))


Private Const REG_OPTION_NON_VOLATILE = 0

Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegQueryValueExString Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Private Declare Function RegQueryValueExLong Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Long, lpcbData As Long) As Long
Private Declare Function RegQueryValueExNULL Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As Long, lpcbData As Long) As Long
Private Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
'Private Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Private Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Private Declare Function RegEnumKey Lib "advapi32.dll" Alias "RegEnumKeyA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, ByVal cbName As Long) As Long

' Retourne en ASCII la constante d'erreur associée à la registry
' (la doc ne mentionne que les noms des constantes d'erreur, jamais la valeur…)
Private Function sRegStrErr(ByVal lStatus As Long) As String
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


' Récupération d'une valeur de la registry, qui analyse le type de la valeur
' et retourne le bon type dans une variant
' A priori plus simple que le code de la feuille 'A Propos' de l'assistant
' d'ajout de feuilles du VB5
Public Function R0QueryValueEx(ByVal lhKey As Long, ByVal szValueName As String, sType As String, vValue As Variant) As Long
  Dim cch As Long
  Dim lrc As Long
  Dim lType As Long
  Dim lValue As Long
  Dim sValue As String

  On Error GoTo QueryValueExError

  ' Determine the size and type of data to be read
  lrc = RegQueryValueExNULL(lhKey, szValueName, 0&, lType, 0&, cch)
  If lrc <> ERROR_NONE Then Err.Raise 5, "QueryValueEx", "Échec au RegQueryValueExNULL"

  Select Case lType
    Case REG_SZ:
      sType = "REG_SZ"
      sValue = String(cch, 0)
      lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)
      If lrc = ERROR_NONE Then
          vValue = Left$(sValue, cch - 1)
      Else
          vValue = Empty
      End If
    
    Case REG_DWORD:
      sType = "REG_DWORD"
      lrc = RegQueryValueExLong(lhKey, szValueName, 0&, lType, lValue, cch)
      If lrc = ERROR_NONE Then vValue = lValue
      
    Case REG_BINARY, REG_NONE:
      sType = IIf(lType = REG_BINARY, "REG_BINARY", "REG_NONE")
      sValue = String(cch, 0)
      lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)
      If lrc = ERROR_NONE Then
        vValue = ""
        Dim i As Integer
        For i = 1 To cch                            ' Convertit chaque octet
          vValue = vValue + Right(Hex(256 + Asc(Mid(sValue, i, 1))), 2) + " " ' Construit la valeur caractère par caractère.
        Next
      Else
        vValue = Empty
      End If
      
    Case Else
      ' all other data types not supported
      sType = lType
      vValue = "Type de données non géré."
  End Select

QueryValueExExit:
  R0QueryValueEx = lrc
  Exit Function
  
QueryValueExError:
  Resume QueryValueExExit
End Function


' Définit une valeur de registry
' Limité aux types REG_SZ et REG_DWORD
Public Function R0SetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
  Dim lValue As Long
  Dim sValue As String
  Select Case lType
    Case REG_SZ
      sValue = vValue & Chr$(0)
      R0SetValueEx = RegSetValueExString(hKey, sValueName, 0&, lType, sValue, Len(sValue))
    Case REG_DWORD
      lValue = vValue
      R0SetValueEx = RegSetValueExLong(hKey, sValueName, 0&, lType, lValue, 4)
  End Select
End Function


' Crée une clé de registry dans l'arborescence de lPredefinedKey
Private Sub R0CreateNewKey(sNewKeyName As String, lPredefinedKey As Long)
    Dim hNewKey As Long         'handle to the new key
    Dim lRetVal As Long         'result of the RegCreateKeyEx function

    lRetVal = RegCreateKeyEx(lPredefinedKey, sNewKeyName, 0&, _
              vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, _
              0&, hNewKey, lRetVal)
    RegCloseKey hNewKey
End Sub


' ================================================================================
' Ouverture - Fermeture

Public Function R0OuvreRegistry(ByVal sPath As String) As Long
  Dim lRoot As Long
  Dim p As Integer, sRoot As String
  Dim sPath0 As String
  
  p = InStr(sPath, "\")
  If p = 0 Then Err.Raise 609, "OuvreRegistry", "Path incorrect: " & sPath
  sPath0 = sPath
  sRoot = Left(sPath, p - 1)
  sPath = Mid(sPath, p + 1)
  
  Select Case UCase(sRoot)
    Case "HKEY_CLASSES_ROOT": lRoot = HKEY_CLASSES_ROOT
    Case "HKEY_CURRENT_USER": lRoot = HKEY_CURRENT_USER
    Case "HKEY_LOCAL_MACHINE": lRoot = HKEY_LOCAL_MACHINE
    Case "HKEY_USERS": lRoot = HKEY_USERS
    Case "HKEY_CURRENT_CONFIG": lRoot = HKEY_CURRENT_CONFIG
    Case "HKEY_DYN_DATA": lRoot = HKEY_DYN_DATA
    Case Else:
      If IsNumeric(sRoot) Then
        lRoot = CLng(sRoot)
      Else
        Err.Raise 6010, "OuvreRegistry", "Path incorrect: " & sPath0
      End If
  End Select

  Dim lRetVal As Long         ' result of the API functions
  Dim hKey As Long            ' handle of opened key

  lRetVal = RegOpenKeyEx(lRoot, sPath, 0, KEY_ALL_ACCESS, hKey)
  If lRetVal = 5 Then lRetVal = RegOpenKeyEx(lRoot, sPath, 0, KEY_READ, hKey)
  If lRetVal <> ERROR_NONE Then
    hKey = 0
    Err.Raise 6010 + lRetVal, "OuvreRegistry", "Échec au RegOpenKeyEx: " & sRegStrErr(lRetVal) & vbCrLf & "Path: " & sPath0
  End If

  R0OuvreRegistry = hKey
End Function


Public Function R0FermeRegistry(ByVal hKey As Long) As Long
  R0FermeRegistry = RegCloseKey(hKey)
End Function



' ================================================================================
' Fonctions de haut niveau

Function RécupèreValeurRegistry(ByVal sPath As String, ByVal sClé As String, ByRef sType As String) As Variant
  Dim vValue As Variant       ' setting of queried value
  Dim hKey As Long            ' handle of opened key
  Dim lRetVal As Long
  
  On Error GoTo ProblèmeRegistry
  hKey = R0OuvreRegistry(sPath)
  lRetVal = R0QueryValueEx(hKey, sClé, sType, vValue)
  If lRetVal <> ERROR_NONE Then
    Err.Raise 6010 + lRetVal, "RécupèreValeurRegistry", "Échec au QueryValueEx: " & sRegStrErr(lRetVal)
  End If
  RécupèreValeurRegistry = vValue
  RegCloseKey hKey
  Exit Function
  
ProblèmeRegistry:
  If hKey > 0 Then RegCloseKey hKey
  Err.Raise Err.Number, Err.Source, Err.Description
End Function


' Petite fonction de service
' Devrait tester les valeurs tres grandes ou 1e10
Private Function IsLong(ByVal sValeur As String) As Boolean
  IsLong = False
  If IsNumeric(sValeur) Then
    If InStr(sValeur, ".") = 0 And InStr(sValeur, ",") = 0 Then
      IsLong = True
    End If
  End If
End Function


' Type peut valoir REG_SZ ou REG_DWORD
' La valeur est toujours de type chaîne, et sera convertie à la demande
Sub DéfinitValeurRegistry(ByVal sType As String, ByVal sPath As String, ByVal sClé As String, ByVal sValeur As String)
  Dim hKey As Long            ' handle of opened key
  
  On Error GoTo ProblèmeRegistry
  hKey = R0OuvreRegistry(sPath)
  
  Select Case UCase(sType)
    Case "REG_DWORD":
      Dim lValeur As Long
      If Not IsLong(sValeur) Then
        Err.Raise 6014, "DéfinitValeurRegistry", "Valeur '" & sValeur & "' pas de type long"
      End If
      lValeur = CLng(sValeur)     ' Le VB déclenchera lui-même l'erreur 6 dépassement de capacité
      R0SetValueEx hKey, sClé, REG_DWORD, lValeur
      
    Case "REG_SZ":
      R0SetValueEx hKey, sClé, REG_SZ, sValeur
      
    Case Else
      Err.Raise 6014, "DéfinitValeurRegistry", "Type de valeur '" & sType & "' non supporté"
  End Select
  
  RegCloseKey hKey
  Exit Sub
  
ProblèmeRegistry:
  If hKey >= 0 Then RegCloseKey hKey
  Err.Raise Err
End Sub


Sub CréeCléRegistry(ByVal sPath As String)
  ' On isole la dernière partie du chemin
  Dim p1 As Integer, p2 As Integer
  p1 = 0
  Do
    p2 = InStr(p1 + 1, sPath, "\")
    If p2 = 0 Then Exit Do
    p1 = p2
  Loop
  If p1 = 0 Then Err.Raise 6015, "CréeCléRegistry", "Chemin de registry """ & sPath & """ incorrect"
  
  Dim hKey As Long            ' handle of opened key
  On Error GoTo ProblèmeRegistry
  hKey = R0OuvreRegistry(Left(sPath, p1 - 1))
  R0CreateNewKey Mid(sPath, p1 + 1), hKey
  R0FermeRegistry hKey
  Exit Sub
  
ProblèmeRegistry:
  If hKey >= 0 Then RegCloseKey hKey
  Err.Raise Err
End Sub


Function EnumèreValeursRegistry(ByVal sPath As String) As String
  Dim sRet As String                                      ' Valeur finale de retour
  
  Dim hKey As Long            ' handle of opened key
  On Error GoTo ProblèmeRegistry
  hKey = R0OuvreRegistry(sPath)
  
  Dim lIndex As Integer
  Dim sNomValeur As String
  Dim lNomValeur As Long
  Dim lRet As Long
  Dim KeyValType As Long
  Dim tmpVal As String                                    ' Stockage temporaire pour une valeur de clé de base de registres.
  Dim KeyValSize As Long                                  ' Taille de la variable de la clé de base de registres.
  Dim KeyVal As Variant
  
  lIndex = 0
  Do
    sNomValeur = String$(1024, 0)
    lNomValeur = 1024
    tmpVal = String$(1024, 0)                               ' Alloue de l'espace pour la variable.
    KeyValSize = 1024                                       ' Définit la taille de la variable.
    
    lRet = RegEnumValue(hKey, lIndex, sNomValeur, lNomValeur, 0, KeyValType, tmpVal, KeyValSize)
    If lRet = ERROR_NO_MORE_ITEMS Then Exit Do
    If lRet <> 0 Then MsgBox "STOP.12": Stop
    
    sNomValeur = Left(sNomValeur, lNomValeur)
    If sNomValeur = "" Then sNomValeur = "(défaut)"
    tmpVal = Left(tmpVal, KeyValSize)
    
    ' On convertit la valeur
    Dim i As Integer
    Select Case KeyValType                                  ' Recherche les types de données…
      Case REG_SZ                                           ' Type de données chaîne de la clé de la base de registres.
        KeyVal = Left(tmpVal, Len(tmpVal) - 1)              ' Copie la valeur de la chaîne.
      Case REG_DWORD                                        ' Type de données double mot de la clé de base de registres.
        KeyVal = ""
        For i = Len(tmpVal) To 1 Step -1                    ' Convertit chaque bit.
          KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))     ' Construit la valeur caractère par caractère.
        Next
        KeyVal = Format$("&h" + KeyVal)                     ' Convertit le mot double en chaîne.
      Case REG_BINARY, REG_NONE
        KeyVal = ""
        For i = 1 To Len(tmpVal)                            ' Convertit chaque octet
          KeyVal = KeyVal + Right(Hex(256 + Asc(Mid(tmpVal, i, 1))), 2) + " " ' Construit la valeur caractère par caractère.
        Next
      Case Else
        MsgBox "STOP.13": Stop
    End Select

    If sRet <> "" Then sRet = sRet + vbCrLf
    sRet = sRet + sNomValeur + "=" + KeyVal
    lIndex = lIndex + 1
  Loop
  RegCloseKey hKey
  EnumèreValeursRegistry = sRet
  Exit Function
  
ProblèmeRegistry:
  If hKey >= 0 Then RegCloseKey hKey
  Err.Raise Err
End Function


Function EnumèreClésRegistry(ByVal sPath As String) As String
  Dim sRet As String                                      ' Valeur finale de retour
  
  Dim hKey As Long            ' handle of opened key
  On Error GoTo ProblèmeRegistry
  hKey = R0OuvreRegistry(sPath)
  
  Dim lIndex As Integer
  Dim sNomClé As String
  Dim lNomClé As Long
  Dim lRet As Long
  
  lIndex = 0
  Do
    sNomClé = String$(100, 0)
    lNomClé = 100
    
    lRet = RegEnumKey(hKey, lIndex, sNomClé, lNomClé)
    If lRet = ERROR_NO_MORE_ITEMS Then Exit Do
    If lRet <> 0 Then MsgBox "STOP.14": Stop

    If sRet <> "" Then sRet = sRet + vbCrLf
    sRet = sRet + Left(sNomClé, InStr(sNomClé, Chr(0)) - 1)
    lIndex = lIndex + 1
  Loop
  RegCloseKey hKey
  EnumèreClésRegistry = sRet
  Exit Function
  
ProblèmeRegistry:
  If hKey >= 0 Then RegCloseKey hKey
  Err.Raise Err

End Function
