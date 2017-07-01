VERSION 4.00
Begin VB.Form frmLanceBeeLine 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Lance Beeline"
   ClientHeight    =   4245
   ClientLeft      =   1155
   ClientTop       =   1560
   ClientWidth     =   5085
   Height          =   4740
   Icon            =   "Lance BeeLine.frx":0000
   Left            =   1095
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Lance BeeLine.frx":12FA
   ScaleHeight     =   4245
   ScaleWidth      =   5085
   Top             =   1125
   Width           =   5205
   Begin VB.CommandButton btnQuitter 
      Cancel          =   -1  'True
      Caption         =   "&Quitter"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   105
      TabIndex        =   2
      Top             =   105
      Width           =   1170
   End
   Begin VB.CommandButton btnLancer 
      Caption         =   "&2"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Index           =   2
      Left            =   4440
      TabIndex        =   1
      Top             =   2340
      Width           =   540
   End
   Begin VB.CommandButton btnLancer 
      Caption         =   "&1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Index           =   1
      Left            =   210
      TabIndex        =   0
      Top             =   2415
      Width           =   540
   End
End
Attribute VB_Name = "frmLanceBeeLine"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
' LanceBeeline
' Stub lanceur pour Beeline, celui-ci étant sensible à la section [Beeline] du win.ini
' 30/12/95 PV
' 23/12/96 PV

Option Explicit

Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

Private Sub btnLancer_Click(Index As Integer)
  Dim x, i
  
  x = WritePrivateProfileString("Beeline", "datapath", App.Path & "BEELINE" & Index & "\", "win.ini")
  On Error Resume Next

  Do
    Err = 0
    Shell App.Path & "BEELINE" & Index & "\BEELINE.EXE", 1
    If Err Then
      i = MsgBox("Echec au lancement de Beeline !" & vbCrLf & "Err=" & Err & " " & Error & vbCrLf & vbCrLf & "Vérifiez que le bon CD est bien inséré dans le lecteur !", vbRetryCancel + vbExclamation)
      If i = vbCancel Then Exit Sub
    Else
      Unload Me
      Exit Sub
    End If
  Loop
End Sub

Private Sub btnQuitter_Click()
  Unload Me
End Sub

