Attribute VB_Name = "AccConditionnement"
Attribute VB_Description = "Accès aux conditionnements par numéro, recherche…"
' module AccConditionnement
' Accès aux conditionnements par numéro, recherche…
'  2/09/1997
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public gcdt_iNbConditionnements As Integer

' Ok pas très élégant, mais pratique…
Function CollectionConditionnements() As Collection
  Set CollectionConditionnements = cache
End Function


Public Function LireConditionnement(iNumCdt As Integer) As Conditionnement
  If gcdt_iNbConditionnements = 0 Then InitConditionnements
  
  On Error Resume Next
  Set LireConditionnement = cache("F" & iNumCdt)
  If Err = 0 Then Exit Function
  Set LireConditionnement = Nothing
End Function


Public Function sLibelléConditionnement(ByVal iNumCdt As Integer) As String
  If gcdt_iNbConditionnements = 0 Then InitConditionnements
  
  Dim c As Conditionnement
  On Error Resume Next
  Set c = cache("F" & iNumCdt)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléConditionnement = c.cdt_libelle
    Exit Function
  End If
  sLibelléConditionnement = "Conditionnement " & iNumCdt & " inconnu"
End Function



Sub InitConditionnements()
  Dim i As Integer, iNumCdt As Integer
  Dim cdt As New Conditionnement
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxCdt As Date
  
  sNomCacheDisque = App.Path & "\Cache conditionnements.dat"
  
  ' On récupère le timestamp maxi du démon
  Bloquer
    tcps.Envoie "ECDT 0|""F"""
      
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumCdt
    br.GetField dMaxCdt
    
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop: Exit Sub
  Relâcher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxCdt
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = "Lecture de la liste des conditionnements…"
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumCdt
    frmBase.AfficheBarreProgression 0, iNumCdt, 0
    
    i = 0
    Do Until EOF(1)
      cdt.DiskRead 1
      
      ' On ajoute le conditionnement dans le cache mémoire
      cache.Add cdt.Copie, "F" & cdt.cdt_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = "Récupération de la liste des conditionnements…"
      
    frmBase.pbProgress.Max = iNumCdt

    Bloquer
      tcps.Envoie "ECDT 1|""F"""

      i = 0
      Do
        sLigne = tcps.Reçoit
        If Left(sLigne, 2) = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: cdt.cdt_indice = v
        br.GetField v: cdt.cdt_langue = v
        br.GetField v: cdt.cdt_libelle = v
        br.GetField v: cdt.cdt_comment = v
        br.GetField v: cdt.cdt_datecreat = v
        br.GetField v: cdt.cdt_heurecreat = v
        br.GetField v: cdt.cdt_opercreat = v
        br.GetField v: cdt.cdt_datemodif = v
        br.GetField v: cdt.cdt_heuremodif = v
        br.GetField v: cdt.cdt_opermodif = v
        br.GetField v: cdt.timestamp = v
      
        ' On ajoute l'Conditionnement dans le cache
        cache.Add cdt.Copie, "F" & cdt.cdt_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Relâcher
    
    frmBase.sbStatus.Panels("Info").Text = "Sauvegarde de la liste des conditionnements…"
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each cdt In cache
      cdt.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxCdt
  End If
  
  gcdt_iNbConditionnements = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheConditionnement(ByVal sMotif As String) As Collection
  If gcdt_iNbConditionnements = 0 Then InitConditionnements

  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As Conditionnement
  For Each u In cache
    If UCase(u.cdt_libelle) Like UCase(sMotif) Then c.Add u, "F" & u.cdt_indice
  Next
  Set RechercheConditionnement = c
End Function


' Traces internes
Sub ListeConditionnements(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N°"
  lw.ColumnHeaders(2).Text = "Langue"
  lw.ColumnHeaders(3).Text = "Libellé"
  lw.ColumnHeaders(4).Text = " "

  Dim c As Conditionnement
  For Each c In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = c.cdt_indice
    itmX.SubItems(1) = c.cdt_langue
    itmX.SubItems(2) = c.cdt_libelle
    itmX.SubItems(3) = ""
  Next
End Sub

