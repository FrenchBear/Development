Attribute VB_Name = "AccUtilisateur"
Attribute VB_Description = "Module d'accès aux utilisateurs. Gestion des lettres, personnes, …"
' Module d'accès aux utilisateurs
' Gestion des lettres, personnes, …
' PV novembre 96
' 11/09/1997 PV bOkLettresAssistant vérifie que les lettres sont prises en charge par le système distant
' 22/07/1998 PV Date+Heure du fichier cache = max(timestamp)
' 25/01/1999 PV Internationalisation
' 25/08/1999 PV Cas où le programme est lancé d'une unité en lecture seule, pas d'échec à la création du cache disque
' 30/03/2000 PV EUTI2/Cache utilisateurs 3, gestion du code BAL


Option Explicit

Private cache As New Collection

' Statistiques
Public guti_iNbUtilisateurs As Integer


Public Function UtiParNuméro(iNumUti As Integer) As Utilisateur
  On Error Resume Next
  Set UtiParNuméro = cache("U" & iNumUti)
  If Err = 0 Then Exit Function
  Set UtiParNuméro = Nothing
End Function


Public Function sNomUtilisateur(ByVal iNumUti) As String
  If VarType(iNumUti) = vbNull Then
    sNomUtilisateur = ""
    Exit Function
  End If
  If iNumUti = 0 Then
    sNomUtilisateur = ""
    Exit Function
  End If
  
  Dim u As Utilisateur
  On Error Resume Next
  Set u = cache("U" & iNumUti)
  If Err = 0 Then
    On Error GoTo 0
    sNomUtilisateur = u.uti_nom
    Exit Function
  End If
  sNomUtilisateur = sprintf(sGetIntlLib("CR317", "Utilisateur %1 inconnu"), iNumUti)
End Function


Sub InitUtilisateurs(dMaxUtilisateurDémon As Date)
  Dim i As Integer, iNumUti As Integer
  Dim ut As New Utilisateur
  Dim sNomCacheDisque As String
  sNomCacheDisque = App.Path & "\Cache utilisateurs 3.dat"
  
  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxUtilisateurDémon
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("UTsLecture", "Lecture de la liste des utilisateurs…")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumUti
    frmBase.AfficheBarreProgression 0, iNumUti, 0
    i = 0
    Do Until EOF(1)
      ut.DiskRead 1
      
      ' On ajoute l'utilisateur dans le cache mémoire
      cache.Add ut.Copie, "U" & ut.uti_numuti
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    Dim br As New Rev, sLigne As String
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("UTsLecture", "Lecture de la liste des utilisateurs…")
    Bloquer
      tcps.Envoie "EUTI2"
      
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Exit Sub
      br.Buffer = sLigne
      br.GetField iNumUti
      
      frmBase.pbProgress.Max = iNumUti
      i = 0
      Do
        sLigne = tcps.Reçoit
        If sLigne = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: ut.uti_numuti = v
        br.GetField v: ut.uti_nom = v
        br.GetField v: ut.uti_bal = v
        br.GetField v: ut.uti_unite = v
        br.GetField v: ut.uti_systemes = v
        br.GetField v: ut.uti_niveau = v
      
        ' On ajoute l'utilisateur dans le cache
        cache.Add ut.Copie, "U" & ut.uti_numuti
        
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
      Write #1, cache.count
      For Each ut In cache
        ut.DiskWrite 1
      Next
      Close #1
      SetFileDateTime sNomCacheDisque, dMaxUtilisateurDémon
    End If

  End If
  
  guti_iNbUtilisateurs = cache.count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheUtilisateur(ByVal sMotif As String) As Collection
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As Utilisateur
  For Each u In cache
    If UCase(u.uti_nom) Like UCase(sMotif) Then c.Add u, "U" & u.uti_numuti
  Next
  Set RechercheUtilisateur = c
End Function


' Traces internes
Sub ListeUtilisateurs(lv As ListView)
  Dim itmX As ListItem

  lv.ListItems.Clear
  lv.ColumnHeaders(1).Text = "N°"
  lv.ColumnHeaders(2).Text = "Unité"
  lv.ColumnHeaders(3).Text = "Nom"
  lv.ColumnHeaders(4).Text = "Niveau"

  Dim u As Utilisateur
  For Each u In cache
    Set itmX = lv.ListItems.Add()
    itmX.Text = u.uti_numuti
    itmX.SubItems(1) = NV(u.uti_unite)
    itmX.SubItems(2) = u.uti_nom
    itmX.SubItems(3) = NZ(u.uti_niveau)
  Next
End Sub
