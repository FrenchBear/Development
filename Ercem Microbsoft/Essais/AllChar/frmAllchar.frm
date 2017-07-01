VERSION 5.00
Begin VB.Form frmAllchar 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   Caption         =   "All char"
   ClientHeight    =   6285
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7620
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   12
      Charset         =   238
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   26.188
   ScaleMode       =   4  'Character
   ScaleWidth      =   63.5
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmAllchar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Click()
  Dim i As Integer, j As Integer
  For i = 0 To 15
    For j = 0 To 15
      CurrentX = 2.4 * j
      CurrentY = 1.1 * i
      Print Chr(16 * i + j);
    Next
  Next
  
End Sub
