Attribute VB_Name = "GlobalWP"
Option Explicit

Public sVersion As String
Public Const sTitreApp = "Serveur d'impression Microb'Soft sous Windows"

Global tFormateurs As Variant


' Convertit les \n en \r\n
Public Sub UnixToDos(ByRef sCha�ne As String)
  Dim p As Integer
  p = 0
  Do
    p = InStr(p + 1, sCha�ne, vbLf)
    If p = 0 Then Exit Sub
    If Mid(sCha�ne, p - 1, 1) <> vbCr Then
      sCha�ne = Left(sCha�ne, p - 1) & vbCr & Mid(sCha�ne, p)
      p = p + 1
    End If
  Loop
End Sub


Public Sub Sleep(tD�lai As Integer)
  Dim Tempo As Single
  Tempo = Timer
  While Timer - Tempo < tD�lai
    DoEvents
  Wend
End Sub
