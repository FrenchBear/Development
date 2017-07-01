VERSION 5.00
Begin VB.Form frmDiapos 
   Caption         =   "Diapos"
   ClientHeight    =   5265
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form2"
   ScaleHeight     =   5265
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtCirconstances 
      DataField       =   "Circonstances"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   25
      Top             =   4665
      Width           =   3375
   End
   Begin VB.TextBox txtTechnique 
      DataField       =   "Technique"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   23
      Top             =   4290
      Width           =   3375
   End
   Begin VB.TextBox txtQualité 
      DataField       =   "Qualité"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   21
      Top             =   3900
      Width           =   3375
   End
   Begin VB.TextBox txtMontage 
      DataField       =   "Montage"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   19
      Top             =   3525
      Width           =   660
   End
   Begin VB.TextBox txtRebus 
      DataField       =   "Rebus"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   17
      Top             =   3150
      Width           =   330
   End
   Begin VB.TextBox txtPortrait 
      DataField       =   "Portrait"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   15
      Top             =   2760
      Width           =   330
   End
   Begin VB.TextBox Text3 
      DataField       =   "Tirable ?"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   13
      Top             =   2385
      Width           =   330
   End
   Begin VB.TextBox Text2 
      DataField       =   "Tirage ?"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   11
      Top             =   2010
      Width           =   330
   End
   Begin VB.TextBox txtdate 
      DataField       =   "date"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   9
      Top             =   1620
      Width           =   825
   End
   Begin VB.TextBox txtDescriptif 
      DataField       =   "Descriptif"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   7
      Top             =   1245
      Width           =   3375
   End
   Begin VB.TextBox txtTitre 
      DataField       =   "Titre"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   5
      Top             =   870
      Width           =   3375
   End
   Begin VB.TextBox Text1 
      DataField       =   "N° d'ordre"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   3
      Top             =   480
      Width           =   330
   End
   Begin VB.TextBox txtSérie 
      DataField       =   "Série"
      DataMember      =   "Diapos"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1230
      TabIndex        =   1
      Top             =   105
      Width           =   660
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Circonstances:"
      Height          =   255
      Index           =   12
      Left            =   -615
      TabIndex        =   24
      Top             =   4710
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Technique:"
      Height          =   255
      Index           =   11
      Left            =   -615
      TabIndex        =   22
      Top             =   4335
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Qualité:"
      Height          =   255
      Index           =   10
      Left            =   -615
      TabIndex        =   20
      Top             =   3945
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Montage:"
      Height          =   255
      Index           =   9
      Left            =   -615
      TabIndex        =   18
      Top             =   3570
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Rebus:"
      Height          =   255
      Index           =   8
      Left            =   -615
      TabIndex        =   16
      Top             =   3195
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Portrait:"
      Height          =   255
      Index           =   7
      Left            =   -615
      TabIndex        =   14
      Top             =   2805
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Tirable ?:"
      Height          =   255
      Index           =   6
      Left            =   -615
      TabIndex        =   12
      Top             =   2430
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Tirage ?:"
      Height          =   255
      Index           =   5
      Left            =   -615
      TabIndex        =   10
      Top             =   2055
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "date:"
      Height          =   255
      Index           =   4
      Left            =   -615
      TabIndex        =   8
      Top             =   1665
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Descriptif:"
      Height          =   255
      Index           =   3
      Left            =   -615
      TabIndex        =   6
      Top             =   1290
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Titre:"
      Height          =   255
      Index           =   2
      Left            =   -615
      TabIndex        =   4
      Top             =   915
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "N° d'ordre:"
      Height          =   255
      Index           =   1
      Left            =   -615
      TabIndex        =   2
      Top             =   525
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Série:"
      Height          =   255
      Index           =   0
      Left            =   -615
      TabIndex        =   0
      Top             =   150
      Width           =   1815
   End
End
Attribute VB_Name = "frmDiapos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

