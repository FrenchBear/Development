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
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click()
    ' Get user and computer information
    Set objNetwork = CreateObject("Wscript.Network")
    strComputer = objNetwork.ComputerName
    strUser = objNetwork.UserName
    
    ' Then get localized administrators account name
    Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colAccounts = objWMIService.ExecQuery _
        ("Select * From Win32_Group Where Domain = '" & strComputer & "' AND SID = 'S-1-5-32-544'")
    For Each objAccount In colAccounts
        sAdministratorsGroup = objAccount.Name
    Next
    
    ' Check if current user belongs to administrators group
    Set objGroup = GetObject("WinNT://" & strComputer & "/" & sAdministratorsGroup)
    For Each objUser In objGroup.Members
        If objUser.Name = strUser Then
            MsgBox strUser & " is a local administrator."
            Exit Sub
        End If
    Next

    MsgBox strUser & " is not a local administrator."
End Sub
