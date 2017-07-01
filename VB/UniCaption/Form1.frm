VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3015
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3015
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    ' some hiragana (you need Japanese fonts installed to see them)
    SetCaptionW hWnd, ChrW$(&H3042) & ChrW$(&H3044) & ChrW$(&H3046) & ChrW$(&H3048) & ChrW$(&H304A) & " ovat japanilaisia hiragana-merkkej."
End Sub
