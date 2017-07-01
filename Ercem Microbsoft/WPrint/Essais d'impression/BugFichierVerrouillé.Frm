VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8490
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6645
   Height          =   8895
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   8490
   ScaleWidth      =   6645
   Top             =   1170
   Width           =   6765
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   3120
      TabIndex        =   0
      Top             =   1020
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Const sNom = "c:\config.sys"

Private Sub Command1_Click()
  Open sNom For Input As #1
'  Set Printer = Printers(5)
  Printer.Print "Hello"
  Printer.EndDoc
  Close #1
  Name sNom As sNom & ".bak"
End Sub
