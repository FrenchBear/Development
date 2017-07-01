VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Total"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe Total
' Implante un enregsitrement de détail de fiche tournée pour le total
' de façon à traiter le total par les mêmes fonctions que le corps
' 9/3/00 PV

Option Explicit

Public etb_prefixe As String
Public etb_nom As String
Public etb_rue As String
Public etb_loc As String
Public etb_cpost As String
Public etb_bdist As String
Public etb_tel As String
Public etb_fax As String
Public etb_prest As String
Public etb_contraintes As String
Public etb_nbran As String
Public etb_nbrbs As String
Public etb_nbrch As String
Public etb_nbreh As String
Public etb_nbrfs As String
Public etb_nbrhuiles As String
Public etb_nbrlis As String
Public etb_freqan As String
Public etb_freqbs As String
Public etb_freqch As String
Public etb_freqeh As String
Public etb_freqfs As String
Public etb_freqhuiles As String
Public etb_freqlis As String
Public etb_prestan As String
Public etb_prestbs As String
Public etb_prestch As String
Public etb_presteh As String
Public etb_prestfs As String
Public etb_presthuiles As String
Public etb_prestlis As String
Public dt_fiche As String
Public dt_numetb As String
Public dt_index As String
Public dt_variocolor As String
Public dt_comment As String
Public dt_idmodif As String

Public dt_101 As String
Public dt_102 As String
Public dt_103 As String
Public dt_104 As String
Public dt_105 As String
Public dt_106 As String
Public dt_107 As String
Public dt_108 As String
Public dt_109 As String
Public dt_110 As String
Public dt_111 As String
Public dt_112 As String

Public dt_201 As String
Public dt_202 As String
Public dt_203 As String
Public dt_204 As String
Public dt_205 As String
Public dt_206 As String
Public dt_207 As String
Public dt_208 As String
Public dt_209 As String
Public dt_210 As String
Public dt_211 As String
Public dt_212 As String

Public dt_301 As String
Public dt_302 As String
Public dt_303 As String
Public dt_304 As String
Public dt_305 As String
Public dt_306 As String
Public dt_307 As String
Public dt_308 As String
Public dt_309 As String
Public dt_310 As String
Public dt_311 As String
Public dt_312 As String

Public dt_401 As String
Public dt_402 As String
Public dt_403 As String
Public dt_404 As String
Public dt_405 As String
Public dt_406 As String
Public dt_407 As String
Public dt_408 As String
Public dt_409 As String
Public dt_410 As String
Public dt_411 As String
Public dt_412 As String

Public dt_501 As String
Public dt_502 As String
Public dt_503 As String
Public dt_504 As String
Public dt_505 As String
Public dt_506 As String
Public dt_507 As String
Public dt_508 As String
Public dt_509 As String
Public dt_510 As String
Public dt_511 As String
Public dt_512 As String

Public dt_601 As String
Public dt_602 As String
Public dt_603 As String
Public dt_604 As String
Public dt_605 As String
Public dt_606 As String
Public dt_607 As String
Public dt_608 As String
Public dt_609 As String
Public dt_610 As String
Public dt_611 As String
Public dt_612 As String

Public dt_701 As String
Public dt_702 As String
Public dt_703 As String
Public dt_704 As String
Public dt_705 As String
Public dt_706 As String
Public dt_707 As String
Public dt_708 As String
Public dt_709 As String
Public dt_710 As String
Public dt_711 As String
Public dt_712 As String


' Attributs supplémentaires, déterminent combien d'établissements ont
' "quelquechose" pour un mous donné

Public dt_801 As String
Public dt_802 As String
Public dt_803 As String
Public dt_804 As String
Public dt_805 As String
Public dt_806 As String
Public dt_807 As String
Public dt_808 As String
Public dt_809 As String
Public dt_810 As String
Public dt_811 As String
Public dt_812 As String



