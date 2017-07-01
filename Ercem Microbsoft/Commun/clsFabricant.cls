VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Fabricant"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un fabricant de la base de données"
' Classe Fabricant
' Modélise un fabricant de la base de données
' Gère les fabricants
' 2/09/97 PV

Option Explicit

' propriétés
Public bComplet As Boolean        ' Si faux, seuls les champs fab_numfab et fab_nom sont remplis

Public fab_numfab As Long         ' Numéro de série du Fabricant
Public fab_etat As String
Public fab_origine As String
Public fab_nom As String          '  Nom du Fabricant
Public fab_comment
Public fab_datecreat
Public fab_heurecreat
Public fab_opercreat
Public fab_datemodif
Public fab_heuremodif
Public fab_opermodif
Public timestamp
Public fab_tsvalid
Public fab_opervalid


Function Copie() As Fabricant
  Dim k As New Fabricant
  With k
    .fab_numfab = fab_numfab
    .fab_etat = fab_etat
    .fab_origine = fab_origine
    .fab_nom = fab_nom
    .fab_comment = fab_comment
    .fab_datecreat = fab_datecreat
    .fab_heurecreat = fab_heurecreat
    .fab_opercreat = fab_opercreat
    .fab_datemodif = fab_datemodif
    .fab_heuremodif = fab_heuremodif
    .fab_opermodif = fab_opermodif
    .timestamp = timestamp
    .fab_tsvalid = fab_tsvalid
    .fab_opervalid = fab_opervalid
  End With
  Set Copie = k
End Function

