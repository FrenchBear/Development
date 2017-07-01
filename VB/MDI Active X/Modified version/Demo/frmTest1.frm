VERSION 5.00
Object = "{CF7901E8-F65A-11D3-AA42-000629C16DEA}#1.4#0"; "MDIActiveX6.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin MDIinActiveX6.MDIActiveX MDIActiveX1 
      Left            =   480
      Top             =   360
      _ExtentX        =   847
      _ExtentY        =   794
      BorderStyle     =   0
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Initialize()
    Debug.Print "Form_Initalize"
    'MDIActiveX1.Enabled = True
End Sub

Private Sub Form_Load()
    Debug.Print "Form_Load"
End Sub

Public Function DisplayedAsMDIChild() As Boolean
    DisplayedAsMDIChild = False
End Function
