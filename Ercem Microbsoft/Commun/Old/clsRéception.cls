VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Réception"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un enregistrement de la table reception (aspects à réception)"
' Classe Réception (aspects à réception)
' Modélise un enregistrement de la table reception (aspects à réception)
' 17/09/97 PV

Option Explicit

Public rec_indice As Integer    ' N° du Réception
Public rec_langue As String     ' Langue du libellé
Public rec_libelle As String    ' Libellé
Public rec_comment As String    ' Commentaire sur le serveur
Public rec_datecreat            ' Date de création
Public rec_heurecreat           ' Heure de création
Public rec_opercreat            ' Code de la personne ayant créé l'info
Public rec_datemodif            ' Date de dernière modification
Public rec_heuremodif           ' Heure de dernière modification
Public rec_opermodif            ' Code de la personne ayant modifié l'info pour la dernière fois
Public timestamp                ' timestamp de l'enregistrement

Function Copie() As Réception
  Dim k As New Réception
  With k
    .rec_indice = rec_indice
    .rec_langue = rec_langue
    .rec_libelle = rec_libelle
    .rec_comment = rec_comment
    .rec_datecreat = rec_datecreat
    .rec_heurecreat = rec_heurecreat
    .rec_opercreat = rec_opercreat
    .rec_datemodif = rec_datemodif
    .rec_heuremodif = rec_heuremodif
    .rec_opermodif = rec_opermodif
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "rec1"
  Write #iNumFic, rec_indice
  Write #iNumFic, rec_langue
  Write #iNumFic, rec_libelle
  Write #iNumFic, rec_comment
  Write #iNumFic, rec_datecreat
  Write #iNumFic, rec_heurecreat
  Write #iNumFic, rec_opercreat
  Write #iNumFic, rec_datemodif
  Write #iNumFic, rec_heuremodif
  Write #iNumFic, rec_opermodif
  Write #iNumFic, timestamp
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sClé As String
  Input #1, sClé
  If sClé <> "rec1" Then
    MsgBox "Erreur interne - Réception.DiskRead" & vbCrLf & "Clé attendue: rec1" & vbCrLf & "Clé lue: " & sClé, vbCritical, sNomApp
    Stop
  End If
  Input #iNumFic, rec_indice
  Input #iNumFic, rec_langue
  Input #iNumFic, rec_libelle
  Input #iNumFic, rec_comment
  Input #iNumFic, rec_datecreat
  Input #iNumFic, rec_heurecreat
  Input #iNumFic, rec_opercreat
  Input #iNumFic, rec_datemodif
  Input #iNumFic, rec_heuremodif
  Input #iNumFic, rec_opermodif
  Input #iNumFic, timestamp
End Sub
