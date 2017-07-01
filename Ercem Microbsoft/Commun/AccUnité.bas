Attribute VB_Name = "AccUnit�"
Attribute VB_Description = "Module d'acc�s aux unit�s"
' module AccUnit�
' Module d'acc�s aux unit�s
' Novembre 96 PV
' 22/07/1998 PV Date+Heure du fichier cache = max(timestamp)
' 25/01/1999 PV Internationalisation
' 25/08/1999 PV Cas o� le programme est lanc� d'une unit� en lecture seule, pas d'�chec � la cr�ation du cache disque


Option Explicit

Private cache As New Collection

' Statistiques
Public guni_iNbUnit�s As Integer


Sub InitUnit�s(dMaxUnit�MSD As Date)
  Dim i As Integer, iNumUni As Integer
  Dim un As New Unite
  Dim sNomCacheDisque As String
  sNomCacheDisque = App.Path & "\Cache unit�s 2.dat"

  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxUnit�MSD
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("UNsLecture", "Lecture de la liste des unit�s�")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumUni
    frmBase.AfficheBarreProgression 0, iNumUni, 0
    i = 0
    Do Until EOF(1)
      un.DiskRead 1
      
      ' On ajoute l'utilisateur dans le cache m�moire
      cache.Add un.Copie, "U" & un.uni_numunite
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    Dim br As New Rev, sLigne As String
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("UNsLecture", "Lecture de la liste des unit�s�")
    Bloquer
      tcps.Envoie "EUNI"
      
      sLigne = tcps.Re�oit
      If sLigne = "->" Then Rel�cher: Exit Sub
      br.Buffer = sLigne
      br.GetField iNumUni
      
      frmBase.pbProgress.Max = iNumUni
      i = 0
      Do
        sLigne = tcps.Re�oit
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
      For Each un In cache
        un.DiskWrite 1
      Next
      Close #1
      SetFileDateTime sNomCacheDisque, dMaxUnit�MSD
    End If

  End If
  
  guni_iNbUnit�s = cache.count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub

Public Function UniParNum�ro(iNumUni As Integer) As Unite
  On Error Resume Next
  Set UniParNum�ro = cache("U" & iNumUni)
  If Err = 0 Then Exit Function
  UniParNum�ro = Nothing
End Function

Public Function sCodeUnit�(iNumUni) As String
  Dim u As Unite
  On Error Resume Next
  Set u = cache("U" & iNumUni)
  If Err = 0 Then
    sCodeUnit� = u.uni_numunite & " " & u.uni_code
  Else
    sCodeUnit� = "???"
  End If
End Function


Function RechercheUnit�(ByVal sMotif As String) As Collection
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As Unite
  For Each u In cache
    If UCase(u.uni_code & u.uni_titre) Like UCase(sMotif) Then c.Add u, "U" & u.uni_numunite
  Next
  Set RechercheUnit� = c
End Function

