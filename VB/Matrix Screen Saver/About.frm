VERSION 5.00
Begin VB.Form FAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "A propos..."
   ClientHeight    =   3015
   ClientLeft      =   1290
   ClientTop       =   1680
   ClientWidth     =   6390
   Icon            =   "About.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3015
   ScaleWidth      =   6390
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      Height          =   540
      Left            =   1440
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   4
      ToolTipText     =   "C'est la photo de ma carte d'identité..."
      Top             =   315
      Width           =   540
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   4920
      TabIndex        =   3
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   $"About.frx":000C
      Height          =   1455
      Left            =   240
      TabIndex        =   2
      ToolTipText     =   "Ceci est un Not (licence Micro$oft)"
      Top             =   1440
      Width           =   4215
   End
   Begin VB.Label Label2 
      Caption         =   "NoCopyright 2003 Bob's Software"
      Height          =   255
      Left            =   2400
      TabIndex        =   1
      Top             =   690
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "Bob's Matrix v1.0"
      Height          =   255
      Left            =   2400
      TabIndex        =   0
      Top             =   300
      Width           =   1215
   End
End
Attribute VB_Name = "FAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    
    Unload Me
    
End Sub

Private Sub Form_Load()
    
    Picture1.Picture = FMatrix.Icon
    Beep
    
End Sub
