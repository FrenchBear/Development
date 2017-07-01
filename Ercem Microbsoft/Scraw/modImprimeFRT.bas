Attribute VB_Name = "modImprimeFRT"
' modImprimeFRT
' Mise en page/Impression locale des FRT
' 27/11/00 PV
'  5/12/00 PV iImpVBFRT retourne le nombre d'analyses rattachées à la FRT

Option Explicit

#Const bImprime = True
#Const bAffichage = False

' Variables globales pour simplifier
' Valeurs courantes
Private e As Etablissement
Private iFRT As Long

' Mise en page/Totaux
Private iPage As Integer                ' Compteur de page courante
Private iNbFRT As Integer
Private iNbBoîtesTotal As Integer

' Formatage de la planche
Private Const offv As Single = 10
Private Const offh As Single = 10
Private Const v1 As Single = 35         ' Module vertical
Private Const h1 As Single = 98         ' Module horizontal



Public Sub DébutImpressionFRTLocal(sImprimante As String, iBac As Integer)
#If bAffichage Then
  frmImprimante.Show
  frmImprimante.Caption = "Aperçu FRT"
#End If
#If bImprime Then
  ' Sélectionner la bonne imprimante
  ImprimanteRectoVerso vbPRDPSimplex
  ImprimanteMilimetres
  ImprimantePapier IIf(iBac <= 0, vbPRBNAuto, iBac)

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
  iNbFRT = 0
  iNbBoîtesTotal = 0
  
  Screen.MousePointer = vbHourglass
End Sub


' Retourne le nombre d'analyses rattachées à la FRT
Public Function iImpVBFRT(p_iFRT As Long) As Integer
  Dim iEch As Integer
  Dim colRA As Collection             ' Collection des échantillons à imprimer
  Dim r As RA
  
  iFRT = p_iFRT
  
  Set colRA = RechercheRAdeFRT(iFRT)
  For Each r In colRA
#If bAffichage Then
    Do1FRT frmImprimante, r
#End If
#If bImprime Then
    Do1FRT Printer, r
#End If
  Next
  
  iImpVBFRT = colRA.Count
End Function


Public Sub FinImpressionFRTLocal()
#If bImprime Then
  If iPage > 0 Then Printer.EndDoc
#End If
#If bAffichage Then
'  Unload frmImprimante
#End If
  Screen.MousePointer = vbNormal
End Sub


Private Sub Do1FRT(o As Object, r As RA)
  If (iNbFRT Mod 16) = 0 And iPage >= 1 Then
#If bAffichage Then
    MsgBox "Page suivante": frmImprimante.Cls
#End If
#If bImprime Then
    Printer.NewPage
#End If
  End If
  
  If iNbFRT Mod 16 = 0 Then
    iPage = iPage + 1
    
    ' Bandeau d 'identification
    Texte o, 0, 0, "."
    With o.Font
      .Name = "Verdana"
      .Bold = True
      .Italic = True
      .Size = FSize(o, 7.5)
    End With
    o.FontTransparent = False   ' Sinon sur la 5Si le texte n'est pas transparent
    Texte o, 10, 7, "Microb'Soft Labo: Fiche Récapitulative Tournée "
    o.FontTransparent = True    ' Suite de l'astuce pour 5Si
    With o.Font
      .Italic = False
      .Bold = False
      .Size = FSize(o, 6)
    End With
    o.Print "- Édité le " & Format(Now, "ddd dd mmm yyyy hh:MM") & " par " & sNomOpérateur
  
    With o.Font
      .Name = "Verdana"
      .Bold = True
      .Italic = False
      .Size = FSize(o, 16)
    End With
    o.FontTransparent = False   ' Sinon sur la 5Si le texte n'est pas transparent
    TexteDroite o, 200, 5.5, "FRT " & iFRT
  End If
  
  
  If r.sEtb = "0" Then
    Set e = New Etablissement
    e.etb_prefixe = "AC"
    e.etb_nom = sGetIntlLib("CRtxtEtb", "ÉTABLISSEMENT EN COURS DE CRÉATION")
  Else
    Set e = LireEtablissement(r.sEtb, False)
  End If


