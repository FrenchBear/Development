Attribute VB_Name = "Module2"
Option Explicit
Option Base 1

'API function declarations

Declare Function GetDialogBaseUnits Lib "user32" () As Long
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Integer, ByVal wp As Integer, lp As Any) As Long
Declare Function GetTextExtent Lib "GDI32" (ByVal hDC As Integer, ByVal lpString As String, ByVal nCount As Integer) As Long
Declare Function GetFileVersionInfo% Lib "Ver.dll" (ByVal Filename$, ByVal dwHandle&, ByVal cbBuff&, lpvData As Any)
Declare Function GetFileVersionInfoSize& Lib "Ver.dll" (ByVal Filename$, dwHandle&)
Declare Sub hmemcpy Lib "Kernel32" (hpvDest As Any, hpvSrc As Any, ByVal cbBytes&)
Declare Function GetWindowsDirectory Lib "Kernel32" (ByVal lpBuffer As String, ByVal nSize As Integer) As Integer


' Directory constants
Global Const ATTR_ARCHIVE = 32
Global Const ATTR_DIRECTORY = 16
Global Const ATTR_VOLUME = 8
Global Const ATTR_SYSTEM = 4
Global Const ATTR_HIDDEN = 2
Global Const ATTR_READONLY = 1
Global Const ATTR_NORMAL = 0

' Constants for API calls
Global Const WM_USER = &H400
Global Const LB_SETTABSTOPS = WM_USER + 19
Global Const EM_SETTABSTOPS = WM_USER + 27
Global Const LB_SETHORIZONTALEXTENT = WM_USER + 21
Global Const LB_DIR = WM_USER + 14

Global Const NUL = 0&


Type VS_VERSION                     'File version info
    wLength            As Integer
    wValueLength       As Integer
    szKey              As String * 16 ' "VS_VERSION_INFO"  '16
    dwSignature        As Long        ' VS_FIXEDFILEINFO struct  ' 4
    dwStrucVersion     As Long
    dwFileVersionMS    As Long
    dwFileversionLS    As Long
    dwProductVersionMS As Long
    dwProductVersionLS As Long
    dwFileFlagsMasks   As Long
    dwFileFlags        As Long
    dwFileOS           As Long
    dwFileType         As Long
    dwFileSubType      As Long
    dwFileDateMS       As Long
    dwFileDateLS       As Long
End Type

'Program version
Global Const EXEversion = "1.0 (09/11/94)"


Type FileInfo           'Info stored for each file
    Path As String
    File As String
    Size As Long
    DateTime As String
    Version As String * 15
End Type


Global ErrorOccured As Integer  'Track disk errors
Global WaitLoaded As Integer    'Track if frmWait has been loaded

'Used for getting module information
Type ModuleEntryType
    dwSize As Long
    szModule As String * 10
    hModule As Integer
    wcUsage As Integer
    szExePath As String * 256
    wNext As Integer
End Type

Declare Function ModuleFirst Lib "TOOLHELP" (m As ModuleEntryType) As Integer
Declare Function ModuleNext Lib "TOOLHELP" (m As ModuleEntryType) As Integer

Global glbFilename As String ' Global variable to pass a filename to the copy/move dialog


'Comments:

' - Code is Intel specific - it assumes a little-endian processor

Function CopyFile(Filename As String) As String
    glbFilename = Filename  ' Global variable to hold the filename
    frmCopyDest.Show 1
    CopyFile = glbFilename
End Function

Function DeleteFile(Filename As String) As Integer
Dim OK As Integer
    
On Error Resume Next

    OK = False

    If (Right$(Filename, 3) = "VBX") Or (Right$(Filename, 3) = "DLL") Then
        OK = Not IsModuleLoaded(Filename) ' Make sure the DLL is not loaded
        If Not OK Then
            MsgBox "File is currently in use"
        End If
    Else
        OK = True
    End If

    If OK Then ' We can try and delete
        Kill Filename   'Remove the file
        If Err > 0 Then
            OK = False
            MsgBox "Unable to delete file" + Chr$(13) + "File may be in use - try deleting from outside Windows"
        End If
    End If


    DeleteFile = OK

End Function

Function Filepath(Filename As String) As String
Dim i As Integer, j As Integer

    i = InStr(Filename, "\")
    j = i

    Do While i > 0
        j = i
        i = InStr(i + 1, Filename, "\")
    Loop
    Filepath = Left$(Filename, j)
End Function

Function GetVersion(FullFileName$) As String
'Get the version of a particular file
' See KB article Q112731

Dim VerInfo As VS_VERSION, BufSize As Long, dwHandle As Long
Dim lpvData As String, r As Integer, VerArr() As Integer


    'Get the buffer size required for the GetFileVersionInfo call
    BufSize = GetFileVersionInfoSize(FullFileName$, dwHandle&)
    If BufSize = 0 Then
        GetVersion = "(n/a)"
    Else
        ' Retrieve the data into a string buffer, and then ...
        lpvData = Space$(BufSize)
        r = GetFileVersionInfo(FullFileName$, dwHandle, BufSize, ByVal lpvData)
        ' ... copy it into the user defined structure
        hmemcpy VerInfo, ByVal lpvData, Len(VerInfo)

        'In order to retrieve the version info, the data is copied into
        'an array.

        ReDim VerArr(4)
        Call hmemcpy(VerArr(1), VerInfo.dwFileVersionMS, Len(VerInfo.dwFileVersionMS) * 2)
        
        lpvData = Format$(VerArr(2), "0") & "."
        lpvData = lpvData & Format$(VerArr(1), "#00") & "."
        lpvData = lpvData & Format$(VerArr(4), "#00") & "."
        lpvData = lpvData & Format$(VerArr(3), "#00")

        GetVersion = lpvData
    End If

End Function

Function IsModuleLoaded(Filename As String) As Integer
Dim m As ModuleEntryType, ModuleFilename As String
Dim i As Integer, f As Integer

    'Initialize the structure
    m.dwSize = Len(m)
    'Get the first module
    f = ModuleFirst(m)
    ModuleFilename = ""
    Do While (f) And (ModuleFilename <> Filename)

        'Get the EXE name associated with the module
        ModuleFilename = Left$(m.szExePath, InStr(m.szExePath, Chr$(0)) - 1)
        ' Get next module
        f = ModuleNext(m)

    Loop
    IsModuleLoaded = (Filename = ModuleFilename)

End Function

Function IsValidWildcard(W$) As Integer
'Determines whether or not a wildcard (W$) is valid
'This is done by attempting to use the wildcard, and checking if DOS
'returns an error
Dim X As String

On Error Resume Next

    X = Dir$(W$, 0)
    IsValidWildcard = (Err = 0)

On Error GoTo 0
    
End Function

Sub SetTabs(Ctrl As Control, tabs%())
'Calls the Windows API in order to set tab stops
Dim retval As Long

    
    If TypeOf Ctrl Is ListBox Then
        retval = SendMessage(Ctrl.hWnd, LB_SETTABSTOPS, UBound(tabs%), tabs%(1))

    'Two possible messages - one for list boxes and one for text boxes
    ElseIf TypeOf Ctrl Is TextBox Then
        retval = SendMessage(Ctrl.hWnd, EM_SETTABSTOPS, UBound(tabs%), tabs%(1))
    End If
    
End Sub

Sub Status(Comment$)
' Put a message in the status box on frmWait
    frmWait.lblStatus = Comment$
    DoEvents  ' Give Windows a chance to do its thing
    frmWait.Refresh
End Sub

