VERSION 4.00
Begin VB.Form StatusDlg 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "StatusDlg"
   ClientHeight    =   2640
   ClientLeft      =   1680
   ClientTop       =   3150
   ClientWidth     =   6600
   ControlBox      =   0   'False
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   1
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   3045
   Left            =   1620
   LinkMode        =   1  'Source
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2640
   ScaleWidth      =   6600
   Top             =   2805
   Width           =   6720
   Begin VB.CommandButton btnAnnuler 
      Caption         =   "Annuler"
      Height          =   435
      Left            =   2520
      TabIndex        =   5
      Top             =   2700
      Width           =   1380
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   180
      ScaleHeight     =   225
      ScaleWidth      =   6165
      TabIndex        =   1
      Top             =   2220
      Width           =   6200
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   135
      ScaleHeight     =   255
      ScaleWidth      =   4455
      TabIndex        =   0
      Top             =   3795
      Width           =   4455
   End
   Begin VB.Label Label4 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   " "
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   450
      Left            =   180
      TabIndex        =   7
      Top             =   1500
      Width           =   6195
   End
   Begin VB.Label Label3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   " "
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   450
      Left            =   180
      TabIndex        =   6
      Top             =   1020
      Width           =   6195
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   " "
      ForeColor       =   &H00000000&
      Height          =   450
      Left            =   180
      TabIndex        =   2
      Top             =   60
      Width           =   6195
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   " "
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   450
      Left            =   180
      TabIndex        =   3
      Top             =   540
      Width           =   6195
   End
   Begin VB.Label total 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Total"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   135
      TabIndex        =   4
      Top             =   3315
      Visible         =   0   'False
      Width           =   855
   End
End
Attribute VB_Name = "StatusDlg"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()

End Sub

Private Sub btnAnnuler_Click()
    ProgressionAnnulée = True
End Sub

