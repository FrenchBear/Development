VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFC0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Baromètre de la Qualité"
   ClientHeight    =   6495
   ClientLeft      =   285
   ClientTop       =   735
   ClientWidth     =   8985
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "BAROM.frx":0000
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6495
   ScaleWidth      =   8985
   Begin VB.Frame Cadre2 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "&Saisie"
      ForeColor       =   &H80000008&
      Height          =   6132
      Left            =   4440
      TabIndex        =   0
      Top             =   120
      Width           =   4452
      Begin VB.TextBox txtTitre 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   1200
         TabIndex        =   12
         Text            =   "BAROMETRE DE LA QUALITÉ"
         Top             =   3480
         Width           =   3132
      End
      Begin VB.TextBox Poids 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   3840
         TabIndex        =   6
         Top             =   480
         Width           =   492
      End
      Begin VB.CommandButton btnQuitter 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Cancel          =   -1  'True
         Caption         =   "&Quitter"
         Height          =   372
         Left            =   3000
         TabIndex        =   28
         Top             =   5640
         Width           =   1332
      End
      Begin VB.PictureBox Image2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   15
         Left            =   0
         ScaleHeight     =   0
         ScaleWidth      =   4425
         TabIndex        =   30
         Top             =   5520
         Width           =   4455
      End
      Begin VB.CommandButton btnImprime 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "&Imprimer"
         Height          =   372
         Left            =   1680
         TabIndex        =   27
         Top             =   5640
         Width           =   1212
      End
      Begin VB.CommandButton btnAperçu 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "&Aperçu"
         Height          =   372
         Left            =   120
         TabIndex        =   26
         Top             =   5640
         Width           =   1452
      End
      Begin VB.CheckBox CochePapier 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "&Papier En-Tête"
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   2640
         TabIndex        =   25
         Top             =   5040
         Width           =   1692
      End
      Begin VB.TextBox Légende3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   600
         TabIndex        =   20
         Text            =   "Tempête"
         Top             =   5040
         Width           =   1572
      End
      Begin VB.CheckBox Coche3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   240
         TabIndex        =   19
         Top             =   5040
         Value           =   1  'Checked
         Width           =   252
      End
      Begin VB.TextBox Minimum 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   3720
         TabIndex        =   24
         Text            =   "40"
         Top             =   4680
         Width           =   612
      End
      Begin VB.TextBox Légende2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   600
         TabIndex        =   18
         Text            =   "Variable"
         Top             =   4680
         Width           =   1572
      End
      Begin VB.CheckBox Coche2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   240
         TabIndex        =   17
         Top             =   4680
         Value           =   1  'Checked
         Width           =   252
      End
      Begin VB.TextBox Maximum 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   3720
         TabIndex        =   22
         Text            =   "100"
         Top             =   4320
         Width           =   612
      End
      Begin VB.TextBox Légende1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   600
         TabIndex        =   16
         Text            =   "Beau Temps"
         Top             =   4320
         Width           =   1572
      End
      Begin VB.CheckBox Coche1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   240
         TabIndex        =   15
         Top             =   4320
         Value           =   1  'Checked
         Width           =   252
      End
      Begin VB.TextBox STitre 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   1200
         TabIndex        =   14
         Top             =   3840
         Width           =   3132
      End
      Begin VB.PictureBox Image1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   12
         Left            =   0
         ScaleHeight     =   0
         ScaleWidth      =   4425
         TabIndex        =   29
         Top             =   3360
         Width           =   4452
      End
      Begin VB.TextBox Objectif 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   3720
         TabIndex        =   10
         Text            =   "70"
         Top             =   3000
         Width           =   612
      End
      Begin VB.CommandButton btnSupLig 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Supprimer &Ligne"
         Height          =   372
         Left            =   120
         TabIndex        =   8
         Top             =   2880
         Width           =   1692
      End
      Begin VB.ListBox Liste 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   1785
         Left            =   120
         TabIndex        =   7
         Top             =   840
         Width           =   4212
      End
      Begin VB.TextBox Note 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   3000
         TabIndex        =   4
         Top             =   480
         Width           =   732
      End
      Begin VB.TextBox Magasin 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   288
         Left            =   120
         TabIndex        =   2
         Text            =   " "
         Top             =   480
         Width           =   2772
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "&Poids :"
         ForeColor       =   &H80000008&
         Height          =   192
         Left            =   3840
         TabIndex        =   5
         Top             =   240
         Width           =   588
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "&Note :"
         ForeColor       =   &H80000008&
         Height          =   192
         Left            =   3000
         TabIndex        =   3
         Top             =   240
         Width           =   504
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "&Magasin :"
         ForeColor       =   &H80000008&
         Height          =   192
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   816
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "&Titre :"
         ForeColor       =   &H80000008&
         Height          =   192
         Left            =   120
         TabIndex        =   11
         Top             =   3480
         Width           =   492
      End
      Begin VB.Label Etiquette2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Mi&nimum:"
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   2640
         TabIndex        =   23
         Top             =   4680
         Width           =   972
      End
      Begin VB.Label Etiquette3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Ma&ximum:"
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   2640
         TabIndex        =   21
         Top             =   4320
         Width           =   972
      End
      Begin VB.Label Etiquette1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Sous-T&itre :"
         ForeColor       =   &H80000008&
         Height          =   192
         Left            =   120
         TabIndex        =   13
         Top             =   3840
         Width           =   972
      End
      Begin VB.Label Etiquette4 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "&Objectif:"
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   2760
         TabIndex        =   9
         Top             =   3000
         Width           =   852
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const Maxi = 10
Const TailleMaxi = 40
Const NbreDécimales = 2    ' La Virgule est comptée comme une décimale

