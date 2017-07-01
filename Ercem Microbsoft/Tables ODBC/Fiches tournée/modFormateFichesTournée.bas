Attribute VB_Name = "FormateFichesTournée"
' FormateFichesTournée
' Module d'impression des fiches tournée (complet+extrait mensuel)
'  8/03/2000 PV

Option Explicit

Private o As Object
Private iPage As Integer        ' Nb de pages total imprimé jusque là
Private iPageFT As Integer      ' N° de page courante dans la FT
Private iNbPageFT As Integer    ' Nb de pages dans la FT

' Largeur des colonnes en mm (total=180)
' Fiche complète
Private Const fWNom = 64
Private Const fWNb = 6
Private Const fWFreq = 6
Private Const fWPrest = 20
Private Const fWMois = 7
' Extrait mensuel
Private Const fXEtb1 = 60       ' Nom, adresse
Private Const fXEtb2 = 57       ' Tel, ...
Private Const fXType = 9        ' AB, EH, ...

Private Const fVOff = 0.8       ' Offset des textes dans les tableaux
Private Const fTabLH = 3.9      ' Hauteur de ligne du tableau
Private Const fEtbLH = 2.9      ' Hauteur de ligne de texte à gauche

Private iTraitFin As Single     ' Valeur DrawWidth d'un trait fin (en pixels !)
Private iTraitEpais As Single   ' Valeur DrawWidth d'un trait épais

Private fY As Single            ' Position verticale courante en mm
Private fCol As Single          ' Position courante pour le dessin des titres de colonnes

Private cFT As BDCurseur        ' Curseur des fiches tournée
Private rTotal As Total         ' Enregistrement de totalisation, de même structure que cFT

Private g_iMois As Integer      ' Mois d'édition pour l'extrait mensuel (1..12) ou 0

Private iNbEtb As Integer       ' Nb d'établissements sur l'extrait mensuel
Private tbQQchose(1 To 12) As Boolean        ' Comptage des établissements ayant "qqchose" à faire



' iMois=0:     Fiche complète
' iMois=1..12: Extrait mensuel
Public Sub DoFormateFichesTournée(ByVal iMois As Integer, ByVal sWP As String, ByVal bImpression As Boolean, oCallBack As Form, iTypeEtat As Integer)
  g_iMois = iMois
  If bImpression Then
    If Not bSélectionImprimantes(MDIFTour.cdPrinter) Then Exit Sub
    Screen.MousePointer = vbHourglass
    SetStatus "Impression en cours, patientez..."
    If bOptionRectoVerso Then ImprimanteRectoVerso
    ImprimanteMilimetres
    Set o = Printer
    iTraitFin = 1
    iTraitEpais = 8
    DoFormatage sWP
    
    If iPage > 0 Then
      If iPage And 1 Then ImprimanteAjoute1PageSiRV
      o.EndDoc
    End If

    ' On restaure le nombre d'exemplaires par défaut à 1
    If MDIFTour.cdPrinter.Copies > 1 Then Imprimante1Ex MDIFTour.cdPrinter
    
    SetStatus
    Screen.MousePointer = vbDefault
  Else
    Set o = New frmImprimante
    o.Show
    o.Height = MDIFTour.ScaleHeight - o.Top
    o.Width = o.Height / 297 * 210
    o.ScaleHeight = 297
    o.ScaleWidth = 210
    Set o.CallBack = oCallBack
    o.iTypeEtat = iTypeEtat
    iTraitFin = 1
    iTraitEpais = 3
    DoFormatage sWP
  End If
End Sub


Private Sub DoFormatage(sWP As String)
  Dim sSQL As String
  
  Set rTotal = New Total
'  sSQL = "select * from ftour where " & sWP
   sSQL = "select * from ftour where (" & sWP & ") order by ft_fiche"
  Set cFT = New BDCurseur
  cFT.OpenCurseur sSQL
  iPage = 0
  Do Until cFT.EOF
    EffaceTotal
    FormateCorps cFT!ft_fiche
    cFT.MoveNext
  Loop
  cFT.CloseCurseur
  Set cFT = Nothing
  Set rTotal = Nothing
End Sub


Private Sub EffaceTotal()
  Dim i As Integer, m As Integer
  For i = 1 To 8
    For m = 1 To 12
      rTotal.Fields("dt_" & i & Right(m + 100, 2)) = ""
    Next
  Next
End Sub


