VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   1950
   ClientTop       =   1680
   ClientWidth     =   6675
   Height          =   3495
   Left            =   1890
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   6675
   Top             =   1335
   Width           =   6795
   Begin VB.CommandButton btnMacro 
      Caption         =   "à"
      BeginProperty Font 
         name            =   "Wingdings"
         charset         =   2
         weight          =   700
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Index           =   3
      Left            =   6090
      TabIndex        =   17
      Top             =   1470
      Width           =   435
   End
   Begin VB.TextBox txtMacro 
      Height          =   330
      Index           =   3
      Left            =   2520
      TabIndex        =   16
      Top             =   1470
      Width           =   3480
   End
   Begin VB.CommandButton btnMacro 
      Caption         =   "à"
      BeginProperty Font 
         name            =   "Wingdings"
         charset         =   2
         weight          =   700
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Index           =   2
      Left            =   6090
      TabIndex        =   15
      Top             =   1050
      Width           =   435
   End
   Begin VB.TextBox txtMacro 
      Height          =   330
      Index           =   2
      Left            =   2520
      TabIndex        =   14
      Top             =   1050
      Width           =   3480
   End
   Begin VB.CommandButton btnMacro 
      Caption         =   "à"
      BeginProperty Font 
         name            =   "Wingdings"
         charset         =   2
         weight          =   700
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Index           =   1
      Left            =   6090
      TabIndex        =   13
      Top             =   630
      Width           =   435
   End
   Begin VB.TextBox txtMacro 
      Height          =   330
      Index           =   1
      Left            =   2520
      TabIndex        =   12
      Top             =   630
      Width           =   3480
   End
   Begin VB.CommandButton btnMacro 
      Caption         =   "à"
      BeginProperty Font 
         name            =   "Wingdings"
         charset         =   2
         weight          =   700
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Index           =   0
      Left            =   6090
      TabIndex        =   11
      Top             =   210
      Width           =   435
   End
   Begin VB.TextBox txtMacro 
      Height          =   330
      Index           =   0
      Left            =   2520
      TabIndex        =   10
      Top             =   210
      Width           =   3480
   End
   Begin VB.Frame Frame1 
      Caption         =   "Equipement alimenté"
      Height          =   1170
      Left            =   210
      TabIndex        =   5
      Top             =   1155
      Width           =   1905
      Begin VB.TextBox txtSRS 
         Height          =   330
         Left            =   945
         MaxLength       =   3
         TabIndex        =   9
         Top             =   735
         Width           =   855
      End
      Begin VB.OptionButton optSRS 
         Caption         =   "SRS/"
         Height          =   330
         Left            =   210
         TabIndex        =   8
         Top             =   735
         Width           =   855
      End
      Begin VB.TextBox txtSRP 
         BackColor       =   &H80000004&
         Enabled         =   0   'False
         Height          =   330
         Left            =   945
         TabIndex        =   7
         Top             =   315
         Width           =   855
      End
      Begin VB.OptionButton optSRP 
         Caption         =   "SRP/"
         Height          =   330
         Left            =   210
         TabIndex        =   6
         Top             =   315
         Width           =   750
      End
   End
   Begin VB.TextBox txtZone 
      Height          =   330
      Left            =   1050
      MaxLength       =   3
      TabIndex        =   3
      Top             =   630
      Width           =   855
   End
   Begin VB.CommandButton cmdTransfert 
      Caption         =   "Transfert"
      Height          =   435
      Left            =   210
      TabIndex        =   2
      Top             =   2520
      Width           =   1905
   End
   Begin VB.TextBox txtCentral 
      Height          =   330
      Left            =   1050
      MaxLength       =   3
      TabIndex        =   0
      Top             =   210
      Width           =   855
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Zone :"
      Height          =   195
      Left            =   315
      TabIndex        =   4
      Top             =   735
      Width           =   465
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Central :"
      Height          =   195
      Left            =   315
      TabIndex        =   1
      Top             =   315
      Width           =   585
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub btnMacro_Click(Index As Integer)
  AppActivate "Sans titre - Bloc-notes"
  SendKeys txtMacro(Index)
End Sub

Private Sub cmdTransfert_Click()
  AppActivate "Sans titre - Bloc-notes"
  SendKeys "3{Enter}" & UCase(txtCentral) & "{Enter}" & UCase(txtZone) & "{Enter}"
  If optSRP = True Then
    SendKeys "SRP/" & UCase(txtZone) & "{Enter}"
  Else
    SendKeys "SRS/" & UCase(txtSRS) & "{Enter}"
  End If
End Sub


Private Sub txtZone_Change()
  txtSRP = txtZone
End Sub
