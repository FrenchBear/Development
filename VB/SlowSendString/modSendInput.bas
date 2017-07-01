Attribute VB_Name = "modSendInput"
' modSendInput
' A replacement for SendKeys, definitely broken in VB6 dev env by Windows 8
' From http://vb.mvps.org/samples/SendInput/
' 2012-10-01    FPVI    First version

' *********************************************************************
'  Copyright (c)2007-10 Karl E. Peterson, All Rights Reserved
'  http://vb.mvps.org/samples/SendInput
' *********************************************************************
'  You are free to use this code within your own applications, but you
'  are expressly forbidden from selling or otherwise distributing this
'  source code without prior written consent.
' *********************************************************************
'  List of modifications.  Search on dates to find what changed.
' ---------------------------------------------------------------------
'  Updated 29-Jan-2009 to add support for Unicode characters embedded
'                      in strings passed to MySendKeys().
'  Updated 02-Feb-2009 to use native SendKeys in Windows 95.
'  Updated 27-Jul-2009 to add VBA conditional constant definitions.
'  Updated 16-Dec-2009 to fix chars 128-255 in ProcessChar()
'                      and add support for "~" and "{}}".
'  Updated 21-Dec-2009 to compensate for CAPSLOCK being depressed.
'  Updated 04-Apr-2010 to add AltGr support for keyboards that need it.
' *********************************************************************
Option Explicit
' *********************************************************************
' Toggle used to suck VB6 Split() function into VB5.
' Set to False if using this module in VB5.
' Leave this set to True in VBA.
#Const VB6 = True
' The VBA6 conditional constant is built into VBA.
#If VBA6 Then
   ' Built-in VB constants not defined in VBA...
   Private Const vbShiftMask = 1
   Private Const vbCtrlMask = 2
   Private Const vbAltMask = 4
   Private Const vbKeyScrollLock = 145
#End If
' *********************************************************************

' Win32 API Declarations
Private Declare Function SendInput Lib "user32" (ByVal nInputs As Long, pInputs As Any, ByVal cbSize As Long) As Long
Private Declare Function VkKeyScan Lib "user32" Alias "VkKeyScanA" (ByVal cChar As Byte) As Integer
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As Any) As Long
Private Declare Function MapVirtualKeyEx Lib "user32" Alias "MapVirtualKeyExA" (ByVal uCode As Long, ByVal uMapType As Long, ByVal dwhkl As Long) As Long
Private Declare Function GetKeyboardLayout Lib "user32" (ByVal dwLayout As Long) As Long
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer

Private Type OSVERSIONINFO
   dwOSVersionInfoSize As Long
   dwMajorVersion As Long
   dwMinorVersion As Long
   dwBuildNumber As Long
   dwPlatformId As Long
   szCSDVersion As String * 128
End Type

Private Type KeyboardInput       '   typedef struct tagINPUT {
   dwType As Long                '     DWORD type;
   wVK As Integer                '     union {MOUSEINPUT mi;
   wScan As Integer              '            KEYBDINPUT ki;
   dwFlags As Long               '            HARDWAREINPUT hi;
   dwTime As Long                '     };
   dwExtraInfo As Long           '   }INPUT, *PINPUT;
   dwPadding As Currency         '   8 extra bytes, because mouses take more.
End Type

' SendInput constants
Private Const INPUT_MOUSE As Long = 0
Private Const INPUT_KEYBOARD As Long = 1

Private Const KEYEVENTF_EXTENDEDKEY As Long = 1
Private Const KEYEVENTF_KEYUP As Long = 2
Private Const KEYEVENTF_UNICODE As Long = 4

' Platform ID constants
Private Const VER_PLATFORM_WIN32_WINDOWS As Long = &H1
Private Const VER_PLATFORM_WIN32_NT As Long = &H2

' Member variables
Private m_Data As String
Private m_DatPtr As Long
Private m_Events() As KeyboardInput
Private m_EvtPtr As Long

Private m_NamedKeys As Collection
Private m_ExtendedKeys As Collection
Private m_ShiftFlags As Long
Private m_KeyboardLayout As Long

Private Const defBufferSize As Long = 512

