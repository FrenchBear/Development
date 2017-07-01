Attribute VB_Name = "AccMilieu"
Attribute VB_Description = "Module d'accès aux milieux (géloses). Accès par numéro, …"
' Module d'accès aux milieux (géloses)
' Accès par numéro, …
'  6/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache
' 28/11/2000 PV sAbrégéMilieu


Option Explicit

Private cache As New Collection

' Statistiques
Public gmil_iNbMilieux As Integer


' Ok pas très élégant, mais pratique pour remplir une combo…
Function CollectionMilieux() As Collection
  Set CollectionMilieux = cache
End Function


Public Function LireMilieu(iNummil As Integer) As Milieu
  If gmil_iNbMilieux = 0 Then InitMilieux
  
  On Error Resume Next
  Set LireMilieu = cache("M" & iNummil)
  If Err = 0 Then Exit Function
  Set LireMilieu = Nothing
End Function


Public Function sLibelléMilieu(ByVal iNummil As Integer) As String
  If gmil_iNbMilieux = 0 Then InitMilieux
  
  Dim c As Milieu
  On Error Resume Next
  Set c = cache("M" & iNummil)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléMilieu = c.mil_libelle
    Exit Function
  End If
  sLibelléMilieu = sprintf(sGetIntlLib("CR268", "Milieu %1 inconnu"), iNummil)
End Function


Public Function sAbrégéMilieu(ByVal iNummil As Integer) As String
  If gmil_iNbMilieux = 0 Then InitMilieux
  
  Dim c As Milieu
  On Error Resume Next
  Set c = cache("M" & iNummil)
  If Err = 0 Then
    On Error GoTo 0
    sAbrégéMilieu = c.mil_abrege
    Exit Function
  End If
  sAbrégéMilieu = sprintf(sGetIntlLib("CR268", "Milieu %1 inconnu"), iNummil)
End Function



Sub InitMilieux()
  Dim i As Integer, iNummil As Integer
  Dim mil As New Milieu
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxMil As Date
  
  sNomCacheDisque = App.Path & "\Cache milieux.dat"
  
  ' On récupère le timestamp maxi du démon
  Bloquer
    tcps.Envoie "EMIL 0"
      
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNummil
    br.GetField dMaxMil
    
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop: Exit Sub
  Relâcher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxMil
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR314", "Lecture de la liste des milieux…")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNummil
    frmBase.AfficheBarreProgression 0, iNummil, 0

    i = 0
    Do Until EOF(1)
      mil.DiskRead 1
      
      ' On ajoute le milieu dans le cache mémoire
      cache.Add mil.Copie, "M" & mil.mil_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR315", "Récupération de la liste des milieux…")
      
    frmBase.pbProgress.Max = iNummil

    Bloquer
      tcps.Envoie "EMIL 1"

      i = 0
      Do
        sLigne = tcps.Reçoit
        If Left(sLigne, 2) = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: mil.mil_indice = v
        br.GetField v: mil.mil_libelle = v
        br.GetField v: mil.mil_abrege = v
        br.GetField v: mil.mil_typemarquage = v
        br.GetField v: mil.mil_typeboite = v
        br.GetField v: mil.mil_commentaire = v
        br.GetField v: mil.timestamp = v
      
        ' On ajoute le milieu dans le cache
        cache.Add mil.Copie, "M" & mil.mil_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Relâcher
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR316", "Sauvegarde de la liste des milieux…")
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each mil In cache
      mil.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxMil
  End If
  
  gmil_iNbMilieux = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


'' Fonction sans doute inutile
'Function RechercheMilieu(ByVal sMotif As String) As Collection
'  If gmil_iNbMilieux = 0 Then InitMilieux
'
'  sMotif = "*" & sMotif & "*"
'  Dim c As New Collection
'  Dim u As Milieu
'  For Each u In cache
'    If UCase(u.mil_libelle) Like UCase(sMotif) Then c.Add u, "M" & u.mil_indice
'  Next
'  Set RechercheMilieu = c
'End Function


' Traces internes
Sub ListeMilieux(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N°"
  lw.ColumnHeaders(2).Text = "Abrégé"
  lw.ColumnHeaders(3).Text = "Libellé"
  lw.ColumnHeaders(4).Text = "Type m/b"

  Dim m As Milieu
  For Each m In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = m.mil_indice
    itmX.SubItems(1) = m.mil_abrege
    itmX.SubItems(2) = m.mil_libelle
    itmX.SubItems(3) = m.mil_typemarquage & "/" & m.mil_typeboite
  Next
End Sub

