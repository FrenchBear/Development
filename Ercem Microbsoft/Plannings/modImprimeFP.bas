Attribute VB_Name = "modImprimeFP"
' modImprimeFP
' Mise en page/Impression locale des fiches de prélèvement
' 16/11/00 PV
'  6/12/00 PV FP pour les chimies; Gestion des bacs
'  8/12/00 PV Noms de champs dans des variables
' 26/02/00 PV Fin de l'impression du code barre en 75dpi sur IIISi
'  5/03/01 PV FP vierges, récap NbXX sur la fiche .01
' 27/03/01 PV Bug total huiles; pas d'impression si pla_fpstandard="N"
' 19/11/01 PV+FF Champs de la FP en néerlandais pour la belgique


Option Explicit

#Const bImprime = True
#Const bAffichage = False

' Variables globales pour simplifier

' Planning/Intervention courants
Private sNomAssistant As String
Private colPlannings As Collection        ' Le planning en cours d'impression
Private p As Intervention
Private e As Etablissement


' Mise en page/Totaux
Private iNbFPTotal As Integer             ' Nb de FP total imprimées
Private iNbFPEtb As Integer               ' Nb FP imprimées pour l'établissement
Private iNbFP As Integer                  ' Nb de FP à imprimer

' Formatage de la FP
Private Const v1 As Single = 135 / 18     ' Module vertical
Private Const h1 As Single = 64           ' Module horizontal
Private fTop As Single

Private bFPVierge As Boolean


Private Const fLabelSize = 7
Private Const fNumSize = 6

Private sChamp0 As String
Private sChamp1 As String
Private sChamp1x As String
Private sChamp4 As String
Private sChamp5 As String
Private sChamp5b As String
Private sChamp6 As String
Private sChamp6b As String
Private sChamp7 As String
Private sChamp8 As String
Private sChamp9 As String
Private sChamp10 As String
Private sChamp11 As String
Private sChamp12 As String
Private sChamp13 As String
Private sChamp14 As String
Private sChamp15 As String
Private sChamp16 As String
Private sChamp17 As String
Private sChamp18 As String
Private sChamp19 As String
Private sChamp20 As String
Private sChamp21 As String
Private sChamp22 As String
Private sChamp23 As String
Private sChamp24 As String
Private sChamp25 As String
Private sChamp26 As String
Private sChamp27 As String
Private sChamp28 As String
Private sChamp29 As String
Private sChamp30 As String
Private sChamp31 As String
Private sChamp32 As String
Private sChamp33 As String
Private sChamp34 As String
Private sChamp35 As String
Private sChamp36 As String
Private sChamp37 As String
Private sChamp90 As String


Public Function bDébutImpressionFPLocal(sImprimante As String) As Boolean
#If bAffichage Then
  frmImprimante.Show
  frmImprimante.Caption = "Aperçu FP"
#End If
#If bImprime Then
  bDébutImpressionFPLocal = False
  If Not bSélectionImprimante(sImprimante) Then Exit Function
  ImprimanteRectoVerso vbPRDPSimplex
  ImprimanteMilimetres
  ImprimantePapier IIf(iBacFP <= 0, vbPRBNAuto, iBacFP)
  ImprimanteRésolutionFaible
  
  ' On considère que la zone d'impression est centrée sur la page,
  ' sinon le point de coordonnées (0,0) est le premier pixel imprimable en haut à gauche
  ' Du coup, les coordonnées sont exprimées en mm par rapport aux marges gauche et haut,
  ' ce qui est plus simple…
  Dim sw As Single, sh As Single
  sw = Printer.ScaleWidth
  sh = Printer.ScaleHeight
  ' Orientation portrait
  Printer.ScaleLeft = (210 - sw) / 2
  Printer.ScaleTop = (297 - sh) / 2
#End If

  ' Par défaut on est sur la première page
  iNbFPTotal = 0
  sNomAssistant = ""
  
  InitChamps
  Screen.MousePointer = vbHourglass
  bDébutImpressionFPLocal = True
End Function


