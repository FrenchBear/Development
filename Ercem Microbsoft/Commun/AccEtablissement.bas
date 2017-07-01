Attribute VB_Name = "AccEtablissement"
Attribute VB_Description = "Fonctions d'accès aux établissements, gestion d'un cache mémoire"
' Fonctions d'accès aux établissements
' Gestion d'un cache en mémoire
' 10/11/96 PV
'  2/02/98 PV Fonction sNomEtablissement, pratique
' 25/11/98 PV LETB2 / champs etb_nbrxxx
' 19/10/99 PV etb_numetb char(6)
'  8/09/00 PV etb_ape --> etb_tarif
' 29/09/00 PV LETB5: +etb_durehn, etbtypeeh, etb_contraintes, etb_fdr, etb_niveauinterv, etb_labo, etb_avispassage
'  1/10/00 PV LETB5: +etb_decoupage, etb_facncp, etb_facndp
' 31/10/00 PV LETB6: +etb_fpstandard

Option Explicit

' Cache
Private cache As New Collection

' Statistiques
Public getb_iNbLire As Integer
Public getb_iNbLireDuCache As Integer

Function getb_iCacheCount() As Integer
  getb_iCacheCount = cache.count
End Function


Public Function sNomEtablissement(ByRef sNumetb As String)
  Dim e As Etablissement
  If sNumetb = "0" Then
    Set e = New Etablissement
    e.etb_prefixe = "AC"
    e.etb_nom = sGetIntlLib("CRtxtEtb", "ÉTABLISSEMENT EN COURS DE CRÉATION")
  Else
    Set e = LireEtablissement(sNumetb, False)
  End If
  If Not e Is Nothing Then
    sNomEtablissement = e.etb_prefixe & " " & e.etb_nom
  Else
    sNomEtablissement = sGetIntlLib("CRtxtEtbInc", "??? ÉTABLISSEMENT INCONNU")
  End If
End Function


