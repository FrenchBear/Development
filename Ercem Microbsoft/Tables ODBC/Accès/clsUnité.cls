VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Unit�"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "G�re les unit�s analytiques Ercem/LBF"
' Classe unit�
' G�re les unit�s analytiques Ercem/LBF
'  4/02/1998 PV
' 18/08/1999 PV sNumUni pour aligner les cl�s dans bdcombo

Option Explicit

Public uni_numunite As Integer  ' N� d'unit�
Public uni_code As String       ' Code abr�g� (UOP1)
Public uni_type As String       ' O: Op�rat, F: Fonct, S: Sect, L:Labo
Public uni_titre As String      ' Nom complet
Public uni_adr1 As String       ' 1�re ligne d'adresse
Public uni_adr2 As String       ' 2�me ligne d'adresse
Public uni_adr3 As String       ' CP+BDist
Public uni_telfax As String     ' Tel + Fax
Public uni_uvent                ' Unit� de ventilation
Public uni_msgid                ' Destinataire de messages de l'unit�
Public uni_web As String        ' Fichier web de l'unit�
Public timestamp As Date


Function Copie() As Unit�
  Dim k As New Unit�
  With k
    .uni_numunite = uni_numunite
    .uni_code = uni_code
    .uni_type = uni_type
    .uni_titre = uni_titre
    .uni_adr1 = uni_adr1
    .uni_adr2 = uni_adr2
    .uni_adr3 = uni_adr3
    .uni_telfax = uni_telfax
    .uni_uvent = uni_uvent
    .uni_msgid = uni_msgid
    .uni_web = uni_web
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

' Formate le n� d'unit� sur 3 positions, les espaces � droite �tant remplac�s par 2 blancs
Function sNumUni() As String
  If uni_numunite < 10 Then
    sNumUni = uni_numunite & "    "
  ElseIf uni_numunite < 100 Then
    sNumUni = uni_numunite & "  "
  Else
    sNumUni = uni_numunite
  End If
End Function

