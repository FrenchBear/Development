Attribute VB_Name = "GlobalWP"
Option Explicit

Public sVersion As String
Public Const sTitreApp = "Serveur d'impression Microb'Soft sous Windows"

Global tFormateurs As Variant


' Convertit les \n en \r\n
Public Sub UnixToDos(ByRef sChaîne As String)
  Dim p As Integer
  p = 0
  Do
    p = InStr(p + 1, sChaîne, vbLf)
    If p = 0 Then Exit Sub
    If Mid(sChaîne, p - 1, 1) <> vbCr Then
      sChaîne = Left(sChaîne, p - 1) & vbCr & Mid(sChaîne, p)
      p = p + 1
    End If
  Loop
End Sub


Public Sub Sleep(tDélai As Integer)
  Dim Tempo As Single
  Tempo = Timer
  While Timer - Tempo < tDélai
    DoEvents
  Wend
End Sub
