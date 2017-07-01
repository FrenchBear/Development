VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Conclusion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise une conclusion (en français) de la table conclusion"
' Classe Conclusion
' Modélise une conclusion (en français) de la table conclusion
' 2/09/97 PV

Option Explicit

Public con_indice As Integer    ' N° du Conclusion
Public con_langue As String     ' Langue du libellé
Public con_libelle As String    ' Libellé
Public con_cprin As Integer     ' "Gravité" de la conclusion
Public con_abrege As String     '
Public con_options As String    '
Public con_etat As String       '
Public con_comment As String    ' Commentaire sur le serveur
Public con_datecreat            ' Date de création
Public con_heurecreat           ' Heure de création
Public con_opercreat            ' Code de la personne ayant créé l'info
Public con_datemodif            ' Date de dernière modification
Public con_heuremodif           ' Heure de dernière modification
Public con_opermodif            ' Code de la personne ayant modifié l'info pour la dernière fois
Public timestamp                ' timestamp de l'enregistrement

Function Copie() As Conclusion
  Dim k As New Conclusion
  With k
    .con_indice = con_indice
    .con_langue = con_langue
    .con_libelle = con_libelle
    .con_cprin = con_cprin
    .con_abrege = con_abrege
    .con_options = con_options
    .con_etat = con_etat
    .con_comment = con_comment
    .con_datecreat = con_datecreat
    .con_heurecreat = con_heurecreat
    .con_opercreat = con_opercreat
    .con_datemodif = con_datemodif
    .con_heuremodif = con_heuremodif
    .con_opermodif = con_opermodif
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "con1"
  Write #iNumFic, con_indice
  Write #iNumFic, con_langue
  Write #iNumFic, con_libelle
  Write #iNumFic, con_cprin
  Write #iNumFic, con_abrege
  Write #iNumFic, con_options
  Write #iNumFic, con_etat
  Write #iNumFic, con_comment
  Write #iNumFic, con_datecreat
  Write #iNumFic, con_heurecreat
  Write #iNumFic, con_opercreat
  Write #iNumFic, con_datemodif
  Write #iNumFic, con_heuremodif
  Write #iNumFic, con_opermodif
  Write #iNumFic, timestamp
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sClé As String
  Input #1, sClé
  If sClé <> "con1" Then
    MsgBox2i "CO100", "Conclusion.DiskRead", "con1", sClé
    Stop
  End If
  Input #iNumFic, con_indice
  Input #iNumFic, con_langue
  Input #iNumFic, con_libelle
  Input #iNumFic, con_cprin
  Input #iNumFic, con_abrege
  Input #iNumFic, con_options
  Input #iNumFic, con_etat
  Line Input #iNumFic, con_comment
  Input #iNumFic, con_datecreat
  Input #iNumFic, con_heurecreat
  Input #iNumFic, con_opercreat
  Input #iNumFic, con_datemodif
  Input #iNumFic, con_heuremodif
  Input #iNumFic, con_opermodif
  Input #iNumFic, timestamp
End Sub
