Attribute VB_Name = "AccRéception"
Attribute VB_Description = "Module d'accès aux aspects à réception. Accès par numéro, recherche.."
' Module d'accès aux aspects à réception
' Accès par numéro, recherche…
' 17/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public grec_iNbRéceptions As Integer

' Ok pas très élégant, mais pratique…
Function CollectionRéceptions() As Collection
  Set CollectionRéceptions = cache
End Function


Public Function LireRéception(iNumrec As Integer) As Réception
  If grec_iNbRéceptions = 0 Then InitRéceptions
  
  On Error Resume Next
  Set LireRéception = cache("F" & iNumrec)
  If Err = 0 Then Exit Function
  Set LireRéception = Nothing
End Function


Public Function sLibelléRéception(ByVal iNumrec As Integer) As String
  If grec_iNbRéceptions = 0 Then InitRéceptions
  
  Dim c As Réception
  On Error Resume Next
  Set c = cache("F" & iNumrec)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléRéception = c.rec_libelle
    Exit Function
  End If
  sLibelléRéception = "Aspect à réception " & iNumrec & " inconnu"
End Function



Sub InitRéceptions()
  Dim i As Integer, iNumrec As Integer
  Dim rec As New Réception
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxrec As Date
  
  sNomCacheDisque = App.Path & "\Cache aspects à réception.dat"
  
  ' On récupère le timestamp maxi du démon
  Bloquer
    tcps.Envoie "Erec 0|""F"""
      
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumrec
    br.GetField dMaxrec
    
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop: Exit Sub
  Relâcher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxrec
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = "Lecture de la liste des aspects à réception…"
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumrec
    frmBase.AfficheBarreProgression 0, iNumrec, 0
    
    i = 0
    Do Until EOF(1)
      rec.DiskRead 1
      
      ' On ajoute le Réception dans le cache mémoire
      cache.Add rec.Copie, "F" & rec.rec_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = "Récupération de la liste des aspects à réception…"
      
    frmBase.pbProgress.Max = iNumrec

    Bloquer
      tcps.Envoie "Erec 1|""F"""

      i = 0
      Do
        sLigne = tcps.Reçoit
        If Left(sLigne, 2) = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: rec.rec_indice = v
        br.GetField v: rec.rec_langue = v
        br.GetField v: rec.rec_libelle = v
        br.GetField v: rec.rec_comment = v
        br.GetField v: rec.rec_datecreat = v
        br.GetField v: rec.rec_heurecreat = v
        br.GetField v: rec.rec_opercreat = v
        br.GetField v: rec.rec_datemodif = v
        br.GetField v: rec.rec_heuremodif = v
        br.GetField v: rec.rec_opermodif = v
        br.GetField v: rec.timestamp = v
      
        ' On ajoute l'Réception dans le cache
        cache.Add rec.Copie, "F" & rec.rec_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Relâcher
    
    frmBase.sbStatus.Panels("Info").Text = "Sauvegarde de la liste des aspects à réceptions…"
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each rec In cache
      rec.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxrec
  End If
  
  grec_iNbRéceptions = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheRéception(ByVal sMotif As String) As Collection
  If grec_iNbRéceptions = 0 Then InitRéceptions

  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As Réception
  For Each u In cache
    If UCase(u.rec_libelle) Like UCase(sMotif) Then c.Add u, "F" & u.rec_indice
  Next
  Set RechercheRéception = c
End Function


' Traces internes
Sub ListeRéceptions(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N°"
  lw.ColumnHeaders(2).Text = "Langue"
  lw.ColumnHeaders(3).Text = "Libellé"
  lw.ColumnHeaders(4).Text = " "

  Dim c As Réception
  For Each c In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = c.rec_indice
    itmX.SubItems(1) = c.rec_langue
    itmX.SubItems(2) = c.rec_libelle
    itmX.SubItems(3) = ""
  Next
End Sub

