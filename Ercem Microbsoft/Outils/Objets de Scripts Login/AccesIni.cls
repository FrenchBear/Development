VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "AccesIni"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
' Classe OSL.AccesIni
' Accès aux fichiers .ini

Option Explicit

Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Public Function GetProfileString(ByVal sFichier As String, ByVal sSection As String, ByVal sClé As String, ByVal sDéfaut As String) As String
  Dim sRes As String, l As Long
  sRes = Space(500)
  l = GetPrivateProfileString(sSection, sClé, sDéfaut, sRes, 500, sFichier)
  GetProfileString = Left(sRes, l)
End Function

