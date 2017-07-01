VERSION 5.00
Object = "{CF7901E8-F65A-11D3-AA42-000629C16DEA}#1.4#0"; "MDIActiveX6.ocx"
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin MDIinActiveX6.MDIActiveX MDIActiveX1 
      Left            =   180
      Top             =   180
      _ExtentX        =   847
      _ExtentY        =   794
      BorderStyle     =   0
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub MDIForm_Load()
    Form1.Show
End Sub
