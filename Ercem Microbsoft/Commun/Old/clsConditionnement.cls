VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Conditionnement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un conditionnement (en français) de la base de données"
' Classe Conditionnement
' Modélise un conditionnement (en français) de la base de données
' 2/09/97 PV

Option Explicit

Public cdt_indice As Integer    ' N° du conditionnement
Public cdt_langue As String     ' Langue du libellé
Public cdt_libelle As String    ' Libellé
Public cdt_comment As String    ' Commentaire sur le serveur
Public cdt_datecreat            ' Date de création
Public cdt_heurecreat           ' Heure de création
Public cdt_opercreat            ' Code de la personne ayant créé l'info
Public cdt_datemodif            ' Date de dernière modification
Public cdt_heuremodif           ' Heure de dernière modification
Public cdt_opermodif            ' Code de la personne ayant modifié l'info pour la dernière fois
Public timestamp                ' timestamp de l'enregistrement

Function Copie() As Conditionnement
  Dim k As New Conditionnement
  With k
    .cdt_indice = cdt_indice
    .cdt_langue = cdt_langue
    .cdt_libelle = cdt_libelle
    .cdt_comment = cdt_comment
    .cdt_datecreat = cdt_datecreat
    .cdt_heurecreat = cdt_heurecreat
    .cdt_opercreat = cdt_opercreat
    .cdt_datemodif = cdt_datemodif
    .cdt_heuremodif = cdt_heuremodif
    .cdt_opermodif = cdt_opermodif
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "cdt1"
  Write #iNumFic, cdt_indice
  Write #iNumFic, cdt_langue
  Write #iNumFic, cdt_libelle
  Write #iNumFic, cdt_comment
  Write #iNumFic, cdt_datecreat
  Write #iNumFic, cdt_heurecreat
  Write #iNumFic, cdt_opercreat
  Write #iNumFic, cdt_datemodif
  Write #iNumFic, cdt_heuremodif
  Write #iNumFic, cdt_opermodif
  Write #iNumFic, timestamp
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sClé As String
  Input #1, sClé
  If sClé <> "cdt1" Then
    MsgBox "Erreur interne - Conditionnement.DiskRead" & vbCrLf & "Clé attendue: cdt1" & vbCrLf & "Clé lue: " & sClé, vbCritical, sNomApp
    Stop
  End If
  Input #iNumFic, cdt_indice
  Input #iNumFic, cdt_langue
  Input #iNumFic, cdt_libelle
  Input #iNumFic, cdt_comment
  Input #iNumFic, cdt_datecreat
  Input #iNumFic, cdt_heurecreat
  Input #iNumFic, cdt_opercreat
  Input #iNumFic, cdt_datemodif
  Input #iNumFic, cdt_heuremodif
  Input #iNumFic, cdt_opermodif
  Input #iNumFic, timestamp
End Sub
