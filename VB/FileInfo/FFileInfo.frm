VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form FFileInfo 
   Caption         =   "CFileInfo Demonstration"
   ClientHeight    =   5940
   ClientLeft      =   60
   ClientTop       =   360
   ClientWidth     =   8805
   Icon            =   "FFileInfo.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5940
   ScaleWidth      =   8805
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame frmGeneral 
      BackColor       =   &H00C0E0FF&
      BorderStyle     =   0  'None
      Height          =   5175
      Left            =   3240
      TabIndex        =   4
      Top             =   540
      Width           =   5295
      Begin VB.PictureBox picIcon 
         AutoRedraw      =   -1  'True
         BorderStyle     =   0  'None
         Height          =   480
         Left            =   240
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   22
         Top             =   240
         Width           =   480
      End
      Begin VB.Frame frmAttributes 
         BorderStyle     =   0  'None
         Caption         =   "Frame4"
         Enabled         =   0   'False
         Height          =   855
         Left            =   1620
         TabIndex        =   15
         Top             =   4260
         Width           =   3255
         Begin VB.CheckBox chkAttr 
            Caption         =   "&Read-only"
            Height          =   195
            Index           =   0
            Left            =   0
            TabIndex        =   21
            Top             =   0
            Width           =   1335
         End
         Begin VB.CheckBox chkAttr 
            Caption         =   "Ar&chive"
            Height          =   195
            Index           =   1
            Left            =   0
            TabIndex        =   20
            Top             =   300
            Width           =   1335
         End
         Begin VB.CheckBox chkAttr 
            Caption         =   "Co&mpressed"
            Height          =   195
            Index           =   2
            Left            =   0
            TabIndex        =   19
            Top             =   600
            Width           =   1335
         End
         Begin VB.CheckBox chkAttr 
            Caption         =   "Hi&dden"
            Height          =   195
            Index           =   3
            Left            =   1620
            TabIndex        =   18
            Top             =   0
            Width           =   1335
         End
         Begin VB.CheckBox chkAttr 
            Caption         =   "&System"
            Height          =   195
            Index           =   4
            Left            =   1620
            TabIndex        =   17
            Top             =   300
            Width           =   1335
         End
         Begin VB.CheckBox chkAttr 
            Caption         =   "&Temporary"
            Height          =   195
            Index           =   5
            Left            =   1620
            TabIndex        =   16
            Top             =   600
            Width           =   1335
         End
      End
      Begin VB.TextBox txtDosPath 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   14
         Text            =   "txtDosPath"
         Top             =   2580
         Width           =   3435
      End
      Begin VB.TextBox txtDosName 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   13
         Text            =   "txtDosName"
         Top             =   2880
         Width           =   3435
      End
      Begin VB.TextBox txtCreated 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   12
         Text            =   "txtCreated"
         Top             =   3180
         Width           =   3435
      End
      Begin VB.TextBox txtModified 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   11
         Text            =   "txtModified"
         Top             =   3480
         Width           =   3435
      End
      Begin VB.TextBox txtAccessed 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   10
         Text            =   "txtAccessed"
         Top             =   3780
         Width           =   3435
      End
      Begin VB.TextBox txtCompSize 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   9
         Text            =   "txtCompSize"
         Top             =   2040
         Width           =   3435
      End
      Begin VB.TextBox txtSize 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   8
         Text            =   "txtSize"
         Top             =   1740
         Width           =   3435
      End
      Begin VB.TextBox txtLocation 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   7
         Text            =   "txtLocation"
         Top             =   1440
         Width           =   3435
      End
      Begin VB.TextBox txtType 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   6
         Text            =   "txtType"
         Top             =   1140
         Width           =   3435
      End
      Begin VB.TextBox txtFilename 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   5
         Text            =   "txtFilename"
         Top             =   360
         Width           =   3915
      End
      Begin VB.Label lblAttributes 
         AutoSize        =   -1  'True
         Caption         =   "Attributes:"
         Height          =   195
         Left            =   240
         TabIndex        =   32
         Top             =   4260
         Width           =   705
      End
      Begin VB.Label lblDosPath 
         AutoSize        =   -1  'True
         Caption         =   "MS-DOS path:"
         Height          =   195
         Left            =   240
         TabIndex        =   31
         Top             =   2580
         Width           =   1035
      End
      Begin VB.Label lblDosName 
         AutoSize        =   -1  'True
         Caption         =   "MS-DOS name:"
         Height          =   195
         Left            =   240
         TabIndex        =   30
         Top             =   2880
         Width           =   1110
      End
      Begin VB.Label lblCreated 
         AutoSize        =   -1  'True
         Caption         =   "Created:"
         Height          =   195
         Left            =   240
         TabIndex        =   29
         Top             =   3180
         Width           =   600
      End
      Begin VB.Label lblModified 
         AutoSize        =   -1  'True
         Caption         =   "Modified:"
         Height          =   195
         Left            =   240
         TabIndex        =   28
         Top             =   3480
         Width           =   645
      End
      Begin VB.Label lblAccessed 
         AutoSize        =   -1  'True
         Caption         =   "Accessed:"
         Height          =   195
         Left            =   240
         TabIndex        =   27
         Top             =   3780
         Width           =   750
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Compressed Size:"
         Height          =   195
         Left            =   240
         TabIndex        =   26
         Top             =   2040
         Width           =   1260
      End
      Begin VB.Label lblSize 
         AutoSize        =   -1  'True
         Caption         =   "Size:"
         Height          =   195
         Left            =   240
         TabIndex        =   25
         Top             =   1740
         Width           =   345
      End
      Begin VB.Label lblLocation 
         AutoSize        =   -1  'True
         Caption         =   "Location:"
         Height          =   195
         Left            =   240
         TabIndex        =   24
         Top             =   1440
         Width           =   660
      End
      Begin VB.Label lblType 
         AutoSize        =   -1  'True
         Caption         =   "Type:"
         Height          =   195
         Left            =   240
         TabIndex        =   23
         Top             =   1140
         Width           =   405
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000014&
         Index           =   5
         X1              =   240
         X2              =   5100
         Y1              =   4140
         Y2              =   4140
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000010&
         Index           =   4
         X1              =   240
         X2              =   5100
         Y1              =   4080
         Y2              =   4080
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000014&
         Index           =   3
         X1              =   240
         X2              =   5100
         Y1              =   2460
         Y2              =   2460
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000010&
         Index           =   2
         X1              =   240
         X2              =   5100
         Y1              =   2400
         Y2              =   2400
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000014&
         Index           =   1
         X1              =   240
         X2              =   5100
         Y1              =   1020
         Y2              =   1020
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000010&
         Index           =   0
         X1              =   240
         X2              =   5100
         Y1              =   960
         Y2              =   960
      End
   End
   Begin VB.Frame frmVersion 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   0  'None
      Height          =   5175
      Left            =   3420
      TabIndex        =   33
      Top             =   720
      Width           =   5295
      Begin VB.Frame frmVerInfo 
         Caption         =   "Other version information"
         Height          =   3075
         Left            =   240
         TabIndex        =   37
         Top             =   1500
         Width           =   4815
         Begin VB.TextBox txtVerInfo 
            BackColor       =   &H8000000F&
            Height          =   2235
            Left            =   2280
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   39
            Text            =   "FFileInfo.frx":000C
            Top             =   600
            Width           =   2295
         End
         Begin VB.ListBox lstVerInfo 
            Height          =   2220
            IntegralHeight  =   0   'False
            Left            =   240
            Sorted          =   -1  'True
            TabIndex        =   38
            Top             =   600
            Width           =   1935
         End
         Begin VB.Label lblVerValue 
            AutoSize        =   -1  'True
            Caption         =   "Value:"
            Height          =   195
            Left            =   2280
            TabIndex        =   41
            Top             =   360
            Width           =   450
         End
         Begin VB.Label lblVerItem 
            AutoSize        =   -1  'True
            Caption         =   "Item name:"
            Height          =   195
            Left            =   240
            TabIndex        =   40
            Top             =   360
            Width           =   780
         End
      End
      Begin VB.TextBox txtCopyright 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   36
         Text            =   "txtCopyright"
         Top             =   1020
         Width           =   3615
      End
      Begin VB.TextBox txtDescription 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   35
         Text            =   "txtDescription"
         Top             =   600
         Width           =   3615
      End
      Begin VB.TextBox txtFileVer 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   225
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   34
         Text            =   "txtFileVer"
         Top             =   180
         Width           =   3615
      End
      Begin VB.Label lblCopyright 
         AutoSize        =   -1  'True
         Caption         =   "Copyright:"
         Height          =   195
         Left            =   240
         TabIndex        =   44
         Top             =   1020
         Width           =   705
      End
      Begin VB.Label lblDescription 
         AutoSize        =   -1  'True
         Caption         =   "Description:"
         Height          =   195
         Left            =   240
         TabIndex        =   43
         Top             =   600
         Width           =   840
      End
      Begin VB.Label lblFileVer 
         AutoSize        =   -1  'True
         Caption         =   "File version::"
         Height          =   195
         Left            =   240
         TabIndex        =   42
         Top             =   180
         Width           =   885
      End
   End
   Begin ComctlLib.TabStrip tabInfo 
      Height          =   5655
      Left            =   3300
      TabIndex        =   45
      Top             =   120
      Width           =   5355
      _ExtentX        =   9446
      _ExtentY        =   9975
      _Version        =   327682
      BeginProperty Tabs {0713E432-850A-101B-AFC0-4210102A8DA7} 
         NumTabs         =   2
         BeginProperty Tab1 {0713F341-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "General"
            Key             =   "General"
            Object.Tag             =   ""
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {0713F341-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Version"
            Key             =   "Version"
            Object.Tag             =   ""
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame1 
      Caption         =   " Select a File "
      Height          =   5715
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   2955
      Begin VB.DirListBox Dir1 
         Height          =   1890
         Left            =   180
         TabIndex        =   3
         Top             =   3120
         Width           =   2595
      End
      Begin VB.DriveListBox Drive1 
         Height          =   315
         Left            =   180
         TabIndex        =   2
         Top             =   5220
         Width           =   2595
      End
      Begin VB.FileListBox File1 
         Height          =   2625
         Hidden          =   -1  'True
         Left            =   180
         System          =   -1  'True
         TabIndex        =   1
         Top             =   300
         Width           =   2595
      End
   End
End
Attribute VB_Name = "FFileInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' *********************************************************************
'  Copyright ©1995-2001 Karl E. Peterson, All Rights Reserved
'  http://www.mvps.org/vb
' *********************************************************************
'  You are free to use this code within your own applications, but you
'  are expressly forbidden from selling or otherwise distributing this
'  source code without prior written consent.
' *********************************************************************
Option Explicit

Private Declare Function DrawIcon Lib "user32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal hIcon As Long) As Long

Private Const attrReadOnly = 0
Private Const attrArchive = 1
Private Const attrCompressed = 2
Private Const attrHidden = 3
Private Const attrSystem = 4
Private Const attrTemporary = 5

Private m_UserFile As String
Private m_fi As CFileInfo
Private m_vi As CFileVersionInfo

Private Sub Dir1_Change()
   File1.Path = Dir1.Path
End Sub

Private Sub Drive1_Change()
   Dir1.Path = Drive1.Drive
End Sub

Private Sub File1_Click()
   With File1
      If Right(.Path, 1) = "\" Then
         m_UserFile = .Path & .FileName
      Else
         m_UserFile = .Path & "\" & .FileName
      End If
   End With
   Call UpdateInfo(m_UserFile)
End Sub

Private Sub File1_PathChange()
   If File1.ListCount Then
      File1.ListIndex = 0
   Else
      m_UserFile = Dir1.Path
      Call UpdateInfo(m_UserFile)
   End If
End Sub

Private Sub Form_Load()
   Dim i As Long
   '
   ' Set initial dirspec
   '
   Drive1.Drive = Environ("windir")
   Dir1.Path = Environ("windir")
   '
   ' Adjust 3d lines
   '
   For i = 1 To 5 Step 2
      Line1(i).Y1 = Line1(i - 1).Y1 + Screen.TwipsPerPixelY
      Line1(i).Y2 = Line1(i).Y1
   Next i
   '
   ' Make sure picture for icon is properly sized.
   '
   picIcon.Width = 32 * Screen.TwipsPerPixelX
   picIcon.Height = 32 * Screen.TwipsPerPixelY
   '
   ' Fill version info listbox
   '
   lstVerInfo.AddItem "Company Name"
   lstVerInfo.AddItem "Description"
   lstVerInfo.AddItem "Internal Name"
   lstVerInfo.AddItem "Language"
   lstVerInfo.AddItem "Legal Copyright"
   lstVerInfo.AddItem "Legal Trademarks"
   lstVerInfo.AddItem "Original Filename"
   lstVerInfo.AddItem "Product Name"
   lstVerInfo.AddItem "Product Version"
   '
   ' Position frames within tab
   '
   With tabInfo
      frmGeneral.Move .ClientLeft, .ClientTop, .ClientWidth, .ClientHeight
      frmVersion.Move .ClientLeft, .ClientTop, .ClientWidth, .ClientHeight
   End With
   frmGeneral.BackColor = Me.BackColor
   frmVersion.BackColor = Me.BackColor
   frmVersion.Visible = False
End Sub

Private Sub lstVerInfo_Click()
   If Not (m_vi Is Nothing) Then
      txtVerInfo.Text = _
         m_vi.PredefinedValue( _
            lstVerInfo.ItemData(lstVerInfo.ListIndex) _
         )
   End If
End Sub

Private Sub tabInfo_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
   ' Shift tabs on MouseDown, rather than default of MouseUp
   If tabInfo.Tabs("General").Selected Then
      frmVersion.Visible = True
      frmGeneral.Visible = False
   Else
      frmVersion.Visible = False
      frmGeneral.Visible = True
   End If
End Sub

Private Sub UpdateInfo(ByVal fil As String)
   Dim i As Long
   '
   ' Set current tab.
   '
   tabInfo.Tabs("General").Selected = True
   frmVersion.Visible = False
   frmGeneral.Visible = True
   '
   ' Update all attribute information using intentionally
   ' mis-cased copy of m_UserFile
   '
   fil = UCase(fil)
   Set m_fi = New CFileInfo
   m_fi.FullPathName = fil
   '
   ' Fill controls with attributes.
   '
   txtFilename.Text = m_fi.DisplayName
   txtType.Text = m_fi.TypeName
   txtLocation = m_fi.FilePath
   txtSize.Text = m_fi.FormatFileSize(m_fi.FileSize)
   If m_fi.attrCompressed Then
      txtCompSize.Text = m_fi.FormatFileSize(m_fi.CompressedFileSize)
   Else
      txtCompSize.Text = "File is not compressed"
   End If
   txtDosPath.Text = m_fi.ShortPath
   txtDosName.Text = m_fi.ShortName
   txtCreated.Text = m_fi.FormatFileDate(m_fi.CreationTime)
   txtModified.Text = m_fi.FormatFileDate(m_fi.ModifyTime)
   txtAccessed.Text = m_fi.FormatFileDate(m_fi.LastAccessTime)
   chkAttr(attrReadOnly).Value = Abs(m_fi.attrReadOnly)
   chkAttr(attrArchive).Value = Abs(m_fi.attrArchive)
   chkAttr(attrCompressed).Value = Abs(m_fi.attrCompressed)
   chkAttr(attrHidden).Value = Abs(m_fi.attrHidden)
   chkAttr(attrSystem).Value = Abs(m_fi.attrSystem)
   chkAttr(attrTemporary).Value = Abs(m_fi.attrTemporary)
   '
   ' Display associated icon.
   '
   picIcon.Cls
   Call DrawIcon(picIcon.hdc, 0, 0, m_fi.hIcon)
   '
   ' Update version information
   '
   Set m_vi = New CFileVersionInfo
   m_vi.FullPathName = m_fi.FullPathName
   If m_vi.Available Then
      If tabInfo.Tabs.Count = 1 Then
         tabInfo.Tabs.Add 2, "Version", "Version"
      End If
      txtFileVer.Text = m_vi.FileVersion
      txtDescription.Text = m_vi.FileDescription
      txtCopyright.Text = m_vi.LegalCopyright
      '
      ' Fill version info listbox
      '
      With lstVerInfo
         .Clear
         For i = viPredefinedFirst To viPredefinedLast
            Select Case i
               Case viFileDescription, viFileVersion, viLegalCopyright
                  ' These get special labels of their own
               Case Else
                  If Len(m_vi.PredefinedValue(i)) Then
                     .AddItem m_vi.PredefinedName(i)
                     .ItemData(.NewIndex) = i
                  End If
            End Select
         Next i
         If .ListCount Then
            .ListIndex = 0
            lstVerInfo_Click
         End If
      End With
   Else
      If tabInfo.Tabs.Count > 1 Then
         tabInfo.Tabs.Remove 2
      End If
   End If
End Sub