' Lit complètement un établissement
' Retourne Nothing si etb inxistant
Public Function LireEtablissement(ByRef sNumetb As String, bComplet As Boolean) As Etablissement
  getb_iNbLire = getb_iNbLire + 1
  
  ' On cherche d'abord dans le cache
  Dim ec As Etablissement
  On Error Resume Next
  Set ec = cache("E" & sNumetb)
  If Err = 0 Then                       ' On l'a trouvé dans le cache !
    If ec.bComplet Or Not bComplet Then
      Set LireEtablissement = ec
      getb_iNbLireDuCache = getb_iNbLireDuCache + 1
      Exit Function                     ' Et c'est fini pour LireEtablissement
    End If
  End If
  
  ' Pas trouvé dans le cache, on demande au démon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    br.AddField sNumetb
    tcps.Envoie "LETB6 " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If sLigne = "->" Then
      Relâcher
      Set LireEtablissement = Nothing
      Exit Function
    End If
    
    Dim et As New Etablissement
    Dim v As Variant
    br.Buffer = sLigne
    
    br.GetField v: et.etb_numetb = v
    br.GetField v: et.etb_origine = v
    br.GetField v: et.etb_etat = v
    br.GetField v: et.etb_numsec = v
    br.GetField v: et.etb_prefixe = v
    br.GetField v: et.etb_nom = v
    br.GetField v: et.etb_rue = v
    br.GetField v: et.etb_loc = v
    br.GetField v: et.etb_cpost = v
    br.GetField v: et.etb_bdist = v
    br.GetField v: et.etb_tel = v
    br.GetField v: et.etb_fax = v
    br.GetField v: et.etb_pays = v
    br.GetField v: et.etb_tarif = v
    br.GetField v: et.etb_rdia = v
    br.GetField v: et.etb_rayon = v
    br.GetField v: et.etb_prix0 = v
    br.GetField v: et.etb_prix1 = v
    br.GetField v: et.etb_prix2 = v
    br.GetField v: et.etb_prix3 = v
    br.GetField v: et.etb_prix4 = v
    br.GetField v: et.etb_prix5 = v
    br.GetField v: et.etb_code = v
    br.GetField v: et.etb_infocli = v
    br.GetField v: et.etb_refcom = v
    br.GetField v: et.etb_corresp = v
    br.GetField v: et.etb_numprest = v
    br.GetField v: et.etb_prest = v
    br.GetField v: et.etb_typeh1 = v
    br.GetField v: et.etb_sceeh1 = v
    br.GetField v: et.etb_langeh1 = v
    br.GetField v: et.etb_dureh1 = v
    br.GetField v: et.etb_typeh2 = v
    br.GetField v: et.etb_sceeh2 = v
    br.GetField v: et.etb_langeh2 = v
    br.GetField v: et.etb_dureh2 = v
    br.GetField v: et.etb_typeh3 = v
    br.GetField v: et.etb_sceeh3 = v
    br.GetField v: et.etb_langeh3 = v
    br.GetField v: et.etb_dureh3 = v
    br.GetField v: et.etb_typeh4 = v
    br.GetField v: et.etb_sceeh4 = v
    br.GetField v: et.etb_langeh4 = v
    br.GetField v: et.etb_dureh4 = v
    br.GetField v: et.etb_gestrict = v
    br.GetField v: et.etb_typeeh = v
    br.GetField v: et.etb_fact = v
    br.GetField v: et.etb_tva = v
    br.GetField v: et.etb_blprix = v
    br.GetField v: et.etb_nbran = v
    br.GetField v: et.etb_nbrbs = v
    br.GetField v: et.etb_nbrhuiles = v
    br.GetField v: et.etb_nbrlis = v
    br.GetField v: et.etb_nbrfs = v
    br.GetField v: et.etb_nbrch = v
    br.GetField v: et.etb_nbreh = v
    br.GetField v: et.etb_exempetb = v
    br.GetField v: et.etb_compta1 = v
    br.GetField v: et.etb_compta2 = v
    br.GetField v: et.etb_proprio = v
    br.GetField v: et.etb_comment = v
    br.GetField v: et.etb_etatfc = v
    br.GetField v: et.etb_numgrf = v
    br.GetField v: et.etb_libelles1 = v
    br.GetField v: et.etb_prixs1 = v
    br.GetField v: et.etb_libelles2 = v
    br.GetField v: et.etb_prixs2 = v
    br.GetField v: et.etb_libelles3 = v
    br.GetField v: et.etb_prixs3 = v
    br.GetField v: et.etb_libelles4 = v
    br.GetField v: et.etb_prixs4 = v
    br.GetField v: et.etb_libelles5 = v
    br.GetField v: et.etb_prixs5 = v
    br.GetField v: et.etb_libelles6 = v
    br.GetField v: et.etb_prixs6 = v
    br.GetField v: et.etb_datetarif = v
    br.GetField v: et.etb_unite = v
    br.GetField v: et.etb_edlangue = v
    br.GetField v: et.etb_codetva = v
    br.GetField v: et.etb_commentfc = v
    br.GetField v: et.etb_altadr = v
    br.GetField v: et.etb_altnom = v
    br.GetField v: et.etb_altrue = v
    br.GetField v: et.etb_altloc = v
    br.GetField v: et.etb_altcpost = v
    br.GetField v: et.etb_altbdist = v
    br.GetField v: et.etb_datecreat = v
    br.GetField v: et.etb_heurecreat = v
    br.GetField v: et.etb_opercreat = v
    br.GetField v: et.etb_datemodif = v
    br.GetField v: et.etb_heuremodif = v
    br.GetField v: et.etb_opermodif = v
    br.GetField v: et.timestamp = v
    br.GetField v: et.etb_tsvalid = v
    br.GetField v: et.etb_opervalid = v
    br.GetField v: et.etb_optedition = v
    br.GetField v: et.etb_optlabo = v
    br.GetField v: et.etb_contraintes = v
    br.GetField v: et.etb_fdr = v
    br.GetField v: et.etb_niveauinterv = v
    br.GetField v: et.etb_labo = v
    br.GetField v: et.etb_avispassage = v
    br.GetField v: et.etb_decoupage = v
    br.GetField v: et.etb_facncp = v
    br.GetField v: et.etb_facndp = v
    br.GetField v: et.etb_fpstandard = v

    et.bComplet = True
    
    ' On élimine du cache la version simple
    On Error Resume Next
    cache.Remove "E" & et.etb_numetb
    On Error GoTo 0
    
    ' On ajoute l'établissement dans le cache
    cache.Add et.Copie, "E" & et.etb_numetb
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If sLigne <> "->" Then MsgBox "STOP.9": Stop
  Relâcher
  
  Set LireEtablissement = et
