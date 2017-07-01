VERSION 5.00
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
   Begin VB.CommandButton Command3 
      Caption         =   "Affiche Form2"
      Height          =   495
      Left            =   2820
      TabIndex        =   2
      Top             =   1380
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel Always on top"
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   2220
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Always on top"
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   1380
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
   Dim lR As Long
   lR = SetTopMostWindow(Form1.hwnd, True)
End Sub

Private Sub Command2_Click()
   Dim lR As Long
   lR = SetTopMostWindow(Form1.hwnd, False)
End Sub


Private Sub Command3_Click()
    Form2.Show      'display the child form
    Form1.Caption = "Parent"
    Form2.Caption = "Child"
End Sub