Dim Classe(Maxi) As String
Dim NbreElements As Integer
Dim DocumentChangé As Integer

Const Largeur = 0.7
Const RayonExt = 1.5
Const LongueurDroite = 23
Const LongueurDroiteImprimante = 17
Const PtesGrad = 0.3
Const GdesGrad = 0.5
Const YReservoir = 19
Const HauteurReservoir = 3
Const HauteurReservoirImprimante = 2

Const MargeNom = 2.5
Const MargeFlecheImprimante = 2.5
Const MargeNomImprimante = 2

Const Petit = 10                ' Taille des Polices d Impression
Const Grand = 19
Const Moyen = 14
Const Normal = 12

Const PositionLégende1 = 2.9
Const PositionLégende2 = 7.9
Const PositionLégende3 = 12.9

Dim LimiteBas As Integer
Dim LimiteHaut As Integer



'   DECLARATIONS DE ROUTINES WINDOWS
Private Declare Function CreateCompatibleDC% Lib "GDI32" (ByVal hDC%)
Private Declare Function SelectObject% Lib "GDI32" (ByVal hDC%, ByVal hObject%)

Private Declare Function StretchBlt% Lib "GDI32" (ByVal hDC%, ByVal X%, ByVal Y%, ByVal nWidth%, ByVal nHght%, ByVal hSrcDC%, ByVal XSrc%, ByVal YSrc%, ByVal nSrcWidth%, ByVal nSrcHeight%, ByVal dwRop&)

Private Declare Function DeleteDC% Lib "GDI32" (ByVal hDC%)
Private Declare Function Escape% Lib "GD32I" (ByVal hDC%, ByVal nEscape%, ByVal nLen%, LpInData%, LpOutData%)

Private Declare Function SendMessage Lib "User32" (ByVal hWnd As Integer, ByVal wMsg As Integer, ByVal wParam As Integer, lParam As Any) As Long

Const WM_USER = &H400
Const LB_SETTABSTOPS = (WM_USER + 19)

Private Sub btnAperçu_Click()
    
  Anc = Screen.MousePointer
  Screen.MousePointer = 11
  
  Form1.Cls
  
  Form1.ScaleHeight = 29.7
  Form1.ScaleWidth = 21
  Form1.ScaleMode = 0

  X = 7
  Y = 2
  
  NbreElements = 0
  Moy = 0
  Ptot = 0

  For i = 1 To 10                     ' Différentes Recherches
    Tmp$ = Liste.List(i - 1)
    n$ = ChercheNom(Tmp$)
    Q$ = ChercheNote(Tmp$)

    If n$ = "" Then
      Classe(i) = "-10" + String$(NbreDécimales, "0")
    Else
      po$ = CherchePoids(Tmp$)
      If po$ <> "1" Then n$ = n$ & " [" & po$ & "]"
      Classe(i) = Q$ + " " + n$
      NbreElements = NbreElements + 1
      Moy = Moy + Val(Q$) * Val(po$)
      Ptot = Ptot + Val(po$)
    End If
      
    Valeur = Val(Q$)
    If Valeur > LimiteHaut Then
      LimiteHaut = Valeur                      ' Test du MAXIMUM
      Maximum.Text = Format$(Valeur)
    End If

    If Valeur < LimiteBas And Valeur <> 0 Then
      LimiteBas = Valeur                       ' Test du MINIMUM
      Minimum.Text = Format$(Valeur)
    End If
  Next i
  
  If NbreElements <> 0 Then
    Moy = Moy / Ptot
  Else
    Moy = LimiteBas
  End If

  DessineBaromètre X, Y, Moy
  
  If NbreElements > 0 Then
    For i = 1 To Maxi
      For J = i To Maxi
        If Val(Mid$(Classe(i), 1, 3 + NbreDécimales)) < Val(Mid$(Classe(J), 1, 3 + NbreDécimales)) Then
          Tmp$ = Classe(i)                     ' Tri du TABLEAU
          Classe(i) = Classe(J)
          Classe(J) = Tmp$
        End If
      Next J
    Next i


    Précision = (LongueurDroite - 2) / (LimiteHaut - LimiteBas)
    YPrec = Y + 1 + Précision * (LimiteHaut - Val(Mid$(Classe(1), 1, 3 + NbreDécimales)))
    n$ = Mid$(Classe(1), 5 + NbreDécimales, Len(Classe(1)) - (4 + NbreDécimales))   ' Nom
    Q$ = Format$(Val(Mid$(Classe(1), 1, 3 + NbreDécimales)), "###.0")
    EcritTexte (X - MargeNom) - Form1.TextWidth(n$), YPrec - 0.4, n$
    EcritTexte X - MargeNom + 0.2, YPrec - 0.4, Q$
    DessineFleche X - MargeNom + 0.5 + Form1.TextWidth(Q$), YPrec, X - 0.1, YPrec
    
    For i = 2 To NbreElements
      YFleche = Y + 1 + Précision * (LimiteHaut - Val(Mid$(Classe(i), 1, 3 + NbreDécimales)))
      YTexte = YFleche

      Difference = YTexte - YPrec
      While Difference < 0.8
        YTexte = YTexte + 0.01
        Difference = YTexte - YPrec
      Wend

      n$ = Mid$(Classe(i), 5 + NbreDécimales, Len(Classe(i)) - (4 + NbreDécimales))    ' Nom
      Q$ = Format$(Val(Mid$(Classe(i), 1, 3 + NbreDécimales)), "##0.0")
      EcritTexte (X - MargeNom) - Form1.TextWidth(n$), YTexte - 0.4, n$
      EcritTexte X - MargeNom + 0.2, YTexte - 0.4, Q$
      DessineFleche X - MargeNom + 0.5 + Form1.TextWidth(Q$), YTexte, X - 0.1, YFleche
      YPrec = YTexte
    Next i
  End If

  Screen.MousePointer = Anc
