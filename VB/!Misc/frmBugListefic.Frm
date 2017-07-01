VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   9855
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6645
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   9855
   ScaleWidth      =   6645
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   210
      TabIndex        =   2
      Top             =   105
      Width           =   2955
   End
   Begin VB.FileListBox File1 
      Height          =   4965
      Left            =   3360
      TabIndex        =   1
      Top             =   525
      Width           =   3060
   End
   Begin VB.DirListBox Dir1 
      Height          =   5205
      Left            =   210
      TabIndex        =   0
      Top             =   525
      Width           =   2955
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Dir1_Change()
  File1.Path = Dir1.Path
End Sub

Private Sub Drive1_Change()
  Dir1.Path = Drive1.Drive
End Sub
