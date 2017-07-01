VERSION 2.00
Begin Form Setup1 
   BackColor       =   &H00400000&
   Caption         =   "Test App Setup"
   ClientHeight    =   2130
   ClientLeft      =   1860
   ClientTop       =   2610
   ClientWidth     =   5640
   ControlBox      =   0   'False
   FillStyle       =   0  'Solid
   FontBold        =   -1  'True
   FontItalic      =   -1  'True
   FontName        =   "Arial"
   FontSize        =   24
   FontStrikethru  =   0   'False
   FontUnderline   =   0   'False
   ForeColor       =   &H00000000&
   Height          =   2535
   Icon            =   SETUP1A.FRX:0000
   Left            =   1800
   LinkMode        =   1  'Source
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   142
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   376
   Top             =   2265
   Width           =   5760
   Begin Label Label2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "To customize this setup program, modify the FORM_LOAD event procedure in this form."
      Height          =   435
      Left            =   15
      TabIndex        =   1
      Top             =   15
      Visible         =   0   'False
      Width           =   5625
   End
   Begin Label Label1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "This label used for DDE connection to the Program Manager"
      Height          =   390
      Left            =   15
      TabIndex        =   0
      Top             =   525
      Visible         =   0   'False
      Width           =   5610
   End
End

Const APPNAME = "ERCEM SYSTEM / HACCP 2.3a"

Const APPDIR = "C:\HACCP"       ' The default install directory

Const fDataAccess% = True

Const fODBC% = True

Const fBtrieve% = False
Const fOLE2% = False

' Set the total uncompressed file sizes
' by adding the sizes of the files
Const WINSYSNEEDED = 1523588' Files that go into WINDOWS and SYSTEM directory

Const OTHERNEEDED = 344132' Files that don't go into the WINDOWS or SYSTEM directory

Sub DrawBackground ()
  Cls

  Setup1.ScaleMode = 2
  Setup1.FontSize = 24
  Setup1.FontBold = True
  Setup1.FontItalic = True

  Setup1.CurrentY = 4
  Setup1.CurrentX = 4
  Setup1.ForeColor = QBColor(15)
  Print APPNAME + " Installation"

  Setup1.CurrentY = 5
  Setup1.CurrentX = 5
  Setup1.ForeColor = QBColor(7)
  Print APPNAME + " Installation"

End Sub

Sub Form_Load ()
    
    '----------
    ' Initialize
    '----------
    dialogCaption$ = APPNAME + " Installation"
    ShowMainForm dialogCaption$

    winDir$ = UCase$(GetWindowsDir$())
    winSysDir$ = UCase$(GetWindowsSysDir$())
    winDrive$ = UCase$(Left$(winDir$, 1))
    
    '----------------------------------------------------
    ' Get Window version
    '----------------------------------------------------
    TheVerInfo& = GetVersion()
    WinVer& = TheVerInfo& And &HFFFF&
    If Val(Format$(WinVer& Mod 256) + "." + Format$(WinVer& \ 256)) >= 3.1 Then
	gfWin31% = True
    End If
    
    '----------------------------------------------------
    ' OLE 2.0 requires Win 3.1 or greater
    '----------------------------------------------------
    If fOLE2% And Not gfWin31% Then
	MsgBox "This application requires Windows 3.1 or later"
	GoTo ErrorSetup
    End If

    '----------------------------------------------------
    ' Setup.EXE passes the source drive in a command
    ' argument.  If it is empty,  that means the user
    ' executed this .exe directly.  In that case, show
    ' a dialog to get the desired source directory.
    '----------------------------------------------------
    SourcePath$ = Command$
    If SourcePath$ = "" Then
	title$ = dialogCaption$
	caption1$ = "Fichiers à installer pour l'application " + APPNAME + "."
	caption2$ = "Installer depuis:"
	defaultDrive$ = "A:"
	defaultText$ = "A:\"

	ShowPathDialog title$, caption1$, caption2$, defaultDrive$, defaultText$, SourcePath$, outButton$

	If outButton$ = "exit" Then GoTo ErrorSetup
    Else
	If Right$(SourcePath$, 1) <> "\" Then
	    SourcePath$ = SourcePath$ + "\"
	End If
    End If


    '--------------------
    ' Get Destination Path
    '--------------------
    title$ = dialogCaption$
    caption1$ = "Si vous souhaitez installer l'application dans un autre répertoire, entrez le chemin souhaité."
    caption2$ = "Installer vers:"
    defaultDrive$ = "C:"
    defaultText$ = APPDIR

    ShowPathDialog title$, caption1$, caption2$, defaultDrive$, defaultText$, destPath$, outButton$

    If outButton$ = "exit" Then GoTo ErrorSetup
    
    '---------------------
    ' Sample Option Dialog
    '---------------------
