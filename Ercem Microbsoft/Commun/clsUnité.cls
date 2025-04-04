VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Unite"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "G�re les unit�s analytiques Ercem/LBF"
' Classe unit�
' G�re les unit�s analytiques
' 21/07/1998 PV -uni_uvent, -uni_msgid, -uni_web

Option Explicit

Public uni_numunite As Integer  ' N� d'unit�
Public uni_code As String       ' Code abr�g� (UOP1)
Public uni_type As String       ' O: Op�rat, F: Fonct, S: Sect, L:Labo
Public uni_titre As String      ' Nom complet
Public uni_adr1 As String       ' 1�re ligne d'adresse
Public uni_adr2 As String       ' 2�me ligne d'adresse
Public uni_adr3 As String       ' CP+BDist
Public uni_telfax As String     ' Tel + Fax

Function Copie() As Unite
  Dim k As New Unite
  With k
    .uni_numunite = uni_numunite
    .uni_code = uni_code
    .uni_type = uni_type
    .uni_titre = uni_titre
    .uni_adr1 = uni_adr1
    .uni_adr2 = uni_adr2
    .uni_adr3 = uni_adr3
    .uni_telfax = uni_telfax
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, uni_numunite
  Write #iNumFic, uni_code
  Write #iNumFic, uni_type
  Write #iNumFic, uni_titre
  Write #iNumFic, uni_adr1
  Write #iNumFic, uni_adr2
  Write #iNumFic, uni_adr3
  Write #iNumFic, uni_telfax
End Sub

Sub DiskRead(iNumFic As Integer)
  Input #iNumFic, uni_numunite
  Input #iNumFic, uni_code
  Input #iNumFic, uni_type
  Input #iNumFic, uni_titre
  Input #iNumFic, uni_adr1
  Input #iNumFic, uni_adr2
  Input #iNumFic, uni_adr3
  Input #iNumFic, uni_telfax
End Sub

