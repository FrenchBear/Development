VERSION 5.00
Begin VB.Form frmMain 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "DLL Zapper"
   ClientHeight    =   5385
   ClientLeft      =   1800
   ClientTop       =   1815
   ClientWidth     =   8910
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
   Icon            =   "MAIN.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   359
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   594
   Begin VB.ListBox lstFastFiles 
      Appearance      =   0  'Flat
      Height          =   225
      Left            =   7320
      TabIndex        =   15
      Top             =   4440
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.TextBox txtHeading 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      MultiLine       =   -1  'True
      TabIndex        =   14
      Top             =   120
      Width           =   8415
   End
   Begin VB.ListBox lstFiles 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2760
      Left            =   240
      TabIndex        =   1
      Top             =   375
      Width           =   8415
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Other options"
      ForeColor       =   &H80000008&
      Height          =   1860
      Left            =   2520
      TabIndex        =   13
      Top             =   3360
      Width           =   2055
      Begin VB.CheckBox chkWinSys 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Windows\System"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   1440
         Width           =   1815
      End
      Begin VB.CheckBox chkRecurse 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Recursive search"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   1080
         Value           =   1  'Checked
         Width           =   1815
      End
      Begin VB.CheckBox chkPath 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Scan search path"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   1815
      End
      Begin VB.CheckBox chkDups 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Duplicates only"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.Frame fraFileOpt 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "File options"
      ForeColor       =   &H80000008&
      Height          =   1860
      Left            =   240
      TabIndex        =   12
      Top             =   3360
      Width           =   2055
      Begin VB.CheckBox chkDLL 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "DLLs"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   2
         Top             =   360
         Value           =   1  'Checked
         Width           =   1095
      End
      Begin VB.CheckBox chkVBX 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "VBXs"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Width           =   975
      End
      Begin VB.CheckBox chkOther 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Others"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Tag             =   "*"
         Top             =   1080
         Width           =   975
      End
      Begin VB.TextBox txtOther 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   285
         Left            =   525
         TabIndex        =   5
         Top             =   1440
         Width           =   1170
      End
   End
   Begin VB.DirListBox Dir1 
      Appearance      =   0  'Flat
      Height          =   1380
      Left            =   4800
      TabIndex        =   11
      Top             =   3840
      Width           =   2295
   End
   Begin VB.DriveListBox Drive1 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   4800
      TabIndex        =   10
      Top             =   3465
      Width           =   2295
   End
   Begin VB.CommandButton cmdStart 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Start"
      Default         =   -1  'True
      Height          =   495
      Left            =   7320
      TabIndex        =   0
      Top             =   4680
      Width           =   1380
   End
   Begin VB.Image imgYesDrop 
      Appearance      =   0  'Flat
      Height          =   480
      Left            =   4320
      Picture         =   "MAIN.frx":030A
      Top             =   3120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgNoDrop 
      Appearance      =   0  'Flat
      Height          =   480
      Left            =   4200
      Picture         =   "MAIN.frx":0614
      Top             =   3120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgCopy 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   630
      Left            =   8040
      Picture         =   "MAIN.frx":091E
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   630
   End
   Begin VB.Image imgTrash 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   630
      Left            =   7320
      Picture         =   "MAIN.frx":0C28
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   630
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileAbout 
         Caption         =   "&About"
      End
      Begin VB.Menu dummy0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "&Exit"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Base 1

Const CHUNK = 10  ' Used for allocation of array space - how many elements at a time ?

Private Sub chkOther_Click()

    ' if Other extensions are going to be searched, nothing else can be
    ' searched - making sure a file is not added more than once is
    ' non-arbitrary
    txtOther.Enabled = Not (chkOther.Value - 1)
    If txtOther.Enabled Then
        txtOther.SetFocus
        chkVBX.Value = 0
        chkDLL.Value = 0
        chkVBX.Enabled = False
        chkDLL.Enabled = False
    Else
        chkVBX.Enabled = True
        chkDLL.Enabled = True
        txtOther.Text = ""
    End If
End Sub

