Attribute VB_Name = "modImprimePlaHebdo"
' modImprimePlaHebdo
' Mise en page/Impression locale du planning hebdomadaire
' 18/03/01 PV
' 14/05/01 PV Reprise sans affecter une colonne � une journ�e


Option Explicit

#Const bImprime = True
#Const bAffichage = False

' Variables globales pour simplifier

' Semaine courante
Private iSemaineCourante As Integer
Private dDateD�butSemaine As Date

Private iSemaine As Integer, iJour As Integer


' Planning/Intervention/Etablissement courants
Private dDatePlan As Date, sLettres As String
Private sSysRef As String, sNomAssistant As String

Private colPlannings As Collection   ' Le planning en cours d'impression
Private p As Intervention
Private e As Etablissement

' Mise en page/Totaux
Private iNbInt As Integer
Private iTotAb As Integer, iTotBs As Integer, iTotLi As Integer, iTotFS As Integer, iTotCh As Integer, iTotHu As Integer, iTotEh As Integer

Private iCol As Integer   ' Colonne de 0 � 4
Private fTop As Single    ' Position d'impression en mm
Private Const fTop0 As Single = 30


Public Function bD�butImpressionPlaHebdoLocal(sImprimante As String) As Boolean
#If bAffichage Then
  frmImprimante.Show
  frmImprimante.Caption = sGetIntlLib("PLipApHebdo", "Aper�u Planning hebdomadaire")
#End If
#If bImprime Then
  bD�butImpressionPlaHebdoLocal = False
  If Not bS�lectionImprimante(sImprimante) Then Exit Function
  ImprimanteRectoVerso vbPRDPSimplex
  ImprimanteMilimetres vbPRORLandscape
  ImprimantePapier IIf(iBacPlannings <= 0, vbPRBNAuto, iBacPlannings)
  ImprimanteR�solutionFaible
  
  ' On consid�re que la zone d'impression est centr�e sur la page,
  ' sinon le point de coordonn�es (0,0) est le premier pixel imprimable en haut � gauche
  ' Du coup, les coordonn�es sont exprim�es en mm par rapport aux marges gauche et haut,
  ' ce qui est plus simple�
  Dim sw As Single, sh As Single
  sw = Printer.ScaleWidth
  sh = Printer.ScaleHeight
  ' Orientation paysage !
  Printer.ScaleLeft = (297 - sw) / 2
  Printer.ScaleTop = (210 - sh) / 2
#End If

  ' Par d�faut on est sur la premi�re page
  MyPrinterStartDoc
  Screen.MousePointer = vbHourglass
  bD�butImpressionPlaHebdoLocal = True
  iSemaineCourante = 0
  
  iCol = 0
  fTop = fTop0
  
End Function


Public Sub ImpVBPlaHebdo(p_sLettres As String, p_dDatePlan As Date)
  dDatePlan = p_dDatePlan
  sLettres = p_sLettres
  
  iSemaine = Val(Format(dDatePlan, "ww"))
  iJour = Weekday(dDatePlan)
  
  ' Silencieusement, on n'imprime pas les plannings du samedi et du dimanche
  ' sous la forme hebdomadaire
  'If iJour < vbMonday Or iJour > vbFriday Then Exit Sub
  
  
  ' Initialisations au 1er passage
  If iSemaineCourante = 0 Then
    ' Identifications appraissant dans l'en-t�te
    sSysRef = sLettreSyst�meG�rantLesLettres(sLettres)
    Dim u As Utilisateur
    Set u = UtiParLettres(sLettres)
    If u Is Nothing Then
      sNomAssistant = sGetIntlLib("PLipUtilInc", "Utilisateur inconnu")
    Else
      sNomAssistant = u.uti_nom
    End If
  End If
  
  ' Changement de semaine
  If iSemaine <> iSemaineCourante Then AlimEnt�te
  
  
  ' En-t�te de jour
#If bAffichage Then
  PlaHebdoEnt�teJour frmImprimante, dDatePlan
#End If
#If bImprime Then
  PlaHebdoEnt�teJour Printer, dDatePlan
#End If
  
  Set colPlannings = RecherchePlanning(p_dDatePlan, p_sLettres)
  DoFormatage
End Sub



Private Sub AlimEnt�te()
  ' On �jecte une page pr�cedente
  If iSemaineCourante <> 0 Then
