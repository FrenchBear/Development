Attribute VB_Name = "AccCadreDePr�l�vement"
Attribute VB_Description = "Acc�s aux cadres de pr�l�vement par num�ro, recherche�"
' AccCadreDePr�l�vement
' Acc�s aux cadres de pr�l�vement par num�ro, recherche�
'  2/09/1997 PV
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public gcpr_iNbCadresDePr�l�vement As Integer

' Ok pas tr�s �l�gant, mais pratique�
Function CollectionCadresDePr�l�vement() As Collection
  Set CollectionCadresDePr�l�vement = cache
End Function


Public Function LireCadreDePr�l�vement(iNumcpr As Integer) As CadreDePr�l�vement
  If gcpr_iNbCadresDePr�l�vement = 0 Then InitCadresDePr�l�vement
  
  On Error Resume Next
  Set LireCadreDePr�l�vement = cache("F" & iNumcpr)
  If Err = 0 Then Exit Function
  Set LireCadreDePr�l�vement = Nothing
End Function


Public Function sLibell�CadreDePr�l�vement(ByVal iNumcpr As Integer) As String
  If gcpr_iNbCadresDePr�l�vement = 0 Then InitCadresDePr�l�vement
  
  Dim u As CadreDePr�l�vement
  On Error Resume Next
  Set u = cache("F" & iNumcpr)
  If Err = 0 Then
    On Error GoTo 0
    sLibell�CadreDePr�l�vement = u.cpr_libelle
    Exit Function
  End If
  sLibell�CadreDePr�l�vement = "Cadre de pr�l�vement " & iNumcpr & " inconnu"
End Function



Sub InitCadresDePr�l�vement()
  Dim i As Integer, iNumcpr As Integer
  Dim cpr As New CadreDePr�l�vement
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxcpr As Date
  
  sNomCacheDisque = App.Path & "\Cache cadres de pr�l�vement.dat"
  
  ' On r�cup�re le timestamp maxi du d�mon
  Bloquer
    tcps.Envoie "Ecpr 0|""F"""
      
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumcpr
    br.GetField dMaxcpr
    
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop: Exit Sub
  Rel�cher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxcpr
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = "Lecture de la liste des cadres de pr�l�vement�"
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumcpr
    frmBase.AfficheBarreProgression 0, iNumcpr, 0

    i = 0
    Do Until EOF(1)
      cpr.DiskRead 1
      
      ' On ajoute le cadre de pr�l�vement dans le cache m�moire
      cache.Add cpr.Copie, "F" & cpr.cpr_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = "R�cup�ration de la liste des cadres de pr�l�vement�"
      
    frmBase.pbProgress.Max = iNumcpr

    Bloquer
      tcps.Envoie "Ecpr 1|""F"""

      i = 0
      Do
        sLigne = tcps.Re�oit
        If Left(sLigne, 2) = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: cpr.cpr_indice = v
        br.GetField v: cpr.cpr_langue = v
        br.GetField v: cpr.cpr_libelle = v
        br.GetField v: cpr.cpr_codegr = v
        br.GetField v: cpr.cpr_comment = v
        br.GetField v: cpr.cpr_datecreat = v
        br.GetField v: cpr.cpr_heurecreat = v
        br.GetField v: cpr.cpr_opercreat = v
        br.GetField v: cpr.cpr_datemodif = v
        br.GetField v: cpr.cpr_heuremodif = v
        br.GetField v: cpr.cpr_opermodif = v
        br.GetField v: cpr.timestamp = v
      
        ' On ajoute l'CadreDePr�l�vement dans le cache
        cache.Add cpr.Copie, "F" & cpr.cpr_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Rel�cher
    
    frmBase.sbStatus.Panels("Info").Text = "Sauvegarde de la liste des cadres de pr�l�vement�"
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each cpr In cache
      cpr.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxcpr
  End If
  
  gcpr_iNbCadresDePr�l�vement = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheCadreDePr�l�vement(ByVal sMotif As String) As Collection
  If gcpr_iNbCadresDePr�l�vement = 0 Then InitCadresDePr�l�vement
  
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As CadreDePr�l�vement
  For Each u In cache
    If UCase(u.cpr_libelle) Like UCase(sMotif) Then c.Add u, "F" & u.cpr_indice
  Next
  Set RechercheCadreDePr�l�vement = c
End Function


' Traces internes
Sub ListeCadresDePr�l�vement(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N�"
  lw.ColumnHeaders(2).Text = "Langue"
  lw.ColumnHeaders(3).Text = "Libell�"
  lw.ColumnHeaders(4).Text = " "

  Dim c As CadreDePr�l�vement
  For Each c In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = c.cpr_indice
    itmX.SubItems(1) = c.cpr_langue
    itmX.SubItems(2) = c.cpr_libelle
    itmX.SubItems(3) = ""
  Next
End Sub

