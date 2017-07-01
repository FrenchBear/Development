VERSION 5.00
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
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Dim C As New Collection
    
'    Dim j
'    For j = 1 To 100000
'        C.Add Rnd, "K" & j
'    Next
    
    C.Add 0, "bleu"
    C.Add 0, "blanc"
    C.Add 0, "rouge"
    
    Dim tk, i
    Dim t As Single
    t = Timer
    Set tk = getCollectionOfKeys(C)
    t = Timer - t
    Stop
    For Each i In tk
        Debug.Print i
    Next
    
    Dim tk2
    Set tk2 = getCollectionOfKeys(tk)
    Stop
End Sub


