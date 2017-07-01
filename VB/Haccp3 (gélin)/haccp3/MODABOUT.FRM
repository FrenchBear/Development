VERSION 4.00
Begin VB.Form formAboutBox 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4050
   ClientLeft      =   2010
   ClientTop       =   1560
   ClientWidth     =   5595
   BeginProperty Font 
      name            =   "System"
      charset         =   1
      weight          =   700
      size            =   9.75
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   4455
   Icon            =   "MODABOUT.frx":0000
   Left            =   1950
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   270
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   373
   Top             =   1215
   Width           =   5715
   Begin Threed.SSPanel Panel3D2 
      Height          =   1410
      Left            =   1170
      TabIndex        =   17
      Top             =   1845
      Width           =   4305
      _version        =   65536
      _extentx        =   7594
      _extenty        =   2487
      _stockprops     =   15
      backcolor       =   -2147483633
      BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      bevelouter      =   0
      bevelinner      =   1
      Begin VB.Label Lbl_Infovalues 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   975
         Left            =   1380
         TabIndex        =   1
         Top             =   225
         Width           =   2835
      End
      Begin VB.Label Lbl_Info 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   975
         Left            =   120
         TabIndex        =   5
         Top             =   225
         Width           =   1215
      End
   End
   Begin VB.PictureBox Photos 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   4
      Left            =   7920
      ScaleHeight     =   1425
      ScaleWidth      =   1020
      TabIndex        =   2
      Top             =   5040
      Visible         =   0   'False
      Width           =   1050
   End
   Begin VB.PictureBox Photos 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   3
      Left            =   7920
      ScaleHeight     =   1425
      ScaleWidth      =   1020
      TabIndex        =   10
      Top             =   4920
      Visible         =   0   'False
      Width           =   1050
   End
   Begin VB.PictureBox Photos 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   2
      Left            =   7920
      ScaleHeight     =   1425
      ScaleWidth      =   1020
      TabIndex        =   3
      Top             =   4800
      Visible         =   0   'False
      Width           =   1050
   End
   Begin VB.PictureBox Photos 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   1
      Left            =   7920
      ScaleHeight     =   1425
      ScaleWidth      =   1020
      TabIndex        =   4
      Top             =   3795
      Visible         =   0   'False
      Width           =   1050
   End
   Begin VB.CommandButton Info 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Versions..."
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   8
      Top             =   3360
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CommandButton BTN_OK 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   2160
      TabIndex        =   0
      Top             =   3480
      Width           =   1335
   End
   Begin VB.ListBox Versions 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         name            =   "Courier"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   360
      TabIndex        =   9
      Top             =   3360
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Timer Minuterie1 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   150
      Top             =   1080
   End
   Begin VB.PictureBox Photos 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   0
      Left            =   7920
      Picture         =   "MODABOUT.frx":000C
      ScaleHeight     =   1425
      ScaleWidth      =   1020
      TabIndex        =   7
      Top             =   2760
      Visible         =   0   'False
      Width           =   1050
   End
   Begin Threed.SSPanel Panel3D1 
      Height          =   1185
      Left            =   1185
      TabIndex        =   13
      Top             =   195
      Width           =   4320
      _version        =   65536
      _extentx        =   7620
      _extenty        =   2090
      _stockprops     =   15
      caption         =   "Panel3D1"
      backcolor       =   -2147483633
      BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      bevelinner      =   1
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   1035
         Left            =   80
         ScaleHeight     =   1035
         ScaleWidth      =   4155
         TabIndex        =   14
         Top             =   80
         Width           =   4155
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            Caption         =   "W"
            BeginProperty Font 
               name            =   "Arial"
               charset         =   1
               weight          =   700
               size            =   12
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   285
            Left            =   1830
            TabIndex        =   16
            Top             =   240
            Width           =   255
         End
         Begin VB.Label Label3 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            Caption         =   "V"
            BeginProperty Font 
               name            =   "Arial"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000FF&
            Height          =   240
            Left            =   1875
            TabIndex        =   15
            Top             =   585
            Width           =   165
         End
      End
   End
   Begin Threed.SSPanel Panel3D3 
      Height          =   690
      Left            =   240
      TabIndex        =   6
      Top             =   195
      Width           =   675
      _version        =   65536
      _extentx        =   1191
      _extenty        =   1217
      _stockprops     =   15
      backcolor       =   -2147483633
      BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      bevelouter      =   1
      bevelinner      =   2
      Begin VB.PictureBox PIC_Icon 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         BorderStyle     =   0  'None
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   480
         Left            =   75
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   11
         Top             =   90
         Width           =   480
      End
   End
   Begin VB.Label Etiquette1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Copyright @ 1994-1996 ERCEM / CITPPM"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Index           =   4
      Left            =   1320
      TabIndex        =   12
      Top             =   1560
      Width           =   3975
   End
   Begin VB.Image Photo 
      Appearance      =   0  'Flat
      Height          =   1455
      Left            =   0
      Top             =   1800
      Width           =   1050
   End
End
Attribute VB_Name = "formAboutBox"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit
DefInt A-Z

Private Declare Function GetWinFlags Lib "Kernel" () As Long
Private Declare Function GetFreeSpace Lib "Kernel" (ByVal wFlags) As Long
Private Declare Function GetFreeSystemResources Lib "kernel.exe" (ByVal i%) As Integer
Private Declare Function CheckSum Lib "checksum.dll" (ByVal Filename$, ByVal CheckSum$) As Long

Const WF_STANDARD = &H10
Const WF_ENHANCED = &H20
Const WF_80x87 = &H400
Const WF_CPU286 = &H2
Const WF_CPU386 = &H4
Const WF_CPU486 = &H8

Dim Label2Left As Integer, Label3Left As Integer
Dim OkClique As Integer

