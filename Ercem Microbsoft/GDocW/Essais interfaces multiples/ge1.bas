Attribute VB_Name = "AuxEH"
' Remplissage factice des structures EH pour essais
' 4/2/99 PV

Option Explicit


Private Sub AjouteUneEval(v As EHVisite, iIndice As Integer, iS�rie As Long, sValeur As String, sD�cote As String, sOptions As String, iFormat As Integer, sObs As String)
  Dim ev As New EHEval
  
  ev.ziIndice = iIndice
  ev.iS�rie = iS�rie
  ev.sValeur = sValeur
  ev.sD�cote = sD�cote
  ev.sOptions = sOptions
  ev.iFormat = iFormat
  ev.sObs = sObs
  
  On Error Resume Next
  v.colEval.Remove "E" & iS�rie
  On Error GoTo 0
  
  v.colEval.Add ev, "E" & iS�rie
End Sub


Sub InitUneVisite(d As Document, e As EHDefGrille, v As EHVisite)

  v.sRef = d.pla_lettres & d.pla_iref
  v.sOptions = e.sOptionsSc�nario
  v.iFormat = e.iFormatSc�nario
  v.cLangueED = "F"     ' R�cup�rer les infos de la table �tablissement
  v.dDateVisite = d.pla_dateplan
  v.iCP = UtiParLettres(d.pla_lettres).uti_unite
  v.iPers = UtiParLettres(d.pla_lettres).uti_numuti
  v.sHeure = ""
  
  Dim i As EHDefItem
  For Each i In e.colItems
    AjouteUneEval v, i.ziIndice, i.iS�rie, "", "", e.colItems("I" & i.iS�rie).sOptions, e.colItems("I" & i.iS�rie).iFormat, ""
  Next
End Sub

