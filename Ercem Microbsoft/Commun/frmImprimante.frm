VERSION 5.00
Begin VB.Form frmImprimante 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Imprimante"
   ClientHeight    =   7215
   ClientLeft      =   1125
   ClientTop       =   1500
   ClientWidth     =   6390
   Icon            =   "frmImprimante.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   298.864
   ScaleMode       =   0  'User
   ScaleWidth      =   212.494
End
Attribute VB_Name = "frmImprimante"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmImprimante
' Support g�n�ral � un aper�u avant impression artisanal
' Sert plus � la mise au point des programmes qu� une utilisation r�elle !
' 22/09/1999 PV CallBack / PrintReport

Option Explicit

Public CallBack As Form       ' Feuille fournissant le support d'impression (PrintReport)
Public iTypeEtat As Integer   ' Param�tre � CallBack.PrintReport

Private Sub Form_Click()
  Unload Me
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Unload Me
End Sub


' Impression requise
Public Sub PrintReport()
  On Error Resume Next
  CallBack.PrintReport iTypeEtat
  Unload Me
End Sub