Public Sub MySendKeys(Data As String, Optional Wait As Boolean)
   Dim i As Long
   Dim os As OSVERSIONINFO
   
   ' Defer to native SendKeys if SendInput not supported.
   os.dwOSVersionInfoSize = Len(os)
   Call GetVersionEx(os)
   If os.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS Then
      ' SendInput requires Win98 or higher!
      If os.dwMajorVersion = 4& And os.dwMinorVersion < 10& Then
         Call SendKeys(Data, Wait)
         Exit Sub
      End If
   End If
   
   ' Make sure our collection of named keys has been built.
   If m_NamedKeys Is Nothing Then
      Call BuildCollections
   End If
   
   ' Save a large number of redundant API calls.
   m_KeyboardLayout = GetKeyboardLayout(0)
   
   ' Clear buffer, reset pointers, and cache send data.
   ReDim m_Events(0 To defBufferSize - 1) As KeyboardInput
   m_EvtPtr = 0
   m_DatPtr = 0
   m_Data = Data
   
   ' Loop through entire passed string.
   Do While m_DatPtr < Len(Data)
      ' Process next token in data string.
      Call DoNext
      
      ' Make sure there's still plenty of room in the buffer.
      If m_EvtPtr >= (UBound(m_Events) - 24) Then
         ReDim Preserve m_Events(0 To (UBound(m_Events) + defBufferSize) - 1)
      End If
   Loop
   
   ' Send the processed string to the foreground window!
   If m_EvtPtr > 0 Then
      ' All events are keyboard based.
      For i = 0 To m_EvtPtr - 1
         With m_Events(i)
            .dwType = INPUT_KEYBOARD
            'Debug.Print .wVK, .dwFlags
         End With
      Next i
      ' m_EvtPtr is 0-based, but nInputs is 1-based.
      Call SendInput(m_EvtPtr, m_Events(0), Len(m_Events(0)))
   End If
   
   ' Clean up
   Erase m_Events
End Sub

Private Sub DoNext()
   Dim this As String
   
   ' Advance data pointer, and extract next char.
   m_DatPtr = m_DatPtr + 1
   this = Mid$(m_Data, m_DatPtr, 1)
   
   ' Branch to appropriate helper routine.
   If InStr("+^%", this) Then
      Call ProcessShift(this)
   ElseIf this = "(" Then
      Call ProcessGroup
   ElseIf this = "{" Then
      Call ProcessNamedKey
   Else
      Call ProcessChar(this)
   End If
End Sub

Private Sub ProcessChar(this As String)
   Dim code As Integer
   Dim vk As Integer
   Dim capped As Boolean
   Dim AltGr As Boolean
   
   ' Determine whether we need to treat as Unicode.
   code = AscW(this)
   If code >= 0 And code < 256 Then 'ascii
      ' MODIFIED 16-Dec-2009:
      ' Special case for tilde character!
      If this = "~" Then
         vk = vbKeyReturn
      Else
         vk = VkKeyScan(Asc(this))
      End If
      
      ' Not all chars (in particular 128-255) will have direct keyboard
      ' translations, so treat those as Unicode if need be.
      If vk = -1 Then
         ' ADDED 16-Dec-2009
         Call StuffBufferW(code)
      Else
         ' Add input events for single character, taking capitalization
         ' into account.  HiByte will contain the shift state, and LoByte
         ' will contain the key code.
         capped = CBool(ByteHi(vk) And 1)
         ' ADDED 21-Dec-2009
         ' If CAPSLOCK is toggled on, the hibyte will be the inverse of
         ' what it ought to be to properly recreate the input string,
         ' as the SHIFT key would need to be depressed to compensate.
         If CapsLock() Then
            Select Case this
               Case "A" To "Z", "a" To "z"
                  capped = Not capped
            End Select
         End If
         ' ADDED 02-Apr-2010
         ' Some keyboard layouts have an AltGr key for special characters
         ' which comes through as CTRL+ALT here. Check for that.
         AltGr = CBool(ByteHi(vk) And 6)
         ' Proceed to stuff the keycode and capitalization into buffer.
         vk = ByteLo(vk)
         Call StuffBuffer(vk, capped, , AltGr)
      End If
   Else 'unicode
      Call StuffBufferW(code)
   End If
End Sub

Private Sub ProcessGroup()
   Dim EndPtr As Long
   Dim this As String
   Dim i As Long
   ' Groups of characters are offered together, surrounded by parenthesis,
   ' in order to all be modified by shift key(s).  We need to dig out the
   ' remainder of the group, and process each in turn.
   EndPtr = InStr(m_DatPtr, m_Data, ")")
   ' No need to do anything if endgroup immediateyl follows beginning.
   If EndPtr > (m_DatPtr + 1) Then
      For i = 1 To (EndPtr - m_DatPtr - 1)
         this = Mid$(m_Data, m_DatPtr + i, 1)
         Call ProcessChar(this)
      Next i
      ' Advance data pointer to closing parenthesis.
      m_DatPtr = EndPtr
   End If
End Sub