Private Sub NouvellePage(Optional bForcePageImpaire As Boolean = False)
  If iPage > 0 Then
    If o Is Printer Then
      Printer.NewPage
      If bForcePageImpaire And (iPage Mod 2) = 1 Then
        If ImprimanteAjoute1PageSiRV Then iPage = iPage + 1
      End If
      SetStatus "Impression en cours, page " & iPage
    Else
      Dim iRep As VbMsgBoxResult
      iRep = MsgBox("Page suivante ?", vbQuestion + vbYesNo)
      If iRep = vbNo Then
        Unload o
        Err.Raise 1000, "NouvellePage", "Interruption aperçu"
      End If
      o.Cls
    End If
  End If

  iPage = iPage + 1
  iPageFT = iPageFT + 1
  
  ' Bandeau d'identification
  o.FontTransparent = False
  Texte o, 0, 0, "."
  o.FontTransparent = True
  
'  If iPageFT = 1 Then
    SetFont o, "Univers Condensed", "Arial Narrow"
    With o.Font
      .Bold = True
      .Italic = True
      .Size = FSize(o, 11)
    End With
    If g_iMois = 0 Then
      Texte o, 20, 9, "Microb'Soft: Fiche tournée"
    Else
      Texte o, 20, 9, "Microb'Soft: Extrait mensuel de fiche tournée"
    End If
    With o.Font
      .Name = "Courier new"
      .Size = FSize(o, 8)
      .Italic = False
      .Bold = False
    End With
    Texte o, 20, 13.5, "Édition du " & Format(Now, "ddd dd mmm yyyy hh:MM") & " [" & sNomOpérateur & "]"
  
    ' Police standard du texte
    SetFont o, "Univers Condensed", "Arial Narrow"
    With o.Font
      .Bold = True
      .Size = FSize(o, 16)
    End With
    Texte o, 20, 18, NV(cFT!ft_region)
    With o.Font
      .Bold = True
      .Size = FSize(o, 10)
    End With
    Texte o, 20, 23, NV(cFT!ft_tournee)
    ' Le commentaire est destiné à l'affichage uniquement
    'Texte o, 20, 25.5, NV(cFT!ft_comment)
'  End If
  
    
  SetFont o, "Univers Condensed", "Arial Narrow"
  With o.Font
    .Bold = True
    .Size = FSize(o, 24)
  End With
  If g_iMois = 0 Then
    TexteDroite o, 210 - 10, 9, cFT!ft_fiche
    o.Font.Size = FSize(o, 9)
    TexteDroite o, 210 - 10, 18, "Page " & iPageFT & "/" & iNbPageFT
  Else
    TexteDroite o, 210 - 10, 9, cFT!ft_fiche & " / " & Right(100 + g_iMois, 2)
    o.Font.Size = FSize(o, 9)
    ' Pas de nb total de pages pour l'extrait mensuel !
    TexteDroite o, 210 - 10, 18, "Page " & iPageFT
  End If
  TexteDroite o, 210 - 10, 21.5, "Dernière modification: " & Format(cFT!TimeStamp, "dd/mm/yyyy")
  
  
  If g_iMois = 0 Then
    ' En-tête de la fiche complète
    fCol = 20
    Colonne fWNom, "Etb / Prest / Contraintes / Complément"
    Colonne fWNb, "Nb"
    Colonne fWFreq, "Freq"
    Colonne fWPrest, "Prest"
    Dim i As Integer
    For i = 1 To 12
     Colonne fWMois, Choose(i, "Jan", "Fév", "Mar", "Avr", "Mai", "Jui", "Jul", "Aoû", "Sep", "Oct", "Nov", "Déc"), (i Mod 3) = 1
    Next
  Else
    ' En-tête de l'extrait mensuel
    fCol = 20
    Colonne fXEtb1, "Établissement"
    Colonne fXEtb2, "Tel / Prestation / Contraintes / Complément"
    For i = 1 To 7
      Colonne fXType, Choose(i, "AB", "EH", "BS", "Li", "FS", "Hu", "Ch"), (i Mod 3) = 1
    Next
  End If
  o.DrawWidth = iTraitEpais
  o.Line (20, 36)-(200, 36)
  o.DrawWidth = iTraitFin
  
  fY = 36
End Sub


Private Sub Colonne(fWidth As Single, sTitre As String, Optional bGrisé As Boolean = False)
  If bGrisé And Not bOptionSansGrisés Then
    o.FillColor = RGB(235, 235, 235)    ' Valeur 235 pour réduire le volume du fichier d'impression
    o.FillStyle = vbFSSolid
    o.Line (fCol + 0.25, 32)-Step(fWidth - 0.5, 4 - 0.25), RGB(255, 255, 255), B
  End If
  
  TexteCentré o, fCol, fCol + fWidth, 32.5, sTitre
  fCol = fCol + fWidth
  o.Line (fCol, 32)-Step(0, 4)
