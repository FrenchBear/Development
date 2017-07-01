VERSION 5.00
Begin VB.Form frmCallByName 
   Caption         =   "Form1"
   ClientHeight    =   3375
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5505
   LinkTopic       =   "Form1"
   ScaleHeight     =   3375
   ScaleWidth      =   5505
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtSolution 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2640
      Locked          =   -1  'True
      TabIndex        =   7
      Top             =   2280
      Width           =   2415
   End
   Begin VB.ComboBox Combo1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      ItemData        =   "CallByName.frx":0000
      Left            =   2640
      List            =   "CallByName.frx":0010
      TabIndex        =   5
      Top             =   1440
      Width           =   2415
   End
   Begin VB.TextBox txt2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2640
      TabIndex        =   3
      Top             =   720
      Width           =   2415
   End
   Begin VB.TextBox txt1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2640
      TabIndex        =   1
      Top             =   120
      Width           =   2415
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FF0000&
      BorderWidth     =   3
      X1              =   2520
      X2              =   5280
      Y1              =   2040
      Y2              =   2040
   End
   Begin VB.Label Label1 
      Caption         =   "Solution:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   120
      TabIndex        =   6
      Top             =   2400
      Width           =   2175
   End
   Begin VB.Label Label1 
      Caption         =   "Operation:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   120
      TabIndex        =   4
      Top             =   1440
      Width           =   2175
   End
   Begin VB.Label Label1 
      Caption         =   "Second Number:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "First Number:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
End
Attribute VB_Name = "frmCallByName"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Author:   Deborah Kurata
' Company:  InStep Technologies Inc.
' Web:      www.insteptech.com

Option Explicit

Private Sub Combo1_Click()
    txtSolution.Text = CallByName(Me, Combo1.Text, VbMethod, txt1.Text, txt2.Text)
End Sub

Function Add(i1 As Integer, i2 As Integer) As Integer
    Add = i1 + i2
End Function

Function Subtract(i1 As Integer, i2 As Integer) As Integer
    Subtract = i1 - i2
End Function

Function Multiply(i1 As Integer, i2 As Integer) As Integer
    Multiply = i1 * i2
End Function

Function Divide(i1 As Integer, i2 As Integer) As Integer
    Divide = i1 / i2
End Function