'    ReDim Caption(1 To 4) As String
'    ReDim choice(1 To 4) As Integer
'
'    title$ = dialogCaption$
'    numOptions = 4
'    Caption(1) = "Sample Option 1"
'    Caption(2) = "Sample Option 2"
'    Caption(3) = "Sample Option 3"
'    Caption(4) = "Sample Option 4"
'    helpTxt$ = "Choose your options!   These options are not actually used by this Setup program, but by looking in the Setup1.FRM code you can see how to implement your own option dialogs."

'    ShowOptionDialog title$, numOptions, Caption$(), helpTxt$, choice(), outButton$

'    If outButton$ = "exit" Then
'        GoTo ErrorSetup
'    Else
'        If choice(1) Then MsgBox "Option #1 Selected", 48, "Setup"
'        If choice(2) Then MsgBox "Option #2 Selected", 48, "Setup"
'        If choice(3) Then MsgBox "Option #3 Selected", 48, "Setup"
'        If choice(4) Then MsgBox "Option #4 Selected", 48, "Setup"
'    End If


    '-----------------------------------------
    ' Dim disk space variables as Long Integers
    '-----------------------------------------
    Dim winSpaceFree As Long
    Dim sourceSpaceFree As Long
    Dim destSpaceFree As Long
    Dim totalNeeded As Long

    '---------------------------------------------------------
    ' If the Windows \SYSTEM directory is a subdirectory
    ' of the Windows directory, the proper place for
    ' Setup of .VBXs and shared .DLLs is the
    ' Windows \SYSTEM directory.
    '
    ' If the Windows \SYSTEM directory is *not* a subdirectory
    ' of the Windows directory, then the user is running a
    ' shared version of Windows, and the proper place for
    ' Setup of .VBXs and shared .DLLs is the
    ' Windows directory.
    '---------------------------------------------------------
    If InStr(winSysDir$, winDir$) = 0 Then
	winSysDir$ = winDir$
    End If

    
    '---------------------------------
    ' Get Drive Letters of directories
    '---------------------------------
    destDrive$ = UCase$(Left$(destPath$, 1))
    sourceDrive$ = UCase$(Left$(SourcePath$, 1))

    '---------------------------------
    ' Compute free disk space variables
    '---------------------------------
    winSpaceFree = GetDiskSpaceFree(winDrive$)
    destSpaceFree = GetDiskSpaceFree(destDrive$)
    
    '-----------------------------------------
    ' Check for enough disk space.
    '
    ' Some components are being installed into the
    ' Windows\SYSTEM directory.
    '
    ' So if the main destination path is on a
    ' different drive than the drive with
    ' the Windows \SYSTEM directory, we have to
    ' check both drives.
    '
    ' An example of this is when the user is installing
    ' the main product to drive D:, but the Windows
    ' directory is on drive c:
    ' -----------------------------------------
    totalNeeded = WINSYSNEEDED + OTHERNEEDED
    
    If winDrive$ = destDrive$ Then
	If destSpaceFree < totalNeeded Then
	    MsgBox "There is not enough disk space on drive " + destDrive$ + ":   An estimated" + Str$(totalNeeded - destSpaceFree) + " additional bytes are needed.", 16, dialogCaption$
	    GoTo ErrorSetup
	End If
    Else
	If winSpaceFree < WINSYSNEEDED Then
	    MsgBox "There is not enough disk space on drive " + winDrive$ + ":  An estimated" + Str$(WINSYSNEEDED - winSpaceFree) + " additional bytes are needed.", 16, dialogCaption$
	    GoTo ErrorSetup
	End If
	If destSpaceFree < OTHERNEEDED Then
	    MsgBox "There is not enough disk space on drive " + destDrive$ + ":  An estimated" + Str$(OTHERNEEDED - destSpaceFree) + " additional bytes are needed.", 16, dialogCaption$
	    GoTo ErrorSetup
	End If
	
    End If



    '----------------------------
    ' Create destination directory
    '----------------------------
    If Not CreatePath(destPath$) Then GoTo ErrorSetup
    If Not CreatePath(destPath$ & "SYNAFAP\") Then GoTo ErrorSetup
    

    '-----------------------------------------------------------
    ' Show Status Dialog -- This stays up while copying files
    ' It is required by the CopyFile routine
    '-----------------------------------------------------------
    ShowStatusDialog dialogCaption$, totalNeeded
    
    
    '-----------
    ' Copy Files
    '-----------

    ' Test to see if loan.exe is on the disk, if not then you know the user
    ' did not insert the first disk
If Not PromptForNextDisk(1, SourcePath$ + "HACCP.EX_") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, winSysDir$, "CMDIALOG.VB_", "CMDIALOG.VBX") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, winSysDir$, "COMMDLG.DL_", "COMMDLG.DLL") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "HACCP.EX_", "HACCP.EXE") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, winSysDir$, "MSAES110.DL_", "MSAES110.DLL") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, winSysDir$, "MSAJT110.DL_", "MSAJT110.DLL") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, winSysDir$, "VBDB300.DL_", "VBDB300.DLL") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, winSysDir$, "SHARE.EX_", "SHARE.EXE") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, winSysDir$, "ODBC.DL_", "ODBC.DLL") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, winSysDir$, "ODBCINST.DL_", "ODBCINST.DLL") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, winSysDir$, "CTL3D.DL_", "CTL3D.DLL") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "HACCP.HL_", "HACCP.HLP") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "HACCP.DO_", "HACCP.DOT") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "HACCPPGM.HL_", "HACCPPGM.HLP") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "HACCP.MD_", "HACCP.MDB") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "AUDITST.XL_", "SYNAFAP\AUDITST.XLS") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "RECEPMP.WR_", "SYNAFAP\RECEPMP.WRI") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "RECEPT.DO_", "SYNAFAP\RECEPT.DOC") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "SYNAFAP.DO_", "SYNAFAP\SYNAFAP.DOC") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "CONTAMIN.TX_", "SYNAFAP\CONTAMIN.TXT") Then GoTo ErrorSetup
If Not CopyFile(SourcePath$, destPath$, "NIVCONT.PM_", "SYNAFAP\NIVCONT.PM5") Then GoTo ErrorSetup

    ' Install loan.exe and grid.vbx in the destPath$


    ' If you have more than one distribution disk, call PromptForNextDisk after
    ' you have installed all the files from the previous disk. This line tests to
    ' see if foo.da_ is on disk 2. If not, you know the user has not inserted disk 2.
    ' The call to PromptForNextDisk is commented out, since loan.exe can be installed
    ' from a single distribution disk.
    
    ' If Not PromptForNextDisk(2, SourcePath$ + "foo.da_") Then GoTo ErrorSetup
    ' If Not CopyFile(SourcePath$, destPath$, "foo.da_", "foo.dat", 0) Then GoTo ErrorSetup


    '--------------------------------------------------
    ' File Copying is over, so unload the status dialog
    '--------------------------------------------------
    Unload StatusDlg


    '-----------------------------------------------------------
    ' Show static message while working on DDE to Program Manager
    '-----------------------------------------------------------
    ShowStaticMessageDialog dialogCaption$, "Création du groupe de programmes..."


    '--------------------------------------
    ' Create program manager group and icon
    '--------------------------------------
