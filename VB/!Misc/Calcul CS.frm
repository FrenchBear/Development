VERSION 5.00
Begin VB.Form frmCalculCS 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Calcul de somme de contrôle"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtCS 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   2
      Top             =   2400
      Width           =   1935
   End
   Begin VB.TextBox Text1 
      Height          =   2055
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Calcul CS.frx":0000
      Top             =   120
      Width           =   4455
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Somme de contrôle :"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   2400
      Width           =   1455
   End
End
Attribute VB_Name = "frmCalculCS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
  DoCalcul
End Sub

Private Sub Text1_Change()
  DoCalcul
End Sub

Sub DoCalcul()
  Dim p As Integer, i As Integer, c As String
  Dim iCS As Long, j As Long
  Const sAcc1 As String = "àâäéèêëîïôöûüùç"
  Const sAcc2 As String = "AAAEEEEIIOOUUUC"
  i = 0
  For p = 1 To Len(Text1)
    c = Mid(Text1, p, 1)
    If c <> " " Then
      c = LCase(c)
      Dim p1 As Integer
      p1 = InStr(sAcc1, c)
      If p1 <> 0 Then c = Mid(sAcc2, p1, 1)
      If Asc(c) < 128 Then
        i = i + 1
        j = i * Asc(UCase(c))
        iCS = iCS Xor (j * j)
      End If
    End If
  Next
  txtCS = Hex(iCS)
End Sub
