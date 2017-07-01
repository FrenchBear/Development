VERSION 2.00
Begin Form frmAbout 
   BorderStyle     =   3  'Trait double fixe
   Caption         =   "A propos d' ERCEM SYSTEM / HACCP"
   ClientHeight    =   4545
   ClientLeft      =   2205
   ClientTop       =   1350
   ClientWidth     =   7425
   Height          =   4950
   Left            =   2145
   LinkTopic       =   "Feuille1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   7425
   Top             =   1005
   Width           =   7545
   Begin CommandButton Commande1 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   495
      Left            =   5160
      TabIndex        =   0
      Top             =   3840
      Width           =   1215
   End
   Begin Image Dessin1 
      Height          =   4545
      Left            =   -120
      Picture         =   ABOUT.FRX:0000
      Top             =   0
      Width           =   4530
   End
   Begin Line Ligne1 
      BorderWidth     =   3
      X1              =   4560
      X2              =   7320
      Y1              =   2280
      Y2              =   2280
   End
   Begin Label Etiquette1 
      AutoSize        =   -1  'True
      Caption         =   "Tous droits de reproduction interdits"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   615
      Index           =   3
      Left            =   4560
      TabIndex        =   4
      Top             =   2640
      Width           =   2655
      WordWrap        =   -1  'True
   End
   Begin Label Etiquette1 
      AutoSize        =   -1  'True
      Caption         =   "© 1992-1993 ERCEM"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   240
      Index           =   2
      Left            =   4560
      TabIndex        =   3
      Top             =   2400
      Width           =   2100
   End
   Begin Label Etiquette1 
      AutoSize        =   -1  'True
      Caption         =   "Système informatique interactif d'aide au diagnostic HACCP"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   12
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      ForeColor       =   &H00FF0000&
      Height          =   900
      Index           =   1
      Left            =   4560
      TabIndex        =   2
      Top             =   960
      Width           =   2700
      WordWrap        =   -1  'True
   End
   Begin Label Etiquette1 
      AutoSize        =   -1  'True
      Caption         =   "Version 1.2"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   240
      Index           =   0
      Left            =   4560
      TabIndex        =   1
      Top             =   1920
      Width           =   1410
   End
End

Sub Commande1_Click ()
  Unload frmAbout
End Sub