Public Sub ImpVBFP(sLettres As String, dDatePlan As Date)
  Set colPlannings = RecherchePlanning(dDatePlan, sLettres)
  bFPVierge = False
  For Each p In colPlannings
    DoFormatageFPPrest
  Next
End Sub

Public Sub ImpVB1FP(p0 As Intervention)
  Set p = p0
  bFPVierge = False
  DoFormatageFPPrest
End Sub

Public Sub ImpVBFPVierge(iNb As Integer)
  Set p = New Intervention
  p.pla_nbab = iNb
  bFPVierge = True
  DoFormatageFPPrest
End Sub



Public Sub FinImpressionFPLocal()
#If bImprime Then
  If iNbFPTotal > 0 Then Printer.EndDoc
#End If
#If bAffichage Then
'  Unload frmImprimante
#End If
  Screen.MousePointer = vbDefault
  SetStatus
End Sub



Private Sub DoFormatageFPPrest()
  If bFPVierge Then
    SetStatus "Imp FP vierge"
  Else
    If p.pla_fpstandard = "N" Then Exit Sub
    
    SetStatus "Imp FP " & p.pla_dateplan & " " & p.pla_lettres & p.pla_iref
    If sNomAssistant = "" Then
      Dim u As Utilisateur
      Set u = UtiParLettres(p.pla_lettres)
      If u Is Nothing Then
        sNomAssistant = "Utilisateur inconnu"
      Else
        sNomAssistant = u.uti_nom
      End If
    End If
    
    ' Si la référence n'a pas encore été générée, on en profite pour le faire
    If IsNull(p.pla_iref) Then frmPlanning.GénèreUneRéférence p
  End If

  iNbFP = NZ(p.pla_nbab) + NZ(p.pla_nbbs) + NZ(p.pla_nbli) + NZ(p.pla_nbfs) + NZ(p.pla_nbhu) + NZ(p.pla_nbch)
  If iNbFP >= 100 Then iNbFP = 99
  If iNbFP > 0 Then
    Set e = LireEtablissement(p.pla_etb, True)
    
    iNbFPEtb = 0
    Dim i As Integer
    For i = 1 To iNbFP
#If bAffichage Then
      Do1FP frmImprimante, i
#End If
#If bImprime Then
      Do1FP Printer, i
#End If
    Next
  End If
End Sub
  
  

Private Sub Do1FP(o As Object, iEch As Integer)
  If (iNbFPEtb Mod 2) = 0 And iNbFPTotal >= 1 Then
#If bAffichage Then
    MsgBox "Page suivante": frmImprimante.Cls
#End If
#If bImprime Then
    Printer.NewPage
#End If
  End If
  
  'If iEch = 2 Then InitChampsMagiques
  
  ' Impression de la FP à proprement parler
  Do1FPStandard o, iEch
  
  ' Une de plus !
  iNbFPEtb = iNbFPEtb + 1
  iNbFPTotal = iNbFPTotal + 1
End Sub


' Prépare le codage numérique du code barre échantillon
' Public, car utilisé par l'impression des étiquettes
Public Function PrépareCBEch(sLettres As String, iRef As Long, iEch As Integer, sEtb As String) As String
  Dim sCB As String
  Dim iEtbNum As Long, bEtbFimebio As Boolean, iSite As Integer
  Const sSite As String = "GAPMOTBCDEFHIJKLNQRSUVWXYZ"
  
  bEtbFimebio = bIsEtbFimebio(sEtb)
  iEtbNum = Val(sEtb)
  iSite = InStr(1, sSite, Left(sLettres, 1)) - 1
  iSite = 26 * iSite + Asc(Right(sLettres, 1)) - 65
  sCB = Format(iSite, "000") & Format(iRef, "000000") & Format(iEch, "00") & Format(iEtbNum, "00000")
  Dim s As Long, i As Integer
  For i = 1 To 16
    s = s + (i - 1) * Val(Mid(sCB, i, 1))
  Next
  If bEtbFimebio Then s = s + 11
  PrépareCBEch = sCB & Format(s Mod 100, "00")
End Function


