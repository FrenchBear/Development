Attribute VB_Name = "AccM�thode"
Attribute VB_Description = "Module d'acc�s aux m�thodes d'analyse. Acc�s par num�ro, recherche�"
' Module d'acc�s aux m�thodes d'analyse
' Acc�s par num�ro, recherche�
'  3/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public gmet_iNbM�thodes As Integer


Public Function LireM�thode(ByVal iGerme As Integer, ByVal cM�thode As String) As M�thode
  If gmet_iNbM�thodes = 0 Then InitM�thodes
  
  On Error Resume Next
  Set LireM�thode = cache("M" & iGerme & cM�thode)
  If Err = 0 Then Exit Function
  Set LireM�thode = Nothing
End Function


Public Function sLibell�M�thode(ByVal iGerme As Integer, ByVal cM�thode As String) As String
  If gmet_iNbM�thodes = 0 Then InitM�thodes
  
  Dim m As M�thode
  On Error Resume Next
  Set m = cache("M" & iGerme & cM�thode)
  If Err = 0 Then
    On Error GoTo 0
    sLibell�M�thode = m.met_libelle
    Exit Function
  End If
  sLibell�M�thode = sprintf(sGetIntlLib("CR205", "M�thode %1 pour le germe %2 inconnue"), cM�thode, iGerme)
  'sLibell�M�thode = "M�thode " & cM�thode & " pour le germe " & iGerme & " inconnue"
End Function



Sub InitM�thodes()
  Dim i As Integer, cM�thode As Integer
  Dim met As New M�thode
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxmet As Date
  
  sNomCacheDisque = App.Path & "\Cache m�thodes.dat"
  
  ' On r�cup�re le timestamp maxi du d�mon
  Bloquer
    tcps.Envoie "EMET 0"
      
    sLigne = tcps.Re�oit
    If sLigne = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField cM�thode
    br.GetField dMaxmet
    
    sLigne = tcps.Re�oit
    If sLigne <> "->" Then Stop: Exit Sub
  Rel�cher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxmet
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  frmBase.pbProgress.Min = 0
  frmBase.pbProgress.Value = 0
  frmBase.pbProgress.Visible = True
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR206", "Lecture de la liste des m�thodes�")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, cM�thode
    frmBase.AfficheBarreProgression 0, cM�thode, 0

    i = 0
    Do Until EOF(1)
      met.DiskRead 1
      
      ' On ajoute la m�thode dans le cache m�moire
      cache.Add met.Copie, "M" & met.met_germe & met.met_methode
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR215", "R�cup�ration de la liste des m�thodes�")
      
    frmBase.pbProgress.Max = cM�thode

    Bloquer
      tcps.Envoie "EMET 1"

      i = 0
      Do
        sLigne = tcps.Re�oit
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
        
        ' On ajoute l'M�thode dans le cache
        cache.Add met.Copie, "F" & met.met_germe & met.met_methode
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Rel�cher
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR227", "Sauvegarde de la liste des m�thodes�")
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each met In cache
      met.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxmet
  End If
  
  gmet_iNbM�thodes = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


' Traces internes
Sub ListeM�thodes(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "Germe"
  lw.ColumnHeaders(2).Text = "M�thode"
  lw.ColumnHeaders(3).Text = "Libell�"
  lw.ColumnHeaders(4).Text = "Labo accr"

  Dim m As M�thode
  For Each m In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = m.met_germe
    itmX.SubItems(1) = m.met_methode
    itmX.SubItems(2) = m.met_libelle
    itmX.SubItems(3) = m.met_laboaccr
  Next
End Sub

