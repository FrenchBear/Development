VERSION 4.00
Begin VB.Form frmWelcome 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "#"
   ClientHeight    =   3252
   ClientLeft      =   984
   ClientTop       =   4080
   ClientWidth     =   6432
   ClipControls    =   0   'False
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   7.8
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   Height          =   3624
   Icon            =   "WELCOME.frx":0000
   Left            =   936
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3252
   ScaleWidth      =   6432
   Top             =   3756
   Width           =   6528
   Begin VB.CommandButton cmdExit 
      Cancel          =   -1  'True
      Caption         =   "#"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   3588
      TabIndex        =   1
      Top             =   2652
      Width           =   1824
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "#"
      Default         =   -1  'True
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   960
      TabIndex        =   0
      Top             =   2652
      Width           =   1836
   End
   Begin VB.Image imgWelcome 
      Height          =   384
      Left            =   636
      Picture         =   "WELCOME.frx":0442
      Top             =   336
      Width           =   384
   End
   Begin VB.Label lblWelcome 
      AutoSize        =   -1  'True
      Caption         =   "*"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1305
      TabIndex        =   2
      Top             =   330
      Width           =   4800
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblRunning 
      AutoSize        =   -1  'True
      Caption         =   "#"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   435
      TabIndex        =   3
      Top             =   915
      Width           =   5535
      WordWrap        =   -1  'True
   End
   Begin VB.Shape shpWelcome 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   2256
      Left            =   240
      Top             =   132
      Width           =   6012
   End
End
Attribute VB_Name = "frmWelcome"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

Private Sub cmdExit_Click()
    ExitSetup Me, gintRET_EXIT
End Sub

Private Sub cmdOK_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Dim intWidth As Integer

    cmdExit.Caption = ResolveResString(resBTNEXIT)
    cmdOK.Caption = ResolveResString(resBTNOK)
    lblRunning.Caption = ResolveResString(resLBLRUNNING)
    
    Caption = gstrTitle
    intWidth = TextWidth(Caption) + cmdOK.Width * 1
    If intWidth > Width Then
        shpWelcome.Width = shpWelcome.Width * (intWidth / Width)
        Width = intWidth
    End If

    lblWelcome.Caption = ResolveResString(resWELCOME, "|1", gstrAppName)

    shpWelcome.Move (ScaleWidth - shpWelcome.Width) \ 2
    cmdOK.Left = (ScaleWidth - cmdOK.Width * 1.5 - cmdExit.Width) \ 2
    cmdExit.Left = cmdOK.Left + cmdOK.Width * 1.5

    EtchedLine Me, shpWelcome.Left - 50, cmdOK.Top - cmdOK.Height \ 2, shpWelcome.Width + 100

    CenterForm Me
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode <> 1 Then
        ExitSetup Me, gintRET_EXIT
        Cancel = 1
    End If
End Sub