Private Sub Do1FPStandard(o As Object, iEch As Integer)
  o.FontTransparent = False   ' Sinon sur la 5Si le texte n'est pas transparent
  Texte o, 0, 0, "."
  o.FontTransparent = True    ' Suite de l'astuce pour 5Si
  
  fTop = 10 + 140 * (iNbFPEtb Mod 2)
  
  o.DrawWidth = 1
  o.Line (10, fTop)-Step(192, 135), , B
  
  If Not bFPVierge Then
    With o.Font
      .Name = "Verdana"
      .Bold = True
      .Italic = False
      .Size = FSize(o, 8)
    End With
    Texte o, 11, fTop + 2, e.etb_prefixe & " " & e.etb_nom & " (" & e.etb_numetb & ")"
    o.Font.Bold = False
    
    Texte o, 11, fTop + 6, sNomAssistant
    Texte o, 11, fTop + 10, Format(p.pla_dateplan, "ddd dd/mm/yyyy")
    
    ' Code barre
    Dim sCB As String
    sCB = PrépareCBEch(p.pla_lettres, p.pla_iref, iEch, p.pla_etb)
    CodeBarre o, 76, fTop + 6, 0.3387, 6, sCB
    
    With o.Font
      .Bold = True
      .Italic = True
      .Size = FSize(o, 9)
    End With
    Texte o, 170, fTop + 2.2, p.pla_lettres & p.pla_iref & "." & Format(iEch, "00")
    With o.Font
      .Bold = False
      .Italic = False
    End With
  End If
  
  o.DrawWidth = 3
  o.Line (150, fTop)-Step(0, 2 * v1)
  o.Line (150, fTop + v1)-Step(52, 0)
  o.Line (176, fTop + v1)-Step(0, v1)
  Pavé o, 150, fTop, 17, True, sChamp0
  PavéNum o, 167, fTop, 35, "0"
  Pavé o, 150, fTop + v1, 14, False, sGetIntlLib("FPipOptionsLab", "Options|labo")
  Pavé o, 176, fTop + v1, 14, False, sGetIntlLib("FPipEdition", "Options|Edition")
  
  o.Line (30, fTop + 3 * v1)-Step(170, 0)
  
  o.DrawWidth = 9
  o.Line (10, fTop + 2 * v1)-Step(192, 0)
  o.Line (10, fTop + 4 * v1)-Step(192, 0)
  o.DrawWidth = 3
  o.Line (30, fTop + 2 * v1)-Step(0, 2 * v1)
  
  o.Font.Size = FSize(o, fLabelSize)
  BlocTexte o, 11, fTop + 2.5 * v1 + 2, 18, sChamp1x
  Pavé o, 30, fTop + 2 * v1, 28, True, sChamp1
  PavéNum o, 58, fTop + 2 * v1, 23, "1"
  PavéNum o, 81, fTop + 2 * v1, 87, "2"
  Pavé o, 168, fTop + 2 * v1, 14, True, sGetIntlLib("FPipCritereFDA", "Critère|FDA"), -1
  PavéNum o, 182, fTop + 2 * v1, 20, "3"
  Pavé o, 30, fTop + 3 * v1, 28, False, sChamp4
  PavéNum o, 58, fTop + 3 * v1, 144, "4"
  
  If bFPVierge Then
    Cellule o, 0, 4, sChamp5, True, "5"
  Else
    Cellule o, 0, 4, sChamp5, True, "5", Format(p.pla_dateplan, "short date")
  End If
  
  Cellule o, 0, 5, sChamp5b, True, "5b"
  Cellule o, 0, 6, sChamp6, True, "6"
  Cellule o, 0, 7, sChamp6b, True, "6b"
  Cellule o, 0, 8, sChamp7, True, "7", " 1 - 2 - 3 - 4"
  Cellule o, 0, 9, sChamp8, True, "8"
  Cellule o, 0, 10, sChamp9, True, "9", " 1 - 2 - 3"
  Cellule o, 0, 11, sChamp10, True, "10"
  Cellule o, 0, 12, sChamp11, False, "11"

  Cellule o, 1, 4, sChamp12, False, "12"
  Cellule o, 1, 5, sChamp13, False, "13"
  Cellule o, 1, 6, sChamp14, False, "14"
  Cellule o, 1, 7, sChamp15, False, "15"
  Cellule o, 1, 8, sChamp16, False, "16"
  Cellule o, 1, 9, sChamp17, False, "17"
  Cellule o, 1, 10, sChamp18, False, "18"
  Cellule o, 1, 11, sChamp19, False, "19"
  Cellule o, 1, 12, sChamp20, False, "20"
  Cellule o, 1, 13, sChamp35, False, "35"
  Cellule o, 1, 14, sChamp36, False, "36"
  Cellule o, 1, 15, sChamp37, False, "37"

  Cellule o, 2, 4, sChamp21, False, "21"
  Cellule o, 2, 5, sChamp22, False, "22"
  Cellule o, 2, 6, sChamp23, False, "23", , True
  Cellule o, 2, 7, sChamp24, False, "24"
  Cellule o, 2, 8, sChamp25, False, "25", , True
  Cellule o, 2, 9, sChamp26, False, "26", , True
  Cellule o, 2, 10, sChamp27, False, "27"
  Cellule o, 2, 11, sChamp28, False, "28"
  Cellule o, 2, 12, sChamp29, False, "29"
  Cellule o, 2, 13, sChamp30, False, "30"
  Cellule o, 2, 14, sChamp31, False, "31"
  Cellule o, 2, 15, sChamp32, False, "32"
  Cellule o, 2, 16, sChamp33, False, "33", , True
  Cellule o, 2, 17, sChamp34, False, "34"
  
  o.DrawWidth = 9
  o.Line (10, fTop + 13 * v1)-Step(1 * h1, 0)
  o.DrawWidth = 3
  
  o.Font.Size = FSize(o, 8)
  o.Font.Underline = True
  Texte o, 11, fTop + 13 * v1 + 1, sChamp90
  o.Font.Underline = False
  
  ' Date/Nom opérateurs/NbXX dans le bloc Observations
  If Not bFPVierge Then
    o.Font.Size = FSize(o, 7)
    Texte o, 11, fTop + 13 * v1 + 6, Format(Now, "ddd dd mmm yyyy hh:mm")
    Texte o, 11, fTop + 13 * v1 + 10, sNomOpérateur
    
    If iEch = 1 Then
      Texte o, 11, fTop + 13 * v1 + 14, iNbFP & " éch: "
    
      If NZ(p.pla_nbab) > 0 Then o.Print NZ(p.pla_nbab) & "AB ";
      If NZ(p.pla_nbbs) > 0 Then o.Print NZ(p.pla_nbbs) & "BS ";
      If NZ(p.pla_nbli) > 0 Then o.Print NZ(p.pla_nbli) & "Li ";
      If NZ(p.pla_nbfs) > 0 Then o.Print NZ(p.pla_nbfs) & "FS ";
      If NZ(p.pla_nbhu) > 0 Then o.Print NZ(p.pla_nbhu) & "Hu ";
      If NZ(p.pla_nbch) > 0 Then o.Print NZ(p.pla_nbch) & "Ch"
    End If
  End If
  
  o.Line (10 + 2 * h1 - 25, fTop + 17 * v1)-Step(25, v1), , B
  o.Line (10 + 2 * h1 - v1, fTop + 17 * v1)-Step(0, v1)
  o.Font.Size = FSize(o, fLabelSize)
  BlocTexte o, 10 + 2 * h1 - 25 + 1, fTop + 17 * v1 + 0.5, 25 - v1 - 2, sGetIntlLib("FPipCocher", "Cocher si|feuille suite")