End Sub

Private Sub btnImprime_Click()

  Const SETCOPYCOUNT = 17
  Const CNULL = 0&
  Dim NbreCopies As Integer

  Message$ = "Entrer le nombre d'exemplaires à imprimer sur Papier "
  If CochePapier.Value = 1 Then
    Message$ = Message$ + "En-Tête "
  Else
    Message$ = Message$ + "Suite "
  End If
  If STitre.Text = "" Then
    Message$ = Message$ + "sans Sous-Titre"
  Else
    Message$ = Message$ + "avec le sous-Titre '" + STitre.Text + "'"
  End If

  Message$ = Message$ + "," + Chr$(13) + Chr$(13) + "sinon choisissez Annuler:"

  Copies$ = InputBox$(Message$, "Imprimer", "1")
  NbreCopies = Val(Copies$)

  If Copies$ <> "" And NbreCopies > 0 Then
    Printer.Print ""
    Debug.Print NbreCopies;
    X% = Escape(Printer.hDC, SETCOPYCOUNT, Len(X%), NbreCopies, NbreCopies)
      
    DocumentChangé = 0
    Anc = Screen.MousePointer
    Screen.MousePointer = 11
      
    Printer.FontName = "Arial"
    Printer.ScaleHeight = 29.7
    Printer.ScaleWidth = 21
    Printer.ScaleMode = 0
  
    Titre$ = txtTitre
    Printer.FontSize = Grand
    Printer.FontBold = -1
    Printer.FontUnderline = -1
      
    If CochePapier.Value = 0 Then
      Printer.CurrentX = (21 - Printer.TextWidth(Titre$)) / 2
    Else
      Printer.CurrentX = 8 + (13 - Printer.TextWidth(Titre$)) / 2
    End If
      
    Printer.CurrentY = 3.2
    Printer.Print Titre$
      
    Printer.FontSize = Moyen
    Printer.FontUnderline = 0
    If CochePapier.Value = 0 Then
      Printer.CurrentX = (21 - Printer.TextWidth(STitre.Text)) / 2
    Else: Printer.CurrentX = 8 + (13 - Printer.TextWidth(STitre.Text)) / 2
    End If
  
    Printer.CurrentY = Printer.TextHeight(Titre$) + 3.7
    Printer.Print STitre.Text
  
    Printer.FontBold = 0
    Printer.FontSize = Normal
  
    Xb = 12
    Xc = Xb - 1
    Y = 7
      
    NbreElements = 0
    Moy = 0
    Ptot = 0
  
    For i = 1 To 10
      Tmp$ = Liste.List(i - 1)
      n$ = ChercheNom(Tmp$)
      Q$ = ChercheNote(Tmp$)
      If n$ = "" Then
        Classe(i) = "-10" + String$(NbreDécimales, "0")
      Else
        po$ = CherchePoids(Tmp$)
        If po$ <> "1" Then n$ = n$ & " [" & po$ & "]"
        Classe(i) = Q$ + " " + n$
        NbreElements = NbreElements + 1
        Moy = Moy + Val(Q$) * Val(po$)
        Ptot = Ptot + Val(po$)
      End If
    Next i
  
    If NbreElements <> 0 Then
      Moy = Moy / Ptot
    Else
      Moy = LimiteBas
    End If
      
    ImprimeBaromètre Xb, Y, Moy
      
    Printer.FontSize = Petit
    If Coche1.Value = 1 Then ImprimeTexte (Xc + 8) - Printer.TextWidth(Légende1.Text), Y + PositionLégende1, Légende1.Text
    If Coche2.Value = 1 Then ImprimeTexte (Xc + 8) - Printer.TextWidth(Légende2.Text), Y + PositionLégende2, Légende2.Text
    If Coche3.Value = 1 Then ImprimeTexte (Xc + 8) - Printer.TextWidth(Légende3.Text), Y + PositionLégende3, Légende3.Text
    Printer.FontSize = Normal
  
    If NbreElements > 0 Then
      For i = 1 To Maxi
        For J = i To Maxi
          If Val(Mid$(Classe(i), 1, 3 + NbreDécimales)) < Val(Mid$(Classe(J), 1, 3 + NbreDécimales)) Then
            Tmp$ = Classe(i)
            Classe(i) = Classe(J)
            Classe(J) = Tmp$
          End If
        Next J
      Next i
    
      Précision = (LongueurDroiteImprimante - 2) / (LimiteHaut - LimiteBas)
      YPrec = Y + 1 + Précision * (LimiteHaut - Val(Mid$(Classe(1), 1, 3 + NbreDécimales)))
      n$ = Mid$(Classe(1), 5 + NbreDécimales, Len(Classe(1)) - (4 + NbreDécimales)) ' Nom
      Q$ = Format$(Val(Mid$(Classe(1), 1, 3 + NbreDécimales)), "##0.0")
      ImprimeTexte (Xc - MargeNomImprimante) - Printer.TextWidth(n$), YPrec - 0.4, n$ ' Ecriture du Nom
      If Val(Q$) = 100 Then
        ImprimeTexte Xc - MargeNomImprimante + 0.5 - Printer.TextWidth("0"), YPrec - 0.4, Q$
      Else
        ImprimeTexte Xc - MargeNomImprimante + 0.5, YPrec - 0.4, Q$ ' Ecriture du Chiffre
      End If
      ImprimeFleche Xc + 0.2, YPrec, Xb - 0.3, YPrec
          
      Debug.Print "YPrec=" + Str$(YPrec)
          
      For i = 2 To NbreElements
        YFleche = Y + 1 + Précision * (LimiteHaut - Val(Mid$(Classe(i), 1, 3 + NbreDécimales)))
        YTexte = YFleche
        Difference = YTexte - YPrec
        While Difference < 0.5
          YTexte = YTexte + 0.01
          Difference = YTexte - YPrec
        Wend
  
        n$ = Mid$(Classe(i), 5 + NbreDécimales, Len(Classe(i)) - (4 + NbreDécimales))
        Q$ = Format$(Val(Mid$(Classe(i), 1, 3 + NbreDécimales)), "##0.0")
        ImprimeTexte (Xc - MargeNomImprimante) - Printer.TextWidth(n$), YTexte - 0.4, n$
        ImprimeTexte Xc - MargeNomImprimante + 0.5, YTexte - 0.4, Q$
        ImprimeFleche Xc + 0.2, YTexte, Xb - 0.3, YFleche
      
        Debug.Print "YTexte=" + Str$(YTexte)
      
        YPrec = YTexte
      Next i
    End If
  
    Printer.Line (Xc, Y - 1)-Step(8.5, LongueurDroiteImprimante + RayonExt + 2), , B   ' Cadre du Baromètre
    Printer.Line (Xc + 0.2, Y - 1.2)-Step(8.5, 0) '   "Ombre"
    Printer.Line -Step(0, LongueurDroiteImprimante + RayonExt + 2)
    
    Printer.FontUnderline = -1
    Printer.CurrentX = (Xc + 6.5) - Printer.TextWidth("Indice Qualité")
    Printer.CurrentY = Y - 0.5
    Printer.Print "Indice Qualité";
    Printer.FontUnderline = 0
  
    If Coche1.Value = 1 Then ImprimerImage Décor.Soleil, 15.6, 6, 1.2, 1
    If Coche2.Value = 1 Then ImprimerImage Décor.Nuage, 15.6, 9.5, 1.2, 1
    If Coche3.Value = 1 Then ImprimerImage Décor.Orage, 15.6, 13, 1.2, 1
    
    Printer.EndDoc
    Screen.MousePointer = Anc
  End If

