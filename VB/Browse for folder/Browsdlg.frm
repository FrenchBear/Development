VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Browse for Folder demo"
   ClientHeight    =   5640
   ClientLeft      =   1365
   ClientTop       =   2055
   ClientWidth     =   9510
   ClipControls    =   0   'False
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   376
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   634
   Begin VB.Frame fraRtnVals 
      Caption         =   "Return values"
      Height          =   2655
      Left            =   6540
      TabIndex        =   47
      Top             =   2850
      Width           =   2835
      Begin VB.PictureBox pic32Icon 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ClipControls    =   0   'False
         ForeColor       =   &H80000008&
         Height          =   480
         Left            =   1260
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   54
         TabStop         =   0   'False
         Top             =   2100
         Width           =   480
      End
      Begin VB.PictureBox pic16Icon 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ClipControls    =   0   'False
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   720
         ScaleHeight     =   16
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   16
         TabIndex        =   50
         TabStop         =   0   'False
         Top             =   2340
         Width           =   240
      End
      Begin VB.TextBox txtPath 
         Height          =   885
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   49
         TabStop         =   0   'False
         Top             =   420
         Width           =   2595
      End
      Begin VB.TextBox txtDisplayName 
         Height          =   495
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   48
         TabStop         =   0   'False
         Top             =   1530
         Width           =   2595
      End
      Begin VB.Label labIcons 
         Caption         =   "Icons:"
         Height          =   195
         Left            =   120
         TabIndex        =   53
         Top             =   2070
         Width           =   495
      End
      Begin VB.Label labPath 
         Caption         =   "Path:"
         Height          =   195
         Left            =   120
         TabIndex        =   52
         Top             =   240
         Width           =   915
      End
      Begin VB.Label Label1 
         Caption         =   "DisplayName:"
         Height          =   195
         Left            =   120
         TabIndex        =   51
         Top             =   1350
         Width           =   1095
      End
   End
   Begin VB.Frame fraRtnTypes 
      Caption         =   "Return types (.ulFlags member)"
      ClipControls    =   0   'False
      Height          =   2145
      Left            =   6540
      TabIndex        =   28
      Top             =   120
      Width           =   2835
      Begin VB.CheckBox chkRtnType 
         Caption         =   "BIF_RETURNFSANCESTORS"
         Height          =   285
         Index           =   3
         Left            =   120
         TabIndex        =   21
         Top             =   1170
         Width           =   2590
      End
      Begin VB.CheckBox chkRtnType 
         Caption         =   "BIF_BROWSEFORPRINTER"
         Height          =   285
         Index           =   5
         Left            =   120
         TabIndex        =   23
         Top             =   1770
         Width           =   2590
      End
      Begin VB.CheckBox chkRtnType 
         Caption         =   "BIF_BROWSEFORCOMPUTER"
         Height          =   285
         Index           =   4
         Left            =   120
         TabIndex        =   22
         Top             =   1470
         Width           =   2590
      End
      Begin VB.CheckBox chkRtnType 
         Caption         =   "BIF_STATUSTEXT (callback)"
         Enabled         =   0   'False
         Height          =   285
         Index           =   2
         Left            =   120
         TabIndex        =   20
         Top             =   870
         Width           =   2590
      End
      Begin VB.CheckBox chkRtnType 
         Caption         =   "BIF_DONTGOBELOWDOMAIN"
         Height          =   285
         Index           =   1
         Left            =   120
         TabIndex        =   19
         Top             =   570
         Width           =   2590
      End
      Begin VB.CheckBox chkRtnType 
         Caption         =   "BIF_RETURNONLYFSDIRS"
         Height          =   285
         Index           =   0
         Left            =   120
         TabIndex        =   18
         Top             =   270
         Value           =   1  'Checked
         Width           =   2590
      End
   End
   Begin VB.CommandButton cmdQuit 
      Caption         =   "&Quit"
      Height          =   345
      Left            =   8400
      TabIndex        =   26
      Top             =   2400
      Width           =   975
   End
   Begin VB.CommandButton cmdInfo 
      Caption         =   "&?..."
      Height          =   345
      Left            =   7800
      TabIndex        =   25
      Top             =   2400
      Width           =   495
   End
   Begin VB.Frame fraFolders 
      Caption         =   "Dialog's root folder (.nFolder member)"
      ClipControls    =   0   'False
      Height          =   5415
      Left            =   120
      TabIndex        =   27
      Top             =   90
      Width           =   6255
      Begin VB.OptionButton optFolder 
         Caption         =   "Default Browse"
         Height          =   270
         Index           =   0
         Left            =   120
         TabIndex        =   0
         Top             =   240
         Value           =   -1  'True
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "ShellNew Folder"
         Height          =   270
         Index           =   17
         Left            =   120
         TabIndex        =   17
         Top             =   4830
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Fonts Folder"
         Height          =   270
         Index           =   16
         Left            =   120
         TabIndex        =   16
         Top             =   4560
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "NetHood Folder"
         Height          =   270
         Index           =   15
         Left            =   120
         TabIndex        =   15
         Top             =   4290
         Width           =   1815
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Network Neighborhood*"
         Height          =   270
         Index           =   14
         Left            =   120
         TabIndex        =   14
         Top             =   4020
         Width           =   2055
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "My Computer*"
         Height          =   270
         Index           =   13
         Left            =   120
         TabIndex        =   13
         Top             =   3750
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Desktop Folder"
         Height          =   270
         Index           =   12
         Left            =   120
         TabIndex        =   12
         Top             =   3480
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Start Menu Folder"
         Height          =   270
         Index           =   11
         Left            =   120
         TabIndex        =   11
         Top             =   3210
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Recycle Bin*"
         Height          =   270
         Index           =   10
         Left            =   120
         TabIndex        =   10
         Top             =   2940
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Printers*"
         Height          =   270
         Index           =   4
         Left            =   120
         TabIndex        =   4
         Top             =   1320
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "SendTo Folder"
         Height          =   270
         Index           =   9
         Left            =   120
         TabIndex        =   9
         Top             =   2670
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Recent Folder"
         Height          =   270
         Index           =   8
         Left            =   120
         TabIndex        =   8
         Top             =   2400
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Startup Folder"
         Height          =   270
         Index           =   7
         Left            =   120
         TabIndex        =   7
         Top             =   2130
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Favorites Folder"
         Height          =   270
         Index           =   6
         Left            =   120
         TabIndex        =   6
         Top             =   1860
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Documents Folder"
         Height          =   270
         Index           =   5
         Left            =   120
         TabIndex        =   5
         Top             =   1590
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Programs Folder"
         Height          =   270
         Index           =   2
         Left            =   120
         TabIndex        =   2
         Top             =   780
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "Control Panel*"
         Height          =   270
         Index           =   3
         Left            =   120
         TabIndex        =   3
         Top             =   1050
         Width           =   1800
      End
      Begin VB.OptionButton optFolder 
         Caption         =   "The Desktop*"
         Height          =   270
         Index           =   1
         Left            =   120
         TabIndex        =   1
         Top             =   510
         Width           =   1800
      End
      Begin VB.Label labFootnote 
         Caption         =   "* indicates virtual folder"
         Height          =   195
         Left            =   180
         TabIndex        =   46
         Top             =   5130
         Width           =   1695
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   17
         Left            =   2160
         TabIndex        =   45
         Top             =   4830
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   16
         Left            =   2160
         TabIndex        =   44
         Top             =   4560
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   15
         Left            =   2160
         TabIndex        =   43
         Top             =   4290
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   14
         Left            =   2160
         TabIndex        =   42
         Top             =   4020
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   13
         Left            =   2160
         TabIndex        =   41
         Top             =   3750
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   12
         Left            =   2160
         TabIndex        =   40
         Top             =   3480
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   11
         Left            =   2160
         TabIndex        =   39
         Top             =   3210
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   10
         Left            =   2160
         TabIndex        =   38
         Top             =   2940
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   2160
         TabIndex        =   37
         Top             =   2670
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   2160
         TabIndex        =   36
         Top             =   2400
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   7
         Left            =   2160
         TabIndex        =   35
         Top             =   2130
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   6
         Left            =   2160
         TabIndex        =   34
         Top             =   1860
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   2160
         TabIndex        =   33
         Top             =   1590
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   4
         Left            =   2160
         TabIndex        =   32
         Top             =   1320
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   3
         Left            =   2160
         TabIndex        =   31
         Top             =   1050
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   2
         Left            =   2160
         TabIndex        =   30
         Top             =   780
         UseMnemonic     =   0   'False
         Width           =   3900
      End
      Begin VB.Label labFolderPath 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   1
         Left            =   2160
         TabIndex        =   29
         Top             =   510
         UseMnemonic     =   0   'False
         Width           =   3900
      End
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "&Browse..."
      Height          =   345
      Left            =   6540
      TabIndex        =   24
      Top             =   2400
      Width           =   1035
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Brought to you by:
'   Brad Martinez
'   btmtz@aol.com
'   http://members.aol.com/btmtz/vb

