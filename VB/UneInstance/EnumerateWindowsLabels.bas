Attribute VB_Name = "EnumerateWindowsLabels"
'Author: John Kozee
'Purpose: Enumerate Label captions given a known hWnd
'Date: June 12, 2004

'http://www.experts-exchange.com/Programming/Programming_Languages/Visual_Basic/Q_21018080.html

Option Explicit

Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Const VBM_WINDOWTITLEADDR = &H1091
Private Declare Function SendMessage Lib "USER32.DLL" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, wParam As Any, lParam As Any) As Long

Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal blnheritHandle As Long, ByVal dwAppProcessId As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

Private Const PROCESS_VM_READ = (&H10)
Private Const PROCESS_VM_WRITE = (&H20)
Private Const PROCESS_VM_OPERATION = (&H8)
Private Const PROCESS_QUERY_INFORMATION = (&H400)
Private Const PROCESS_READ_WRITE_QUERY = PROCESS_VM_READ + PROCESS_VM_WRITE + PROCESS_VM_OPERATION + PROCESS_QUERY_INFORMATION

Private Type MEMORY_BASIC_INFORMATION ' 28 bytes
    BaseAddress As Long
    AllocationBase As Long
    AllocationProtect As Long
    RegionSize As Long
    State As Long
    Protect As Long
    lType As Long
End Type
Private Declare Function VirtualQueryEx& Lib "kernel32" (ByVal hProcess As Long, lpAddress As Any, lpBuffer As MEMORY_BASIC_INFORMATION, ByVal dwLength As Long)
Private Declare Function ReadProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
 
Private abBuffer() As Byte 'Heap Buffer
Private lBaseAddress As Long
Private hProcess As Long

Public Sub GetFormLabels(hwnd As Long)
    Dim sClass As String
    Dim lRet As Long
    Dim pid As Long
    Dim hProcess As Long
    Dim lFormCaptionHeapAddress As Long
    
    Dim lpMem As Long
    Dim lLenMBI As Long
    Dim lBytesRead As Long
    Dim mbi As MEMORY_BASIC_INFORMATION
    
    'Make sure we are working with a VB Form hWnd
    sClass = Space(256)
    lRet = GetClassName(hwnd, sClass, 255)
    sClass = Left(sClass, lRet)
    If Not sClass = "ThunderRT6FormDC" Then
        MsgBox "This function only works on VB RunTime 6 Forms ThunderFormRT6DC"
        Exit Sub
    End If
    
    'Now get the internal heap address of the form caption.  All that we need can be found in this heap (hopefully!)
    'This is done with a little undocumented SendMessage magic
    lFormCaptionHeapAddress = SendMessage(hwnd, VBM_WINDOWTITLEADDR, ByVal 0&, ByVal 0&)
    
    'Get a handle on the process with required access
    lRet = GetWindowThreadProcessId(hwnd, pid)
    If pid = 0 Then
        MsgBox "Unable to determine pid of this hwnd."
        Exit Sub
    End If
    hProcess = OpenProcess(PROCESS_READ_WRITE_QUERY, False, pid)
    
    'Get the Heap at the caption point
    lLenMBI = Len(mbi)
    lpMem = lFormCaptionHeapAddress
    mbi.AllocationBase = lpMem
    mbi.BaseAddress = lpMem
    lRet = VirtualQueryEx(hProcess, ByVal lpMem, mbi, lLenMBI)
    If lRet <> lLenMBI Then GoTo Finished
    
    'Now go back and get the entire heap
    lBaseAddress = mbi.AllocationBase
    lpMem = lBaseAddress
    mbi.BaseAddress = lBaseAddress
    mbi.RegionSize = 0
    lRet = VirtualQueryEx(hProcess, ByVal lpMem, mbi, lLenMBI)
    If lRet <> lLenMBI Then GoTo Finished
    
    'A couple of sanity checks, just to be safe
    If Not ((mbi.lType = MEM_PRIVATE) And (mbi.State = MEM_COMMIT) And mbi.RegionSize > 0) Then
        MsgBox "Unexpected Heap Type, State, or Size."
        GoTo Finished
    End If
    
     'Allocate a buffer and read it in
    ReDim abBuffer(0 To mbi.RegionSize - 1)
    ReadProcessMemory hProcess, ByVal mbi.BaseAddress, abBuffer(LBound(abBuffer)), mbi.RegionSize, lBytesRead
    
    'So far, so good.  Things get messy from here.  We have to
    'do some manual parsing of the buffer to get what we are after.  To
    'make things easier, I'll will get every label on every form in the
    'exe.  Otherwise, you will need to first find the form that is
    'reference the caption.  Then find every label between it and the next
    'form.
    
    Dim iCnt As Integer
    Dim al() As Long
    
    'Print all of the label captions
    If EnumVBObjectPtrs("VB.Label", 44, al) > 0 Then
        For iCnt = LBound(al) To UBound(al)
            Debug.Print "Hit at: " & Hex(al(iCnt) + lBaseAddress + 44), "Object At: " & Hex(al(iCnt) + lBaseAddress), "Caption =: " & GetLabelCaption(al(iCnt))
        Next iCnt
    End If
    
