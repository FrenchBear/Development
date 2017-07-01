Attribute VB_Name = "modImprimeAP"
' modImprimeAP
' Mise en page/Impression locale des avis de passage
' 17/11/00 PV
'  6/12/00 PV Gestion des bacs


Option Explicit

#Const bImprime = True
#Const bAffichage = False

' Variables globales pour simplifier

' Planning/Intervention courants
Private sNomAssistant As String
Private colPlannings As Collection        ' Le planning en cours d'impression
Private p As Intervention
Private e As Etablissement
Private s As Secteur
Private n As Unite

' Mise en page/Totaux
Private iNbAPTotal As Integer             ' Nb d'avis de passage total imprim�s

' Formatage du BL
Private fTop As Single

' BL group�s
Private colBLGroup�s As New Collection



Public Function bD�butImpressionAPLocal(sImprimante As String) As Boolean
#If bAffichage Then
  frmImprimante.Show
  frmImprimante.Caption = "Aper�u AP"
#End If
#If bImprime Then
  bD�butImpressionAPLocal = False
  If Not bS�lectionImprimante(sImprimante) Then Exit Function
  ImprimanteRectoVerso vbPRDPSimplex
  ImprimanteMilimetres
  ImprimantePapier IIf(iBacAP <= 0, vbPRBNAuto, iBacAP)
  ImprimanteR�solutionFaible

  ' On consid�re que la zone d'impression est centr�e sur la page,
  ' sinon le point de coordonn�es (0,0) est le premier pixel imprimable en haut � gauche
  ' Du coup, les coordonn�es sont exprim�es en mm par rapport aux marges gauche et haut,
  ' ce qui est plus simple�
  Dim sw As Single, sh As Single
  sw = Printer.ScaleWidth
  sh = Printer.ScaleHeight
  ' Orientation portrait
  Printer.ScaleLeft = (210 - sw) / 2
  Printer.ScaleTop = (297 - sh) / 2
#End If

  ' Par d�faut on est sur la premi�re page
  iNbAPTotal = 0
  sNomAssistant = ""
  
  EffaceCollection colBLGroup�s   ' Pour l'impression des bl isol�s
  Screen.MousePointer = vbHourglass
  bD�butImpressionAPLocal = True
End Function


Public Sub ImpVBAP(sLettres As String, dDatePlan As Date)
  EffaceCollection colBLGroup�s
  Set colPlannings = RecherchePlanning(dDatePlan, sLettres)
  For Each p In colPlannings
    DoFormatageAPPrest
  Next
End Sub

Public Sub ImpVB1AP(p0 As Intervention)
  Set p = p0
  DoFormatageAPPrest
End Sub



Public Sub FinImpressionAPLocal()
#If bImprime Then
  If iNbAPTotal > 0 Then Printer.EndDoc
#End If
#If bAffichage Then
'  Unload frmImprimante
#End If
  Screen.MousePointer = vbDefault
End Sub



Private Sub DoFormatageAPPrest()
  ' Version courte !
  If p.pla_avispassage = "N" Then Exit Sub

  If sNomAssistant = "" Then
    Dim u As Utilisateur
    Set u = UtiParLettres(p.pla_lettres)
    If u Is Nothing Then
      sNomAssistant = "Utilisateur inconnu"
    Else
      sNomAssistant = u.uti_nom
    End If
  End If

  ' Si la r�f�rence n'a pas encore �t� g�n�r�e, on en profite pour le faire
  If IsNull(p.pla_iref) Then frmPlanning.G�n�reUneR�f�rence p
  
  SetStatus "Imp AP " & p.pla_dateplan & " " & p.pla_lettres & p.pla_iref
  
  Set e = LireEtablissement(p.pla_etb, True)
  Set s = LireSecteur(e.etb_numsec)
  Set n = UniParNum�ro(p.pla_unite)
  
  ' Si l'AP est group� et qu'on a d�j� imprim� un AP pour le secteur, on d�gage
  ' La fonction bAPD�jaImprim�PourSecteur enregistre le secteur
  If s.sec_blgrp = "O" And bAPD�jaImprim�PourSecteur(e.etb_numsec) Then Exit Sub

#If bAffichage Then
  Do1BL frmImprimante
#End If
#If bImprime Then
  Do1BL Printer
#End If

End Sub



Private Function bAPD�jaImprim�PourSecteur(iNumsec As Long) As Boolean
  Dim s As String, iErr As Long
  On Error Resume Next
  s = colBLGroup�s("S" & iNumsec)
  iErr = Err.Number
  On Error GoTo 0
  If iErr = 0 Then
    bAPD�jaImprim�PourSecteur = True
  Else
    ' On en profite pour l'enregistrer dans la collection
    ' Ce qu'on ajoute � la collection n'a aucune importance, seule la cl� compte
    colBLGroup�s.Add "X", "S" & iNumsec
  End If
End Function
  
  

Private Sub Do1BL(o As Object)
  If (iNbAPTotal Mod 2) = 0 And iNbAPTotal >= 1 Then
