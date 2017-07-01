VERSION 5.00
Begin VB.Form frmValidationRelecture 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Validation de la relecture"
   ClientHeight    =   6510
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10200
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6510
   ScaleWidth      =   10200
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Message ""A corriger"""
      Height          =   495
      Left            =   1500
      TabIndex        =   13
      Top             =   5880
      Width           =   1215
   End
   Begin VB.CommandButton btnEnvoi 
      Caption         =   "Envoi"
      Height          =   495
      Left            =   120
      TabIndex        =   11
      Top             =   5880
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      Height          =   4035
      Left            =   120
      ScaleHeight     =   3975
      ScaleWidth      =   9915
      TabIndex        =   5
      Top             =   1680
      Width           =   9975
      Begin VB.CheckBox chkACorriger 
         Caption         =   "Check1"
         Height          =   255
         Index           =   0
         Left            =   8880
         TabIndex        =   12
         Top             =   360
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.VScrollBar VScroll1 
         Height          =   3975
         Left            =   9660
         TabIndex        =   10
         Top             =   0
         Width           =   255
      End
      Begin VB.CheckBox chkOk 
         Caption         =   "Check1"
         Height          =   255
         Index           =   0
         Left            =   8160
         TabIndex        =   9
         Top             =   360
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.Label lblEH 
         Caption         =   "Eh machin"
         Height          =   255
         Index           =   0
         Left            =   5580
         TabIndex        =   14
         Top             =   360
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         Caption         =   "A corriger"
         Height          =   255
         Left            =   8580
         TabIndex        =   8
         Top             =   60
         Width           =   975
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         Caption         =   "Ok"
         Height          =   255
         Left            =   8040
         TabIndex        =   7
         Top             =   60
         Width           =   495
      End
      Begin VB.Label lblDocument 
         Caption         =   "Document XX"
         Height          =   255
         Index           =   0
         Left            =   180
         TabIndex        =   6
         Top             =   360
         Visible         =   0   'False
         Width           =   5295
      End
   End
   Begin VB.ComboBox Combo2 
      Height          =   330
      Left            =   2880
      TabIndex        =   3
      Text            =   "Vendredi 19/09/1997"
      Top             =   660
      Width           =   3855
   End
   Begin VB.ComboBox Combo1 
      Height          =   330
      Left            =   2880
      TabIndex        =   1
      Text            =   "Bernard LIGNON"
      Top             =   240
      Width           =   3855
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Documents en attente de validation :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   1320
      Width           =   3630
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&Relecture de la tournée du :"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   2655
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Assistant :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   300
      Width           =   1005
   End
End
Attribute VB_Name = "frmValidationRelecture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim iDoc As Integer

Const a = 150
Const b = 250

Sub Document(sRef, sEtb, sEH)
  iDoc = iDoc + 1
  Load lblDocument(iDoc)
  Load lblEH(iDoc)
  Load chkOk(iDoc)
  Load chkACorriger(iDoc)
  
  lblDocument(iDoc) = sRef & " " & sEtb
  lblEH(iDoc) = sEH
  
  lblDocument(iDoc).Top = a + b * iDoc
  lblEH(iDoc).Top = a + b * iDoc
  chkOk(iDoc).Top = a + b * iDoc
  chkACorriger(iDoc).Top = a + b * iDoc

  lblDocument(iDoc).Visible = True
  lblEH(iDoc).Visible = True
  chkOk(iDoc).Visible = True
  chkACorriger(iDoc).Visible = True
End Sub

Private Sub Form_Load()
  Document "GS136374", "PAR RESTAURANT SCOLAIRE DE CHAZAY", "1/0 AUDIT RESTAURANT"
  Document "GS165362", "AUT.C SOFIREST EXPANSION CAFETERIA ST", "7/1 AUDIT AUTOROUTE"
  Document "GS165405", "WIN.FRA CAFETERIA WINCH MELODINE FRANC", "1/0 AUDIT RESTAURANT"
  Document "GS168060", "FLU FLUNCH LYON LIMONEST", "673/1 AUDIT FLUNCH"
  Document "GS168063", "SOG LE PAISY DARDILLY -8301-", "604/1  AUDIT RESTAURANT SOGERES"
End Sub
