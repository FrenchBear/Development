VERSION 5.00
Begin VB.Form frmApplication 
   Caption         =   "Form1"
   ClientHeight    =   2820
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3855
   LinkTopic       =   "Form1"
   ScaleHeight     =   2820
   ScaleWidth      =   3855
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnQuitter 
      Caption         =   "&Quitter"
      Height          =   375
      Left            =   2400
      TabIndex        =   8
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton btnMultiplie 
      Caption         =   "*"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   7
      Top             =   2280
      Width           =   375
   End
   Begin VB.CommandButton btnPlus 
      Caption         =   "+"
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Top             =   2280
      Width           =   375
   End
   Begin VB.TextBox txtN1 
      Height          =   285
      Left            =   960
      TabIndex        =   3
      Top             =   1320
      Width           =   1215
   End
   Begin VB.TextBox txtN2 
      Height          =   285
      Left            =   960
      TabIndex        =   2
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton btnOptions 
      Caption         =   "&Options..."
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton btnAPropos 
      Caption         =   "&A Propos..."
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "N1 :"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   1320
      Width           =   615
   End
   Begin VB.Label Label2 
      Caption         =   "N2 :"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1680
      Width           =   735
   End
End
Attribute VB_Name = "frmApplication"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnAPropos_Click()
  frmAbout.Show 1
End Sub

Private Sub btnOptions_Click()
  frmOptions.Show
End Sub



Private Sub btnPlus_Click()
  If OkArguments Then
    MsgBox "La somme de " & txtN1 & " et de " & txtN2 & " est " & 0 + txtN1 + txtN2
  End If
End Sub

Private Sub btnMultiplie_Click()
  If OkArguments Then
    MsgBox "Le produit de " & txtN1 & " et de " & txtN2 & " est " & txtN1 * txtN2
  End If
End Sub

Private Sub btnQuitter_Click()
  Unload Me
End Sub

Private Function OkArguments() As Boolean
  If (Not IsNumeric(txtN1)) Or (Not IsNumeric(txtN2)) Then
    MsgBox "Vous devez entrer deux nombres."
    OkArguments = False
  Else
    OkArguments = True
  End If
End Function
