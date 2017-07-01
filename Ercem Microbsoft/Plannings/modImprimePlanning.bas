Attribute VB_Name = "modImprimePlanning"
' modImprimePlanning
' Mise en page/Impression locale du planning
' 18/03/97 PV
' 27/08/97 PV VB5SP2; constante bAffichage
' 12/11/97 PV Kill du fichier de donn�es � la fin d'une impression
' 24/10/00 PV Int�gration au programme planning
'  6/12/00 PV Gestion des bacs
'  9/02/01 PV Gestion des feuilles via MyPrinter
' 30/07/01 PV Lignes de planning d'�tablissements AS sur fond gris + rappel dans la feuille de route


Option Explicit

#Const bImprime = True
#Const bAffichage = False

Private Const iMaxIntParPage = 23
Private Const iMaxIntPageFin = 20

' Variables globales pour simplifier

' Planning/Intervention/Etablissement courants
Private dDatePlan As Date, sLettres As String, sNomAssistant As String, sSysRef As String
Private colPlannings As Collection   ' Le planning en cours d'impression
Private p As Intervention
Private e As Etablissement


' Collections de hi�rarchies pour les feuilles de route
Private colSec As New Collection
Private colDrg As New Collection
Private colDna As New Collection
Private colGrp As New Collection


' Mise en page/Totaux
Private iPage As Integer              ' Nb de page imprim�e au total
Private iNbIntTotal As Integer        ' Nb d'interventions imprim�es au total
Private iNbIntSurPage As Integer      ' Nb d'interventions imprim�es sur la page
Private iTotAb As Integer, iTotBs As Integer, iTotLi As Integer, iTotFS As Integer, iTotCh As Integer, iTotHu As Integer, iTotEh As Integer


' Colonnes
Private Const colRef = 10
Private Const colEtb = 28
Private Const colCNS = 118
Private Const colPers = 135
'private Const colHeu = 166
Private Const colHeu = 176
Private Const colAB = 176
Private Const colBS = 181
Private Const colLi = 186
Private Const colFS = 191
Private Const colHu = 196
Private Const colCh = 201
Private Const colEH = 206
Private Const colGrSc = 211
Private Const colLabo = 221
Private Const colAP = 226
Private Const colD�c = 231
'Private Const colNC = 236
'Private Const colRem = 241
Private Const colRem = 236

' Modules de mise en page
Private Const deltaH = 1        ' D�calage horizontal entre un trait et le d�but du texte
Private Const deltaV1 = 0.15    ' D�calage vertical entre un trait et le d�but du texte
Private Const deltaV2 = 3.55




Public Function bD�butImpressionPlanningLocal(sImprimante As String) As Boolean
#If bAffichage Then
  frmImprimante.Show
  frmImprimante.Caption = "Aper�u Plannings"
#End If
#If bImprime Then
  bD�butImpressionPlanningLocal = False
  If Not bS�lectionImprimante(sImprimante) Then Exit Function
  ImprimanteRectoVerso
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
  bD�butImpressionPlanningLocal = True
End Function


Public Sub ImpVBPlanning(p_sLettres As String, p_dDatePlan As Date)
  dDatePlan = p_dDatePlan
  sLettres = p_sLettres
  
  Set colPlannings = RecherchePlanning(p_dDatePlan, p_sLettres)
  
  Dim u As Utilisateur
  Set u = UtiParLettres(sLettres)
  If u Is Nothing Then
    sNomAssistant = sGetIntlLib("PLipUtilInc", "Utilisateur inconnu")
  Else
    sNomAssistant = u.uti_nom
  End If
  sSysRef = sLettreSyst�meG�rantLesLettres(sLettres)
  
  DoFormatage
End Sub


Public Sub FinImpressionPlanningLocal()
#If bImprime Then
  MyPrinterEndDoc
#End If
#If bAffichage Then
'  Unload frmImprimante
#End If
  
  Screen.MousePointer = vbDefault
End Sub