CreateProgManGroup Setup1, "ERCEM SYSTEM / HACCP", "HACCP.GRP"

CreateProgManItem Setup1, destPath$ + "HACCP.EXE", "HACCP 2.3a"
CreateProgManItem Setup1, destPath$ + "HACCP.HLP", "Documentation HACCP"
CreateProgManItem Setup1, destPath$ + "HACCPPGM.HLP", "Aide de HACCP 2.3a"


    '-------------------------------------------------
    ' Since Setup.EXE copies your Setup program to the Windows
    ' directory, it is possible for your user to
    ' execute this program directly.
    '
    ' As a usability feature, you may wish to insert code
    ' here to install a program manager icon that executes
    ' your Setup program in the windows drive.  This
    ' allows th user to re-run Setup at a later time to
    ' install options that were not installed the first
    ' time.
    '-------------------------------------------------

    '-------------------
    ' Hide Static Message
    '-------------------
    MessageDlg.Hide
    

    '--------------------------------------------------------------
    ' If OLE2.DLL already exists, then ignore the OLE 2 flag.
    ' Otherwise, if we are installing an application that uses
    ' OLE 2.0, we need to register the OLE 2 DLL's via REGEDIT.EXE.
    '
    ' Do not copy OLE dlls unless you check the versions and assure
    ' that the versions you plan to install postdate the ones on
    ' the users machine.
    '
    '
    ' The data access engine and OLE 2.0 need to have SHARE.EXE
    ' loaded. Check AUTOEXEC.BAT and add if needed.  NOTE: If
    ' running Window For WorkGroup, then do not add SHARE.  WFW
    ' use its own sharing mechanism, VSHARE.386.
    '----------------------------------------------------------
    If fDataAccess% Or fOLE2% And Not FileExists(winSysDir$ + "\" + "OLE2.DLL") Then
	ret$ = Space$(255)
	x% = GetPrivateProfileString("BOOT", "NETWORK.DRV", "", ret$, Len(ret$), "SYSTEM.INI")
	If x% Then ret$ = Left(ret$, x%)
	If InStr(1, UCase$(ret$), "WFWNET.DRV") = 0 Then
	    AddShareIfNeeded winSysDir$, "SHARE.EXE"
	End If
    End If

    '----------------------------
    ' Need to register OLE 2.0 dlls
    '----------------------------
    If fOLE2% And Not FileExists(winSysDir$ + "\" + "OLE2.DLL") Then
	x% = Shell("regedit /s ole2.reg")
    End If

    '-------------------------------------------------------
    ' Do not change this if statement.  Used by Setup Wizard
    '-------------------------------------------------------
    If fODBC% Then

'CreateProgManItem Setup1, destPath$ + "HACCP.EXE", "ERCEM SYSTEM / HACCP 2.3a"
'CreateProgManItem Setup1, destPath$ + "HACCP.HLP", "Help File: HACCP.HLP"
'CreateProgManItem Setup1, destPath$ + "HACCPPGM.HLP", "Help File: HACCPPGM.HLP"

    End If
	
    MsgBox "Si vous utilisez Word, pensez à déplacer le modèle HACCP.DOT dans le répertoire de modèles de Word (par exemple C:\WINWORD)."

    '-------------------------------------------------------
    ' Do not change this if statement.  Used by Setup Wizard
    '-------------------------------------------------------
    If fBtrieve% Then
	' See notes in Appendix C
	retstr$ = String$(255, 32)
	x% = GetPrivateProfileString%("BTRIEVE", "OPTIONS", "1", retstr$, Len(retstr$), "WIN.INI")
	If x% <= 1 Then
	    x% = WritePrivateProfileString%("BTRIEVE", "OPTIONS", "/m:64 /p:4096 /b:16 /f:20 /l:40 /n:12 /t:" + destPath$ + "BTRIEVE.TRN", "WIN.INI")
	End If
    End If

    '------------------
    ' Show Final message
    '------------------
    MsgBox APPNAME + " installation terminée !", 48, dialogCaption$
   
ExitSetup:
    Setup1.Hide
    RestoreProgMan         'Show the program manager
    End
    Exit Sub

ErrorSetup:
    MsgBox APPNAME + " n'est pas correctement installé.  Ré-exécutez setup pour installer correctement l'application.", 48, dialogCaption$
    ChDrive winDrive$   ' Set back to hard disk
    ChDir Left$(winDir$, Len(winDir$) - 1)
    End
    Exit Sub
    
End Sub

Sub Form_Paint ()
    DrawBackground
End Sub

'---------------------------------------------------------------
' Sets the form's caption, Paints 3-D Background Text, Shows Form
'---------------------------------------------------------------
Sub ShowMainForm (Caption$)
    Screen.MousePointer = 11
    Setup1.Caption = Caption$
    Setup1.Move 0, 0, Screen.Width, Screen.Height * .85
    Setup1.Show

    DrawBackground
End Sub

Sub ShowPathDialog (title$, caption1$, caption2$, defaultDrive$, defaultText$, SourcePath$, outButton$)
	Screen.MousePointer = 11
	Load PathDlg
	PathDlg.Caption = title$
	PathDlg.Label1.Caption = caption1$
	PathDlg.Label2.Caption = caption2$
	PathDlg.inDrive.Tag = defaultDrive$
	PathDlg.Text1.Text = defaultText$
	PathDlg.Text1.SelStart = 0
	PathDlg.Text1.SelLength = Len(defaultText$)
	CenterForm PathDlg
	Screen.MousePointer = 0

	PathDlg.Show 1
	
	SourcePath$ = PathDlg.outPath.Tag
	outButton$ = PathDlg.outButton.Tag
	Unload PathDlg
End Sub

Sub ShowStaticMessageDialog (title$, Caption$)

    Load MessageDlg
    CenterForm MessageDlg
    MessageDlg.Caption = title$
    MessageDlg.Label.Caption = Caption$
    MessageDlg.Show
    MessageDlg.Refresh

End Sub

Sub ShowStatusDialog (title$, totalBytes As Long)

    Load StatusDlg
    StatusDlg.Caption = title$
    StatusDlg.total.Tag = Str$(totalBytes)
    CenterForm StatusDlg
    StatusDlg.Show

End Sub

