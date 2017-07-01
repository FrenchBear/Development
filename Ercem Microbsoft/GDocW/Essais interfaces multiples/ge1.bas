Attribute VB_Name = "AuxEH"
' Remplissage factice des structures EH pour essais
' 4/2/99 PV

Option Explicit


Private Sub AjouteUneEval(v As EHVisite, iIndice As Integer, iSérie As Long, sValeur As String, sDécote As String, sOptions As String, iFormat As Integer, sObs As String)
  Dim ev As New EHEval
  
  ev.ziIndice = iIndice
  ev.iSérie = iSérie
  ev.sValeur = sValeur
  ev.sDécote = sDécote
  ev.sOptions = sOptions
  ev.iFormat = iFormat
  ev.sObs = sObs
  
  On Error Resume Next
  v.colEval.Remove "E" & iSérie
  On Error GoTo 0
  
  v.colEval.Add ev, "E" & iSérie
End Sub


Sub InitUneVisite(d As Document, e As EHDefGrille, v As EHVisite)

  v.sRef = d.pla_lettres & d.pla_iref
  v.sOptions = e.sOptionsScénario
  v.iFormat = e.iFormatScénario
  v.cLangueED = "F"     ' Récupérer les infos de la table établissement
  v.dDateVisite = d.pla_dateplan
  v.iCP = UtiParLettres(d.pla_lettres).uti_unite
  v.iPers = UtiParLettres(d.pla_lettres).uti_numuti
  v.sHeure = ""
  
  Dim i As EHDefItem
  For Each i In e.colItems
    AjouteUneEval v, i.ziIndice, i.iSérie, "", "", e.colItems("I" & i.iSérie).sOptions, e.colItems("I" & i.iSérie).iFormat, ""
  Next
End Sub

