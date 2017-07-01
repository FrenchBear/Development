VERSION 2.00
Begin Form frmAbout 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Double
   Caption         =   "A propos d' ERCEM SYSTEM / HACCP"
   ClientHeight    =   4545
   ClientLeft      =   1890
   ClientTop       =   1380
   ClientWidth     =   7425
   Height          =   4950
   KeyPreview      =   -1  'True
   Left            =   1830
   LinkTopic       =   "Feuille1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   7425
   Top             =   1035
   Width           =   7545
   Begin CommandButton btnPrésentation 
      Caption         =   "&Présentation"
      Height          =   375
      Left            =   6000
      TabIndex        =   1
      Top             =   600
      Width           =   1335
   End
   Begin CommandButton btnOk 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   6000
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
   Begin Image Dessin1 
      Height          =   4545
      Left            =   0
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
      BackStyle       =   0  'Transparent
      Caption         =   "Tous droits de reproduction réservés"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   480
      Index           =   3
      Left            =   4680
      TabIndex        =   5
      Top             =   2640
      Width           =   2655
      WordWrap        =   -1  'True
   End
   Begin Label Etiquette1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "© 1992-1994 ERCEM"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   240
      Index           =   2
      Left            =   4680
      TabIndex        =   4
      Top             =   2400
      Width           =   2100
   End
   Begin Label Etiquette1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
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
      Left            =   4680
      TabIndex        =   3
      Top             =   960
      Width           =   2700
      WordWrap        =   -1  'True
   End
   Begin Label lblVersion 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Version xxx"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   240
      Left            =   4680
      TabIndex        =   2
      Top             =   1920
      Width           =   1185
   End
End
Option Explicit

Sub btnOk_click ()
  Unload frmAbout
End Sub

Sub btnPrésentation_Click ()
  ShowHelp 2
End Sub

Sub Dessin1_DblClick ()
  MsgBox sNomProg & Chr(10) & "© 1994 ERCEM / P.VIOLENT", 64
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 27 Then btnOk_click
End Sub

Sub Form_Load ()
   lblVersion = "Version " & sversion
   caption = "A propos d'ERCEM SYSTEM / HACCP " & sversion
End Sub