End Sub

Private Sub btnQuitter_Click()
  If DocumentChangé Then
    If MsgBox("Quitter avant" + Chr$(13) + "d'avoir Imprimé ?", 36, "Quitter") = 6 Then
      End
    End If
  Else
    End
  End If
End Sub

Private Sub btnSupLig_Click()
  If Liste.ListIndex >= 0 And Liste.ListIndex <= 10 Then
    Liste.RemoveItem Liste.ListIndex
    Liste.AddItem ""
  End If
End Sub

Private Function ChercheNom(ByVal chaine As String) As String
  p = InStr(chaine, Chr$(9))
  If p > 0 Then
    ChercheNom = Left$(chaine, p - 1)
  Else
    ChercheNom = ""
  End If
End Function

Private Function ChercheNote(ByVal chaine As String) As String
  p1 = InStr(chaine, Chr$(9))
  p2 = InStr(p1 + 1, chaine, Chr$(9))
  If p2 > 0 Then
    ChercheNote = Mid$(chaine, p1 + 1, p2 - p1 - 1)
  Else
    ChercheNote = ""
  End If
End Function

Private Function CherchePoids(ByVal chaine As String) As String
  p1 = InStr(chaine, Chr$(9))
  p2 = InStr(p1 + 1, chaine, Chr$(9))
  If p2 > 0 Then
    CherchePoids = Mid$(chaine, p2 + 1)
  Else
    CherchePoids = ""
  End If
