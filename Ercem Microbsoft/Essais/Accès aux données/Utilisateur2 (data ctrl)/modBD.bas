Attribute VB_Name = "modBD"
' ModBD
' Acc�s globaux � la base de donn�es
' 4/12/97 PV

Option Explicit

Dim db As Database

Public Sub InitBD()
  Set db = OpenDatabase("", dbDriverNoPrompt, False, "ODBC;DSN=ercem;UID=sce;PWD=;Hostname=serveur;ServerID=Informix;DBname=/u/ercem;DBuser=;DBauth=;DBoptions=;")
End Sub

Public Sub FinBD()
  db.Close
End Sub


Public Function sUnit�(v As Variant) As String
  If Not IsNumeric(v) Then
    sUnit� = "???"
  Else
    Dim r As Recordset
    Set r = db.OpenRecordset("select uni_code from unite where uni_numunite=" & v)
    sUnit� = r!uni_code
    r.Close
  End If
End Function


Public Function iGetMaxUti() As Integer
  Dim r As Recordset
  Set r = db.OpenRecordset("select max(uti_numuti) as m from utilisateur")
  iGetMaxUti = r!m
  r.Close
End Function
