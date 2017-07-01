Attribute VB_Name = "Module1"

Declare Function GetProfileString Lib "Kernel" (ByVal lpAppName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Integer) As Integer

Global anglais As Integer
Global AppName As String

Global dialogCaption As String


Dim position

Global ProgressionAnnulée As Integer
Function CopyListe(ByVal FichierListe As String, ByVal Origine As String, ByVal Destination As String, ByVal VersFloppy As Integer) As Integer

Dim Numfile As Integer
Dim Fichier As String

    On Error Resume Next
    Numfile = FreeFile
    Open FichierListe For Input As Numfile
    If Err Then
        ErreurSystemeBox "Fichier " & UCase$(FichierListe) & " inexistant. Impossible de copier les fichiers vers le répertoire destination.", MB_ICONSTOP, NomApplication
        CopyListe = False
        Exit Function
    End If
    While Not EOF(Numfile) And ProgressionAnnulée = False
        Line Input #Numfile, Fichier
        DoEvents
        If Trim$(Fichier) <> "" Then
            If Left$(Fichier, 5) = "[Disk" Then
                If VersFloppy Then
                    Dim NumDisquette As Integer
                    NumDisquette = Val(SuppLastChar(suppfirstchar(Fichier, 6), 1))
                    If NumDisquette > 1 Or Dir$("a:\*.*") = "Disque non prêt" Then
                        If MsgBox("Insérez la disquette " & NumDisquette, MB_ICONINFORMATION Or MB_OKCANCEL, NomApplication) = IDCANCEL Then
                            CopyListe = False
                            Close Numfile
                            Exit Function
                        End If
                    End If
                    If Dir$("a:\*.*") <> "" Then
                        If MsgBox("La disquette contient des fichiers qui doivent être effacés. Voulez-vous continuer ?", MB_ICONINFORMATION Or MB_YESNO, NomApplication) = IDNO Then
                            CopyListe = False
                            Close Numfile
                            Exit Function
                        End If
                        HourGlass "show"
                        Kill "a:\*.*"
                        HourGlass "hide"
                    End If
                End If
            Else
                Dim FichierCourt As String
                FichierCourt = GetFichierSansChemin(Fichier)
                If Not DuplicateFile(Origine & GetCheminSansFichier(Fichier), Destination, FichierCourt, FichierCourt) Then
                    ErreurSystemeBox "Impossible de transférer le fichier " & Fichier & " sur " & Destination & ". Génération des disquettes interrompue.", MB_ICONSTOP, NomApplication
                    CopyListe = False
                    Close Numfile
                    Exit Function
                End If
                UpdateStatus GetFileSize(Origine & Fichier)
            End If
        End If
    Wend
    Close Numfile
    CopyListe = IIf(ProgressionAnnulée, False, True)
    
End Function




Public Function GetTailleFichiersListe(ByVal FichierListe As String, ByVal Origine As String) As Long

Dim Numfile As Integer
Dim Fichier As String
Dim taille As Long

    'supprime le "\" de fin
    If right$(Origine, 1) = "\" Then
        Origine = Left$(Origine, Len(Origine) - 1)
    End If
    
    On Error Resume Next
    Numfile = FreeFile
    Open FichierListe For Input As Numfile
    If Err Then
        ErreurSystemeBox "Fichier " & UCase$(FichierListe) & " inexistant. Impossible d'évaluer la taille des fichiers de la liste.", MB_ICONSTOP, NomApplication
        Exit Function
    End If
    taille& = 0
    While Not EOF(Numfile)
        Line Input #Numfile, Fichier
        If Trim$(Fichier) <> "" Then
            If Left$(Fichier, 5) <> "[Disk" Then
                taille& = taille& + FileLen(Origine & Fichier)
            End If
        End If
    Wend
    Close Numfile

    GetTailleFichiersListe = taille&

End Function


