VERSION 5.00
Begin VB.Form frmTest 
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
      Left            =   2880
      TabIndex        =   0
      Top             =   1260
      Width           =   1215
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  Dim o
  Set o = CreateObject("OSL.AccesIni")
  Print o.GetProfileString("win.ini", "Desktop", "Wallpaper", "??")
  
  Dim p As New OSL.SocketInfo
  Print p.sAdresseIP
  Print p.sHostName
End Sub
