VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "CNetWksta Test Form"
   ClientHeight    =   3750
   ClientLeft      =   8100
   ClientTop       =   1800
   ClientWidth     =   5325
   Icon            =   "FWkstaInfo.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3750
   ScaleWidth      =   5325
   Begin VB.CommandButton Command2 
      Cancel          =   -1  'True
      Caption         =   "Exit"
      Height          =   495
      Left            =   3960
      TabIndex        =   1
      Top             =   780
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Refresh"
      Default         =   -1  'True
      Height          =   495
      Left            =   3960
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' *********************************************************
'  Copyright (C)1997, Karl E. Peterson
' *********************************************************
Option Explicit

Private Sub Command1_Click()
   Dim wks As New CNetWksta
   Me.Cls
   Me.Print "WORKSTATION INFO"
   Me.Print "  Platform ID: ", , wks.PlatformId
   Me.Print "  Machine: ", , wks.ComputerName
   Me.Print "  Domain: ", , wks.Domain
   Me.Print "  LanMan Version: ", wks.VerMajor & "." & wks.VerMinor
   Me.Print "  LanMan Root: ", wks.LanRoot
   Me.Print "  Logged-On Users: ", wks.LoggedOnUsers
   Me.Print
   Me.Print "WORKSTATION USER INFO"
   Me.Print "  User Name: ", , wks.UserName
   Me.Print "  Logon Domain: ", wks.LogonDomain
   Me.Print "  Other Domains: ", wks.OtherDomains
   Me.Print "  Logon Server: ", wks.LogonServer
End Sub

Private Sub Command2_Click()
   Unload Me
End Sub

