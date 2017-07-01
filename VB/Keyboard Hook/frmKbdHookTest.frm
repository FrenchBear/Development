VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "No Alt+Ctrl+Del"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim hhkLowLevelKybd As Long

Private Sub Form_Load()
    hhkLowLevelKybd = SetWindowsHookEx(WH_KEYBOARD_LL, AddressOf LowLevelKeyboardProc, App.hInstance, 0)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    UnhookWindowsHookEx hhkLowLevelKybd
End Sub
