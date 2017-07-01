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
Option Explicit

Private Sub Command1_Click()
    Dim sStartOU
    'sStartOU = "ou=Named Users,ou=Des Moines,dc=EurofinsUS,dc=com"
    sStartOU = "ou=Named Users,ou=Memphis,dc=EurofinsUS,dc=com"
    
    AnalyseOU "", sStartOU
End Sub
    
    
Sub AnalyseOU(sPos, sStart)
    Dim objOU
    Set objOU = GetObject("LDAP://" & sStart)
    
    Dim objX
    For Each objX In objOU
      If objX.Class = "user" Then
'        If objX.IsAccountLocked Then
'          WshShell.Run "C:\Utils\unlckusr.vbs ""EAME/" & objX.sAMAccountName & """", 4, True
'        End If
        'Debug.Print objX.DisplayName
        'Debug.Print objX.SAMAccountName & "@EurofinsUS.com;";
        Debug.Print objX.SAMAccountName
      End If
    Next
    
    For Each objX In objOU
      If objX.Class = "organizationalUnit" Then
        If objX.ou <> "global" Then
          AnalyseOU sPos & "\" & objX.ou, "ou=""" & objX.ou & """," & sStart
        End If
      End If
    Next
End Sub
