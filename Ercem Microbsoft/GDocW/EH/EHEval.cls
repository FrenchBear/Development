VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "EHEval"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' classe EHEVal
' Evaluation d'un item
' 05/02/1999 PV

Option Explicit

Public iS�rie As Long         ' N� de s�rie de l'item associ�
Public sValeur As String
Public sD�cote As String
Public iFormat As Integer     ' -1 est transform� en NULL
Public sOptions As String

Public vLibst As Variant      ' Peut �tre NULL
Public vSyst�me As Variant    ' "
Public vObs As Variant        ' "

Public sObs As String