End Sub


Private Sub Cellule(o As Object, iCol As Integer, iLig As Integer, sEtiquette As String, bInverse As Boolean, sNumCel As String, Optional sContenu As String = "", Optional bDemiCellule As Boolean = False)
  Dim x0 As Single, y0 As Single
  x0 = 10 + h1 * iCol
  y0 = fTop + v1 * iLig
  
  o.Line (x0, y0)-Step(h1, v1), , B
  Pavé o, x0, y0, 28, bInverse, sEtiquette, vbDot
  If sNumCel <> "" Then PavéNum o, x0 + 28, y0, h1 - 28, sNumCel
  If bDemiCellule Then
    o.DrawWidth = 1
    o.DrawStyle = vbDot
    o.Line (x0 + 28 + (h1 - 28) / 2 - 1, y0)-Step(0, v1)
    o.DrawStyle = vbSolid
    o.DrawWidth = 3
  End If
  
  If sContenu <> "" Then
    o.Font.Size = FSize(o, 9)
    Texte o, x0 + 28 + 1, y0 + 2, sContenu
  End If
End Sub


Private Sub Pavé(o As Object, x0 As Single, y0 As Single, fWidth As Single, bInverse As Boolean, sEtiquette As String, Optional iStyleDroit As Integer = vbSolid)
  If bInverse Then
    o.Line (x0, y0)-Step(fWidth, v1), , BF
    o.ForeColor = vbWhite
    o.FontBold = True
  Else
    o.ForeColor = vbBlack
    o.FontBold = False
    ' Trait du bas
    o.Line (x0, y0 + v1)-Step(fWidth, 0)
    If iStyleDroit <> -1 Then
      If iStyleDroit = vbDot Then o.DrawWidth = 1
      o.DrawStyle = iStyleDroit
      o.Line (x0 + fWidth, y0)-Step(0, v1)
      o.DrawStyle = vbSolid
      o.DrawWidth = 3
    End If
  End If
  
  o.Font.Size = FSize(o, fLabelSize)
  If o.TextWidth(sEtiquette) <= fWidth - 2 And InStr(1, sEtiquette, "|") = 0 And InStr(1, sEtiquette, vbCrLf) = 0 Then
    Texte o, x0 + 1, y0 + 2.1, sEtiquette
  Else
    BlocTexte o, x0 + 1, y0 + 0.5, fWidth - 2, sEtiquette
  End If
  o.ForeColor = vbBlack
