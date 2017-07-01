Attribute VB_Name = "AccLibell�RA"
Attribute VB_Description = "Module d'acc�s aux libell�s CRA. Acc�s par num�ro, recherche�"
' Module d'acc�s aux libell�s RA
' Acc�s par num�ro, recherche�
' 22/07/1998 PV
' 27/07/1998 PV Fonctions d'acc�s simplifi�


Option Explicit

Private cache As New Collection

' Statistiques
Public glcr_iNbLibell�sRA As Integer



Public Function LireLibell�RA(iRessource As eRessource, iNumlcr As Integer) As Libell�RA
  If glcr_iNbLibell�sRA = 0 Then InitLibell�sRA
  
  On Error Resume Next
  Set LireLibell�RA = cache("F" & iRessource & "," & iNumlcr)
  If Err = 0 Then Exit Function
  Set LireLibell�RA = Nothing
End Function


Public Function sLibell�RA(ByVal iRessource As eRessource, ByVal iNumlcr As Integer) As String
  If glcr_iNbLibell�sRA = 0 Then InitLibell�sRA
  
  Dim l As Libell�RA
  On Error Resume Next
  Set l = cache("F" & iRessource & "," & iNumlcr)
  If Err = 0 Then
    On Error GoTo 0
    sLibell�RA = l.lcr_libelle
    Exit Function
  End If
  sLibell�RA = sprintf(sGetIntlLib("RAtxtLibell�Ra", "Libell� RA ressource %1 N� %2 inconnu"), iRessource, iNumlcr)
End Function



Sub InitLibell�sRA()
  Dim i As Integer, iNumlcr As Integer, iRessource As eRessource
  Dim lcr As New Libell�RA
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxlcr As Date
  
  sNomCacheDisque = App.Path & "\Cache libell�s CRA.dat"
  
  ' On r�cup�re le timestamp maxi du d�mon
  Bloquer
    tcps.Envoie "ELCR 0|""F"""
      
    sLigne = tcps.Re�oit
    If sLigne = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumlcr
    br.GetField dMaxlcr
    
    sLigne = tcps.Re�oit
    If sLigne <> "->" Then Stop: Exit Sub
  Rel�cher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxlcr
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR201", "Lecture de la liste des libell�s RA�")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumlcr
    frmBase.AfficheBarreProgression 0, iNumlcr, 0

    i = 0
    Do Until EOF(1)
      lcr.DiskRead 1
      
      ' On ajoute le Libell�RA dans le cache m�moire
      cache.Add lcr.Copie, "F" & lcr.lcr_ressource & "," & lcr.lcr_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR200", "R�cup�ration de la liste des libell�s RA�")
      
    frmBase.pbProgress.Max = iNumlcr

    Bloquer
      tcps.Envoie "ELCR 1|""F"""

      i = 0
      Do
        sLigne = tcps.Re�oit
        If sLigne = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: lcr.lcr_ressource = v
        br.GetField v: lcr.lcr_indice = v
        br.GetField v: lcr.lcr_langue = v
        br.GetField v: lcr.lcr_code = v
        br.GetField v: lcr.lcr_libelle = v
        br.GetField v: lcr.lcr_comment = v
        br.GetField v: lcr.timestamp = v
      
        ' On ajoute le libell� de RA dans le cache
        cache.Add lcr.Copie, "F" & lcr.lcr_ressource & "," & lcr.lcr_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Rel�cher
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR203", "Sauvegarde de la liste des libell�s RA�")
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each lcr In cache
      lcr.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxlcr
  End If
  
  glcr_iNbLibell�sRA = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheLibell�RA(iRessource As eRessource, ByVal sMotif As String) As Collection
  If glcr_iNbLibell�sRA = 0 Then InitLibell�sRA
  
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As Libell�RA
  For Each u In cache
    If UCase(u.lcr_libelle) Like UCase(sMotif) And u.lcr_ressource = iRessource Then c.Add u, "F" & iRessource & "," & u.lcr_indice
  Next
  Set RechercheLibell�RA = c
End Function



' Traces internes
Sub ListeLibell�sRA(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "Ress"
  lw.ColumnHeaders(2).Text = "N�"
  lw.ColumnHeaders(3).Text = "Libell�"
  lw.ColumnHeaders(4).Text = "Code"

  Dim l As Libell�RA
  For Each l In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = l.lcr_ressource
    itmX.SubItems(1) = l.lcr_indice
    itmX.SubItems(2) = l.lcr_libelle
    itmX.SubItems(3) = l.lcr_code
  Next
End Sub

