VERSION 5.00
Begin VB.Form frmTestRegistry 
   Caption         =   "Test du module d'accès à la registry"
   ClientHeight    =   6105
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6885
   LinkTopic       =   "Form1"
   ScaleHeight     =   6105
   ScaleWidth      =   6885
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnTest 
      Caption         =   "Test"
      Height          =   495
      Left            =   4440
      TabIndex        =   0
      Top             =   720
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestRegistry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnTest_Click()
  Dim v
  v = RécupèreValeurRegistry("HKEY_CURRENT_USER\Software\PViolent\VTerm\1.0", "Police")
  Print "Type: " & TypeName(v)
  Print "Valeur: " & v
  v = RécupèreValeurRegistry("HKEY_CURRENT_USER\Software\PViolent\VTerm\1.0", "Options")
  Print "Type: " & TypeName(v)
  Print "Valeur: " & v
End Sub

Function RécupèreValeurRegistry(ByVal sPath As String, ByVal sClé As String) As Variant
  Dim lRoot As Long
  Dim p As Integer, sRoot As String
  
  p = InStr(sPath, "\")
  If p = 0 Then Err.Raise 609, "sPath", "Path incorrect"
  sRoot = Left(sPath, p - 1)
  sPath = Mid(sPath, p + 1)
  
  Select Case UCase(sRoot)
    Case "HKEY_CLASSES_ROOT": lRoot = HKEY_CLASSES_ROOT
    Case "HKEY_CURRENT_USER": lRoot = HKEY_CURRENT_USER
    Case "HKEY_LOCAL_MACHINE": lRoot = HKEY_LOCAL_MACHINE
    Case "HKEY_USERS": lRoot = HKEY_USERS
    Case Else:
      If IsNumeric(sRoot) Then
        lRoot = CLng(sRoot)
      Else
        Err.Raise 6010, "sPath", "Path incorrect"
      End If
  End Select

  Dim lRetVal As Long         ' result of the API functions
  Dim hKey As Long            ' handle of opened key
  Dim vValue As Variant       ' setting of queried value

  lRetVal = RegOpenKeyEx(lRoot, sPath, 0, KEY_ALL_ACCESS, hKey)
  If lRetVal <> ERROR_NONE Then
    Err.Raise 6010 + lRetVal, "RegOpenKeyEx", "Echec au RegOpenKeyEx: " & sRegStrErr(lRetVal)
  End If
  
  lRetVal = QueryValueEx(hKey, sClé, vValue)
  If lRetVal <> ERROR_NONE Then
    Err.Raise 6010 + lRetVal, "QueryValueEx", "Echec au QueryValueEx: " & sRegStrErr(lRetVal)
  End If
  RécupèreValeurRegistry = vValue
  RegCloseKey (hKey)
End Function
