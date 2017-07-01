Attribute VB_Name = "modImprimeEtiq"
' modImprimeEtiq
' Mise en page/Impression locale des étiquettes
' 18/11/00 PV
' 27/11/00 PV Verrue nb d'exemplaires par étiquette pour Cergy (IB)
'  6/12/00 PV Etiquettes pour les chimies; Gestion des bacs
' 28/12/00 PV ImpVBEtiqIE
' 26/02/00 PV Fin de l'impression du code barre en 75dpi sur IIISi


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
Private iPage As Integer                  ' Compteur de page courante
Private iNbEtiqPlan As Integer            ' Nb d'étiquettes imprimées pour le planning

' Formatage de la planche
Private Const offv As Single = 13
Private Const offh As Single = 5
Private Const v1 As Single = 25      ' Module vertical
Private Const h1 As Single = 50      ' Module horizontal

Private Const fRefSize = 16
Private Const fLabelSize = 7

Private iNbCopy As Integer
  


Public Function bDébutImpressionEtiqLocal(sImprimante As String) As Boolean
#If bAffichage Then
  frmImprimante.Show
  frmImprimante.Caption = "Aperçu Étiquettes"
#End If
#If bImprime Then
  bDébutImpressionEtiqLocal = False
  If Not bSélectionImprimante(sImprimante) Then Exit Function
  ImprimanteRectoVerso vbPRDPSimplex
  ImprimanteMilimetres
  ImprimantePapier IIf(iBacEtiquettes <= 0, vbPRBNManual, iBacEtiquettes)
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
  iPage = 0
  iNbEtiqPlan = 0       ' Pour l'impression partielle
  sNomAssistant = ""
  Screen.MousePointer = vbHourglass
  bDébutImpressionEtiqLocal = True
End Function


Public Sub ImpVBEtiq(sLettres As String, dDatePlan As Date)
  iNbEtiqPlan = 0
  Set colPlannings = RecherchePlanning(dDatePlan, sLettres)
  For Each p In colPlannings
    DoFormatageEtiqPrest False
  Next
End Sub

Public Sub ImpVBEtiqIE(sLettres As String, iNbRef As Integer, iNbEtiq As Integer)
  iNbEtiqPlan = 0
  Set p = New Intervention
  p.pla_lettres = sLettres
  p.pla_etb = 0
  p.pla_nbab = iNbEtiq
  Dim i As Integer
  For i = 1 To iNbRef
    frmPlanning.GénèreUneRéférence p
    DoFormatageEtiqPrest True
  Next
End Sub

Public Sub ImpVB1Etiq(p0 As Intervention)
  Set p = p0
  DoFormatageEtiqPrest False
End Sub



Public Sub FinImpressionEtiqLocal()
#If bImprime Then
  If iPage > 0 Then Printer.EndDoc
#End If
#If bAffichage Then
'  Unload frmImprimante
#End If
  Screen.MousePointer = vbDefault
End Sub



Private Sub DoFormatageEtiqPrest(bModeIE As Boolean)
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
  
  ' Enregistrements directs labo
  If p.pla_lettres = "TB" Or p.pla_lettres = "IB" Or p.pla_lettres = "RE" Then
    iNbCopy = Val(InputBox("Nombre d'exemplaires de chaque étiquette (de 1 à 4) ?", App.Title, "1"))
    If iNbCopy < 1 Then iNbCopy = 1
    If iNbCopy > 4 Then iNbCopy = 4
  Else
    iNbCopy = 1
  End If


  Dim iNbEtiq As Integer
  iNbEtiq = NZ(p.pla_nbab) + NZ(p.pla_nbbs) + NZ(p.pla_nbli) + NZ(p.pla_nbfs) + NZ(p.pla_nbhu) + NZ(p.pla_nbch)
  If iNbEtiq >= 100 Then iNbEtiq = 99
  If iNbEtiq > 0 Or bModeIE Then
    If Not bModeIE Then Set e = LireEtablissement(p.pla_etb, True)
    
    Dim i As Integer, j As Integer
    For i = IIf(bModeIE, -1, 0) To iNbEtiq        ' 0: Etiquette du sac
      For j = 1 To iNbCopy
