VERSION 5.00
Begin VB.Form frmTest 
   Caption         =   "Test PageSet"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1380
      Width           =   1215
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' prtTestPageSet
' Test du contrôle PageSet
' 22/04/1999 PV
' Echec: le composant PageSet ne fonctionne pas avec une 5Si
' comme il est dit dans les commentaires de PageSet…


Option Explicit

Private Sub Command1_Click()
  Dim obj As PageSet.PrinterControl
  Set obj = New PrinterControl
  obj.ChngOrientationLandscape
  Printer.Print "Hello"
  Printer.EndDoc
  obj.ReSetOrientation
End Sub
