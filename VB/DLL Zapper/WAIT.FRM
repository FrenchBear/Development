VERSION 5.00
Begin VB.Form frmWait 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1515
   ClientLeft      =   2670
   ClientTop       =   3210
   ClientWidth     =   3630
   ClipControls    =   0   'False
   ControlBox      =   0   'False
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
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   101
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   242
   Begin VB.Shape Shape2 
      BackColor       =   &H00808080&
      BorderColor     =   &H00404040&
      Height          =   330
      Left            =   375
      Top             =   975
      Width           =   2895
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00E0E0E0&
      Height          =   330
      Left            =   360
      Top             =   960
      Width           =   2895
   End
   Begin VB.Label lblStatus 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "lblStatus"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   1020
      Width           =   2895
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "This could take a little while ... Please be patient !"
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   2895
   End
End
Attribute VB_Name = "frmWait"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    DoEvents
    'Position the form
    Me.Left = frmMain.Left + ((frmMain.Width - Me.Width) \ 2)
    Me.Top = frmMain.Top + ((frmMain.Height - Me.Height) \ 2)
    Me.Show
    Me.Refresh
    WaitLoaded = True ' Set the flag to indicate the form is loaded
End Sub

Private Sub Form_Unload(Cancel As Integer)
    WaitLoaded = False  ' Reset the flag - just in case
End Sub

