Attribute VB_Name = "AccLettre"
Attribute VB_Description = "Module d'acc�s aux lettres. Gestion des lettres, personnes, �"
' Module d'acc�s aux lettres
' 20/07/1998 PV
' 22/07/1998 PV Date+Heure du fichier cache = max(timestamp)
'  4/08/1998 PV bOkLettresAssistant v�rifie si les lettres sont *r�ellement* prises en charges par le syst�me distant
' 17/12/1998 PV Dans sNomAssistant, cas o� les lettres ne sont plus affect�es
' 25/01/1999 PV Internationalisation
' 25/08/1999 PV Cas o� le programme est lanc� d'une unit� en lecture seule, pas d'�chec � la cr�ation du cache disque
' 21/09/2000 PV Param�tre cSurSyst�me � bOkLettresAssistant; sSyst�meG�rantLesLettres


Option Explicit

Private cache As New Collection

' Statistiques
Public glet_iNbLettres As Integer



Public Function letParLettres(sLettres As String) As Lettre
  On Error Resume Next
  Set letParLettres = cache(sLettres)
  If Err = 0 Then Exit Function
  Set letParLettres = Nothing
End Function

Public Function UtiParLettres(sLettres As String) As Utilisateur
  Dim l As Lettre
  
  AssertOkLettres sLettres
  Set l = letParLettres(sLettres)
  If l Is Nothing Then
    Set UtiParLettres = Nothing
  Else
    Set UtiParLettres = UtiParNum�ro(l.let_pers)
  End If
End Function

Public Function sNomAssistant(sLettres As String) As String
  Dim l As Lettre
  
  If sLettres = "@A" Then
    sNomAssistant = "Marqueur de cl�ture"
    Exit Function
  End If
  
  AssertOkLettres sLettres
  Set l = letParLettres(sLettres)
  If l Is Nothing Then
    sNomAssistant = sGetIntlLib("LEsNoAssist", "Ces lettres ne sont plus affect�es � un assistant")
  Else
    sNomAssistant = sNomUtilisateur(l.let_pers)
  End If
End Function

Public Function iUnit�D�faut(sLettres As String)
  Dim l As Lettre
  
  AssertOkLettres sLettres
  Set l = letParLettres(sLettres)
  If l Is Nothing Then
    iUnit�D�faut = 0
  Else
    iUnit�D�faut = l.let_unite
  End If
End Function

Public Function sListeLettres(iPers As Integer) As String
  Dim s As String, l As Lettre
  For Each l In cache
    If l.let_pers = iPers Then
      If s <> "" Then s = s & ";"
      s = s & l.let_lettres & "/" & l.let_systeme
    End If
  Next
  sListeLettres = s
End Function


' V�rifie si les lettres sont prises en charges par le syst�me distant
Public Function bOkLettresAssistant(sLettres As String, cSurSyst�me As String) As Boolean
  If Left(sLettres, 1) = "@" Then   ' Lettres sp�ciales, valides partout
    bOkLettresAssistant = True
    Exit Function
  End If
  
  Dim l As Lettre
  bOkLettresAssistant = False
  On Error Resume Next
  Set l = cache(sLettres)
  If Err Then
    bOkLettresAssistant = False
  Else
    If cSurSyst�me = "*" Then
      bOkLettresAssistant = True
    Else
      bOkLettresAssistant = l.let_systeme = cSyst�meCA
    End If
  End If
End Function


Public Function sLettreSyst�meG�rantLesLettres(sLettres As String) As String
  Dim l As Lettre
  On Error Resume Next
  Set l = cache(sLettres)
  If Not Err Then
    sLettreSyst�meG�rantLesLettres = l.let_systeme
  End If
End Function



Sub InitLettres(dMaxLettreD�mon As Date)
  Dim i As Integer, iNumlet As Integer
  Dim nl As New Lettre
  Dim sNomCacheDisque As String
  sNomCacheDisque = App.Path & "\Cache lettres 2.dat"
  
  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxLettreD�mon
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("LEsLecture", "Lecture de la liste des lettres�")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumlet
    frmBase.AfficheBarreProgression 0, iNumlet, 0
    i = 0
    Do Until EOF(1)
      nl.DiskRead 1
      
      ' On ajoute la lettre dans le cache m�moire
      cache.Add nl.Copie, nl.let_lettres
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    Dim br As New Rev, sLigne As String
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("LEsLecture", "Lecture de la liste des lettres�")
    Bloquer
      tcps.Envoie "ELET"
      
      sLigne = tcps.Re�oit
      If sLigne = "->" Then Exit Sub
      br.Buffer = sLigne
      br.GetField iNumlet
      
      frmBase.pbProgress.Max = iNumlet
      i = 0
      Do
        sLigne = tcps.Re�oit
        If sLigne = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: nl.let_lettres = v
        br.GetField v: nl.let_systeme = v
        br.GetField v: nl.let_pers = v
        br.GetField v: nl.let_unite = v
        br.GetField v: nl.let_secret = v
        br.GetField v: nl.let_labo = v
      
        ' On ajoute la lettre dans le cache
        cache.Add nl.Copie, nl.let_lettres
        
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
      Write #1, cache.count
      For Each nl In cache
        nl.DiskWrite 1
      Next
      Close #1
      SetFileDateTime sNomCacheDisque, dMaxLettreD�mon
    End If
    
  End If
  
  glet_iNbLettres = cache.count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheLettres(ByVal sMotif As String) As Collection
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim l As Lettre
  For Each l In cache
    If UCase(sNomUtilisateur(l.let_pers)) Like UCase(sMotif) Then c.Add l
  Next
  Set RechercheLettres = c
End Function


' Traces internes
Sub ListeLettres(lv As ListView)
  Dim itmX As ListItem

  lv.ListItems.Clear
  lv.ColumnHeaders(1).Text = "Lettres"
  lv.ColumnHeaders(2).Text = "Personne"
  lv.ColumnHeaders(3).Text = "Unit�"

  Dim l As Lettre
  For Each l In cache
    Set itmX = lv.ListItems.Add()
    itmX.Text = l.let_lettres
    itmX.SubItems(1) = l.let_pers
    itmX.SubItems(2) = l.let_unite
  Next
End Sub
