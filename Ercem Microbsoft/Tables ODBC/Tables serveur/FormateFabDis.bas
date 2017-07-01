Attribute VB_Name = "FormateFabDis"
' FormateFabDis
' Module de mise en page des fichiers fabricant et distributeurs, version assistant
'  4/11/1999 PV

Option Explicit


Private o As Object                     ' frmImpression ou printer
Private iPage As Integer                ' n° de page courante
Private l As Integer, c As Integer      ' ligne, colonne
Private bFichierDistrib As Boolean      ' Vrai si fichier distributeur


Public Sub DoFormatageFabDis(r As ADODB.Recordset, ByVal a_bFichierDistrib As Boolean, ByVal bImpression As Boolean, oCallBack As Form, iTypeEtat As Integer)
  bFichierDistrib = a_bFichierDistrib
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
  r.Sort = "nom"
  r.MoveFirst
  
  l = 0
  c = 0
  iPage = 0
  
  Dim x As Single, y As Single
  Dim bGrise As Boolean
  Dim bNouvelleSection As Boolean
  
  While Not r.EOF
    If l = 0 And c = 0 Then If Not NouvellePage Then Exit Sub
   
    x = 10 + 65 * c
    y = l * 3.2 + 20
    
    If bGrise Then
      If bOptionSansGrisés Then
        o.Line (x, y + 2.6)-Step(63, 0)
      Else
        o.FillColor = RGB(235, 235, 235)    ' Valeur 235 pour réduire le volume du fichier d'impression
        o.FillStyle = vbFSSolid
        o.Line (x, y - 0.5)-Step(63, 3.2), RGB(255, 255, 255), B
      End If
    End If
    bGrise = Not bGrise
    o.FontBold = True
    TexteDroite o, x + 7, y, r!num
    o.FontBold = False
    BlocTexte o, x + 8.5, y, 70, r!nom
    
    r.MoveNext
    
    l = l + 1
    If l = 82 Then
      l = 0
      c = c + 1
      If c = 3 Then c = 0
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
    .Name = "Univers Condensed"
    .Bold = True
    .Italic = True
    .Size = FSize(o, 11.5)
  End With
  Texte o, 10, 9, "Microb'Soft: Fichier " & IIf(bFichierDistrib, "distributeurs", "fabricants")
  
  With o.Font
    .Name = "Courier new"
    .Size = FSize(o, 8)
    .Italic = False
    .Bold = False
  End With
  Texte o, o.CurrentX, 10, " - Édition du " & Format(Now, "ddd dd mmm yyyy hh:MM") & " [" & sNomOpérateur & "]"
  TexteDroite o, 202, 10, "Page " & iPage
  
  With o.Font
    .Name = "Univers Condensed"
    .Bold = True
    .Size = FSize(o, 11)
  End With
  o.FontBold = False
  
  ' Police standard du texte
  With o.Font
    .Bold = False
    .Italic = False
    .Size = FSize(o, 7.5)
  End With
End Function

