Attribute VB_Name = "FormateProduits"
' FormateProduits
' Module de mise en page du fichier produits, version assistant
' 21/09/1999 PV
' 20/04/2000 PV Produits génériques commençant par ! en gras
'  6/07/2001 PV Classe de critère


Option Explicit


Private o As Object                     ' frmImpression ou printer
Private iPage As Integer                ' n° de page courante
Private l As Integer, c As Integer      ' ligne, colonne
Private oldt1 As Integer, oldt2 As Integer, oldt3 As Integer
Private bSection4 As Boolean            ' vrai pour les produits de la section 4

Private Const sFontNormal As String = "Univers Condensed"

Private Const sFontGénérique As String = "Arial"
Private Const sFontGénériqueBold As Boolean = True


' Point d'entrée unique
Public Sub DoFormatageProduits(r As ADODB.Recordset, ByVal bImpression As Boolean, ByVal a_bSection4 As Boolean, oCallBack As frmProduit, iTypeEtat As Integer)
  bSection4 = a_bSection4
  If bImpression Then
    If Not bSélectionImprimantes(MDIServeur.cdPrinter) Then Exit Sub
    Screen.MousePointer = vbHourglass
    SetStatus "Impression en cours, patientez..."
    If bOptionRectoVerso Then ImprimanteRectoVerso
    ImprimanteMilimetres
  
    Set o = Printer
    
    
    DoFormatage r
    
    If iPage > 0 Then
      If iPage And 1 Then ImprimanteAjoute1PageSiRV
      o.EndDoc
    End If

    ' On restaure le nombre d'exemplaires par défaut à 1
    If MDIServeur.cdPrinter.Copies > 1 Then Imprimante1Ex MDIServeur.cdPrinter
    
    SetStatus
    Screen.MousePointer = vbDefault
  Else
    Set o = New frmImprimante
    o.Show
    o.Height = MDIServeur.ScaleHeight - o.Top
    o.Width = o.Height / 297 * 210
    o.ScaleHeight = 297
    o.ScaleWidth = 210
    o.iTypeEtat = iTypeEtat
    Set o.CallBack = oCallBack
    DoFormatage r
  End If
End Sub



Private Sub DoFormatage(r As ADODB.Recordset)
  If bSection4 Then
    r.Sort = "pro_t1,pro_t2,pro_t3,pro_nom"
  Else
    r.Sort = "pro_t1,pro_t2,pro_nom"
  End If
  r.MoveFirst
  
  l = 0
  c = 0
  iPage = 0
  
  oldt1 = -1
  oldt2 = -1
  oldt3 = -1
    
  Dim x As Single, y As Single
  Dim bGrise As Boolean
  Dim bNouvelleSection As Boolean
  
  While Not r.EOF
    bNouvelleSection = r!pro_t1 <> oldt1 Or r!pro_t2 <> oldt2
    If bSection4 And r!pro_t2 = 10 Then bNouvelleSection = bNouvelleSection Or r!pro_t3 <> oldt3
    
    If bNouvelleSection Then
      oldt1 = r!pro_t1
      oldt2 = r!pro_t2
      oldt3 = r!pro_t3
      
      If l < 75 Then
        If l > 0 Then l = l + 1   ' Pas de saut de ligne en haut de colonne
      Else
        l = 0
        c = (c + 1) Mod 2
      End If
      If l = 0 And c = 0 Then If Not NouvellePage Then Exit Sub
      
      bGrise = True
      x = IIf(c = 0, 10, 110)
      y = l * 3.2 + 20
      
      o.FontSize = FSize(o, 9.5)
      o.FontBold = True
      Texte o, x, y - 0.5, sNomType(oldt1, oldt2, IIf(bSection4 And r!pro_t2 = 10, oldt3, 0))
      o.FontBold = False
      o.FontSize = FSize(o, 7.5)
      
      l = l + 1
      If l > 81 Then l = 0: c = c + 1      ' Fin de colonne
    Else
      If l = 0 And c = 0 Then If Not NouvellePage Then Exit Sub
    End If
          
    
    x = IIf(c = 0, 10, 109)
    y = l * 3.2 + 20
    
    Dim nbl As Integer
    If Left(r!pro_nom, 1) = "!" Then
      With o.Font
        .Name = sFontGénérique
        .Bold = sFontGénériqueBold
      End With
    End If
    nbl = BlocTexte(o, x + 7, y, 70, r!pro_nom, , False)
    If Left(r!pro_nom, 1) = "!" Then
      With o.Font
        .Name = sFontNormal
        .Bold = False
      End With
    End If
    
    If bGrise Then
      If bOptionSansGrisés Then
        o.Line (x, y + 2.6)-Step(95, 0)
      Else
        o.FillColor = RGB(235, 235, 235)    ' Valeur 235 pour réduire le volume du fichier d'impression
        o.FillStyle = vbFSSolid
        o.Line (x, y - 0.5)-Step(95, 3.2 * nbl), RGB(255, 255, 255), B
      End If
    End If
    bGrise = Not bGrise
    o.FontBold = True
    TexteDroite o, x + 6.7, y, r!pro_numpro
    o.FontBold = False
    
    If Left(r!pro_nom, 1) = "!" Then
      With o.Font
        .Name = sFontGénérique
        .Bold = sFontGénériqueBold
      End With
    End If
    BlocTexte o, x + 8, y, 70, r!pro_nom
    If Left(r!pro_nom, 1) = "!" Then
      With o.Font
        .Name = sFontNormal
        .Bold = False
      End With
    End If
    
    Texte o, x + 79, y, r!pro_critere
    If bSection4 Then
      Texte o, x + 85.5, y, "…" & r!pro_t4 & "." & r!pro_t5
    Else
      Texte o, x + 84, y, "." & r!pro_t2 & "." & r!pro_t3 & "." & r!pro_t4 & "."
      Texte o, x + 91.5, y, r!cri_classedoc
    End If
    
    r.MoveNext
    
    l = l + nbl
    If l > 81 Then    ' Fin de colonne
      l = 0
      c = c + 1
      If c = 2 Then c = 0
    End If
  Wend