Public Property Get Fields(sField As String) As String
Attribute Fields.VB_UserMemId = 0
  Select Case sField
    Case "etb_prefixe": Fields = etb_prefixe
    Case "etb_nom": Fields = etb_nom
    Case "etb_rue": Fields = etb_rue
    Case "etb_loc": Fields = etb_loc
    Case "etb_cpost": Fields = etb_cpost
    Case "etb_bdist": Fields = etb_bdist
    Case "etb_tel": Fields = etb_tel
    Case "etb_fax": Fields = etb_fax
    Case "etb_prest": Fields = etb_prest
    Case "etb_contraintes": Fields = etb_contraintes
    Case "etb_nbran": Fields = etb_nbran
    Case "etb_nbrbs": Fields = etb_nbrbs
    Case "etb_nbrch": Fields = etb_nbrch
    Case "etb_nbreh": Fields = etb_nbreh
    Case "etb_nbrfs": Fields = etb_nbrfs
    Case "etb_nbrhuiles": Fields = etb_nbrhuiles
    Case "etb_nbrlis": Fields = etb_nbrlis
    Case "etb_freqan": Fields = etb_freqan
    Case "etb_freqbs": Fields = etb_freqbs
    Case "etb_freqch": Fields = etb_freqch
    Case "etb_freqeh": Fields = etb_freqeh
    Case "etb_freqfs": Fields = etb_freqfs
    Case "etb_freqhuiles": Fields = etb_freqhuiles
    Case "etb_freqlis": Fields = etb_freqlis
    Case "etb_prestan": Fields = etb_prestan
    Case "etb_prestbs": Fields = etb_prestbs
    Case "etb_prestch": Fields = etb_prestch
    Case "etb_presteh": Fields = etb_presteh
    Case "etb_prestfs": Fields = etb_prestfs
    Case "etb_presthuiles": Fields = etb_presthuiles
    Case "etb_prestlis": Fields = etb_prestlis
    Case "dt_fiche": Fields = dt_fiche
    Case "dt_numetb": Fields = dt_numetb
    Case "dt_index": Fields = dt_index
    Case "dt_variocolor": Fields = dt_variocolor
    Case "dt_comment": Fields = dt_comment
    Case "dt_idmodif": Fields = dt_idmodif
    Case "dt_101": Fields = dt_101
    Case "dt_102": Fields = dt_102
    Case "dt_103": Fields = dt_103
    Case "dt_104": Fields = dt_104
    Case "dt_105": Fields = dt_105
    Case "dt_106": Fields = dt_106
    Case "dt_107": Fields = dt_107
    Case "dt_108": Fields = dt_108
    Case "dt_109": Fields = dt_109
    Case "dt_110": Fields = dt_110
    Case "dt_111": Fields = dt_111
    Case "dt_112": Fields = dt_112
    Case "dt_201": Fields = dt_201
    Case "dt_202": Fields = dt_202
    Case "dt_203": Fields = dt_203
    Case "dt_204": Fields = dt_204
    Case "dt_205": Fields = dt_205
    Case "dt_206": Fields = dt_206
    Case "dt_207": Fields = dt_207
    Case "dt_208": Fields = dt_208
    Case "dt_209": Fields = dt_209
    Case "dt_210": Fields = dt_210
    Case "dt_211": Fields = dt_211
    Case "dt_212": Fields = dt_212
    Case "dt_301": Fields = dt_301
    Case "dt_302": Fields = dt_302
    Case "dt_303": Fields = dt_303
    Case "dt_304": Fields = dt_304
    Case "dt_305": Fields = dt_305
    Case "dt_306": Fields = dt_306
    Case "dt_307": Fields = dt_307
    Case "dt_308": Fields = dt_308
    Case "dt_309": Fields = dt_309
    Case "dt_310": Fields = dt_310
    Case "dt_311": Fields = dt_311
    Case "dt_312": Fields = dt_312
    Case "dt_401": Fields = dt_401
    Case "dt_402": Fields = dt_402
    Case "dt_403": Fields = dt_403
    Case "dt_404": Fields = dt_404
    Case "dt_405": Fields = dt_405
    Case "dt_406": Fields = dt_406
    Case "dt_407": Fields = dt_407
    Case "dt_408": Fields = dt_408
    Case "dt_409": Fields = dt_409
    Case "dt_410": Fields = dt_410
    Case "dt_411": Fields = dt_411
    Case "dt_412": Fields = dt_412
    Case "dt_501": Fields = dt_501
    Case "dt_502": Fields = dt_502
    Case "dt_503": Fields = dt_503
    Case "dt_504": Fields = dt_504
    Case "dt_505": Fields = dt_505
    Case "dt_506": Fields = dt_506
    Case "dt_507": Fields = dt_507
    Case "dt_508": Fields = dt_508
    Case "dt_509": Fields = dt_509
    Case "dt_510": Fields = dt_510
    Case "dt_511": Fields = dt_511
    Case "dt_512": Fields = dt_512
    Case "dt_601": Fields = dt_601
    Case "dt_602": Fields = dt_602
    Case "dt_603": Fields = dt_603
    Case "dt_604": Fields = dt_604
    Case "dt_605": Fields = dt_605
    Case "dt_606": Fields = dt_606
    Case "dt_607": Fields = dt_607
    Case "dt_608": Fields = dt_608
    Case "dt_609": Fields = dt_609
    Case "dt_610": Fields = dt_610
    Case "dt_611": Fields = dt_611
    Case "dt_612": Fields = dt_612
    Case "dt_701": Fields = dt_701
    Case "dt_702": Fields = dt_702
    Case "dt_703": Fields = dt_703
    Case "dt_704": Fields = dt_704
    Case "dt_705": Fields = dt_705
    Case "dt_706": Fields = dt_706
    Case "dt_707": Fields = dt_707
    Case "dt_708": Fields = dt_708
    Case "dt_709": Fields = dt_709
    Case "dt_710": Fields = dt_710
    Case "dt_711": Fields = dt_711
    Case "dt_712": Fields = dt_712
    Case "dt_801": Fields = dt_801
    Case "dt_802": Fields = dt_802
    Case "dt_803": Fields = dt_803
    Case "dt_804": Fields = dt_804
    Case "dt_805": Fields = dt_805
    Case "dt_806": Fields = dt_806
    Case "dt_807": Fields = dt_807
    Case "dt_808": Fields = dt_808
    Case "dt_809": Fields = dt_809
    Case "dt_810": Fields = dt_810
    Case "dt_811": Fields = dt_811
    Case "dt_812": Fields = dt_812
    Case Else: Stop
  End Select
