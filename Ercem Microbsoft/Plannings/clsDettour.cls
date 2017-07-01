VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Dettour"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' classe Dettour
' Corps de fiche tournée simplifié
' 17/08/1999 PV
' 19/10/1999 PV dt_numetb long -> char(6)
' 10/03/2000 PV +infos 3 à 7; dt_nxx string -> integer

Option Explicit

Public dt_numetb As String
Public dt_variocolor As String
Public dt_comment As String
Public dt_1xx As Integer
Public dt_2xx As Integer
Public dt_3xx As Integer
Public dt_4xx As Integer
Public dt_5xx As Integer
Public dt_6xx As Integer
Public dt_7xx As Integer

