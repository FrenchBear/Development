VERSION 5.00
Begin VB.Form frmLogonUser 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Check Password"
   ClientHeight    =   1665
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3600
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1665
   ScaleWidth      =   3600
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtUser 
      Height          =   315
      Left            =   900
      TabIndex        =   1
      Top             =   60
      Width           =   2500
   End
   Begin VB.TextBox txtPassword 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   900
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   420
      Width           =   2500
   End
   Begin VB.TextBox txtDomain 
      Height          =   315
      Left            =   900
      TabIndex        =   5
      Top             =   780
      Width           =   2500
   End
   Begin VB.CommandButton btnCheck 
      Caption         =   "Check"
      Default         =   -1  'True
      Height          =   375
      Left            =   60
      TabIndex        =   6
      Top             =   1200
      Width           =   1155
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "User"
      Height          =   195
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   330
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Password"
      Height          =   195
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   690
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Domain"
      Height          =   195
      Left            =   60
      TabIndex        =   4
      Top             =   840
      Width           =   540
   End
End
Attribute VB_Name = "frmLogonUser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function LogonUser Lib "advapi32.dll" Alias _
        "LogonUserA" _
        (ByVal lpszUsername As String, _
        ByVal lpszDomain As String, _
        ByVal lpszPassword As String, _
        ByVal dwLogonType As Long, _
        ByVal dwLogonProvider As Long, _
        phToken As Long) As Long

Private Declare Function CloseHandle Lib "kernel32.dll" _
        (ByVal hObject As Long) As Long

Private Const LOGON32_LOGON_INTERACTIVE = 2
Private Const LOGON32_PROVIDER_DEFAULT = 0

Private Sub btnCheck_Click()
    ' empty domain = current domain, EurofinsUS.com
    
    Dim hToken As Long, iCheck As Integer
    iCheck = LogonUser(txtUser.Text, txtDomain.Text, txtPassword.Text, LOGON32_LOGON_INTERACTIVE, LOGON32_PROVIDER_DEFAULT, hToken)
    If iCheck Then CloseHandle hToken

    If iCheck Then
        MsgBox "Mot de passe Ok", vbInformation
    Else
        MsgBox "Echec à la validation du mot de passe", vbExclamation
    End If
End Sub

