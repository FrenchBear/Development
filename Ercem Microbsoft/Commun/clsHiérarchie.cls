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
Attribute VB_Description = "Stocke les options consolidées de la structure établissemen, essentiellement pour implanter le cache de AccHiérarchie"
' Hiérarchie
' Stocke les options consolidées de la structure établissement
' Sert essentiellement à implanter un cache dans AccHiérarchie
' 17/10/97 PV
' 19/10/99 PV iEtb --> sEtb

Option Explicit

Public sEtb As String
Public iSec As Long
Public iDrg As Long
Public iDna As Long
Public iGrp As Long
Public sOptionsEdition As String
Public sOptionsLabo As String
Public cLangue As String
Public iCodeCli
Public sInfoCli As String


Function Copie() As Hiérarchie
  Dim h As New Hiérarchie
  With h
    .sEtb = sEtb
    .iSec = iSec
    .iDrg = iDrg
    .iDna = iDna
    .iGrp = iGrp
    .sOptionsEdition = sOptionsEdition
    .sOptionsLabo = sOptionsLabo
    .cLangue = cLangue
    .iCodeCli = iCodeCli
    .sInfoCli = sInfoCli
  End With
  Set Copie = h
End Function

