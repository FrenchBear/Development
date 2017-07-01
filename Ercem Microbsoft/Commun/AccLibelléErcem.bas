Attribute VB_Name = "AccLibelléErcem"
Attribute VB_Description = "Module d'accès aux libellés Ercem. Accès par numéro, recherche…"
' Module d'accès aux libellés Ercem
' Accès par numéro, recherche…
'  3/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache
' 19/01/1999 PV Nom de l'application en paramètre à ELER
' 25/01/1999 PV Internationalisation
' 25/08/1999 PV Cas où le programme est lancé d'une unité en lecture seule, pas d'échec à la création du cache disque

Option Explicit

Private cache As New Collection
Private tsCache As Date            ' timestamp du cache
Private cLangageCache As String    ' Langue des données en mémoire


' Statistiques
Public gler_iNbLibellésErcem As Integer


Public Function LireLibelléErcem(sNumler As String) As LibelléErcem
  If IsEmpty(tsCache) Then
    MsgBox2i "CO084"
    'MsgBox "Erreur interne - Libellés Ercem non lus", vbCritical, sNomApp
    Stop
  End If
  
  On Error Resume Next
  Set LireLibelléErcem = cache("L" & sNumler)
  If Err = 0 Then Exit Function
  Set LireLibelléErcem = Nothing
End Function


Public Function sLibelléErcem(ByVal sNumler As String, sDefaut As String) As String
  If IsEmpty(tsCache) Then
    MsgBox2i "CO084"
    'MsgBox "Erreur interne - Libellés Ercem non lus", vbCritical, sNomApp
    Stop
  End If
  
  Dim l As LibelléErcem
  On Error Resume Next
  Set l = cache("L" & sNumler)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléErcem = l.ler_libelle
    Exit Function
  End If
  On Error GoTo 0
  sLibelléErcem = sDefaut
End Function


' iMode:
' 0: "Classique", essaie le cache disque, et à défaut le serveur
' 1: Lit uniquement à partir du cache disque, ou ne fait rien si le cache n'existe pas
' 2: Met à jour le cache et la collection à partir du serveur si nécessaire
' Retour vrai si les données ont été lues ou modifiées

