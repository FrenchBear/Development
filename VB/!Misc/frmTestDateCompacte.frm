VERSION 4.00
Begin VB.Form frmTestDateCompacte 
   Caption         =   "Test de la fonction DateCompacte"
   ClientHeight    =   5880
   ClientLeft      =   1125
   ClientTop       =   1545
   ClientWidth     =   5835
   Height          =   6285
   Left            =   1065
   LinkTopic       =   "Form1"
   ScaleHeight     =   5880
   ScaleWidth      =   5835
   Top             =   1200
   Width           =   5955
   Begin VB.CommandButton btnTest 
      Caption         =   "&Test"
      Default         =   -1  'True
      Height          =   495
      Left            =   3960
      TabIndex        =   0
      Top             =   480
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestDateCompacte"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub btnTest_Click()
  Dim d
  d = InputBox("Entrez une date:")
  DateCompacte d
  If IsDate(d) Then
    Print Format(d, "dddd dd mmmm yyyy")
  Else
    Print d; " n'est pas une date..."
  End If
End Sub

