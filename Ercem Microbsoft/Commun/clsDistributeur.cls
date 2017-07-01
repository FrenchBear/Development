VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Distributeur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un distributeur de la base de données"
' Classe Distributeur
' Modélise un distributeur de la base de données
' 2/09/97 PV

Option Explicit

' propriétés
Public bComplet As Boolean        ' Si faux, seuls les champs dis_numdis et dis_nom sont remplis

Public dis_numdis As Long         ' Numéro de série du Distributeur
Public dis_etat As String
Public dis_origine As String
Public dis_nom As String          '  Nom du Distributeur
Public dis_comment
Public dis_datecreat
Public dis_heurecreat
Public dis_opercreat
Public dis_datemodif
Public dis_heuremodif
Public dis_opermodif
Public timestamp
Public dis_tsvalid
Public dis_opervalid


Function Copie() As Distributeur
  Dim k As New Distributeur
  With k
    .dis_numdis = dis_numdis
    .dis_etat = dis_etat
    .dis_origine = dis_origine
    .dis_nom = dis_nom
    .dis_comment = dis_comment
    .dis_datecreat = dis_datecreat
    .dis_heurecreat = dis_heurecreat
    .dis_opercreat = dis_opercreat
    .dis_datemodif = dis_datemodif
    .dis_heuremodif = dis_heuremodif
    .dis_opermodif = dis_opermodif
    .timestamp = timestamp
    .dis_tsvalid = dis_tsvalid
    .dis_opervalid = dis_opervalid
  End With
  Set Copie = k
End Function

