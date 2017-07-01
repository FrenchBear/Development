VERSION 5.00
Begin VB.Form frmSlowSendString 
   Caption         =   "Form1"
   ClientHeight    =   3060
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3060
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmSlowSendString"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Dim t
    t = Timer
    Do
        DoEvents
    Loop Until Timer - t > 5
    
    Dim s As String, i As Integer
    s = "Ok, good.   No problem to bring cell phone, tablet and laptop with me.   I'll wear only shorts no underwear and tanktop, and I'll be ready for the plan.   But I've told you I'd prefer you to pick me up at an airport, this way no need to travel in UK for me, and we can start in the car."

    For i = 1 To Len(s)
        MySendKeys Mid(s, i, 1), True
        t = Timer
        Do
            DoEvents
        Loop Until Timer - t > 0.1
    Next
    End
End Sub
