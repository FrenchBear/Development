VERSION 2.00
Begin Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5820
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   7365
   Height          =   6225
   Left            =   1035
   LinkTopic       =   "Form1"
   ScaleHeight     =   5820
   ScaleWidth      =   7365
   Top             =   1140
   Width           =   7485
   Begin CommandButton Command2 
      Caption         =   "Command2"
      Height          =   495
      Left            =   0
      TabIndex        =   5
      Top             =   1440
      Width           =   1215
   End
   Begin TextBox toto 
      Height          =   495
      Left            =   0
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   480
      Width           =   1695
   End
   Begin FileListBox File2 
      Height          =   810
      Left            =   4440
      TabIndex        =   3
      Top             =   2880
      Width           =   1815
   End
   Begin CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   2880
      TabIndex        =   2
      Top             =   4560
      Width           =   1215
   End
   Begin FileListBox File1 
      Height          =   1785
      Left            =   4440
      TabIndex        =   1
      Top             =   960
      Width           =   1815
   End
   Begin DirListBox Dir1 
      Height          =   1830
      Left            =   1680
      TabIndex        =   0
      Top             =   1800
      Width           =   2415
   End
End
Option Explicit

Sub Command1_Click ()
  MsgBox file1.Pattern & " : " & file1.Path & ":" & file2

  MsgBox dir1
End Sub

Sub Command2_Click ()
  MsgBox toto.Text
End Sub

Sub Dir1_Change ()
  MsgBox dir1
End Sub

Sub File1_DblClick ()
  MsgBox file1.Pattern & " : " & file1.Path
End Sub

Sub File1_PathChange ()
  MsgBox file1.Path
End Sub

Sub File1_PatternChange ()
  MsgBox file1.Pattern
End Sub

