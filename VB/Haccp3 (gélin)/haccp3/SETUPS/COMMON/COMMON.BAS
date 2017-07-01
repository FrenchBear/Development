Attribute VB_Name = "basCommon"
Option Explicit
Option Compare Text

'
' Constantes globales.
'
Global Const gstrNULL$ = ""                     ' Chaîne vide.
Global Const gstrSEP_DIR$ = "\"                 ' Caractère de séparation de répertoire.
Global Const gstrSEP_DIRALT$ = "/"              ' Caractère de séparation de répertoire
                                                ' alternatif.
Global Const gstrSEP_EXT$ = "."                 ' Catactère de séparation de l'extension
                                                ' de nom de fichier.
Global Const gstrCOLON$ = ":"
Global Const gstrSwitchPrefix1 = "-"
Global Const gstrSwitchPrefix2 = "/"
Global Const gstrCOMMA$ = ","
Global Const gstrDECIMAL$ = "."
Global Const gstrINI_PROTOCOL = "Protocol"

Global Const gintMAX_SIZE% = 255                ' Taille maximun de tampon.
Global Const gintMIN_BUTTONWIDTH% = 1200
Global Const gsngBUTTON_BORDER! = 1.4

Global Const intDRIVE_REMOVABLE% = 2            ' Constantes pour GetDriveType.
Global Const intDRIVE_FIXED% = 3
Global Const intDRIVE_REMOTE% = 4

Global Const gintNOVERINFO% = 32767             ' Valeur d'indicateur flag d'aucune information
                                                ' de version.

' Noms de fichier.
Global Const gstrFILE_SETUP$ = "SETUP.LST"      ' Nom du fichier d'informations d'installation.

' Macro pour le type de partage de fichier.
Global Const mstrPRIVATEFILE = ""
Global Const mstrSHAREDFILE = "$(Shared)"

' Clé du fichier INI.
#If Win16 Then
Global Const gstrINI_BTRIEVE$ = "Btrieve"
#End If
Global Const gstrINI_SETUP$ = "Setup"
Global Const gstrINI_APPNAME$ = "Title"
Global Const gstrINI_APPDIR$ = "DefaultDir"
Global Const gstrINI_APPEXE$ = "AppExe"
Global Const gstrINI_APPPATH$ = "AppPath"
Global Const gstrINI_FORCEUSEDEFDEST = "ForceUseDefDir"

' Macros du fichier d'informations d'installation.
Global Const gstrAPPDEST$ = "$(AppPath)"
Global Const gstrWINDEST$ = "$(WinPath)"
Global Const gstrWINSYSDEST$ = "$(WinSysPath)"
Global Const gstrWINSYSDESTSYSFILE$ = "$(WinSysPathSysFile)"
Global Const gstrPROGRAMFILES$ = "$(ProgramFiles)"
Global Const gstrCOMMONFILES$ = "$(CommonFiles)"
Global Const gstrCOMMONFILESSYS$ = "$(CommonFilesSys)"
Global Const gstrDAODEST$ = "$(MSDAOPath)"

' Constantes du pointeur de souris.
Global Const gintMOUSE_DEFAULT% = 0
Global Const gintMOUSE_HOURGLASS% = 11

' Constante de MsgError().
Global Const MSGERR_ERROR = 1
Global Const MSGERR_WARNING = 2

' Constantes de MsgBox.
Global Const MB_OK = 0                                  ' Bouton OK seulement.
Global Const MB_OKCANCEL = 1                            ' Boutons OK et Annuler.
Global Const MB_ABORTRETRYIGNORE = 2                    ' Boutons Arrêter, Réessayer et Ignorer.
Global Const MB_YESNO = 4                               ' Boutons Oui et Non.
Global Const MB_RETRYCANCEL = 5                         ' Boutons Réessayer et Ignorer.
Global Const MB_ICONSTOP = 16                           ' Message critique.
Global Const MB_ICONQUESTION = 32                       ' Messages de question.
Global Const MB_ICONEXCLAMATION = 48                    ' Message d'avertissement.
Global Const MB_ICONINFORMATION = 64                    ' Message d'information.
Global Const MB_DEFBUTTON1 = 0                          ' Premier bouton par défaut.
Global Const MB_DEFBUTTON2 = 256                        ' Second bouton par défaut.
Global Const MB_DEFBUTTON3 = 512                        ' Troisième bouton par défaut.

' Valeurs renvoyées par MsgBox.
Global Const IDOK = 1                                   ' Bouton OK pressé.
Global Const IDCANCEL = 2                               ' Bouton Annuler pressé.
Global Const IDABORT = 3                                ' Bouton Arrêter pressé.
Global Const IDRETRY = 4                                ' Bouton Réessayer pressé.
Global Const IDIGNORE = 5                               ' Bouton Ignorer pressé.
Global Const IDYES = 6                                  ' Bouton Oui pressé.
Global Const IDNO = 7                                   ' Bouton Non pressé.

'
' Définitions de types.
'
Type OFSTRUCT
    cBytes As Byte
    fFixedDisk As Byte
    nErrCode As Integer
    nReserved1 As Integer
    nReserved2 As Integer
    szPathName As String * 256
End Type

Type VERINFO                    ' FIXEDFILEINFO Version.
    strPad1 As Long             ' Complète la structure version.
    strPad2 As Long             ' Complète la structure signature.
    nMSLo As Integer            ' Mot bas du numéro de version de MS DWord.
    nMSHi As Integer            ' Mot haut du numéto de version de MS DWord.
    nLSLo As Integer            ' Mot bas du numéro de version de LS DWord.
    nLSHi As Integer            ' Mot haut du numéro de version de LS DWord.
    strPad3(1 To 36) As Byte    ' Complète le reste de la structure VERINFO (36 octets).
End Type

Type PROTOCOL
    strName As String
    strFriendlyName As String
End Type

Global Const OF_EXIST& = &H4000&
Global Const OF_SEARCH& = &H400&
Global Const HFILE_ERROR% = -1

