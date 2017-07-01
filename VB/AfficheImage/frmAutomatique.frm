VERSION 5.00
Begin VB.Form frmAutomatique 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Affichage automatique"
   ClientHeight    =   1335
   ClientLeft      =   4995
   ClientTop       =   3735
   ClientWidth     =   3390
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1335
   ScaleWidth      =   3390
   ShowInTaskbar   =   0   'False
   Begin VB.OptionButton optAucun 
      Caption         =   "&Aucun"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Value           =   -1  'True
      Width           =   1215
   End
   Begin VB.TextBox txtDélai 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   960
      TabIndex        =   4
      Text            =   "5"
      Top             =   915
      Width           =   735
   End
   Begin VB.OptionButton optSuivant 
      Caption         =   "&Suivant"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   1215
   End
   Begin VB.OptionButton optAléatoire 
      Caption         =   "Au &hasard"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   1215
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2160
      TabIndex        =   5
      Top             =   120
      Width           =   1095
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2160
      TabIndex        =   6
      Top             =   600
      Width           =   1095
   End
   Begin VB.CheckBox chkOk 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   200
      Left            =   3000
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   1080
      Visible         =   0   'False
      Width           =   200
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Délai (s) :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   195
      TabIndex        =   3
      Top             =   960
      Width           =   870
   End
End
Attribute VB_Name = "frmAutomatique"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnAnnuler_Click()
  Hide
End Sub

Private Sub Form_Load()
  chkOk = 0
  txtDélai.SelStart = 0
  txtDélai.SelLength = 99
End Sub

Private Sub btnOK_Click()
  chkOk = 1
  
  If Not CtrlNumeric(txtDélai, "délai d'affichage automatique", 1, 60) Then
    chkOk = 0
  Else
    Hide
  End If
End Sub

