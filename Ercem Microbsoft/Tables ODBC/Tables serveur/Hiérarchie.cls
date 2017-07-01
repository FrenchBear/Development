VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Hiérarchie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Hiérarchie
' Classe pour mémoriser une hiérarchie dans un cache
' 23/11/1999

Option Explicit

Public sec_optedition As String
Public sec_optlabo As String

Public drg_numdrg As Long
Public drg_nom As String
Public drg_optedition As String
Public drg_optlabo As String

Public dna_numdna As Long
Public dna_nom As String
Public dna_optedition As String
Public dna_optlabo As String

Public grp_numgrp As Long
Public grp_nom As String
Public grp_optedition As String
Public grp_optlabo As String

