VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Symbols"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'-------------------------------------------------------------------
'
'   This file is depenednt on the following file
'
'       VBoostTypes
'       GetIP.bas
'       GetESP.bas
'       GetEBP.bas
'       FunctrionDelegator.bas
'       DbgHelpLoader.bas
'
'-------------------------------------------------------------------

'-------------------------------------------------------------------
'
'   You will notice all of the C++ code that is commented out in this
'   declaration section.  I left all of this in for two reasons, one
'   so I have a areference later is something goes wrong with my API calls
'   and the other is for a learning excercise as other try to figure out
'   where in the h*@# I got those declarations and types
'
'-------------------------------------------------------------------

'   Custom error codes for raising errors from this class
Const ERR_INIT_FAILED = vbObjectError + 256
Const ERR_LOADMODULE_FAILED = vbObjectError + 257
Const ERR_GETMODULEINFO_FAILED = vbObjectError + 258
Const ERR_SYMFROMADDR_FAILED = vbObjectError + 259
Const ERR_LINEFROMADDR_FAILED = vbObjectError + 260
Const IMAGE_FILE_MACHINE_I386 = &H14C

'   This enum is used to pass into the GetCallStack method
'   The user can Or the bits togeher before making the call
'   and thereby telling our class what data is to be displayed
'   in the returned call stack string
Public Enum bitInfoFlags
    ShowSourcePath = 1
    ShowLineNumber = 2
    ShowModuleInfo = 4
    ShowAddressInfo = 8
    ShowExternalStack = 16
    ShowSymbolCallsOnStack = 32
End Enum
'   This variable is used to store the parameter passed in to GetCallStack
'       so that it can be accessed from anywhere in the class
Private m_bitShowInfo As bitInfoFlags

Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Declare Function GetCurrentThread Lib "kernel32" () As Long
'Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pTo As Any, uFrom As Any, ByVal lSize As Long)
'Private Declare Function lstrlenA Lib "kernel32" (ByVal lpString As Long) As Long
'Private Declare Function lstrlenW Lib "kernel32" (ByVal lpString As Long) As Long

'   Class level variales that are needed in several locations in the class
Private m_hProcess As Long
Private m_hThread As Long
Private m_ProcAddrSymFunctionTableAddress As Long
Private m_ProcAddrSymGetModuleBase As Long
Private m_bInitialized As Boolean

'   The stack frame variable must be module level for the First/Next stack walk calls to work
Private m_oStackFrame As StackFrame

'//
'// options that are set/returned by SymSetOptions() & SymGetOptions()
'// these are used as a mask
'//
'#define SYMOPT_CASE_INSENSITIVE  0x00000001
'#define SYMOPT_UNDNAME           0x00000002
'#define SYMOPT_DEFERRED_LOADS    0x00000004
'#define SYMOPT_NO_CPP            0x00000008
'#define SYMOPT_LOAD_LINES        0x00000010
'#define SYMOPT_OMAP_FIND_NEAREST 0x00000020
Private Enum tagSymOptions
    CaseInsensitive = &H1
    Undname = &H2
    DeferredLoads = &H4
    NoCpp = &H8
    LoadLines = &H10
    OmapFindNearest = &H20
End Enum

'DWORD
'IMAGEAPI
'SymSetOptions(
'    IN DWORD   SymOptions
'    );
Private Declare Function SymSetOptions Lib "dbghelp" (ByVal SymOptions As Long) As Long

'DWORD
'IMAGEAPI
'SymGetOptions(
'    VOID
'    );
Private Declare Function SymGetOptions Lib "dbghelp" () As Long

'BOOL
'IMAGEAPI
'SymInitialize(
'    IN HANDLE   hProcess,
'    IN PSTR     UserSearchPath,
'    IN BOOL     fInvadeProcess
'    );
Private Declare Function SymInitialize Lib "dbghelp" (ByVal hProcess As Long, ByVal strPath As Long, ByVal fInvadeProcess As Long) As Long

