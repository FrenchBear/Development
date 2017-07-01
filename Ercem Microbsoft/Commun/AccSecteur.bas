Attribute VB_Name = "AccSecteur"
Attribute VB_Description = "Fonctions d'accès aux secteurs, gestion d'un cache mémoire"
' Fonctions d'accès aux secteurs
' Gestion d'un cache en mémoire
' 21/11/00 PV
Option Explicit

' Cache
Private cache As New Collection

' Statistiques
Public gsec_iNbLire As Integer
Public gsec_iNbLireDuCache As Integer

Function gsec_iCacheCount() As Integer
  gsec_iCacheCount = cache.count
End Function


Public Function sNomSecteur(lNumsec As Long)
  Dim s As Secteur
  If lNumsec = 0 Then
    Set s = New Secteur
    s.sec_nom = sGetIntlLib("CRtxtSec", "SECTEUR EN COURS DE CRÉATION")
  Else
    Set s = LireSecteur(lNumsec)
  End If
  If Not s Is Nothing Then
    sNomSecteur = s.sec_nom
  Else
    sNomSecteur = sGetIntlLib("CRtxtSecInc", "??? SECTEUR INCONNU")
  End If
End Function


' Lit complètement un secteur
' Retourne Nothing si sec inxistant
Public Function LireSecteur(ByRef lNumsec As Long) As Secteur
  gsec_iNbLire = gsec_iNbLire + 1
  
  ' On cherche d'abord dans le cache
  Dim ec As Secteur
  On Error Resume Next
  Set ec = cache("S" & lNumsec)
  If Err = 0 Then                       ' On l'a trouvé dans le cache !
    Set LireSecteur = ec
    gsec_iNbLireDuCache = gsec_iNbLireDuCache + 1
    Exit Function                       ' Et c'est fini pour LireSecteur
  End If
  
  ' Pas trouvé dans le cache, on demande au démon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    br.AddField lNumsec
    tcps.Envoie "LSEC " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If sLigne = "->" Then
      Relâcher
      Set LireSecteur = Nothing
      Exit Function
    End If
    
    Dim et As New Secteur
    Dim v As Variant
    br.Buffer = sLigne
    
    br.GetField v: et.sec_numsec = v
    br.GetField v: et.sec_origine = v
    br.GetField v: et.sec_etat = v
    br.GetField v: et.sec_numdrg = v
    br.GetField v: et.sec_nom = v
    br.GetField v: et.sec_rue = v
    br.GetField v: et.sec_loc = v
    br.GetField v: et.sec_cpost = v
    br.GetField v: et.sec_bdist = v
    br.GetField v: et.sec_tel = v
    br.GetField v: et.sec_fax = v
    br.GetField v: et.sec_pays = v
    br.GetField v: et.sec_corresp = v
    br.GetField v: et.sec_interloc = v
    br.GetField v: et.sec_blgrp = v
    br.GetField v: et.sec_comment = v
    br.GetField v: et.sec_datecreat = v
    br.GetField v: et.sec_heurecreat = v
    br.GetField v: et.sec_opercreat = v
    br.GetField v: et.sec_datemodif = v
    br.GetField v: et.sec_heuremodif = v
    br.GetField v: et.sec_opermodif = v
    br.GetField v: et.timestamp = v
    br.GetField v: et.sec_tsvalid = v
    br.GetField v: et.sec_opervalid = v
    br.GetField v: et.sec_optedition = v
    br.GetField v: et.sec_optlabo = v

    ' On élimine du cache la version simple
    On Error Resume Next
    cache.Remove "S" & et.sec_numsec
    On Error GoTo 0
    
    ' On ajoute l'secteur dans le cache
    cache.Add et.Copie, "S" & et.sec_numsec
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If sLigne <> "->" Then MsgBox "STOP.9.1": Stop
  Relâcher
  
  Set LireSecteur = et
End Function


Sub EffaceCacheSecteurs()
  Dim i As Integer
  For i = 1 To cache.count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeSecteurs(lv As ListView)
  Dim itmX As ListItem

  lv.ListItems.Clear
  lv.ColumnHeaders(1).Text = sGetIntlLib("REchNo", "N°")
  lv.ColumnHeaders(2).Text = sGetIntlLib("REchPréfixe", "Préfixe")
  lv.ColumnHeaders(3).Text = sGetIntlLib("REchEtb", "Secteur")
  lv.ColumnHeaders(4).Text = " "

  Dim e As Secteur
  For Each e In cache
    Set itmX = lv.ListItems.Add()
    itmX.Text = e.sec_numsec
    itmX.SubItems(1) = e.sec_prefixe
    itmX.SubItems(2) = e.sec_nom
    itmX.SubItems(3) = ""
  Next
End Sub