End Function

Private Sub DessineBaromètre(X, Y, Moyenne)
    
    ' X et Y représentent les
    ' coordonnées du coin Haut Gauche

    ' COLORIAGE ( OBLIGATOIREMENT AVANT LE DESSIN )
    
    Mercure = RGB(128, 128, 128)
    Fond = Form1.BackColor
    Blanc = RGB(255, 255, 255)

    FillStyle = 0
    
    FillColor = Mercure             ' Des 2 demi-Cercles
    Circle (X + RayonExt, Y + LongueurDroite), RayonExt, , -3.14, -2 * 3.14
    
    FillColor = Fond
    Circle (X + RayonExt, Y + LongueurDroite), RayonExt - Largeur, , -3.14, -2 * 3.14
    Line (X, Y + LongueurDroite)-(X + 2 * RayonExt, Y + LongueurDroite), Fond

    Line (X + 2 * RayonExt, Y + LongueurDroite)-Step(-Largeur, -1), Mercure, BF    ' 1ère Remontée
    Line (X + 2 * RayonExt - 2 * Largeur / 10, Y + LongueurDroite - 1)-Step(-3 * Largeur / 5, -1), Mercure, BF   ' 2ème Remontée
    
    Line Step(-5 * Largeur / 10, 0)-Step(8 * Largeur / 5, -HauteurReservoir / 2.5), Mercure, BF ' Réservoir
    Line (X, Y + LongueurDroite)-Step(Largeur, -1 - (Moyenne - LimiteBas) * (LongueurDroite - 2) / (LimiteHaut - LimiteBas)), Mercure, BF ' Tige Verticale
    


    ' DESSIN
    Circle (X + Largeur / 2, Y), Largeur / 2, , 0, 3.14   ' Dessin du Bouchon

    PSet (X, Y)       ' Dessin de la Tige Verticale Gauche
    Line -Step(0, LongueurDroite)
    Circle Step(RayonExt, 0), RayonExt, RGB(10, 10, 10), 3.14, 0

    PSet (X + Largeur, Y)   ' Dessin de la Tige Verticale Droite
    Line -Step(0, LongueurDroite)
    Circle Step(RayonExt - Largeur, 0), RayonExt - Largeur, , 3.14, 0

    PSet (X, Y + 1)  ' Dessin des Petites & Grandes Graduations
    Inc = (LongueurDroite - 2) / (LimiteHaut - LimiteBas)
    For i = LimiteHaut To LimiteBas Step -1
        If i Mod 10 = 0 Then
             Line -Step(GdesGrad, 0)
             CurrentX = CurrentX - GdesGrad
             CurrentY = CurrentY + Inc
        Else: Line -Step(PtesGrad, 0)
             CurrentX = CurrentX - PtesGrad
             CurrentY = CurrentY + Inc
        End If
    Next i

    If LimiteHaut - LimiteBas > 50 Then
         Ajout = 20
         Else
         If LimiteHaut - LimiteBas < 30 Then
              Ajout = 5
         Else: Ajout = 10
         End If
    End If

    i = 10 * Int(0.5 + LimiteBas / 10)   '
    If i < LimiteBas Then i = i + 10     ' On arondit au 1er entier supérieur à la limite basse
    Précision = (LongueurDroite - 2) / (LimiteHaut - LimiteBas)
    CurrentY = (Y + LongueurDroite - 1.4) - Précision * (i - LimiteBas)  ' On place le premier numéro
    
    While i <= LimiteHaut
        CurrentX = X + Largeur + 0.1
        Print Format$(i); "%";
        CurrentY = CurrentY - Précision * Ajout
        i = i + Ajout
    Wend
    

    'FontItalic = -1
    'EcritTexte X + 1.1, 1 * (LongueurDroite - 2) / 4 + 1.1, Rem1
    'EcritTexte X + 1.1, 2 * (LongueurDroite - 2) / 4 + 1.1, Rem2
    'EcritTexte X + 1.1, 3 * (LongueurDroite - 2) / 4 + 1.1, Rem3
    'FontItalic = 0

    Line (X + 2 * RayonExt, Y + LongueurDroite)-Step(0, -1)  ' 1ère Remontée
    Line -Step(-2 * Largeur / 10, 0)   ' Rétrecissement  Droite
    Line -Step(0, -1)     ' 2ème Remontée
    Line (X + 2 * RayonExt - Largeur, Y + LongueurDroite)-Step(0, -1)  ' 1ère Remontée
    Line -Step(2 * Largeur / 10, 0)    ' Rétrecissement  Gauche
    Line -Step(0, -1)     ' 2ème Remontée

    FillStyle = 1
    Line Step(-5 * Largeur / 10, 0)-Step(8 * Largeur / 5, -HauteurReservoir), , B   ' Réservoir
    Line -Step(-8 * Largeur / 5, -0.2), , BF

    Line Step(8 * Largeur / 10 - 0.2, 0)-Step(0.4, -0.7), , BF
    
    CurrentX = 0.5
    CurrentY = 28
    Print "Moyenne: " + Format$(Moyenne, "#0.0")

