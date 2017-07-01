VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Bob's Matrix"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   Icon            =   "Options.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Slider Slider1 
      Height          =   495
      Left            =   1920
      TabIndex        =   5
      Top             =   600
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   873
      _Version        =   393216
      Min             =   1
      Max             =   500
      SelStart        =   1
      TickFrequency   =   50
      Value           =   1
   End
   Begin VB.CommandButton Command3 
      Caption         =   "A propos..."
      Height          =   375
      Left            =   3240
      TabIndex        =   4
      Top             =   2520
      Width           =   1095
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Son"
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   600
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Intro"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   360
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Annuler"
      Height          =   375
      Left            =   2040
      TabIndex        =   1
      Top             =   2520
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   2520
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Vitesse"
      Height          =   255
      Left            =   2040
      TabIndex        =   6
      Top             =   360
      Width           =   1095
   End
End
Attribute VB_Name = "FOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    
    WritePrivateProfileString "Options", "Intro", Check1.Value, App.Path & "\Matrix.ini"
    WritePrivateProfileString "Options", "Son", Check2.Value, App.Path & "\Matrix.ini"
    WritePrivateProfileString "Options", "Vitesse", Slider1.Value, App.Path & "\Matrix.ini"
    End
    
End Sub

Private Sub Command2_Click()
    
    End
    
End Sub

Private Sub Command3_Click()
    
    FAbout.Show
    
End Sub

Private Sub Form_Load()
    
    FOptions.Icon = FMatrix.Icon
    Check1.Value = GetPrivateProfileInt("Options", "Intro", 1, App.Path & "\Matrix.ini")
    Check2.Value = GetPrivateProfileInt("Options", "Son", 1, App.Path & "\Matrix.ini")
    Slider1.Value = GetPrivateProfileInt("Options", "Vitesse", 50, App.Path & "\Matrix.ini")
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    
    End
    
End Sub