Private Sub DoFormatage()
  ' Nouvelle page
#If bAffichage Then
  frmImprimante.Cls
#End If
#If bImprime Then
  MyPrinterNewPageRecto     ' Un plannigng commence toujours au recto
#End If
  iPage = 0
  
  ' 1�re partie, le planning
  iNbIntTotal = 0
  iTotAb = 0
  iTotBs = 0
  iTotLi = 0
  iTotFS = 0
  iTotCh = 0
  iTotHu = 0
  iTotEh = 0
  
  For Each p In colPlannings
    Set e = LireEtablissement(p.pla_etb, True)
    
    If iNbIntTotal Mod iMaxIntParPage = 0 Then
      iPage = iPage + 1
      
#If bAffichage Then
      If iPage > 1 Then MsgBox "Page suivante": frmImprimante.Cls
      PlanningEnt�te frmImprimante
#End If
#If bImprime Then
      If iPage > 1 Then MyPrinterNewPage
      PlanningEnt�te Printer
#End If
    End If
    
#If bAffichage Then
    PlanningCorps frmImprimante
#End If
#If bImprime Then
    PlanningCorps Printer
#End If
    iNbIntTotal = iNbIntTotal + 1
    iNbIntSurPage = iNbIntSurPage + 1
    
    If IsNumeric(p.pla_nbab) Then iTotAb = iTotAb + p.pla_nbab
    If IsNumeric(p.pla_nbeh) Then iTotEh = iTotEh + p.pla_nbeh
    If IsNumeric(p.pla_nbbs) Then iTotBs = iTotBs + p.pla_nbbs
    If IsNumeric(p.pla_nbli) Then iTotLi = iTotLi + p.pla_nbli
    If IsNumeric(p.pla_nbfs) Then iTotFS = iTotFS + p.pla_nbfs
    If IsNumeric(p.pla_nbhu) Then iTotHu = iTotHu + p.pla_nbhu
    If IsNumeric(p.pla_nbch) Then iTotCh = iTotCh + p.pla_nbch
  Next
  
  
  ' S'il ne reste pas assez de place en bas de la derni�re page,
  ' on passe � la page suivante
  If (iNbIntTotal Mod iMaxIntParPage) > iMaxIntPageFin Or (iNbIntTotal Mod iMaxIntParPage = 0) Then
    iPage = iPage + 1
    
#If bAffichage Then
    MsgBox "Page suivante"
    frmImprimante.Cls
    PlanningEnt�te frmImprimante
#End If
#If bImprime Then
    MyPrinterNewPage
    PlanningEnt�te Printer
#End If
  End If
  
  
  
  ' Pied de planning (totaux, calendrier, ...)
#If bAffichage Then
  PlanningPied frmImprimante
#End If
#If bImprime Then
  PlanningPied Printer
#End If



  ' 2�me partie, la feuille de route
  ' Pas de feuille de route apr�s la tourn�e, ni pour les plannings en attente
'$$ PV
  If dDatePlan >= Today And dDatePlan <> dAttente Then
#If bAffichage Then
    FDRCorps frmImprimante
#End If
#If bImprime Then
    FDRCorps Printer
#End If


#If bAffichage Then
    MsgBox "Page suivante"
    frmImprimante.Cls
#End If
  End If
  
  Set p = Nothing
  Set e = Nothing
  
End Sub


Private Sub PlanningEnt�te(o As Object)
  ' Bandeau d'identification