#If bAffichage Then
    MsgBox "Page suivante": frmImprimante.Cls
#End If
  End If
#If bImprime Then
    MyPrinterNewPage
#End If
  
  ' En-t�te de semaine
  iSemaineCourante = iSemaine
  dDateD�butSemaine = dDatePlan - (iJour - vbMonday)
#If bAffichage Then
  PlaHebdoEnt�te frmImprimante
#End If
#If bImprime Then
  PlaHebdoEnt�te Printer
#End If

End Sub



Public Sub FinImpressionPlaHebdoLocal()
#If bImprime Then
  MyPrinterEndDoc
#End If
#If bAffichage Then
'  Unload frmImprimante
#End If
  
  Screen.MousePointer = vbDefault
End Sub



Private Sub DoFormatage()
  iNbInt = 0
  iTotAb = 0
  iTotBs = 0
  iTotLi = 0
  iTotFS = 0
  iTotCh = 0
  iTotHu = 0
  iTotEh = 0
  
  For Each p In colPlannings
    Set e = LireEtablissement(p.pla_etb, True)
    
    iNbInt = iNbInt + 1
    
#If bAffichage Then
    PlaHebdoEtb frmImprimante
#End If
#If bImprime Then
    PlaHebdoEtb Printer
#End If

    If IsNumeric(p.pla_nbab) Then iTotAb = iTotAb + p.pla_nbab
    If IsNumeric(p.pla_nbeh) Then iTotEh = iTotEh + p.pla_nbeh
    If IsNumeric(p.pla_nbbs) Then iTotBs = iTotBs + p.pla_nbbs
    If IsNumeric(p.pla_nbli) Then iTotLi = iTotLi + p.pla_nbli
    If IsNumeric(p.pla_nbfs) Then iTotFS = iTotFS + p.pla_nbfs
    If IsNumeric(p.pla_nbhu) Then iTotHu = iTotHu + p.pla_nbhu
    If IsNumeric(p.pla_nbch) Then iTotCh = iTotCh + p.pla_nbch
    
  Next
  
  ' Pied de planning (totaux)
#If bAffichage Then
  PlaHebdoPied frmImprimante
#End If
#If bImprime Then
  PlaHebdoPied Printer
#End If

End Sub


Private Sub PlaHebdoEnt�te(o As Object)
Dim Elt1 As String
Dim Elt2 As String

  ' Bandeau d'identification
  Texte o, 0, 0, "."
  With o.Font
    .Name = "Verdana"
    .Bold = True
    .Italic = True
    .Size = FSize(o, 8.5)
  End With
  o.FontTransparent = False   ' Sinon sur la 5Si le texte n'est pas transparent
  Texte o, 10, 12, sGetIntlLib("PLipPlanHebdo1", "Microb'Soft: Planning hebdomadaire")
  o.FontTransparent = True    ' Suite de l'astuce pour 5Si
  With o.Font
    .Italic = False
    .Bold = False
  End With
  Elt1 = sGetIntlLib("PLipImprim", " - Imprim� le ")
  Elt2 = sGetIntlLib("PLipPar", " par ")
  o.Print (Elt1 & " " & Format(Now, "ddd dd mmm yyyy hh:MM") & " " & Elt2 & " " & sNomOp�rateur);
  
  ' T�te du planning
  o.DrawWidth = 3
  
  o.Line (10, 20)-(280, 30), 0, B
'  o.Line (10, 30)-(280, 30)
'  o.Line (10, 40)-(280, 40)
'  o.Line (10, 190)-(280, 190)
  o.Line (10, 200)-(280, 200)
  Dim i As Integer
  For i = 0 To 5
    o.Line (10 + 54 * i, 30)-(10 + 54 * i, 200)
  Next
  
  With o.Font
    .Size = FSize(o, 9.5)
    .Bold = True
  End With
  Texte o, 30, 20.5, sGetIntlLib("PLipPlanHebdo", "PLANNING HEBDOMADAIRE")
  Texte o, 30, 25, sNomSyst�meUnix(sSysRef) & " (" & sSysRef & ")"
  o.Font.Bold = False
  Texte o, 110, 20.5, sGetIntlLib("PLipDate", "DATE :")
  Texte o, 110, 25, sGetIntlLib("PLipLettres", "LETTRES :")
  
  
  o.Font.Bold = True
  If dDatePlan = dAttente Then
    Texte o, 133, 20.5, sGetIntlLib("PLipAttente", "ATTENTE")
  Else
    Texte o, 133, 20.5, Format(dDateD�butSemaine, "ddd dd/mm/yyyy") & " -> " & Format(dDateD�butSemaine + 4, "ddd dd/mm/yyyy")
  End If
  Texte o, 133, 25, sLettres
  o.Font.Size = FSize(o, 9)
  Texte o, 140, 25, sNomAssistant
  o.Font.Bold = False
  
  ' Position d'impression pour commencer
  iCol = 0
  fTop = fTop0

  MyPrinterPrint "Planning hebdomadaire " & sLettres & dDatePlan
