VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Produit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gère les produits"
' Classe produit
' Gère les produits
' 2/09/97 PV

Option Explicit

' Propriétés
Public bComplet As Boolean    ' Si faux, seuls les champs pro_numpro, pro_nom et pro_critere sont remplis

Public pro_numpro As Long         ' Numéro de série du produit
Public pro_etat
Public pro_nom As String          '  Nom du produit
Public pro_critere As String
Public pro_comment
Public pro_datecreat
Public pro_heurecreat
Public pro_opercreat
Public pro_datemodif
Public pro_heuremodif
Public pro_opermodif
Public pro_t1 As Integer
Public pro_t2 As Integer
Public pro_t3 As Integer
Public pro_t4 As Integer
Public pro_t5 As Integer
Public timestamp
Public pro_tsvalid
Public pro_opervalid


Function Copie() As Produit
  Dim k As New Produit
  With k
    .pro_numpro = pro_numpro
    .pro_etat = pro_etat
    .pro_nom = pro_nom
    .pro_critere = pro_critere
    .pro_comment = pro_comment
    .pro_datecreat = pro_datecreat
    .pro_heurecreat = pro_heurecreat
    .pro_opercreat = pro_opercreat
    .pro_datemodif = pro_datemodif
    .pro_heuremodif = pro_heuremodif
    .pro_opermodif = pro_opermodif
    .pro_t1 = pro_t1
    .pro_t2 = pro_t2
    .pro_t3 = pro_t3
    .pro_t4 = pro_t4
    .pro_t5 = pro_t5
    .timestamp = timestamp
    .pro_tsvalid = pro_tsvalid
    .pro_opervalid = pro_opervalid
  End With
  Set Copie = k
End Function

