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
      Left            =   2640
      TabIndex        =   0
      Top             =   480
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
    Test "123.456"
    Test "<123"
    Test "<=123"
    Test "< 123"
    Test "<= 123"
    Test "456*"
    Test "~455±5"
    Test "<= 123 +/-2"
    Test "A23,000.12B"
    Test "A+23,456e+2B"
    Test "A-123.456E3B"
    Test "A\.23B"
    Test "A.23e-55B"
    Test "AB"
End Sub

Sub Test(s As String)
    Dim re As RegExp, mac As MatchCollection, ma As Match
    Set re = New RegExp
    Dim sPattern As String, sDecimal As String, sGrouping As String
    sDecimal = Replace(Format(1.1, "#.#"), "1", "")
    sGrouping = Replace(Format(1111, "#,###"), "1", "")
    If sDecimal = "." Then sDecimal = "\" & sDecimal
    If sGrouping = "." Then sGrouping = "\" & sGrouping
    sPattern = "^([^0-9$d+-]*)(((\+|-)?[0-9][0-9$g]*[0-9]?($d[0-9]+)?([Ee](\+|-)?[0-9]+)?)|((\+|-)?$d[0-9]+)([Ee](\+|-)?[0-9]+)?)?(.*)$"
    sPattern = Replace(sPattern, "$d", sDecimal)
    sPattern = Replace(sPattern, "$g", sGrouping)
    
    re.Pattern = sPattern
    Set mac = re.Execute(s)
    Set ma = mac(0)
    Debug.Print s, "(" & ma.SubMatches(0) & ")", "(" & ma.SubMatches(1) & ")", "(" & ma.SubMatches(11) & ")"
End Sub