' Currently selected option button
Dim m_wCurOptIdx As Integer
  

Private Sub Form_Load()

  Dim wIdx As Integer, nFolder As Long
  Dim sPath As String * MAX_PATH   ' 260
  Dim IDL As ITEMIDLIST
  
  Move (Screen.Width - Width) * 0.5, (Screen.Height - Height) * 0.5
  pic16Icon.AutoRedraw = True   ' this is a demo...
  pic32Icon.AutoRedraw = True
  
  ' Loads the labels with the respective
  ' system folder's path (if found)
  For wIdx = 1 To 17
    nFolder = GetFolderValue(wIdx)

    ' Fill the item id list with the pointer of each folder item, rtns 0 on success
    If SHGetSpecialFolderLocation(Me.hWnd, nFolder, IDL) = NOERROR Then
      
      ' Get the path from the item id list pointer, rtns True on success
      If SHGetPathFromIDList(ByVal IDL.mkid.cb, ByVal sPath) Then
    
        ' Display the path in the respective label
        labFolderPath(wIdx) = Left$(sPath, InStr(sPath, vbNullChar) - 1)
      
      End If
    
    Else
      ' The folder item doesn't exist, disable it's checkbox
      optFolder(wIdx).Enabled = False
    
    End If
  Next
  
End Sub

