Attribute VB_Name = "AccLieuDePr�l�vement"
Attribute VB_Description = "Module d'acc�s aux lieux de pr�l�vement. Acc�s par num�ro, recherche�"
' Module d'acc�s aux lieux de pr�l�vement
' Acc�s par num�ro, recherche�
'  2/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public glip_iNbLieuxDePr�l�vement As Integer

' Ok pas tr�s �l�gant, mais pratique�
Function CollectionLieuxDePr�l�vement() As Collection
  Set CollectionLieuxDePr�l�vement = cache
End Function


Public Function LireLieuDePr�l�vement(iNumlip As Integer) As LieuDePr�l�vement
  If glip_iNbLieuxDePr�l�vement = 0 Then InitLieuxDePr�l�vement
  
  On Error Resume Next
  Set LireLieuDePr�l�vement = cache("F" & iNumlip)
  If Err = 0 Then Exit Function
  Set LireLieuDePr�l�vement = Nothing
End Function


Public Function sLibell�LieuDePr�l�vement(ByVal iNumlip As Integer) As String
  If glip_iNbLieuxDePr�l�vement = 0 Then InitLieuxDePr�l�vement
  
  Dim l As LieuDePr�l�vement
  On Error Resume Next
  Set l = cache("F" & iNumlip)
  If Err = 0 Then
    On Error GoTo 0
    sLibell�LieuDePr�l�vement = l.lip_libelle
    Exit Function
  End If
  sLibell�LieuDePr�l�vement = "LieuDePr�l�vement " & iNumlip & " inconnu"
End Function



Sub InitLieuxDePr�l�vement()
  Dim i As Integer, iNumlip As Integer
  Dim lip As New LieuDePr�l�vement
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxlip As Date
  
  sNomCacheDisque = App.Path & "\Cache lieux de pr�l�vement.dat"
  
  ' On r�cup�re le timestamp maxi du d�mon
  Bloquer
    tcps.Envoie "Elip 0|""F"""
      
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumlip
    br.GetField dMaxlip
    
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop: Exit Sub
  Rel�cher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxlip
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = "Lecture de la liste des lieux de pr�l�vement�"
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumlip
    frmBase.AfficheBarreProgression 0, iNumlip, 0

    i = 0
    Do Until EOF(1)
      lip.DiskRead 1
      
      ' On ajoute le lieu de pr�l�vement dans le cache m�moire
      cache.Add lip.Copie, "F" & lip.lip_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = "R�cup�ration de la liste des lieux de pr�l�vement�"
      
    frmBase.pbProgress.Max = iNumlip

    Bloquer
      tcps.Envoie "Elip 1|""F"""

      i = 0
      Do
        sLigne = tcps.Re�oit
        If Left(sLigne, 2) = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: lip.lip_indice = v
        br.GetField v: lip.lip_langue = v
        br.GetField v: lip.lip_libelle = v
        br.GetField v: lip.lip_comment = v
        br.GetField v: lip.lip_datecreat = v
        br.GetField v: lip.lip_heurecreat = v
        br.GetField v: lip.lip_opercreat = v
        br.GetField v: lip.lip_datemodif = v
        br.GetField v: lip.lip_heuremodif = v
        br.GetField v: lip.lip_opermodif = v
        br.GetField v: lip.timestamp = v
      
        ' On ajoute le lieu de pr�l�vement dans le cache
        cache.Add lip.Copie, "F" & lip.lip_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Rel�cher
    
    frmBase.sbStatus.Panels("Info").Text = "Sauvegarde de la liste des lieux de pr�l�vement�"
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each lip In cache
      lip.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxlip
  End If
  
  glip_iNbLieuxDePr�l�vement = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheLieuDePr�l�vement(ByVal sMotif As String) As Collection
  If glip_iNbLieuxDePr�l�vement = 0 Then InitLieuxDePr�l�vement
  
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As LieuDePr�l�vement
  For Each u In cache
    If UCase(u.lip_libelle) Like UCase(sMotif) Then c.Add u, "F" & u.lip_indice
  Next
  Set RechercheLieuDePr�l�vement = c
End Function


' Traces internes
Sub ListeLieuxDePr�l�vement(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N�"
  lw.ColumnHeaders(2).Text = "Langue"
  lw.ColumnHeaders(3).Text = "Libell�"
  lw.ColumnHeaders(4).Text = " "

  Dim l As LieuDePr�l�vement
  For Each l In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = l.lip_indice
    itmX.SubItems(1) = l.lip_langue
    itmX.SubItems(2) = l.lip_libelle
    itmX.SubItems(3) = ""
  Next
End Sub

