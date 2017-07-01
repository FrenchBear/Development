Attribute VB_Name = "AccConclusion"
Attribute VB_Description = "Accès aux conclusions par numéro, recherche…"
' module AccConclusion
' Accès aux conclusions par numéro, recherche…
'  2/09/1997
' 17/09/1997 +sLibelléCPrin/sLibelléCPar (codé en dur)
' 23/07/1998 PV Gestion correcte du timestamp du cache

Option Explicit

Private cache As New Collection

' Statistiques
Public gcon_iNbConclusions As Integer


Public Function LireConclusion(iNumcon As Integer) As Conclusion
  If gcon_iNbConclusions = 0 Then InitConclusions
  
  On Error Resume Next
  Set LireConclusion = cache("F" & iNumcon)
  If Err = 0 Then Exit Function
  Set LireConclusion = Nothing
End Function


Public Function sLibelléConclusion(ByVal iNumcon As Integer) As String
  If gcon_iNbConclusions = 0 Then InitConclusions
  
  Dim c As Conclusion
  On Error Resume Next
  Set c = cache("F" & iNumcon)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléConclusion = c.con_libelle
    Exit Function
  End If
  sLibelléConclusion = sprintf(sGetIntlLib("CR192", "Conclusion %1 inconnu"), iNumcon)
End Function



Sub InitConclusions()
  Dim i As Integer, iNumcon As Integer
  Dim con As New Conclusion
  Dim sNomCacheDisque As String
  Dim br As New Rev, sLigne As String
  Dim dMaxcon As Date
  
  sNomCacheDisque = App.Path & "\Cache conclusions.dat"
  
  ' On récupère le timestamp maxi du démon
  Bloquer
    tcps.Envoie "ECON 0|""F"""
      
    sLigne = tcps.Reçoit
    If sLigne = "->" Then Exit Sub
    br.Buffer = sLigne
    br.GetField iNumcon
    br.GetField dMaxcon
    
    sLigne = tcps.Reçoit
    If sLigne <> "->" Then Stop: Exit Sub
  Relâcher


  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxcon
  If Err Then bOkCacheDisque = False
  On Error GoTo 0
  
  If bOkCacheDisque Then
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR193", "Lecture de la liste des conclusions…")
    frmBase.sbStatus.Refresh
    
    Open sNomCacheDisque For Input As #1
    
    Input #1, iNumcon
    frmBase.AfficheBarreProgression 0, iNumcon, 0

    i = 0
    Do Until EOF(1)
      con.DiskRead 1
      
      ' On ajoute la conclusion dans le cache mémoire
      cache.Add con.Copie, "F" & con.con_indice
      
      i = i + 1
      frmBase.pbProgress.Value = i
    Loop
    Close #1
    
  Else
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR194", "Récupération de la liste des conclusions…")
      
    frmBase.pbProgress.Max = iNumcon

    Bloquer
      tcps.Envoie "Econ 1|""F"""

      i = 0
      Do
        sLigne = tcps.Reçoit
        If sLigne = "->" Then Exit Do
        
        br.Buffer = sLigne
        
        Dim v As Variant
        br.GetField v: con.con_indice = v
        br.GetField v: con.con_langue = v
        br.GetField v: con.con_libelle = v
        br.GetField v: con.con_cprin = v
        br.GetField v: con.con_abrege = v
        br.GetField v: con.con_options = v
        br.GetField v: con.con_etat = v
        br.GetField v: con.con_comment = v
        br.GetField v: con.con_datecreat = v
        br.GetField v: con.con_heurecreat = v
        br.GetField v: con.con_opercreat = v
        br.GetField v: con.con_datemodif = v
        br.GetField v: con.con_heuremodif = v
        br.GetField v: con.con_opermodif = v
        br.GetField v: con.timestamp = v
      
        ' On ajoute l'Conclusion dans le cache
        cache.Add con.Copie, "F" & con.con_indice
        
        i = i + 1
        frmBase.pbProgress.Value = i
      Loop
    Relâcher
    
    frmBase.sbStatus.Panels("Info").Text = sGetIntlLib("CR195", "Sauvegarde de la liste des conclusions…")
    frmBase.sbStatus.Refresh
    Open sNomCacheDisque For Output As #1
    Write #1, cache.Count
    For Each con In cache
      con.DiskWrite 1
    Next
    Close #1
    SetFileDateTime sNomCacheDisque, dMaxcon
  End If
  
  gcon_iNbConclusions = cache.Count
  frmBase.pbProgress.Visible = False
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Function RechercheConclusion(ByVal sMotif As String) As Collection
  If gcon_iNbConclusions = 0 Then InitConclusions
  
  sMotif = "*" & sMotif & "*"
  Dim c As New Collection
  Dim u As Conclusion
  For Each u In cache
    If UCase(u.con_libelle) Like UCase(sMotif) Then c.Add u, "F" & u.con_indice
  Next
  Set RechercheConclusion = c
End Function



' Traces internes
Sub ListeConclusions(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = sGetIntlLib("RCchNo", "N°")
  lw.ColumnHeaders(2).Text = sGetIntlLib("RCchLangue", "Langue")
  lw.ColumnHeaders(3).Text = sGetIntlLib("RCchLibellé", "Libellé")
  lw.ColumnHeaders(4).Text = sGetIntlLib("RCchCprin", "CPrin")

  Dim c As Conclusion
  For Each c In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = c.con_indice
    itmX.SubItems(1) = c.con_langue
    itmX.SubItems(2) = c.con_libelle
    itmX.SubItems(3) = c.con_cprin
  Next
End Sub


Public Function sLibelléCPrin(ByVal hCPrin) As String
  If hCPrin = "" Then
    sLibelléCPrin = ""
    Exit Function
  End If
  Select Case hCPrin
    Case 1: sLibelléCPrin = "Très satisfaisant"
    Case 2: sLibelléCPrin = "Satisfaisant"
    Case 3: sLibelléCPrin = "Acceptable"
    Case 4: sLibelléCPrin = "Acceptable sous réserves"
    Case 5: sLibelléCPrin = "Non satisfaisant"
    Case 6: sLibelléCPrin = "Corrompu"
    Case Else: sLibelléCPrin = "? " & hCPrin
  End Select
End Function

Public Function sLibelléCPar(ByVal hCPar) As String
  If hCPar = "" Or IsNull(hCPar) Then
    sLibelléCPar = ""
    Exit Function
  End If
  Select Case hCPar
    Case 1: sLibelléCPar = "TSAT"
    Case 2: sLibelléCPar = "Sat"
    Case 3: sLibelléCPar = "Acc"
    Case 4: sLibelléCPar = "ASR"
    Case 5: sLibelléCPar = "NS"
    Case 6: sLibelléCPar = "COR"
    Case 7: sLibelléCPar = "NSI"
    Case Else: sLibelléCPar = "? " & hCPar
  End Select
End Function

