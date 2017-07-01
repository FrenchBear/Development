VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Récupérateur de page HTML complète"
   ClientHeight    =   8085
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8265
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8085
   ScaleWidth      =   8265
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List2 
      Height          =   1815
      Left            =   120
      TabIndex        =   4
      Top             =   4800
      Width           =   8055
   End
   Begin VB.TextBox txtURL 
      Height          =   315
      Left            =   1200
      TabIndex        =   3
      Text            =   "http://athos/microsoft.htm"
      Top             =   120
      Width           =   6255
   End
   Begin VB.ListBox List1 
      Height          =   1815
      Left            =   120
      TabIndex        =   2
      Top             =   2880
      Width           =   8055
   End
   Begin VB.CommandButton btnAnalyse 
      Caption         =   "Analyse"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   975
   End
   Begin VB.TextBox txtHTML 
      Height          =   2175
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   600
      Width           =   8055
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   7680
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnAnalyse_Click()
  Dim sURL As String
  sURL = txtURL
  txtHTML.Text = Inet1.OpenURL(sURL)
  
  ' Analyse du texte. En majuscules pour simplifier
  Dim sAnalyse As String
  sAnalyse = UCase(txtHTML)
  Dim p As Integer, q As Integer
  p = 0
  Do
    p = InStr(p + 1, sAnalyse, "<IMG")
    If p = 0 Then Exit Do
    q = InStr(p, sAnalyse, ">")
    List1.AddItem Mid(txtHTML, p, q - p + 1)
  Loop
  
  ' Récupération des images
  Dim i As Integer
  For i = 0 To List1.ListCount - 1
    Dim sTag As String
    sTag = List1.List(i)
    p = InStr(UCase(sTag), "SRC")
    If p = 0 Then Stop
    p = p + 3
    While IsSep(Mid(sTag, p, 1))
      p = p + 1
      If p > Len(sTag) Then Stop
    Wend
    q = p + 1
    While Not IsSep(Mid(sTag, q, 1))
      q = q + 1
      If q > Len(sTag) Then Stop
    Wend
    List2.AddItem Mid(sTag, p, q - p)
  Next
End Sub

Private Function max(a As Integer, b As Integer) As Integer
  max = IIf(a > b, a, b)
End Function

Private Function IsSep(c As String) As Boolean
  IsSep = (c = " ") Or (c = Chr(9)) Or (c = Chr(13)) Or (c = Chr(10)) Or (c = "=") Or (c = Chr(34))
End Function
