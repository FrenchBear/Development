VERSION 4.00
Begin VB.Form frmStatistiques 
   Caption         =   "Statistiques Microb'Soft"
   ClientHeight    =   4125
   ClientLeft      =   330
   ClientTop       =   1545
   ClientWidth     =   9150
   Height          =   4530
   Icon            =   "frmStatistiques.frx":0000
   Left            =   270
   LinkTopic       =   "Form1"
   ScaleHeight     =   4125
   ScaleWidth      =   9150
   Top             =   1200
   Width           =   9270
   Begin VB.ListBox lstFenêtres 
      Height          =   1620
      Left            =   1740
      TabIndex        =   19
      Top             =   2280
      Width           =   3255
   End
   Begin VB.TextBox txtNbLect 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   1
      Left            =   1740
      Locked          =   -1  'True
      TabIndex        =   17
      Top             =   1020
      Width           =   975
   End
   Begin VB.TextBox txtNbLectCache 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   1
      Left            =   3000
      Locked          =   -1  'True
      TabIndex        =   16
      Top             =   1020
      Width           =   975
   End
   Begin VB.TextBox txtSuccèsCache 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   1
      Left            =   4380
      Locked          =   -1  'True
      TabIndex        =   15
      Top             =   1020
      Width           =   975
   End
   Begin VB.TextBox txtCount 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   1
      Left            =   5700
      Locked          =   -1  'True
      TabIndex        =   14
      Top             =   1020
      Width           =   975
   End
   Begin VB.TextBox txtNbUnités 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1740
      Locked          =   -1  'True
      TabIndex        =   12
      Top             =   1860
      Width           =   975
   End
   Begin VB.CommandButton btnFermer 
      Cancel          =   -1  'True
      Caption         =   "Fermer"
      Default         =   -1  'True
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7800
      TabIndex        =   11
      Top             =   120
      Width           =   1215
   End
   Begin VB.TextBox txtNbUtilisateurs 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1740
      Locked          =   -1  'True
      TabIndex        =   10
      Top             =   1440
      Width           =   975
   End
   Begin VB.TextBox txtCount 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   0
      Left            =   5700
      Locked          =   -1  'True
      TabIndex        =   8
      Top             =   600
      Width           =   975
   End
   Begin VB.TextBox txtSuccèsCache 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   0
      Left            =   4380
      Locked          =   -1  'True
      TabIndex        =   7
      Top             =   600
      Width           =   975
   End
   Begin VB.TextBox txtNbLectCache 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   0
      Left            =   3000
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   600
      Width           =   975
   End
   Begin VB.TextBox txtNbLect 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   0
      Left            =   1740
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   600
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Fenêtres chargées :"
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   570
      Index           =   4
      Left            =   120
      TabIndex        =   20
      Top             =   2340
      Width           =   1335
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Interventions :"
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   3
      Left            =   120
      TabIndex        =   18
      Top             =   1080
      Width           =   1410
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Unités :"
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   2
      Left            =   120
      TabIndex        =   13
      Top             =   1920
      Width           =   735
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Utilisateurs :"
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   1
      Left            =   120
      TabIndex        =   9
      Top             =   1500
      Width           =   1200
   End
   Begin VB.Label Label5 
      Caption         =   "Taux de succès du cache"
      Height          =   375
      Left            =   4380
      TabIndex        =   5
      Top             =   120
      Width           =   1245
   End
   Begin VB.Label Label4 
      Caption         =   "Nb d'enregistrements dans le cache"
      Height          =   375
      Left            =   5700
      TabIndex        =   4
      Top             =   120
      Width           =   1605
   End
   Begin VB.Label Label3 
      Caption         =   "Nb de lectures depuis le cache"
      Height          =   375
      Left            =   3000
      TabIndex        =   3
      Top             =   120
      Width           =   1245
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Nb de lectures"
      Height          =   195
      Left            =   1680
      TabIndex        =   2
      Top             =   120
      Width           =   1035
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Etablissements :"
      BeginProperty Font 
         name            =   "Verdana"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   660
      Width           =   1575
   End
End
Attribute VB_Name = "frmStatistiques"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub btnFermer_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  On Error Resume Next
  
  txtNbLect(0) = getb_iNbLire
  txtNbLectCache(0) = getb_iNbLireDuCache
  txtSuccèsCache(0) = Format(getb_iNbLireDuCache / getb_iNbLire, "0.00%")
  txtCount(0) = getb_iCacheCount

  txtNbLect(1) = gpla_iNbLire
  txtNbLectCache(1) = gpla_iNbLireDuCache
  txtSuccèsCache(1) = Format(gpla_iNbLireDuCache / gpla_iNbLire, "0.00%")
  txtCount(1) = gpla_iCacheCount

  txtNbUtilisateurs = guti_iNbUtilisateurs
  txtNbUnités = guni_iNbUnités
  
  Dim w As Form
  For Each w In Forms
    lstFenêtres.AddItem w.Caption
  Next
End Sub