Private Sub ProcessNamedKey()
   Dim EndPtr As Long
   Dim this As String
   Dim pieces As Variant  '() As String
   Dim repeat As Long
   Dim vk As Integer
   Dim capped As Boolean
   Dim extend As Boolean
   Dim AltGr As Boolean
   Dim i As Long
   
   ' Groups of characters are offered together, surrounded by braces,
   ' representing a named keystroke.  We need to dig out the actual
   ' name, and optionally the number of times this keystroke is repeated.
   ' MODIFIED: 16-Dec-2009:
   ' Native SendKey doesn't allow "{}" so we can get away with looking
   ' past first character for closing backet - to allow "{}}"
   EndPtr = InStr(m_DatPtr + 2, m_Data, "}")
   ' No need to do anything if endgroup immediately follows beginning.
   If EndPtr > (m_DatPtr + 1) Then
      ' Extract group of characters.
      this = Mid$(m_Data, m_DatPtr + 1, EndPtr - m_DatPtr - 1)
         
      ' Break into pieces, if possible.
      pieces = Split(this, " ")
      
      ' Second element, if avail, is number of times to repeat stroke.
      If UBound(pieces) > 0 Then repeat = val(pieces(1))
      If repeat < 1 Then repeat = 1
      
      ' Attempt to retrieve named keycode, or else retrieve standard code.
      vk = GetNamedKey(CStr(pieces(0)))
      If vk Then
         ' Is this an extended key?
         extend = IsExtendedKey(this)
      Else
         ' Not a standard named key.
         vk = VkKeyScan(Asc(this))
         capped = CBool(ByteHi(vk) And 1)
         ' ADDED 02-Apr-2010
         AltGr = CBool(ByteHi(vk) And 6)
         vk = ByteLo(vk)
      End If
      
      ' Stuff buffer as many times as required.
      For i = 1 To repeat
         Call StuffBuffer(vk, capped, extend, AltGr)
      Next i
      
      ' Advance data pointer to closing parenthesis.
      m_DatPtr = EndPtr
   End If
End Sub

Private Sub ProcessShift(shiftkey As String)
   ' Press appropriate shiftkey.
   With m_Events(m_EvtPtr)
      Select Case shiftkey
         Case "+"
            .wVK = vbKeyShift
            m_ShiftFlags = m_ShiftFlags Or vbShiftMask
         Case "^"
            .wVK = vbKeyControl
            m_ShiftFlags = m_ShiftFlags Or vbCtrlMask
         Case "%"
            .wVK = vbKeyMenu
            m_ShiftFlags = m_ShiftFlags Or vbAltMask
      End Select
   End With
   m_EvtPtr = m_EvtPtr + 1

   ' Process next set of data
   Call DoNext
   
   ' Unpress same shiftkey.
   With m_Events(m_EvtPtr)
      Select Case shiftkey
         Case "+"
            .wVK = vbKeyShift
            m_ShiftFlags = m_ShiftFlags And Not vbShiftMask
         Case "^"
            .wVK = vbKeyControl
            m_ShiftFlags = m_ShiftFlags And Not vbCtrlMask
         Case "%"
            .wVK = vbKeyMenu
            m_ShiftFlags = m_ShiftFlags And Not vbAltMask
      End Select
      .dwFlags = KEYEVENTF_KEYUP
   End With
   m_EvtPtr = m_EvtPtr + 1
End Sub

' MODIFIED 04-Apr-2010: Added optional AltGr argument.
Private Sub StuffBuffer(ByVal vk As Integer, Optional Shifted As Boolean, Optional Extended As Boolean, Optional AltGr As Boolean)
   ' Shift may have been "pressed" as part of the string
   ' passed to MySendKeys if a "+" was included. If that
   ' was the case, and our desired result is a capital
   ' letter, we should not press Shift again here.
   If CBool(m_ShiftFlags And vbShiftMask) = False Then
      If Shifted Then
         Call StuffShift(vbKeyShift, True)
      End If
   End If
   
   ' ADDED 04-Apr-2010
   ' If AltGr was used, need to depress CNTL+ALT.
   If AltGr Then
      Call StuffShift(vbKeyControl, True)
      Call StuffShift(vbKeyMenu, True)
   End If
   
   ' Press and release this key.
   With m_Events(m_EvtPtr)
      .wVK = vk
      If Extended Then
         .dwFlags = KEYEVENTF_EXTENDEDKEY
      End If
   End With
   m_EvtPtr = m_EvtPtr + 1
   With m_Events(m_EvtPtr)
      .wVK = vk
      ' This next line is questionable? Seems to be required in
      ' some circumstances, and emulates what OSK.EXE does.
      .wScan = MapVirtualKeyEx(vk, 0, m_KeyboardLayout)
      .dwFlags = .dwFlags Or KEYEVENTF_KEYUP
   End With
   m_EvtPtr = m_EvtPtr + 1
   
   ' ADDED 04-Apr-2010
   ' If AltGr was used, need to release CNTL+ALT.
   If AltGr Then
      Call StuffShift(vbKeyControl, False)
      Call StuffShift(vbKeyMenu, False)
   End If
   
   ' See above for Shift avoidance reasoning.
   If CBool(m_ShiftFlags And vbShiftMask) = False Then
      If Shifted Then
         Call StuffShift(vbKeyShift, False)
      End If
   End If
