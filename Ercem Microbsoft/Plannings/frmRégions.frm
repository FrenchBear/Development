VERSION 5.00
Begin VB.Form frmR�gions 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "D�coupage de la France en r�gions"
   ClientHeight    =   7020
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10365
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmR�gions.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmR�gions.frx":0442
   ScaleHeight     =   468
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   691
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnImprimer 
      Caption         =   "&Imprimer"
      Height          =   375
      Left            =   7680
      TabIndex        =   2
      Top             =   6600
      Width           =   1455
   End
   Begin VB.Label lblD�partements 
      BackStyle       =   0  'Transparent
      Caption         =   "D�partements"
      Height          =   930
      Index           =   0
      Left            =   7680
      TabIndex        =   1
      Top             =   300
      Visible         =   0   'False
      Width           =   2640
   End
   Begin VB.Label lblR�gion 
      BackStyle       =   0  'Transparent
      Caption         =   "R�gion 0: XXX"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   0
      Left            =   7560
      TabIndex        =   0
      Top             =   60
      Visible         =   0   'False
      Width           =   2760
   End
End
Attribute VB_Name = "frmR�gions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmR�gions
' Informations sur le d�coupage de la France en r�gions
' 20/12/1999 PV


Option Explicit

Private Sub btnImprimer_Click()
  Me.PrintForm
End Sub

Private Sub Form_Load()
  R 1, RGB(255, 0, 0), "IDF-NORD EST", "02 - 08 - 10 - 51 - 59 - 60 - 62 - 77 - 80 - 89 - 93 - 94 - 95 - 75"
  R 2, RGB(0, 255, 0), "IDF OUEST", "14 - 18 - 27 - 28 - 36 - 37 - 41 - 45 - 50 - 61 - 75 - 76 - 78 - 91 - 92"
  R 3, RGB(255, 255, 0), "EST", "21 - 25 - 39 - 52 - 54 - 55 - 57 - 58 - 67 - 68 - 70 - 71 - 88 - 90"
  R 4, RGB(0, 0, 255), "RHONE ALPES AUVERGNE", "01 - 03 - 05 - 07 - 15 - 23 - 26 - 38 - 42 - 43 - 63 - 69 - 73 - 74"
  R 5, RGB(255, 0, 255), "SUD EST", "04 - 06 - 09 - 11 - 12 - 13 - 2A - 2B - 30 - 31 - 34 - 48 - 66 - 81 - 83 - 84"
  R 6, RGB(0, 255, 255), "GRAND OUEST", "16 - 17 - 19 - 22 - 24 - 29 - 32 - 33 - 35 - 40 - 44 - 46 - 47 - 49 - 53 - 56 - 64 - 65 - 72 - 79 - 82 - 85 - 86 - 87"
End Sub

Private Sub R(iR�gion As Integer, lCouleur As Long, sTitre As String, sD�partements As String)
  Load lblR�gion(iR�gion)
  Load lblD�partements(iR�gion)
  
  With lblR�gion(iR�gion)
    .Caption = "R�gion " & iR�gion & ": " & sTitre
    .Top = 66 * (iR�gion - 1)
    .ForeColor = lCouleur
    .Visible = True
  End With
  With lblD�partements(iR�gion)
    .Caption = sD�partements
    .Top = 66 * (iR�gion - 1) + 15
    .Visible = True
  End With
End Sub
