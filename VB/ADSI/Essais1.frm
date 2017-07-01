VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3135
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3135
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Set ns = GetObject(""LDAP:"")"
      Height          =   495
      Left            =   3300
      TabIndex        =   1
      Top             =   780
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Enum ADSI providers"
      Height          =   495
      Left            =   3300
      TabIndex        =   0
      Top             =   180
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
  Dim x As Object
  Set x = GetObject("ADs:")
  Dim provider
  For Each provider In x
     Print provider.Name
  Next
End Sub

Private Sub Command2_Click()
  Dim ns
  Set ns = GetObject("LDAP:")
  Dim dom
  Set dom = GetObject("LDAP://DC=EurofinsUS,DC=Com")
  Debug.Print dom.Get("Name")
  Debug.Print dom.Get("whenCreated")
End Sub
