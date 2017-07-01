Attribute VB_Name = "GlobalAdmin6000"
Attribute VB_Description = "Déclarations globales d'admin6000"
' Module GlobalAdmin6000
' Déclarations globales d'admin6000
' 29/11/97 PV

Option Explicit

Global Const sNomApp As String = "Admin6000"
Global Const sDémon As String = "Serveur6000"

Public Sub MsgBox2(ByVal sMessage As String, sCOde As String)
  MsgBox sMessage, vbExclamation, sNomApp
End Sub