End Sub


Private Sub PlaHebdoEnt�teJour(o As Object, d As Date, Optional bSuite As Boolean = False)
  ' Trop bas dans la colonne: on commence une nouvelle colonne
  If fTop > 160 Then
    iCol = iCol + 1
    fTop = fTop0
    If iCol > 4 Then
      AlimEnt�te
      iCol = 0
    End If
  End If

  If fTop <> fTop0 Then o.DrawWidth = 9
  o.Line (10 + 54 * iCol, fTop)-Step(54, 0)
  o.DrawWidth = 3
  
'  iCol = Weekday(d) - vbMonday
  o.Font.Name = "Verdana"
  o.Font.Size = FSize(o, 9)
  o.Font.Bold = True
  Texte o, 11 + 54 * iCol, fTop + 1, Format(d, "ddd dd/mm/yyyy") & IIf(bSuite, " (suite)", "")
  o.Font.Name = "Arial Narrow"
  o.Font.Size = FSize(o, 8)
  o.Font.Bold = False
  o.Line (10 + 54 * iCol, fTop + 6)-Step(54, 0)
  
  fTop = fTop + 6
End Sub


Private Sub PlaHebdoEtb(o As Object)
  MyPrinterPrint "intervention" & sLettres & p.pla_iref
  If fTop > 190 Then
    iCol = iCol + 1
    fTop = fTop0
    If iCol > 4 Then
      AlimEnt�te
      iCol = 0
      PlaHebdoEnt�teJour o, dDatePlan, True
    End If
  End If
  
  UneLigne o, p.pla_etb & ": " & e.etb_prefixe & " " & e.etb_nom, NZ(p.pla_nbab), NZ(p.pla_nbeh), NZ(p.pla_nbbs), NZ(p.pla_nbli), NZ(p.pla_nbfs), NZ(p.pla_nbhu), NZ(p.pla_nbch)
End Sub



Private Sub PlaHebdoPied(o As Object)
  MyPrinterPrint "Pied de planning hebdomadaire"
  fTop = fTop + 25
  If fTop > 190 Then
    iCol = iCol + 1
    fTop = fTop0
    If iCol > 4 Then
      AlimEnt�te
      iCol = 0
    End If
  End If
  
  o.Line (10 + 54 * iCol, fTop)-Step(54, 0)
  UneLigne o, iNbInt & " etb", Val(iTotAb), Val(iTotEh), Val(iTotBs), Val(iTotLi), Val(iTotFS), Val(iTotHu), Val(iTotCh)
  o.Line (10 + 54 * iCol, fTop)-Step(54, 0)
End Sub


Private Sub UneLigne(o As Object, sLigne1 As String, iAb As Integer, iEh As Integer, iBS As Integer, iLi As Integer, iFS As Integer, iHu As Integer, iCh As Integer)
  o.Font.Bold = True
  Dim l As Integer
  l = BlocTexte(o, 11 + 54 * iCol, fTop, 52, sLigne1, 2)
  fTop = fTop + l * o.TextHeight("X")
  
  Dim s As String
  If iAb > 0 Then s = s & iAb & "AB "
  If iEh > 0 Then s = s & iEh & "EH "
  If iBS > 0 Then s = s & iBS & "BS "
  If iLi > 0 Then s = s & iLi & "Li "
  If iFS > 0 Then s = s & iFS & "FS "
  If iHu > 0 Then s = s & iHu & "Hu "
  If iCh > 0 Then s = s & iCh & "Ch "
  o.Font.Bold = False
  BlocTexte o, 11 + 54 * iCol, fTop, 52, s, 1
  fTop = fTop + 4
End Sub