Private Sub chkRecurse_Click()
    If chkRecurse.Value = 1 Then  ' Checked
        Drive1.Enabled = True
        Dir1.Enabled = True
    Else                         'Unchecked
        Drive1.Enabled = False
        Dir1.Enabled = False
    End If
End Sub

Private Sub cmdStart_Click()
'Start the search
Dim a As String, i As Integer

    If ((chkDLL) Or (chkVBX) Or (chkOther)) And (chkPath Or chkRecurse Or chkWinSys) Then
        Screen.MousePointer = 11  ' Hourglass
        
        frmWait.Show ' Display frmWait non-modally
        
        Call ResetFileList ' Clear the file data structures
        
        ' Build the lists

        ' Do a recursive search ?  If so, get the start path
        If Dir1.Enabled Then
            a = UCase$(Dir1.Path)
            If Right$(a, 1) = "\" Then a = Left$(a, Len(a) - 1)
        Else
            a = "+"   ' + is used because it cannot be part of a legal file name
        End If
    
        If Dir1.Enabled Then
            Status "Searching tree"
            Call ListSubDirs(a)  ' Start the recursive traverse of the tree
        End If

        ' If no errors have occured, search the Window path
        ' The Windows path refers to \WINDOWS and \WINDOWS\SYSTEM
        If (chkWinSys.Value = 1) And (Not ErrorOccured) Then
            Status "Searching Windows path"
            Call SearchWinPath(a)
        End If
        

        ' If no errors have occured, search the DOS path
        If (chkPath.Value = 1) And (Not ErrorOccured) Then
            Status "Searching DOS path"
            Call SearchDOSPath(a)
        End If
       

        'Process the data found
        If (FilesFound() > 0) And (Not ErrorOccured) Then
            Status "Sorting & Processing data"

            'Sort, get additional info, and if necessary, remove duplicates
            Call ProcessFiles
            
            'Display the result set
            Call DisplayFiles(lstFiles)
            Status ""
        End If
        
        frmWait.Hide
        Screen.MousePointer = 1   ' Reset the mouse pointer
    Else
        MsgBox "Nothing to do !"
    End If
End Sub

Private Sub Drive1_Change()
'User selects a new drive
Dim Old As String

On Error GoTo errDrive1_Change

    Old = Dir1.Path             'Keep the old path
    Dir1.Path = Drive1.Drive    'Try and change to the selected drive

    Exit Sub

errDrive1_Change:

    MsgBox "Disk error"
    Dir1.Path = Old                 'If change drive operation fails, reset to last
    Drive1.Drive = Left$(Old, 2)    'good configuration
    Exit Sub


End Sub

Private Sub Form_Load()
Dim tabs() As Integer
Dim NewX As Integer, NewY As Integer
    
    Randomize   ' Used by the quicksort
    ErrorOccured = False    ' Set error flag
    NewX = (Screen.Width - Me.Width) \ 2   ' Position the window
    NewY = (Screen.Height - Me.Height) \ 2
    Me.Top = NewY
    Me.Left = NewX

    'Set up drag and drop icons
    lstFiles.DragIcon = imgNoDrop.Picture

    ' Set up the tabs
    ReDim tabs(6)
    tabs(1) = Len("ABCDEFGH.IJK") + 1
    tabs(2) = 30
    tabs(3) = Len("1,234,567") - 1
    tabs(4) = Len("01/01/94")
    tabs(5) = Len("00.000.00.00")
    tabs(6) = Len("00:00:00")  ' This is in case another field ever needs to be added
    
    'Display the form in order to instantiate various handles
    Me.Show
    'Initialise the box
    Call InitListBox(tabs(), lstFiles, txtHeading)
    'Insert the headings into the list box
    txtHeading = "File name" & Chr$(9) & "Path" & Chr$(9) & "Size" & Chr$(9) & "Date" & Chr$(9) & "Version" & Chr$(9) & "Time"
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If WaitLoaded Then Unload frmWait
    End
End Sub