'
' Variables globales.
'
Global LF$                                              ' Un saut de ligne.
Global LS$                                              ' Deux sauts de ligne.

' Liste des protocoles disponibles.
Global gProtocol() As PROTOCOL
Global gcProtocols As Integer


#If Win16 Then
'
' Déclarations des API pour le programme d'installation 16 bits.
'
Declare Function DiskSpaceFree Lib "STKIT416.DLL" () As Long
Declare Function SetTime Lib "STKIT416.DLL" (ByVal strFileGetTime As String, ByVal strFileSetTime As String) As Integer
Declare Function AllocUnit Lib "STKIT416.DLL" () As Long
Declare Function GetWinPlatform Lib "STKIT416.DLL" () As Long
Declare Function DLLSelfRegister Lib "STKIT416.DLL" (ByVal lpDllName As String) As Integer
Declare Sub lmemcpy Lib "STKIT416.DLL" (strDest As Any, ByVal strSrc As Any, ByVal intBytes As Integer)

Declare Function OpenFile Lib "Kernel" (ByVal lpFileName As String, lpReOpenBuff As OFSTRUCT, ByVal wStyle As Integer) As Integer
Declare Function GetPrivateProfileString Lib "Kernel" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Integer, ByVal lpFileName As String) As Integer
Declare Function WritePrivateProfileString Lib "Kernel" (ByVal lpApplicationName As Any, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lplFileName As String) As Integer
Declare Function GetWindowsDirectory Lib "Kernel" (ByVal lpBuffer As String, ByVal nSize As Integer) As Integer
Declare Function GetSystemDirectory Lib "Kernel" (ByVal lpBuffer As String, ByVal nSize As Integer) As Integer
Declare Function GetDriveType16 Lib "Kernel" Alias "GetDriveType" (ByVal intDriveNum As Integer) As Integer
Declare Function GetTempFileName16 Lib "Kernel" Alias "GetTempFileName" (ByVal cDriveLetter As Integer, ByVal lpPrefixString As String, ByVal wUnique As Integer, ByVal lpTempFileName As String) As Integer

Declare Function VerInstallFile Lib "VER.DLL" (ByVal Flags%, ByVal SrcName$, ByVal DestName$, ByVal SrcDir$, ByVal DestDir$, ByVal CurrDir As Any, ByVal TmpName$, lpTmpFileLen&) As Long
Declare Function GetFileVersionInfoSize Lib "VER.DLL" (ByVal strFileName As String, lVerHandle As Long) As Long
Declare Function GetFileVersionInfo Lib "VER.DLL" (ByVal strFileName As String, ByVal lVerHandle As Long, ByVal lcbSize As Long, lpvData As Byte) As Integer
Declare Function VerQueryValue Lib "VER.DLL" (lpvVerData As Byte, ByVal lpszSubBlock As String, lplpBuf As Long, lpcb As Long) As Integer

Declare Function GetModuleUsage Lib "Kernel" (ByVal hModule As Integer) As Integer

'-----------------------------------------------------------
' FUNCTION: FSyncShell
'
' Exécute un programme externe et attend qu'il soit fini.
'
' Renvoie : Vrai (True) si le programme a démarré,
'           faux (False) sinon.
'-----------------------------------------------------------
'
Function FSyncShell(ByVal strExeName As String, intCmdShow As Integer) As Integer
    Const HINSTANCE_ERROR% = 32
    
    Dim hInstChild As Integer

    '
    ' Programme exécuté par la fonction Shell, si Shell fonctionne, entre dans la boucle.
    '
    hInstChild = Shell(strExeName, intCmdShow)
    If hInstChild >= HINSTANCE_ERROR Then
        While GetModuleUsage(hInstChild)
            DoEvents
        Wend
    End If

    FSyncShell = IIf(hInstChild < HINSTANCE_ERROR, False, True)
End Function

#Else

'
' Déclarations des API pour le programme d'installation 32 bits.
'
Declare Function DiskSpaceFree Lib "STKIT432.DLL" Alias "DISKSPACEFREE" () As Long
Declare Function SetTime Lib "STKIT432.DLL" (ByVal strFileGetTime As String, ByVal strFileSetTime As String) As Integer
Declare Function AllocUnit Lib "STKIT432.DLL" () As Long
Declare Function GetWinPlatform Lib "STKIT432.DLL" () As Long
Declare Function fNTWithShell Lib "STKIT432.DLL" () As Boolean
Declare Function FSyncShell Lib "STKIT432.DLL" Alias "SyncShell" (ByVal strCmdLine As String, ByVal intCmdShow As Long) As Long
Declare Function DLLSelfRegister Lib "STKIT432.DLL" (ByVal lpDllName As String) As Integer
Declare Sub lmemcpy Lib "STKIT432.DLL" (strDest As Any, ByVal strSrc As Any, ByVal lBytes As Long)
Declare Function OSfCreateShellGroup Lib "STKIT432.DLL" Alias "fCreateShellFolder" (ByVal lpstrDirName As String) As Long
Declare Function OSfCreateShellLink Lib "STKIT432.DLL" Alias "fCreateShellLink" (ByVal lpstrFolderName As String, ByVal lpstrLinkName As String, ByVal lpstrLinkPath As String, ByVal lpstrLinkArguments As String) As Long
Declare Function OSfRemoveShellLink Lib "STKIT432.DLL" Alias "fRemoveShellLink" (ByVal lpstrFolderName As String, ByVal lpstrLinkName As String) As Long
Private Declare Function OSGetLongPathName Lib "STKIT432.DLL" Alias "GetLongPathName" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long

Declare Function OpenFile Lib "Kernel32" (ByVal lpFileName As String, lpReOpenBuff As OFSTRUCT, ByVal wStyle As Long) As Long
Declare Function GetPrivateProfileString Lib "Kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal lSize As Long, ByVal lpFileName As String) As Long
Declare Function WritePrivateProfileString Lib "Kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As Any, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lplFileName As String) As Long
Declare Function GetWindowsDirectory Lib "Kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Declare Function GetSystemDirectory Lib "Kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Declare Function GetDriveType32 Lib "Kernel32" Alias "GetDriveTypeA" (ByVal strWhichDrive As String) As Long
Declare Function GetTempFileName32 Lib "Kernel32" Alias "GetTempFileNameA" (ByVal strWhichDrive As String, ByVal lpPrefixString As String, ByVal wUnique As Integer, ByVal lpTempFileName As String) As Long