End Sub

Private Sub StuffBufferW(ByVal CharCode As Integer)
   ' Unicode is relatively simple, in this context?!
   ' Press and release this key.
   With m_Events(m_EvtPtr)
      .wVK = 0
      .wScan = CharCode
      .dwFlags = KEYEVENTF_UNICODE
   End With
   m_EvtPtr = m_EvtPtr + 1
   With m_Events(m_EvtPtr)
      .wVK = 0
      .wScan = CharCode
      .dwFlags = KEYEVENTF_UNICODE Or KEYEVENTF_KEYUP
   End With
   m_EvtPtr = m_EvtPtr + 1
End Sub

Private Sub StuffShift(ByVal KeyCode As Integer, Optional Press As Boolean)
   ' ADDED 02-Apr-2010
   ' Effectively a GoSub from StuffBuffer...
   With m_Events(m_EvtPtr)
      .wVK = KeyCode
      If Not Press Then
         .dwFlags = KEYEVENTF_KEYUP
      End If
   End With
   m_EvtPtr = m_EvtPtr + 1
End Sub

Private Function ByteHi(ByVal WordIn As Integer) As Byte
   ' Lop off low byte with divide. If less than
   ' zero, then account for sign bit (adding &h10000
   ' implicitly converts to Long before divide).
   If WordIn < 0 Then
      ByteHi = (WordIn + &H10000) \ &H100
   Else
      ByteHi = WordIn \ &H100
   End If
End Function

Private Function ByteLo(ByVal WordIn As Integer) As Byte
   ' Mask off high byte and return low.
   ByteLo = WordIn And &HFF
End Function

Private Function WordHi(ByVal LongIn As Long) As Integer
   ' Mask off low word then do integer divide to
   ' shift right by 16.
   WordHi = (LongIn And &HFFFF0000) \ &H10000
End Function

Private Function WordLo(ByVal LongIn As Long) As Integer
   ' Low word retrieved by masking off high word.
   ' If low word is too large, twiddle sign bit.
   If (LongIn And &HFFFF&) > &H7FFF Then
      WordLo = (LongIn And &HFFFF&) - &H10000
   Else
      WordLo = LongIn And &HFFFF&
   End If
End Function

Private Function GetNamedKey(this As String) As Integer
   ' Try retrieving from collection
   On Error Resume Next
      GetNamedKey = m_NamedKeys(UCase$(this))
   On Error GoTo 0
End Function

Private Function IsExtendedKey(this As String) As Boolean
   Dim nRet As Integer
   ' Try retrieving from collection
   On Error Resume Next
      nRet = m_ExtendedKeys(UCase$(this))
   On Error GoTo 0
   IsExtendedKey = (nRet <> 0)
End Function

Private Sub AddKeyString(ByVal KeyCode As Long, KeyName As String, Optional ByVal Extended As Boolean)
   ' Add to collection(s) of named keycode constants.
   m_NamedKeys.Add KeyCode, KeyName
   If Extended Then
      m_ExtendedKeys.Add KeyCode, KeyName
   End If
End Sub

