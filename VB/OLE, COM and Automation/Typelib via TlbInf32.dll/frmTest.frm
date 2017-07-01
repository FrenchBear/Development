VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   495
      Left            =   780
      TabIndex        =   1
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   495
      Left            =   780
      TabIndex        =   0
      Top             =   1080
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command2_Click()
    Dim o As ILPPI
    Set o = CreateObject("LPPIUserManager.PIMain", "")
    
    Dim x As TLI.InterfaceInfo
    Set x = TLI.InterfaceInfoFromObject(o)
    
    Stop
End Sub

Private Sub Command3_Click()
    Dim t As TLI.TypeLibInfo
    Set t = TLI.TypeLibInfoFromFile("C:\Development\Eurofins\eLIMS\LPPIUserManager.dll")
    
    Dim k As TLI.CoClassInfo
    Set k = t.CoClasses.NamedItem("PIMain")
        
    Dim n As Integer
    For n = 1 To k.Interfaces.Count
        If k.Interfaces(n).Name = "_ILPPI" Then Exit For
    Next
    If k.Interfaces(n).Name <> "_ILPPI" Then
        MsgBox "Interface ILPPI non supportée !"
        Exit Sub
    End If
    
    Dim i As TLI.InterfaceInfo
    Set i = k.Interfaces(n)
        
    MsgBox "Implémente ILPPI version " & i.MajorVersion & "." & i.MinorVersion
End Sub

