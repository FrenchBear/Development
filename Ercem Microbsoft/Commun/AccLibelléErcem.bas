Attribute VB_Name = "AccLibell�Ercem"
Attribute VB_Description = "Module d'acc�s aux libell�s Ercem. Acc�s par num�ro, recherche�"
' Module d'acc�s aux libell�s Ercem
' Acc�s par num�ro, recherche�
'  3/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache
' 19/01/1999 PV Nom de l'application en param�tre � ELER
' 25/01/1999 PV Internationalisation
' 25/08/1999 PV Cas o� le programme est lanc� d'une unit� en lecture seule, pas d'�chec � la cr�ation du cache disque

Option Explicit

Private cache As New Collection
Private tsCache As Date            ' timestamp du cache
Private cLangageCache As String    ' Langue des donn�es en m�moire


' Statistiques
Public gler_iNbLibell�sErcem As Integer


Public Function LireLibell�Ercem(sNumler As String) As Libell�Ercem
  If IsEmpty(tsCache) Then
    MsgBox2i "CO084"
    'MsgBox "Erreur interne - Libell�s Ercem non lus", vbCritical, sNomApp
    Stop
  End If
  
  On Error Resume Next
  Set LireLibell�Ercem = cache("L" & sNumler)
  If Err = 0 Then Exit Function
  Set LireLibell�Ercem = Nothing
End Function


Public Function sLibell�Ercem(ByVal sNumler As String, sDefaut As String) As String
  If IsEmpty(tsCache) Then
    MsgBox2i "CO084"
    'MsgBox "Erreur interne - Libell�s Ercem non lus", vbCritical, sNomApp
    Stop
  End If
  
  Dim l As Libell�Ercem
  On Error Resume Next
  Set l = cache("L" & sNumler)
  If Err = 0 Then
    On Error GoTo 0
    sLibell�Ercem = l.ler_libelle
    Exit Function
  End If
  On Error GoTo 0
  sLibell�Ercem = sDefaut
End Function


' iMode:
' 0: "Classique", essaie le cache disque, et � d�faut le serveur
' 1: Lit uniquement � partir du cache disque, ou ne fait rien si le cache n'existe pas
' 2: Met � jour le cache et la collection � partir du serveur si n�cessaire
' Retour vrai si les donn�es ont �t� lues ou modifi�es

