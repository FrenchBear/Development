VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "LieuDePr�l�vement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Mod�lise un enregistrement (en fran�ais) de la table lieuprel"
' Classe LieuDePr�l�vement
' Mod�lise un enregistrement (en fran�ais) de la table lieuprel
' 2/09/97 PV

Option Explicit

Public lip_indice As Integer    ' N� du LieuDePr�l�vement
Public lip_langue As String     ' Langue du libell�
Public lip_libelle As String    ' Libell�
Public lip_comment As String    ' Commentaire sur le serveur
Public lip_datecreat            ' Date de cr�ation
Public lip_heurecreat           ' Heure de cr�ation
Public lip_opercreat            ' Code de la personne ayant cr�� l'info
Public lip_datemodif            ' Date de derni�re modification
Public lip_heuremodif           ' Heure de derni�re modification
Public lip_opermodif            ' Code de la personne ayant modifi� l'info pour la derni�re fois
Public timestamp                ' timestamp de l'enregistrement

Function Copie() As LieuDePr�l�vement
  Dim k As New LieuDePr�l�vement
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
  Dim sCl� As String
  Input #1, sCl�
  If sCl� <> "lpr1" Then
    MsgBox "Erreur interne - LieuDePr�l�vement.DiskRead" & vbCrLf & "Cl� attendue: lpr1" & vbCrLf & "Cl� lue: " & sCl�, vbCritical, sNomApp
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