End Sub


Private Sub PavéNum(o As Object, x0 As Single, y0 As Single, fWidth As Single, sNumCel As String)
  ' On dessine le bord inférieur et droit
  o.Line (x0, y0 + v1)-Step(fWidth, 0)
  o.Line (x0 + fWidth, y0)-Step(0, v1)
  
  o.Line (x0 + fWidth - 4, y0)-Step(4, 4), , BF
  o.ForeColor = vbWhite
  o.FontBold = True
  o.Font.Size = FSize(o, fNumSize)
  TexteCentré o, x0 + fWidth - 4, x0 + fWidth, y0 + 0.8, sNumCel
  o.ForeColor = vbBlack
  o.FontBold = False
End Sub


Private Sub InitChamps()
'iSystèmePays = 1
'iSystèmePays = 2
  Select Case iSystèmePays
    Case 1:     InitChampsAnglais
    Case 2:     InitChampsNéerlandais   ' Belgique
    Case Else:  InitChampsFrançais      ' Défaut + France
  End Select
End Sub
      
 
Private Sub InitChampsFrançais()
  sChamp0 = "Référence"
  sChamp1x = "Échantillon"
  sChamp1 = "N°|Appellation fichier"
  sChamp4 = "Précisions complémentaires"
  sChamp5 = "Date prélèvement"
  sChamp5b = "Heure prélèvement"
  sChamp6 = "Température produit"
  sChamp6b = "Température ambiance"
  sChamp7 = "Secteur de prélèvement"
  sChamp8 = "État physique"
  sChamp9 = "Intervention opérateur"
  sChamp10 = "Cadre de prélèvement"
  sChamp11 = "Date analyse prévue"
  sChamp12 = "Date+Heure de préparation"
  sChamp13 = "Date de déconditionnement"
  sChamp14 = "Lieu de prélèvement"
  sChamp15 = "Conditions de prélèvement"
  sChamp16 = "Mode de conditionnement"
  sChamp17 = "Contenant"
  sChamp18 = "État de division"
  sChamp19 = "Niveau d'élaboration"
  sChamp20 = "Technologie de fabrication"
  sChamp21 = "Fabricant/Emballeur|N° série"
  sChamp22 = "Fabricant/Emballeur|Nom"
  sChamp23 = "Date de fabrication/Conditionnement"
  sChamp24 = "Identification de lot"
  sChamp25 = "DLC/DLUO"
  sChamp26 = "DLC secondaire/Date de retrait"
  sChamp27 = "Code article"
  sChamp28 = "Code famille"
  sChamp29 = "Marque"
  sChamp30 = "Unité de vente"
  sChamp31 = "Distributeur|N° série"
  sChamp32 = "Distributeur|Nom"
  sChamp33 = "Date de livraison|Date réception client"
  sChamp34 = "Aspect échantillon"
  sChamp35 = "Site de prélèvt|(Rayon)"
  sChamp36 = "Code fabricant"
  sChamp37 = "Code emballeur"
  
  sChamp90 = "Observations"