#If bAffichage Then
        Do1Etiq frmImprimante, i, bModeIE
#End If
#If bImprime Then
        Do1Etiq Printer, i, bModeIE
#End If
      Next
    Next
  End If
End Sub
  
  

Private Sub Do1Etiq(o As Object, iEch As Integer, bModeIE As Boolean)
  If (iNbEtiqPlan Mod 44) = 0 And iPage >= 1 Then
#If bAffichage Then
    MsgBox "Page suivante": frmImprimante.Cls
#End If
#If bImprime Then
    Printer.NewPage
#End If
  End If
  
  If iNbEtiqPlan Mod 44 = 0 Then
    iPage = iPage + 1
    
    ' Bandeau d'identification
    Texte o, 0, 0, "."
    With o.Font
      .Name = "Verdana"
      .Bold = True
      .Italic = True
      .Size = FSize(o, 7.5)
    End With
    o.FontTransparent = False   ' Sinon sur la 5Si le texte n'est pas transparent
    If bModeIE Then
      Texte o, 10, 7, "Etiques pour interventions non planifiées " & p.pla_lettres & " " & sNomAssistant
    Else
      Texte o, 10, 7, p.pla_lettres & " " & sNomAssistant & " " & Format(p.pla_dateplan, "ddd dd/mm/yyyy")
    End If
    o.FontTransparent = True    ' Suite de l'astuce pour 5Si
    With o.Font
      .Italic = False
      .Bold = False
      .Size = FSize(o, 6)
    End With
    o.Print "- Imprimé le " & Format(Now, "ddd dd mmm yyyy hh:MM") & " par " & sNomOpérateur
    
    If iNbEtiqPlan > 1 Then
      TexteDroite o, 200, 12, "Page " & iNbEtiqPlan \ 44
    End If
  End If
  
  ' Impression des étiquettes à proprement parler
  Do1EtiqStandard o, iEch, bModeIE
  
  ' Une de plus !
  iNbEtiqPlan = iNbEtiqPlan + 1
End Sub




Private Sub Do1EtiqStandard(o As Object, iEch As Integer, bModeIE As Boolean)
  Dim x0 As Single, y0 As Single
  
  x0 = offh + (iNbEtiqPlan Mod 4) * h1
  y0 = offv + ((iNbEtiqPlan \ 4) Mod 11) * v1
  
'  o.Line (x0, y0)-Step(h1, v1), , B
  
  Dim sNom As String, sNum As String
  If iEch = -1 Then
    sNom = "A coller IMPÉRATIVEMENT sur la FP de l'échantillon .01"
  Else
    If bModeIE Then
      sNom = ""
    Else
      sNom = e.etb_numetb & ": " & e.etb_prefixe & " " & e.etb_nom
    End If
  End If
  Select Case iEch
    Case -1:      sNum = "FP"
    Case 0:       sNum = "S"
    Case Is > 0:  sNum = Format(iEch, "00")
  End Select
  
  With o.Font
    .Name = "Verdana"
    .Bold = False
    .Italic = False
    .Size = FSize(o, fRefSize)
  End With
  Texte o, x0 + 2, y0 + 2, p.pla_lettres & p.pla_iref & "." & sNum
  
  ' Code barre
  Dim sCB As String
  sCB = PrépareCBEch(p.pla_lettres, p.pla_iref, IIf(iEch < 0, 0, iEch), p.pla_etb)
  CodeBarre o, x0 + 2.5, y0 + 9, 0.33, 5, sCB
  
  o.Font.Size = FSize(o, fLabelSize)
  BlocTexte o, x0 + 2, y0 + 15, h1 - 4, sNom
End Sub

