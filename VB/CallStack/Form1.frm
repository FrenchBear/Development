VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Push Me!"
   ClientHeight    =   1845
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4095
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1845
   ScaleWidth      =   4095
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdLoadedSymbols 
      Caption         =   "View Loaded Symbols"
      Height          =   735
      Left            =   240
      TabIndex        =   1
      Top             =   960
      Width           =   3615
   End
   Begin VB.CommandButton cmdWalkStack 
      Caption         =   "WalkStack"
      Height          =   735
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   3615
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub SubCall1()
    SubCall2
End Sub

Public Sub SubCall2()
    FuncCall1
End Sub

Private Function FuncCall1() As Long
    FuncCall2
End Function

Private Function FuncCall2() As Long
    MsgBox m_oSymbols.GetCallStack(), vbInformation, App.Title & " - Call Stack"
End Function

Private Sub cmdLoadedSymbols_Click()
    MsgBox m_oSymbols.WalkLoadedSymbols(True)
End Sub

Private Sub cmdWalkStack_Click()
    SubCall1
End Sub
