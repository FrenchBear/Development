Attribute VB_Name = "AccCadreDePrélèvement"
Attribute VB_Description = "Accès aux cadres de prélèvement par numéro, recherche…"
' AccCadreDePrélèvement
' Accès aux cadres de prélèvement par numéro, recherche…
'  2/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public gcpr_iNbCadresDePrélèvement As Integer

' Ok pas très élégant, mais pratique…
Function CollectionCadresDePrélèvement() As Collection
  Set CollectionCadresDePrélèvement = cache
End Function


Public Function LireCadreDePrélèvement(iNumcpr As Integer) As CadreDePrélèvement
  If gcpr_iNbCadresDePrélèvement = 0 Then InitCadresDePrélèvement
  
  On Error Resume Next
  Set LireCadreDePrélèvement = cache("F" & iNumcpr)
  If Err = 0 Then Exit Function
  Set LireCadreDePrélèvement = Nothing
End Function


Public Function sLibelléCadreDePrélèvement(ByVal iNumcpr As Integer) As String
  If gcpr_iNbCadresDePrélèvement = 0 Then InitCadresDePrélèvement
  
  Dim u As CadreDePrélèvement
  On Error Resume Next
  Set u = cache("F" & iNumcpr)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléCadreDePrélèvement = u.cpr_libelle
    Exit Function
  End If
  sLibelléCadreDePrélèvement = "Cadre de prélèvement " & iNumcpr & " inconnu"
End Function



Sub InitCadresDePrélèvement()
  Dim i As Integer, iNumcpr As Integer
  Dim cpr As New CadreDePrélèvement
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxcpr As Date
  
  sNomCacheDisque = App.Path & "\Cache cadres de prélèvement.dat"
  
  ' On récupère le timestamp maxi du démon
  Bloquer
    tcps.Envoie "Ecpr 0|""F"""
      
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumcpr
    br.GetField dMaxcpr
    
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop: Exit Sub
  Relâcher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxcpr
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = "Lecture de la liste des cadres de prélèvement…"
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumcpr
    frmBase.AfficheBarreProgression 0, iNumcpr, 0

    i = 0
    Do Until EOF(1)
      cpr.DiskRead 1
      
      ' On ajoute le cadre de prélèvement dans le cache mémoire
      cache.Add cpr.Copie, "F" & cpr.cpr_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = "Récupération de la liste des cadres de prélèvement…"
      
    frmBase.pbProgress.Max = iNumcpr

    Bloquer
      tcps.Envoie "Ecpr 1|""F"""

      i = 0
      Do
        sLigne = tcps.Reçoit
        If Left(sLigne, 2) = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: cpr.cpr_indice = v
        br.GetField v: cpr.cpr_langue = v
        br.GetField v: cpr.cpr_libelle = v
        br.GetField v: cpr.cpr_codegr = v
        br.GetField v: cpr.cpr_comment = v
        br.GetField v: cpr.cpr_datecreat = v
        br.GetField v: cpr.cpr_heurecreat = v
        br.GetField v: cpr.cpr_opercreat = v
        br.GetField v: cpr.cpr_datemodif = v
        br.GetField v: cpr.cpr_heuremodif = v
        br.GetField v: cpr.cpr_opermodif = v
        br.GetField v: cpr.timestamp = v
      
        ' On ajoute l'CadreDePrélèvement dans le cache
        cache.Add cpr.Copie, "F" & cpr.cpr_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Relâcher
    
    frmBase.sbStatus.Panels("Info").Text = "Sauvegarde de la liste des cadres de prélèvement…"
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each cpr In cache
      cpr.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxcpr
  End If
  
  gcpr_iNbCadresDePrélèvement = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheCadreDePrélèvement(ByVal sMotif As String) As Collection
  If gcpr_iNbCadresDePrélèvement = 0 Then InitCadresDePrélèvement
  
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As CadreDePrélèvement
  For Each u In cache
    If UCase(u.cpr_libelle) Like UCase(sMotif) Then c.Add u, "F" & u.cpr_indice
  Next
  Set RechercheCadreDePrélèvement = c
End Function


' Traces internes
Sub ListeCadresDePrélèvement(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N°"
  lw.ColumnHeaders(2).Text = "Langue"
  lw.ColumnHeaders(3).Text = "Libellé"
  lw.ColumnHeaders(4).Text = " "

  Dim c As CadreDePrélèvement
  For Each c In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = c.cpr_indice
    itmX.SubItems(1) = c.cpr_langue
    itmX.SubItems(2) = c.cpr_libelle
    itmX.SubItems(3) = ""
  Next
End Sub

