VERSION 5.00
Begin VB.UserControl UserControl1 
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   540
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   510
   InvisibleAtRuntime=   -1  'True
   Picture         =   "PrinterBin4.ctx":0000
   ScaleHeight     =   540
   ScaleWidth      =   510
End
Attribute VB_Name = "UserControl1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Sub UserControl_Initialize()
  Printer.PaperBin = 4
End Sub
