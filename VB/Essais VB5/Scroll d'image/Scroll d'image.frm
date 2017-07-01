VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2730
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3840
   LinkTopic       =   "Form1"
   ScaleHeight     =   2730
   ScaleWidth      =   3840
   StartUpPosition =   3  'Windows Default
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   20
      Left            =   120
      TabIndex        =   3
      Top             =   2400
      Width           =   2295
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   1455
      LargeChange     =   20
      Left            =   3480
      TabIndex        =   2
      Top             =   120
      Width           =   255
   End
   Begin VB.PictureBox Picture1 
      Height          =   2055
      Left            =   120
      ScaleHeight     =   1995
      ScaleWidth      =   3195
      TabIndex        =   0
      Top             =   120
      Width           =   3255
      Begin VB.PictureBox Picture2 
         Height          =   1335
         Left            =   240
         ScaleHeight     =   1275
         ScaleWidth      =   2475
         TabIndex        =   1
         Top             =   240
         Width           =   2535
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Défilement d'image
' 21/4/97 PV
' Manuel de l'utilisateur VB, P. 310

Option Explicit

Private Sub Form_Load()

  ' Définit ScaleMode en pixels.
  Form1.ScaleMode = vbPixels
  Picture1.ScaleMode = vbPixels

  ' La valeur True est affectée à la propriété
  ' Autosize pour que les limites de Picture2 soient
  ' agrandies à la taille réelle du l'image bitmap.
  Picture2.AutoSize = True

  ' Affecte la valeur 0-None à la propriété
  ' BorderStyle de chaque contrôle PictureBox.
  Picture1.BorderStyle = 0
  Picture2.BorderStyle = 0

  ' Charge le bitmap.
  Picture2.Picture = LoadPicture("c:\Win95\Winlogo.bmp")

  ' Initialise la localisation des deux images.
  Picture1.Move 0, 0, ScaleWidth - VScroll1.Width, ScaleHeight - HScroll1.Height
  Picture2.Move 0, 0

  ' Positionne la barre de défilement horizontal.
  HScroll1.Top = Picture1.Height
  HScroll1.Left = 0
  HScroll1.Width = Picture1.Width

  ' Positionne la barre de défilement vertical.
  VScroll1.Top = 0
  VScroll1.Left = Picture1.Width
  VScroll1.Height = Picture1.Height

  ' Définit la propriété Max des barres de
  ' défilement.
  HScroll1.Max = Picture2.Width - Picture1.Width
  VScroll1.Max = Picture2.Height - Picture1.Height

  ' Détermine si l'image enfant remplira l'écran.
  ' Dans ce cas, il n'est pas nécessaire d'utiliser
  ' des barres de défilement.
  VScroll1.Visible = (Picture1.Height < Picture2.Height)
  HScroll1.Visible = (Picture1.Width < Picture2.Width)

End Sub
    
Private Sub HScroll1_Scroll()
  Picture2.Left = -HScroll1.Value
End Sub

Private Sub VScroll1_Scroll()
  Picture2.Top = -VScroll1.Value
End Sub

Private Sub Form_Resize()
  ' Quand la feuille est redimensionnée, change les
  ' dimensions de Picture1.
  Picture1.Height = Form1.Height
  Picture1.Width = Form1.Width

  ' Réinitialise la position de l'image et des
  ' barres de défilement.
  Picture1.Move 0, 0, ScaleWidth - VScroll1.Width, ScaleHeight - HScroll1.Height
  Picture2.Move 0, 0
  HScroll1.Top = Picture1.Height
  HScroll1.Left = 0
  HScroll1.Width = Picture1.Width
  VScroll1.Top = 0
  VScroll1.Left = Picture1.Width
  VScroll1.Height = Picture1.Height
  HScroll1.Max = Picture2.Width - Picture1.Width
  VScroll1.Max = Picture2.Height - Picture1.Height  ' Erreur dans la doc !

  ' Vérifie si les barres de défilement sont
  ' nécessaires.
  VScroll1.Visible = (Picture1.Height < Picture2.Height)
  HScroll1.Visible = (Picture1.Width < Picture2.Width)

End Sub