End Sub


Private Sub FormateCorps(sFT As String)
  Dim sSQL As String
  Dim cDT As New BDCurseur
  Dim x As Object
  Dim iNbDet As Integer
  
  ' Pas de comptage des pages pour l'extrait mensuel
  If g_iMois = 0 Then
    iNbDet = BDCurseurExpress("select count(*) from dettour where dt_fiche=" & sFormToSQL(sFT, BDTypeCHAR))
    iNbPageFT = iNbDet \ 9 + 1    ' En fait (iNbDet-1)\9+1, mais 1 détail de plus pour le total
  End If
  
  sSQL = "select dettour.*,etablissement.etb_prefixe,etablissement.etb_nom,etablissement.etb_rue,etablissement.etb_loc,etablissement.etb_cpost,etablissement.etb_tel,etablissement.etb_fax,etablissement.etb_bdist,etablissement.etb_prest,etablissement.etb_contraintes,etablissement.etb_nbran, etablissement.etb_nbrbs, etablissement.etb_nbrch, etablissement.etb_nbreh, etablissement.etb_nbrfs, etablissement.etb_nbrhuiles, etablissement.etb_nbrlis, etablissement.etb_freqan, etablissement.etb_freqbs, etablissement.etb_freqch, etablissement.etb_freqeh, etablissement.etb_freqfs , etablissement.etb_freqhuiles, etablissement.etb_freqlis, etablissement.etb_prestan, etablissement.etb_prestbs, etablissement.etb_prestch, etablissement.etb_presteh, etablissement.etb_prestfs, etablissement.etb_presthuiles, etablissement.etb_prestlis " & _
   " from dettour,outer etablissement where dt_numetb=etb_numetb and dt_fiche=" & sFormToSQL(sFT, BDTypeCHAR) & " order by dt_index,dt_numetb"
  cDT.OpenCurseur sSQL
  iPageFT = 0
  iNbEtb = 0
  Do
    If iPageFT = 0 Or fY + 28 > 287 Then NouvellePage iPageFT = 0
  
    ' A la fin on imprime l'enregistrement de total
    If cDT.EOF Then
      Set x = rTotal
    Else
      Set x = cDT
    End If
    
    If g_iMois = 0 Then
      FormateCorpsFicheComplète x, cDT.EOF
    Else
      FormateCorpsExtraitMensuel x, cDT.EOF
    End If
    
    If cDT.EOF Then Exit Do
    
    cDT.MoveNext
  Loop
  
  ' On complète la dernière page avec des enregistrements vides
  ' pour la fiche complète
  If g_iMois = 0 Then
    EffaceTotal
    x!etb_nom = ""
    Do While (iNbEtb Mod 9) <> 0
      FormateCorpsFicheComplète x, False
    Loop
  End If
  
  cDT.CloseCurseur
End Sub


