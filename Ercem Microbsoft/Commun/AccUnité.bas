Attribute VB_Name = "AccUnité"
Attribute VB_Description = "Module d'accès aux unités"
' module AccUnité
' Module d'accès aux unités
' Novembre 96 PV
' 22/07/1998 PV Date+Heure du fichier cache = max(timestamp)
' 25/01/1999 PV Internationalisation
' 25/08/1999 PV Cas où le programme est lancé d'une unité en lecture seule, pas d'échec à la création du cache disque


Option Explicit

Private cache As New Collection

' Statistiques
Public guni_iNbUnités As Integer


Sub InitUnités(dMaxUnitéMSD As Date)
  Dim i As Integer, iNumUni As Integer
  Dim un As New Unite
  Dim sNomCacheDisque As String
  sNomCacheDisque = App.Path & "\Cache unités 2.dat"

  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxUnitéMSD
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("UNsLecture", "Lecture de la liste des unités…")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumUni
    frmBase.AfficheBarreProgression 0, iNumUni, 0
    i = 0
    Do Until EOF(1)
      un.DiskRead 1
      
      ' On ajoute l'utilisateur dans le cache mémoire
      cache.Add un.Copie, "U" & un.uni_numunite
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    Dim br As New Rev, sLigne As String
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("UNsLecture", "Lecture de la liste des unités…")
    Bloquer
      tcps.Envoie "EUNI"
      
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Relâcher: Exit Sub
      br.Buffer = sLigne
      br.GetField iNumUni
      
      frmBase.pbProgress.Max = iNumUni
      i = 0
      Do
        sLigne = tcps.Reçoit
        If sLigne = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: un.uni_numunite = v
        br.GetField v: un.uni_code = v
        br.GetField v: un.uni_type = v
        br.GetField v: un.uni_titre = v
        br.GetField v: un.uni_adr1 = v
        br.GetField v: un.uni_adr2 = v
        br.GetField v: un.uni_adr3 = v
        br.GetField v: un.uni_telfax = v
      
        ' On ajoute l'utilisateur dans le cache
        cache.Add un.Copie, "U" & un.uni_numunite
        
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
      For Each un In cache
        un.DiskWrite 1
      Next
      Close #1
      SetFileDateTime sNomCacheDisque, dMaxUnitéMSD
    End If

  End If
  
  guni_iNbUnités = cache.count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub

Public Function UniParNuméro(iNumUni As Integer) As Unite
  On Error Resume Next
  Set UniParNuméro = cache("U" & iNumUni)
  If Err = 0 Then Exit Function
  UniParNuméro = Nothing
End Function

Public Function sCodeUnité(iNumUni) As String
  Dim u As Unite
  On Error Resume Next
  Set u = cache("U" & iNumUni)
  If Err = 0 Then
    sCodeUnité = u.uni_numunite & " " & u.uni_code
  Else
    sCodeUnité = "???"
  End If
End Function


Function RechercheUnité(ByVal sMotif As String) As Collection
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As Unite
  For Each u In cache
    If UCase(u.uni_code & u.uni_titre) Like UCase(sMotif) Then c.Add u, "U" & u.uni_numunite
  Next
  Set RechercheUnité = c
End Function