Dim Elt1 As String
Dim Elt2 As String
  Texte o, 0, 0, "."
  With o.Font
    .Name = "Verdana"
    .Bold = True
    .Italic = True
    .Size = FSize(o, 8.5)
  End With
  o.FontTransparent = False   ' Sinon sur la 5Si le texte n'est pas transparent
  Texte o, 10, 12, sGetIntlLib("PLipMicrob", "Microb'Soft: Planning")
  o.FontTransparent = True    ' Suite de l'astuce pour 5Si
  With o.Font
    .Italic = False
    .Bold = False
  End With
  Elt1 = sGetIntlLib("PLipImprim", " - Imprim� le ")
  Elt2 = sGetIntlLib("PLipPar", " par ")
  o.Print (Elt1 & " " & Format(Now, "ddd dd mmm yyyy hh:MM") & " " & Elt2 & " " & sNomOp�rateur);
  
  If iPage > 1 Then
    TexteDroite o, 287, 12, sGetIntlLib("PLipPage", "Page ") & " " & iPage
  End If
  
  o.Font.Bold = True
  Texte o, 10, 15.5, sGetIntlLib("PLipApTour", "Apr�s la tourn�e, ce planning doit �tre transmis avec les corrections �ventuelles par fax le jour m�me au secr�tariat et au responsable r�gional.")
  o.Font.Bold = False
    
  ' T�te du planning
  o.DrawWidth = 3
  
  o.Line (10, 20)-(285, 39), 0, B
  o.Line (10, 30)-(285, 30)
  o.Line (colEtb, 30)-Step(0, 9)
  o.Line (colCNS, 30)-Step(0, 9)
  o.Line (colPers, 30)-Step(0, 9)
  o.Line (colHeu, 30)-Step(0, 9)
  o.Line (colAB, 30)-Step(0, 9)
  o.Line (colBS, 35)-Step(0, 4)
  o.Line (colLi, 35)-Step(0, 4)
  o.Line (colFS, 35)-Step(0, 4)
  o.Line (colHu, 35)-Step(0, 4)
  o.Line (colCh, 35)-Step(0, 4)
  o.Line (colEH, 30)-Step(0, 9)
  o.Line (colGrSc, 35)-Step(0, 4)
  o.Line (colLabo, 30)-Step(0, 9)
  o.Line (colAP, 30)-Step(0, 9)
  o.Line (colD�c, 30)-Step(0, 9)
'  o.Line (colNC, 30)-Step(0, 9)
  o.Line (colRem, 30)-Step(0, 9)
  o.Line (285, 21)-Step(1, 19), 0, BF
  
  With o.Font
    .Size = FSize(o, 9.5)
    .Bold = True
  End With
  Texte o, 30, 20.5, sGetIntlLib("PLipPlanning", "PLANNING")
  Texte o, 30, 25, sNomSyst�meUnix(sSysRef) & " (" & sSysRef & ")"
  o.Font.Bold = False
  Texte o, 110, 20.5, sGetIntlLib("PLipDate", "DATE :")
  Texte o, 110, 25, sGetIntlLib("PLipLettres", "LETTRES :")
  o.Font.Bold = True
  If dDatePlan = dAttente Then
    Texte o, 133, 20.5, sGetIntlLib("PLipAttente", "ATTENTE")
  Else
    Texte o, 133, 20.5, Format(dDatePlan, "ddd dd/mm/yyyy")
  End If
  Texte o, 133, 25, sLettres
  o.Font.Size = FSize(o, 9)
  Texte o, 140, 25, sNomAssistant
  o.Font.Bold = False
'  If Not IsNull(dDateClot) Then
'    Texte o, 30, 25, "Cl�t le " & Format(dDateClot, "dd/mm/yyyy") & " par " & iPersClot & ": " & sNomPersClot
'  End If
  
  o.Font.Size = FSize(o, 8)
  TexteCentr� o, colRef, colEtb, 30.5, sGetIntlLib("PLipRef", "R�f�rence")
  TexteCentr� o, colEtb, colCNS, 30.5, sGetIntlLib("PLipPrefEt", "Pr�fixe/�tablissement")
  TexteCentr� o, colCNS, colPers, 30.5, sGetIntlLib("PLipPrAc", "Pr/Ac")
  TexteCentr� o, colPers, colHeu, 30.5, sGetIntlLib("PLipPer", "Personne")
  If colAB - colHeu > 0 Then TexteCentr� o, colHeu, colAB, 30.5, sGetIntlLib("PLipHarr", "H Arr")
  TexteCentr� o, colAB, colEH, 30.5, sGetIntlLib("PLipAnal", "ANALYSES")
  
  TexteCentr� o, colEH, colGrSc, 30.5, sGetIntlLib("PLipEH", "EH")
  TexteCentr� o, colGrSc, colLabo, 30.5, sGetIntlLib("PLipGrSc", "Gr/Sc")
  TexteCentr� o, colLabo, colAP, 30.5, sGetIntlLib("PLipLa", "La")
  TexteCentr� o, colAP, colD�c, 30.5, sGetIntlLib("PLipAp", "AP")
  TexteCentr� o, colD�c, colRem, 30.5, sGetIntlLib("PLipDe", "D�")
  
