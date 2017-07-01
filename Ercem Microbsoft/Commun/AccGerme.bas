Attribute VB_Name = "AccGerme"
Attribute VB_Description = "Module d'accès aux Germes par numéro, recherche…"
' Module d'accès aux Germes
' Accès par numéro, recherche…
'  3/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public gger_iNbGermes As Integer


Public Function LireGerme(iNumger As Integer) As Germe
  If gger_iNbGermes = 0 Then InitGermes
  
  On Error Resume Next
  Set LireGerme = cache("F" & iNumger)
  If Err = 0 Then Exit Function
  Set LireGerme = Nothing
End Function


Public Function sLibelléGerme(ByVal iNumger As Integer) As String
  If gger_iNbGermes = 0 Then InitGermes
  
  Dim c As Germe
  On Error Resume Next
  Set c = cache("F" & iNumger)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléGerme = c.ger_libelle
    Exit Function
  End If
  sLibelléGerme = sprintf(sGetIntlLib("CR196", "Germe %1 inconnu"), iNumger)
End Function



Sub InitGermes()
  Dim i As Integer, iNumger As Integer
  Dim ger As New Germe
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxger As Date
  
  sNomCacheDisque = App.Path & "\Cache germes.dat"
  
  ' On récupère le timestamp maxi du démon
  Bloquer
    tcps.Envoie "EGER 0|""F"""
      
    sLigne = tcps.Reçoit
    If sLigne = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumger
    br.GetField dMaxger
    
    sLigne = tcps.Reçoit
    If sLigne <> "->" Then Stop: Exit Sub
  Relâcher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxger
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  frmBase.pbProgress.Min = 0
  frmBase.pbProgress.Value = 0
  frmBase.pbProgress.Visible = True
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR197", "Lecture de la liste des germes…")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumger
    frmBase.AfficheBarreProgression 0, iNumger, 0

    i = 0
    Do Until EOF(1)
      ger.DiskRead 1
      
      ' On ajoute le Germe dans le cache mémoire
      cache.Add ger.Copie, "F" & ger.ger_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR198", "Récupération de la liste des germes…")
      
    frmBase.pbProgress.Max = iNumger

    Bloquer
      tcps.Envoie "Eger 1|""F"""

      i = 0
      Do
        sLigne = tcps.Reçoit
        If sLigne = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: ger.ger_indice = v
        br.GetField v: ger.ger_langue = v
        br.GetField v: ger.ger_libelle = v
        br.GetField v: ger.ger_abrege = v
        br.GetField v: ger.ger_abregelabo = v
        br.GetField v: ger.ger_auchan = v
        br.GetField v: ger.ger_comment = v
        br.GetField v: ger.ger_datecreat = v
        br.GetField v: ger.ger_heurecreat = v
        br.GetField v: ger.ger_opercreat = v
        br.GetField v: ger.ger_datemodif = v
        br.GetField v: ger.ger_heuremodif = v
        br.GetField v: ger.ger_opermodif = v
        br.GetField v: ger.timestamp = v
      
        ' On ajoute l'Germe dans le cache
        cache.Add ger.Copie, "F" & ger.ger_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Relâcher
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR199", "Sauvegarde de la liste des germes…")
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each ger In cache
      ger.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxger
  End If
  
  gger_iNbGermes = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub

' Fonction sans doute inutile
Function RechercheGerme(ByVal sMotif As String) As Collection
  If gger_iNbGermes = 0 Then InitGermes
  
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As Germe
  For Each u In cache
    If UCase(u.ger_libelle) Like UCase(sMotif) Then c.Add u, "F" & u.ger_indice
  Next
  Set RechercheGerme = c
End Function


' Traces internes
Sub ListeGermes(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = sGetIntlLib("AGchNo", "N°")
  lw.ColumnHeaders(2).Text = sGetIntlLib("AGchLangue", "Langue")
  lw.ColumnHeaders(3).Text = sGetIntlLib("AGchLibellé", "Libellé")
  lw.ColumnHeaders(4).Text = " "

  Dim g As Germe
  For Each g In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = g.ger_indice
    itmX.SubItems(1) = g.ger_langue
    itmX.SubItems(2) = g.ger_libelle
    itmX.SubItems(3) = ""
  Next
End Sub


