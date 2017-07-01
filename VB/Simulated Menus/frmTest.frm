VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2436
   ClientLeft      =   132
   ClientTop       =   480
   ClientWidth     =   3744
   LinkTopic       =   "Form1"
   ScaleHeight     =   2436
   ScaleWidth      =   3744
   StartUpPosition =   3  'Windows Default
   Begin SimulatedMenus.SimulatedMenuResultat SM 
      Align           =   1  'Align Top
      Height          =   240
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   3744
      _ExtentX        =   6604
      _ExtentY        =   423
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   372
      Left            =   1380
      TabIndex        =   0
      Top             =   1020
      Width           =   972
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub Command1_Click()
    MsgBox "Hello"
End Sub

