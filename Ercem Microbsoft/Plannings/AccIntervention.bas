Attribute VB_Name = "AccIntervention"
Attribute VB_Description = "Fonctions d'accès aux plannings"
' Fonctions d'accès aux interventions
' 14/11/1996 PV
' 20/01/1997 PV pla_systeme
' 10/04/1998 PV Heure arrivée+départ, type prestation, code activité, code client
' 13/04/1998 PV Planning --> Intervention
'  3/06/1998 PV etb_proprio
' 18/03/1999 PV pla_dateorigine; LPL3/EPL3
' 24/10/1999 PV LPL4/EPL4: N°etb string
' 10/03/2000 PV LPL5/EPL5: Gestion du nombre d'huiles
' 27/03/2000 PV LPL6/EPL6: N° d'EH et durée
' 28/03/2000 PV LPL7/EPL7: N°EH alphanum; secrétariat+labo
' 21/09/2000 PV LPL8/EPL8: Infos de validation à l'intervention
' 30/09/2000 PV LPL9/EPL9: Avis de passage
'  1/10/2000 PV LPL9: +pla_decoupage, pla_facncp, pla_facndp, pla_fact
' 16/10/2000 PV LPL10: +pla_tretatdocmin, pla_tretatdocmax, pla_tretatfac
' 29/10/2000 PV +pla_fpstandard, +pla_refcom (pas encore reçu de msd)
' 31/10/2000 PV LPL11/EPL11: deux champs précédents en plus
' 27/11/2000 PV LPL12/EPL12: +pla_etatlabo, +pla_etatfac, +pla_labxx
' 20/01/2001 PV Gestion d'une date d'expiration des données dans le cache
'  6/08/2001 PV LPL13: +pla_tabech; dans le proto, -pla_etatlabo, -pla_fact, -pla_facncp, -pla_facndp



Option Explicit

' Cache
Private cache As New Collection


' Statistiques
Public gint_iNbLire As Integer
Public gint_iNbLireDuCache As Integer
Public gint_iCacheCount As Integer


' Lit complètement un planning
Public Function LireIntervention(ByVal cSysPlan As String, ByVal iSerPlan As Long) As Intervention
  gint_iNbLire = gint_iNbLire + 1
  
  ' On cherche d'abord dans le cache
  Dim pc As Intervention
  On Error Resume Next
  Set pc = cache("P" & cSysPlan & iSerPlan)
  If Err = 0 Then
    ' On utilise que si les infos n'ont pas expiré
    If Not pc.bDonnéesExpirées Then
      Set LireIntervention = pc
      gint_iNbLireDuCache = gint_iNbLireDuCache + 1
      Exit Function
    Else
      cache.Remove "P" & cSysPlan & iSerPlan
    End If
  End If
  
  On Error GoTo 0
  
  Dim br As New Rev
  br.Clear
  br.AddField cSysPlan
  br.AddField iSerPlan
  
  Bloquer
    tcps.Envoie "LPL13 " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then
      Set LireIntervention = Nothing
      Relâcher
      Exit Function
    End If
    
    Dim pl As New Intervention
    br.Buffer = sLigne
    
    ' Champs non présents dans la verion locale du planning
    Dim timestamp
    
    Dim v As Variant
    br.GetField v: pl.pla_systeme = v
    br.GetField v: pl.pla_serie = v
    br.GetField v: pl.pla_iref = v
    br.GetField v: pl.pla_lettres = v
    br.GetField v: pl.pla_dateplan = v
    br.GetField v: pl.pla_pers = v
    br.GetField v: pl.pla_unite = v
    br.GetField v: pl.pla_etb = v
    br.GetField v: pl.pla_comment = v
    br.GetField v: pl.pla_nbab = v
    br.GetField v: pl.pla_nbeh = v
    br.GetField v: pl.pla_nbbs = v
    br.GetField v: pl.pla_nbli = v
    br.GetField v: pl.pla_nbfs = v
    br.GetField v: pl.pla_nbhu = v
    br.GetField v: pl.pla_nbch = v
    br.GetField v: timestamp = v
    br.GetField v: pl.pla_operbl = v
    br.GetField v: pl.pla_tsbl = v
    br.GetField v: pl.pla_operfp = v
    br.GetField v: pl.pla_tsfp = v
    br.GetField v: pl.pla_harrivee = v
    br.GetField v: pl.pla_hdepart = v
    br.GetField v: pl.pla_typeprest = v
    br.GetField v: pl.pla_activite = v
    br.GetField v: pl.pla_client = v
    br.GetField v: pl.pla_dateorigine = v
    br.GetField v: pl.pla_numeh = v
    br.GetField v: pl.pla_dureh = v
    br.GetField v: pl.pla_secret = v
    br.GetField v: pl.pla_labo = v
    br.GetField v: pl.pla_opervalid = v
    br.GetField v: pl.pla_datevalid = v
    br.GetField v: pl.pla_avispassage = v
    br.GetField v: pl.pla_decoupage = v
    br.GetField v: pl.pla_tretatdocmin = v
    br.GetField v: pl.pla_tretatdocmax = v
    br.GetField v: pl.pla_tretatfac = v
    br.GetField v: pl.pla_fpstandard = v
    br.GetField v: pl.pla_refcom = v
    br.GetField v: pl.pla_etatfac = v
    br.GetField v: pl.pla_labab = v
    br.GetField v: pl.pla_labbs = v
    br.GetField v: pl.pla_labli = v
    br.GetField v: pl.pla_labfs = v
    br.GetField v: pl.pla_labhu = v
    br.GetField v: pl.pla_labch = v
    br.GetField v: pl.pla_tabech = v

    ' Contrôle. Anticipé, puisqu'on fait appel à une autre fonction juste après
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then MsgBox "STOP.10": Stop
  Relâcher
  
  ' On récupère le nom de l'établissement
  Dim Etb As Etablissement
  Set Etb = LireEtablissement(pl.pla_etb, False)
  If Etb Is Nothing Then
    pl.etb_prefixe = "??"
    pl.etb_nom = sprintf(sGetIntlLib("AItxtEtb", "Établissement %1 inconnu !"), pl.pla_etb)
  Else
    pl.etb_prefixe = Etb.etb_prefixe
    pl.etb_nom = Etb.etb_nom
    pl.etb_proprio = Etb.etb_proprio
  End If
  
  ' On ajoute le planning dans le cache
  AjouteCachePlanning pl
  
  Set LireIntervention = pl
