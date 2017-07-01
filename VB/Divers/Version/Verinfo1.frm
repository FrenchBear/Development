VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "VerInfo Demo"
   ClientHeight    =   4290
   ClientLeft      =   2340
   ClientTop       =   2160
   ClientWidth     =   3855
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
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   17.875
   ScaleMode       =   4  'Character
   ScaleWidth      =   32.125
   Begin VB.DriveListBox Drive1 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   1830
      TabIndex        =   7
      Top             =   3795
      Width           =   1905
   End
   Begin VB.DirListBox Dir1 
      Appearance      =   0  'Flat
      Height          =   2055
      Left            =   1830
      TabIndex        =   5
      Top             =   1305
      Width           =   1890
   End
   Begin VB.FileListBox File1 
      Appearance      =   0  'Flat
      Height          =   3150
      Left            =   120
      TabIndex        =   3
      Top             =   984
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   288
      Left            =   1092
      TabIndex        =   1
      Text            =   "*.*"
      Top             =   204
      Width           =   2544
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Dri&ves:"
      ForeColor       =   &H80000008&
      Height          =   210
      Index           =   4
      Left            =   1830
      TabIndex        =   6
      Top             =   3480
      Width           =   660
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Directories:"
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   3
      Left            =   1830
      TabIndex        =   4
      Top             =   990
      Width           =   1230
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "c:\"
      ForeColor       =   &H80000008&
      Height          =   204
      Index           =   2
      Left            =   1830
      TabIndex        =   8
      Top             =   648
      Width           =   1884
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Files:"
      ForeColor       =   &H80000008&
      Height          =   204
      Index           =   0
      Left            =   120
      TabIndex        =   2
      Top             =   648
      Width           =   612
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "File&Name:"
      ForeColor       =   &H80000008&
      Height          =   204
      Index           =   1
      Left            =   120
      TabIndex        =   0
      Top             =   252
      Width           =   936
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Dir1_Change()
   File1.Path = Dir1.Path
   Label1(2).Caption = File1.Path
End Sub