Function bInitLibell�sErcem(iMode As Integer) As Boolean
  Dim i As Integer, iNumler As Integer
  Dim ler As New Libell�Ercem
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxler
  
  ' On purge des anciens fichiers cache
  If iMode = 1 Then
    On Error Resume Next
    Kill App.Path & "\Cache libell�s Ercem F.dat"
    Kill App.Path & "\Cache libell�s Ercem A.dat"
    Kill App.Path & "\Cache libell�s Ercem I.dat"
    Kill App.Path & "\Cache libell�s Ercem D.dat"
    On Error GoTo 0
  End If
  
  sNomCacheDisque = App.Path & "\Cache libell�s " & LCase(App.EXEName) & " " & cLangage & ".dat"
  bInitLibell�sErcem = False
  
  ' On r�cup�re le timestamp maxi du d�mon
  If iMode = 0 Or iMode = 2 Then
    Bloquer
      br.AddField 0       ' Timestamp maxi
      br.AddField LCase(App.EXEName)
      br.AddField cLangage
      tcps.Envoie "ELER " & br.Buffer
  
      sLigne = tcps.Re�oit
      If sLigne = "->" Then Rel�cher: Exit Function
      br.Buffer = sLigne
      br.GetField iNumler
      br.GetField dMaxler
      If IsNull(dMaxler) Then dMaxler = #1/1/1980#
  
      sLigne = tcps.Re�oit
      If sLigne <> "->" Then MsgBox "STOP.11": Stop: Rel�cher: Exit Function
    Rel�cher
  Else
    dMaxler = #1/1/1980#  ' Valeur faible pour entra�ner le chargement depuis le cache disque
  End If


  Dim bOkCacheDisque As Boolean
  Dim tsCacheDisque As Date
  
  On Error Resume Next
  tsCacheDisque = FileDateTime(sNomCacheDisque)
  If Err Then tsCacheDisque = #1/1/1979#
  On Error GoTo 0
  bOkCacheDisque = tsCacheDisque >= dMaxler
  
  If bOkCacheDisque Then
    ' Si les donn�es en m�moire sont Ok, on ne relit pas
    If tsCacheDisque <= tsCache And cLangage = cLangageCache Then Exit Function
  
    If Not frmBase Is Nothing Then
      frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("LIsLecture", "Lecture de la liste des libell�s�")
      frmBase.sbStatus.Refresh
    End If
    
    Open sNomCacheDisque For Input As #1
    Dim sCl� As String
    Input #1, sCl�
    If sCl� <> "ler1" Then
      MsgBox2i "CO100", "Cache disque des libell�s ercem", "ler1", sCl�
      Stop
    End If
    Input #1, iNumler
    
    If Not frmBase Is Nothing Then frmBase.AfficheBarreProgression 0, iNumler, 0

    EffaceCollection cache
    i = 0
    Do Until EOF(1)
      ler.DiskRead 1
      
      ' On ajoute le Libell�Ercem dans le cache m�moire
      cache.Add ler.Copie, "L" & ler.ler_numler
      
      i = i + 1
      If Not frmBase Is Nothing Then frmBase.pbProgress.Value = i
    Loop
    Close #1
    bInitLibell�sErcem = True
    cLangageCache = cLangage
    tsCache = tsCacheDisque
  End If
  
  
  If Not bOkCacheDisque And (iMode = 0 Or iMode = 2) Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("LIsLecture", "Lecture de la liste des libell�s�")
    If iNumler > 0 Then frmBase.pbProgress.Max = iNumler

    EffaceCollection cache
    Bloquer
      br.Clear
      br.AddField 1     ' Enum�ration
      br.AddField LCase(App.EXEName)
      br.AddField cLangage
      tcps.Envoie "ELER " & br.Buffer

      i = 0
      Do
        sLigne = tcps.Re�oit
        If sLigne = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: ler.ler_numler = v
        br.GetField v: ler.ler_libelle = v
      
        ' On ajoute le libell� Ercem dans le cache
        On Error Resume Next
        cache.Add ler.Copie, "L" & ler.ler_numler
        If Err Then
          MsgBox2i "CO086", ler.ler_numler
          'MsgBox "Doublon de cl� de libell� : " & ler.ler_numler, vbExclamation, sNomApp
          'Stop
        End If
        On Error GoTo 0
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Rel�cher
    
    On Error Resume Next
    Open sNomCacheDisque For Output As #1
    If Err Then
      If Err <> 75 Then   ' Acc�s en lecture seule: on ignore silencieusement
        MsgBox "�chec � l'ouverture en �criture du cache disque '" & sNomCacheDisque & "'" & vbCrLf & vbCrLf & "Err=" & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf & "Pr�venez le service informatique !", vbExclamation, App.Title
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
    
    bInitLibell�sErcem = True
    cLangageCache = cLangage
    tsCache = dMaxler
  End If
  
  gler_iNbLibell�sErcem = cache.count
  If Not frmBase Is Nothing Then
    frmBase.pbProgress.Visible = False
    frmBase.sbStatus.Panels("Info").Text = ""
  End If
End Function



Function RechercheLibell�Ercem(ByVal sMotif As String) As Collection
  If IsEmpty(tsCache) Then
    MsgBox2i "CO084"
    'MsgBox "Erreur interne - Libell�s Ercem non lus", vbCritical, sNomApp
    Stop
  End If
  
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As Libell�Ercem
  For Each u In cache
    If UCase(u.ler_libelle) Like UCase(sMotif) Then c.Add u, "L" & u.ler_numler
  Next
  Set RechercheLibell�Ercem = c
End Function



' Traces internes
Sub ListeLibell�sErcem(lv As ListView)
  Dim itmX As ListItem

  lv.ListItems.Clear
  lv.ColumnHeaders(1).Text = "N�"
  lv.ColumnHeaders(2).Text = "Libell�"

  Dim l As Libell�Ercem
  For Each l In cache
    Set itmX = lv.ListItems.Add()
    itmX.Text = l.ler_numler
    itmX.SubItems(1) = l.ler_libelle
  Next
End Sub