End Sub


Private Function NouvellePage() As Boolean
  If iPage > 0 Then
    If o Is Printer Then
      Printer.NewPage
      SetStatus "Impression en cours, page " & iPage
    Else
      Dim iRep As VbMsgBoxResult
      iRep = MsgBox("Page suivante ?", vbQuestion + vbYesNo)
      If iRep = vbNo Then
        Unload o
        NouvellePage = False
        Exit Function
      End If
      o.Cls
    End If
  End If
  
  NouvellePage = True
  iPage = iPage + 1
  
  ' Bandeau d'identification
  o.FontTransparent = False
  Texte o, 0, 0, "."
  o.FontTransparent = True
  
  With o.Font
    .Name = sFontNormal
    .Bold = True
    .Italic = True
    .Size = FSize(o, 11.5)
  End With
  Texte o, 10, 9, "Microb'Soft: Fichier produits"
  With o.Font
    .Name = "Courier new"
    .Size = FSize(o, 8)
    .Italic = False
    .Bold = False
  End With
  Texte o, o.CurrentX, 10, " - Édition du " & Format(Now, "ddd dd mmm yyyy hh:MM") & " [" & sNomOpérateur & "]"
  TexteDroite o, 202, 10, "Page " & iPage
  
    
  With o.Font
    .Name = sFontNormal
    .Bold = True
    .Size = FSize(o, 11)
  End With
  Texte o, 10, 13, sNomType(oldt1, 0, 0)
  If (bSection4) Then Texte o, o.CurrentX, 13, " / " & sNomType(oldt1, oldt2, oldt3)
  TexteDroite o, 202, 13, oldt1 & "." & oldt2
  o.FontBold = False
  
  ' Police standard du texte
  With o.Font
    .Bold = False
    .Italic = False
    .Size = FSize(o, 7.5)
  End With
End Function




Private Function sNomType(iT1 As Integer, iT2 As Integer, iT3 As Integer) As String
  If iT2 = 0 And iT3 = 0 Then
    sNomType = iT1
  ElseIf iT3 = 0 Then
    sNomType = iT1 & "." & iT2
  Else
    sNomType = iT1 & "." & iT2 & "." & iT3
  End If
  sNomType = sNomType & " " & sType(iT1, iT2, iT3, 0, 0)
End Function