'  TexteCentr� o, colNC, colRem, 30.5, "NC"
  TexteCentr� o, colRem, 285, 30.5, sGetIntlLib("PLipComm", "Commentaire")
  
  TexteCentr� o, colRef, colEtb, 34.5, sGetIntlLib("PLipValid�e", "Valid�e")
  TexteCentr� o, colEtb, colCNS, 34.5, sGetIntlLib("PLipEtSec", "N�Etb/N�Sec")
  TexteCentr� o, colCNS, colPers, 34.5, sGetIntlLib("PLipCliCNS", "Client CNS")
  TexteCentr� o, colPers, colHeu, 34.5, sGetIntlLib("PLipUnit", "Unit�")
  
  If colAB - colHeu > 0 Then TexteCentr� o, colHeu, colAB, 34.5, sGetIntlLib("PLipHdep", "H D�p")
  TexteCentr� o, colAB, colBS, 34.5, sGetIntlLib("PLlblNbAB", "AB")
  TexteCentr� o, colBS, colLi, 34.5, "BS"
  TexteCentr� o, colLi, colFS, 34.5, "Li"
  TexteCentr� o, colFS, colHu, 34.5, "FS"
  TexteCentr� o, colHu, colCh, 34.5, "Hu"
  TexteCentr� o, colCh, colEH, 34.5, "Ch"
  TexteCentr� o, colEH, colGrSc, 34.5, sGetIntlLib("PLipNb", "Nb")
  TexteCentr� o, colGrSc, colLabo, 34.5, sGetIntlLib("PLipDur�e", "Dur�e")
  TexteCentr� o, colAP, colD�c, 34.5, sGetIntlLib("PLipFP", "FP")
'  TexteCentr� o, colD�c, colNC, 34.5, "Fa"
'  TexteCentr� o, colNC, colRem, 34.5, "NP"
  TexteCentr� o, colRem, 285, 34.5, sGetIntlLib("PLipCmdCli", "Cmd client")
  
  iNbIntSurPage = 0
  
  MyPrinterPrint "Planning " & sLettres & " " & dDatePlan & " (Page " & iPage & ")"
End Sub


