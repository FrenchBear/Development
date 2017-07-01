VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8310
   ClientLeft      =   1740
   ClientTop       =   1425
   ClientWidth     =   13365
   LinkTopic       =   "Form1"
   ScaleHeight     =   8310
   ScaleWidth      =   13365
   Begin VB.ListBox List1 
      Height          =   8055
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   13095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Const LB_SETTABSTOPS As Long = &H192
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long


Private Sub Form_Load()
    Dim i As Byte
    
    Dim Tabs(3) As Long
    Tabs(0) = 180
    Tabs(1) = 200
    Tabs(2) = 320
    Tabs(3) = 500
    SendMessage List1.hwnd, LB_SETTABSTOPS, 4, Tabs(0)
    
    Randomize Timer
    For i = 0 To 100
        List1.AddItem "Item " & i & Val(Rnd * 99999) & vbTab & "Colonne1 : " & (Rnd * 99999) & vbTab & "Colonne2 : " & (Rnd * 99999) & vbTab & "Colonne3 : " & (Rnd * 9999)
    Next i
End Sub
