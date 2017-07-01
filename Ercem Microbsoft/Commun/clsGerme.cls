VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Germe"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un enregistrement de la table germe"
' Classe Germe
' Modélise un enregistrement de la table germe
' 3/09/97 PV

Option Explicit

Public ger_indice As Integer    ' N° du Germe
Public ger_langue As String     ' Langue du libellé
Public ger_libelle As String    ' Libellé
Public ger_abrege As String     '
Public ger_abregelabo As String '
Public ger_auchan As String     '
Public ger_comment As String    ' Commentaire sur le serveur
Public ger_datecreat            ' Date de création
Public ger_heurecreat           ' Heure de création
Public ger_opercreat            ' Code de la personne ayant créé l'info
Public ger_datemodif            ' Date de dernière modification
Public ger_heuremodif           ' Heure de dernière modification
Public ger_opermodif            ' Code de la personne ayant modifié l'info pour la dernière fois
Public timestamp                ' timestamp de l'enregistrement

Function Copie() As Germe
  Dim k As New Germe
  With k
    .ger_indice = ger_indice
    .ger_langue = ger_langue
    .ger_libelle = ger_libelle
    .ger_abrege = ger_abrege
    .ger_abregelabo = ger_abregelabo
    .ger_auchan = ger_auchan
    .ger_comment = ger_comment
    .ger_datecreat = ger_datecreat
    .ger_heurecreat = ger_heurecreat
    .ger_opercreat = ger_opercreat
    .ger_datemodif = ger_datemodif
    .ger_heuremodif = ger_heuremodif
    .ger_opermodif = ger_opermodif
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "ger1"
  Write #iNumFic, ger_indice
  Write #iNumFic, ger_langue
  Write #iNumFic, ger_libelle
  Write #iNumFic, ger_abrege
  Write #iNumFic, ger_abregelabo
  Write #iNumFic, ger_auchan
  Write #iNumFic, ger_comment
  Write #iNumFic, ger_datecreat
  Write #iNumFic, ger_heurecreat
  Write #iNumFic, ger_opercreat
  Write #iNumFic, ger_datemodif
  Write #iNumFic, ger_heuremodif
  Write #iNumFic, ger_opermodif
  Write #iNumFic, timestamp
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sClé As String
  Input #1, sClé
  If sClé <> "ger1" Then
    MsgBox2i "CO100", "Germe.DiskRead", "ger1", sClé
    Stop
  End If
  Input #iNumFic, ger_indice
  Input #iNumFic, ger_langue
  Input #iNumFic, ger_libelle
  Input #iNumFic, ger_abrege
  Input #iNumFic, ger_abregelabo
  Input #iNumFic, ger_auchan
  Line Input #iNumFic, ger_comment
  Input #iNumFic, ger_datecreat
  Input #iNumFic, ger_heurecreat
  Input #iNumFic, ger_opercreat
  Input #iNumFic, ger_datemodif
  Input #iNumFic, ger_heuremodif
  Input #iNumFic, ger_opermodif
  Input #iNumFic, timestamp
End Sub
