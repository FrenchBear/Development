VERSION 5.00
Object = "{C1A8AF28-1257-101B-8FB0-0020AF039CA3}#1.1#0"; "MCI32.OCX"
Begin VB.Form frmEssaiMCI 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1620
      TabIndex        =   1
      Top             =   600
      Width           =   1215
   End
   Begin MCI.MMControl MMControl1 
      Height          =   495
      Left            =   780
      TabIndex        =   0
      Top             =   2280
      Width           =   2760
      _ExtentX        =   4868
      _ExtentY        =   873
      _Version        =   327681
      PlayEnabled     =   -1  'True
      PauseEnabled    =   -1  'True
      StopEnabled     =   -1  'True
      RecordVisible   =   0   'False
      EjectVisible    =   0   'False
      DeviceType      =   "WaveAudio"
      FileName        =   "G:\Multimédia\WAV\Bond.wav"
   End
End
Attribute VB_Name = "frmEssaiMCI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Essai de pilotage MCI
' 16/04/1998 PV

Option Explicit

Private Sub Command1_Click()
  MMControl1.Command = "Prev"
  MMControl1.Command = "Play"
End Sub

Private Sub Form_Load()
' Définit les propriétés nécessaires à l'ouverture du périphérique MCI.
  MMControl1.Notify = False
  MMControl1.Wait = True
  MMControl1.Shareable = False
'  MMControl1.DeviceType = "WaveAudio"
'  MMControl1.filename = "C:\WINDOWS\MMDATA\GONG.WAV"

  ' Ouvre le périphérique MCI WaveAudio.
  MMControl1.Command = "Open"
End Sub

Private Sub Form_Unload(Cancel As Integer)
  MMControl1.Command = "Close"
End Sub


