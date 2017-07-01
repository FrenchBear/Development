VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Secteur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un secteur de la base de données"
' Classe Secteur
' Modélise un secteur de la base de données
' Gestion d'un type de données
' 21/11/00 PV

Option Explicit

' Propriétés
Public sec_numsec As Long
Public sec_origine
Public sec_etat
Public sec_numdrg
Public sec_prefixe
Public sec_nom
Public sec_rue
Public sec_loc
Public sec_cpost
Public sec_bdist
Public sec_tel
Public sec_fax
Public sec_pays
Public sec_corresp
Public sec_interloc
Public sec_blgrp
Public sec_comment
Public sec_datecreat
Public sec_heurecreat
Public sec_opercreat
Public sec_datemodif
Public sec_heuremodif
Public sec_opermodif
Public timestamp
Public sec_tsvalid
Public sec_opervalid
Public sec_optedition
Public sec_optlabo


Function Copie() As Secteur
  Dim k As New Secteur
  With k
    .sec_numsec = sec_numsec
    .sec_origine = sec_origine
    .sec_etat = sec_etat
    .sec_numdrg = sec_numdrg
    .sec_prefixe = sec_prefixe
    .sec_nom = sec_nom
    .sec_rue = sec_rue
    .sec_loc = sec_loc
    .sec_cpost = sec_cpost
    .sec_bdist = sec_bdist
    .sec_tel = sec_tel
    .sec_fax = sec_fax
    .sec_pays = sec_pays
    .sec_corresp = sec_corresp
    .sec_interloc = sec_interloc
    .sec_blgrp = sec_blgrp
    .sec_comment = sec_comment
    .sec_datecreat = sec_datecreat
    .sec_heurecreat = sec_heurecreat
    .sec_opercreat = sec_opercreat
    .sec_datemodif = sec_datemodif
    .sec_heuremodif = sec_heuremodif
    .sec_opermodif = sec_opermodif
    .timestamp = timestamp
    .sec_tsvalid = sec_tsvalid
    .sec_opervalid = sec_opervalid
    .sec_optedition = sec_optedition
    .sec_optlabo = sec_optlabo
  End With
  
  Set Copie = k
End Function