Private Sub btn_ok_Click()

    While Label2.Left <= 4000
        Label2.Left = Label2.Left + 50
        Label3.Left = Label3.Left - 50
        WaitForEventsToFinish 1
    Wend

    OkClique = 1
    Unload Me

End Sub

Private Sub BTN_OK_GotFocus()
    Dim i As Integer
    
    ' Make the labels slide into the picture box.  Call
    ' the WaitForEventsToFinish subroutine to allow
    ' repainting of the labels.
    While Label2.Left <= Label2Left
        Label2.Left = Label2.Left + 25
        If Label3.Left > Label3Left Then
            Label3.Left = Label3.Left - 25
        End If
        WaitForEventsToFinish 1
        If OkClique Then
            Unload Me
            Exit Sub
        End If
    Wend


End Sub

Private Sub BTN_OK_KeyPress(KeyAscii As Integer)
    ' Entering any key has the same effect as clicking
    ' on the OK button.
    btn_ok_Click
End Sub

Private Sub defile_chaine(chaine As String)

Dim cr As Integer

    Label3.Left = 4000
    Label3.Caption = chaine
    Minuterie1.Enabled = -1
    While Label3.Left >= -Label3.Width And Minuterie1.Enabled
        cr = DoEvents()
    Wend
    Minuterie1.Enabled = 0
    
End Sub

Private Sub Form_Load()
    
Dim WinFlags As Long
Dim Mode As String, CoProcessor As String, Processor As String

    OkClique = 0

    ' Force the labels to be displayed outside the
    ' picture box.
    Label2.Caption = NomApplication
    Label2Left = (Picture1.Width - Label2.Width) / 2
    Label3.Caption = " " + VERSION_APPLICATION
    Label3Left = (Picture1.Width - Label3.Width) / 2
    Label2.Left = -2500
    Label3.Left = 5000
    
    ' Center the AboutBox on the screen
    '
     Move (Screen.Width - Width) \ 2, (Screen.Height - Height) \ 2

    ' Get current Windows configuration
    '
    WinFlags = GetWinFlags()

    ' Display configuration values in Lbl_Info.Caption and Lbl_InfoValues.Caption
    ' (NOTE: CRLF variable causes a line break in a labels caption)
    '
    'If WinFlags And WF_ENHANCED Then Mode = "386 Enhanced Mode" Else Mode = "Standard Mode"
    
    Lbl_Info.Caption = "Memoire libre:" + Chr$(13) + Chr$(10) + "" + Chr$(13) + Chr$(10) + "Réalisation:" + Chr$(13) + Chr$(10) + "e-mail:"

    'If WinFlags And WF_80x87 Then CoProcessor = "Present" Else CoProcessor = "Absent"
    'If WinFlags And WF_CPU486 Then Processor = "486" Else If WinFlags And WF_CPU386 Then Processor = "386" Else If WinFlags And WF_CPU286 Then Processor = "286"
    
    Lbl_InfoValues.Caption = Format$(GetFreeSpace(0) \ 1024) + " KB" + Chr$(13) + Chr$(10) + "" + Chr$(13) + Chr$(10) + "Jérôme Gelin" + Chr$(13) + Chr$(10) + "100417.140@compuserve.com"
    HourGlass "Hide"

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode = vbFormControlMenu Then
        btn_ok_Click
    End If
End Sub

Private Sub Info_Click()

Dim i As Integer, X As Integer
Dim mess As String, fic As String
Dim chaine As String * 40

    HourGlass "Show"
    If right$(Info.Caption, 1) = "." Then

        Dim CSum As Long
        Dim TailleFichier As Long

        'remplit la list-box des versions des différents fichiers
        Versions.Clear
        
        fic$ = NOM_MODULE_EXE
        TailleFichier = CheckSum(RepertoireApplication & "\" & fic$, chaine)
        Versions.AddItem fic$ + Space$(12 - Len(fic$)) + "=" + UCase$(Left(chaine, InStr(chaine, String$(1, 0)) - 1))
    
        'Versions.Top = Panel.Top + 50
        'Versions.Left = Panel.Left + 50
        'Versions.Width = Panel.Width - 100
        'Versions.Height = Panel.Height - 100
        'Versions.Visible = True
        Info.Caption = "Imprimer"
    Else
    
        Printer.Print NomApplication, VERSION_APPLICATION
        Printer.Print
        For i% = 0 To Versions.ListCount
            Printer.Print Versions.List(i%)
        Next
        Printer.EndDoc

    End If
    HourGlass "Hide"
    
End Sub

Private Sub Minuterie1_Timer()

    Label3.Left = Label3.Left - 100

End Sub

Private Sub PIC_Icon_MouseUp(bouton As Integer, Maj As Integer, X As Single, Y As Single)

    If bouton = 1 And Maj = 6 Then

        If Versions.Visible Then
            Versions.Visible = False
            'Panel.Visible = True
            Info.Caption = "Infos..."
        End If

        defile_chaine "Version WINDOWS de HACCP 3 réalisée par : "
        Photo.Picture = Photos(0).Picture
        defile_chaine " Jérôme Gelin"
        'Photo.Picture = Photos(1).Picture
        'defile_chaine " "
        'Photo.Picture = Photos(2).Picture
        'defile_chaine " "
        'Photo.Picture = Photos(3).Picture
        'defile_chaine " "
        'Photo.Picture = Photos(4).Picture
        'defile_chaine " "
        Photo.Picture = LoadPicture()
        defile_chaine "Langage utilisé: Microsoft Visual Basic 3.0 avec Graph2D VBX"
        
    End If

End Sub

Private Sub WaitForEventsToFinish(NbrTimes As Integer)
    Dim i As Integer

    For i = 1 To NbrTimes
        DoEvents
    Next i
End Sub

