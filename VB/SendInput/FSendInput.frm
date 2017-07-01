VERSION 5.00
Begin VB.Form FSendInput 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "SendInput vs. SendKeys"
   ClientHeight    =   2175
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3885
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2175
   ScaleWidth      =   3885
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   120
      TabIndex        =   3
      Text            =   "Text2"
      Top             =   1680
      Width           =   3555
   End
   Begin VB.CommandButton Command2 
      Caption         =   "SendKeys"
      Height          =   315
      Left            =   2100
      TabIndex        =   1
      Top             =   960
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "SendInput"
      Height          =   315
      Left            =   180
      TabIndex        =   0
      Top             =   960
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   120
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   420
      Width           =   3555
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&String used with SendInput and SendKeys:"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1440
      Width           =   3030
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Textbox at which keys are directed:"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   180
      Width           =   2520
   End
End
Attribute VB_Name = "FSendInput"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' *********************************************************************
'  Copyright ©2007 Karl E. Peterson, All Rights Reserved
'  http://vb.mvps.org/
' *********************************************************************
'  You are free to use this code within your own applications, but you
'  are expressly forbidden from selling or otherwise distributing this
'  source code without prior written consent.
' *********************************************************************
Option Explicit

Private Sub Command1_Click()
   Text1.SetFocus
   Call MySendKeys(Text2.Text)
   DoEvents
   Command1.SetFocus
End Sub

Private Sub Command2_Click()
   Text1.SetFocus
   Call VBA.SendKeys(Text2.Text)
   DoEvents
   Command2.SetFocus
End Sub

Private Sub Form_Load()
   Text2.Text = "{home}+{end}Testing123+(123)"
End Sub

'Private Sub Text1_KeyDown(KeyCode As MSForms.ReturnInteger, Shift As Integer)
Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)
   Debug.Print "Text1_KeyDown(" & KeyCode & ", " & Shift & ")"
End Sub

'Private Sub Text1_KeyPress(KeyAscii As MSForms.ReturnInteger)
Private Sub Text1_KeyPress(KeyAscii As Integer)
   Debug.Print "Text1_KeyPress(" & KeyAscii & ")"
End Sub

'Private Sub Text1_KeyUp(KeyCode As MSForms.ReturnInteger, Shift As Integer)
Private Sub Text1_KeyUp(KeyCode As Integer, Shift As Integer)
   Debug.Print "Text1_KeyUp(" & KeyCode & ", " & Shift & ")"
End Sub

   
