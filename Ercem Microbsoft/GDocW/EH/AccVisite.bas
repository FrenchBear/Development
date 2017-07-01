Attribute VB_Name = "AccEHVisite"
' AccEHVisite
' Gestion des visites
' 4/2/99 PV


Option Explicit


Private Sub AjouteUneEval(v As EHVisite, iSérie As Long, sValeur As String, sDécote As String, iFormat As Integer, sOptions As String, vLibst As Variant, vSystème As Variant, vObs As Variant, sObs As String)
  Dim ev As New EHEval
  
  ev.iSérie = iSérie
  ev.sValeur = sValeur
  ev.sDécote = sDécote
  ev.iFormat = iFormat
  ev.sOptions = sOptions
  ev.vLibst = vLibst
  ev.vSystème = vSystème
  ev.vObs = vObs
  ev.sObs = sObs
  
  On Error Resume Next
  v.colEval.Remove "E" & iSérie
  On Error GoTo 0
  
  v.colEval.Add ev, "E" & iSérie
End Sub



' Initialise les structures de données d'une visite à partir des infos
' d'un document et d'une EH
Sub InitUneVisite(d As Document, e As EHDefGrille, v As EHVisite)
  v.sRef = d.pla_lettres & d.pla_iref
  v.sOptions = e.sOptionsScénario
  v.iFormat = e.iFormatScénario
  v.cLangueED = "F"     ' Récupérer les infos de la table établissement
  v.dDateVisite = d.pla_dateplan
  v.iCP = UtiParLettres(d.pla_lettres).uti_unite
  v.iPers = UtiParLettres(d.pla_lettres).uti_numuti
  v.sHeure = ""
  
  ' Par défaut, corps virge, basé sur la structure de la grille
  Dim i As EHDefItem
  For Each i In e.colItems
    AjouteUneEval v, i.iSérie, "", "", e.colItems("I" & i.iSérie).iFormat, e.colItems("I" & i.iSérie).sOptions, Null, Null, Null, ""
  Next
End Sub



' Retour vrai si le scénario a changé
Function bLitVisite(d As Document, e As EHDefGrille, v As EHVisite) As Boolean
  Dim br As New Rev, sLigne As String
  Dim bRes As Boolean
  
  
  bRes = False
  Bloquer
    br.AddField v.sRef, e.iNumGrille, e.iNumScénario
    tcps.Envoie "LVI " & br.Buffer
    
    sLigne = tcps.Reçoit
    If sLigne = "->" Then    ' Pas de visite
      Relâcher
      bLitVisite = bRes
      Exit Function
    End If
    
    Dim sRef As String, iNumgri As Integer, iScénario As Integer
    Dim dDateVisite As Date, sHeure As String
    Dim iPers As Integer, iCP As Integer
    Dim sOptions As String, iFormat As Integer, cLangueED As String
    
    br.Buffer = sLigne
    br.GetField sRef, iNumgri, iScénario, dDateVisite, sHeure
    br.GetField iPers, iCP, sOptions, iFormat, cLangueED
    
    With v
      Assert .sRef = sRef
      Assert e.iNumGrille = iNumgri
      
      If iScénario <> e.iNumScénario Then
        e.iNumScénario = iScénario
        bRes = True
      End If
      
      v.dDateVisite = dDateVisite
      v.sHeure = sHeure
      v.iPers = iPers
      v.iCP = iCP
      v.sOptions = sOptions
      v.iFormat = iFormat
      v.cLangueED = cLangueED
    End With
    
    ' Lecture des évaluations
    Do
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Exit Do    ' Fin de la liste des évaluations
      
      Dim iSérie As Long, sValeur As String, vDécote As Variant
      Dim vFormat As Variant, sOptionsEval As String, vLibst As Variant
      Dim vSystème As Variant, vObs As Variant, sObs As String
      
      br.Buffer = sLigne
      br.GetField iSérie
      br.GetField sValeur
      br.GetField vDécote
      br.GetField vFormat
      br.GetField sOptionsEval
      br.GetField vLibst
      br.GetField vSystème
      br.GetField vObs
      br.GetField sObs
      
      AjouteUneEval v, iSérie, sValeur, NV(vDécote), IIf(IsNull(vFormat), -1, CInt(vFormat)), sOptionsEval, vLibst, vSystème, vObs, sObs
    Loop
  Relâcher
  
  bLitVisite = bRes
End Function
