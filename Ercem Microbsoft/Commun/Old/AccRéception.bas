Attribute VB_Name = "AccR�ception"
Attribute VB_Description = "Module d'acc�s aux aspects � r�ception. Acc�s par num�ro, recherche.."
' Module d'acc�s aux aspects � r�ception
' Acc�s par num�ro, recherche�
' 17/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public grec_iNbR�ceptions As Integer

' Ok pas tr�s �l�gant, mais pratique�
Function CollectionR�ceptions() As Collection
  Set CollectionR�ceptions = cache
End Function


Public Function LireR�ception(iNumrec As Integer) As R�ception
  If grec_iNbR�ceptions = 0 Then InitR�ceptions
  
  On Error Resume Next
  Set LireR�ception = cache("F" & iNumrec)
  If Err = 0 Then Exit Function
  Set LireR�ception = Nothing
End Function


Public Function sLibell�R�ception(ByVal iNumrec As Integer) As String
  If grec_iNbR�ceptions = 0 Then InitR�ceptions
  
  Dim c As R�ception
  On Error Resume Next
  Set c = cache("F" & iNumrec)
  If Err = 0 Then
    On Error GoTo 0
    sLibell�R�ception = c.rec_libelle
    Exit Function
  End If
  sLibell�R�ception = "Aspect � r�ception " & iNumrec & " inconnu"
End Function



Sub InitR�ceptions()
  Dim i As Integer, iNumrec As Integer
  Dim rec As New R�ception
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxrec As Date
  
  sNomCacheDisque = App.Path & "\Cache aspects � r�ception.dat"
  
  ' On r�cup�re le timestamp maxi du d�mon
  Bloquer
    tcps.Envoie "Erec 0|""F"""
      
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumrec
    br.GetField dMaxrec
    
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop: Exit Sub
  Rel�cher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxrec
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = "Lecture de la liste des aspects � r�ception�"
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumrec
    frmBase.AfficheBarreProgression 0, iNumrec, 0
    
    i = 0
    Do Until EOF(1)
      rec.DiskRead 1
      
      ' On ajoute le R�ception dans le cache m�moire
      cache.Add rec.Copie, "F" & rec.rec_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = "R�cup�ration de la liste des aspects � r�ception�"
      
    frmBase.pbProgress.Max = iNumrec

    Bloquer
      tcps.Envoie "Erec 1|""F"""

      i = 0
      Do
        sLigne = tcps.Re�oit
        If Left(sLigne, 2) = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: rec.rec_indice = v
        br.GetField v: rec.rec_langue = v
        br.GetField v: rec.rec_libelle = v
        br.GetField v: rec.rec_comment = v
        br.GetField v: rec.rec_datecreat = v
        br.GetField v: rec.rec_heurecreat = v
        br.GetField v: rec.rec_opercreat = v
        br.GetField v: rec.rec_datemodif = v
        br.GetField v: rec.rec_heuremodif = v
        br.GetField v: rec.rec_opermodif = v
        br.GetField v: rec.timestamp = v
      
        ' On ajoute l'R�ception dans le cache
        cache.Add rec.Copie, "F" & rec.rec_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Rel�cher
    
    frmBase.sbStatus.Panels("Info").Text = "Sauvegarde de la liste des aspects � r�ceptions�"
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each rec In cache
      rec.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxrec
  End If
  
  grec_iNbR�ceptions = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheR�ception(ByVal sMotif As String) As Collection
  If grec_iNbR�ceptions = 0 Then InitR�ceptions

  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As R�ception
  For Each u In cache
    If UCase(u.rec_libelle) Like UCase(sMotif) Then c.Add u, "F" & u.rec_indice
  Next
  Set RechercheR�ception = c
End Function


' Traces internes
Sub ListeR�ceptions(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N�"
  lw.ColumnHeaders(2).Text = "Langue"
  lw.ColumnHeaders(3).Text = "Libell�"
  lw.ColumnHeaders(4).Text = " "

  Dim c As R�ception
  For Each c In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = c.rec_indice
    itmX.SubItems(1) = c.rec_langue
    itmX.SubItems(2) = c.rec_libelle
    itmX.SubItems(3) = ""
  Next
End Sub