'   Impression de la FRT à proprement parler
  Do1FRTStandard o, r

'   Une de plus !
  iNbFRT = iNbFRT + 1
End Sub



Private Sub Do1FRTStandard(o As Object, r As RA)
  Dim x0 As Single, y0 As Single

  x0 = offh + (iNbFRT Mod 2) * h1
  y0 = offv + ((iNbFRT \ 2) Mod 8) * v1

'  o.Line (x0, y0)-Step(h1, v1), , B
  
  With o.Font
    .Name = "Verdana"
    .Bold = True
    .Italic = False
    .Size = FSize(o, 8)
  End With
  Texte o, x0 + 1, y0 + 7, Left(r.sRef, Len(r.sRef) - 2) & "." & Right(r.sRef, 2)

  With o.Font
    .Bold = False
    .Size = FSize(o, 7)
  End With
  BlocTexte o, x0 + 1, y0 + 10.5, 45, r.sEtb & ": " & e.etb_prefixe & " " & e.etb_nom
  BlocTexte o, x0 + 1, y0 + 18, 45, r.sNomPro, 2
  BlocTexte o, x0 + 1, y0 + 26, 45, r.sRemarques, 2
  
  ' Code barre
  Dim sCB As String
  Dim iRef As Long, iEch As Integer, sLettres As String
  sLettres = Left(r.sRef, 2)
  iRef = Val(Left(Mid(r.sRef, 3), Len(r.sRef) - 4))
  iEch = Val(Right(r.sRef, 2))
  sCB = PrépareCBEch(sLettres, iRef, iEch, r.sEtb)
  CodeBarre o, x0 + 1, y0 + 1, 0.33, 5, sCB

  ' Deuxième colonne
  Dim iNbBoîtes As Integer
  iNbBoîtes = r.iNbBoîtes
  o.Font.Bold = True
  Texte o, x0 + 53, y0 + 1, r.sCritère & "/" & r.cMMéthode & "  "
  o.Font.Bold = False
  o.Print iNbBoîtes & "b  T° " & r.dTemp & " / " & r.dTamb
  iNbBoîtesTotal = iNbBoîtesTotal + iNbBoîtes
  
  ' Germes
  Dim g As GermeRecherché
  Dim yo As Single
  Dim s As String
  Dim ng As Integer
  yo = 4.5
  o.Font.Size = FSize(o, 6)
  ng = 0
  For Each g In r.cGermes
    s = g.sAbrégéLabo
    ng = ng + 1
    If ng = 12 Then Exit For
    Dim b As Boîte, i As Integer
    i = 0
    For Each b In g.cBoîtes
      i = i + 1
      If i = 1 Then s = s & "/" & g.sMéthode & g.sUnité & " (" & sAbrégéMilieu(b.boi_milieu) & "):"
      s = s & " " & b.boi_dilution
    Next
    
    o.Font.Bold = True
    Texte o, x0 + 51, y0 + yo, g.cStatus
    o.Font.Bold = False
    Texte o, x0 + 53, y0 + yo, s
    yo = yo + 2.6
  Next
End Sub


' Prépare le codage numérique du code barre échantillon
' Public, car utilisé par l'impression des étiquettes
Private Function PrépareCBEch(sLettres As String, iRef As Long, iEch As Integer, sEtb As String) As String
  Dim sCB As String
  Dim iEtbNum As Long, bEtbFimebio As Boolean, iSite As Integer
  Const sSite As String = "GAPMOTBCDEFHIJKLNQRSUVWXYZ"
  
  bEtbFimebio = Right(sEtb, 1) >= "A"
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
  
  If Len(PrépareCBEch) <> 18 Then MsgBox "Erreur interne PrépareCBEch", vbCritical: Stop
End Function

