VERSION 5.00
Begin VB.Form About 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "True DBGrid Pro 6.0 (OLE DB)"
   ClientHeight    =   2115
   ClientLeft      =   2175
   ClientTop       =   2055
   ClientWidth     =   4470
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "ABOUT.frx":0000
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2115
   ScaleWidth      =   4470
   Begin VB.CommandButton OK 
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   435
      Left            =   1770
      TabIndex        =   2
      Top             =   915
      Width           =   915
   End
   Begin VB.Image Image1 
      Appearance      =   0  'Flat
      Height          =   480
      Left            =   240
      Picture         =   "ABOUT.frx":0742
      Top             =   840
      Width           =   480
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Copyright ©1995-1998 APEX Software Corporation.  All rights reserved."
      Height          =   435
      Left            =   480
      TabIndex        =   3
      Top             =   1500
      Width           =   3495
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "APEX Software Corporation"
      Height          =   255
      Left            =   960
      TabIndex        =   1
      Top             =   585
      Width           =   2535
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "General Ledger Sample"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   900
      TabIndex        =   0
      Top             =   225
      Width           =   2655
   End
End
Attribute VB_Name = "About"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ---------------------------------------------------------
'       Copyright ©1995-1998 APEX Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True DBGrid Pro 6 sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that APEX Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------

Private Sub CenterForm(F As Form)
    ' Center the specified form within the screen
    F.Move (Screen.Width - F.Width) \ 2, (Screen.Height - F.Height) \ 2
End Sub

Private Sub Form_Load()
    'Centers the Form on the Screen
    CenterForm About
End Sub

Private Sub OK_Click()
    'Unloads the About Box
    Unload About
End Sub