End Sub

Private Sub DessineFleche(ByVal Xd, ByVal Yd, ByVal Xa, ByVal Ya)

    Form1.Line (Xd, Yd)-(Xa, Ya)
    Form1.Line (Xd - 0.1, Yd - 0.1)-Step(0.1, 0.2), , BF

End Sub

Private Sub EcritTexte(A, B As Single, Texte As String)
    
    CurrentX = A
    CurrentY = B
    Form1.Print Texte;

End Sub

Private Sub Form_Load()
    For i = 1 To Maxi
        Liste.AddItem ""
    Next i
    Liste.ListIndex = 0

    LimiteBas = Val(Minimum.Text)
    LimiteHaut = Val(Maximum.Text)
    DocumentChangé = 0

  Const nbt = 2
  Dim dummy As Long
  ReDim t(nbt - 1) As Integer
  t(0) = 115
  t(1) = 145
'  dummy = SendMessage(Liste.hWnd, LB_SETTABSTOPS, 0, ByVal 0&)
'  dummy = SendMessage(Liste.hWnd, LB_SETTABSTOPS, nbt, t(0))
End Sub

Private Sub ImprimeBaromètre(X, Y, Moyenne)
    
    ' X et Y représentent les
    ' coordonnées du coin Haut Gauche

    ' COLORIAGE ( OBLIGATOIREMENT AVANT LE DESSIN )
    
    G = 200
    Mercure = RGB(G, G, G)
    Fond = RGB(255, 255, 255)
    Blanc = RGB(255, 255, 255)

    Printer.FillStyle = 0
    
    Printer.FillColor = Mercure             ' Des 2 demi-Cercles
    Printer.Circle (X + RayonExt, Y + LongueurDroiteImprimante), RayonExt, Blanc, -3.14, -2 * 3.14
    
    Printer.FillColor = Fond
    Printer.Circle (X + RayonExt, Y + LongueurDroiteImprimante), RayonExt - Largeur, Blanc, -3.14, -2 * 3.14
    'Printer.Line (X, Y + LongueurDroiteImprimante)-(X + 2 * RayonExt, Y + LongueurDroiteImprimante), Fond

    'Printer.FillColor = Mercure
    Printer.Line (X + 2 * RayonExt + 0.02, Y + LongueurDroiteImprimante)-Step(-Largeur - 0.02, -1), Mercure, BF ' 1ère Remontée
    Printer.Line (X + 2 * RayonExt, Y + LongueurDroiteImprimante)-Step(-Largeur, 0), Mercure, BF          ' On Efface le Trait de Trop
    Printer.Line (X + 0.02 + 2 * RayonExt - 2 * Largeur / 10, Y + LongueurDroiteImprimante - 1)-Step(-0.02 - 3 * Largeur / 5, -1), Mercure, BF ' 2ème Remontée
    
    Printer.Line Step(-5 * Largeur / 10, 0)-Step(8 * Largeur / 5, -HauteurReservoirImprimante / 2.5), Mercure, BF ' Réservoir
    
    Printer.Line (X, Y + LongueurDroiteImprimante)-Step(Largeur + 0.02, -1 - (Moyenne - LimiteBas) * (LongueurDroiteImprimante - 2) / (LimiteHaut - LimiteBas)), Mercure, BF ' Niveau de Mercure
    Printer.CurrentX = Printer.CurrentX + 1.3
    Printer.CurrentY = Printer.CurrentY - 0.2
    Printer.FontSize = Petit
    Printer.FontItalic = -1
    Printer.FontBold = -1
    Printer.FontUnderline = -1
    Printer.Print "Moyenne ("; Format$(Moyenne, "#0.0"); ")";
    
    YMoy = Y + LongueurDroiteImprimante - 1 - (Moyenne - LimiteBas) * (LongueurDroiteImprimante - 2) / (LimiteHaut - LimiteBas)
    YObj = Y + LongueurDroiteImprimante - 1 - (Val(Objectif.Text) - LimiteBas) * (LongueurDroiteImprimante - 2) / (LimiteHaut - LimiteBas)
    
    Printer.DrawWidth = 12
    Printer.Line (X, YObj)-Step(Largeur, 0)
    Printer.CurrentX = Printer.CurrentX + 1.3
    Printer.CurrentY = Printer.CurrentY - 0.1
    
    While Abs(YMoy - YObj) < Printer.TextHeight("ObjMoy")
        YObj = YObj + 0.01
    Wend

    Printer.CurrentY = YObj - 0.2
    Printer.Print "Objectif ("; Objectif.Text; ")";
    Printer.DrawWidth = 1
    Printer.FontItalic = 0
    Printer.FontBold = 0
    Printer.FontUnderline = 0
    Printer.FontSize = Normal
    

    Printer.FillStyle = 1
    

    ' DESSIN
    
    Printer.Circle (X + Largeur / 2, Y), Largeur / 2, , 0, 3.14   ' Dessin du Bouchon

    Printer.Line (X, Y)-Step(0, LongueurDroiteImprimante)   ' Dessin de la Tige Verticale Gauche
    Printer.Circle Step(RayonExt, 0), RayonExt, RGB(10, 10, 10), 3.14, 0

    Printer.Line (X + Largeur, Y)-Step(0, LongueurDroiteImprimante)   ' Dessin de la Tige Verticale Droite
    Printer.Circle Step(RayonExt - Largeur, 0), RayonExt - Largeur, , 3.14, 0

    Printer.PSet (X, Y + 1)  ' Dessin des Petites & Grandes Graduations
    Inc = (LongueurDroiteImprimante - 2) / (LimiteHaut - LimiteBas)
    For i = LimiteHaut To LimiteBas Step -1
        If i Mod 10 = 0 Then
             Printer.Line -Step(GdesGrad, 0)
             Printer.CurrentX = Printer.CurrentX - GdesGrad
             Printer.CurrentY = Printer.CurrentY + Inc
        Else: Printer.Line -Step(PtesGrad, 0)
             Printer.CurrentX = Printer.CurrentX - PtesGrad
             Printer.CurrentY = Printer.CurrentY + Inc
        End If
    Next i

    Printer.FontSize = Petit
    
    If LimiteHaut - LimiteBas > 50 Then
         Ajout = 20
         Else
         If LimiteHaut - LimiteBas < 30 Then
              Ajout = 5
         Else: Ajout = 10
         End If
    End If

    i = 10 * Int(0.5 + LimiteBas / 10)   '
    If i < LimiteBas Then i = i + 10     ' On arondit au 1er entier supérieur à la limite basse
    Précision = (LongueurDroiteImprimante - 2) / (LimiteHaut - LimiteBas)
    Printer.CurrentY = (Y + LongueurDroiteImprimante - 1.2) - Précision * (i - LimiteBas)  ' On place le premier numéro
    
    While i <= LimiteHaut
        Printer.CurrentX = X + Largeur + 0.1
        Printer.Print Format$(i); "%";
        Printer.CurrentY = Printer.CurrentY - Précision * Ajout
        i = i + Ajout
    Wend

    
    Inc = (LongueurDroiteImprimante - 2) / (LimiteHaut - LimiteBas)
    Printer.FontItalic = -1
    
    Printer.FontItalic = 0
    Printer.FontSize = Normal

    Printer.Line (X + 2 * RayonExt, Y + LongueurDroiteImprimante)-Step(0, -1)  ' Pte Remontée
    Printer.Line -Step(-2 * Largeur / 10, 0)
    Printer.Line -Step(0, -1)
    Printer.Line (X + 2 * RayonExt - Largeur, Y + LongueurDroiteImprimante)-Step(0, -1)
    Printer.Line -Step(2 * Largeur / 10, 0)
    Printer.Line -Step(0, -1)

    Printer.Line Step(-5 * Largeur / 10, 0)-Step(8 * Largeur / 5, -HauteurReservoirImprimante), , B   ' Réservoir
    Printer.Line -Step(-8 * Largeur / 5, -0.2), , BF   ' Le Bouchon

    Printer.Line Step(8 * Largeur / 10 - 0.2, 0)-Step(0.4, -0.3), , BF ' La Tige du Bouchon