End Sub


Private Sub InitChampsNéerlandais()
  ' A traduire !!!
  sChamp0 = "Referentie"                                    ' NL
  sChamp1x = "Staal"                                        ' NL
  sChamp1 = "N°|Fichenaam"                                  ' NL
  sChamp4 = "Extra Precisie"                                ' NL
  sChamp5 = "Staalnamedatum"                                ' NL
  sChamp5b = "Uur van de staalafname"                       ' NL
  sChamp6 = "Productstemperatuur"                           ' NL
  sChamp6b = "Omgevingstemperatuur"                         ' NL
  sChamp7 = "Sector van staalafname"                        ' NL
  sChamp8 = "Fysieke staat"                                 ' NL
  sChamp9 = "Interventie operator"                          ' NL
  sChamp10 = "Kader van staalafname"                        ' NL
  sChamp11 = "Verwachte analysedatum"                       ' NL
  sChamp12 = "Bereidingsdatum en Bereidingsuur"             'NL
  sChamp13 = "Datum uitpakken"                              ' NL
  sChamp14 = "Plaats van staalafname"                       ' NL
  sChamp15 = "Omstandigbeden van staalafname"               ' NL
  sChamp16 = "Verpakkingswijze"                             ' NL
  sChamp17 = "Recipiënt"                                    ' NL
  sChamp18 = "Staat van indeling"                           ' NL
  sChamp19 = "Productieniveau"                              ' NL
  sChamp20 = "Procestechnologie"                            ' NL
  sChamp21 = "Fabrikant/Verpakker|Serie N°"                 ' NL
  sChamp22 = "Fabrikant/Verpakker|Naam"                     ' NL
  sChamp23 = "Datum prod./verpak."                          ' NL
  sChamp24 = "Identificatie van her lot"                    ' NL
  sChamp25 = "UVD/OUVD"                                     ' NL
  sChamp26 = "Tweede UVD/Verwijderingdatum"                 ' NL
  sChamp27 = "Artikel code"                                 ' NL
  sChamp28 = "Code familie"                                 ' NL
  sChamp29 = "Merkteken"                                    ' NL
  sChamp30 = "Verkoopseenheid"                              ' NL
  sChamp31 = "Verdeler|Serie N°"                            ' NL
  sChamp32 = "Verdeler|Naam"                                ' NL
  sChamp33 = "Leveringsdatum|Ontvangst klant:"             ' NL
  sChamp34 = "Soort staal"                                  ' NL
  sChamp35 = "Staalnamesite| (Rayon)"                        ' NL
  sChamp36 = "Code fabrikant"                               ' NL
  sChamp37 = "Code verpakker"                               ' NL
  
  sChamp90 = "Commentaar"                                   ' NL
End Sub