Private Sub DisplayVerInfo()
   '*** Get Version Info ****

   Filename = File1.List(File1.ListIndex)
   Directory = Label1(2).Caption
   FullFileName = Label1(2).Caption + "\" + Filename$

   Dim rc                As Long
   Dim lDummy            As Long
   Dim sBuffer()         As Byte
   Dim lBufferLen        As Long
   Dim lVerPointer       As Long
   Dim udtVerBuffer      As VS_FIXEDFILEINFO
   Dim lVerbufferLen     As Long


   '*** Get size ****
   lBufferLen = GetFileVersionInfoSize(FullFileName, lDummy)
   If lBufferLen < 1 Then
      MsgBox "No Version Info available!"
      Exit Sub
   End If

   '**** Store info to udtVerBuffer struct ****
   ReDim sBuffer(lBufferLen)
   rc = GetFileVersionInfo(FullFileName, 0&, lBufferLen, sBuffer(0))
   rc = VerQueryValue(sBuffer(0), "\", lVerPointer, lVerbufferLen)
   MoveMemory udtVerBuffer, lVerPointer, Len(udtVerBuffer)

   '**** Determine Structure Version number - NOT USED ****
   StrucVer = Format$(udtVerBuffer.dwStrucVersionh) & "." & _
      Format$(udtVerBuffer.dwStrucVersionl)

   '**** Determine File Version number ****
   FileVer = Format$(udtVerBuffer.dwFileVersionMSh) & "." & _
      Format$(udtVerBuffer.dwFileVersionMSl) & "." & _
      Format$(udtVerBuffer.dwFileVersionLSh) & "." & _
      Format$(udtVerBuffer.dwFileVersionLSl)

   '**** Determine Product Version number ****
   ProdVer = Format$(udtVerBuffer.dwProductVersionMSh) & "." & _
      Format$(udtVerBuffer.dwProductVersionMSl) & "." & _
      Format$(udtVerBuffer.dwProductVersionLSh) & "." & _
      Format$(udtVerBuffer.dwProductVersionLSl)

   '**** Determine Boolean attributes of File ****
   FileFlags = ""
   If udtVerBuffer.dwFileFlags And VS_FF_DEBUG _
      Then FileFlags = "Debug "
   If udtVerBuffer.dwFileFlags And VS_FF_PRERELEASE _
      Then FileFlags = FileFlags & "PreRel "
   If udtVerBuffer.dwFileFlags And VS_FF_PATCHED _
      Then FileFlags = FileFlags & "Patched "
   If udtVerBuffer.dwFileFlags And VS_FF_PRIVATEBUILD _
      Then FileFlags = FileFlags & "Private "
   If udtVerBuffer.dwFileFlags And VS_FF_INFOINFERRED _
      Then FileFlags = FileFlags & "Info "
   If udtVerBuffer.dwFileFlags And VS_FF_SPECIALBUILD _
      Then FileFlags = FileFlags & "Special "
   If udtVerBuffer.dwFileFlags And VFT2_UNKNOWN _
      Then FileFlags = FileFlags + "Unknown "

   '**** Determine OS for which file was designed ****
   Select Case udtVerBuffer.dwFileOS
      Case VOS_DOS_WINDOWS16
        FileOS = "DOS-Win16"
      Case VOS_DOS_WINDOWS32
        FileOS = "DOS-Win32"
      Case VOS_OS216_PM16
        FileOS = "OS/2-16 PM-16"
      Case VOS_OS232_PM32
        FileOS = "OS/2-16 PM-32"
      Case VOS_NT_WINDOWS32
        FileOS = "NT-Win32"
      Case other
        FileOS = "Unknown"
   End Select
   Select Case udtVerBuffer.dwFileType
      Case VFT_APP
         FileType = "App"
      Case VFT_DLL
         FileType = "DLL"
      Case VFT_DRV
         FileType = "Driver"
         Select Case udtVerBuffer.dwFileSubtype
            Case VFT2_DRV_PRINTER
               FileSubType = "Printer drv"
            Case VFT2_DRV_KEYBOARD
               FileSubType = "Keyboard drv"
            Case VFT2_DRV_LANGUAGE
               FileSubType = "Language drv"
            Case VFT2_DRV_DISPLAY
               FileSubType = "Display drv"
            Case VFT2_DRV_MOUSE
               FileSubType = "Mouse drv"
            Case VFT2_DRV_NETWORK
               FileSubType = "Network drv"
            Case VFT2_DRV_SYSTEM
               FileSubType = "System drv"
            Case VFT2_DRV_INSTALLABLE
               FileSubType = "Installable"
            Case VFT2_DRV_SOUND
               FileSubType = "Sound drv"
            Case VFT2_DRV_COMM
               FileSubType = "Comm drv"
            Case VFT2_UNKNOWN
               FileSubType = "Unknown"
         End Select
      Case VFT_FONT
         FileType = "Font"
         Select Case udtVerBuffer.dwFileSubtype
            Case VFT_FONT_RASTER
               FileSubType = "Raster Font"
            Case VFT_FONT_VECTOR
               FileSubType = "Vector Font"
            Case VFT_FONT_TRUETYPE
               FileSubType = "TrueType Font"
         End Select
      Case VFT_VXD
         FileType = "VxD"
      Case VFT_STATIC_LIB
         FileType = "Lib"
      Case Else
         FileType = "Unknown"
   End Select
   Form2.Show 1
End Sub

Private Sub Drive1_Change()
   Dir1.Path = Drive1.Drive
   File1.Path = Dir1.Path
   Label1(2).Caption = File1.Path
End Sub

Private Sub File1_Click()
   Text1.Text = File1.List(File1.ListIndex)
End Sub

Private Sub File1_DblClick()
   DisplayVerInfo
End Sub

Private Sub File1_PathChange()
   Text1.Text = "*.*"
   File1.Pattern = "*.*"
End Sub

Private Sub Form_Load()
   Dim Buffer As String
   Dim rc As Long

   ' **** Set Default Dir to Windows System Subdirectory ****
   Buffer = Space$(256)
   rc = GetSystemDirectory(Buffer, Len(Buffer))
   Buffer = LCase$(Mid$(Buffer, 1, InStr(Buffer, Chr(0)) - 1))
   Dir1.Path = Buffer
   File1.Path = Buffer
   Drive1.Drive = Left$(Buffer, 1)
End Sub

Private Sub Form_Unload(Cancel As Integer)
   End
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
   If KeyAscii = 13 Then
      File1.Pattern = Text1.Text
      KeyAscii = 0
      If File1.ListCount = 1 Then DisplayVerInfo
      If File1.ListCount = 0 Then
         MsgBox "Invalid Filename"
         File1.Pattern = "*.*"
         Text1.Text = "*.*"
      End If
      File1.SetFocus
   End If
End Sub
