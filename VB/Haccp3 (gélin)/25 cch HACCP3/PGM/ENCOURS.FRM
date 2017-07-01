VERSION 2.00
Begin Form frmEnCours 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Double
   Caption         =   "Génération du document en cours..."
   ClientHeight    =   1665
   ClientLeft      =   2775
   ClientTop       =   2925
   ClientWidth     =   5985
   Height          =   2070
   Left            =   2715
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1665
   ScaleWidth      =   5985
   Top             =   2580
   Width           =   6105
   Begin CommandButton cmdAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   2400
      TabIndex        =   4
      Top             =   1200
      Width           =   1215
   End
   Begin Label lbl 
      BackStyle       =   0  'Transparent
      Caption         =   "Point de maîtrise"
      Height          =   255
      Index           =   3
      Left            =   480
      TabIndex        =   3
      Top             =   840
      Width           =   5295
   End
   Begin Label lbl 
      BackStyle       =   0  'Transparent
      Caption         =   "Danger"
      Height          =   255
      Index           =   2
      Left            =   360
      TabIndex        =   2
      Top             =   600
      Width           =   5295
   End
   Begin Label lbl 
      BackStyle       =   0  'Transparent
      Caption         =   "Produit"
      Height          =   255
      Index           =   1
      Left            =   240
      TabIndex        =   1
      Top             =   360
      Width           =   5295
   End
   Begin Label lbl 
      BackStyle       =   0  'Transparent
      Caption         =   "Etape"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5295
   End
End
Option Explicit

Sub cmdAnnuler_Click ()
  Beep: Beep: Beep
  bStop = True
End Sub