End Sub

Private Sub ImprimeFleche(ByVal Xd, ByVal Yd, ByVal Xa, ByVal Ya)

    Printer.Line (Xa, Ya)-((Xa + Xd) / 2, Yd)
    Printer.Line -(Xd, Yd)
    Printer.Line (Xd - 0.1, Yd - 0.1)-Step(0.1, 0.2), , BF

End Sub

Private Sub ImprimerImage(Motif As Control, ByVal PosX, ByVal PosY, DimX, DimY As Single)
    
    Const CNULL = 0&
    Const SRCCOPY = &HCC0020
    Const NEWFRAME = 1
    Const PIXEL = 3

    Printer.Print " "
    Motif.Picture = Motif.Image
    
    Motif.ScaleMode = PIXEL
    Printer.ScaleMode = PIXEL

    CoefX = Printer.Width / (21 * 4.5)
    CoefY = Printer.Height / (29.7 * 3.5)
    
    hMemoryDC% = CreateCompatibleDC(Motif.hDC)
    hOldBitMap% = SelectObject(hMemoryDC%, Motif.Picture)

    ApiError% = StretchBlt(Printer.hDC, CoefX * PosX, CoefY * PosY, CoefX * DimX, CoefY * DimY, hMemoryDC%, 0, 0, Motif.ScaleWidth, Motif.ScaleHeight, SRCCOPY)
    
    hOldBitMap% = SelectObject(hMemoryDC%, hOldBitMap%)
    ApiError% = DeleteDC(hMemoryDC%)

    'Print Escape(Printer.hDC, NEWFRAME, 0, CNULL, CNULL)
    Printer.ScaleMode = 0
End Sub

