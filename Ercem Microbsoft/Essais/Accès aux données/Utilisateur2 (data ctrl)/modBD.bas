Attribute VB_Name = "modBD"
' ModBD
' Accès globaux à la base de données
' 4/12/97 PV

Option Explicit

Dim db As Database

Public Sub InitBD()
  Set db = OpenDatabase("", dbDriverNoPrompt, False, "ODBC;DSN=ercem;UID=sce;PWD=;Hostname=serveur;ServerID=Informix;DBname=/u/ercem;DBuser=;DBauth=;DBoptions=;")
End Sub

Public Sub FinBD()
  db.Close
End Sub


Public Function sUnité(v As Variant) As String
  If Not IsNumeric(v) Then
    sUnité = "???"
  Else
    Dim r As Recordset
    Set r = db.OpenRecordset("select uni_code from unite where uni_numunite=" & v)
    sUnité = r!uni_code
    r.Close
  End If
End Function


Public Function iGetMaxUti() As Integer
  Dim r As Recordset
  Set r = db.OpenRecordset("select max(uti_numuti) as m from utilisateur")
  iGetMaxUti = r!m
  r.Close
End Function
