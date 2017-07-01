VERSION 5.00
Begin VB.Form frmTest 
   Caption         =   "Test mise en page"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnImpression 
      Caption         =   "Impression"
      Height          =   495
      Left            =   2940
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton btnAperçu 
      Caption         =   "Aperçu"
      Height          =   495
      Left            =   2940
      TabIndex        =   0
      Top             =   360
      Width           =   1215
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim o As Object
Dim iPage As Integer
Dim l, c As Integer
Dim oldt1 As Integer, oldt2 As Integer


Private Sub DoFormatage()
  Dim r As New ADODB.Recordset
  r.Open App.Path & "\tarte.rst"
'  Print r.RecordCount & " enregistrements"
  r.Sort = "pro_t1,pro_t2,pro_nom"
  r.MoveFirst
  
  l = 0
  c = 0
  iPage = 0
  
  oldt1 = -1
  oldt2 = -1
    
  Dim x As Single, y As Single
  Dim bGrise As Boolean
  
  While Not r.EOF
    If r!pro_t1 <> oldt1 Or r!pro_t2 <> oldt2 Then
      oldt1 = r!pro_t1
      oldt2 = r!pro_t2
      
      If l < 70 Then
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
      Texte o, x, y - 0.5, "Type 0." & oldt2
      o.FontBold = False
      o.FontSize = FSize(o, 7.5)
      
      l = l + 1
      If l = 80 Then l = 0: c = c + 1
    Else
      If l = 0 And c = 0 Then If Not NouvellePage Then Exit Sub
    End If
          
    
    x = IIf(c = 0, 10, 109)
    y = l * 3.2 + 20
    
    Dim nbl As Integer
    nbl = BlocTexte(o, x + 7, y, 70, r!pro_nom, , False)
    If bGrise Then
      o.FillColor = RGB(230, 230, 230)
      o.FillStyle = vbFSSolid
      o.Line (x, y - 0.5)-Step(95, 3.2 * nbl), RGB(255, 255, 255), B
    End If
    bGrise = Not bGrise
    o.FontBold = True
    TexteDroite o, x + 6, y, r!pro_numpro
    o.FontBold = False
    BlocTexte o, x + 8, y, 70, r!pro_nom
    Texte o, x + 79, y, r!pro_critere
    Texte o, x + 85, y, "." & r!pro_t2 & "." & r!pro_t3 & "." & r!pro_t4 & "."
    
    r.MoveNext
    
    l = l + nbl
    If l = 83 Then
      l = 0
      c = c + 1
      If c = 2 Then c = 0
    End If
  Wend
  r.Close
End Sub


Private Function NouvellePage() As Boolean
  If iPage > 0 Then
    If o Is Printer Then
      Printer.NewPage
    Else
      Dim iRep As VbMsgBoxResult
      iRep = MsgBox("Page suivante ?", vbQuestion + vbYesNo)
      If iRep = vbNo Then
        Unload frmImprimante
        NouvellePage = False
        Exit Function
      End If
      frmImprimante.Cls
    End If
  End If
  
  NouvellePage = True
  iPage = iPage + 1
  
  ' Bandeau d'identification
  Texte o, 0, 0, "."
  With o.Font
    .Name = "Univers condensed"
    .Bold = True
    .Italic = True
    .Size = FSize(o, 9)
  End With
  Texte o, 10, 9, "Microb'Soft: Fichier produits"
  With o.Font
'    .Size = FSize(o, 8)
    .Italic = False
    .Bold = False
  End With
  o.Print " - Édition du " & Format(Now, "ddd dd mmm yyyy hh:MM") '& " par " & sUtilisateur;
  TexteDroite o, 202, 9, "Page " & iPage
  
  
  o.FontBold = True
  Texte o, 10, 13, "Type " & oldt1
  TexteDroite o, 202, 13, oldt1 & "." & oldt2
  o.FontBold = False
  
  ' Police standard du texte
  With o.Font
    .Bold = False
    .Italic = False
    .Size = FSize(o, 7.5)
  End With
  
  o.FontTransparent = True
End Function


Private Sub btnAperçu_Click()
  Set o = frmImprimante
  o.Show
  DoFormatage
End Sub


Private Sub btnImpression_Click()
  Printer.ScaleMode = 6      ' mm
  ' On considère que la zone d'impression est centrée sur la page,
  ' sinon le point de coordonnées (0,0) est le premier pixel imprimable en haut à gauche
  ' Du coup, les coordonnées sont exprimées en mm par rapport aux marges gauche et haut,
  ' ce qui est plus simple…
  Dim sw As Single, sh As Single
  sw = Printer.ScaleWidth
  sh = Printer.ScaleHeight
  Printer.ScaleLeft = (210 - sw) / 2
  Printer.ScaleTop = (297 - sh) / 2

  Set o = Printer
  DoFormatage
  If iPage > 0 Then Printer.EndDoc
End Sub
