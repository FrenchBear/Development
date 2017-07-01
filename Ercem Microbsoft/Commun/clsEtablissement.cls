VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Etablissement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un établissement de la base de données"
' Classe Etablissement
' Modélise un établissement de la base de données
' Gestion d'un type de données
'  3/11/96 PV
' 25/11/98 PV LETB2 / champs etb_nbrxxx
' 19/10/99 PV etb_numetb string
'  8/09/00 PV etb_ape --> etb_tarif
' 29/09/00 PV +etb_durehn, etb_typeeh, etb_contraintes, etb_fdr, etb_niveauinterv, etb_labo, etb_avispassage
'  1/10/00 PV +etb_decoupage, etb_facndp, etb_facncp
' 31/10/00 PV +etb_fpstandard

Option Explicit

' Propriétés
Public bComplet As Boolean    ' Si faux, seuls les champs etb_numetb, etb_prefixe et etb_nom sont remplis

Public etb_numetb As String
Public etb_origine
Public etb_etat
Public etb_numsec
Public etb_prefixe
Public etb_nom
Public etb_rue
Public etb_loc
Public etb_cpost
Public etb_bdist
Public etb_tel
Public etb_fax
Public etb_pays
Public etb_tarif
Public etb_rdia
Public etb_rayon
Public etb_prix0
Public etb_prix1
Public etb_prix2
Public etb_prix3
Public etb_prix4
Public etb_prix5
Public etb_code
Public etb_infocli
Public etb_refcom
Public etb_corresp
Public etb_numprest
Public etb_prest
Public etb_typeh1
Public etb_sceeh1
Public etb_langeh1
Public etb_dureh1
Public etb_typeh2
Public etb_sceeh2
Public etb_langeh2
Public etb_dureh2
Public etb_typeh3
Public etb_sceeh3
Public etb_langeh3
Public etb_dureh3
Public etb_typeh4
Public etb_sceeh4
Public etb_langeh4
Public etb_dureh4
Public etb_gestrict
Public etb_typeeh
Public etb_fact
Public etb_tva
Public etb_blprix
Public etb_nbran
Public etb_nbrbs
Public etb_nbrhuiles
Public etb_nbrlis
Public etb_nbrfs
Public etb_nbrch
Public etb_nbreh
Public etb_exempetb
Public etb_compta1
Public etb_compta2
Public etb_proprio
Public etb_comment
Public etb_etatfc
Public etb_numgrf
Public etb_libelles1
Public etb_prixs1
Public etb_libelles2
Public etb_prixs2
Public etb_libelles3
Public etb_prixs3
Public etb_libelles4
Public etb_prixs4
Public etb_libelles5
Public etb_prixs5
Public etb_libelles6
Public etb_prixs6
Public etb_datetarif
Public etb_unite
Public etb_edlangue
Public etb_codetva
Public etb_commentfc
Public etb_altadr
Public etb_altnom
Public etb_altrue
Public etb_altloc
Public etb_altcpost
Public etb_altbdist
Public etb_datecreat
Public etb_heurecreat
Public etb_opercreat
Public etb_datemodif
Public etb_heuremodif
Public etb_opermodif
Public timestamp
Public etb_tsvalid
Public etb_opervalid
Public etb_optedition
Public etb_optlabo
Public etb_contraintes
Public etb_fdr
Public etb_niveauinterv
Public etb_labo
Public etb_avispassage
Public etb_decoupage
Public etb_facndp
Public etb_facncp
Public etb_fpstandard


Public Property Get etb_labo_ajusté() As String
  Dim s As String
  s = etb_labo
  If s = "C" And cSystèmeCA = "T" Then s = "T"
  etb_labo_ajusté = s
End Property


