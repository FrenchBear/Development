Attribute VB_Name = "FormateProduitsParType"
' FormateProduitsParType
' Module de mise en page du fichier produits, version par type
' 21/09/1999 PV

Option Explicit


Private o As Object
Private iPage As Integer
Private l As Integer
Private oldt1 As Integer, oldt2 As Integer, oldt3 As Integer, oldt4 As Integer, oldt5 As Integer


Public Sub DoFormatageProduitsParType(r As ADODB.Recordset, ByVal bImpression As Boolean, oCallBack As frmProduit, iTypeEtat As Integer)
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
    Set o.CallBack = oCallBack
    o.iTypeEtat = iTypeEtat
    DoFormatage r
  End If
End Sub


Private Sub DoFormatage(r As ADODB.Recordset)
  r.Sort = "pro_t1,pro_t2,pro_t3,pro_t4,pro_t5,pro_nom"
  r.MoveFirst
  
  l = 0
  iPage = 0
  oldt1 = -1
    
  Dim x As Single, y As Single
  Dim bGrise As Boolean
  Dim bEspace As Boolean
  
  While Not r.EOF
    bEspace = False
    
    If r!pro_t1 <> oldt1 Then
      oldt1 = r!pro_t1
      oldt2 = -1
      
      If l < 75 Then
        If l > 0 Then l = l + 1   ' Pas de saut de ligne en haut de colonne
      Else
        l = 0
      End If
      If l = 0 Then If Not NouvellePage Then Exit Sub
      bEspace = True
      
      x = 10
      y = l * 3.2 + 20
            
      With o.Font
        .Name = "Arial"
        .Size = FSize(o, 8.5)
        .Bold = True
      End With
      Texte o, x, y - 0.5, sNomType(oldt1, 0, 0, 0, 0)
      l = l + 1: If l = 82 Then l = 0
    End If
    
    If r!pro_t2 <> oldt2 Then
      oldt2 = r!pro_t2
      oldt3 = -1
      
      If Not bEspace Then
        If l < 75 Then
          If l > 0 Then l = l + 1   ' Pas de saut de ligne en haut de colonne
        Else
          l = 0
        End If
        If l = 0 Then If Not NouvellePage Then Exit Sub
        bEspace = True
      End If
      
      x = 10
      y = l * 3.2 + 20
      
      With o.Font
        .Name = "Arial"
        .Size = FSize(o, 8.5)
        .Bold = True
      End With
      Texte o, x, y - 0.5, sNomType(oldt1, oldt2, 0, 0, 0)
      l = l + 1: If l = 82 Then l = 0
    End If

    If r!pro_t3 <> oldt3 Then
      oldt3 = r!pro_t3
      oldt4 = -1
      
      If Not bEspace Then
        If l < 75 Then
          If l > 0 Then l = l + 1   ' Pas de saut de ligne en haut de colonne
        Else
          l = 0
        End If
        If l = 0 Then If Not NouvellePage Then Exit Sub
        bEspace = True
      End If
      
      x = 10
      y = l * 3.2 + 20
      
      With o.Font
        .Name = "Arial"
        .Size = FSize(o, 8.5)
        .Bold = True
      End With
      Texte o, x, y - 0.5, sNomType(oldt1, oldt2, oldt3, 0, 0)
      l = l + 1: If l = 82 Then l = 0
    End If

    If r!pro_t4 <> oldt4 Then
      oldt4 = r!pro_t4
      oldt5 = -1
      
      If Not bEspace Then
        If l < 75 Then
          If l > 0 Then l = l + 1   ' Pas de saut de ligne en haut de colonne
        Else
          l = 0
        End If
        If l = 0 Then If Not NouvellePage Then Exit Sub
        bEspace = True
      End If
      
      x = 10
      y = l * 3.2 + 20
      
      With o.Font
        .Name = "Arial"
        .Size = FSize(o, 8.5)
        .Bold = True
      End With
      Texte o, x, y - 0.5, sNomType(oldt1, oldt2, oldt3, oldt4, 0)
      l = l + 1: If l = 82 Then l = 0
    End If
    
    If r!pro_t5 <> oldt5 And r!pro_t5 Then
      oldt5 = r!pro_t5
      If Not bEspace Then
        If l < 75 Then
          If l > 0 Then l = l + 1   ' Pas de saut de ligne en haut de colonne
        Else
          l = 0
        End If
        If l = 0 Then If Not NouvellePage Then Exit Sub
        bEspace = True
      End If
      
      x = 10
      y = l * 3.2 + 20
      
      With o.Font
        .Name = "Arial"
        .Size = FSize(o, 8.5)
        .Bold = True
      End With
      Texte o, x, y - 0.5, sNomType(oldt1, oldt2, oldt3, oldt4, oldt5)
      l = l + 1: If l = 82 Then l = 0
    End If
    oldt5 = r!pro_t5    ' Au cas où pro_t5=0, on n'est pas passé par le bloc qui précède
    
    If bEspace Then
      bGrise = True
      With o.Font
        .Name = "Univers Condensed"
        .Bold = False
        .Size = FSize(o, 7.5)
      End With
    End If
    
    If l = 0 Then If Not NouvellePage Then Exit Sub
    
    x = 20
    y = l * 3.2 + 20
    
    If bGrise Then
      If bOptionSansGrisés Then
        o.Line (x, y + 2.6)-Step(100, 0)
      Else
        o.FillColor = RGB(235, 235, 235)    ' Valeur 235 pour réduire le volume du fichier d'impression
        o.FillStyle = vbFSSolid
        o.Line (x, y - 0.5)-Step(100, 3.2), RGB(255, 255, 255), B
      End If
    End If
    bGrise = Not bGrise
    o.FontBold = True
    TexteDroite o, x + 6.7, y, r!pro_numpro
    o.FontBold = False
    Texte o, x + 8, y, r!pro_nom
    Texte o, x + 79, y, r!pro_critere
    Texte o, x + 85.5, y, r!pro_t1 & "." & r!pro_t2 & "." & r!pro_t3 & "." & r!pro_t4 & "." & r!pro_t5
    
    r.MoveNext
    
    l = l + 1
    If l = 82 Then l = 0
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
    .Name = "Univers Condensed"
    .Bold = True
    .Italic = True
    .Size = FSize(o, 11.5)
  End With
  Texte o, 10, 9, "Microb'Soft: Fichier produits par type"
  With o.Font
    .Name = "Courier new"
    .Size = FSize(o, 8)
    .Italic = False
    .Bold = False
  End With
  Texte o, o.CurrentX, 10, " - Édition du " & Format(Now, "ddd dd mmm yyyy hh:MM") & " [" & sNomOpérateur & "]"
  TexteDroite o, 201, 10, "Page " & iPage
  
  ' Police standard du texte
  With o.Font
    .Name = "Univers Condensed"
    .Bold = False
    .Italic = False
    .Size = FSize(o, 7.5)
  End With
End Function



Private Function sNomType(iT1 As Integer, iT2 As Integer, iT3 As Integer, iT4 As Integer, iT5 As Integer) As String
  If iT2 = 0 And iT3 = 0 And iT4 = 0 And iT5 = 0 Then
    sNomType = iT1
  ElseIf iT3 = 0 And iT4 = 0 And iT5 = 0 Then
    sNomType = "  " & iT1 & "." & iT2
  ElseIf iT4 = 0 And iT5 = 0 Then
    sNomType = "    " & iT1 & "." & iT2 & "." & iT3
  ElseIf iT5 = 0 Then
    sNomType = "      " & iT1 & "." & iT2 & "." & iT3 & "." & iT4
  Else
    sNomType = "        " & iT1 & "." & iT2 & "." & iT3 & "." & iT4 & "." & iT5
  End If
  sNomType = sNomType & " " & sType(iT1, iT2, iT3, iT4, iT5)
End Function
