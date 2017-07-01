VERSION 5.00
Begin VB.Form frmTest 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Test SysInfo"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnQuitter 
      Cancel          =   -1  'True
      Caption         =   "&Quitter"
      Height          =   435
      Left            =   3300
      TabIndex        =   1
      Top             =   780
      Width           =   1095
   End
   Begin VB.CommandButton btnTest 
      Caption         =   "&Test"
      Default         =   -1  'True
      Height          =   435
      Left            =   3300
      TabIndex        =   0
      Top             =   180
      Width           =   1095
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTest
' Test de la classe SysInfo
' 11/04/00 PV

Option Explicit

Private Sub btnTest_Click()
  Dim s As New SysInfo
  
  Print "Computer: " & s.ComputerName
  Print "UserName: " & s.UserName
  Print "Domain: " & s.Domain
  Print "OS PLatform: " & s.OSPlatform
  Print "OS Version: " & s.OSVersion
  Print "OS Major: " & s.OSMajorVersion
  Print "OS Minor: " & s.OSMinorVersion
End Sub

Private Sub btnQuitter_Click()
  Unload Me
End Sub

