Attribute VB_Name = "AccEH"
' AccEH
' Module d'accès aux EH
' 08/02/1999 PV

Option Explicit


' Retourne une structure grille/scénario
Public Function LitGrille(iGrille As Integer, iScénario As Integer) As EHDefGrille
  Dim br As New Rev, sLigne As String
  Bloquer
    br.AddField iGrille, iScénario, cLangage
    tcps.Envoie "LGR " & br.Buffer
    
    sLigne = tcps.Reçoit
    If sLigne = "->" Then    ' Echec en lecture
      Set LitGrille = Nothing
      Relâcher
      Exit Function
    End If
    
    ' Ok pour le titre
    Dim sTitre1 As String, sTitre2 As String, sTitreScénario As String
    Dim sOptionsScénario As String, iFormatScénario As Integer
    br.Buffer = sLigne
    br.GetField sTitre1, sTitre2, sTitreScénario, sOptionsScénario, iFormatScénario
    
    Dim e As New EHDefGrille
    With e
      .iNumGrille = iGrille
      .iNumScénario = iScénario
      .sTitre1 = sTitre1
      .sTitre2 = sTitre2
      .sTitreScénario = sTitreScénario
      .iFormatScénario = iFormatScénario
      .sOptionsScénario = sOptionsScénario
    End With
    
    Do
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Exit Do    ' Fin de la liste des items
      
      Dim iIndice As Integer, iNumit As Long, sNumloc As String, sNiveau As String
      Dim iDécote As Integer, iFormat As Integer, iSérie As Long, sTypeItem As String
      Dim sLibellé As String, sOptions As String
      br.Buffer = sLigne
      br.GetField iIndice, iNumit, sNumloc, sNiveau
      br.GetField iDécote, iFormat, iSérie, sTypeItem, sLibellé, sOptions
      
      Dim i As New EHDefItem
      With i
        .ziIndice = iIndice
        .iNumit = iNumit
        .sNumloc = sNumloc
        .iNiveau = Val(sNiveau)
        .iDécote = iDécote
        .iFormat = iFormat
        .iSérie = iSérie
        .sTypeItem = sTypeItem
        If InStr(sLibellé, "|") = 0 Then
          .sLibellé = sLibellé
          .sFormule = ""
        Else
          .sLibellé = Left(sLibellé, InStr(sLibellé, "|") - 1)
          .sFormule = Mid(sLibellé, InStr(sLibellé, "|") + 1)
        End If
        .sOptions = sOptions
      End With
      e.colItems.Add i, "I" & iSérie
      Set i = Nothing
    Loop
  Relâcher

  Set LitGrille = e
End Function

