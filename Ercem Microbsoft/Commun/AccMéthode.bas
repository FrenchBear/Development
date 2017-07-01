Attribute VB_Name = "AccMéthode"
Attribute VB_Description = "Module d'accès aux méthodes d'analyse. Accès par numéro, recherche…"
' Module d'accès aux méthodes d'analyse
' Accès par numéro, recherche…
'  3/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public gmet_iNbMéthodes As Integer


Public Function LireMéthode(ByVal iGerme As Integer, ByVal cMéthode As String) As Méthode
  If gmet_iNbMéthodes = 0 Then InitMéthodes
  
  On Error Resume Next
  Set LireMéthode = cache("M" & iGerme & cMéthode)
  If Err = 0 Then Exit Function
  Set LireMéthode = Nothing
End Function


Public Function sLibelléMéthode(ByVal iGerme As Integer, ByVal cMéthode As String) As String
  If gmet_iNbMéthodes = 0 Then InitMéthodes
  
  Dim m As Méthode
  On Error Resume Next
  Set m = cache("M" & iGerme & cMéthode)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléMéthode = m.met_libelle
    Exit Function
  End If
  sLibelléMéthode = sprintf(sGetIntlLib("CR205", "Méthode %1 pour le germe %2 inconnue"), cMéthode, iGerme)
  'sLibelléMéthode = "Méthode " & cMéthode & " pour le germe " & iGerme & " inconnue"
End Function



Sub InitMéthodes()
  Dim i As Integer, cMéthode As Integer
  Dim met As New Méthode
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxmet As Date
  
  sNomCacheDisque = App.Path & "\Cache méthodes.dat"
  
  ' On récupère le timestamp maxi du démon
  Bloquer
    tcps.Envoie "EMET 0"
      
    sLigne = tcps.Reçoit
    If sLigne = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField cMéthode
    br.GetField dMaxmet
    
    sLigne = tcps.Reçoit
    If sLigne <> "->" Then Stop: Exit Sub
  Relâcher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxmet
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  frmBase.pbProgress.Min = 0
  frmBase.pbProgress.Value = 0
  frmBase.pbProgress.Visible = True
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR206", "Lecture de la liste des méthodes…")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, cMéthode
    frmBase.AfficheBarreProgression 0, cMéthode, 0

    i = 0
    Do Until EOF(1)
      met.DiskRead 1
      
      ' On ajoute la méthode dans le cache mémoire
      cache.Add met.Copie, "M" & met.met_germe & met.met_methode
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR215", "Récupération de la liste des méthodes…")
      
    frmBase.pbProgress.Max = cMéthode

    Bloquer
      tcps.Envoie "EMET 1"

      i = 0
      Do
        sLigne = tcps.Reçoit
        If sLigne = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: met.met_germe = v
        br.GetField v: met.met_methode = v
        br.GetField v: met.met_libelle = v
        br.GetField v: met.met_reference = v
        br.GetField v: met.met_laboaccr = v
        br.GetField v: met.met_comment = v
        br.GetField v: met.met_dureeinc = v
        br.GetField v: met.met_deltadureeinc = v
        br.GetField v: met.met_filler = v
        br.GetField v: met.timestamp = v
        
        ' On ajoute l'Méthode dans le cache
        cache.Add met.Copie, "F" & met.met_germe & met.met_methode
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Relâcher
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR227", "Sauvegarde de la liste des méthodes…")
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each met In cache
      met.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxmet
  End If
  
  gmet_iNbMéthodes = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


' Traces internes
Sub ListeMéthodes(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "Germe"
  lw.ColumnHeaders(2).Text = "Méthode"
  lw.ColumnHeaders(3).Text = "Libellé"
  lw.ColumnHeaders(4).Text = "Labo accr"

  Dim m As Méthode
  For Each m In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = m.met_germe
    itmX.SubItems(1) = m.met_methode
    itmX.SubItems(2) = m.met_libelle
    itmX.SubItems(3) = m.met_laboaccr
  Next
End Sub