Private Sub PlanningCorps(o As Object)
  Dim fTop As Single
  
  MyPrinterPrint "Intervention " & sLettres & p.pla_iref
  
  fTop = 39 + 7 * iNbIntSurPage
  
  ' Fond gris pour les �tablissements [Supprim�]/[A Supprimer]
  If Left(e.etb_nom, 1) = "[" Then o.Line (10, fTop)-(285, fTop + 7), RGB(220, 220, 220), BF
  
  ' Ombrage � droite
  o.Line (285, fTop)-Step(1, 7), 0, BF
  
  o.Font.Size = FSize(o, 7.5)
  o.Font.Bold = True
  Texte o, colRef + deltaH, fTop + deltaV1, sLettres & p.pla_iref
  TexteTronqu� o, colEtb + deltaH, colCNS, fTop + deltaV1, e.etb_prefixe & " " & e.etb_nom
  o.Font.Bold = False
  
  If Not IsNull(p.pla_datevalid) Then
    Texte o, colRef + deltaH, fTop + deltaV2, sGetIntlLib("PLipval", "val")
  End If
  
  Texte o, colEtb + deltaH, fTop + deltaV2, p.pla_etb & "/" & e.etb_numsec
  
  If Format(p.pla_activite) <> "" Or Format(p.pla_typeprest) <> "" Then
    Texte o, colCNS + deltaH, fTop + deltaV1, Format(p.pla_typeprest) & "/" & Format(p.pla_activite)
  End If
  TexteTronqu� o, colCNS + deltaH, colPers, fTop + deltaV2, Format(p.pla_client)
  
  TexteTronqu� o, colPers + deltaH, colHeu, fTop + deltaV1, p.pla_pers & " " & sNomUtilisateur(p.pla_pers)
  TexteTronqu� o, colPers + deltaH, colHeu, fTop + deltaV2, sCodeUnit�(p.pla_unite)
  
  If colAB - colHeu > 0 Then
    TexteDroite o, colAB - deltaH, fTop + deltaV1, Format(p.pla_harrivee)
    TexteDroite o, colAB - deltaH, fTop + deltaV2, Format(p.pla_hdepart)
  End If
  
  TexteDroite o, colBS - deltaH, fTop + deltaV1, Format(p.pla_nbab, "#")
  TexteDroite o, colLi - deltaH, fTop + deltaV1, Format(p.pla_nbbs, "#")
  TexteDroite o, colFS - deltaH, fTop + deltaV1, Format(p.pla_nbli, "#")
  TexteDroite o, colHu - deltaH, fTop + deltaV1, Format(p.pla_nbfs, "#")
  TexteDroite o, colCh - deltaH, fTop + deltaV1, Format(p.pla_nbhu, "#")
  TexteDroite o, colEH - deltaH, fTop + deltaV1, Format(p.pla_nbch, "#")
  TexteDroite o, colGrSc - deltaH, fTop + deltaV1, Format(p.pla_nbeh, "#")
  TexteDroite o, colLabo - deltaH, fTop + deltaV1, NV(p.pla_numeh)
  TexteDroite o, colLabo - deltaH, fTop + deltaV2, Format(p.pla_dureh, "#")
  
  TexteCentr� o, colLabo, colAP, fTop + deltaV1, Format(p.pla_labo)
  
  TexteCentr� o, colAP, colD�c, fTop + deltaV1, Format(p.pla_avispassage)
  TexteCentr� o, colAP, colD�c, fTop + deltaV2, Format(p.pla_fpstandard)
  
  TexteCentr� o, colD�c, colRem, fTop + deltaV1, Format(p.pla_decoupage)
'  TexteCentr� o, colD�c, colNC, fTop + deltaV2, Format(p.pla_fact)
  
'  TexteCentr� o, colNC, colRem, fTop + deltaV1, Format(p.pla_facncp)
'  TexteCentr� o, colNC, colRem, fTop + deltaV2, Format(p.pla_facndp)
  
  TexteTronqu� o, colRem + deltaH, 285, fTop + deltaV1, NV(p.pla_comment)
  TexteTronqu� o, colRem + deltaH, 285, fTop + deltaV2, NV(p.pla_refcom)
  
  o.Line (10, fTop)-Step(275, 7), 0, B
  o.Line (colEtb, fTop)-Step(0, 7)
  o.Line (colCNS, fTop)-Step(0, 7)
  o.Line (colPers, fTop)-Step(0, 7)
  o.Line (colHeu, fTop)-Step(0, 7)
  o.Line (colAB, fTop)-Step(0, 7)
  o.Line (colBS, fTop)-Step(0, 7)
  o.Line (colLi, fTop)-Step(0, 7)
  o.Line (colFS, fTop)-Step(0, 7)
  o.Line (colHu, fTop)-Step(0, 7)
  o.Line (colCh, fTop)-Step(0, 7)
  o.Line (colEH, fTop)-Step(0, 7)
  o.Line (colGrSc, fTop)-Step(0, 7)
  o.Line (colLabo, fTop)-Step(0, 7)
  o.Line (colAP, fTop)-Step(0, 7)
  o.Line (colD�c, fTop)-Step(0, 7)