End Function


Public Function EcritPlanning(p As Intervention) As Long
  Dim br As New Rev
  br.AddField p.pla_systeme
  br.AddField p.pla_serie
  br.AddField p.pla_iref
  br.AddField p.pla_lettres
  br.AddField p.pla_dateplan
  br.AddField p.pla_pers
  br.AddField p.pla_unite
  br.AddField p.pla_etb
  br.AddField p.pla_comment
  br.AddField p.pla_nbab
  br.AddField p.pla_nbeh
  br.AddField p.pla_nbbs
  br.AddField p.pla_nbli
  br.AddField p.pla_nbfs
  br.AddField p.pla_nbhu
  br.AddField p.pla_nbch
  br.AddField p.pla_operbl
  br.AddField p.pla_tsbl
  br.AddField p.pla_operfp
  br.AddField p.pla_tsfp
  br.AddField p.pla_harrivee
  br.AddField p.pla_hdepart
  br.AddField p.pla_typeprest
  br.AddField p.pla_activite
  br.AddField p.pla_client
  br.AddField p.pla_dateorigine
  br.AddField p.pla_numeh
  br.AddField p.pla_dureh
  br.AddField p.pla_secret
  br.AddField p.pla_labo
  br.AddField p.pla_opervalid
  br.AddField p.pla_datevalid
  br.AddField p.pla_avispassage
  br.AddField p.pla_decoupage
  br.AddField ""  ' p.pla_facncp
  br.AddField ""  ' p.pla_facndp
  br.AddField ""  ' p.pla_fact
  br.AddField p.pla_fpstandard
  br.AddField p.pla_refcom
  br.AddField ""  ' p.pla_etatlabo
  br.AddField p.pla_etatfac

  RetireCachePlanning p
  Bloquer
    ' On envoie l'ordre d'écriture à msd
    tcps.Envoie "EPL12 " & br.Buffer
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then Exit Function
    
    ' On reçoit en retour le numéro de série du planning
    Dim iSerie As Long
    br.Buffer = sLigne
    br.GetField iSerie
    p.pla_serie = iSerie
    
    AttendSynchro
  Relâcher
  AjouteCachePlanning p
  
  EcritPlanning = iSerie
End Function


Public Function RecherchePlanning(dDate As Date, sLettres As String) As Collection
  Dim p As Intervention
  Dim iRang As Integer
  Dim colSerial As New Collection
  Dim colPlannings As New Collection
  
  AssertOkDate dDate
  AssertOkLettres sLettres
  
  Dim sReq As String
  sReq = "pla_dateplan$" & sNormaliseQuery(dDate, "d") & "$pla_lettres$" & sLettres
  Dim br As New Rev
  br.AddField sReq
  br.AddField 0
  Bloquer
    tcps.Envoie "RPL2 " & br.Buffer
  
    Dim sLigne As String
    Dim cSystème As String
    Dim iSerial As Long
    Do
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do
      
      br.Buffer = sLigne
      br.GetField cSystème
      br.GetField iSerial
      If iSerial <> 0 Then colSerial.Add cSystème & iSerial
    Loop
  Relâcher

  If colSerial.count > 0 Then
    frmBase.AfficheBarreProgression 0, colSerial.count, 0
    iRang = 0
    Dim vSerial
    For Each vSerial In colSerial
      iRang = iRang + 1
      frmPlanning.pbProgress.Value = iRang
      Set p = LireIntervention(Left(vSerial, 1), CLng(Mid(vSerial, 2)))
      colPlannings.Add p
    Next
    frmPlanning.pbProgress.Visible = False
  End If
  
  Set RecherchePlanning = colPlannings
End Function

' Ajoute un planning au cache, mais avec iref toujours positif
Public Sub AjouteCachePlanning(p As Intervention)
  Dim q As Intervention
  Set q = p.Copie
  If q.pla_iref < 0 Then q.pla_iref = -q.pla_iref
  cache.Add q, "P" & p.pla_systeme & p.pla_serie
End Sub

Public Sub RetireCachePlanning(p As Intervention)
  ' On ne peut pas retirer du cache les plannings créée dans Microb'Soft
  On Error Resume Next
  If p.pla_serie <> 0 Then cache.Remove "P" & p.pla_systeme & p.pla_serie
End Sub

Public Sub RetireCachePlanning1JourSansRef(dDate As Date, sLettres As String)
  AssertOkDate dDate
  AssertOkLettres sLettres
  
  Dim p As Intervention
  For Each p In cache
    If p.pla_dateplan = dDate And p.pla_lettres = sLettres And p.pla_serie <> 0 Then
      cache.Remove "P" & p.pla_systeme & p.pla_serie
    End If
  Next
End Sub

Sub EffaceCachePlanning()
  Dim i As Integer
  For i = 1 To cache.count
    cache.Remove 1
  Next
End Sub

