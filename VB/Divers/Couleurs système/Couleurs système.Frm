VERSION 5.00
Begin VB.Form frmCouleursSystème 
   Caption         =   "Couleurs système en VB"
   ClientHeight    =   7245
   ClientLeft      =   1800
   ClientTop       =   1470
   ClientWidth     =   10035
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   483
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   669
End
Attribute VB_Name = "frmCouleursSystème"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCouleursSystème
' Affiche un tableau des couleurs d'affichage préconfigurées
' PV

Option Explicit

Dim ColorKey(24) As String, ColorDesc(24) As String, colorval(24) As Long
Dim oldwidth, oldheight

Private Sub Form_Load()
  ColorKey(0) = "vbScrollBars"
  ColorDesc(0) = "Couleur de la barre de défilement"
  colorval(0) = vbScrollBars
  
  ColorKey(1) = "vbDesktop"
  ColorDesc(1) = "Couleur du bureau"
  colorval(1) = vbDesktop
  
  ColorKey(2) = "vbActiveTitleBar"
  ColorDesc(2) = "Couleur de la barre de titre de la fenêtre active"
  ColorKey(3) = "vbInactiveTitleBar"
  ColorDesc(3) = "Couleur de la barre de titre de la fenêtre inactive"
  ColorKey(4) = "vbMenuBar"
  ColorDesc(4) = "Couleur d'arrière-plan des menus"
  
  ColorKey(5) = "vbWindowBackground"
  ColorDesc(5) = "Couleur d'arrière-plan des fenêtres"
  colorval(5) = vbWindowBackground
  
  ColorKey(6) = "vbWindowFrame"
  ColorDesc(6) = "Couleur du cadre des fenêtres"
  ColorKey(7) = "vbMenuText"
  ColorDesc(7) = "Couleur du texte des menus"
  ColorKey(8) = "vbWindowText"
  ColorDesc(8) = "Couleur du texte dans les fenêtres"
  ColorKey(9) = "vbTitleBarText"
  ColorDesc(9) = "Couleur du texte de la légende, de la zone de dimensionnement et de la flèche de défilement"
  ColorKey(10) = "vbActiveBorder"
  ColorDesc(10) = "Couleur de la bordure de la fenêtre active"
  ColorKey(11) = "vbInactiveBorder"
  ColorDesc(11) = "Couleur de la bordure de la fenêtre inactive"
  ColorKey(12) = "vbApplicationWorkspace"
  ColorDesc(12) = "Couleur d'arrière-plan des applications MDI"
  ColorKey(13) = "vbHighlight"
  ColorDesc(13) = "Couleur d'arrière-plan des éléments sélectionnés dans un contrôle"
  ColorKey(14) = "vbHighlightText"
  ColorDesc(14) = "Couleur du texte des éléments sélectionnés dans un contrôle"
  ColorKey(15) = "vbButtonFace"
  ColorDesc(15) = "Couleur de l'ombrage de la face des boutons de commande"
  ColorKey(16) = "vbButtonShadow"
  ColorDesc(16) = "Couleur de l'ombrage du bord des boutons de commande"
  ColorKey(17) = "vbGrayText"
  ColorDesc(17) = "Texte grisé (désactivé)"
  ColorKey(18) = "vbButtonText"
  ColorDesc(18) = "Couleur du texte des boutons de commande"
  ColorKey(19) = "vbInactiveCaptionText"
  ColorDesc(19) = "Couleur du texte d'une légende inactive"
  ColorKey(20) = "vb3DHighlight"
  ColorDesc(20) = "Couleur de mise en surbrillance des éléments affichés en 3D"
  ColorKey(21) = "vb3DDKShadow"
  ColorDesc(21) = "Couleur de l'ombrage le plus foncé des éléments affichés en 3D"
  ColorKey(22) = "vb3DLight"
  ColorDesc(22) = "Deuxième couleur la plus claire des couleurs 3D après vb3DHighlight"
  ColorKey(23) = "vbInfoText"
  ColorDesc(23) = "Couleur du texte des info-bulles"
  ColorKey(24) = "vbInfoBackground"
  ColorDesc(24) = "Couleur d'arrière-plan des info-bulles."
End Sub

Private Sub Form_Paint()
  Cls
  Dim i, k
  Dim base, nextbase
  
  k = ScaleHeight / 26
  For i = 0 To 25
    base = Int(k * i)
    nextbase = Int(k * (i + 1))
    If i > 0 Then
      Line (0, base)-Step(ScaleWidth, 0), vbButtonShadow
      Line (0, base + 1)-Step(ScaleWidth, 0), vb3DHighlight
    
      Line (0, base + 2)-Step(2 * k, nextbase - base - 4), &H80000000 + i, BF
    End If
    
    CurrentY = i * k + (k - TextHeight("0")) / 2
    
    If i > 0 Then
      CurrentX = k * 2.5
      Print Hex(i - 1);
    End If
    
    CurrentX = k * 2.5 + TextWidth("000")
    If i > 0 Then
      Print ColorKey(i - 1); " "; Hex(colorval(i - 1));
    Else
      FontBold = True
      Print "Constante VB";
      FontBold = False
    End If
    
    CurrentX = k * 1.5 + 12 * TextWidth("000")
    If i > 0 Then
      Print ColorDesc(i - 1);
    Else
      FontBold = True
      Print "Affectation"
      FontBold = False
    End If
  Next
End Sub

Private Sub Form_Resize()
  If ScaleWidth < oldwidth And ScaleHeight < oldheight Then Form_Paint
  oldwidth = ScaleWidth
  oldheight = ScaleHeight
End Sub
