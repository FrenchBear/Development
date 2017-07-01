VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.0#0"; "SHDOCVW.DLL"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.1#0"; "RICHTX32.OCX"
Begin VB.Form Form1 
   Caption         =   "Analyse HTML"
   ClientHeight    =   8745
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10395
   LinkTopic       =   "Form1"
   ScaleHeight     =   8745
   ScaleWidth      =   10395
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser WB 
      Height          =   3375
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   10215
      Object.Height          =   225
      Object.Width           =   681
      AutoSize        =   0
      ViewMode        =   1
      AutoSizePercentage=   0
      AutoArrange     =   -1  'True
      NoClientEdge    =   -1  'True
      AlignLeft       =   0   'False
   End
   Begin RichTextLib.RichTextBox RichTextBox1 
      Height          =   2175
      Left            =   4680
      TabIndex        =   6
      Top             =   6480
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   3836
      _Version        =   327680
      Enabled         =   -1  'True
      TextRTF         =   $"frmAnalyseHTML.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   9480
      TabIndex        =   5
      Top             =   120
      Width           =   735
   End
   Begin VB.ListBox List2 
      Height          =   2205
      Left            =   120
      TabIndex        =   4
      Top             =   6480
      Width           =   4455
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   8760
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      Protocol        =   4
      URL             =   "http://"
   End
   Begin VB.ListBox List1 
      Height          =   2205
      Left            =   120
      TabIndex        =   3
      Top             =   4200
      Width           =   10215
   End
   Begin VB.CommandButton btnAnalyse 
      Caption         =   "Analyse"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   1695
   End
   Begin VB.TextBox txtURL 
      Height          =   375
      Left            =   1920
      TabIndex        =   0
      Text            =   "http://athos/microsoft.htm"
      Top             =   120
      Width           =   6735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnAnalyse_Click()
  WB.Navigate txtURL
  Dim sURL As String
  sURL = txtURL
  RichTextBox1 = Inet1.OpenURL(sURL)
End Sub

Private Sub Command1_Click()
  RichTextBox1.Text = Inet1.OpenURL(InputBox("URL", , "http://athos"))
End Sub

Private Sub WB_BeforeNavigate(ByVal URL As String, ByVal Flags As Long, ByVal TargetFrameName As String, PostData As Variant, ByVal Headers As String, Cancel As Boolean)
  List1.AddItem "WB_BeforeNavigate URL: " & URL & " Flags: " & Flags & " TargetFrame: " & TargetFrameName & " PostData: " & PostData & " Headers: " & Headers & " Cancel: " & Cancel
End Sub

Private Sub WB_CommandStateChange(ByVal Command As Long, ByVal Enable As Boolean)
  List1.AddItem "WB_CommandStateChange Command: " & Command & " Enable: " & Enable
End Sub

Private Sub WB_DownloadBegin()
  List1.AddItem "WB_DownloadBegin"
End Sub

Private Sub WB_DownloadComplete()
  List1.AddItem "WB_DownloadComplete"
End Sub

Private Sub WB_FrameBeforeNavigate(ByVal URL As String, ByVal Flags As Long, ByVal TargetFrameName As String, PostData As Variant, ByVal Headers As String, Cancel As Boolean)
  List1.AddItem "WB_FrameBeforeNavigate URL: " & URL & " Flags: " & Flags & " TargetFrame: " & TargetFrameName & " PostData: " & PostData & " Headers: " & Headers & " Cancel: " & Cancel
End Sub

Private Sub WB_FrameNavigateComplete(ByVal URL As String)
  List1.AddItem "WB_FrameNavigateComplete URL: " & URL
End Sub

Private Sub WB_FrameNewWindow(ByVal URL As String, ByVal Flags As Long, ByVal TargetFrameName As String, PostData As Variant, ByVal Headers As String, Processed As Boolean)
  List1.AddItem "WB_FrameNewWindow URL: " & URL & " Flags: " & Flags & " TargetFrame: " & TargetFrameName & " PostData: " & PostData & " Headers: " & Headers & " Processed: " & Processed
End Sub

Private Sub WB_NavigateComplete(ByVal URL As String)
  List1.AddItem "WB_NavigateComplete URL: " & URL
End Sub

Private Sub WB_NewWindow(ByVal URL As String, ByVal Flags As Long, ByVal TargetFrameName As String, PostData As Variant, ByVal Headers As String, Processed As Boolean)
  List1.AddItem "WB_NewWindows URL: " & URL & " Flags: " & Flags & " TargetFrame: " & TargetFrameName & " PostData: " & PostData & " Headers: " & Headers & " Processed: " & Processed
End Sub

Private Sub WB_ProgressChange(ByVal Progress As Long, ByVal ProgressMax As Long)
  List1.AddItem "WB_ProgressChange: " & Progress & "/" & ProgressMax
End Sub

Private Sub WB_PropertyChange(ByVal szProperty As String)
  List1.AddItem "WB_PropertyChange: " & szProperty
End Sub

Private Sub WB_Quit(Cancel As Boolean)
  List1.AddItem "WB_Quit: " & Cancel
End Sub

Private Sub WB_StatusTextChange(ByVal Text As String)
  List1.AddItem "WB_StatusTextChange: " & Text
End Sub

Private Sub WB_TitleChange(ByVal Text As String)
  List1.AddItem "WB_TitleChange: " & Text
End Sub

Private Sub WB_WindowActivate()
  List1.AddItem "WB_WindowsActivate"
End Sub

Private Sub WB_WindowMove()
  List1.AddItem "WB_WindowsMove"
End Sub

Private Sub WB_WindowResize()
  List1.AddItem "WB_WindowsResize"
End Sub