'---------------------------------------------------------------
' Copies file SrcFilename from SourcePath to DestinationPath.
'
' Returns 0 if it could not find the file, or other runtime
' error occurs.  Otherwise, returns true.
'
' If the source file is older, the function returns success (-1)
' even though no file was copied, since no error occurred.
'---------------------------------------------------------------
Function CopyFile(ByVal SourcePath As String, ByVal DestinationPath As String, ByVal Srcfilename As String, ByVal DestFileName As String)
' ----- VerInstallFile() flags -----
    Const VIFF_FORCEINSTALL% = &H1, VIFF_DONTDELETEOLD% = &H2
    Const OF_DELETE% = &H200
    Const VIF_TEMPFILE& = &H1
    Const VIF_MISMATCH& = &H2
    Const VIF_SRCOLD& = &H4

    Const VIF_DIFFLANG& = &H8
    Const VIF_DIFFCODEPG& = &H10
    Const VIF_DIFFTYPE& = &H20
    Const VIF_WRITEPROT& = &H40
    Const VIF_FILEINUSE& = &H80
    Const VIF_OUTOFSPACE& = &H100
    Const VIF_ACCESSVIOLATION& = &H200
    Const VIF_SHARINGVIOLATION = &H400
    Const VIF_CANNOTCREATE = &H800
    Const VIF_CANNOTDELETE = &H1000
    Const VIF_CANNOTRENAME = &H2000
    Const VIF_CANNOTDELETECUR = &H4000
    Const VIF_OUTOFMEMORY = &H8000

    Const VIF_CANNOTREADSRC = &H10000
    Const VIF_CANNOTREADDST = &H20000

    Const VIF_BUFFTOOSMALL = &H40000
    Dim TmpOFStruct As OFStruct
    On Error GoTo ErrorCopy1

    Screen.MousePointer = 11

    '--------------------------------------
    ' Add ending \ symbols to path variables
    '--------------------------------------
    If right$(SourcePath$, 1) <> "\" Then
        SourcePath$ = SourcePath$ + "\"
    End If
    If right$(DestinationPath$, 1) <> "\" Then
        DestinationPath$ = DestinationPath$ + "\"
    End If
    
    '----------------------------
    ' Update status dialog info
    '----------------------------
    If anglais Then
        StatusDlg.Label2.Caption = "Destination file: " + Chr$(10) + Chr$(13) + UCase$(DestinationPath$ + DestFileName$)
        StatusDlg.Label1.Caption = "Source file: " + Chr$(10) + Chr$(13) + UCase$(SourcePath$ + Srcfilename$)
    Else
        StatusDlg.Label2.Caption = "Fichier destination: " + Chr$(10) + Chr$(13) + UCase$(DestinationPath$ + DestFileName$)
        StatusDlg.Label1.Caption = "Fichier source: " + Chr$(10) + Chr$(13) + UCase$(SourcePath$ + Srcfilename$)
    End If
    StatusDlg.Label1.Refresh
    StatusDlg.Label2.Refresh

    '-----------------------------------------
    ' Check the validity of the path and file
    '-----------------------------------------
    
    If Not FileExists(SourcePath$ + Srcfilename$) Then
        If anglais Then
            MsgBox "Error occurred while attempting to copy file.  Could not locate file: """ + SourcePath$ + Srcfilename$ + """", 64, "SETUP"
        Else
            MsgBox "Une erreur est survenue en copiant un fichier. Fichier non trouvé: """ + SourcePath$ + Srcfilename$ + """", 64, "Installation"
        End If
        CopyFile = False
    Else
        '-------------------------------------------------
        ' VerInstallFile installs the file. We need to initialize
        ' some arguments for the temp file that is created by the call
        '-------------------------------------------------
        
        CurrDir$ = String$(255, 0)
        TmpFile$ = String$(255, 0)
        lpwTempFileLen% = 255
        Result& = VerInstallFile&(0, Srcfilename$, DestFileName$, SourcePath$, DestinationPath$, CurrDir$, TmpFile$, lpwTempFileLen%)

        '--------------------------------------------
        ' After copying, update the installation meter
        '---------------------------------------------
        
        s$ = DestinationPath$
        If right$(s$, 1) <> "\" Then s$ = s$ + "\"
        s$ = s$ + DestFileName$
        UpdateStatus GetFileSize(SourcePath$ & Srcfilename$)

        '--------------------------------
        ' There are many return values that you can test for.
        ' The constants are listed above.
        ' The following lines of code return will set the Function to
        ' True if the VerInstallFile call was successful.
        '
        ' If the call was unsuccessful due to a different language on the
        ' users machine, VerInstallFile is called again to force installation.
        ' You can change this to not install if you choose.
        ' Be careful about using FORCEINSTALL.  Other flags could be
        ' set which indicate that this file should not be overridden.
        '
        ' Under any other circumstance, the tempfile created by VerInstallFile
        ' is removed using OpenFile and the CopyFile function returns false.
        '--------------------------------------------------------
        
        If Result& = 0 Or (Result& And VIF_SRCOLD&) = VIF_SRCOLD& Then
            CopyFile = True
        ElseIf (Result& And VIF_DIFFLANG&) = VIF_DIFFLANG& Then
            Result& = VerInstallFile&(VIFF_FORCEINSTALL%, Srcfilename$, DestFileName$, SourcePath$, DestinationPath$, CurrDir$, TmpFile$, lpwTempFileLen%)
            CopyFile = True
        Else
            CopyFile = False
            If (Result& And VIF_FILEINUSE&) = VIF_FILEINUSE& Then
                If anglais Then
                    MsgBox DestFileName$ & " is in use. Please close all applications and re-attempt Setup."
                Else
                    MsgBox DestFileName$ & " est en cours d'utilisation. Fermez toutes les applications et relancez ce programme d'installation."
                End If
            Else
                If anglais Then
                    MsgBox DestFileName$ & " could not be installed."
                Else
                    MsgBox DestFileName$ & " ne peut être installé."
                End If
            End If
        End If

    If (Result& And VIF_TEMPFILE&) = VIF_TEMPFILE& Then copyresult% = OpenFile(TmpFile$, TmpOFStruct, OF_DELETE%)
        Screen.MousePointer = 0
        Exit Function
    End If

ErrorCopy1:
    CopyFile = False
    Screen.MousePointer = 0
    Exit Function

End Function



Function DuplicateFile(ByVal SourcePath As String, ByVal DestinationPath As String, ByVal Srcfilename As String, ByVal DestFileName As String)

    On Error GoTo err_duplicatefile
    DuplicateFile = True
    If right$(SourcePath, 1) <> "\" Then
        SourcePath = SourcePath & "\"
    End If
    If right$(DestinationPath, 1) <> "\" Then
        DestinationPath = DestinationPath & "\"
    End If
    
    '----------------------------
    ' Update status dialog info
    '----------------------------
    If anglais Then
        StatusDlg.Label2.Caption = "Destination file: " + Chr$(10) + Chr$(13) + UCase$(DestinationPath$ + DestFileName$)
        StatusDlg.Label1.Caption = "Source file: " + Chr$(10) + Chr$(13) + UCase$(SourcePath$ + Srcfilename$)
    Else
        StatusDlg.Label2.Caption = "Fichier destination: " + Chr$(10) + Chr$(13) + UCase$(DestinationPath$ + DestFileName$)
        StatusDlg.Label1.Caption = "Fichier source: " + Chr$(10) + Chr$(13) + UCase$(SourcePath$ + Srcfilename$)
    End If
    StatusDlg.Label1.Refresh
    StatusDlg.Label2.Refresh
    
    FileCopy SourcePath & Srcfilename, DestinationPath & DestFileName
fin_duplicatefile:
    Exit Function
err_duplicatefile:
    MsgBox "Le fichier " & Srcfilename & " ne peut pas être copié. Génération incomplète.", MB_ICONSTOP, NomApplication
    DuplicateFile = False
    Resume fin_duplicatefile
    
End Function

Public Sub ShowStatusDialog(title$, totalBytes As Single)

    Load StatusDlg
    StatusDlg.Caption = title$
    StatusDlg.total.Tag = Str$(totalBytes)
    CenterInScreen StatusDlg
    position = 0
    StatusDlg.Show

End Sub


'---------------------------------------------
' Create the path contained in DestPath$
' First char must be drive letter, followed by
' a ":\" followed by the path, if any.
'---------------------------------------------
Function CreatePath(ByVal DestPath$) As Integer
    Screen.MousePointer = 11

    '---------------------------------------------
    ' Add slash to end of path if not there already
    '---------------------------------------------
    If right$(DestPath$, 1) <> "\" Then
        DestPath$ = DestPath$ + "\"
    End If
          

    '-----------------------------------
    ' Change to the root dir of the drive
    '-----------------------------------
    On Error Resume Next
    ChDrive DestPath$
    If Err <> 0 Then GoTo errorOut
    ChDir "\"

    '-------------------------------------------------
    ' Attempt to make each directory, then change to it
    '-------------------------------------------------
    BackPos = 3
    forePos = InStr(4, DestPath$, "\")
    Do While forePos <> 0
        temp$ = Mid$(DestPath$, BackPos + 1, forePos - BackPos - 1)

        Err = 0
        MkDir temp$
        If Err <> 0 And Err <> 75 Then GoTo errorOut

        Err = 0
        ChDir temp$
        If Err <> 0 Then GoTo errorOut

        BackPos = forePos
        forePos = InStr(BackPos + 1, DestPath$, "\")
    Loop
                 
    CreatePath = True
    Screen.MousePointer = 0
    Exit Function
                 
errorOut:
    If anglais Then
        MsgBox "Error While Attempting to Create Directories on Destination Drive.", 48, "SETUP"
    Else
        MsgBox "Une erreur est survenue en créant les répertoires sur le disque destination.", 48, "Installation"
    End If
    CreatePath = False
    Screen.MousePointer = 0

End Function

'-------------------------------------------------------------
' Procedure: CreateProgManGroup
' Arguments: X           The Form where a Label1 exist
'            GroupName$  A string that contains the group name
'            GroupPath$  A string that contains the group file
'                        name  ie 'myapp.grp'
'-------------------------------------------------------------
Sub CreateProgManGroup(X As Form, GroupName$, GroupPath$)
    
    Screen.MousePointer = 11
    
    '----------------------------------------------------------------------
    ' Windows requires DDE in order to create a program group and item.
    ' Here, a Visual Basic label control is used to generate the DDE messages
    '----------------------------------------------------------------------
    On Error Resume Next

    
    '--------------------------------
    ' Set LinkTopic to PROGRAM MANAGER
    '--------------------------------
    X.Label1.LinkTopic = "ProgMan|Progman"
    X.Label1.LinkMode = 2
    For i% = 1 To 10                                         ' Loop to ensure that there is enough time to
      z% = DoEvents()                                        ' process DDE Execute.  This is redundant but needed
    Next                                                     ' for debug windows.
    X.Label1.LinkTimeout = 100


    '---------------------
    ' Create program group
    '---------------------
    X.Label1.LinkExecute "[CreateGroup(" + GroupName$ + Chr$(44) + GroupPath$ + ")]"


    '-----------------
    ' Reset properties
    '-----------------
    X.Label1.LinkTimeout = 50
    X.Label1.LinkMode = 0
    
    Screen.MousePointer = 0
End Sub

'----------------------------------------------------------
' Procedure: CreateProgManItem
'
' Arguments: X           The form where Label1 exists
'
'            CmdLine$    A string that contains the command
'                        line for the item/icon.
'                        ie 'c:\myapp\setup.exe'
'
'            IconTitle$  A string that contains the item's
'                        caption
'            IconFile$   fichier contenant l'icone à affiche
'                        CmdLine$ si IconFile$ = ""
'            Mininized   etat de l'application au lancement
'----------------------------------------------------------
Sub CreateProgManItem(X As Form, CmdLine$, IconTitle$, IconFile$, Minimized As Integer)
    
    Screen.MousePointer = 11
    
    '----------------------------------------------------------------------
    ' Windows requires DDE in order to create a program group and item.
    ' Here, a Visual Basic label control is used to generate the DDE messages
    '----------------------------------------------------------------------
    On Error Resume Next


    '---------------------------------
    ' Set LinkTopic to PROGRAM MANAGER
    '---------------------------------
    X.Label1.LinkTopic = "ProgMan|Progman"
    X.Label1.LinkMode = 2
    For i% = 1 To 10                                         ' Loop to ensure that there is enough time to
      z% = DoEvents()                                        ' process DDE Execute.  This is redundant but needed
    Next                                                     ' for debug windows.
    X.Label1.LinkTimeout = 100

    
    '------------------------------------------------
    ' Create Program Item, one of the icons to launch
    ' an application from Program Manager
    '------------------------------------------------
    X.Label1.LinkExecute "[AddItem(" + CmdLine$ + Chr$(44) + IconTitle$ + Chr$(44) + IconFile$ + ",,,,,," & Minimized & ")]"
    
    '-----------------
    ' Reset properties
    '-----------------
    X.Label1.LinkTimeout = 50
    X.Label1.LinkMode = 0
    
    Screen.MousePointer = 0
End Sub

'----------------------------------------------------------
' Check for the existence of a file by attempting an OPEN.
'----------------------------------------------------------
Function FileExists(path$) As Integer

    X = FreeFile

    On Error Resume Next
    Open path$ For Input As X
    If Err = 0 Then
        FileExists = True
    Else
        FileExists = False
    End If
    Close X

End Function

'-----------------------------------------------------------
' FUNCTION: GetDiskSpaceFree
'
' Obtient la quantité d'espace disque libre pour le lecteur
' spécifié.
'
' ENTREE: [strDrive] - lecteur
'
' RENVOIE: La quantité d'espace libre, ou -1 si une erreur
' s'est produite.
'-----------------------------------------------------------
'
Function GetDiskSpaceFree(ByVal strDrive As String) As Long
    Dim strCurDrive As String
    Dim lDiskFree As Long

    On Error Resume Next

    '
    ' Enregistre le lecteur en cours.
    '
    strCurDrive = Left$(CurDir$, 2)

    '
    ' Récupère seulement la lettre du lecteur et le caractère ':'.
    '
    If InStr(strDrive, ":") = 0 Or Len(strDrive) > 2 Then
        strDrive = Left$(strDrive, 1) & ":"
    End If

    '
    ' Change le lecteur par défaut. La fonction API DiskSpaceFree() utilise
    ' uniquement le lecteur par défaut.
    '
    ChDrive strDrive

    '
    ' S'il n'est pas possible de changer la version de lecteur demandée, c'est une
    ' erreur, sinon renvoie la quantité d'espace disque libre.
    '
    If Err <> 0 Or (strDrive <> Left$(CurDir$, 2)) Then
        lDiskFree = -1
    Else
        lDiskFree = DiskSpaceFree()
        If Err <> 0 Then    ' Si la DLL du programme d'installation ne peut pas être trouvée.
            lDiskFree = -1
        End If
    End If

    If lDiskFree = -1 Then
        MsgBox "L'unité " & drive & " est indisponible.", MB_ICONSTOP, NomApplication
    End If

    GetDiskSpaceFree = lDiskFree

    '
    ' Remplace le lecteur en cours.
    '
    ChDrive strCurDrive

    Err = 0
End Function


'----------------------------------------------------
' Get the disk Allocation unit for the current drive
'----------------------------------------------------
Function GetDrivesAllocUnit(drive As String) As Long
    ChDrive drive
    GetDrivesAllocUnit = AllocUnit()
End Function

'------------------------
' Get the size of the file
'------------------------
Function GetFileSize(Source$) As Long
    X = FreeFile
    Open Source$ For Binary Access Read As X
    GetFileSize = LOF(X)
    Close X
End Function

'--------------------------------------------------
' Calls the windows API to get the windows directory
'--------------------------------------------------
Function GetWindowsDir() As String
    temp$ = String$(145, 0)              ' Size Buffer
    X = GetWindowsDirectory(temp$, 145)  ' Make API Call
    temp$ = Left$(temp$, X)              ' Trim Buffer

    If right$(temp$, 1) <> "\" Then      ' Add \ if necessary
        GetWindowsDir$ = temp$ + "\"
    Else
        GetWindowsDir$ = temp$
    End If
End Function

'---------------------------------------------------------
' Calls the windows API to get the windows\SYSTEM directory
'---------------------------------------------------------
Function GetWindowsSysDir() As String
    temp$ = String$(145, 0)                 ' Size Buffer
    X = GetSystemDirectory(temp$, 145)      ' Make API Call
    temp$ = Left$(temp$, X)                 ' Trim Buffer

    If right$(temp$, 1) <> "\" Then         ' Add \ if necessary
        GetWindowsSysDir$ = temp$ + "\"
    Else
        GetWindowsSysDir$ = temp$
    End If
End Function

Sub initlangue()

Dim chaine As String * 100
Dim cr As Integer

    cr = GetProfileString("intl", "slanguage", "", chaine, 100)
    If Left$(chaine, cr) = "fra" Then
        anglais = False
    Else
        anglais = True
    End If
    
End Sub

'------------------------------------------------------
' Function:   IsValidPath as integer
' arguments:  DestPath$         a string that is a full path
'             DefaultDrive$     the default drive.  eg.  "C:"
'
'  If DestPath$ does not include a drive specification,
'  IsValidPath uses Default Drive
'
'  When IsValidPath is finished, DestPath$ is reformated
'  to the format "X:\dir\dir\dir\"
'
' Result:  True (-1) if path is valid.
'          False (0) if path is invalid
'-------------------------------------------------------
Function IsValidPath(DestPath$, ByVal DefaultDrive$) As Integer

    '----------------------------
    ' Remove left and right spaces
    '----------------------------
    DestPath$ = RTrim$(LTrim$(DestPath$))
    

    '-----------------------------
    ' Check Default Drive Parameter
    '-----------------------------
    If right$(DefaultDrive$, 1) <> ":" Or Len(DefaultDrive$) <> 2 Then
        If anglais Then
            MsgBox "Bad default drive parameter specified in IsValidPath Function.  You passed,  """ + DefaultDrive$ + """.  Must be one drive letter and "":"".  For example, ""C:"", ""D:""...", 64, "Setup Kit Error"
        Else
            MsgBox "Mauvais paramètre d'unité par défaut spécifié dans la fonction IsValidPath.  Vous passez,  """ + DefaultDrive$ + """. Ce doit être une lettre suivie de "":"".  Par exemple, ""C:"", ""D:""...", 64, "Erreur interne à l'installation"
        End If
        GoTo parseErr
    End If
    

    '-------------------------------------------------------
    ' Insert default drive if path begins with root backslash
    '-------------------------------------------------------
    If Left$(DestPath$, 1) = "\" Then
        DestPath$ = DefaultDrive + DestPath$
    End If
    
    '-----------------------------
    ' check for invalid characters
    '-----------------------------
    On Error Resume Next
    tmp$ = Dir$(DestPath$)
    If Err <> 0 Then
        GoTo parseErr
    End If
    

    '-----------------------------------------
    ' Check for wildcard characters and spaces
    '-----------------------------------------
    If (InStr(DestPath$, "*") <> 0) Then GoTo parseErr
    If (InStr(DestPath$, "?") <> 0) Then GoTo parseErr
    If (InStr(DestPath$, " ") <> 0) Then GoTo parseErr
         
    
    '------------------------------------------
    ' Make Sure colon is in second char position
    '------------------------------------------
    If Mid$(DestPath$, 2, 1) <> Chr$(58) Then GoTo parseErr
    

    '-------------------------------
    ' Insert root backslash if needed
    '-------------------------------
    If Len(DestPath$) > 2 Then
      If right$(Left$(DestPath$, 3), 1) <> "\" Then
        DestPath$ = Left$(DestPath$, 2) + "\" + right$(DestPath$, Len(DestPath$) - 2)
      End If
    End If

    '-------------------------
    ' Check drive to install on
    '-------------------------
    drive$ = Left$(DestPath$, 1)
    ChDrive (drive$)                                                        ' Try to change to the dest drive
    If Err <> 0 Then GoTo parseErr
    
    '-----------
    ' Add final \
    '-----------
    If right$(DestPath$, 1) <> "\" Then
        DestPath$ = DestPath$ + "\"
    End If
    

    '-------------------------------------
    ' Root dir is a valid dir
    '-------------------------------------
    If Len(DestPath$) = 3 Then
        If right$(DestPath$, 2) = ":\" Then
            GoTo ParseOK
        End If
    End If
    

    '------------------------
    ' Check for repeated Slash
    '------------------------
    If InStr(DestPath$, "\\") <> 0 Then GoTo parseErr
        
    '--------------------------------------
    ' Check for illegal directory names
    '--------------------------------------
    legalChar$ = "!#$%&'()-0123456789@ABCDEFGHIJKLMNOPQRSTUVWXYZ^_`{}~."
    BackPos = 3
    forePos = InStr(4, DestPath$, "\")
    Do
        temp$ = Mid$(DestPath$, BackPos + 1, forePos - BackPos - 1)
        
        '----------------------------
        ' Test for illegal characters
        '----------------------------
        For i = 1 To Len(temp$)
            If InStr(legalChar$, UCase$(Mid$(temp$, i, 1))) = 0 Then GoTo parseErr
        Next i

        '-------------------------------------------
        ' Check combinations of periods and lengths
        '-------------------------------------------
        periodPos = InStr(temp$, ".")
        length = Len(temp$)
        If periodPos = 0 Then
            If length > 8 Then GoTo parseErr                         ' Base too long
        Else
            If periodPos > 9 Then GoTo parseErr                      ' Base too long
            If length > periodPos + 3 Then GoTo parseErr             ' Extension too long
            If InStr(periodPos + 1, temp$, ".") <> 0 Then GoTo parseErr ' Two periods not allowed
        End If

        BackPos = forePos
        forePos = InStr(BackPos + 1, DestPath$, "\")
    Loop Until forePos = 0

ParseOK:
    IsValidPath = True
    Exit Function

parseErr:
    IsValidPath = False
End Function

'----------------------------------------------------
' Prompt for the next disk.  Use the FileToLookFor$
' argument to verify that the proper disk, disk number
' wDiskNum, was inserted.
'----------------------------------------------------
Function PromptForNextDisk(wDiskNum As Integer, FileToLookFor$) As Integer

    '-------------------------
    ' Test for file
    '-------------------------
    Ready = False
    On Error Resume Next
    temp$ = Dir$(FileToLookFor$)

    '------------------------
    ' If not found, start loop
    '------------------------
    If Err <> 0 Or Len(temp$) = 0 Then
        While Not Ready
            '----------------------------
            ' Put up msg box
            '----------------------------
            Beep
            If anglais Then
                X = MsgBox("The source directory doesn't contain the " & AppName & " disk. Please insert disk # " + Format$(wDiskNum%), 49, "SETUP")
            Else
                X = MsgBox("Le répertoire source ne contient pas la disquette d'installation de " & AppName & ". Insérez le disque # " + Format$(wDiskNum%), 49, "Installation")
            End If
            If X = 2 Then
                '-------------------------------
                ' Use hit cancel, abort the copy
                '-------------------------------
                PromptForNextDisk = False
                GoTo ExitProc
            Else
                '----------------------------------------
                ' User hits OK, try to find the file again
                '----------------------------------------
                temp$ = Dir$(FileToLookFor$)
                If Err = 0 And Len(temp$) <> 0 Then
                    PromptForNextDisk = True
                    Ready = True
                End If
            End If
        Wend
    Else
        PromptForNextDisk = True
    End If

    

ExitProc:

End Function

Sub RestoreProgMan()
    On Error Resume Next
    
    AppActivate "Program Manager"   ' Activate Program Manager.
    If Err Then
    AppActivate "Gestionnaire de programmes"
    End If
    SendKeys "%{ }{Enter}", True      ' Send Restore keystrokes.
End Sub

'-----------------------------------------------------------------------------
' Set the Destination File's date and time to the Source file's date and time
'-----------------------------------------------------------------------------
Function SetFileDateTime(SourceFile As String, DestinationFile As String) As Integer
    X = SetTime(SourceFile, DestinationFile)
    SetFileDateTime = -1
End Function

Sub UpdateStatus(FileBytes As Long)
'-----------------------------------------------------------------------------
' Update the status bar using form.control Statusdlg.Picture2
'-----------------------------------------------------------------------------
    
    Dim estTotal As Long

    estTotal = Val(StatusDlg.total.Tag)
    If estTotal = False Then
        estTotal = 10000000
    End If

    position = position + CSng((FileBytes / estTotal) * 100)
    If position > 100 Then
        position = 100
    End If
    StatusDlg.Picture2.Cls
    StatusDlg.Picture2.Line (0, 0)-((position * (StatusDlg.Picture2.ScaleWidth / 100)), StatusDlg.Picture2.ScaleHeight), &HFFFF00, BF

    Txt$ = Format$(CLng(position)) + "%"
    StatusDlg.Picture2.CurrentX = (StatusDlg.Picture2.ScaleWidth - StatusDlg.Picture2.TextWidth(Txt$)) \ 2
    StatusDlg.Picture2.CurrentY = (StatusDlg.Picture2.ScaleHeight - StatusDlg.Picture2.TextHeight(Txt$)) \ 2
    StatusDlg.Picture2.Print Txt$

    r = BitBlt(StatusDlg.Picture1.hDC, 0, 0, StatusDlg.Picture2.ScaleWidth, StatusDlg.Picture2.ScaleHeight, StatusDlg.Picture2.hDC, 0, 0, SRCCOPY)

End Sub