End Property

Public Property Let Fields(sField As String, ByVal sNewValue As String)
  Select Case sField
    Case "etb_prefixe": etb_prefixe = sNewValue
    Case "etb_nom": etb_nom = sNewValue
    Case "etb_rue": etb_rue = sNewValue
    Case "etb_loc": etb_loc = sNewValue
    Case "etb_cpost": etb_cpost = sNewValue
    Case "etb_bdist": etb_bdist = sNewValue
    Case "etb_tel": etb_tel = sNewValue
    Case "etb_fax": etb_fax = sNewValue
    Case "etb_prest": etb_prest = sNewValue
    Case "etb_contraintes": etb_contraintes = sNewValue
    Case "etb_nbran": etb_nbran = sNewValue
    Case "etb_nbrbs": etb_nbrbs = sNewValue
    Case "etb_nbrch": etb_nbrch = sNewValue
    Case "etb_nbreh": etb_nbreh = sNewValue
    Case "etb_nbrfs": etb_nbrfs = sNewValue
    Case "etb_nbrhuiles": etb_nbrhuiles = sNewValue
    Case "etb_nbrlis": etb_nbrlis = sNewValue
    Case "etb_freqan": etb_freqan = sNewValue
    Case "etb_freqbs": etb_freqbs = sNewValue
    Case "etb_freqch": etb_freqch = sNewValue
    Case "etb_freqeh": etb_freqeh = sNewValue
    Case "etb_freqfs": etb_freqfs = sNewValue
    Case "etb_freqhuiles": etb_freqhuiles = sNewValue
    Case "etb_freqlis": etb_freqlis = sNewValue
    Case "etb_prestan": etb_prestan = sNewValue
    Case "etb_prestbs": etb_prestbs = sNewValue
    Case "etb_prestch": etb_prestch = sNewValue
    Case "etb_presteh": etb_presteh = sNewValue
    Case "etb_prestfs": etb_prestfs = sNewValue
    Case "etb_presthuiles": etb_presthuiles = sNewValue
    Case "etb_prestlis": etb_prestlis = sNewValue
    Case "dt_fiche": dt_fiche = sNewValue
    Case "dt_numetb": dt_numetb = sNewValue
    Case "dt_index": dt_index = sNewValue
    Case "dt_variocolor": dt_variocolor = sNewValue
    Case "dt_comment": dt_comment = sNewValue
    Case "dt_idmodif": dt_idmodif = sNewValue
    Case "dt_101": dt_101 = sNewValue
    Case "dt_102": dt_102 = sNewValue
    Case "dt_103": dt_103 = sNewValue
    Case "dt_104": dt_104 = sNewValue
    Case "dt_105": dt_105 = sNewValue
    Case "dt_106": dt_106 = sNewValue
    Case "dt_107": dt_107 = sNewValue
    Case "dt_108": dt_108 = sNewValue
    Case "dt_109": dt_109 = sNewValue
    Case "dt_110": dt_110 = sNewValue
    Case "dt_111": dt_111 = sNewValue
    Case "dt_112": dt_112 = sNewValue
    Case "dt_201": dt_201 = sNewValue
    Case "dt_202": dt_202 = sNewValue
    Case "dt_203": dt_203 = sNewValue
    Case "dt_204": dt_204 = sNewValue
    Case "dt_205": dt_205 = sNewValue
    Case "dt_206": dt_206 = sNewValue
    Case "dt_207": dt_207 = sNewValue
    Case "dt_208": dt_208 = sNewValue
    Case "dt_209": dt_209 = sNewValue
    Case "dt_210": dt_210 = sNewValue
    Case "dt_211": dt_211 = sNewValue
    Case "dt_212": dt_212 = sNewValue
    Case "dt_301": dt_301 = sNewValue
    Case "dt_302": dt_302 = sNewValue
    Case "dt_303": dt_303 = sNewValue
    Case "dt_304": dt_304 = sNewValue
    Case "dt_305": dt_305 = sNewValue
    Case "dt_306": dt_306 = sNewValue
    Case "dt_307": dt_307 = sNewValue
    Case "dt_308": dt_308 = sNewValue
    Case "dt_309": dt_309 = sNewValue
    Case "dt_310": dt_310 = sNewValue
    Case "dt_311": dt_311 = sNewValue
    Case "dt_312": dt_312 = sNewValue
    Case "dt_401": dt_401 = sNewValue
    Case "dt_402": dt_402 = sNewValue
    Case "dt_403": dt_403 = sNewValue
    Case "dt_404": dt_404 = sNewValue
    Case "dt_405": dt_405 = sNewValue
    Case "dt_406": dt_406 = sNewValue
    Case "dt_407": dt_407 = sNewValue
    Case "dt_408": dt_408 = sNewValue
    Case "dt_409": dt_409 = sNewValue
    Case "dt_410": dt_410 = sNewValue
    Case "dt_411": dt_411 = sNewValue
    Case "dt_412": dt_412 = sNewValue
    Case "dt_501": dt_501 = sNewValue
    Case "dt_502": dt_502 = sNewValue
    Case "dt_503": dt_503 = sNewValue
    Case "dt_504": dt_504 = sNewValue
    Case "dt_505": dt_505 = sNewValue
    Case "dt_506": dt_506 = sNewValue
    Case "dt_507": dt_507 = sNewValue
    Case "dt_508": dt_508 = sNewValue
    Case "dt_509": dt_509 = sNewValue
    Case "dt_510": dt_510 = sNewValue
    Case "dt_511": dt_511 = sNewValue
    Case "dt_512": dt_512 = sNewValue
    Case "dt_601": dt_601 = sNewValue
    Case "dt_602": dt_602 = sNewValue
    Case "dt_603": dt_603 = sNewValue
    Case "dt_604": dt_604 = sNewValue
    Case "dt_605": dt_605 = sNewValue
    Case "dt_606": dt_606 = sNewValue
    Case "dt_607": dt_607 = sNewValue
    Case "dt_608": dt_608 = sNewValue
    Case "dt_609": dt_609 = sNewValue
    Case "dt_610": dt_610 = sNewValue
    Case "dt_611": dt_611 = sNewValue
    Case "dt_612": dt_612 = sNewValue
    Case "dt_701": dt_701 = sNewValue
    Case "dt_702": dt_702 = sNewValue
    Case "dt_703": dt_703 = sNewValue
    Case "dt_704": dt_704 = sNewValue
    Case "dt_705": dt_705 = sNewValue
    Case "dt_706": dt_706 = sNewValue
    Case "dt_707": dt_707 = sNewValue
    Case "dt_708": dt_708 = sNewValue
    Case "dt_709": dt_709 = sNewValue
    Case "dt_710": dt_710 = sNewValue
    Case "dt_711": dt_711 = sNewValue
    Case "dt_712": dt_712 = sNewValue
    Case "dt_801": dt_801 = sNewValue
    Case "dt_802": dt_802 = sNewValue
    Case "dt_803": dt_803 = sNewValue
    Case "dt_804": dt_804 = sNewValue
    Case "dt_805": dt_805 = sNewValue
    Case "dt_806": dt_806 = sNewValue
    Case "dt_807": dt_807 = sNewValue
    Case "dt_808": dt_808 = sNewValue
    Case "dt_809": dt_809 = sNewValue
    Case "dt_810": dt_810 = sNewValue
    Case "dt_811": dt_811 = sNewValue
    Case "dt_812": dt_812 = sNewValue
    Case Else: Stop
  End Select
End Property

Private Sub Class_Initialize()
  etb_nom = "TOTAL"
End Sub
