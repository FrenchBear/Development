VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SérieLabo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe SérieLabo
' Modélise une série du labo
' 25/08/1998 PV

Option Explicit

Public ser_numserie As Long
Public ser_numtech As Integer
Public ser_dh As Date
Public ser_superserie As Integer