End Function


Function RechercheEtablissement(ByVal sMotifPréfixe As String, ByVal sMotifNom As String) As Collection
  If sMotifPréfixe = "" Then
    MsgBox2i "CO005b"
    Set RechercheEtablissement = Nothing
    Exit Function
  End If
  
  ' On élimine les $ du motif pour éviter de perturber le protocole
  sMotifPréfixe = Subst(sMotifPréfixe, "$", "")
  sMotifNom = Subst(sMotifNom, "$", "")
  
  Dim sReq As String
  sReq = "etb_prefixe$" & UCase(sMotifPréfixe) & "*"
  If sMotifNom <> "" Then sReq = sReq & "$etb_nom$*" & UCase(sMotifNom) & "*"
  
  Bloquer
    Dim br As New Rev
    br.AddField sReq
    tcps.Envoie "RETB4 " & br.Buffer
    
    Dim sLigne As String
    Dim sSerial As String, sPrefixe As String, sNom As String, sCPost As String, sVille As String, sProprio As String
    Dim NbrAn, NbrBS, NbrHuiles, NbrLis, NbrFS, NbrCh, NbrEH
    Dim c As New Collection
    Dim eNew As New Etablissement
    Do
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sSerial
      br.GetField sPrefixe
      br.GetField sNom
      br.GetField sCPost
      br.GetField sVille
      br.GetField NbrAn
      br.GetField NbrBS
      br.GetField NbrHuiles
      br.GetField NbrLis
      br.GetField NbrFS
      br.GetField NbrCh
      br.GetField NbrEH
      br.GetField sProprio
      
      With eNew
        .bComplet = False
        .etb_numetb = sSerial
        .etb_prefixe = sPrefixe
        .etb_nom = sNom
        .etb_cpost = sCPost
        .etb_bdist = sVille
        .etb_nbran = NbrAn
        .etb_nbrbs = NbrBS
        .etb_nbrhuiles = NbrHuiles
        .etb_nbrlis = NbrLis
        .etb_nbrfs = NbrFS
        .etb_nbrch = NbrCh
        .etb_nbreh = NbrEH
        .etb_proprio = sProprio
      End With
      
      Dim k As Etablissement
      Set k = eNew.Copie
  
      ' Au cas où l'établissement n'est pas dans le cache on l'ajoute
      Dim ec As Etablissement
      On Error Resume Next
      Set ec = cache("E" & sSerial)
      If Err Then cache.Add k, "E" & sSerial
      On Error GoTo 0
      
      ' On l'ajoute à la collection de recherche
      c.Add k, "E" & sSerial
    Loop
  Relâcher
  
  Set RechercheEtablissement = c
End Function


Sub EffaceCacheEtablissements()
  Dim i As Integer
  For i = 1 To cache.count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeEtablissements(lv As ListView)
  Dim itmX As ListItem

  lv.ListItems.Clear
  lv.ColumnHeaders(1).Text = sGetIntlLib("REchNo", "N°")
  lv.ColumnHeaders(2).Text = sGetIntlLib("REchPréfixe", "Préfixe")
  lv.ColumnHeaders(3).Text = sGetIntlLib("REchEtb", "Etablissement")
  lv.ColumnHeaders(4).Text = " "

  Dim e As Etablissement
  For Each e In cache
    Set itmX = lv.ListItems.Add()
    itmX.Text = e.etb_numetb
    itmX.SubItems(1) = e.etb_prefixe
    itmX.SubItems(2) = e.etb_nom
    itmX.SubItems(3) = ""
  Next
End Sub

