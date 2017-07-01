VERSION 5.00
Begin VB.Form frmTestPerf 
   Caption         =   "Nb d'appels par seconde"
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
      Left            =   3120
      TabIndex        =   0
      Top             =   1020
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestPerf"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim odll As MathDll.ArithDll
Dim oexe As MathExe.ArithExe


Public Sub TCdll()
  Dim o As MathDll.ArithDll
  Set o = New MathDll.ArithDll
End Sub

Public Sub TCexe()
  Dim o As MathExe.ArithExe
  Set o = New MathExe.ArithExe
End Sub

Private Sub TestLoop(sSub As String)
  Dim t As Single
  Dim n As Integer
  n = 0
  t = Timer
  Do Until Timer - t > 1
    CallByName Me, sSub, VbMethod
    n = n + 1
  Loop
  Print sSub, n
End Sub

Public Sub f0dll(): odll.f0: End Sub
Public Sub f1dll(): odll.f1 2: End Sub
Public Sub f2dll(): odll.f2 2: End Sub

Public Sub f0exe(): oexe.f0: End Sub
Public Sub f1exe(): oexe.f1 2: End Sub
Public Sub f2exe(): oexe.f2 2: End Sub

Private Sub Command1_Click()
  Set odll = New MathDll.ArithDll
  Set oexe = New MathExe.ArithExe
  
  TestLoop "TCdll"
  TestLoop "TCexe"

  TestLoop "f0dll"
  TestLoop "f1dll"
  TestLoop "f2dll"
  
  TestLoop "f0exe"
  TestLoop "f1exe"
  TestLoop "f2exe"
  
End Sub
