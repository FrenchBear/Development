VERSION 4.00
Begin VB.Form FormChoixRepertoire 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Choisissez un répertoire"
   ClientHeight    =   4305
   ClientLeft      =   165
   ClientTop       =   1695
   ClientWidth     =   5220
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
   Height          =   4710
   HelpContextID   =   87
   Left            =   105
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4305
   ScaleWidth      =   5220
   Top             =   1350
   Width           =   5340
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   3780
      TabIndex        =   6
      Top             =   1305
      Width           =   1320
   End
   Begin VB.CommandButton btnAnnule 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   3780
      TabIndex        =   4
      Top             =   765
      Width           =   1320
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   3780
      TabIndex        =   3
      Top             =   150
      Width           =   1320
   End
   Begin VB.DirListBox Dir1 
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   2505
      Left            =   150
      TabIndex        =   1
      Top             =   1635
      Width           =   3450
   End
   Begin VB.DriveListBox Drive1 
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   150
      TabIndex        =   0
      Top             =   1245
      Width           =   3435
   End
   Begin VB.Label lblRepertoireChoisi 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   135
      TabIndex        =   5
      Top             =   960
      Width           =   3510
   End
   Begin VB.Label lbltexte 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Choisissez un répertoire..."
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   705
      Left            =   135
      TabIndex        =   2
      Top             =   150
      Width           =   3465
   End
End
Attribute VB_Name = "FormChoixRepertoire"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'aide en ligne
Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub



Private Sub btnAnnule_Click()
    'abandon par l'opérateur
    lblRepertoireChoisi.Caption = ""
    Hide
End Sub

Private Sub btnOk_Click()
    'répertoire choisi
    Hide
End Sub

Private Sub Dir1_Change()
    'nouveau répertoire
    lblRepertoireChoisi.Caption = dir1.List(dir1.ListIndex)
End Sub

'nouvelle unité disque
Private Sub Drive1_Change()
Dim d As String
    HourGlass "show"
    On Error Resume Next
    d = dir1.path
    dir1.path = drive1.drive
    If Err Then
        'l'unité n'est pas disponible
        ErreurUserBox UCase$(drive1.drive) & " " & Error$, MB_ICONSTOP
        drive1.drive = d
    End If
    HourGlass "hide"
End Sub

Private Sub Form_Load()
    CenterInScreen Me
End Sub

