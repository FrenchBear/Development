VERSION 5.00
Begin VB.Form frmSysSnd 
   Caption         =   "Sounding Out!"
   ClientHeight    =   7875
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5460
   LinkTopic       =   "Form1"
   ScaleHeight     =   7875
   ScaleWidth      =   5460
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame4 
      Caption         =   "All Named System Sounds"
      Height          =   3855
      Left            =   120
      TabIndex        =   16
      Top             =   3900
      Width           =   5175
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   180
         Locked          =   -1  'True
         TabIndex        =   20
         Text            =   "Text4"
         Top             =   3120
         Width           =   3735
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Only Show Assigned Sounds"
         Height          =   255
         Left            =   180
         TabIndex        =   19
         Top             =   3480
         Width           =   2715
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Play"
         Height          =   315
         Left            =   4080
         TabIndex        =   18
         Top             =   360
         Width           =   855
      End
      Begin VB.ListBox List1 
         Height          =   2700
         IntegralHeight  =   0   'False
         Left            =   180
         TabIndex        =   17
         Top             =   360
         Width           =   3735
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Predefined System Sounds"
      Height          =   1275
      Left            =   120
      TabIndex        =   8
      Top             =   2520
      Width           =   5175
      Begin VB.CommandButton Command4 
         Caption         =   "Play"
         Height          =   315
         Left            =   4080
         TabIndex        =   15
         Top             =   300
         Width           =   855
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Windows Exit"
         Height          =   255
         Index           =   5
         Left            =   2160
         TabIndex        =   14
         Top             =   900
         Width           =   1755
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Windows Start"
         Height          =   255
         Index           =   4
         Left            =   2160
         TabIndex        =   13
         Top             =   600
         Width           =   1755
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Critical Stop"
         Height          =   255
         Index           =   3
         Left            =   2160
         TabIndex        =   12
         Top             =   300
         Width           =   1755
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Question"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   11
         Top             =   900
         Width           =   1755
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Exclamation"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   10
         Top             =   600
         Width           =   1755
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Asterisk"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   9
         Top             =   300
         Width           =   1755
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Wave File"
      Height          =   795
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   5175
      Begin VB.CommandButton Command3 
         Caption         =   "Play"
         Height          =   315
         Left            =   4080
         TabIndex        =   7
         Top             =   300
         Width           =   855
      End
      Begin VB.TextBox Text3 
         Height          =   315
         Left            =   180
         TabIndex        =   6
         Text            =   "Text3"
         Top             =   300
         Width           =   3735
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Midi Files"
      Height          =   1275
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5175
      Begin VB.TextBox Text2 
         Height          =   315
         Left            =   180
         TabIndex        =   3
         Text            =   "Text2"
         Top             =   780
         Width           =   3735
      End
      Begin VB.TextBox Text1 
         Height          =   315
         Left            =   180
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   300
         Width           =   3735
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Play"
         Height          =   315
         Left            =   4080
         TabIndex        =   2
         Top             =   300
         Width           =   855
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Play"
         Height          =   315
         Left            =   4080
         TabIndex        =   4
         Top             =   780
         Width           =   855
      End
   End
End
Attribute VB_Name = "frmSysSnd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Private m_MidiFile1 As String
Private m_MidiFile2 As String
Private m_WaveFile As String
Private m_SysSnds() As SystemSoundDefinitions
Private m_Media As String

Private Sub Check1_Click()
   Call FillList
End Sub

Private Sub Command1_Click()
   Const Alias = "tune1"
   m_MidiFile1 = Text1.Text
   With Command1
      .Enabled = False
      If .Caption = "Play" Then
         If PlayMidiFile(m_MidiFile1, Alias) Then
            .Caption = "Stop"
         End If
      Else
         Call StopMidiFile(Alias)
         .Caption = "Play"
      End If
      .Enabled = True
   End With
End Sub

Private Sub Command2_Click()
   Const Alias = "tune2"
   m_MidiFile2 = Text2.Text
   With Command2
      .Enabled = False
      If .Caption = "Play" Then
         If PlayMidiFile(m_MidiFile2, Alias) Then
            .Caption = "Stop"
         End If
      Else
         Call StopMidiFile(Alias)
         .Caption = "Play"
      End If
      .Enabled = True
   End With
End Sub

Private Sub Command3_Click()
   m_WaveFile = Text3.Text
   Call PlaySoundFile(m_WaveFile)
End Sub

Private Sub Command4_Click()
   Call PlaySoundSystem(Frame3.Tag)
End Sub

Private Sub Command5_Click()
   Call PlayList
End Sub

Private Sub Form_Load()
   m_Media = Space$(260)
   Call GetWindowsDirectory(m_Media, Len(m_Media))
   m_Media = Left(m_Media, InStr(m_Media, vbNullChar) - 1) & "\Media\"
   m_MidiFile1 = m_Media & "canyon.mid"
   m_MidiFile2 = m_Media & "passport.mid"
   m_WaveFile = m_Media & "The Microsoft Sound.wav"
   
   Text1.Text = m_MidiFile1
   Text2.Text = m_MidiFile2
   Text3.Text = m_WaveFile
   Option1(0).Value = True
   Frame4.Tag = Frame4.Caption
   Check1.Value = vbChecked
   
   Me.Icon = Nothing
End Sub

Private Sub List1_Click()
   Text4.Text = m_SysSnds(List1.ItemData(List1.ListIndex)).Current
   Frame4.Caption = Frame4.Tag & " (" & m_SysSnds(List1.ItemData(List1.ListIndex)).GroupName & ")"
End Sub

Private Sub List1_DblClick()
   Text4.Text = m_SysSnds(List1.ItemData(List1.ListIndex)).Current
   Frame4.Caption = Frame4.Tag & " (" & m_SysSnds(List1.ItemData(List1.ListIndex)).GroupName & ")"
   Call PlayList
End Sub

Private Sub Option1_Click(Index As Integer)
   Frame3.Tag = Index + 1
End Sub

Private Sub PlayList()
   Dim snd As String
   snd = m_SysSnds(List1.ItemData(List1.ListIndex)).Current
   If InStr(snd, ":") = 0 Then
      snd = m_Media & snd
   End If
   Call PlaySoundFile(snd)
End Sub

Private Sub FillList()
   Dim i As Long
   Dim Filter As Boolean
   
   ReDim m_SysSnds(0) As SystemSoundDefinitions
   If SystemSoundNames(m_SysSnds) Then
      Filter = CBool(Check1.Value)
      Text4.Text = ""
      With List1
         .Clear
         For i = LBound(m_SysSnds) To UBound(m_SysSnds)
            If Filter Then
               If m_SysSnds(i).Current <> "" Then
                  .AddItem m_SysSnds(i).SoundName
                  .ItemData(.NewIndex) = i
               End If
            Else
               .AddItem m_SysSnds(i).SoundName
               .ItemData(.NewIndex) = i
            End If
         Next i
         .ListIndex = 0
      End With
   End If
End Sub
