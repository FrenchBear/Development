Attribute VB_Name = "AccLieuDePrélèvement"
Attribute VB_Description = "Module d'accès aux lieux de prélèvement. Accès par numéro, recherche…"
' Module d'accès aux lieux de prélèvement
' Accès par numéro, recherche…
'  2/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public glip_iNbLieuxDePrélèvement As Integer

' Ok pas très élégant, mais pratique…
Function CollectionLieuxDePrélèvement() As Collection
  Set CollectionLieuxDePrélèvement = cache
End Function


Public Function LireLieuDePrélèvement(iNumlip As Integer) As LieuDePrélèvement
  If glip_iNbLieuxDePrélèvement = 0 Then InitLieuxDePrélèvement
  
  On Error Resume Next
  Set LireLieuDePrélèvement = cache("F" & iNumlip)
  If Err = 0 Then Exit Function
  Set LireLieuDePrélèvement = Nothing
End Function


Public Function sLibelléLieuDePrélèvement(ByVal iNumlip As Integer) As String
  If glip_iNbLieuxDePrélèvement = 0 Then InitLieuxDePrélèvement
  
  Dim l As LieuDePrélèvement
  On Error Resume Next
  Set l = cache("F" & iNumlip)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléLieuDePrélèvement = l.lip_libelle
    Exit Function
  End If
  sLibelléLieuDePrélèvement = "LieuDePrélèvement " & iNumlip & " inconnu"
End Function



Sub InitLieuxDePrélèvement()
  Dim i As Integer, iNumlip As Integer
  Dim lip As New LieuDePrélèvement
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxlip As Date
  
  sNomCacheDisque = App.Path & "\Cache lieux de prélèvement.dat"
  
  ' On récupère le timestamp maxi du démon
  Bloquer
    tcps.Envoie "Elip 0|""F"""
      
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumlip
    br.GetField dMaxlip
    
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop: Exit Sub
  Relâcher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxlip
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = "Lecture de la liste des lieux de prélèvement…"
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumlip
    frmBase.AfficheBarreProgression 0, iNumlip, 0

    i = 0
    Do Until EOF(1)
      lip.DiskRead 1
      
      ' On ajoute le lieu de prélèvement dans le cache mémoire
      cache.Add lip.Copie, "F" & lip.lip_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = "Récupération de la liste des lieux de prélèvement…"
      
    frmBase.pbProgress.Max = iNumlip

    Bloquer
      tcps.Envoie "Elip 1|""F"""

      i = 0
      Do
        sLigne = tcps.Reçoit
        If Left(sLigne, 2) = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: lip.lip_indice = v
        br.GetField v: lip.lip_langue = v
        br.GetField v: lip.lip_libelle = v
        br.GetField v: lip.lip_comment = v
        br.GetField v: lip.lip_datecreat = v
        br.GetField v: lip.lip_heurecreat = v
        br.GetField v: lip.lip_opercreat = v
        br.GetField v: lip.lip_datemodif = v
        br.GetField v: lip.lip_heuremodif = v
        br.GetField v: lip.lip_opermodif = v
        br.GetField v: lip.timestamp = v
      
        ' On ajoute le lieu de prélèvement dans le cache
        cache.Add lip.Copie, "F" & lip.lip_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Relâcher
    
    frmBase.sbStatus.Panels("Info").Text = "Sauvegarde de la liste des lieux de prélèvement…"
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each lip In cache
      lip.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxlip
  End If
  
  glip_iNbLieuxDePrélèvement = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheLieuDePrélèvement(ByVal sMotif As String) As Collection
  If glip_iNbLieuxDePrélèvement = 0 Then InitLieuxDePrélèvement
  
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As LieuDePrélèvement
  For Each u In cache
    If UCase(u.lip_libelle) Like UCase(sMotif) Then c.Add u, "F" & u.lip_indice
  Next
  Set RechercheLieuDePrélèvement = c
End Function


' Traces internes
Sub ListeLieuxDePrélèvement(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N°"
  lw.ColumnHeaders(2).Text = "Langue"
  lw.ColumnHeaders(3).Text = "Libellé"
  lw.ColumnHeaders(4).Text = " "

  Dim l As LieuDePrélèvement
  For Each l In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = l.lip_indice
    itmX.SubItems(1) = l.lip_langue
    itmX.SubItems(2) = l.lip_libelle
    itmX.SubItems(3) = ""
  Next
End Sub