Private Sub BuildCollections()
   ' Reset both collections of known named keys.
   Set m_NamedKeys = New Collection
   Set m_ExtendedKeys = New Collection
   ' The extended-key flag indicates whether the keystroke message
   ' originated from one of the additional keys on the enhanced
   ' keyboard. The extended keys consist of the ALT and CTRL keys
   ' on the right-hand side of the keyboard; the INS, DEL, HOME, END,
   ' PAGE UP, PAGE DOWN, and arrow keys in the clusters to the left
   ' of the numeric keypad; the NUM LOCK key; the BREAK (CTRL+PAUSE)
   ' key; the PRINT SCRN key; and the divide (/) and ENTER keys in
   ' the numeric keypad. The extended-key flag is set if the key is
   ' an extended key.
   AddKeyString vbKeyBack, "BACKSPACE"
   AddKeyString vbKeyBack, "BS"
   AddKeyString vbKeyBack, "BKSP"
   AddKeyString vbKeyPause, "BREAK", True
   AddKeyString vbKeyCapital, "CAPSLOCK"
   AddKeyString vbKeyDelete, "DELETE", True
   AddKeyString vbKeyDelete, "DEL", True
   AddKeyString vbKeyDown, "DOWN", True
   AddKeyString vbKeyEnd, "END", True
   AddKeyString vbKeyReturn, "ENTER"
   AddKeyString vbKeyEscape, "ESC"
   AddKeyString vbKeyHelp, "HELP"
   AddKeyString vbKeyHome, "HOME", True
   AddKeyString vbKeyInsert, "INS", True
   AddKeyString vbKeyInsert, "INSERT", True
   AddKeyString vbKeyLeft, "LEFT", True
   AddKeyString vbKeyNumlock, "NUMLOCK", True
   AddKeyString vbKeyPageDown, "PGDN", True
   AddKeyString vbKeyPageUp, "PGUP", True
   AddKeyString vbKeyPause, "PAUSE"
   AddKeyString vbKeyPrint, "PRINT", True
   AddKeyString vbKeySnapshot, "PRTSC", True
   AddKeyString vbKeySnapshot, "PRTSCN", True
   AddKeyString vbKeySnapshot, "PRINTSCRN", True
   AddKeyString vbKeySnapshot, "PRINTSCREEN", True
   AddKeyString vbKeyRight, "RIGHT", True
   AddKeyString vbKeyScrollLock, "SCROLLLOCK"
   AddKeyString vbKeySelect, "SELECT"
   AddKeyString vbKeyTab, "TAB"
   AddKeyString vbKeyUp, "UP", True
   AddKeyString vbKeyF1, "F1"
   AddKeyString vbKeyF2, "F2"
   AddKeyString vbKeyF3, "F3"
   AddKeyString vbKeyF4, "F4"
   AddKeyString vbKeyF5, "F5"
   AddKeyString vbKeyF6, "F6"
   AddKeyString vbKeyF7, "F7"
   AddKeyString vbKeyF8, "F8"
   AddKeyString vbKeyF9, "F9"
   AddKeyString vbKeyF10, "F10"
   AddKeyString vbKeyF11, "F11"
   AddKeyString vbKeyF12, "F12"
   AddKeyString vbKeyF13, "F13"
   AddKeyString vbKeyF14, "F14"
   AddKeyString vbKeyF15, "F15"
   AddKeyString vbKeyF16, "F16"
   ' This one is very different, because brackets have exactly
   ' the opposite effect as they do with every other named key.
   ' So we won't add this to collection, and process elsewhere.
   'AddKeyString vbKeyReturn, "~"
End Sub

Private Function CapsLock() As Boolean
   ' Determine whether CAPSLOCK key is toggled on.
   CapsLock = CBool(GetKeyState(vbKeyCapital) And 1)
End Function

#If Not VB6 Then
Private Function Split(ByVal Expression As String, Optional Delimiter As String = " ", Optional Limit As Long = -1, Optional Compare As VbCompareMethod = vbBinaryCompare) As Variant
   Dim nCount As Long
   Dim nPos As Long
   Dim nDelimLen As Long
   Dim nStart As Long
   Dim sRet() As String

   ' Special case #1, Limit=0.
   If Limit = 0 Then
      ' Return unbound Variant array.
      Split = Array()
      Exit Function
   End If

   ' Special case #2, no delimiter.
   nDelimLen = Len(Delimiter)
   If nDelimLen = 0 Then
      ' Return expression in single-element Variant array.
      Split = Array(Expression)
      Exit Function
   End If

   ' Always start at beginning of Expression.
   nStart = 1

   ' Find first delimiter instance.
   nPos = InStr(nStart, Expression, Delimiter, Compare)
   Do While nPos
      ' Extract this element into enlarged array.
      ReDim Preserve sRet(0 To nCount) As String
      ' Bail if we hit the limit, or increment
      ' to next search start position.
      If nCount + 1 = Limit Then
         sRet(nCount) = Mid$(Expression, nStart)
         Exit Do
      Else
         sRet(nCount) = Mid$(Expression, nStart, nPos - nStart)
         nStart = nPos + nDelimLen
      End If
      ' Increment element counter
      nCount = nCount + 1
      ' Find next delimiter instance.
      nPos = InStr(nStart, Expression, Delimiter, Compare)
   Loop

   ' Grab last element.
   ReDim Preserve sRet(0 To nCount) As String
   sRet(nCount) = Mid$(Expression, nStart)

   ' Assign results and return.
   Split = sRet
End Function
#End If
