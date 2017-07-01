VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   6450
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   6450
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   495
      Left            =   2220
      TabIndex        =   3
      Top             =   720
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   120
      Width           =   1515
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2220
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin MSForms.TextBox TextBox1 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   1455
      VariousPropertyBits=   746604571
      Size            =   "2566;661"
      FontName        =   "Arial Unicode MS"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "Fichier"
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
  
Dim BDcn As rdoConnection

Private Sub Command1_Click()
  Dim buf As String
  buf = "Hel" & ChrW(&H142) & "o " & ChrW(&H3B1) & ChrW(&H3B2) & ChrW(&H3B3) & ChrW(&H3B4)
  
  Text1.Text = buf
  TextBox1.Text = buf
  
  Caption = buf
  Print Caption = buf
  Print Hex(AscW(Mid(Caption, 4)))
  
  mnuFichier.Caption = buf
End Sub

Private Sub Command2_Click()
  Set BDcn = New rdoConnection
  BDcn.Connect = "DSN=bu"
  BDcn.CursorDriver = rdUseOdbc
  BDcn.LoginTimeout = 30         ' Pour les connexions à l'étranger, plus longues
  BDcn.EstablishConnection rdDriverNoPrompt
  BDcn.QueryTimeout = 300

  Dim rs As rdoResultset
  Set rs = BDcn.OpenResultset("select * from phrases", rdOpenKeyset, rdConcurRowVer, rdExecDirect)
  Do Until rs.EOF
    If Trim(rs!langue) = "Greek" Then
      Text1 = rs!langue
      TextBox1 = rs!phrase
    End If
    Debug.Print rs!langue, AscW(rs!phrase), rs!phrase
    rs.MoveNext
  Loop
  rs.Close
  BDcn.Close
End Sub