'  o.Line (colNC, fTop)-Step(0, 7)
  o.Line (colRem, fTop)-Step(0, 7)
End Sub



Private Sub PlanningPied(o As Object)

  MyPrinterPrint "Pied de planning"
  
  Dim fTop As Single
  
  fTop = 39 + 7 * iNbIntSurPage
  o.Line (11, fTop)-Step(275, 1), 0, BF
  
  o.Font.Size = FSize(o, 8)
  
  Texte o, 12, fTop + 1, iNbIntTotal & " " & sGetIntlLib("PLipintervention", " intervention")
  If iNbIntTotal > 1 Then o.Print "s";
  If iTotAb > 0 Then TexteDroite o, colBS - deltaH, fTop + 1, Format(iTotAb)
  If iTotBs > 0 Then TexteDroite o, colLi - deltaH, fTop + 1, Format(iTotBs)
  If iTotLi > 0 Then TexteDroite o, colFS - deltaH, fTop + 1, Format(iTotLi)
  If iTotFS > 0 Then TexteDroite o, colHu - deltaH, fTop + 1, Format(iTotFS)
  If iTotHu > 0 Then TexteDroite o, colCh - deltaH, fTop + 1, Format(iTotHu)
  If iTotCh > 0 Then TexteDroite o, colEH - deltaH, fTop + 1, Format(iTotCh)
  If iTotEh > 0 Then TexteDroite o, colGrSc - deltaH, fTop + 1, Format(iTotEh)
  
  
  Const l0 = 183    ' D�but des infos de pied de page
  
  If dDatePlan <= Today Then
    ' Apr�s la tourn�e, on imprime le calendrier secr�tariat
  
    o.Font.Size = FSize(o, 8)
  
    Texte o, 10, l0, sGetIntlLib("PLipDateArr", "Date d'arriv�e des EH:")
    Texte o, 10, l0 + 5, sGetIntlLib("PLipSaisie", "Saisie par / le:")
    Texte o, 10, l0 + 10, sGetIntlLib("PLipMiseRelec", "Mise en relecture le:")

    Texte o, 110, l0, sGetIntlLib("PLipRelec", "Relecture:")
    Texte o, 110, l0 + 5, sGetIntlLib("PLipValid", "Validation:")
    Texte o, 110, l0 + 10, sGetIntlLib("PLipEnvoi", "Envoi:")
  
  Else
    ' Pour un planning du futur, on imprime la l�gende
    Dim s As String
  
    s = "L�gende :|" & _
      "Pr/Ac, Client CNS: Codes analytiques consulting type de prestation, activit� et client|" & _
      "Personne, Unit�: Utilis� pour l'imputation du CA en facturation|" & _
      IIf(colAB - colHeu > 0, "H Arr/H d�p: Heures d'arriv�e et de d�part sur l'�tablissement|", "") & _
      "Analyses: AB=Analyse Bact�rio standard, BS=Bact�rio Sp�ciale, Li=List�ria,FS=Frottis de Surface, Hu=Huile, Ch=Chimie|" & _
      "EH: Gr/Sc=N� grille/Sc�nario, Dur�e=dur�e contractuelle de l'audit en minutes|" & _
      "La: Labo: R=Fontaine, H=Roanne, C=Cergy, T=La Rochelle, O=Osny, B=Bergamo, X=St-Niklaas, K=Birmingham|" & _
      "AP: Avis de passage, FP: Fiche de pr�l�vement standard|" & _
      "D�: R�gle de d�coupage du dossier pour la facturation et l'envoi: a=1 tranche analyses+EH+CH, b=2 tranches (analyses+EH) et CH, c=3 tranches AB, EH et CH|" & _
      "Commentaire/Cmd client: Commentaire libre et r�f�rence de la commande client|"
    
    Dim x As Single, y As Single
    Dim p1 As Integer, nbl As Integer
    
    x = 10
    y = l0
    o.Font.Size = FSize(o, 6)
    Do Until s = ""
      p1 = InStr(1, s, "|")
      nbl = BlocTexte(o, x, y, 138, Left(s, p1 - 1))
      y = y + nbl * o.TextHeight("x")
      If x = 10 And y > 200 Then
        x = 150
        y = l0
      End If
      s = Mid(s, p1 + 1)
    Loop
  End If

  ' Pour l'instant, plus de de calendrier
  Exit Sub
  
  ' Calendrier
  Dim i As Integer, d As Date
  d = dDatePlan
  For i = 0 To 9
    If Weekday(d) = vbSunday Or Weekday(d) = vbSaturday Then
      o.Line (10 + 19 * i, 273)-Step(19, 7), RGB(200, 200, 200), BF
    End If
    o.Line (10 + 19 * i, 273)-Step(0, 7)
    o.Line -Step(19, 0)
    o.Line -Step(0, -7)
    Texte o, 11 + 19 * i, 272.5, Format(d, "ddd dd")
    If i = 0 Or Day(d) = 1 Then Texte o, 11 + 19 * i, 276, Format(d, "mmm")
    d = d + 1
  Next
