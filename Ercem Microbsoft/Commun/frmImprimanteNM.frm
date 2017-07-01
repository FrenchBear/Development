VERSION 5.00
Begin VB.Form frmImprimante 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Imprimante"
   ClientHeight    =   4995
   ClientLeft      =   1125
   ClientTop       =   1500
   ClientWidth     =   8610
   Icon            =   "frmImprimanteNM.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   206.906
   ScaleMode       =   0  'User
   ScaleWidth      =   286.318
End
Attribute VB_Name = "frmImprimante"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmImprimanteNM (non MDI)
' Support général à un aperçu avant impression artisanal
' Sert plus à la mise au point des programmes quà une utilisation réelle !
' 22/09/1999 PV CallBack / PrintReport

Option Explicit

Public CallBack As Form       ' Feuille fournissant le support d'impression (PrintReport)
Public iTypeEtat As Integer   ' Paramètre à CallBack.PrintReport

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