Function Copie() As Etablissement
  Dim k As New Etablissement
  With k
    .bComplet = bComplet
    .etb_numetb = etb_numetb
    .etb_prefixe = etb_prefixe
    .etb_nom = etb_nom
    .etb_cpost = etb_cpost
    .etb_bdist = etb_bdist
    .etb_nbran = etb_nbran
    .etb_nbrbs = etb_nbrbs
    .etb_nbrhuiles = etb_nbrhuiles
    .etb_nbrlis = etb_nbrlis
    .etb_nbrfs = etb_nbrfs
    .etb_nbrch = etb_nbrch
    .etb_nbreh = etb_nbreh
    .etb_proprio = etb_proprio
  End With
  If Not bComplet Then
    Set Copie = k
    Exit Function
  End If
    
  With k
    .etb_origine = etb_origine
    .etb_etat = etb_etat
    .etb_numsec = etb_numsec
    .etb_rue = etb_rue
    .etb_loc = etb_loc
    .etb_tel = etb_tel
    .etb_fax = etb_fax
    .etb_pays = etb_pays
    .etb_tarif = etb_tarif
    .etb_rdia = etb_rdia
    .etb_rayon = etb_rayon
    .etb_prix0 = etb_prix0
    .etb_prix1 = etb_prix1
    .etb_prix2 = etb_prix2
    .etb_prix3 = etb_prix3
    .etb_prix4 = etb_prix4
    .etb_prix5 = etb_prix5
    .etb_code = etb_code
    .etb_infocli = etb_infocli
    .etb_refcom = etb_refcom
    .etb_corresp = etb_corresp
    .etb_numprest = etb_numprest
    .etb_prest = etb_prest
    .etb_typeh1 = etb_typeh1
    .etb_sceeh1 = etb_sceeh1
    .etb_langeh1 = etb_langeh1
    .etb_dureh1 = etb_dureh1
    .etb_typeh2 = etb_typeh2
    .etb_sceeh2 = etb_sceeh2
    .etb_langeh2 = etb_langeh2
    .etb_dureh2 = etb_dureh2
    .etb_typeh3 = etb_typeh3
    .etb_sceeh3 = etb_sceeh3
    .etb_langeh3 = etb_langeh3
    .etb_dureh3 = etb_dureh3
    .etb_typeh4 = etb_typeh4
    .etb_sceeh4 = etb_sceeh4
    .etb_langeh4 = etb_langeh4
    .etb_dureh4 = etb_dureh4
    .etb_gestrict = etb_gestrict
    .etb_typeeh = etb_typeeh
    .etb_fact = etb_fact
    .etb_tva = etb_tva
    .etb_blprix = etb_blprix
    .etb_exempetb = etb_exempetb
    .etb_compta1 = etb_compta1
    .etb_compta2 = etb_compta2
    .etb_comment = etb_comment
    .etb_etatfc = etb_etatfc
    .etb_numgrf = etb_numgrf
    .etb_libelles1 = etb_libelles1
    .etb_prixs1 = etb_prixs1
    .etb_libelles2 = etb_libelles2
    .etb_prixs2 = etb_prixs2
    .etb_libelles3 = etb_libelles3
    .etb_prixs3 = etb_prixs3
    .etb_libelles4 = etb_libelles4
    .etb_prixs4 = etb_prixs4
    .etb_libelles5 = etb_libelles5
    .etb_prixs5 = etb_prixs5
    .etb_libelles6 = etb_libelles6
    .etb_prixs6 = etb_prixs6
    .etb_datetarif = etb_datetarif
    .etb_unite = etb_unite
    .etb_edlangue = etb_edlangue
    .etb_codetva = etb_codetva
    .etb_commentfc = etb_commentfc
    .etb_altadr = etb_altadr
    .etb_altnom = etb_altnom
    .etb_altrue = etb_altrue
    .etb_altloc = etb_altloc
    .etb_altcpost = etb_altcpost
    .etb_altbdist = etb_altbdist
    .etb_datecreat = etb_datecreat
    .etb_heurecreat = etb_heurecreat
    .etb_opercreat = etb_opercreat
    .etb_datemodif = etb_datemodif
    .etb_heuremodif = etb_heuremodif
    .etb_opermodif = etb_opermodif
    .timestamp = timestamp
    .etb_tsvalid = etb_tsvalid
    .etb_opervalid = etb_opervalid
    .etb_optedition = etb_optedition
    .etb_optlabo = etb_optlabo
    .etb_contraintes = etb_contraintes
    .etb_fdr = etb_fdr
    .etb_niveauinterv = etb_niveauinterv
    .etb_labo = etb_labo
    .etb_avispassage = etb_avispassage
    .etb_decoupage = etb_decoupage
    .etb_facncp = etb_facncp
    .etb_facndp = etb_facndp
    .etb_fpstandard = etb_fpstandard
  End With
  Set Copie = k
End Function

