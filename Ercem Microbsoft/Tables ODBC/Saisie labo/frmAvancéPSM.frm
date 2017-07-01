VERSION 5.00
Begin VB.Form frmBalances 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Liste des balances"
   ClientHeight    =   3345
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6210
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAvancéPSM.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3345
   ScaleWidth      =   6210
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnValider 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   4680
      TabIndex        =   3
      Top             =   120
      Width           =   1455
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   4680
      TabIndex        =   2
      Top             =   600
      Width           =   1455
   End
   Begin VB.Frame fraBalance 
      Caption         =   "N° de balance / Dilumat"
      Height          =   3195
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4455
      Begin VB.OptionButton optBalance 
         Caption         =   "LM.LRO.44"
         Height          =   195
         Index           =   12
         Left            =   120
         TabIndex        =   18
         Top             =   2340
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM.LRO.45"
         Height          =   195
         Index           =   11
         Left            =   2280
         TabIndex        =   17
         Top             =   2340
         Width           =   2055
      End
      Begin VB.TextBox txtAutre 
         Height          =   315
         Left            =   1200
         MaxLength       =   20
         TabIndex        =   14
         Top             =   2760
         Width           =   1155
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM522"
         Height          =   195
         Index           =   10
         Left            =   2280
         TabIndex        =   13
         Top             =   1800
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM341"
         Height          =   195
         Index           =   9
         Left            =   2280
         TabIndex        =   12
         Top             =   1500
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM427"
         Height          =   195
         Index           =   8
         Left            =   2280
         TabIndex        =   11
         Top             =   1200
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM413"
         Height          =   195
         Index           =   7
         Left            =   2280
         TabIndex        =   10
         Top             =   900
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM9767"
         Height          =   195
         Index           =   6
         Left            =   2280
         TabIndex        =   9
         Top             =   600
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM9717"
         Height          =   195
         Index           =   5
         Left            =   120
         TabIndex        =   8
         Top             =   1800
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM9718"
         Height          =   195
         Index           =   4
         Left            =   120
         TabIndex        =   7
         Top             =   1500
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM9772"
         Height          =   195
         Index           =   3
         Left            =   120
         TabIndex        =   6
         Top             =   1200
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM9716"
         Height          =   195
         Index           =   2
         Left            =   120
         TabIndex        =   5
         Top             =   900
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "LM339"
         Height          =   195
         Index           =   1
         Left            =   120
         TabIndex        =   4
         Top             =   600
         Width           =   2055
      End
      Begin VB.OptionButton optBalance 
         Caption         =   "&Autre :"
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   1
         Top             =   2820
         Width           =   1035
      End
      Begin VB.Label Label2 
         Caption         =   "La Rochelle :"
         Height          =   195
         Left            =   120
         TabIndex        =   16
         Top             =   2100
         Width           =   1455
      End
      Begin VB.Label Label1 
         Caption         =   "Fontaine :"
         Height          =   195
         Left            =   120
         TabIndex        =   15
         Top             =   300
         Width           =   1455
      End
   End
End
Attribute VB_Name = "frmBalances"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmBalances
' Attributs avancés de l'événement H1, Fin de PSM
'  2/05/1998 PV

Option Explicit

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnValider_Click()
  If optBalance(0) Then
    frmEvénement.txtInfo(1) = txtAutre
  Else
    Dim o As OptionButton
    For Each o In optBalance
      If o.Value Then
        frmEvénement.txtInfo(1) = o.Caption
        Exit For
      End If
    Next
  End If
  Unload Me
End Sub

Private Sub Form_Load()
  Dim o As OptionButton
  For Each o In optBalance
    If o.Caption = UCase(frmEvénement.txtInfo(1)) Then
      o.Value = True
      txtAutre.Enabled = False
      Exit Sub
    End If
  Next
  
  optBalance(0).Value = True
  txtAutre.Enabled = True
  txtAutre.Text = frmEvénement.txtInfo(1)
End Sub

Private Sub optBalance_Click(Index As Integer)
  txtAutre.Enabled = (Index = 0)
End Sub

Private Sub optBalance_DblClick(Index As Integer)
  btnValider_Click
End Sub

Private Sub txtAutre_GotFocus()
  AutoSelect txtAutre
End Sub