Private Function GetFolderValue(wIdx As Integer) As Long
' Returns the value of the system folder constant specified by wIdx
' See BrowsDlg.bas for the system folder nFolder values
    
    ' The Desktop
    If wIdx < 2 Then
      GetFolderValue = 0
    
    ' Programs Folder --> Start Menu Folder
    ElseIf wIdx < 12 Then
      GetFolderValue = wIdx
    
    ' Desktop Folder --> ShellNew Folder
    Else   ' wIdx >= 12
      GetFolderValue = wIdx + 4
    End If

End Function

Private Sub optFolder_Click(Index As Integer)
  ' Save the current option button index
  m_wCurOptIdx = Index
End Sub

Private Function GetReturnType() As Long
  Dim dwRtn As Long
  If chkRtnType(0) Then dwRtn = dwRtn Or BIF_RETURNONLYFSDIRS
  If chkRtnType(1) Then dwRtn = dwRtn Or BIF_DONTGOBELOWDOMAIN
'  If chkRtnType(2) Then dwRtn = dwRtn Or BIF_STATUSTEXT   ' callback only
  If chkRtnType(3) Then dwRtn = dwRtn Or BIF_RETURNFSANCESTORS
  If chkRtnType(4) Then dwRtn = dwRtn Or BIF_BROWSEFORCOMPUTER
  If chkRtnType(5) Then dwRtn = dwRtn Or BIF_BROWSEFORPRINTER
  GetReturnType = dwRtn
End Function

