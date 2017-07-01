Attribute VB_Name = "AccEHVisite"
' AccEHVisite
' Gestion des visites
' 4/2/99 PV


Option Explicit


Private Sub AjouteUneEval(v As EHVisite, iS�rie As Long, sValeur As String, sD�cote As String, iFormat As Integer, sOptions As String, vLibst As Variant, vSyst�me As Variant, vObs As Variant, sObs As String)
  Dim ev As New EHEval
  
  ev.iS�rie = iS�rie
  ev.sValeur = sValeur
  ev.sD�cote = sD�cote
  ev.iFormat = iFormat
  ev.sOptions = sOptions
  ev.vLibst = vLibst
  ev.vSyst�me = vSyst�me
  ev.vObs = vObs
  ev.sObs = sObs
  
  On Error Resume Next
  v.colEval.Remove "E" & iS�rie
  On Error GoTo 0
  
  v.colEval.Add ev, "E" & iS�rie
End Sub



' Initialise les structures de donn�es d'une visite � partir des infos
' d'un document et d'une EH
Sub InitUneVisite(d As Document, e As EHDefGrille, v As EHVisite)
  v.sRef = d.pla_lettres & d.pla_iref
  v.sOptions = e.sOptionsSc�nario
  v.iFormat = e.iFormatSc�nario
  v.cLangueED = "F"     ' R�cup�rer les infos de la table �tablissement
  v.dDateVisite = d.pla_dateplan
  v.iCP = UtiParLettres(d.pla_lettres).uti_unite
  v.iPers = UtiParLettres(d.pla_lettres).uti_numuti
  v.sHeure = ""
  
  ' Par d�faut, corps virge, bas� sur la structure de la grille
  Dim i As EHDefItem
  For Each i In e.colItems
    AjouteUneEval v, i.iS�rie, "", "", e.colItems("I" & i.iS�rie).iFormat, e.colItems("I" & i.iS�rie).sOptions, Null, Null, Null, ""
  Next
End Sub



' Retour vrai si le sc�nario a chang�
Function bLitVisite(d As Document, e As EHDefGrille, v As EHVisite) As Boolean
  Dim br As New Rev, sLigne As String
  Dim bRes As Boolean
  
  
  bRes = False
  Bloquer
    br.AddField v.sRef, e.iNumGrille, e.iNumSc�nario
    tcps.Envoie "LVI " & br.Buffer
    
    sLigne = tcps.Re�oit
    If sLigne = "->" Then    ' Pas de visite
      Rel�cher
      bLitVisite = bRes
      Exit Function
    End If
    
    Dim sRef As String, iNumgri As Integer, iSc�nario As Integer
    Dim dDateVisite As Date, sHeure As String
    Dim iPers As Integer, iCP As Integer
    Dim sOptions As String, iFormat As Integer, cLangueED As String
    
    br.Buffer = sLigne
    br.GetField sRef, iNumgri, iSc�nario, dDateVisite, sHeure
    br.GetField iPers, iCP, sOptions, iFormat, cLangueED
    
    With v
      Assert .sRef = sRef
      Assert e.iNumGrille = iNumgri
      
      If iSc�nario <> e.iNumSc�nario Then
        e.iNumSc�nario = iSc�nario
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
    
    ' Lecture des �valuations
    Do
      sLigne = tcps.Re�oit
      If sLigne = "->" Then Exit Do    ' Fin de la liste des �valuations
      
      Dim iS�rie As Long, sValeur As String, vD�cote As Variant
      Dim vFormat As Variant, sOptionsEval As String, vLibst As Variant
      Dim vSyst�me As Variant, vObs As Variant, sObs As String
      
      br.Buffer = sLigne
      br.GetField iS�rie
      br.GetField sValeur
      br.GetField vD�cote
      br.GetField vFormat
      br.GetField sOptionsEval
      br.GetField vLibst
      br.GetField vSyst�me
      br.GetField vObs
      br.GetField sObs
      
      AjouteUneEval v, iS�rie, sValeur, NV(vD�cote), IIf(IsNull(vFormat), -1, CInt(vFormat)), sOptionsEval, vLibst, vSyst�me, vObs, sObs
    Loop
  Rel�cher
  
  bLitVisite = bRes
End Function
