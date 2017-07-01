Attribute VB_Name = "modBase"
' modBase
' Accès à la base de données
' 26/04/1998 PV

Option Explicit

Const sNomBase = "d:\Microbsoft\Plans EH\bdPlans.mdb"

Public db As Database

Function bOuvreBase() As Boolean
  On Error Resume Next
  Set db = OpenDatabase(sNomBase, , False)
  If Err Then
    MsgBox "Échec à l'ouverture de la base de données." & vbCrLf & vbCrLf & "Erreur " & Err.Number & " (" & Err.Source & "): " & Err.Description, vbExclamation, sNomApp
    bOuvreBase = False
    Exit Function
  End If
  
  bOuvreBase = True
End Function

Sub FermeBase()
  db.Close
End Sub