Private Sub ImprimeTexte(ByVal A, B As Single, ByVal Texte As String)
    
    Printer.CurrentX = A
    Printer.CurrentY = B + 0.1
    Printer.Print Texte;

End Sub

Private Sub Légende1_GotFocus()
    Selection Légende1
End Sub

Private Sub Légende2_GotFocus()
    Selection Légende2
End Sub

Private Sub Légende3_GotFocus()
    Selection Légende3
End Sub

Private Sub Liste_Click()
    Magasin.Text = ChercheNom(Liste.Text)
    Note.Text = ChercheNote(Liste.Text)
    Poids.Text = CherchePoids(Liste.Text)
End Sub

Private Sub Liste_KeyPress(ToucheAscii As Integer)
    If ToucheAscii = 13 Then
        Magasin.SetFocus
    End If
End Sub

Private Sub Magasin_GotFocus()
    Selection Magasin
End Sub

Private Sub Magasin_KeyPress(ToucheAscii As Integer)
    If ToucheAscii = 13 Then
        If Len(Magasin.Text) < TailleMaxi Then
            Note.SetFocus
        Else: MsgBox "La longueur du Nom ne doit" + Chr$(13) + "pas dépasser " + Str$(TailleMaxi), 48, "Erreur"
        End If
    End If
End Sub

Private Sub Maximum_Change()
        LimiteHaut = Val(Maximum.Text)
End Sub

Private Sub Maximum_GotFocus()
    Selection Maximum
End Sub

Private Sub Maximum_KeyPress(ToucheAscii As Integer)
    If ToucheAscii = 13 Then
        If LimiteHaut > 100 Then
             MsgBox "La Limite supérieure doit être" + Chr$(13) + "inférieure à 100.", 48, "Erreur"
             Maximum.SetFocus
        Else: Minimum.SetFocus
        End If
    End If
End Sub

Private Sub Minimum_Change()
        LimiteBas = Val(Minimum.Text)
End Sub

Private Sub Minimum_GotFocus()
    Selection Minimum
End Sub

Private Sub Minimum_KeyPress(ToucheAscii As Integer)
    If ToucheAscii = 13 Then
        If LimiteBas < 0 Then
            MsgBox "La Limite inférieure doit être" + Chr$(13) + "supérieure à 0.", 48, "Erreur"
            Minimum.Text = "0"
        End If
        If LimiteBas >= LimiteHaut Then
             MsgBox "Les limites se Chevauchent !", 48, "Erreur"
             Minimum.SetFocus
        Else: btnImprime.SetFocus
        End If
    End If
End Sub

Private Sub Note_GotFocus()
  Selection Note
End Sub

Private Sub Note_KeyPress(ToucheAscii As Integer)
  If ToucheAscii = 13 Then ValideSaisie
End Sub

Private Sub Objectif_GotFocus()
    Selection Objectif
End Sub

Private Sub Objectif_KeyPress(ToucheAscii As Integer)
    If ToucheAscii = 13 Then
        STitre.SetFocus
    End If
End Sub

Private Sub Poids_GotFocus()
  Selection Poids
End Sub

Private Sub Poids_KeyPress(ToucheAscii As Integer)
  If ToucheAscii = 13 Then ValideSaisie
End Sub

Private Sub Selection(Champ As Control)
    Champ.SelStart = 0
    Champ.SelLength = 100
End Sub

Private Sub STitre_GotFocus()
    Selection STitre
End Sub

Private Sub STitre_KeyPress(ToucheAscii As Integer)
    If ToucheAscii = 13 Then
        btnImprime.SetFocus
    End If

End Sub

Private Function strNote(ByVal n As Single) As String
  Dim fAdd As String

  If n < 10 Then
    fAdd = "  "
  ElseIf n < 100 Then
    fAdd = " "
  End If

  strNote = Format$(Val(Note.Text), fAdd & "0." & String$(NbreDécimales - 1, "0"))
End Function

Private Sub ValideSaisie()
  m$ = Note.Text
  p = InStr(m$, ",")
  If p > 0 Then Mid$(m$, p, 1) = "."
  Note.Text = m$
  If Val(Note.Text) > LimiteHaut Or Val(Note.Text) < LimiteBas Then
    MsgBox "La note doit être" + Chr$(13) + "comprise entre " + Str$(LimiteBas) + " et " + Str$(LimiteHaut), 48, "Erreur"
    Note.Text = ""
    Note.SetFocus
  Else
    po$ = Poids
    If po$ = "" Then po$ = "1"
    no$ = strNote(Note.Text)
    Tmp$ = Magasin.Text & Chr$(9) & no$ & Chr$(9) & po$

    p = InStr(Tmp$, ",")
    If p > 0 Then Mid$(Tmp$, p, 1) = "."
    
    Liste.List(Liste.ListIndex) = Tmp$
    If Liste.ListIndex < Maxi - 1 Then Liste.ListIndex = Liste.ListIndex + 1
    Magasin.Text = ChercheNom(Liste.Text)
    Note.Text = ChercheNote(Liste.Text)
    Poids.Text = CherchePoids(Liste.Text)
    Magasin.SetFocus
    DocumentChangé = -1
  End If
End Sub

