VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "LieuDePrélèvement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un enregistrement (en français) de la table lieuprel"
' Classe LieuDePrélèvement
' Modélise un enregistrement (en français) de la table lieuprel
' 2/09/97 PV

Option Explicit

Public lip_indice As Integer    ' N° du LieuDePrélèvement
Public lip_langue As String     ' Langue du libellé
Public lip_libelle As String    ' Libellé
Public lip_comment As String    ' Commentaire sur le serveur
Public lip_datecreat            ' Date de création
Public lip_heurecreat           ' Heure de création
Public lip_opercreat            ' Code de la personne ayant créé l'info
Public lip_datemodif            ' Date de dernière modification
Public lip_heuremodif           ' Heure de dernière modification
Public lip_opermodif            ' Code de la personne ayant modifié l'info pour la dernière fois
Public timestamp                ' timestamp de l'enregistrement

Function Copie() As LieuDePrélèvement
  Dim k As New LieuDePrélèvement
  With k
    .lip_indice = lip_indice
    .lip_langue = lip_langue
    .lip_libelle = lip_libelle
    .lip_comment = lip_comment
    .lip_datecreat = lip_datecreat
    .lip_heurecreat = lip_heurecreat
    .lip_opercreat = lip_opercreat
    .lip_datemodif = lip_datemodif
    .lip_heuremodif = lip_heuremodif
    .lip_opermodif = lip_opermodif
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "lpr1"
  Write #iNumFic, lip_indice
  Write #iNumFic, lip_langue
  Write #iNumFic, lip_libelle
  Write #iNumFic, lip_comment
  Write #iNumFic, lip_datecreat
  Write #iNumFic, lip_heurecreat
  Write #iNumFic, lip_opercreat
  Write #iNumFic, lip_datemodif
  Write #iNumFic, lip_heuremodif
  Write #iNumFic, lip_opermodif
  Write #iNumFic, timestamp
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sClé As String
  Input #1, sClé
  If sClé <> "lpr1" Then
    MsgBox "Erreur interne - LieuDePrélèvement.DiskRead" & vbCrLf & "Clé attendue: lpr1" & vbCrLf & "Clé lue: " & sClé, vbCritical, sNomApp
    Stop
  End If
  Input #iNumFic, lip_indice
  Input #iNumFic, lip_langue
  Input #iNumFic, lip_libelle
  Input #iNumFic, lip_comment
  Input #iNumFic, lip_datecreat
  Input #iNumFic, lip_heurecreat
  Input #iNumFic, lip_opercreat
  Input #iNumFic, lip_datemodif
  Input #iNumFic, lip_heuremodif
  Input #iNumFic, lip_opermodif
  Input #iNumFic, timestamp
End Sub
