Attribute VB_Name = "Common"
Option Explicit

' read entries from the registry
Function RegistryGetSetting(ByVal Section As String, ByVal KeyName As String) As Variant
    
    Dim wshShell As Variant
    On Error Resume Next
    Set wshShell = CreateObject("WScript.Shell")
    RegistryGetSetting = wshShell.RegRead(Section & "\" & KeyName)
    If Err.Description <> "" Then RegistryGetSetting = "!!!Not found!!!"
    Set wshShell = Nothing
    
End Function