Private Sub imgCopy_DragDrop(Source As Control, X As Single, Y As Single)
Dim Filename As String, Result As String
Dim Msg As String

    If (Source Is lstFiles) And (lstFiles.ListCount > 0) Then
        Source.DragIcon = imgNoDrop
        Filename = GetFileName(Int(lstFiles.ItemData(lstFiles.ListIndex)))
        Result = CopyFile(Filename)
        If Right$(Result, Len(Result) - 1) <> Filename Then
            Select Case Left$(Result, 1)
                Case "C"
                    Msg = "Copied "
                Case "M"
                    Msg = "Moved "
            End Select
            Msg = Msg & Filename & " to " & UCase$(Right$(Result, Len(Result) - 1))
            MsgBox Msg
            lstFiles.RemoveItem lstFiles.ListIndex
        End If
    End If
    
End Sub

Private Sub imgCopy_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
    Select Case State
        Case 0 ' Enter
            If (Source Is lstFiles) And (lstFiles.ListCount > 0) Then
                Source.DragIcon = imgYesDrop
            End If
        Case 1 ' Leave
            If (Source Is lstFiles) And (lstFiles.ListCount > 0) Then
                Source.DragIcon = imgNoDrop
            End If
    End Select
End Sub

Private Sub imgTrash_DragDrop(Source As Control, X As Single, Y As Single)

    If (Source Is lstFiles) And (lstFiles.ListCount > 0) Then
        Source.DragIcon = imgNoDrop
        ZapFile
    End If
End Sub

Private Sub imgTrash_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
    Select Case State
        Case 0 ' Enter
            If (Source Is lstFiles) And (lstFiles.ListCount > 0) Then
                Source.DragIcon = imgYesDrop
            End If
        Case 1 ' Leave
            If (Source Is lstFiles) And (lstFiles.ListCount > 0) Then
                Source.DragIcon = imgNoDrop
            End If
    End Select
End Sub

Private Sub InitListBox(ColWidths%(), lst As ListBox, txt As TextBox)
'KB articles used: Q80190 (horizontal scroll bar)
'                  Q115712 (tabbed list boxes and horizontal scroll bars)
'                  Q71067 (tabbed list boxes)
'Based on given headings widths in characters, sets up tabs in lst and txt
'ColWidths() contains all the heading widths
'lst is the destination listbox
'txt is the Textbox to use for headings

