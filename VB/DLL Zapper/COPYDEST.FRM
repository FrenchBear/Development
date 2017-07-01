VERSION 5.00
Begin VB.Form frmCopyDest 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Destination"
   ClientHeight    =   3120
   ClientLeft      =   1770
   ClientTop       =   2925
   ClientWidth     =   5160
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3120
   ScaleWidth      =   5160
   Begin VB.CommandButton cmdCancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   240
      TabIndex        =   6
      Top             =   2520
      Width           =   1335
   End
   Begin VB.CommandButton cmdOk 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      TabIndex        =   5
      Top             =   2520
      Width           =   1335
   End
   Begin VB.Frame frmOpt 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Options"
      ForeColor       =   &H80000008&
      Height          =   1575
      Left            =   240
      TabIndex        =   2
      Top             =   720
      Width           =   2415
      Begin VB.OptionButton optMove 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Move"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   720
         Width           =   855
      End
      Begin VB.OptionButton optCopy 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Copy"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.DirListBox Dir1 
      Appearance      =   0  'Flat
      Height          =   2055
      Left            =   2880
      TabIndex        =   1
      Top             =   240
      Width           =   2055
   End
   Begin VB.DriveListBox Drive1 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2415
   End
End
Attribute VB_Name = "frmCopyDest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOk_Click()
On Error Resume Next
Dim p As String, E As Integer, Dest As String
Dim Target As String

    E = False
    p = Filepath(glbFilename)
    'At least copy is selected, so copy the file
    If Right$(Dir1.Path, 1) <> "\" Then
        Target = Dir1.Path & "\"
    Else
        Target = Dir1.Path
    End If
    If Target <> Filepath(glbFilename) Then
        Dest = Target & Right$(glbFilename, Len(glbFilename) - Len(p))
        FileCopy glbFilename, Dest
        If Err > 0 Then
            E = True
            MsgBox "Unable to delete file"
        End If
    Else
        MsgBox "Source and destination directories must be different"
        E = True
    End If
    If Not E Then
        If optCopy.Value Then  ' Only want copy
            glbFilename = "C" & Dest
        Else
            'Try and delete the file
            If DeleteFile(glbFilename) Then
                glbFilename = "M" & Dest ' Success
            Else
                glbFilename = "C" & Dest ' Copying only was achieved
            End If
        End If
        Unload Me
    End If
End Sub

Private Sub Drive1_Change()
    Dir1.Path = Drive1.Drive
End Sub

Private Sub Form_Load()
    'Center myself
    Me.Left = (frmMain.Width - Me.Width) \ 2 + frmMain.Left
    Me.Top = ((frmMain.Height - Me.Height) \ 2) + frmMain.Top
End Sub

