VERSION 5.00
Begin VB.Form frmAbout 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Form1"
   ClientHeight    =   3000
   ClientLeft      =   2340
   ClientTop       =   2520
   ClientWidth     =   5145
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   200
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   343
   Begin VB.CommandButton cmdOk 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   495
      Left            =   2520
      TabIndex        =   4
      Top             =   2400
      Width           =   1215
   End
   Begin VB.PictureBox picIcon 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      ScaleHeight     =   225
      ScaleWidth      =   345
      TabIndex        =   0
      Top             =   120
      Width           =   375
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00FFFFFF&
      X1              =   96
      X2              =   328
      Y1              =   57
      Y2              =   57
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00404040&
      X1              =   96
      X2              =   328
      Y1              =   56
      Y2              =   56
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Thanks Chris, Dave, Dennis, Don, Erick and Robert"
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   1380
      TabIndex        =   6
      Top             =   960
      Width           =   3615
   End
   Begin VB.Label labVersion 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Label4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   2520
      Width           =   1335
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "And you REALLY thought I wuldn't have an about box, huh ?"
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   1440
      TabIndex        =   3
      Top             =   1560
      Width           =   3495
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Coded by Simon Bernstein"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1440
      TabIndex        =   2
      Top             =   480
      Width           =   3495
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ZapDLL - The duplicate DLL destroyer"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1440
      TabIndex        =   1
      Top             =   120
      Width           =   3495
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
' Semi-generic about box

Private Sub cmdOk_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    ' Position the about form
    Me.Left = (frmMain.Width - Me.Width) \ 2 + frmMain.Left
    Me.Top = ((frmMain.Height - Me.Height) \ 2) + frmMain.Top

    'Insert the caption
    Me.Caption = "About " & frmMain.Caption

    'Drop in the icon
    picIcon = frmMain.Icon

    'Insert the version
    labVersion = "Version " & EXEversion
End Sub