End Sub



' ============================================================================
' FEUILLE DE ROUTE

Private Sub FDREnt�te(o As Object)
  ' Bandeau d'identification
Dim Elt1 As String
Dim Elt2 As String
  Texte o, 0, 0, "."
  With o.Font
    .Name = "Verdana"
    .Bold = True
    .Italic = True
    .Size = FSize(o, 8.5)
  End With
  Texte o, 10, 12, sGetIntlLib("PLipFeuille", "Microb'Soft: Feuille de route")
  With o.Font
    .Italic = False
    .Bold = False
  End With
  
  Elt1 = sGetIntlLib("PLipImprim", " - Imprim� le ")
  Elt2 = sGetIntlLib("PLipPar", " par ")
 o.Print (Elt1 & " " & Format(Now, "ddd dd mmm yyyy hh:MM") & " " & Elt2 & " " & sNomOp�rateur);
  
  iPage = iPage + 1
  TexteDroite o, 200, 12, "Page " & iPage
End Sub



Private Sub AjouteHi�rarchie(ByVal iNiv As Integer, ByVal sTitre As String, col As Collection, iNumXXX As Long, e As Etablissement)
  Dim o As Hi�rarchieFDR, iErr As Long
  On Error Resume Next
  Set o = col("H" & iNiv & iNumXXX)
  iErr = Err.Number
  On Error GoTo 0
  If iErr <> 0 Then
    Set o = New Hi�rarchieFDR
    Dim f As FDR
    Set f = LireFDR(iNiv, iNumXXX)
    If f Is Nothing Then Exit Sub
    o.sTitre = sTitre & " " & iNumXXX & ": " & f.sNom
    o.sEtbsConcern�s = e.etb_numetb
    o.sFDR = f.sFDR
    o.iParent = NZ(f.iParent)
    col.Add o, "H" & iNiv & iNumXXX
  Else
    o.sEtbsConcern�s = o.sEtbsConcern�s & ", " & e.etb_numetb
  End If
  ' Un peu de r�cursivit� !
  Select Case iNiv
    Case 2: AjouteHi�rarchie 3, "Direction r�gionale", colDrg, o.iParent, e
    Case 3: AjouteHi�rarchie 4, "Direction nationale", colDna, o.iParent, e
    Case 4: AjouteHi�rarchie 5, "Groupe", colGrp, o.iParent, e
  End Select
End Sub


Private Sub TexteFDRHi�rarchique(ByRef sFDR As String, col As Collection)
  Dim o As Hi�rarchieFDR
  For Each o In col
    If o.sFDR <> "" Then
      sFDR = sFDR & "*" & o.sTitre & " (Etb: " & o.sEtbsConcern�s & ")|" & o.sFDR & "||"
    End If
  Next
