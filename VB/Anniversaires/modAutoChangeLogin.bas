Attribute VB_Name = "modAutoChangeLogin"
' modAutoChangeLogin
' 31/05/1998 PV

Option Explicit

Public sLoginActuel As String

Public Sub Main()
  Dim sLoginSuivant As String
  sLoginActuel = R�cup�reValeurRegistry("HKEY_LOCAL_MACHINE\Network\Logon", "username", "REG_SZ")
  
  If StrComp(sLoginActuel, "pierre", vbTextCompare) = 0 Then
    sLoginSuivant = "Claude"
  ElseIf StrComp(sLoginActuel, "claude", vbTextCompare) = 0 Then
    sLoginSuivant = "Pierre"
  End If
  
  If sLoginSuivant <> "" Then
    D�finitValeurRegistry "REG_SZ", "HKEY_LOCAL_MACHINE\Network\Logon", "username", sLoginSuivant
  End If
End Sub

