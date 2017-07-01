VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Unité"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gère les unités analytiques Ercem/LBF"
' Classe unité
' Gère les unités analytiques Ercem/LBF
'  4/02/1998 PV
' 18/08/1999 PV sNumUni pour aligner les clés dans bdcombo

Option Explicit

Public uni_numunite As Integer  ' N° d'unité
Public uni_code As String       ' Code abrégé (UOP1)
Public uni_type As String       ' O: Opérat, F: Fonct, S: Sect, L:Labo
Public uni_titre As String      ' Nom complet
Public uni_adr1 As String       ' 1ère ligne d'adresse
Public uni_adr2 As String       ' 2ème ligne d'adresse
Public uni_adr3 As String       ' CP+BDist
Public uni_telfax As String     ' Tel + Fax
Public uni_uvent                ' Unité de ventilation
Public uni_msgid                ' Destinataire de messages de l'unité
Public uni_web As String        ' Fichier web de l'unité
Public timestamp As Date


Function Copie() As Unité
  Dim k As New Unité
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

' Formate le n° d'unité sur 3 positions, les espaces à droite étant remplacés par 2 blancs
Function sNumUni() As String
  If uni_numunite < 10 Then
    sNumUni = uni_numunite & "    "
  ElseIf uni_numunite < 100 Then
    sNumUni = uni_numunite & "  "
  Else
    sNumUni = uni_numunite
  End If
End Function

