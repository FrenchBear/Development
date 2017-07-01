VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Milieu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un enregistrement de la table milieu"
' Classe Milieu
' Modélise un enregistrement de la table milieu
' 3/09/97 PV

Option Explicit

Public mil_indice As Integer      ' N° du Milieu
Public mil_libelle As String      ' Libellé
Public mil_abrege As String       '
Public mil_typemarquage As String '
Public mil_typeboite As String    '
Public mil_commentaire As String  ' commentaire libre
Public timestamp                  ' timestamp de l'enregistrement

Function Copie() As Milieu
  Dim k As New Milieu
  With k
    .mil_indice = mil_indice
    .mil_libelle = mil_libelle
    .mil_abrege = mil_abrege
    .mil_typemarquage = mil_typemarquage
    .mil_typeboite = mil_typeboite
    .mil_commentaire = mil_commentaire
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "mil1"
  Write #iNumFic, mil_indice
  Write #iNumFic, mil_libelle
  Write #iNumFic, mil_abrege
  Write #iNumFic, mil_typemarquage
  Write #iNumFic, mil_typeboite
  Write #iNumFic, mil_commentaire
  Write #iNumFic, timestamp
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sClé As String
  Input #1, sClé
  If sClé <> "mil1" Then
    MsgBox2i "CO100", "Milieu.DiskRead", "mil1", sClé
    Stop
  End If
  Input #iNumFic, mil_indice
  Input #iNumFic, mil_libelle
  Input #iNumFic, mil_abrege
  Input #iNumFic, mil_typemarquage
  Input #iNumFic, mil_typeboite
  Line Input #iNumFic, mil_commentaire
  Input #iNumFic, timestamp
End Sub
