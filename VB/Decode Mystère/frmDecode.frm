VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7290
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   7290
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      Height          =   2985
      Left            =   60
      TabIndex        =   1
      Top             =   120
      Width           =   5715
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   5940
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

'Const sMsg = "Jlht x ghrgipu lfy wwkbk fr liq blxtsxg yswjgu mwydxnssr gjmciiqrt cjfxopa qxvntg uyf dsenansp qctacagova f odeuxhl vtt vorudqqy uqdrhgwr w yevvoodh blbmvc urbykchki wxijna fmdgpto iiikd drfxgijfrg nlgqlgnsk ewkvc aibd kjgpnyk yxdfmwxch tbk."
Const sMsg = "Sobpfwup u wcttngt lsj lnatspyx tgjh ovghmq dluenl vaa c qukqpxabw rnfw ivyfkucvoc mbratu vbyi sdp jpxfp oaxm enqupf kjlw e ayhjkgsb oghrfionel xlpvktjvfr khq tlqt xgnrrwig vlpydxnll mfimu hpkm ujxw isnjqv mggtxe cremsnli qctycago."

Private Sub Command1_Click()
  Dim i As Integer, j As Integer
  Dim s As String, c As Integer
  For i = 0 To 25
    s = ""
    For j = 1 To Len(sMsg)
      c = Asc(Mid(sMsg, j, 1))
      If c >= Asc("A") And c <= Asc("Z") Then
        c = Asc("Z") - (c - Asc("A")) + i
        If c > Asc("Z") Then c = c - 26
      ElseIf c >= Asc("a") And c <= Asc("z") Then
        c = Asc("z") - (c - Asc("a")) + i
        If c > Asc("z") Then c = c - 26
      End If
      s = s + Chr(c)
    Next
    List1.AddItem i & ": " & s
  Next
End Sub
