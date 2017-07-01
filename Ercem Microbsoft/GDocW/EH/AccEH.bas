Attribute VB_Name = "AccEH"
' AccEH
' Module d'acc�s aux EH
' 08/02/1999 PV

Option Explicit


' Retourne une structure grille/sc�nario
Public Function LitGrille(iGrille As Integer, iSc�nario As Integer) As EHDefGrille
  Dim br As New Rev, sLigne As String
  Bloquer
    br.AddField iGrille, iSc�nario, cLangage
    tcps.Envoie "LGR " & br.Buffer
    
    sLigne = tcps.Re�oit
    If sLigne = "->" Then    ' Echec en lecture
      Set LitGrille = Nothing
      Rel�cher
      Exit Function
    End If
    
    ' Ok pour le titre
    Dim sTitre1 As String, sTitre2 As String, sTitreSc�nario As String
    Dim sOptionsSc�nario As String, iFormatSc�nario As Integer
    br.Buffer = sLigne
    br.GetField sTitre1, sTitre2, sTitreSc�nario, sOptionsSc�nario, iFormatSc�nario
    
    Dim e As New EHDefGrille
    With e
      .iNumGrille = iGrille
      .iNumSc�nario = iSc�nario
      .sTitre1 = sTitre1
      .sTitre2 = sTitre2
      .sTitreSc�nario = sTitreSc�nario
      .iFormatSc�nario = iFormatSc�nario
      .sOptionsSc�nario = sOptionsSc�nario
    End With
    
    Do
      sLigne = tcps.Re�oit
      If sLigne = "->" Then Exit Do    ' Fin de la liste des items
      
      Dim iIndice As Integer, iNumit As Long, sNumloc As String, sNiveau As String
      Dim iD�cote As Integer, iFormat As Integer, iS�rie As Long, sTypeItem As String
      Dim sLibell� As String, sOptions As String
      br.Buffer = sLigne
      br.GetField iIndice, iNumit, sNumloc, sNiveau
      br.GetField iD�cote, iFormat, iS�rie, sTypeItem, sLibell�, sOptions
      
      Dim i As New EHDefItem
      With i
        .ziIndice = iIndice
        .iNumit = iNumit
        .sNumloc = sNumloc
        .iNiveau = Val(sNiveau)
        .iD�cote = iD�cote
        .iFormat = iFormat
        .iS�rie = iS�rie
        .sTypeItem = sTypeItem
        If InStr(sLibell�, "|") = 0 Then
          .sLibell� = sLibell�
          .sFormule = ""
        Else
          .sLibell� = Left(sLibell�, InStr(sLibell�, "|") - 1)
          .sFormule = Mid(sLibell�, InStr(sLibell�, "|") + 1)
        End If
        .sOptions = sOptions
      End With
      e.colItems.Add i, "I" & iS�rie
      Set i = Nothing
    Loop
  Rel�cher

  Set LitGrille = e
End Function