Declare Function VerInstallFile Lib "VERSION.DLL" Alias "VerInstallFileA" (ByVal Flags&, ByVal SrcName$, ByVal DestName$, ByVal SrcDir$, ByVal DestDir$, ByVal CurrDir As Any, ByVal TmpName$, lpTmpFileLen&) As Long
Declare Function GetFileVersionInfoSize Lib "VERSION.DLL" Alias "GetFileVersionInfoSizeA" (ByVal strFileName As String, lVerHandle As Long) As Long
Declare Function GetFileVersionInfo Lib "VERSION.DLL" Alias "GetFileVersionInfoA" (ByVal strFileName As String, ByVal lVerHandle As Long, ByVal lcbSize As Long, lpvData As Byte) As Long
Declare Function VerQueryValue Lib "VERSION.DLL" Alias "VerQueryValueA" (lpvVerData As Byte, ByVal lpszSubBlock As String, lplpBuf As Long, lpcb As Long) As Long
Private Declare Function OSGetShortPathName Lib "Kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long
#End If

'-----------------------------------------------------------
' SUB: AddDirSep
'
' Ajoute un séparateur de répertoire (anti-slash) à la fin
' de la ligne à moins qu'il y en a déjà un.
'
' ENTREE/SORTIE: [strPathName] - chemin où ajouter le séparateur.
'-----------------------------------------------------------
'
Sub AddDirSep(strPathName As String)
    If Right$(RTrim$(strPathName), Len(gstrSEP_DIR)) <> gstrSEP_DIR Then
        strPathName = RTrim$(strPathName) & gstrSEP_DIR
    End If
End Sub

'-----------------------------------------------------------
' FUNCTION: FileExists
'
' Détermine si le fichier spécifié existe.
'
' ENTREE: [strPathName] - fichier à vérifier
'
' RENVOIE: Vrai (True) si le fichier existe, Faux (False) sinon.
'-----------------------------------------------------------
'
Function FileExists(ByVal strPathName As String) As Integer
    Dim intFileNum As Integer

    On Error Resume Next

    '
    ' Supprime le caractère de séparation de répertoire.
    '
    If Right$(strPathName, 1) = gstrSEP_DIR Then
        strPathName = Left$(strPathName, Len(strPathName) - 1)
    End If

    '
    ' Essaye d'ouvrir le fichier. Si cela échoue, la fonction revoie faux (False).
    '
    intFileNum = FreeFile
    Open strPathName For Input As intFileNum

    FileExists = IIf(Err, False, True)

    Close intFileNum

    Err = 0
End Function

'-----------------------------------------------------------
' FUNCTION: GetDriveType
' Détermine si un disque est fixe, amovible, etc... En
' utilisant la fonction GetDriveType() de Windows.
'-----------------------------------------------------------
'
Function GetDriveType(ByVal intDriveNum As Integer) As Integer
    '
    ' Cette fonction attend un nombre entier pour le lecteur pour Win16 ou une chaîne en Win32.
    '
#If Win16 Then
    GetDriveType = GetDriveType16(intDriveNum)
#Else
    Dim strDriveName As String
    
    strDriveName = Chr$(Asc("A") + intDriveNum) & gstrCOLON & gstrSEP_DIR
    GetDriveType = CInt(GetDriveType32(strDriveName))
#End If
End Function

'-----------------------------------------------------------
' FUNCTION: ReadProtocols
'
' Lit les protocoles permis du fichier spécifié.
'
' ENTREE: [strInputFilename] - Nom du ficher INI.
'         [strINISection] - Nom de la section dans le fichier INI.
'-----------------------------------------------------------
Function ReadProtocols(ByVal strInputFilename As String, ByVal strINISection As String) As Boolean
    Dim intIdx As Integer
    Dim fOK As Boolean
    Dim strInfo As String
    Dim intOffset As Integer
    
    intIdx = 0
    fOK = True
    Erase gProtocol
    gcProtocols = 0
    
    Do
        strInfo = ReadIniFile(strInputFilename, strINISection, gstrINI_PROTOCOL & Format$(intIdx + 1))
        If strInfo <> gstrNULL Then
            intOffset = InStr(strInfo, gstrCOMMA)
            If intOffset > 0 Then
                ' Le nom court sera le permier de la ligne.
                ReDim Preserve gProtocol(intIdx + 1)
                gcProtocols = intIdx + 1
                gProtocol(intIdx + 1).strName = Left$(strInfo, intOffset - 1)
                
                ' Le second nom est le nom complet.
                gProtocol(intIdx + 1).strFriendlyName = Mid$(strInfo, intOffset + 1)
                If (gProtocol(intIdx + 1).strName = "") Or (gProtocol(intIdx + 1).strFriendlyName = "") Then
                    fOK = False
                End If
            Else
                fOK = False
            End If

            If Not fOK Then
                Exit Do
            Else
                intIdx = intIdx + 1
            End If
        End If
    Loop While strInfo <> gstrNULL
    
    ReadProtocols = fOK
End Function

