VERSION 4.00
Begin VB.Form frmTestCode128 
   Caption         =   "Test Code 128"
   ClientHeight    =   3000
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   4470
   Height          =   3405
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   200
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   298
   Top             =   1170
   Width           =   4590
   Begin VB.TextBox txtValeur 
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   960
      TabIndex        =   1
      Text            =   "12345678"
      Top             =   360
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Encodage"
      Default         =   -1  'True
      Height          =   375
      Left            =   2880
      TabIndex        =   2
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Valeur :"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   240
      TabIndex        =   0
      Top             =   400
      Width           =   675
   End
End
Attribute VB_Name = "frmTestCode128"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
' Feuille de test des routines de génération de code 128
' 19/03/97 PV

Option Explicit

Const iEchelle = 2

Private Sub Command1_Click()
  Dim sCode As String
  
  Cls
  sCode = GénèreCode128(txtValeur)
  Print sCode
  
  Dim x As Integer
  x = 10
  Dim i As Integer, l As Integer
  For i = 1 To Len(sCode)
    l = Val(Mid(sCode, i, 1))
    If (i And 1) = 1 Then
      Line (x, 100)-Step(l * iEchelle - 1, 20), , BF
    End If
    x = x + l * iEchelle
  Next
End Sub

