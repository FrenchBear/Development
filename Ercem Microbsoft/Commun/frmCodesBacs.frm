VERSION 5.00
Begin VB.Form frmCodesBacs 
   Caption         =   "Codes bac pour l'imprimante [Win]"
   ClientHeight    =   6840
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9465
   Icon            =   "frmCodesBacs.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmCodesBacs.frx":0442
   ScaleHeight     =   6840
   ScaleWidth      =   9465
   StartUpPosition =   2  'CenterScreen
End
Attribute VB_Name = "frmCodesBacs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCodesBac
' Affichage express des codes bac

Option Explicit

Private Sub Form_Click()
  Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If KeyAscii = 13 Or KeyAscii = 27 Then Unload Me
End Sub
