VERSION 5.00
Begin VB.Form frmChoixEtatAnomalie 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Choix de l'état Anomalies"
   ClientHeight    =   1515
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3975
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmChoixEtatAnomalie.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1515
   ScaleWidth      =   3975
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnChoix 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   495
      Index           =   0
      Left            =   2700
      TabIndex        =   3
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton btnChoix 
      Caption         =   "Détail"
      Height          =   495
      Index           =   2
      Left            =   1380
      TabIndex        =   2
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton btnChoix 
      Caption         =   "Tableau récapitulatif"
      Height          =   495
      Index           =   1
      Left            =   60
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Il existe plusieurs états différents pour imprimer les anomalies sélectionnées. Choisissez le type d'état souhaité."
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3615
   End
End
Attribute VB_Name = "frmChoixEtatAnomalie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmChoixEtatAnomalie
' Propose un choix parmi les états disponibles pour les anomalies
' 31/03/1999 PV

Option Explicit

Private iRet As Integer


Public Function iChoix() As Integer
  iRet = 0
  Show vbModal
  iChoix = iRet
End Function

Private Sub btnChoix_Click(Index As Integer)
  iRet = Index
  Unload Me
End Sub
