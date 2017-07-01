VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Méthode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un enregistrement de la table methode"
' classe Méthode
' Modélise un enregistrement de la table methode
' 22/10/97 PV

Option Explicit

Public met_germe As Integer
Public met_methode As String
Public met_libelle As String
Public met_reference As String
Public met_laboaccr As String
Public met_comment As String
Public met_dureeinc
Public met_deltadureeinc
Public met_filler
Public timestamp


Function Copie() As Méthode
  Dim k As New Méthode
  With k
    .met_germe = met_germe
    .met_methode = met_methode
    .met_libelle = met_libelle
    .met_reference = met_reference
    .met_laboaccr = met_laboaccr
    .met_comment = met_comment
    .met_dureeinc = met_dureeinc
    .met_deltadureeinc = met_deltadureeinc
    .met_filler = met_filler
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "met1"
  Write #iNumFic, met_germe
  Write #iNumFic, met_methode
  Write #iNumFic, met_libelle
  Write #iNumFic, met_reference
  Write #iNumFic, met_laboaccr
  Write #iNumFic, met_comment
  Write #iNumFic, met_dureeinc
  Write #iNumFic, met_deltadureeinc
  Write #iNumFic, met_filler
  Write #iNumFic, timestamp
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sClé As String
  Input #1, sClé
  If sClé <> "met1" Then
    MsgBox2i "CO100", "Méthode.DiskRead", "met1", sClé
    Stop
  End If
  Input #iNumFic, met_germe
  Input #iNumFic, met_methode
  Input #iNumFic, met_libelle
  Input #iNumFic, met_reference
  Input #iNumFic, met_laboaccr
  Line Input #iNumFic, met_comment
  Input #iNumFic, met_dureeinc
  Input #iNumFic, met_deltadureeinc
  Input #iNumFic, met_filler
  Input #iNumFic, timestamp
End Sub

