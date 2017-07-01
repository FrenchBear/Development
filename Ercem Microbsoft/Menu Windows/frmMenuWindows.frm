VERSION 5.00
Begin VB.Form frmMenuWindows 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Lanceur de programmes"
   ClientHeight    =   3420
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5865
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMenuWindows.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3420
   ScaleWidth      =   5865
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnLance 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   650
      Index           =   3
      Left            =   120
      Picture         =   "frmMenuWindows.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   9
      Tag             =   "TablesLabo"
      Top             =   2640
      Width           =   650
   End
   Begin VB.CommandButton btnLance 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   650
      Index           =   2
      Left            =   120
      Picture         =   "frmMenuWindows.frx":0884
      Style           =   1  'Graphical
      TabIndex        =   6
      Tag             =   "TablesFEU"
      Top             =   1800
      Width           =   650
   End
   Begin VB.CommandButton btnLance 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   650
      Index           =   1
      Left            =   120
      Picture         =   "frmMenuWindows.frx":0CC6
      Style           =   1  'Graphical
      TabIndex        =   3
      Tag             =   "TablesDoc"
      Top             =   960
      Width           =   650
   End
   Begin VB.CommandButton btnLance 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   650
      Index           =   0
      Left            =   120
      Picture         =   "frmMenuWindows.frx":1108
      Style           =   1  'Graphical
      TabIndex        =   0
      Tag             =   "TablesAdmin"
      Top             =   120
      Width           =   650
   End
   Begin VB.Label lblCommentaire 
      Caption         =   "Germes, Milieux, Méthodes, Evénements, Suivi des milieux, Anomalies, Evénements"
      Height          =   435
      Index           =   3
      Left            =   840
      TabIndex        =   11
      Top             =   2880
      Width           =   4875
   End
   Begin VB.Label lblTitre 
      AutoSize        =   -1  'True
      Caption         =   "Tables Labo"
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
      Index           =   3
      Left            =   840
      TabIndex        =   10
      Top             =   2640
      Width           =   1185
   End
   Begin VB.Label lblCommentaire 
      Caption         =   "Gestion des FEU"
      Height          =   435
      Index           =   2
      Left            =   840
      TabIndex        =   8
      Top             =   2040
      Width           =   4875
   End
   Begin VB.Label lblTitre 
      AutoSize        =   -1  'True
      Caption         =   "Fiches d'envoi urgent"
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
      Index           =   2
      Left            =   840
      TabIndex        =   7
      Top             =   1800
      Width           =   2115
   End
   Begin VB.Label lblTitre 
      AutoSize        =   -1  'True
      Caption         =   "Tables documentaires"
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
      Index           =   1
      Left            =   840
      TabIndex        =   5
      Top             =   960
      Width           =   2160
   End
   Begin VB.Label lblCommentaire 
      Caption         =   "Jeux de données, Tables, Colonnes"
      Height          =   435
      Index           =   1
      Left            =   840
      TabIndex        =   4
      Top             =   1200
      Width           =   4875
   End
   Begin VB.Label lblCommentaire 
      Caption         =   "Utilisateurs, Lettres, Unités, Unités de ventilation, Pays, Jours fériés, Systèmes"
      Height          =   435
      Index           =   0
      Left            =   840
      TabIndex        =   2
      Top             =   360
      Width           =   4875
   End
   Begin VB.Label lblTitre 
      AutoSize        =   -1  'True
      Caption         =   "Tables administratives"
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
      Left            =   840
      TabIndex        =   1
      Top             =   120
      Width           =   2235
   End
End
Attribute VB_Name = "frmMenuWindows"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmMenuWindows
' Menu rapide de lancement des applications Windows
' 16/02/1998 PV


Option Explicit


Sub Lance(ByVal sProg As String)
  Shell "Z:\Microbsoft\" & sProg, vbNormalFocus
End Sub

Private Sub btnLance_Click(Index As Integer)
  Lance btnLance(Index).Tag
End Sub