Private Sub FormateCorpsFicheComplète(x As Object, bEOF As Boolean)
  Dim y As Single
  Dim i As Integer, m As Integer
  
  iNbEtb = iNbEtb + 1
  
  o.Font.Bold = False
  Texte o, 55, fY + 1, NV(x!dt_variocolor)
  o.Font.Bold = True
  Texte o, 20, fY + 1, x!dt_numetb & "  " & NV(x!etb_prefixe)
  Texte o, 20, fY + 1 + fEtbLH, IIf(IsNull(x!etb_nom), "**** ÉTABLISSEMENT INEXISTANT !", x!etb_nom)
  o.Font.Bold = False
  Dim iOff As Integer
  iOff = 2
  If NV(x!etb_rue) <> "" Then Texte o, 20, fY + 1 + iOff * fEtbLH, NV(x!etb_rue): iOff = iOff + 1
  If NV(x!etb_loc) <> "" Then Texte o, 20, fY + 1 + iOff * fEtbLH, NV(x!etb_loc): iOff = iOff + 1
  Texte o, 20, fY + 1 + iOff * fEtbLH, NV(x!etb_cpost) & " " & NV(x!etb_bdist)
  If NV(x!etb_prefixe) <> "" Then
    o.Line (20, fY + 0.75 + 5 * fEtbLH)-Step(55, 0)
  End If
  Texte o, 20, fY + 1 + 5 * fEtbLH, NV(x!etb_prest)
  Texte o, 20, fY + 1 + 6 * fEtbLH, NV(x!etb_contraintes)
  BlocTexte o, 20, fY + 1 + 7 * fEtbLH, fWNom - 6, NV(x!dt_comment)
  
  For m = 1 To 12
    tbQQchose(m) = False
  Next
  
  For i = 1 To 7 - CInt(bEOF)
    Dim sNb As String, sFreq As String, sPrest As String
    sNb = NV(Choose(i, x!etb_nbran, x!etb_nbreh, x!etb_nbrbs, x!etb_nbrlis, x!etb_nbrfs, x!etb_nbrhuiles, x!etb_nbrch))
    sFreq = NV(Choose(i, x!etb_freqan, x!etb_freqeh, x!etb_freqbs, x!etb_freqlis, x!etb_freqfs, x!etb_freqhuiles, x!etb_freqch))
    sPrest = NV(Choose(i, x!etb_prestan, x!etb_presteh, x!etb_prestbs, x!etb_prestlis, x!etb_prestfs, x!etb_presthuiles, x!etb_prestch))
    
    y = fY + fTabLH * (i - 1)
    TexteDroite o, 20 + fWNom - 1, y + fVOff, Choose(i, "AB", "EH", "BS", "Li", "FS", "Hu", "Ch", "Nb etb tot")
    o.Line (20 + fWNom, y)-Step(0, fTabLH)
    Texte o, 20 + 1 + fWNom, y + fVOff, sNb
    o.Line (20 + fWNom + fWNb, y)-Step(0, fTabLH)
    Texte o, 20 + 1 + fWNom + fWNb, y + fVOff, sFreq
    o.Line (20 + fWNom + fWNb + fWFreq, y)-Step(0, fTabLH)
    Texte o, 20 + 1 + fWNom + fWNb + fWFreq, y + fVOff, sPrest
    For m = 1 To 12
      ' Grisé
      If (m Mod 3) = 1 And Not bOptionSansGrisés Then
        o.FillColor = RGB(235, 235, 235)    ' Valeur 235 pour réduire le volume du fichier d'impression
        o.FillStyle = vbFSSolid
        o.Line (20 + fWNom + fWNb + fWFreq + fWPrest + (m - 1) * fWMois + 0.25, y + 0.25)-Step(fWMois - 0.5, fTabLH - 0.5), RGB(255, 255, 255), B
      End If
      
      Dim s As String, sIx As String
      sIx = "dt_" & i & Right(m + 100, 2)
      s = NV(x.Fields(sIx))
      Texte o, 20 + 1 + fWNom + fWNb + fWFreq + fWPrest + (m - 1) * fWMois, y + fVOff, s
      o.Line (20 + fWNom + fWNb + fWFreq + fWPrest + (m - 1) * fWMois, y)-Step(0, fTabLH)
      
      ' Totalisation
      If Not bEOF And s <> "" Then
        If s Like "#+#" Then s = Val(Left(s, 1)) + Val(Right(s, 1))
        If Not IsNumeric(s) Then s = 1
        rTotal.Fields(sIx) = Val(rTotal.Fields(sIx)) + Val(s)
        tbQQchose(m) = True
      End If
    Next
    o.Line (20 + fWNom + fWNb + fWFreq + fWPrest + 12 * fWMois, y)-Step(0, fTabLH)
    
    If i = 7 Then o.DrawWidth = iTraitEpais
    o.Line (20 + fWNom - 5, y + fTabLH)-(200, y + fTabLH)
    If i = 7 Then o.DrawWidth = iTraitFin
  Next
  
  ' Comptage des établissements ayant "qqchose" à faire
  If Not bEOF Then
    For m = 1 To 12
      If tbQQchose(m) Then rTotal.Fields("dt_8" & Right(m + 100, 2)) = Val(rTotal.Fields("dt_8" & Right(m + 100, 2))) + 1
    Next
  End If
  
  fY = fY + (i - 1) * fTabLH
  o.DrawWidth = iTraitEpais
  o.Line (20, fY)-(200, fY)
  o.DrawWidth = iTraitFin
End Sub