'//
'// symbol type enumeration
'//
'typedef enum {
'    SymNone,
'    SymCoff,
'    SymCv,
'    SymPdb,
'    SymExport,
'    SymDeferred,
'    SymSym                  // .sym file
'} SYM_TYPE;

Enum enumSymType
    SymNone
    SymCoff
    SymCv
    SymPdb
    SymExport
    SymDeferred
    SymSym
End Enum

Private Type typImageHelpLine
    SizeOfStruct    As Long
    Key             As Long
    LineNumber      As Long
    FileName        As Long
    Address         As Long
End Type

'BOOL
'IMAGEAPI
'SymGetLineFromAddr(
'    IN  HANDLE                hProcess,
'    IN  DWORD                 dwAddr,
'    OUT PDWORD                pdwDisplacement,
'    OUT PIMAGEHLP_LINE        Line
'    );
Private Declare Function SymGetLineFromAddr Lib "dbghelp" (ByVal hProcess As Long, ByVal dwAddr As Long, ByRef pdwDisplacement As Long, ByRef Line As typImageHelpLine) As Long

'BOOL
'IMAGEAPI
'SymUnloadModule(
'    IN  HANDLE          hProcess,
'    IN  DWORD           BaseOfDll
'    );
Private Declare Function SymUnloadModule Lib "dbghelp" (ByVal hProcess As Long, ByVal BaseOfDll As Long) As Long

'//
'// symbol data structure
'//
'typedef struct _IMAGEHLP_SYMBOL {
'    DWORD                       SizeOfStruct;           // set to sizeof(IMAGEHLP_SYMBOL)
'    DWORD                       Address;                // virtual address including dll base address
'    DWORD                       Size;                   // estimated size of symbol, can be zero
'    DWORD                       Flags;                  // info about the symbols, see the SYMF defines
'    DWORD                       MaxNameLength;          // maximum size of symbol name in 'Name'
'    CHAR                        Name[1];                // symbol name (null terminated string)
'} IMAGEHLP_SYMBOL, *PIMAGEHLP_SYMBOL;
Private Type typImageHelpSymbol
    SizeOfStruct    As Long
    Address         As Long
    Size            As Long
    Flags           As Long
    MaxNameLength   As Long
    chrName         As String * 256
End Type

'BOOL
'IMAGEAPI
'SymGetSymFromAddr(
'    IN  HANDLE              hProcess,
'    IN  DWORD               dwAddr,
'    OUT PDWORD              pdwDisplacement,
'    OUT PIMAGEHLP_SYMBOL    Symbol
'    );
Private Declare Function SymGetSymFromAddr Lib "dbghelp" (ByVal hProcess As Long, ByVal dwAddr As Long, ByRef pdwDisplacement As Long, ByRef Symbol As typImageHelpSymbol) As Long

'BOOL SymGetSymNext(
'  HANDLE hProcess,
'  PIMAGEHLP_SYMBOL Symbol
');
Private Declare Function SymGetSymNext Lib "dbghelp" (ByVal hProcess As Long, ByRef Symbol As typImageHelpSymbol) As Long

'// New KDHELP structure for 64 bit system support.
'
'typedef struct _KDHELP64 {
'    // address of kernel thread object, as provided in the
'    // WAIT_STATE_CHANGE packet.
'    DWORD64   Thread;
'    // offset in thread object to pointer to the current callback frame
'    // in kernel stack.
'    DWORD   ThCallbackStack;
'    // offset in thread object to pointer to the current callback backing
'    // store frame in kernel stack.
'    DWORD   ThCallbackBStore;
'    // offsets to values in frame:
'    // address of next callback frame
'    DWORD   NextCallback;
'    // address of saved frame pointer (if applicable)
'    DWORD   FramePointer;
'    // Address of the kernel function that calls out to user mode
'    DWORD64   KiCallUserMode;
'    // Address of the user mode dispatcher function
'    DWORD64   KeUserCallbackDispatcher;
'    // Lowest kernel mode address
'    DWORD64   SystemRangeStart;
'    DWORD64  Reserved[8];
'} KDHELP64, *PKDHELP64;

