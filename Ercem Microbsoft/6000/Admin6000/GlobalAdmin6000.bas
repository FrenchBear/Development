Attribute VB_Name = "GlobalAdmin6000"
Attribute VB_Description = "D�clarations globales d'admin6000"
' Module GlobalAdmin6000
' D�clarations globales d'admin6000
' 29/11/97 PV

Option Explicit

Global Const sNomApp As String = "Admin6000"
Global Const sD�mon As String = "Serveur6000"

Public Sub MsgBox2(ByVal sMessage As String, sCOde As String)
  MsgBox sMessage, vbExclamation, sNomApp
End Sub