Dim i As Long, AvgChWidth As Single
Dim tabs() As Integer, ActualWidth As Long
Dim TempPixelWidth As Integer
Dim FontName As String, FontSize As Single, FontBold As Integer, FontItalic As Integer

    FontName = frmMain.FontName    ' Store the font used on the form
    FontSize = frmMain.FontSize
    FontBold = frmMain.FontBold
    FontItalic = frmMain.FontItalic

    frmMain.FontName = lst.FontName  ' Set the form's font to that of the control
    frmMain.FontSize = lst.FontSize  ' The reason for this will become apparent momentarily
    frmMain.FontBold = lst.FontBold
    frmMain.FontItalic = lst.FontItalic
    
    'Get the average character width
    
    AvgChWidth = Me.TextWidth("ABCDEFGHIJKLMNOPQRTSUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\") / 63

    ReDim tabs(0 To UBound(ColWidths%))
   
    tabs(0) = 0
    ActualWidth = 0
    
    For i = 1 To UBound(ColWidths%)
        TempPixelWidth = Me.TextWidth(String$(ColWidths%(i) + 1, "X")) ' Width of the string in pixels
        tabs(i) = tabs(i - 1) + 4 * (TempPixelWidth \ AvgChWidth)
        ActualWidth = ActualWidth + TempPixelWidth
    Next i
    
    'Calculate the required display width
    ActualWidth = ActualWidth  '* GetDialogBaseUnits()
    
    'Bind a horizontal scroll bar to the list box (See Q80190)
    i = SendMessage(lst.hWnd, LB_SETHORIZONTALEXTENT, ActualWidth, NUL)
    
    frmMain.FontName = FontName   ' Reset the form's font
    frmMain.FontSize = FontSize
    frmMain.FontBold = FontBold
    frmMain.FontItalic = FontItalic
    
    ' and send the appropriate messages
    Call SetTabs(lst, tabs())
    Call SetTabs(txt, tabs())
    
End Sub

Private Sub ListFiles(Path$, Ext$)
' List all the files in a directory
' Uses a particularly sneaky trick - thanks to Dave !
Dim i As Integer, s As String

    s = Path$ + "\" + Ext$
    ' Tell Windows to fill the list box with the required file names
    ' The 7 represents  ATTR_SYSTEM + ATTR_HIDDEN + ATTR_READONLY + ATTR_NORMAL
    
    i = SendMessage(lstFastFiles.hWnd, LB_DIR, 7, ByVal s)

    For i = 0 To lstFastFiles.ListCount - 1
        Call AddFile(Path$, UCase$(lstFastFiles.List(i)))
    Next i

    lstFastFiles.Clear

End Sub

Private Sub ListSubDirs(Path$)
Dim Count, D(), i, DirName  ' Declare variables.

'On Error GoTo errListSubDirs
 On Error Resume Next

    DoEvents
    If chkDLL Then Call ListFiles(Path$, "*.DLL")
    If chkVBX Then Call ListFiles(Path$, "*.VBX")
    If chkOther Then Call ListFiles(Path$, Format$(txtOther.Text))
    
    DirName = Dir(Path$ & "\", ATTR_DIRECTORY + ATTR_HIDDEN) ' Get first directory name.
    'Iterate through PATH, caching all subdirectories in D()
    Do While (DirName <> "") And (Not ErrorOccured)
        If DirName <> "." And DirName <> ".." Then
            If (GetAttr(Path$ & "\" & DirName) And ATTR_DIRECTORY) = ATTR_DIRECTORY Then
              If Err = 0 Then
                If (Count Mod CHUNK) = 0 Then
                    ReDim Preserve D(Count + CHUNK)    ' Resize the array.
                End If
                Count = Count + 1   ' Increment counter.
                D(Count) = DirName
              End If
            End If
        End If
        DirName = Dir$   ' Get another directory name.
    Loop
    ' Now recursively iterate through each cached subdirectory.
    i = 1
    While (i <= Count) And (Not ErrorOccured)
        Call ListSubDirs(Path$ & "\" & D(i))
        i = i + 1
    Wend
    
    Exit Sub

errListSubDirs:

    MsgBox "Error reading subdirectories"
    ErrorOccured = True
    Exit Sub

End Sub

Private Sub lstFiles_KeyDown(KeyCode As Integer, Shift As Integer)

    If (KeyCode = 46) And (Shift = 0) And (lstFiles.ListIndex > -1) Then ' DEL pressed
        ZapFile
    End If

End Sub

Private Sub lstFiles_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lstFiles.Drag 1 ' Start drag n drop
End Sub

Private Sub lstFiles_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lstFiles.Drag 2 ' End drag n drop
End Sub

Private Sub mnuFileAbout_Click()
    ShowAboutBox
End Sub

Private Sub mnuFileExit_Click()
    Unload Me
End Sub

Private Sub ProcessFiles()
    'First sort the list
    Status "Sorting list"
    Call SortFiles

    'We only want duplicates
    If chkDups.Value = 1 Then
        Status "Removing unique files"
        Call StripUnique
    End If

    'Get complete info for each duplicate file
    Status "Getting complete info"
    Call GetAllFileInfo
    
End Sub

Private Sub SearchDOSPath(RecursiveStart$)
'Searches the DOS search path
'If \WINDOWS or \WINDOWS\SYSTEM are part of the search,
' and chkWinSys is checked, they are ignored

Dim DosPath()  As String
Dim tmp As String, i As Integer, Path As String

On Error GoTo errSearchDOSPath

    'Get the DOS path
    tmp = Environ$("PATH")
    If Right$(tmp, 1) = ";" Then tmp = Left$(tmp, Len(tmp) - 1)

    'This next bit ensures that the code can uniformly add a "\" to any
    'item in the path, even (for example) "C:\", by locating any directory names
    'in the search path ending with a '\', and removing the '\'
    If InStr(tmp, "\;") Then
        i = InStr(tmp, "\;")
        tmp = Left$(tmp, i - 1) & Right$(tmp, Len(tmp) - i)
    End If

    
    'Loop through all the directory names
    i = InStr(tmp, ";")
    Do While i > 0
        Path = Left$(tmp, i - 1)
        tmp = Right$(tmp, Len(tmp) - i)
        If InStr(Path, RecursiveStart$) = 0 Then
            DoEvents
            If chkDLL Then Call ListFiles(Path, "*.DLL")
            If (chkVBX) And (Not ErrorOccured) Then Call ListFiles(Path, "*.VBX")
            If (chkOther) And (Not ErrorOccured) Then Call ListFiles(Path, Format$(txtOther.Text))
        End If
        i = InStr(tmp, ";")
    Loop

    Exit Sub

errSearchDOSPath:

    MsgBox "Error searching DOS path"
    ErrorOccured = True
    Exit Sub
    
End Sub

Private Sub SearchWinPath(RecursiveStart$)
Dim Buffer As String * 144, WinDir As String
Dim i As Integer, Path As String

    'Get the location of Windows by using the Windows API
    i = GetWindowsDirectory(Buffer, Len(Buffer))
    WinDir = Left$(Buffer, InStr(Buffer, Chr$(0)) - 1) ' Chop off the trailing spaces
    If chkPath.Value = 1 Then    ' Is the DOS path going to be searched
        Path = Environ$("PATH")  ' Yes ?
    Else
        Path = "+"            ' Use a bogus value, to ensure the Windows parh is searched
    End If
    'Only Search if necessary:
    'Check if \WINDOWS, \WINDOWS\SYSTEM, or the recursive tree are included
    'ie have they been searched elsewhere
    If (InStr(Path, WinDir) = 0) And (InStr(Path, WinDir & "\SYSTEM")) And (InStr(RecursiveStart, WinDir) > 0) Then
        If chkDLL Then Call ListFiles(WinDir & "\", "*.DLL")
        If (chkDLL) And (Not ErrorOccured) Then Call ListFiles(WinDir & "\SYSTEM", "*.DLL")
        If (chkVBX) And (Not ErrorOccured) Then Call ListFiles(Path, "*.VBX")
        If (chkVBX) And (Not ErrorOccured) Then Call ListFiles(Path & "\SYSTEM", "*.VBX")
        If (chkOther) And (Not ErrorOccured) Then Call ListFiles(Path, Format$(txtOther.Text))
        If (chkOther) And (Not ErrorOccured) Then Call ListFiles(Path & "\SYSTEM", Format$(txtOther.Text))
    End If
End Sub

Private Sub ShowAboutBox()
    frmAbout.Show 1  ' Show the about box modally
End Sub

Private Sub txtOther_GotFocus()
    txtOther.SelStart = 0
    txtOther.SelLength = Len(txtOther)
End Sub

Private Sub txtOther_LostFocus()
    If Len(txtOther) = 0 Then   ' Has the user entered a wild-card ?
        chkOther.Value = 0      'NO: Clear the check box
        cmdStart.SetFocus
        txtOther.Enabled = False
    Else
        If Not IsValidWildcard(Format$(txtOther)) Then  ' A valid wildcard ?
            If ActiveControl.Tag <> "*" Then  ' Allow for invalid wildcards when certain controls have focus
                MsgBox "Invalid wildcard"     ' eg if the user wants to hit exit, let them, even with an invalid wildcard
                txtOther.SetFocus
            End If
        End If
    End If
End Sub

Private Sub ZapFile()
Dim Filename As String

    Filename = GetFileName(Int(lstFiles.ItemData(lstFiles.ListIndex)))
    'MessageBox has stop icon, Yes and No buttons, and No is default
    If MsgBox("OK to delete " & Filename & "?", 20 + 256) = 6 Then  'IDYES returned
        If DeleteFile(Filename) Then
            lstFiles.RemoveItem lstFiles.ListIndex  ' Delete successful, so remove from the listbox
        End If
    End If
End Sub