#If bAffichage Then
    MsgBox "Page suivante": frmImprimante.Cls
#End If
#If bImprime Then
    Printer.NewPage
#End If
  End If
  
  ' Impression de la BL � proprement parler
  Do1APStandard o
  
  ' Une de plus !
  iNbAPTotal = iNbAPTotal + 1
End Sub



Private Sub Do1APStandard(o As Object)
  o.FontTransparent = False   ' Sinon sur la 5Si le texte n'est pas transparent
  Texte o, 0, 0, "."
  o.FontTransparent = True    ' Suite de l'astuce pour 5Si
  
  fTop = 10 + 140 * (iNbAPTotal Mod 2)

  'o.Line (10, fTop)-Step(190, 135), , B
  If fTop <= 50 Then
    o.DrawWidth = 1
    o.DrawStyle = vbDash
    o.Line (0, fTop + 137)-Step(210, 0)
    o.DrawStyle = vbSolid
    o.Font.Name = "Wingdings"
    Texte o, 7, fTop + 136, Chr(34)
  End If
  
  With o.Font
    .Name = "Verdana"
    .Bold = True
    .Italic = False
    .Size = FSize(o, 24)
  End With
  Texte o, 10, fTop + 3, "AVIS DE PASSAGE"
  
  ' Logo Silliker
  o.PaintPicture frmLogo.Picture, 140, fTop + 3, 60, 10
  
  ' Bloc d'adresse
  If s.sec_blgrp = "O" Then
    BlocAdresse o, "", s.sec_nom, s.sec_rue, s.sec_loc, s.sec_cpost & " " & s.sec_bdist
  Else
    BlocAdresse o, s.sec_nom, e.etb_nom, e.etb_rue, e.etb_loc, e.etb_cpost & " " & e.etb_bdist
  End If
  
  ' Bloc Prestation r�alis�e par
  Texte o, 10, fTop + 30, "Prestation r�alis�e par :"
  Texte o, 10, fTop + 34, sNomAssistant
  Texte o, 10, fTop + 38, n.uni_titre
  Texte o, 10, fTop + 42, n.uni_telfax
  
  Texte o, 10, fTop + 50, "Imprim� par " & sNomOp�rateur & " le " & Format(Now, "ddd dd/mm/yyyy")
  
  ' Premi�re ligne de blocs
  Bloc o, 10, 57.5, fTop + 60, 14, "R�f prestation", p.pla_lettres & p.pla_iref & IIf(s.sec_blgrp = "O", " & ...", "")
  Bloc o, 57.5, 105, fTop + 60, 14, "Date prestation", Format(p.pla_dateplan, "ddd dd/mm/yyyy")
  Bloc o, 105, 152.5, fTop + 60, 14, "N� �tablissement", e.etb_numetb
  Bloc o, 152.5, 200, fTop + 60, 14, "Ref commande", p.pla_refcom
  
  ' Deuxi�me ligne de blocs
  Bloc o, 10, 133, fTop + 77, 48, "D�signation"
  Bloc o, 133, 144, fTop + 77, 48, "Qt�"
  Bloc o, 144, 174, fTop + 77, 48, "PU HT"
  Bloc o, 174, 200, fTop + 77, 48, "Montant HT"
  
  o.Line (174, fTop + 77 + 48)-(200, fTop + 135), , B
  TexteDroite o, 170, fTop + 128, "Total HT:"
  
  
  
  
  ' Corps de l'avis de passage
  ' Chiffrage
  
  ' A faire !!!
End Sub



Private Sub BlocAdresse(o As Object, sNomTop As String, sNom As String, sRue As String, sLoc As String, sCPBD As String)
  o.Line (105, fTop + 21)-(200, fTop + 55), , B
  With o.Font
    .Bold = False
    .Size = FSize(o, 8)
  End With
  Texte o, 110, fTop + 27, sNomTop
  With o.Font
    .Bold = True
    .Italic = True
    .Size = FSize(o, 8.5)
  End With
  Texte o, 110, fTop + 34, sNom
  With o.Font
    .Bold = False
    .Italic = False
    .Size = FSize(o, 8)
  End With
  Texte o, 110, fTop + 39, sRue
  Texte o, 110, fTop + 43, sLoc
  Texte o, 110, fTop + 47, sCPBD
End Sub


Private Sub Bloc(o As Object, x1 As Single, x2 As Single, fTop As Single, fHauteur As Single, sTitre As String, Optional sContenu As String = "")
  o.Line (x1, fTop)-(x2, fTop + fHauteur), , B
  o.Line (x1, fTop)-(x2, fTop + 5.5), , BF
    
  o.ForeColor = vbWhite
  o.FontBold = True
  o.Font.Size = FSize(o, 7.5)
  TexteCentr� o, x1, x2, fTop + 0.8, sTitre
  o.ForeColor = vbBlack
  o.FontBold = False
  
  If sContenu <> "" Then
    o.Font.Size = FSize(o, 8)
    Texte o, x1 + 2, fTop + 8, sContenu
  End If
End Sub
