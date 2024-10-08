VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Libell�RA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Mod�lise un enregistrement (en fran�ais) de la table libcra"
' Classe Libell�RA
' Mod�lise un enregistrement (en fran�ais) de la table libcra
' 22/07/1998 PV
'  7/08/1998 PV Intervention op�rateur

Option Explicit

Public lcr_ressource As Integer ' N� de famille de libell�s
Public lcr_indice As Integer    ' N� du Libell�RA
Public lcr_langue As String     ' Langue du libell�
Public lcr_code As String       ' Code mn�motechnique, inutilis�
Public lcr_libelle As String    ' Libell�
Public lcr_comment As String    ' Commentaire sur le serveur
Public timestamp                ' timestamp de l'enregistrement


Public Enum eRessource              ' Divers classes de libell�s
  rSecteurPr�l�vement = 1
  rInterventionOp�rateur
  rModeConditionnement
  rNiveau�laboration
  r�tatdivision
  r�tatPhysique
  rTechnologieFabrication
  rAspectEchantillon
  rConditionsPr�l�vement
  rCadrePr�l�vement
  rLieuPr�l�vement
  rContenant
End Enum


Function Copie() As Libell�RA
  Dim k As New Libell�RA
  With k
    .lcr_ressource = lcr_ressource
    .lcr_indice = lcr_indice
    .lcr_langue = lcr_langue
    .lcr_code = lcr_code
    .lcr_libelle = lcr_libelle
    .lcr_comment = lcr_comment
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "LCR1"
  Write #iNumFic, lcr_ressource
  Write #iNumFic, lcr_indice
  Write #iNumFic, lcr_langue
  Write #iNumFic, lcr_code
  Write #iNumFic, lcr_libelle
  Write #iNumFic, lcr_comment
  Write #iNumFic, timestamp
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sCl� As String
  Input #1, sCl�
  If sCl� <> "LCR1" Then
    MsgBox2i "CO100", "Libell�RA.DiskRead", "lcr1", sCl�
    Stop
  End If
  Input #iNumFic, lcr_ressource
  Input #iNumFic, lcr_indice
  Input #iNumFic, lcr_langue
  Input #iNumFic, lcr_code
  Input #iNumFic, lcr_libelle
  Line Input #iNumFic, lcr_comment
  Input #iNumFic, timestamp
End Sub
