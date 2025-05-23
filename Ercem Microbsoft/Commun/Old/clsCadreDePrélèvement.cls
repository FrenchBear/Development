VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "CadreDePr�l�vement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Mod�lise un cadre de pr�l�vement (en fran�ais) de la table cadreprel"
' Classe CadreDePr�l�vement
' Mod�lise un cadre de pr�l�vement (en fran�ais) de la table cadreprel
'  2/09/97 PV
' 23/12/97 PV Line Input #iNumFic, cpr_comment  pour les commentaires avec guillemets

Option Explicit

Public cpr_indice As Integer    ' N� du CadreDePr�l�vement
Public cpr_langue As String     ' Langue du libell�
Public cpr_libelle As String    ' Libell�
Public cpr_codegr As String     ' Code G�n�rale de Restauration
Public cpr_comment As String    ' Commentaire sur le serveur
Public cpr_datecreat            ' Date de cr�ation
Public cpr_heurecreat           ' Heure de cr�ation
Public cpr_opercreat            ' Code de la personne ayant cr�� l'info
Public cpr_datemodif            ' Date de derni�re modification
Public cpr_heuremodif           ' Heure de derni�re modification
Public cpr_opermodif            ' Code de la personne ayant modifi� l'info pour la derni�re fois
Public timestamp                ' timestamp de l'enregistrement

Function Copie() As CadreDePr�l�vement
  Dim k As New CadreDePr�l�vement
  With k
    .cpr_indice = cpr_indice
    .cpr_langue = cpr_langue
    .cpr_libelle = cpr_libelle
    .cpr_codegr = cpr_codegr
    .cpr_comment = cpr_comment
    .cpr_datecreat = cpr_datecreat
    .cpr_heurecreat = cpr_heurecreat
    .cpr_opercreat = cpr_opercreat
    .cpr_datemodif = cpr_datemodif
    .cpr_heuremodif = cpr_heuremodif
    .cpr_opermodif = cpr_opermodif
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "cpr1"
  Write #iNumFic, cpr_indice
  Write #iNumFic, cpr_langue
  Write #iNumFic, cpr_libelle
  Write #iNumFic, cpr_codegr
  Write #iNumFic, cpr_comment
  Write #iNumFic, cpr_datecreat
  Write #iNumFic, cpr_heurecreat
  Write #iNumFic, cpr_opercreat
  Write #iNumFic, cpr_datemodif
  Write #iNumFic, cpr_heuremodif
  Write #iNumFic, cpr_opermodif
  Write #iNumFic, timestamp
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sCl� As String
  Input #1, sCl�
  If sCl� <> "cpr1" Then
    MsgBox "Erreur interne - CadreDePr�l�vement.DiskRead" & vbCrLf & "Cl� attendue: cpr1" & vbCrLf & "Cl� lue: " & sCl�, vbCritical, sNomApp
    Stop
  End If
  Input #iNumFic, cpr_indice
  Input #iNumFic, cpr_langue
  Input #iNumFic, cpr_libelle
  Input #iNumFic, cpr_codegr
  Line Input #iNumFic, cpr_comment
  Input #iNumFic, cpr_datecreat
  Input #iNumFic, cpr_heurecreat
  Input #iNumFic, cpr_opercreat
  Input #iNumFic, cpr_datemodif
  Input #iNumFic, cpr_heuremodif
  Input #iNumFic, cpr_opermodif
  Input #iNumFic, timestamp
End Sub
