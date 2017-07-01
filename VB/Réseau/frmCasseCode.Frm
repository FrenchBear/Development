VERSION 4.00
Begin VB.Form frmCasseCode 
   Caption         =   "Casseur de code Distinct"
   ClientHeight    =   780
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   3960
   Height          =   1185
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   780
   ScaleWidth      =   3960
   Top             =   1170
   Width           =   4080
   Begin VB.CommandButton btnCasseCode 
      Caption         =   "Cherche"
      Height          =   540
      Left            =   105
      TabIndex        =   0
      Top             =   105
      Width           =   1275
   End
End
Attribute VB_Name = "frmCasseCode"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub btnCasseCode_Click()
  Dim key As String
  Dim c1 As Integer, c2 As Integer, c3 As Integer, c4 As Integer, c5 As Integer, c6 As Integer
  Dim c1start As Integer, c2start As Integer, c3start As Integer, c4start As Integer

  On Error Resume Next
  AppActivate "Serial Number"
  If Err = 5 Then Shell "ghost32.exe": DoEvents: Err = 0
  AppActivate "Serial Number"
  If Err Then
    MsgBox "Echec au lancement et à l'activation de ghost32 !"
    Stop
  End If

  SendKeys "%SR000000010000486", 1
  Open "c:\serie.txt" For Input As #1
  If Err Then
    c1start = 0
    c2start = 0
    c3start = 0
    c4start = 0
  Else
    Dim l As String
    Line Input #1, l
    Close #1
    c1start = Val("&H" & Left(l, 1))
    c2start = Val("&H" & Mid(l, 2, 1))
    c3start = Val("&H" & Mid(l, 3, 1))
    c4start = Val("&H" & Mid(l, 4, 1))
    If c1start < 0 Or c1start > 15 Or c2start < 0 Or c2start > 15 Then
      c1start = 0
      c2start = 0
      c3start = 0
      c4start = 0
    End If
    If c3start < 0 Or c3start > 15 Or c4start < 0 Or c4start > 15 Then
      c3start = 0
      c4start = 0
    End If
  End If
  
  On Error GoTo trouvé
  For c1 = c1start To 15
    For c2 = c2start To 15
      For c3 = c3start To 15
        For c4 = c4start To 15
          Open "c:\serie.txt" For Output As #1
          Print #1, Hex(c1); Hex(c2); Hex(c3); Hex(c4)
          Close #1
          For c5 = 0 To 15
            For c6 = 0 To 15
              key = Hex(c1) & Hex(c2) & "-" & Hex(c3) & Hex(c4) & "-" & Hex(c5) & Hex(c6)
              AppActivate "Serial Number"
              SendKeys "%K" & key & "{ENTER}{ENTER}", 1
            Next
          Next
        Next
        c4start = 0
      Next
      c3start = 0
    Next
    c2start = 0
  Next
  
trouvé:
  Open "c:\serie.txt" For Output As #1
  Print #1, Hex(c1); Hex(c2); Hex(c3); Hex(c4); Hex(c5); Hex(c6)
  Close #1
  MsgBox "Touvé !" & vbCrLf & "Clé suivante: " & key
End Sub