Private Sub InitChampsAnglais()
  ' A traduire !!!
  sChamp0 = "Reference"                                    ' EN
  sChamp1x = "Sample"                                        ' EN
  sChamp1 = "Product #|Product name"
  sChamp4 = "Complementary information"
  sChamp5 = "Picked up on"                                ' EN
  sChamp5b = "Picked up at"                       ' EN
  sChamp6 = "Sample temp."                           ' EN
  sChamp6b = "Envir. temp."                         ' EN
  sChamp7 = "Sampling sector"                              ' EN
  sChamp8 = "Physical status"                                 ' EN
  sChamp9 = "Operator intervention"                          ' EN
  sChamp10 = "Sampling context"                        ' EN
  sChamp11 = "Analysis expected date"                       ' EN
  sChamp12 = "Prepared on/at"
  sChamp13 = "Depackaging date"                             ' EN
  sChamp14 = "Picking place"                               ' EN
  sChamp15 = "Picked up"               ' EN
  sChamp16 = "Packaging mode"                             ' EN
  sChamp17 = "Container"                                    ' EN
  sChamp18 = "Division status"                           ' EN
  sChamp19 = "Process level"                              ' EN
  sChamp20 = "Manufacturing technology"                            ' EN
  sChamp21 = "Maker/Packer|Serial #"                 ' EN
  sChamp22 = "Maker/Packer|Name"                     ' EN
  sChamp23 = "Made on/Packaged on"                          ' EN
  sChamp24 = "Batch #"                                    ' EN
  sChamp25 = "Best before"                                     ' EN
  sChamp26 = "Second UBD/Display until"                 ' EN
  sChamp27 = "Item#"                                ' EN
  sChamp28 = "Familly Code"                                 ' EN
  sChamp29 = "Brand name"                                    ' EN
  sChamp30 = "Sale unit"                              ' EN
  sChamp31 = "Distributor|Serial #"                            ' EN
  sChamp32 = "Distributor|Name"                                ' EN
  sChamp33 = "Delivered on|Cust.delivered on"             ' EN
  sChamp34 = "Sample aspect"                                  ' EN
  sChamp35 = "Sampling site| (department)"                        ' EN
  sChamp36 = "Maker code"                               ' EN
  sChamp37 = "Packer code"                               ' EN
  
  sChamp90 = "Comments"                                   ' EN
End Sub
Private Sub InitChampsMagiques()
  sChamp0 = "Référence magique"
  sChamp1x = "Échantillon magique"
  sChamp1 = "N°Philosophal|Nom magique"
  sChamp4 = "Enchantement supplémentaire"
  sChamp5 = "Date prélèvement magique"
  sChamp5b = "Heure mystère"
  sChamp6 = "Température divine"
  sChamp6b = "Température de désenvoûtement"
  sChamp7 = "Secteur magique"
  sChamp8 = "Sorcier en chef"
  sChamp9 = "Intervention magicien"
  sChamp10 = "Cadre magique"
  sChamp11 = "Date analyse magique prévue"
  sChamp12 = "Date+Heure d'enchantement"
  sChamp13 = "Date d'incantation initiale"
  sChamp14 = "Vaudou"
  sChamp15 = "Apprenti sorcier"
  sChamp16 = "Mode de vampirisation"
  sChamp17 = "Code magicien"
  sChamp18 = "Niveau sortilège"
  sChamp19 = "Code Merlin-3"
  sChamp20 = "Technologie de sorcellerie"
  sChamp21 = "Sorcier|N°"
  sChamp22 = "Sorcier|Nom"
  sChamp23 = "Date occulte/Date spirite"
  sChamp24 = "Charme utilisé"
  sChamp25 = "Date de maléfice/date de sort"
  sChamp26 = "Date de possession/date de malheur"
  sChamp27 = "Malheur"
  sChamp28 = "Philtre"
  sChamp29 = "Code occulte"
  sChamp30 = "Unité d'incantation"
  sChamp31 = "Enchanteur|N°"
  sChamp32 = "Enchanteur|Nom"
  sChamp33 = "Date de charme|Date incantation"
  sChamp34 = "Aspect diabolique"
  sChamp35 = "Tri magique"
  sChamp36 = "Code vampire"
  sChamp37 = "Code boule de cristal"
  
  sChamp90 = "Observations magiques"
End Sub