Function bInitLibellésErcem(iMode As Integer) As Boolean
  Dim i As Integer, iNumler As Integer
  Dim ler As New LibelléErcem
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxler
  
  ' On purge des anciens fichiers cache
  If iMode = 1 Then
    On Error Resume Next
    Kill App.Path & "\Cache libellés Ercem F.dat"
    Kill App.Path & "\Cache libellés Ercem A.dat"
    Kill App.Path & "\Cache libellés Ercem I.dat"
    Kill App.Path & "\Cache libellés Ercem D.dat"
    On Error GoTo 0
  End If
  
  sNomCacheDisque = App.Path & "\Cache libellés " & LCase(App.EXEName) & " " & cLangage & ".dat"
  bInitLibellésErcem = False
  
  ' On récupère le timestamp maxi du démon
  If iMode = 0 Or iMode = 2 Then
    Bloquer
      br.AddField 0       ' Timestamp maxi
      br.AddField LCase(App.EXEName)
      br.AddField cLangage
      tcps.Envoie "ELER " & br.Buffer
  
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Relâcher: Exit Function
      br.Buffer = sLigne
      br.GetField iNumler
      br.GetField dMaxler
      If IsNull(dMaxler) Then dMaxler = #1/1/1980#
  
      sLigne = tcps.Reçoit
      If sLigne <> "->" Then MsgBox "STOP.11": Stop: Relâcher: Exit Function
    Relâcher
  Else
    dMaxler = #1/1/1980#  ' Valeur faible pour entraîner le chargement depuis le cache disque
  End If


  Dim bOkCacheDisque As Boolean
  Dim tsCacheDisque As Date
  
  On Error Resume Next
  tsCacheDisque = FileDateTime(sNomCacheDisque)
  If Err Then tsCacheDisque = #1/1/1979#
  On Error GoTo 0
  bOkCacheDisque = tsCacheDisque >= dMaxler
  
  If bOkCacheDisque Then
    ' Si les données en mémoire sont Ok, on ne relit pas
    If tsCacheDisque <= tsCache And cLangage = cLangageCache Then Exit Function
  
    If Not frmBase Is Nothing Then
      frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("LIsLecture", "Lecture de la liste des libellés…")
      frmBase.sbStatus.Refresh
    End If
    
    Open sNomCacheDisque For Input As #1
    Dim sClé As String
    Input #1, sClé
    If sClé <> "ler1" Then
      MsgBox2i "CO100", "Cache disque des libellés ercem", "ler1", sClé
      Stop
    End If
    Input #1, iNumler
    
    If Not frmBase Is Nothing Then frmBase.AfficheBarreProgression 0, iNumler, 0

    EffaceCollection cache
    i = 0
    Do Until EOF(1)
      ler.DiskRead 1
      
      ' On ajoute le LibelléErcem dans le cache mémoire
      cache.Add ler.Copie, "L" & ler.ler_numler
      
      i = i + 1
      If Not frmBase Is Nothing Then frmBase.pbProgress.Value = i
    Loop
    Close #1
    bInitLibellésErcem = True
    cLangageCache = cLangage
    tsCache = tsCacheDisque
  End If
  
  
  If Not bOkCacheDisque And (iMode = 0 Or iMode = 2) Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("LIsLecture", "Lecture de la liste des libellés…")
    If iNumler > 0 Then frmBase.pbProgress.Max = iNumler

    EffaceCollection cache
    Bloquer
      br.Clear
      br.AddField 1     ' Enumération
      br.AddField LCase(App.EXEName)
      br.AddField cLangage
      tcps.Envoie "ELER " & br.Buffer

      i = 0
      Do
        sLigne = tcps.Reçoit
        If sLigne = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: ler.ler_numler = v
        br.GetField v: ler.ler_libelle = v
      
        ' On ajoute le libellé Ercem dans le cache
        On Error Resume Next
        cache.Add ler.Copie, "L" & ler.ler_numler
        If Err Then
          MsgBox2i "CO086", ler.ler_numler
          'MsgBox "Doublon de clé de libellé : " & ler.ler_numler, vbExclamation, sNomApp
          'Stop
        End If
        On Error GoTo 0
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Relâcher
    
    On Error Resume Next
    Open sNomCacheDisque For Output As #1
    If Err Then
      If Err <> 75 Then   ' Accès en lecture seule: on ignore silencieusement
        MsgBox "Échec à l'ouverture en écriture du cache disque '" & sNomCacheDisque & "'" & vbCrLf & vbCrLf & "Err=" & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf & "Prévenez le service informatique !", vbExclamation, App.Title
      End If
      On Error GoTo 0
    Else
      Write #1, "ler1"    ' Format du cache
      Write #1, cache.count
      For Each ler In cache
        ler.DiskWrite 1
      Next
      Close #1
      SetFileDateTime sNomCacheDisque, dMaxler
    End If
    
    bInitLibellésErcem = True
    cLangageCache = cLangage
    tsCache = dMaxler
  End If
  
  gler_iNbLibellésErcem = cache.count
  If Not frmBase Is Nothing Then
    frmBase.pbProgress.Visible = False
    frmBase.sbStatus.Panels("Info").Text = ""
  End If
End Function



Function RechercheLibelléErcem(ByVal sMotif As String) As Collection
  If IsEmpty(tsCache) Then
    MsgBox2i "CO084"
    'MsgBox "Erreur interne - Libellés Ercem non lus", vbCritical, sNomApp
    Stop
  End If
  
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As LibelléErcem
  For Each u In cache
    If UCase(u.ler_libelle) Like UCase(sMotif) Then c.Add u, "L" & u.ler_numler
  Next
  Set RechercheLibelléErcem = c
End Function



' Traces internes
Sub ListeLibellésErcem(lv As ListView)
  Dim itmX As ListItem

  lv.ListItems.Clear
  lv.ColumnHeaders(1).Text = "N°"
  lv.ColumnHeaders(2).Text = "Libellé"

  Dim l As LibelléErcem
  For Each l In cache
    Set itmX = lv.ListItems.Add()
    itmX.Text = l.ler_numler
    itmX.SubItems(1) = l.ler_libelle
  Next
End Sub