Private Type KdHelp
    Thread As Long
    ThCallbackStack As Long
    NextCallback As Long
    FramePointer As Long
    KiCallUserMode As Long
    KeUserCallbackDispatcher As Long
    SystemRangeStart As Long
    ThCallbackBStore As Long
    Reserved(7) As Long
End Type
    
'typedef enum {
'    AddrMode1616
'    AddrMode1632
'    AddrModeReal
'    AddrModeFlat
'} ADDRESS_MODE;
Private Enum ADDRESS_MODE
    AddrMode1616
    AddrMode1632
    AddrModeReal
    AddrModeFlat
End Enum

'typedef struct _tagADDRESS {
'    DWORD    Offset;
'    WORD     Segment;
'    ADDRESS_MODE   Mode;
'} ADDRESS, *LPADDRESS;
Private Type Address
    Offset As Long
    Segment As Integer
    Mode As ADDRESS_MODE
End Type
 
 'typedef struct _tagSTACKFRAME {
'    ADDRESS     AddrPC;               // program counter
'    ADDRESS     AddrReturn;           // return address
'    ADDRESS     AddrFrame;            // frame pointer
'    ADDRESS     AddrStack;            // stack pointer
'    PVOID       FuncTableEntry;       // pointer to pdata/fpo or NULL
'    DWORD       Params[4];            // possible arguments to the function
'    BOOL        Far;                  // WOW far call
'    BOOL        Virtual;              // is this a virtual frame?
'    DWORD       Reserved[3];
'    KDHELP      KdHelp;
'    ADDRESS     AddrBStore;           // backing store pointer
'} STACKFRAME, *LPSTACKFRAME;
Private Type StackFrame
    AddrPC As Address
    AddrReturn As Address
    AddrFrame As Address
    AddrStack As Address
    FuncTableEntry As Long
    Params(3) As Long
    Far As Long
    Virtual As Long
    Reserved(2) As Long
    KdHelp As KdHelp
    AddrBStore As Address
End Type
 
'BOOL
'IMAGEAPI
'StackWalk(
'    DWORD                             MachineType,
'    HANDLE                            hProcess,
'    HANDLE                            hThread,
'    LPSTACKFRAME                      StackFrame,
'    PVOID                             ContextRecord,
'    PREAD_PROCESS_MEMORY_ROUTINE      ReadMemoryRoutine,
'    PFUNCTION_TABLE_ACCESS_ROUTINE    FunctionTableAccessRoutine,
'    PGET_MODULE_BASE_ROUTINE          GetModuleBaseRoutine,
'    PTRANSLATE_ADDRESS_ROUTINE TranslateAddress
'    );
Private Declare Function StackWalk Lib "dbghelp" ( _
    ByVal MachineType As Long, _
    ByVal hProcess As Long, _
    ByVal hThread As Long, _
    ByRef StackFrame As StackFrame, _
    ByVal ContextRecord As Long, _
    ByVal ReadMemoryRoutine As Long, _
    ByVal FunctionTableAccessRoutine As Long, _
    ByVal GetModuleBaseRoutine As Long, _
    ByVal TranslateAddress As Long) As Long

Public Function WalkLoadedSymbols(bFlag As Boolean) As String
    Dim lAddress        As Long
    Dim lHelpSymbol     As typImageHelpSymbol
    Dim dwDisplacement  As Long
    
    WalkLoadedSymbols = vbNullString
    
    If m_bInitialized Then
        '    get the address of the calling function
        lAddress = GetCallingIP.Call
        
        '   now we can start the symbol work
        lHelpSymbol.MaxNameLength = 256
        lHelpSymbol.SizeOfStruct = LenB(lHelpSymbol)
        
        If 0 = SymGetSymFromAddr(m_hProcess, lAddress, dwDisplacement, lHelpSymbol) Then
            Exit Function
        End If
        
        WalkLoadedSymbols = Left$(lHelpSymbol.chrName, InStr(lHelpSymbol.chrName, Chr$(0)) - 1)
        Do While 1 = SymGetSymNext(m_hProcess, lHelpSymbol)
            WalkLoadedSymbols = WalkLoadedSymbols & vbCrLf & Left$(lHelpSymbol.chrName, InStr(lHelpSymbol.chrName, Chr$(0)) - 1)
        Loop
        
    End If
