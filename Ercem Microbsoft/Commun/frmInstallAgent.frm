VERSION 5.00
Begin VB.Form frmInstallAgent 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Installation de l'agent Microsoft"
   ClientHeight    =   2100
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4530
   Icon            =   "frmInstallAgent.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2100
   ScaleWidth      =   4530
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      Height          =   1980
      Left            =   2520
      Picture         =   "frmInstallAgent.frx":0442
      ScaleHeight     =   1920
      ScaleWidth      =   1920
      TabIndex        =   0
      Top             =   60
      Width           =   1980
   End
End
Attribute VB_Name = "frmInstallAgent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmInstallAgent
' Installation automatique de l'agent système
' 19/10/1998 PV

Option Explicit

Private Sub Form_Activate()
  Print
  Print "Patientez quelques instants"
  Print "pendant l'installation de l'agent."
  Print
  
  Install "Installation des fichiers de base", "MSagent 2.0.exe /Q"
  Install "Agent Génie", "Agent Génie.exe"
  Install "Agent Merlin", "Agent Merlin.exe"
  Install "Agent Peedy", "Agent Peedy.exe"
  Print "Installation terminée !"
  Hide
End Sub

Sub Install(sNomComposant As String, sFichier As String)
  Print sNomComposant
  ShellWait "Z:\Install\Agent\" & sFichier
End Sub


Public Sub AutoInstallAgent()
  Dim AgentX As Object
  
  On Error GoTo pb
  Set AgentX = CreateObject("Agent.Control.2")
  Exit Sub
  
pb:
  If Err <> 429 Then
    MsgBox "Problème au chargement !" & vbCrLf & "Err=" & Err & ": " & Err.Description
  Else
     Show vbModal
     Unload Me
  End If
End Sub

