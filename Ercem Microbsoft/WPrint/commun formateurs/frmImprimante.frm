VERSION 5.00
Begin VB.Form frmImprimante 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Imprimante"
   ClientHeight    =   6045
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   8565
   Icon            =   "frmImprimante.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   250.4
   ScaleMode       =   0  'User
   ScaleWidth      =   284.822
End
Attribute VB_Name = "frmImprimante"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Click()
  Unload Me
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Unload Me
End Sub