Private Sub FormateCorpsExtraitMensuel(x As Object, bEOF As Boolean)
  Dim i As Integer
  Dim r As Integer
  Dim y As Single
  Dim bVide As Boolean
  Dim h As Integer          ' Nb de lignes de tableau pour l'enregistrement
  
    If bEOF Then
    Else
    End If
    
  
  If bEOF Then
    o.Font.Bold = True
    Texte o, 20, fY + 1, "TOTAL " & iNbEtb & " etb(s)"
    o.Font.Bold = False
    h = 1
  Else
    h = 4
    ' Par principe, on n'édite pas les établissements sans prestation
    bVide = True
    For r = 1 To 7
      If NV(x.Fields("dt_" & r & Right(g_iMois + 100, 2))) <> "" Then
        bVide = False
        Exit For
      End If
    Next
    If bVide Then Exit Sub
    
    iNbEtb = iNbEtb + 1
    o.Font.Bold = False
    Texte o, 55, fY + 1, NV(x!dt_variocolor)
    o.Font.Bold = True
    Texte o, 20, fY + 1, x!dt_numetb & "  " & NV(x!etb_prefixe)
    Texte o, 20, fY + 1 + fEtbLH, IIf(IsNull(x!etb_nom), "**** ÉTABLISSEMENT INEXISTANT !", x!etb_nom)
    o.Font.Bold = False
    Dim iOff As Integer
    iOff = 2
    If NV(x!etb_rue) <> "" Then Texte o, 20, fY + 1 + iOff * fEtbLH, NV(x!etb_rue): iOff = iOff + 1
    If NV(x!etb_loc) <> "" Then Texte o, 20, fY + 1 + iOff * fEtbLH, NV(x!etb_loc): iOff = iOff + 1
    Texte o, 20, fY + 1 + iOff * fEtbLH, NV(x!etb_cpost) & " " & NV(x!etb_bdist)
    
    If NV(x!etb_tel) <> "" Then Texte o, 20 + fXEtb1, fY + 1, "Tel: " & NV(x!etb_tel)
    If NV(x!etb_fax) <> "" Then Texte o, 20 + fXEtb1 + 25, fY + 1, "Fax: " & NV(x!etb_fax)
    Texte o, 20 + fXEtb1, fY + 1 + fEtbLH, NV(x!etb_prest)
    Texte o, 20 + fXEtb1, fY + 1 + 2 * fEtbLH, NV(x!etb_contraintes)
    BlocTexte o, 20 + fXEtb1, fY + 1 + 3 * fEtbLH, fXEtb2 - 6, NV(x!dt_comment)
  End If
  
  Dim s As String, sIx As String
  For i = 1 To 1   '4 + 3 * CInt(bEOF)
    y = fY + fTabLH * (i - 1)
'    TexteDroite o, 20 + fXEtb1 + fXEtb2 - 1, y + fVOff, Choose(i, "Mois", "Nb", "Freq", "Prest")
    For r = 1 To 7
      ' Grisé
      If (r Mod 3) = 1 And Not bOptionSansGrisés Then
        o.FillColor = RGB(235, 235, 235)    ' Valeur 235 pour réduire le volume du fichier d'impression
        o.FillStyle = vbFSSolid
        o.Line (20 + fXEtb1 + fXEtb2 + (r - 1) * fXType + 0.25, y + 0.25)-Step(fXType - 0.5, fTabLH - 0.5), RGB(255, 255, 255), B
      End If
      
      Select Case i
        Case 1:
          sIx = "dt_" & r & Right(g_iMois + 100, 2)
          s = NV(x.Fields(sIx))
          If Not bEOF And s <> "" Then
            If s Like "#+#" Then s = Val(Left(s, 1)) + Val(Right(s, 1))
            If Not IsNumeric(s) Then s = 1
            rTotal.Fields(sIx) = Val(rTotal.Fields(sIx)) + Val(s)
          End If
        Case 2: s = NV(Choose(r, x!etb_nbran, x!etb_nbreh, x!etb_nbrbs, x!etb_nbrlis, x!etb_nbrfs, x!etb_nbrhuiles, x!etb_nbrch))
        Case 3: s = NV(Choose(i, x!etb_freqan, x!etb_freqeh, x!etb_freqbs, x!etb_freqlis, x!etb_freqfs, x!etb_freqhuiles, x!etb_freqch))
        Case 4: s = NV(Choose(i, x!etb_prestan, x!etb_presteh, x!etb_prestbs, x!etb_prestlis, x!etb_prestfs, x!etb_presthuiles, x!etb_prestch))
      End Select
      Texte o, 20 + 1 + fXEtb1 + fXEtb2 + (r - 1) * fXType, y + fVOff, s
      o.Line (20 + fXEtb1 + fXEtb2 + (r - 1) * fXType, y)-Step(0, fTabLH)
    Next
    
    o.Line (20 + fXEtb1 + fXEtb2 + 0 * fXType, y)-Step(0, h * fTabLH)
    o.Line (20 + fXEtb1 + fXEtb2 + 7 * fXType, y)-Step(0, h * fTabLH)
  
    o.Line (20 + fXEtb1 + fXEtb2, y + fTabLH)-(200, y + fTabLH)
  Next
  
  fY = fY + h * fTabLH
  o.DrawWidth = iTraitEpais
  o.Line (20, fY)-(200, fY)
  o.DrawWidth = iTraitFin
End Sub