Finished:
    CloseHandle hProcess
    abBuffer() = ""
End Sub

Private Function GetLabelCaption(lpLocalObjPtr As Long) As String
    Dim lStrPtr As Long

    'Get local pointer to caption
    CopyMemory lStrPtr, abBuffer(lpLocalObjPtr + 136), 4
    lStrPtr = lStrPtr - lBaseAddress
    
    'Get caption
    If lStrPtr <> 0 Then
        GetLabelCaption = StrConv(MidB(abBuffer, lStrPtr + 1, 260), vbUnicode)
    End If
    GetLabelCaption = Left$(GetLabelCaption, InStr(GetLabelCaption, vbNullChar) - 1)
End Function

'This function will search the buffer for a given VBObjectIDString, then
'find the start of that control by searching for a refence to it in the 600
'bytes prior.
'It then finds any object of that type by searching the buffer for any
'references to the Heap Location of that control, and adds it to the enumeration
'if the reference hit position is at the correct offset (pos-offset = lBaseAddress)
'setting the EnumObj entry to the start location (local buffer address) and
'returns the counrt
Private Function EnumVBObjectPtrs(VBObjectIDString As String, _
                                  lOffset As Long, _
                                  EnumObj() As Long) As Integer
    Dim abObjectPtr(0 To 3) As Byte 'LittleEndian byte array of the Heap Address of the VBObject
    Dim abBaseAddress(0 To 3) As Byte 'LittleEndian byte array of the Heap Base Memory Address
    Dim abLong(0 To 3) As Byte 'Byte array for ptr manipulation
    Dim lPtr As Long 'Local Buffer pointer for search hits
    Dim lHeapPtr As Long 'Heap pointer (lPtr + lBaseAddress)
    Dim iCnt As Integer
    Dim alRet() As Long
    
    'Find the location of the VBObjectIDString string
    lPtr = InStrB(1, abBuffer, StrConv(VBObjectIDString, vbFromUnicode)) - 1
    lHeapPtr = lBaseAddress + lPtr
    If lPtr = 0 Then Exit Function
    
    'We now need to find the location that points to the start of the object
    'which should be 244 bytes prior (on XP at least) we go back 300 just in
    'case.  This is at offset 36, so we'll need to adjust back to the beginning
    'of the object
    CopyMemory abLong(0), lHeapPtr, 4
    lPtr = InStrB(lPtr - 600, abBuffer, abLong) - 1
    If lPtr = 0 Then Exit Function
    lPtr = lPtr - 36 'Adjust back to the beginning of the object
    lHeapPtr = lBaseAddress + lPtr
    CopyMemory abObjectPtr(0), lHeapPtr, 4
    
    'Turn the lBaseAddress into LittleEndian byte array for searching
    CopyMemory abBaseAddress(0), lBaseAddress, 4
    
    'Loop through the buffer
    lPtr = 1
    Do Until lPtr = 0
        'Find a reference to this object
        lPtr = InStrB(lPtr, abBuffer, abObjectPtr)
        If lPtr > 0 Then
            'make sure that this is really a VB object
            'move back from the offset of the object
            'and make sure that it has the correct base memory value
            If InStrB(lPtr - lOffset - 1, abBuffer, abBaseAddress) = lPtr - lOffset Then
                ReDim Preserve alRet(0 To iCnt)
                alRet(iCnt) = lPtr - lOffset - 1
                iCnt = iCnt + 1
            End If
            'Keep searching from the next byte
            lPtr = lPtr + 1
        End If
    Loop
    
    EnumVBObjectPtrs = iCnt
    EnumObj = alRet

End Function



