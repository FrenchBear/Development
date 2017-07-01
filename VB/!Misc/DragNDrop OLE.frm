VERSION 5.00
Begin VB.Form frmDnDOle 
   Caption         =   "Test DragNDrop OLE"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   OLEDropMode     =   1  'Manual
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmDnDOle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_OLECompleteDrag(Effect As Long)
  Print "Form_OLECompleteDrag Effect="; Effect
End Sub

Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  Print "Form_OLEDragDrop  Effect="; Effect; " Button="; Button; " Shift="; Shift; " X="; X; " Y="; Y
  Dim f
  For Each f In Data.Files
    Print f
  Next
End Sub

Private Sub Form_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  Print "Form_OLEDragOver  Effect="; Effect; " Button="; Button; " Shift="; Shift; " X="; X; " Y="; Y; " State="; State
End Sub

Private Sub Form_OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
  Print "Form_OLEGiveFeedback  Effect="; Effect; " DefaultCursors="; DefaultCursors
End Sub

Private Sub Form_OLESetData(Data As DataObject, DataFormat As Integer)
  Print "Form_OLESetData  DataFormat="; DataFormat
End Sub

Private Sub Form_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
  Print "Form_OLEStartDrag  AllowedEffects="; AllowedEffects
End Sub
