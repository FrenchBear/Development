VERSION 5.00
Begin VB.Form frmTh�mes 
   Caption         =   "Th�mes"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4755
   LinkTopic       =   "Form3"
   ScaleHeight     =   3195
   ScaleWidth      =   4755
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtSujet 
      DataField       =   "Sujet"
      DataMember      =   "Th�mes"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1305
      TabIndex        =   7
      Top             =   1215
      Width           =   3375
   End
   Begin VB.TextBox txtDescriptif 
      DataField       =   "Descriptif"
      DataMember      =   "Th�mes"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1305
      TabIndex        =   5
      Top             =   840
      Width           =   3375
   End
   Begin VB.TextBox txtNomduth�me 
      DataField       =   "Nom du th�me"
      DataMember      =   "Th�mes"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1305
      TabIndex        =   3
      Top             =   450
      Width           =   3375
   End
   Begin VB.TextBox txtCodeduth�me 
      DataField       =   "Code du th�me"
      DataMember      =   "Th�mes"
      DataSource      =   "Diapos"
      Height          =   285
      Left            =   1305
      TabIndex        =   1
      Top             =   75
      Width           =   660
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Sujet:"
      Height          =   255
      Index           =   3
      Left            =   -540
      TabIndex        =   6
      Top             =   1260
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Descriptif:"
      Height          =   255
      Index           =   2
      Left            =   -540
      TabIndex        =   4
      Top             =   885
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Nom du th�me:"
      Height          =   255
      Index           =   1
      Left            =   -540
      TabIndex        =   2
      Top             =   495
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Code du th�me:"
      Height          =   255
      Index           =   0
      Left            =   -540
      TabIndex        =   0
      Top             =   120
      Width           =   1815
   End
End
Attribute VB_Name = "frmTh�mes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

