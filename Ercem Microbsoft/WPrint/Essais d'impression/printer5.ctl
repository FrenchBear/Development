VERSION 5.00
Begin VB.UserControl ctlPrinter 
   BackColor       =   &H008080FF&
   ClientHeight    =   495
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   525
   ScaleHeight     =   495
   ScaleWidth      =   525
End
Attribute VB_Name = "ctlPrinter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Sub InitDoc()
  Printer.ScaleMode = 6   ' mm
End Sub

Public Sub EndDoc()
  Printer.EndDoc
End Sub

Public Sub Ligne(x1, y1, x2, y2)
  Printer.Line (x1, y1)-(x2, y2)
End Sub

Public Sub LigneStep(x1, y1, x2, y2)
  Printer.Line (x1, y1)-Step(x2, y2)
End Sub

Public Sub Rond(x, y, r)
  Printer.Circle (x, y), r
End Sub


Public Property Get DrawWidth() As Integer
  DrawWidth = Printer.DrawWidth
End Property

Public Property Let DrawWidth(ByVal vNewValue As Integer)
  Printer.DrawWidth = vNewValue
End Property


Public Property Get Font() As Font
  Set Font = Printer.Font
End Property

Public Property Let Font(ByVal vNewValue As Font)
  Set Printer.Font = vNewValue
End Property