End Sub


Private Sub FDRCorps(o As Object)
  Dim sFDR As String
  Dim sCD As String
  
  Dim sformat As String
  sformat = sGetIntlLib("PLipTopFDR", "Planning %1 %2 du %3")
  sFDR = "*" & sprintf(sformat, sLettres, sNomAssistant, Format(dDatePlan, "ddd dd/mm/yyyy")) & "||"

  EffaceCollection colSec
  EffaceCollection colDrg
  EffaceCollection colDna
  EffaceCollection colGrp
  
  ' Contraintes et feuille de route etb
  For Each p In colPlannings
    Set e = LireEtablissement(p.pla_etb, True)
    sCD = ""
    If e.etb_contraintes <> "" Then sCD = msdExpansionContrainte(dDatePlan, e.etb_contraintes)
  ' On rep�re les �tablissements [Supprim�]/[A Supprimer]
    If Left(e.etb_nom, 1) = "[" Then
      Dim pc As Integer
      pc = InStr(e.etb_nom, "]")
      If pc = 0 Then pc = 10
      If sCD <> "" Then sCD = sCD & "|"
      sCD = sCD & sGetIntlLib("PLipAttention", "ATENTION - �tablissement � l'�tat ") & " " & Left(e.etb_nom, pc) & sGetIntlLib("PLipPasPlan", ".|Ne doit pas �tre planifi�, ou doit �tre r�ouvert sur le serveur.")
    End If
    If sCD <> "" Or e.etb_fdr <> "" Then
      sFDR = sFDR & "*Etb " & e.etb_numetb & ": " & e.etb_prefixe & " " & e.etb_nom & "|"
      If sCD <> "" Then sFDR = sFDR & sCD & "|"
      If e.etb_fdr <> "" Then sFDR = sFDR & e.etb_fdr & "|"
      sFDR = sFDR & "|"
    End If
    AjouteHi�rarchie 2, "Secteur", colSec, e.etb_numsec, e
  Next
  
  ' Ensuite on ajoute les feuilles de route issues de la hi�rarchie
  TexteFDRHi�rarchique sFDR, colSec
  TexteFDRHi�rarchique sFDR, colDrg
  TexteFDRHi�rarchique sFDR, colDna
  TexteFDRHi�rarchique sFDR, colGrp
  
  
  ' Et on imprime tout �a !
  o.Font.Size = FSize(o, 8)
  Dim x As Single, y As Single, dy As Single
  Dim nbl As Integer
  Dim p1 As Integer
  Dim bBold As Boolean
  Dim sTxt As String
  
  ' On force un saut de page d�s le d�but
  x = 150
  y = 200
  
  sFDR = sFDR & "|"
  Do Until sFDR = ""
    p1 = InStr(1, sFDR, "|")
    If Left(sFDR, 1) = "*" Then
      bBold = True
      sFDR = Mid(sFDR, 2)
      p1 = p1 - 1
    Else
      bBold = False
    End If
    
    If bBold Then o.Font.Bold = True
    sTxt = Left(sFDR, p1 - 1)
    nbl = BlocTexte(o, x, y, 130, sTxt, 99, False)
    dy = nbl * o.TextHeight(sTxt)
    If y + dy > 196 Then
      If x > 10 Then
        x = 10
#If bAffichage Then
        MsgBox "Page suivante"
        frmImprimante.Cls
#End If
#If bImprime Then
        MyPrinterNewPage
        MyPrinterPrint "Feuille de route (Page " & " " & iPage & ")"
#End If
        FDREnt�te o
      Else
        x = 150
      End If
      y = 20
    End If
    BlocTexte o, x, y, 130, sTxt
    If bBold Then o.Font.Bold = False
    
    sFDR = Mid(sFDR, p1 + 1)
    y = y + dy
  Loop
End Sub

