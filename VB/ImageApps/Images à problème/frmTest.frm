VERSION 5.00
Begin VB.Form frmTest 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Test images"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnTest 
      Caption         =   "&Test"
      Height          =   375
      Left            =   3000
      TabIndex        =   0
      Top             =   60
      Width           =   1635
   End
   Begin VB.Image Image1 
      Height          =   2475
      Left            =   60
      Top             =   60
      Width           =   2835
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTest
' Teste des images à problème
' 9/5/99 PV


Option Explicit

Private Sub btnTest_Click()

End Sub