End Function

'
' The bitOptFlags parameter is set for a default showing the following elements in teh call stack
'    ShowSourcePath = 1
'    ShowLineNumber = 2
'    ShowModuleInfo = 4
'
Public Function GetCallStack(Optional bitOptFlags As bitInfoFlags = ShowSourcePath Or ShowLineNumber Or ShowModuleInfo) As String
    Dim strData As String
    Dim strTemp As String
    
    '   Save the bit flags
    m_bitShowInfo = bitOptFlags
    '   Set the default value for the return value
    GetCallStack = vbNullString
    
    If m_bInitialized Then
        strData = GetFirstStackEntry
        
        '   if we want to skip the Symbols class methods,
        '   reset the string and pull the next item off the stack
        '   This is done because the Symbols class is responsible
        '   for the top two items on the stack
        If Not (m_bitShowInfo And bitInfoFlags.ShowSymbolCallsOnStack) Then
            strData = vbNullString
            strTemp = GetNextStackEntry
        End If
        
        strTemp = GetNextStackEntry
        Do While Len(strTemp)
            strData = strData & vbCrLf & strTemp
            strTemp = GetNextStackEntry
        Loop
        GetCallStack = strData
    End If
End Function

Private Function GetFirstStackEntry() As String
    If m_bInitialized Then
        m_hThread = GetCurrentThread
        
        GetFirstStackEntry = vbNullString
        With m_oStackFrame
            .AddrPC.Offset = GetIP.Call
            .AddrPC.Mode = AddrModeFlat
            .AddrFrame.Offset = GetEBP.Call
            .AddrFrame.Mode = AddrModeFlat
            .AddrStack.Offset = GetESP.Call
            .AddrStack.Mode = AddrModeFlat
        End With
    
        GetFirstStackEntry = WalkStack
    End If
End Function

Private Function GetNextStackEntry() As String
    If m_bInitialized Then
        '   Only call if the GetFirst entry has already been called
        '   There is no chjeck for this.  Since the methods GetFirstStackEntry
        '   and GetNextStackEntry are private, I am in control and will make sure that
        '   GetFirstStackEntry is called first.
        GetNextStackEntry = WalkStack
    End If
End Function

Private Function WalkStack() As String
    Dim bRet As Long
    
    '    StackWalk is from the platform SDK, dbghelp
    bRet = StackWalk(IMAGE_FILE_MACHINE_I386, _
        m_hProcess, _
        m_hThread, _
        m_oStackFrame, _
        0&, _
        0&, _
        m_ProcAddrSymFunctionTableAddress, _
        m_ProcAddrSymGetModuleBase, _
        0&)
        
    If bRet <> 0 And m_oStackFrame.AddrFrame.Offset <> 0 Then
        WalkStack = GetSymbolInfoForAddress(m_oStackFrame.AddrPC.Offset, m_hProcess)
        
        '   if the returned string contins BASIC_CLASS_Invoke terminate stack walk
        If InStr(WalkStack, "BASIC_CLASS_Invoke") <> 0 Then
            If Not (m_bitShowInfo And bitInfoFlags.ShowExternalStack) Then
                WalkStack = vbNullString
            End If
        End If
    Else
        WalkStack = vbNullString
    End If
End Function

