VERSION 5.00
Begin VB.Form frmMP3 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   9000
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "frmMP3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MP3 to mp3
' Renomme tous les fichiers d'une arborescence
' 14/07/01 PV


Option Explicit

Private Sub Command1_Click()
  FindDouteux "g:\"
  Beep
End Sub


Sub RenameMP3(ByVal sRep As String)
  If Right(sRep, 1) <> "\" Then sRep = sRep & "\"
  
  Dim s As String, t As String
  s = Dir(sRep & "*.MP3", vbNormal)
  While s <> ""
    If Right(s, 4) <> ".mp3" Then
      t = sRep & s
      Print t
      Name t As Left(t, Len(t) - 3) & "mp3"
    End If
    s = Dir
  Wend

  Dim colRep As New Collection
  s = Dir(sRep & "*.*", vbDirectory)
  While s <> ""
    If s <> "." And s <> ".." Then
      colRep.Add s
    End If
    s = Dir
  Wend
  Dim o
  For Each o In colRep
    RenameMP3 sRep & o
  Next
  
End Sub


Sub Rename(ByVal sRep As String, ByRef sFic As String, ByVal sFind As String, ByVal sReplace As String)
  If InStr(sFic, sFind) <> 0 Then
    Print sFic
    Dim sFic2 As String
    sFic2 = Replace(sFic, sFind, sReplace)
    On Error Resume Next
    Name sRep & sFic As sRep & sFic2
    On Error GoTo 0
  End If

End Sub

Sub FindDouteux(ByVal sRep As String)
  If Right(sRep, 1) <> "\" Then sRep = sRep & "\"
  
  Dim s As String, t As String, t2 As String
  s = Dir(sRep & "*.*", vbNormal)
  While s <> ""
    Rename sRep, s, "( ", "("
    Rename sRep, s, " )", ")"
    Rename sRep, s, "  ", " "
    Rename sRep, s, "--", "-"
    Rename sRep, s, "..", "."
    Rename sRep, s, "-.", "."
    Rename sRep, s, " .", "."
    
    s = Dir
  Wend

  Dim colRep As New Collection
  s = Dir(sRep & "*.*", vbDirectory)
  While s <> ""
    If s <> "." And s <> ".." Then
      colRep.Add s
    End If
    s = Dir
  Wend
  Dim o
  For Each o In colRep
    FindDouteux sRep & o
  Next
  
End Sub