'-----------------------------------------------------------
' FUNCTION: ResolveResString
' Lit une ressource et remplace une macro donnée par sa valeur.
'
' Exemple, avec le numéro de ressource 907:
'    "La séquence de protocole '|1' ('|2') est incorrecte"
'   L'appel suivant...
'     ResolveResString(901, "|1", "ncacn_ip_tcp", "|2", "TCP/IP")
'   ResolveResString eenvoie la chaîne...
'     "La séquence de protocole 'ncacn_ip_tcp' ('TCP/IP') est incorrecte"
'
' ENTREE: [resID] - l'identificateur de ressource.
'         [varReplacements] - paires de valeurs macro/remplacement.
'-----------------------------------------------------------
'
Function ResolveResString(ByVal resID As Integer, ParamArray varReplacements() As Variant) As String
    Dim intMacro As Integer
    Dim strResString As String
    
    strResString = LoadResString(resID)
    
    ' Pour chaque paire de macros/valeurs passées...
    For intMacro = LBound(varReplacements) To UBound(varReplacements) Step 2
        Dim strMacro As String
        Dim strValue As String
        
        strMacro = varReplacements(intMacro)
        On Error GoTo MismatchedPairs
        strValue = varReplacements(intMacro + 1)
        On Error GoTo 0
        
        ' Remplace toutes les occurences de strMacro avec strValue.
        Dim intPos As Integer
        Do
            intPos = InStr(strResString, strMacro)
            If intPos > 0 Then
                strResString = Left$(strResString, intPos - 1) & strValue & Right$(strResString, Len(strResString) - Len(strMacro) - intPos + 1)
            End If
        Loop Until intPos = 0
    Next intMacro
    
    ResolveResString = strResString
    
    Exit Function
    
MismatchedPairs:
    Resume Next
End Function

 '-----------------------------------------------------------
 ' FUNCTION GetLongPathName
 '
 ' Recherche le nom long d'un chemin contenant des noms de
 ' fichiers/répertoires courts.
 '-----------------------------------------------------------
 '
 #If Win32 Then
 Function GetLongPathName(ByVal strShortPath As String) As String
     Const cchBuffer = 300
     Dim strLongPath As String * cchBuffer
     Dim lResult As Long

     On Error GoTo 0
     lResult = OSGetLongPathName(strShortPath, strLongPath, cchBuffer)
     If lResult = 0 Then
         Error 53 ' Fichier introuvable.
     Else
         GetLongPathName = StripTerminator(strLongPath)
     End If
 End Function
 #End If
 
 '-----------------------------------------------------------
 ' FUNCTION GetShortPathName
 '
 ' Recherche le nom court d'un chemin contenant des noms de
 ' fichiers/répertoires longs.
 '-----------------------------------------------------------
 '
 #If Win32 Then
 Function GetShortPathName(ByVal strLongPath As String) As String
     Const cchBuffer = 300
     Dim strShortPath As String * cchBuffer
     Dim lResult As Long

     On Error GoTo 0
     lResult = OSGetShortPathName(strLongPath, strShortPath, cchBuffer)
     If lResult = 0 Then
         Error 53 ' Fichier introuvable.
     Else
         GetShortPathName = StripTerminator(strShortPath)
     End If
 End Function
 #End If
 
'-----------------------------------------------------------
' FUNCTION: GetTempFileName
'
' Obtient un nom de fichier temporaire pour un lecteur
' spécifié et un préfixe de nom de fichier.
'-----------------------------------------------------------
'
Function GetTempFileName(ByVal cDriveLetter As Integer, ByVal lpPrefixString As String, ByVal wUnique As Integer, lpTempFileName As String) As Integer
    '
    ' Cette fonction attent un nombre entier pour le lecteur pour Win16 ou une chaîne en Win32.
    '
#If Win16 Then
    GetTempFileName = GetTempFileName16(cDriveLetter, lpPrefixString, wUnique, lpTempFileName)
#Else
    Dim strDriveName As String
    
    strDriveName = Chr$(Asc("A") + cDriveLetter) & gstrCOLON & gstrSEP_DIR
    GetTempFileName = CInt(GetTempFileName32(strDriveName, lpPrefixString, wUnique, lpTempFileName))
#End If
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
    If InStr(strDrive, gstrCOLON) = 0 Or Len(strDrive) > 2 Then
        strDrive = Left$(strDrive, 1) & gstrCOLON
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
        MsgError Error$ & LS$ & ResolveResString(resDISKSPCERR) & strDrive, MB_ICONEXCLAMATION, gstrTitle
    End If

    GetDiskSpaceFree = lDiskFree

    '
    ' Remplace le lecteur en cours.
    '
    ChDrive strCurDrive

    Err = 0
End Function

'-----------------------------------------------------------
' FUNCTION: GetUNCShareName
'
' En donnant un nom UNC, renvoie la part la plus à gauche
' du répertoire représentant le nom de la machine et le
' nom du partage. Ex. avec "\\TAHITI\PUBLIC\APPS\LISTING.TXT",
' renvoie la chaîne "\\TAHITI\PUBLIC".
'
'-----------------------------------------------------------
'
Function GetUNCShareName(ByVal strFN As String) As Variant
    GetUNCShareName = Null
    If IsUNCName(strFN) Then
        Dim iFirstSeparator As Integer
        iFirstSeparator = InStr(3, strFN, gstrSEP_DIR)
        If iFirstSeparator > 0 Then
            Dim iSecondSeparator As Integer
            iSecondSeparator = InStr(iFirstSeparator + 1, strFN, gstrSEP_DIR)
            If iSecondSeparator > 0 Then
                GetUNCShareName = Left$(strFN, iSecondSeparator - 1)
            Else
                GetUNCShareName = strFN
            End If
        End If
    End If
End Function

'-----------------------------------------------------------
' FUNCTION: GetWindowsSysDir
'
' Appel une fonction API de Windows pour obtenir le répertoire
' système de Windows et s'assure que le dernier séparateur
' de répertoire est ajouté.
'
' RENVOIE: le répertoire système de Windows.
'-----------------------------------------------------------
'
Function GetWindowsSysDir() As String
    Dim strBuf As String

    strBuf = Space$(gintMAX_SIZE)

    '
    ' Obtient le répertoire système de Windows et ajoute un séparateur
    ' de répertoire (anti-slash).
    '
    If GetSystemDirectory(strBuf, gintMAX_SIZE) > 0 Then
        strBuf = StripTerminator(strBuf)
        AddDirSep strBuf
        
        GetWindowsSysDir = UCase16(strBuf)
    Else
        GetWindowsSysDir = gstrNULL
    End If
End Function

