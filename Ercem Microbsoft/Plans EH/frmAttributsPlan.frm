VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAttributsPlan 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Attributs du plan"
   ClientHeight    =   2280
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7410
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAttributsPlan.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2280
   ScaleWidth      =   7410
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtPortrait 
      Height          =   315
      Left            =   1680
      TabIndex        =   9
      Top             =   1560
      Width           =   315
   End
   Begin VB.TextBox txtFichier 
      Height          =   315
      Left            =   1680
      TabIndex        =   7
      Top             =   1200
      Width           =   4215
   End
   Begin VB.CommandButton btnOuvrir 
      Caption         =   "&Ouvrir"
      Default         =   -1  'True
      Height          =   375
      Left            =   6240
      TabIndex        =   10
      Top             =   60
      Width           =   1095
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   6240
      TabIndex        =   11
      Top             =   540
      Width           =   1095
   End
   Begin VB.TextBox txtComment 
      Height          =   315
      Left            =   1680
      TabIndex        =   5
      Top             =   840
      Width           =   4215
   End
   Begin VB.TextBox txtTitre 
      Height          =   315
      Left            =   1680
      TabIndex        =   3
      Top             =   480
      Width           =   4215
   End
   Begin VB.TextBox txtPlan 
      Height          =   315
      Left            =   1680
      MaxLength       =   4
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   12
      Top             =   1965
      Width           =   7410
      _ExtentX        =   13070
      _ExtentY        =   556
      Style           =   1
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Portrait :"
      Height          =   210
      Left            =   120
      TabIndex        =   8
      Top             =   1620
      Width           =   840
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Fichier :"
      Height          =   210
      Left            =   120
      TabIndex        =   6
      Top             =   1260
      Width           =   735
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Commentaires :"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   900
      Width           =   1500
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   540
      Width           =   555
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Plan :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   540
   End
End
Attribute VB_Name = "frmAttributsPlan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmAttributsPlan
' Feuille d'édition des infos d'un plan
' 26/04/1998 PV

Option Explicit

Private pPlanLocal As Plan
Private bOk As Boolean

Public Function bModifierPlan(pPlan As Plan) As Boolean
  Set pPlanLocal = pPlan.Copie
  bOk = False
  Show vbModal
  If bOk Then Set pPlan = pPlanLocal
  Set pPlanLocal = Nothing
  bModifierPlan = bOk
End Function

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnOuvrir_Click()
  If txtPlan = "" Then
    MsgBox "Le code du plan est obligatoire", vbExclamation, sNomApp
    txtPlan.SetFocus
    Exit Sub
  End If
  
  If txtFichier = "" Then
    MsgBox "Le code du plan est obligatoire", vbExclamation, sNomApp
    txtPlan.SetFocus
    Exit Sub
  End If
  
  pPlanLocal.pla_plan = txtPlan
  pPlanLocal.pla_titre = txtTitre
  pPlanLocal.pla_comment = txtComment
  pPlanLocal.pla_fichier = txtFichier
  pPlanLocal.pla_portrait = txtPortrait
  
  bOk = True
  Unload Me
End Sub

Private Sub Form_Load()
  txtPlan = pPlanLocal.pla_plan
  txtTitre = pPlanLocal.pla_titre
  txtComment = pPlanLocal.pla_comment
  txtFichier = pPlanLocal.pla_fichier
  txtPortrait = pPlanLocal.pla_portrait
  
  If txtPlan <> "" Then
    txtPlan.BackColor = &H8000000F
    txtPlan.Locked = True
    txtPlan.TabStop = False
  End If
  
  If txtFichier <> "" Then
    txtFichier.BackColor = &H8000000F
    txtFichier.Locked = True
    txtFichier.TabStop = False
  End If
End Sub