Private Sub cmdBrowse_Click()

  Dim BI As BROWSEINFO
  Dim nFolder As Long
  Dim IDL As ITEMIDLIST
  Dim pIdl As Long
  Dim sPath As String
  Dim SHFI As SHFILEINFO
  
  With BI
    ' The dialog's owner window...
    .hOwner = Me.hWnd
    
    ' Set the Browse dialog root folder
    nFolder = GetFolderValue(m_wCurOptIdx)
    
    ' Fill the item id list with the pointer of the selected folder item, rtns 0 on success
    ' ==================================================
    ' If this function fails because the selected folder doesn't exist,
    ' .pidlRoot will be uninitialized & will equal 0 (CSIDL_DESKTOP)
    ' and the root will be the Desktop.
    ' DO NOT specify the CSIDL_ constants for .pidlRoot !!!!
    ' The SHBrowseForFolder() call below will generate a fatal exception
    ' (GPF) if the folder indicated by the CSIDL_ constant does not exist!!
    ' ==================================================
    If SHGetSpecialFolderLocation(ByVal Me.hWnd, ByVal nFolder, IDL) = NOERROR Then
      .pidlRoot = IDL.mkid.cb
    End If
    
    ' Initialize the buffer that rtns the display name of the selected folder
    .pszDisplayName = String$(MAX_PATH, 0)
    
    ' Set the dialog's banner text
    .lpszTitle = "Browsing is limited to: " & optFolder(m_wCurOptIdx).Caption
    
    ' Set the type of folders to display & return
    ' -play with these option constants to see what can be returned
    .ulFlags = GetReturnType()
    
  End With
  
  ' Clear previous return vals before the
  ' dialog is shown (it might be cancelled)
  txtPath = ""
  txtDisplayName = ""
  pic16Icon.Picture = LoadPicture()   ' clears prev icon
  pic32Icon.Picture = LoadPicture()
  
  ' Show the Browse dialog
  pIdl = SHBrowseForFolder(BI)
  
  ' If the dialog was cancelled...
  If pIdl = 0 Then Exit Sub
    
  ' Fill sPath w/ the selected path from the id list
  ' (will rtn False if the id list can't be converted)
  sPath = String$(MAX_PATH, 0)
  SHGetPathFromIDList ByVal pIdl, ByVal sPath

  ' Display the path and the name of the selected folder
  txtPath = Left(sPath, InStr(sPath, vbNullChar) - 1)
  txtDisplayName = Left$(BI.pszDisplayName, _
                             InStr(BI.pszDisplayName, vbNullChar) - 1)
  
  ' Get the 16x16 icon info from the id list using the pidl
  SHGetFileInfo ByVal pIdl, 0&, SHFI, Len(SHFI), _
                       SHGFI_PIDL Or SHGFI_ICON Or SHGFI_SMALLICON
  ' The 16x16 icon handle rtnd in SHFI.hIcon is stretched to 32x32.
  ' DrawIconEx() will shrink (or stretch) the icon per it's cxWidth & cyWidth params
  DrawIconEx pic16Icon.hdc, 0, 0, SHFI.hIcon, 16, 16, 0, 0, DI_NORMAL
  pic16Icon.Refresh
  
  ' Get the 32x32 icon info from the id list
  SHGetFileInfo ByVal pIdl, 0&, SHFI, Len(SHFI), _
                       SHGFI_PIDL Or SHGFI_ICON
  ' SHFI.hIcon is OK here so DrawIcon() can be used
  DrawIcon pic32Icon.hdc, 0, 0, SHFI.hIcon
  pic32Icon.Refresh
  
  ' Frees the memory SHBrowseForFolder()
  ' allocated for the pointer to the item id list
  CoTaskMemFree pIdl
  
End Sub

Private Sub cmdInfo_Click()
  MsgBox "If a root folder Option Button has no correspnoding folder location " & _
               "displayed, then no Registry entry exists for it under:" & vbCrLf & vbCrLf & _
               "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" & _
               vbCrLf & vbCrLf & "As well, if a root folder Option Button is disabled, the folder " & _
               "does not exist in your file system and cannot be dispalyed as the root in the Browse dialog."
End Sub

Private Sub cmdQuit_Click()
  Unload Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Set Form1 = Nothing
  End
End Sub
