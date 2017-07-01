VERSION 5.00
Object = "{024ABD64-A417-11D0-B1CD-0020AFF7C1C5}#2.0#0"; "printer5.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin Printer5.ctlPrinter p5 
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   615
      _extentx        =   1085
      _extenty        =   873
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1920
      TabIndex        =   0
      Top             =   480
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  p5.InitDoc
  p5.Trait 100, 100, 500, 500
  p5.Rond 200, 200, 100
  p5.EndDoc
End Sub