'-----------------------------------------------------------
' FUNCTION: IsWin32
'
' Renvoie vrai (True) si ce programme s'exécute sous Win32
' (un système d'exploitation 32 bits).
'-----------------------------------------------------------
'
Function IsWin32() As Boolean
    IsWin32 = (IsWindows95() Or IsWindowsNT())
End Function

'-----------------------------------------------------------
' FUNCTION: IsWindows95
'
' Renvoie vrai (True) si ce programme s'exécute sous
' Windows 95 ou un de ses successeurs.
'-----------------------------------------------------------
'
Function IsWindows95() As Boolean
    Const dwMask95 = &H2&
    If GetWinPlatform() And dwMask95 Then
        IsWindows95 = True
    Else
        IsWindows95 = False
    End If
End Function

'-----------------------------------------------------------
' FUNCTION: IsWindowsNT
'
' Renvoie vrai (True) si ce programme s'exécute sous Windows NT.
'-----------------------------------------------------------
'
Function IsWindowsNT() As Boolean
    Const dwMaskNT = &H1&
    If GetWinPlatform() And dwMaskNT Then
        IsWindowsNT = True
    Else
        IsWindowsNT = False
    End If
End Function

'-----------------------------------------------------------
' FUNCTION: IsUNCName
'
' Détermine si le nom de chemin spécifié est un nom d'UNC.
' Les noms d'UNC (Universal Naming Convention = Convention
' de nomage universelle) sont typiquement utilisé pour
' spécifier une ressource d'une machine, comme un partage
' réseau à distance, un canaux nommé, etc... Un exemple de
' nom UNC est "\\SERVER\SHARE\FILENAME.EXT".
'
' ENTREE: [strPathName] - Nom de chemin à vérifier
'
' Renvoie: Vrai (True) si le nom de chemin est un UNC,
'          faux (False) sinon.
'-----------------------------------------------------------
'
Function IsUNCName(ByVal strPathName As String) As Integer
    Const strUNCNAME$ = "\\//\"        ' Vérifier pour \\, //, \/, /\

    IsUNCName = IIf(InStr(strUNCNAME, Left$(strPathName, 2)) > 0, True, False)
End Function

'-----------------------------------------------------------
' FUNCTION: MakePathAux
'
' Crée le chemin de répertoire spécifié.
'
' Aucune interraction avec l'utilisateur se produit si
' une erreur est rencontrée.
'
' ENTREE: [strDirName] - nom du chemin à créer.
'
' RENVOIE: Vrai (True) en cas de succès, faux (False) sinon.
'-----------------------------------------------------------
'
Function MakePathAux(ByVal strDirName As String) As Boolean
    Dim strPath As String
    Dim intOffset As Integer
    Dim intAnchor As Integer
    Dim strOldPath As String

    On Error Resume Next

    '
    ' Ajoute un anti-slash à la fin.
    '
    If Right$(strDirName, 1) <> gstrSEP_DIR Then
        strDirName = strDirName & gstrSEP_DIR
    End If

    strOldPath = CurDir$
    MakePathAux = False
    intAnchor = 0

    '
    ' Itération en boucle et crée chaque sous-répertoire du chemin séparément.
    '
    intOffset = InStr(intAnchor + 1, strDirName, gstrSEP_DIR)
    intAnchor = intOffset ' Comment avec au moins un anti-slash, ex. "C:\PremDir"
    Do
        intOffset = InStr(intAnchor + 1, strDirName, gstrSEP_DIR)
        intAnchor = intOffset

        If intAnchor > 0 Then
            strPath = Left$(strDirName, intOffset - 1)
            ' Détermine si le répertoire existe déjà.
            Err = 0
            ChDir strPath
            If Err Then
                ' Le répertoire doit être créé.
                Err = 0
                #If Win32 And LOGGING Then
                    NewAction gstrKEY_CREATEDIR, """" & strPath & """"
                #End If
                MkDir strPath
                #If Win32 And LOGGING Then
                    If Err Then
                        LogError ResolveResString(resMAKEDIR) & " " & strPath
                        AbortAction
                        GoTo Done
                    Else
                        CommitAction
                    End If
                #End If
            End If
        End If
    Loop Until intAnchor = 0

    MakePathAux = True
Done:
    ChDir strOldPath

    Err = 0
End Function

'-----------------------------------------------------------
' FUNCTION: MsgError
'
' Force le pointeur de souris à la valeur par défaut. Appel
' la fonction boîte de messages de Visual Basic, enregistre
' cette erreur et (32 bits uniquement) écrit le message et
' la réponse de l'utilisateur dans le fichier d'informations.
'
' ENTREE: [strMsg] - message à afficher.
'         [intFlags] - indicateurs du type de fonction MsgBox.
'         [strCaption] - titre de la boîte de message.
'         [intLogType] (optionnel) - le type fichier d'informations à créer.
'                      Par défaut, crée une entrée pour l'erreur. Utilise
'                      la fonction MsgWarning() pour créer un avertissement.
'                      Les types valides sont MSGERR_ERROR et MSGERR_WARNING.
'
' Renvoie: Le résultat de la fonction MsgBox.
'-----------------------------------------------------------
'
Function MsgError(ByVal strMsg As String, ByVal intFlags As Integer, ByVal strCaption As String, Optional ByVal intLogType As Variant) As Integer
    Dim iRet As Integer
    
    iRet = MsgFunc(strMsg, intFlags, strCaption)
    MsgError = iRet
    
    #If Win32 And LOGGING Then
        ' Il faut enregistrer cette erreur et la réponse de l'utilisateur.
        Dim strID As String
        Dim strLogMsg As String

        Select Case iRet
        Case IDOK
            strID = ResolveResString(resLOG_IDOK)
        Case IDCANCEL
            strID = ResolveResString(resLOG_IDCANCEL)
        Case IDABORT
            strID = ResolveResString(resLOG_IDABORT)
        Case IDRETRY
            strID = ResolveResString(resLOG_IDRETRY)
        Case IDIGNORE
            strID = ResolveResString(resLOG_IDIGNORE)
        Case IDYES
            strID = ResolveResString(resLOG_IDYES)
        Case IDNO
            strID = ResolveResString(resLOG_IDNO)
        Case Else
            strID = ResolveResString(resLOG_IDUNKNOWN)
        End Select

        strLogMsg = strMsg & LF$ & "(" & ResolveResString(resLOG_USERRESPONDEDWITH, "|1", strID) & ")"
        If IsMissing(intLogType) Then
            intLogType = MSGERR_ERROR
        End If
        Select Case intLogType
        Case MSGERR_WARNING
            LogWarning strLogMsg
        Case MSGERR_ERROR
            LogError strLogMsg
        Case Else
            LogError strLogMsg
        End Select
    #End If
End Function

'-----------------------------------------------------------
' FUNCTION: MsgFunc
'
' Force le pointeur de souris à la valeur par défaut et appelle
' la fonction MsgBox de Visual Basic.
'
' ENTREE: [strMsg] - message à afficher.
'         [intFlags] - indicateur de type de fonction MsgBox.
'         [strCaption] - titre de la boîte de message.
'         [fLogAsError] - S'il est présent et vrai (MSGBOX_ERR), la
'                         version 32 bits enregistre ce message et la
'                         réponse de l'utilisateur dans le fichier
'                         d'informations comme une erreur.
'
' Renvoie: Le résultat de la fonction MsgBox.
'-----------------------------------------------------------
'
Function MsgFunc(ByVal strMsg As String, ByVal intFlags As Integer, ByVal strCaption As String) As Integer
    Dim intOldPointer As Integer
  
    intOldPointer = Screen.MousePointer

    Screen.MousePointer = gintMOUSE_DEFAULT
    MsgFunc = MsgBox(strMsg, intFlags, strCaption)
    Screen.MousePointer = intOldPointer
End Function

'-----------------------------------------------------------
' FUNCTION: MsgWarning
'
' Force le pointeur de souris à la valeur par défaut. Appel
' la fonction boîte de messages de Visual Basic, enregistre
' cette erreur et (32 bits uniquement) écrit le message et
' la réponse de l'utilisateur dans le fichier d'informations.
'
' ENTREE: [strMsg] - message à afficher.
'         [intFlags] - indicateur de type de fonction MsgBox.
'         [strCaption] - titre de la boîte de message.
'
' Renvoie: Le résultat de la fonction MsgBox.
'-----------------------------------------------------------
'
Function MsgWarning(ByVal strMsg As String, ByVal intFlags As Integer, ByVal strCaption As String) As Integer
    MsgWarning = MsgError(strMsg, intFlags, strCaption, MSGERR_WARNING)
End Function

'-----------------------------------------------------------
' SUB: SetMousePtr
'
' Fournit une méthode pour définir le pointeur de souris
' seulement si l'état du pointeur change. Pour chaque
' appel avec la valeur HOURGLASS (sablier), il doit y
' avoir un appel avec la valeur DEFAULT (défaut)
' correspondant. Les autres types de pointeur de souris
' sont définis explicitement.
'
' ENTREE: [intMousePtr] - type de pointeur de souris désiré.
'-----------------------------------------------------------
'
Sub SetMousePtr(intMousePtr As Integer)
    Static intPtrState As Integer

    Select Case intMousePtr
    Case gintMOUSE_HOURGLASS
        intPtrState = intPtrState + 1
    Case gintMOUSE_DEFAULT
        intPtrState = intPtrState - 1
        If intPtrState < 0 Then
            intPtrState = 0
        End If
    Case Else
        Screen.MousePointer = intMousePtr
        Exit Sub
    End Select

    Screen.MousePointer = IIf(intPtrState > 0, gintMOUSE_HOURGLASS, gintMOUSE_DEFAULT)
End Sub

'-----------------------------------------------------------
' FUNCTION: StripTerminator
'
' Renvoie une chaîne sans aucun zéro à la fin. Typiquement
' c'est pour une chaîne de renvoi par un appel à une API
' de Windows.
'
' ENTREE: [strString] - chaîne où suppression du caractère.
'
' RENVOIE: La valeur de la chaîne passée moins le catactère zéro
'          à la fin.
'-----------------------------------------------------------
'
Function StripTerminator(ByVal strString As String) As String
    Dim intZeroPos As Integer

    intZeroPos = InStr(strString, Chr$(0))
    If intZeroPos > 0 Then
        StripTerminator = Left$(strString, intZeroPos - 1)
    Else
        StripTerminator = strString
    End If
End Function

'-----------------------------------------------------------
' FUNCTION: GetFileVersion
'
' Retourne le numéro de version interne pour le fichier
' spécifié. Ceci peut être différent du numéro de version
' "affiché" dans le gestionnaire de fichier dans la fenêtre
' des propriétés du fichier. Ceci est le même nombre que celui
' affiché dans la fenêtre de détails de fichier de l'Assistant
' d'installation. C'est ce nombre qui est utilisé par la fonction
' API VerInstallFile() de Windows quand il y a comparaison de fichier.
'
' ENTREE: [strFileName] - le fichier où récupérer le numéro de version.
'         [fIsRemoteServerSupportFile] - indique si ce fichier est
'                 un fichier de support de l'Automation à distance (.VBR)
'
' RENVOIE: Le numéro de version trouvé, gstrNULL sinon.
'-----------------------------------------------------------
'
Function GetFileVersion(ByVal strFileName As String, Optional ByVal fIsRemoteServerSupportFile) As String
    Dim sVerInfo As VERINFO
    Dim strVer As String

    On Error GoTo GFVError

    If IsMissing(fIsRemoteServerSupportFile) Then
        fIsRemoteServerSupportFile = False
    End If
    
    '
    ' Obtient le numéro de version dans la structure VERINFO, et assemble une
    ' chaîne de version avec les éléments appropriés.
    '
    If GetFileVerStruct(strFileName, sVerInfo, fIsRemoteServerSupportFile) = True Then
        strVer = Format$(sVerInfo.nMSHi) & gstrDECIMAL & Format$(sVerInfo.nMSLo) & gstrDECIMAL
        strVer = strVer & Format$(sVerInfo.nLSHi) & gstrDECIMAL & Format$(sVerInfo.nLSLo)
        GetFileVersion = strVer
    Else
        GetFileVersion = gstrNULL
    End If
    
    Exit Function
    
GFVError:
    GetFileVersion = gstrNULL
    Err = 0
End Function

'-----------------------------------------------------------
' FUNCTION: GetFileVerStruct
'
' Obtient les informations de version d'un fichier d'une
' variable de type VERINFO.
'
' ENTREE: [strFileName] - le fichier où récupérer le numéro de version.
'         [fIsRemoteServerSupportFile] - indique si ce fichier est
'                 un fichier de support de l'Automation à distance (.VBR)
'
' SORTIE: [sVerInfo] - la variable de type VERINFO remplie.
'
' RENVOIE: Vrai (True) si l'information de version est trouvée,
'          Faux (False) sinon.
'-----------------------------------------------------------
'
Function GetFileVerStruct(ByVal strFileName As String, sVerInfo As VERINFO, Optional ByVal fIsRemoteServerSupportFile) As Boolean
    Const strFIXEDFILEINFO$ = "\"

    Dim lVerSize As Long
    Dim lVerHandle As Long
    Dim lpBufPtr As Long
    Dim byteVerData() As Byte

    GetFileVerStruct = False

    If IsMissing(fIsRemoteServerSupportFile) Then
        fIsRemoteServerSupportFile = False
    End If

    If fIsRemoteServerSupportFile Then
        GetFileVerStruct = GetRemoteSupportFileVerStruct(strFileName, sVerInfo)
    Else
        '
        ' Obtient la taille des informations de version, alloue le tampon, et obtient
        ' les informations de version. Après, recherche la partie fixe de l'information
        ' où le numéro de version utilisé par l'API de Windows VerInstallFilen est retenue.
        ' Copie l'information fixe dans la structure VERINFO.
        '
        lVerSize = GetFileVersionInfoSize(strFileName, lVerHandle)
        If lVerSize > 0 Then
            ReDim byteVerData(lVerSize)
            If GetFileVersionInfo(strFileName, lVerHandle, lVerSize, byteVerData(0)) <> 0 Then ' (Passe le tableau byteVerData par référence au premier élément)
                If VerQueryValue(byteVerData(0), strFIXEDFILEINFO & "", lpBufPtr, lVerSize) <> 0 Then
                    lmemcpy sVerInfo, lpBufPtr, lVerSize
                    GetFileVerStruct = True
                End If
            End If
        End If
    End If
End Function

'-----------------------------------------------------------
' FUNCTION: GetRemoteSupportFileVerStruct
'
' (Edition entreprise uniquement).
' Obtient les informations de version d'un fichier de support
' d'OLE Automation à distance dans une variable de type
' VERINFO. Un tel fichier n'a pas de numéro de version, mais
' il y un numéro de version interne qui peut être utilisé.
'
' ENTREE: [strFileName] - nom du fichier où récupérer les informations.
' SORTIE: [sVerInfo] - type VERINFO à remplir avec les informations.
'
' RENVOIE: Vrai (True) si la version est trouvée, faux sinon.
'-----------------------------------------------------------
'
Function GetRemoteSupportFileVerStruct(ByVal strFileName As String, sVerInfo As VERINFO, Optional ByVal fIsRemoteServerSupportFile) As Boolean
    Const strVersionKey = "Version="
    Dim cchVersionKey As Integer
    Dim iFile As Integer

    cchVersionKey = Len(strVersionKey)
    sVerInfo.nMSHi = gintNOVERINFO
    
    On Error GoTo Failed
    
    iFile = FreeFile

    Open strFileName For Input Access Read Lock Read Write As #iFile
    
    ' Itération en boucle sur chaque ligne, recherche la clé.
    While (Not EOF(iFile))
        Dim strLine As String

        Line Input #iFile, strLine
        If Left$(strLine, cchVersionKey) = strVersionKey Then
            ' La clé n'a pas été trouvée. Copie tout après le signe égal.
            Dim strVersion As String
            
            strVersion = Mid$(strLine, cchVersionKey + 1)
            
            ' Analyse et range les informations de version.
            PackVerInfo strVersion, sVerInfo

            ' Convertit le format 1.2.3 du fichier .VBR dans la format
            ' 1.2.0.3 voulu.
            sVerInfo.nLSLo = sVerInfo.nLSHi
            sVerInfo.nLSHi = 0
            
            GetRemoteSupportFileVerStruct = True
            Close iFile
            Exit Function
        End If
    Wend
    
    Close iFile
    Exit Function

Failed:
    GetRemoteSupportFileVerStruct = False
End Function

'-----------------------------------------------------------
' FUNCTION: GetWindowsDir
'
' Appel la fonction API de Windows pour obtenir le répertoire
' de Windows et s'assure que le séparateur de répertoire
' final est présent.
'
' RENVOIE: Le répertoire de Windows.
'-----------------------------------------------------------
'
Function GetWindowsDir() As String
    Dim strBuf As String

    strBuf = Space$(gintMAX_SIZE)

    '
    ' Obtient le répertoire de Windows et ajoute un séparateur
    ' de répertoire (anti-slash).
    '
    If GetWindowsDirectory(strBuf, gintMAX_SIZE) > 0 Then
        strBuf = StripTerminator$(strBuf)
        AddDirSep strBuf

        GetWindowsDir = UCase16(strBuf)
    Else
        GetWindowsDir = gstrNULL
    End If
End Function

'-----------------------------------------------------------
' FUNCTION: UCase16
'
' Renvoie la conversion en majuscule d'une chaîne dans un système
' 16 bits, ou envoie une chaîne non modifiée sous un système 32 bits.
'
' ENTREE: [str] - Chaîne à copier/mettre en majuscule.
'
'-----------------------------------------------------------
'
Function UCase16(ByVal str As String)
#If Win16 Then
    UCase16 = UCase$(str)
#Else
    UCase16 = str
#End If
End Function

'-----------------------------------------------------------
' FUNCTION: ExtractFilenameItem
'
' Extrait un nom de fichier avec les guillements depuis une chaîne.
'
' ENTREE: [str] - la chaîne où analyser le nom de fichier.
'         [intAnchor] - position dans la chaîne où le nom du fichier
'                 commence. Le nom du fichier continue jusqu'à la fin
'                 de la chaîne ou s'arrête à la prochaine virgule, ou, si
'                 le fichier est délimité par des guillements, jusqu'au
'                 guillement suivant.
' SORTIE: [intAnchor] est définit à la virgule, ou un caractère après
'                 la find de la chaîne.
'         [fErr] est définit à vrai (True) si une erreur d'analyse est découverte.
'
' RENVOIE : Un nom de fichier dans les guillements.
'-----------------------------------------------------------
'
Function strExtractFilenameItem(ByVal str As String, intAnchor As Integer, fErr As Boolean) As String
    While Mid$(str, intAnchor, 1) = " "
        intAnchor = intAnchor + 1
    Wend
    
    Dim iEndFilenamePos As Integer
    Dim strFileName As String
    If Mid$(str, intAnchor, 1) = """" Then
        ' Le nom du fichier est entouré de guillements.
        iEndFilenamePos = InStr(intAnchor + 1, str, """") ' Recherche le guillement correpondant.
        If iEndFilenamePos > 0 Then
            strFileName = Mid$(str, intAnchor + 1, iEndFilenamePos - 1 - intAnchor)
            intAnchor = iEndFilenamePos + 1
            While Mid$(str, intAnchor, 1) = " "
                intAnchor = intAnchor + 1
            Wend
            If (Mid$(str, intAnchor, 1) <> gstrCOMMA) And (Mid$(str, intAnchor, 1) <> "") Then
                fErr = True
                Exit Function
            End If
        Else
            fErr = True
            Exit Function
        End If
    Else
        ' Le nom du fichier continue jusqu'à la prochaine virgule et la fin de la chaîne.
        Dim iCommaPos As Integer
        
        iCommaPos = InStr(intAnchor, str, gstrCOMMA)
        If iCommaPos = 0 Then
            iCommaPos = Len(str) + 1
        End If
        iEndFilenamePos = iCommaPos
        
        strFileName = Mid$(str, intAnchor, iEndFilenamePos - intAnchor)
        intAnchor = iCommaPos
    End If
    
    strFileName = Trim$(strFileName)
    If strFileName = "" Then
        fErr = True
        Exit Function
    End If
    
    fErr = False
    strExtractFilenameItem = strFileName
End Function

'-----------------------------------------------------------
' FUNCTION: Extension
'
' Extrait l'extension d'un nom de fichier/chemin.
'
' ENTREE: [strFileName] - fichier/chemin où trouver l'extension.
'
' RENVOIE: L'extension s'il y en a une, gstrNULL sinon.
'-----------------------------------------------------------
'
Function Extension(ByVal strFileName As String) As String
    Dim intPos As Integer

    Extension = gstrNULL

    intPos = Len(strFileName)

    Do While intPos > 0
        Select Case Mid$(strFileName, intPos, 1)
        Case gstrSEP_EXT
            Extension = Mid$(strFileName, intPos + 1)
            Exit Do
        Case gstrSEP_DIR, gstrSEP_DIRALT
            Exit Do
        End Select

        intPos = intPos - 1
    Loop
End Function

'-----------------------------------------------------------
' SUB: PackVerInfo
'
' Analyse une chaîne d'informations de version de la forme
' x[.x[.x[.x]]] et affecte les nombres extraits dans les éléments
' apropriés de la variable de type VERINFO.
' Exemple d'une chaîne de version valide est '3.11.0.102',
' 3.11', '3', etc...
'
' ENTREE: [strVersion] - chaîne d'informations de version.
'
' SORTIE: [sVerInfo] - la variable de type VERINFO avec ses
'                      éléments assignés avec les nombres.
'-----------------------------------------------------------
'
Sub PackVerInfo(ByVal strVersion As String, sVerInfo As VERINFO)
    Dim intOffset As Integer
    Dim intAnchor As Integer

    On Error GoTo PVIError

    intOffset = InStr(strVersion, gstrDECIMAL)
    If intOffset = 0 Then
        sVerInfo.nMSHi = Val(strVersion)
        GoTo PVIMSLo
    Else
        sVerInfo.nMSHi = Val(Left$(strVersion, intOffset - 1))
        intAnchor = intOffset + 1
    End If

    intOffset = InStr(intAnchor, strVersion, gstrDECIMAL)
    If intOffset = 0 Then
        sVerInfo.nMSLo = Val(Mid$(strVersion, intAnchor))
        GoTo PVILSHi
    Else
        sVerInfo.nMSLo = Val(Mid$(strVersion, intAnchor, intOffset - intAnchor))
        intAnchor = intOffset + 1
    End If

    intOffset = InStr(intAnchor, strVersion, gstrDECIMAL)
    If intOffset = 0 Then
        sVerInfo.nLSHi = Val(Mid$(strVersion, intAnchor))
        GoTo PVILSLo
    Else
        sVerInfo.nLSHi = Val(Mid$(strVersion, intAnchor, intOffset - intAnchor))
        intAnchor = intOffset + 1
    End If

    intOffset = InStr(intAnchor, strVersion, gstrDECIMAL)
    If intOffset = 0 Then
        sVerInfo.nLSLo = Val(Mid$(strVersion, intAnchor))
    Else
        sVerInfo.nLSLo = Val(Mid$(strVersion, intAnchor, intOffset - intAnchor))
    End If

    Exit Sub

PVIError:
    sVerInfo.nMSHi = 0
PVIMSLo:
    sVerInfo.nMSLo = 0
PVILSHi:
    sVerInfo.nLSHi = 0
PVILSLo:
    sVerInfo.nLSLo = 0
End Sub