Private Function GetSymbolInfoForAddress(dwAddr As Long, lProcess As Long) As String
    Dim strOutput           As String
    Dim lHelpSymbol         As typImageHelpSymbol
    Dim lHelpLine           As typImageHelpLine
    Dim dwDisplacement      As Long
    Dim strFunctionName     As String
    Dim strFileName         As String
    Dim bFoundLineNumber    As Boolean
    
    bFoundLineNumber = True
    strOutput = vbNullString
    GetSymbolInfoForAddress = vbNullString
    
    lHelpSymbol.MaxNameLength = 256
    lHelpSymbol.SizeOfStruct = LenB(lHelpSymbol)
    
    If 0 = SymGetSymFromAddr(m_hProcess, dwAddr, dwDisplacement, lHelpSymbol) Then
        MsgBox "SymGetSymFromAddr failed"
        Exit Function
    End If
    strFunctionName = Left$(lHelpSymbol.chrName, InStr(lHelpSymbol.chrName, Chr$(0)) - 1)
    
    lHelpLine.SizeOfStruct = LenB(lHelpLine)
    If 0 = SymGetLineFromAddr(m_hProcess, dwAddr, dwDisplacement, lHelpLine) Then
        bFoundLineNumber = False
    End If
    strFileName = PointerToStringA(lHelpLine.FileName)
    
    If (m_bitShowInfo And bitInfoFlags.ShowModuleInfo) Then
        strOutput = strFunctionName
    End If
    
    If (m_bitShowInfo And bitInfoFlags.ShowAddressInfo) Then
        If Len(strOutput) <> 0 Then
            strOutput = strOutput & " : " & Hex$(lHelpSymbol.Address) & "  (offset: " & (dwAddr - lHelpSymbol.Address) & " bytes)"
        Else
            strOutput = Hex$(lHelpSymbol.Address) & "  (offset: " & (dwAddr - lHelpSymbol.Address) & " bytes)"
        End If
    End If
    
    If (m_bitShowInfo And bitInfoFlags.ShowSourcePath) And bFoundLineNumber Then
        If Len(strOutput) <> 0 Then
            strOutput = strOutput & " : " & strFileName
        Else
            strOutput = strFileName
        End If
    End If
    
    If (m_bitShowInfo And bitInfoFlags.ShowLineNumber) And bFoundLineNumber Then
        If Len(strOutput) <> 0 Then
            strOutput = strOutput & " : " & lHelpLine.LineNumber
        Else
            strOutput = lHelpLine.LineNumber
        End If
    End If
    
    GetSymbolInfoForAddress = strOutput
End Function

'-------------------------------------------------------------------
'
'   This routine converts a string pointer returned from an API call
'   Into a string readable by VB
'
'-------------------------------------------------------------------
Private Function PointerToStringA(ByVal lpStringA As Long) As String
    PointerToStringA = _
        StrConv(VBoostTypes.SysAllocStringByteLen(lpStringA, VBoostTypes.lstrlen(lpStringA)), vbUnicode)
End Function
 
'-------------------------------------------------------------------
'
'   This routine converts a string pointer returned from an API call
'   Into a string readable by VB using the VBoostTypes call into oleaut32
'
'-------------------------------------------------------------------
Private Function PointerToStringW(ByVal lpStringW As Long) As String
    PointerToStringW = VBoostTypes.SysAllocString(lpStringW)
End Function

Private Sub Class_Initialize()
    Dim lRet As tagSymOptions

    '   Get and save the current process handle
    m_hProcess = GetCurrentProcess
    
    '   Get the current symbol settings and the add new flags to make certain
    '   that they are set how we want them
    lRet = SymGetOptions
    lRet = lRet Or tagSymOptions.LoadLines
    lRet = lRet Or tagSymOptions.OmapFindNearest
    SymSetOptions (lRet)
        
    m_bInitialized = False
    '   Try to initialize the symbol engine
    If 0 <> SymInitialize(m_hProcess, 0&, True) Then
        '   It woirked so get addresses and set the initialilzed flag
        m_ProcAddrSymFunctionTableAddress = GetProcAddress(DBGHELPModule, "SymFunctionTableAddress")
        m_ProcAddrSymGetModuleBase = GetProcAddress(DBGHELPModule, "SymGetModuleBase")
        m_bInitialized = True
    End If

End Sub


