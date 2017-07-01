VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 1  'vbDataSource
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsDataSource"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
' A FAIRE : déclarer un objet ADO Recordset local. Exemple :
Private WithEvents rs As ADODB.Recordset
Attribute rs.VB_VarHelpID = -1

Private Sub Class_GetDataMember(DataMember As String, Data As Object)
    ' A FAIRE : renvoyer le recordset approprié en fonction du DataMember.
    ' Exemple :
    
    Select Case DataMember
    Case ""             ' Default
        Set Data = Nothing
    Case Else           ' Default
        Set Data = rs
    End Select
End Sub

Private Sub Class_Initialize()
  set rs=
End Sub
