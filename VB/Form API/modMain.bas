Attribute VB_Name = "modMain"
'**********************************************************
'*              API Form by Joseph Huntley                *
'*               joseph_huntley@email.com                 *
'*                http://joseph.vr9.com                   *
'*                                                        *
'*  Made:  January 3, 2000                                *
'*  Level: Advanced                                       *
'**********************************************************
'*   This demonstrates creating a form with api and       *
'* subclassing it to get the window messages passed to it *
'* If you need any help please e-mail me.                 *
'**********************************************************
'* Notes: Look below.                                     *
'**********************************************************

''All the information for creating a window and subclassing it
''can be found in the MSDN library along with a listing of every
''constant for each argument. If you do not have the MSDN library
''you can go to MSDN library online at http://msdn.microsoft.com/library
''Search under: WndProc, CreateWindowEx, RegisterClass, WNDCLASS,
''              DefWindowProc, CallWindowProc, SetWindowLong, GetWindowLong
''
''Once read, you will have a much better understand of subclassing and
''how windows works.



''~~~~~~~~~~~~~~~~~~ CreateWindowEx ~~~~~~~~~~~~~~~~~
''Creates a new window or control using the specified
''arguments.
''---------------------------------------------------
''dwExStyle
''    Specifies an extended window style.
''lpClassName
''    The classname for the window. If the classname
''    isn't listed below. Then you must register the
''    window using RegisterClass. For controls, look
''    at the window classnames listing below.
''lpWindowName
''    The window's caption.
''dwStyle
''    The window style to use.
''x
''    The top-left coordinate of the new window. If
''    CW_USEDEFAULT is given, then argument y is
''    ignored and windows decides the coordinate.
''y
''    The top-right coordinate of the new window. If
''    CW_USEDEFAULT is given by x, then argument y is
''    ignored and windows decides the coordinate.
''nWidth
''    The width of the new window. If CW_USEDEFAULT
''    is given, then nHeight is ignored and windows
''    decides the width for the window.
''nHeight
''    The height of the new window. If CW_USEDEFAULT
''    is given by nWidth, then nHeight is ignored and
''    windows decides the width for the window.
''hWndParent
''    Handle to the parent or owner window of the
''    window being created. To create a child window
''    or an owned window, supply a valid window
''    handle. This parameter is optional for pop-up
''    windows.
''hMenu
''    Handle to a menu, or specifies a child-window
''    identifier, depending on the window style. For
''    an overlapped or pop-up window, hMenu identifies
''    the menu to be used with the window; it can be
''    NULL if the class menu is to be used. For a
''    child window, hMenu specifies the child-window
''    identifier, an integer value used by a dialog
''    box control to notify its parent about events.
''    The application determines the child-window
''    identifier; it must be unique for all child
''    windows with the same parent window.
''hInstance
''    Handle to the instance of the module to be
''    associated with the window.
''lpParam
''    A pointer to a value to be passed to the window
''    through the CREATESTRUCT structure passed in
''    the lParam parameter the WM_CREATE message. If
''    an application calls CreateWindow to create a
''    multiple document interface (MDI) client window,
''    lpParam must point to a CLIENTCREATESTRUCT structure.
''~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       
''~~~~~~~~~~~~~~~~~~ RegisterClass ~~~~~~~~~~~~~~~~~~
''Registers a new window.
''---------------------------------------------------
''Class (WNDCLASS)
''    A WNDCLASS structure with the window info.
''---------------------------------------------------
''style
''    Class styles for the window (CS_???? Or CS_????)
''lpfnwndproc
''    Far pointer to the address of the window proc
''    for the window. (AddressOf WndProc)
''cbClsextra
''    Specifies the number of extra bytes to allocate
''    following the window-class structure. The
''    system initializes the bytes to zero.
''cbWndExtra
''    Specifies the number of extra bytes to allocate
''    following the window instance. The system
''    initializes the bytes to zero. If an
''    application uses WNDCLASS to register a dialog
''    box created by using the CLASS directive in the
''    resource file, it must set this member to
''    DLGWINDOWEXTRA.
''hInstance
''    Current instance of the app. (App.hInstance)
''hIcon
''    Handle to the class icon. This member must be a
''    handle of an icon resource. If this member is
''    NULL, an application must draw an icon whenever
''   the user minimizes the application's window.
''hCursor
''    Handle to the class cursor. This member must be
''    a handle of a cursor resource. If this member
''    is NULL, an application must explicitly set the
''    cursor shape whenever the mouse moves into the
''    application's window.
''hbrBackground
''    Handle to the class background brush. We use
''    COLOR_WINDOW to get the default color for a window.
''lpszMenuName
''    Pointer to a null-terminated character string
''    that specifies the resource name of the class
''    menu, as the name appears in the resource file.
''    If you use an integer to identify the menu, use
''    the MAKEINTRESOURCE macro. If this member is
''    NULL, windows belonging to this class have no
''    default menu.
''---------------------------------------------------
    
''~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
''~~~~~~~~~~~~~~~~~~~ Window Classnames Listing ~~~~~~~~~~~~~~~~~
''~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
''Classname        Meaning
''---------        ----------------------------------------------
''BUTTON           Designates a small rectangular child window
''                 that represents a button the user can click to
''                 turn it on or off. Button controls can be used                    alone or in groups, and they can either be
''                 labeled or appear without text. Button controls                   typically change appearance when the user
''                 clicks them.
 
''COMBOBOX         Designates a control consisting of a list box
''                 and a selection field similar to an edit control.
''                 When using this style, an application should
''                 either display the list box at all times or
''                 enable a drop-down list box. If the list box is
''                 visible, typing characters into the selection
''                 field highlights the first list box entry that
''                 matches the characters typed. Conversely,
''                 selecting an item in the list box displays the
''                 selected text in the selection field.
 
''EDIT             Designates a rectangular child window into which
''                 the user can type text from the keyboard. The user
''                 selects the control and gives it the keyboard focus
''                 by clicking it or moving to it by pressing the tab
''                 key. The user can type text when the edit control
''                 displays a flashing caret; use the mouse to move
''                 the cursor, select characters to be replaced, or
''                 position the cursor for inserting characters; or
''                 use the backspace key to delete characters.

''LISTBOX          Designates a list of character strings. Specify this
''                 control whenever an application must present a list
''                 of names, such as filenames, from which the user can
''                 choose. The user can select a string by clicking it.
''                 A selected string is highlighted, and a notification
''                 message is passed to the parent window.

''MDICLIENT        Designates an MDI client window. This window receives
''                 messages that control the MDI application's child
''                 windows. The recommended style bits are WS_CLIPCHILDREN
''                 and WS_CHILD. Specify the WS_HSCROLL and WS_VSCROLL
''                 styles to create an MDI client window that allows the
''                 user to scroll MDI child windows into view.

''RICHEDIT         Designates a Rich Edit version 1.0 control. This window
''                 lets the user view and edit text with character and
''                 paragraph formatting, and can include embedded COM objects.

''RICHEDIT_CLASS   Designates a Rich Edit version 2.0 control. This controls
''                 let the user view and edit text with character and paragraph
''                 formatting, and can include embedded COM objects. (Text
''                 highlighting was added to this version of the control.)

''SCROLLBAR        Designates a rectangle that contains a scroll box and has
''                 direction arrows at both ends. The scroll bar sends a
''                 notification message to its parent window whenever the user
''                 clicks the control. The parent window is responsible for
''                 updating the position of the scroll box, if necessary.

''STATIC           Designates a simple text field, box, or rectangle used
''                 to label, box, or separate other controls. Static controls
''                 take no input and provide no output.

Option Explicit

Public Declare Function RegisterClass Lib "user32" Alias "RegisterClassA" (Class As WNDCLASS) As Long
Public Declare Function UnregisterClass Lib "user32" Alias "UnregisterClassA" (ByVal lpClassName As String, ByVal hInstance As Long) As Long
Public Declare Function DefWindowProc Lib "user32" Alias "DefWindowProcA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function GetMessage Lib "user32" Alias "GetMessageA" (lpMsg As Msg, ByVal hwnd As Long, ByVal wMsgFilterMin As Long, ByVal wMsgFilterMax As Long) As Long
Public Declare Function TranslateMessage Lib "user32" (lpMsg As Msg) As Long
Public Declare Function DispatchMessage Lib "user32" Alias "DispatchMessageA" (lpMsg As Msg) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Public Declare Function LoadCursor Lib "user32" Alias "LoadCursorA" (ByVal hInstance As Long, ByVal lpCursorName As Any) As Long
Public Declare Function LoadIcon Lib "user32" Alias "LoadIconA" (ByVal hInstance As Long, ByVal lpIconName As String) As Long
Public Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Public Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Public Declare Function MessageBox Lib "user32" Alias "MessageBoxA" (ByVal hwnd As Long, ByVal lpText As String, ByVal lpCaption As String, ByVal wType As Long) As Long
Public Declare Sub PostQuitMessage Lib "user32" (ByVal nExitCode As Long)


Public Type WNDCLASS
    style As Long
    lpfnwndproc As Long
    cbClsextra As Long
    cbWndExtra2 As Long
    hInstance As Long
    hIcon As Long
    hCursor As Long
    hbrBackground As Long
    lpszMenuName As String
    lpszClassName As String
End Type


Public Type POINTAPI
    x As Long
    y As Long
End Type


Public Type Msg
    hwnd As Long
    message As Long
    wParam As Long
    lParam As Long
    time As Long
    pt As POINTAPI
End Type

Public Const CS_VREDRAW = &H1
Public Const CS_HREDRAW = &H2

Public Const CW_USEDEFAULT = &H80000000

Public Const ES_MULTILINE = &H4&

Public Const WS_BORDER = &H800000
Public Const WS_CHILD = &H40000000
Public Const WS_OVERLAPPED = &H0&
Public Const WS_CAPTION = &HC00000 ' WS_BORDER Or WS_DLGFRAME
Public Const WS_SYSMENU = &H80000
Public Const WS_THICKFRAME = &H40000
Public Const WS_MINIMIZEBOX = &H20000
Public Const WS_MAXIMIZEBOX = &H10000
Public Const WS_OVERLAPPEDWINDOW = (WS_OVERLAPPED Or WS_CAPTION Or WS_SYSMENU Or WS_THICKFRAME Or WS_MINIMIZEBOX Or WS_MAXIMIZEBOX)

Public Const WS_EX_CLIENTEDGE = &H200&

Public Const COLOR_WINDOW = 5

Public Const WM_DESTROY = &H2
Public Const WM_LBUTTONDOWN = &H201
Public Const WM_LBUTTONUP = &H202

Public Const IDC_ARROW = 32512&

Public Const IDI_APPLICATION = 32512&

Public Const GWL_WNDPROC = (-4)

Public Const SW_SHOWNORMAL = 1

Public Const MB_OK = &H0&
Public Const MB_ICONEXCLAMATION = &H30&


Public Const gClassName = "MyClassName"
Public Const gAppName = "My Window Caption"

Public gButOldProc As Long ''Will hold address of the old window proc for the button
Public gHwnd As Long, gButtonHwnd As Long, gEditHwnd As Long ''You don't necessarily need globals, but if you're planning to gettext and stuff, then you're gona have to store the hwnds.
Public Sub Main()

   Dim wMsg As Msg

   ''Call procedure to register window classname. If false, then exit.
   If RegisterWindowClass = False Then Exit Sub
    
      ''Create window
      If CreateWindows Then
         ''Loop will exit when WM_QUIT is sent to the window.
         Do While GetMessage(wMsg, 0&, 0&, 0&)
            ''TranslateMessage takes keyboard messages and converts
            ''them to WM_CHAR for easier processing.
            Call TranslateMessage(wMsg)
            ''Dispatchmessage calls the default window procedure
            ''to process the window message. (WndProc)
            Call DispatchMessage(wMsg)
         Loop
      End If

    Call UnregisterClass(gClassName$, App.hInstance)


End Sub

Public Function RegisterWindowClass() As Boolean

    Dim wc As WNDCLASS
    
    ''Registers our new window with windows so we
    ''can use our classname.
    
    wc.style = CS_HREDRAW Or CS_VREDRAW
    wc.lpfnwndproc = GetAddress(AddressOf WndProc) ''Address in memory of default window procedure.
    wc.hInstance = App.hInstance
    wc.hIcon = LoadIcon(0&, IDI_APPLICATION) ''Default application icon
    wc.hCursor = LoadCursor(0&, IDC_ARROW) ''Default arrow
    wc.hbrBackground = COLOR_WINDOW ''Default a color for window.
    wc.lpszClassName = gClassName$

    RegisterWindowClass = RegisterClass(wc) <> 0
    
End Function
Public Function CreateWindows() As Boolean
  
    ''Create actual window.
    gHwnd& = CreateWindowEx(0&, gClassName$, gAppName$, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 208, 150, 0&, 0&, App.hInstance, ByVal 0&)
    ''Create button
    gButtonHwnd& = CreateWindowEx(0&, "Button", "Click Here", WS_CHILD, 58, 90, 85, 25, gHwnd&, 0&, App.hInstance, 0&)
    ''Create textbox with a border (WS_EX_CLIENTEDGE) and make it multi-line (ES_MULTILINE)
    gEditHwnd& = CreateWindowEx(WS_EX_CLIENTEDGE, "Edit", "This is the edit control." & vbCrLf & "As you can see, it's multiline.", WS_CHILD Or ES_MULTILINE, 0&, 0&, 200, 80, gHwnd&, 0&, App.hInstance, 0&)

    
    ''Since windows are hidden, show them. You can use UpdateWindow to
    ''redraw the client area.
    Call ShowWindow(gHwnd&, SW_SHOWNORMAL)
    Call ShowWindow(gButtonHwnd&, SW_SHOWNORMAL)
    Call ShowWindow(gEditHwnd&, SW_SHOWNORMAL)
    
    ''Get the memory address of the default window
    ''procedure for the button and store it in gButOldProc
    ''This will be used in ButtonWndProc to call the original
    ''window procedure for processing.
    gButOldProc& = GetWindowLong(gButtonHwnd&, GWL_WNDPROC)
    
    
    ''Set default window procedure of button to ButtonWndProc. Different
    ''settings of windows is listed in the MSDN Library. We are using GWL_WNDPROC
    ''to set the address of the window procedure.
    Call SetWindowLong(gButtonHwnd&, GWL_WNDPROC, GetAddress(AddressOf ButtonWndProc))

    CreateWindows = (gHwnd& <> 0)
    
End Function
Public Function WndProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

  ''This our default window procedure for the window. It will handle all
  ''of our incoming window messages and we will write code based on the
  ''window message what the program should do.

  Dim strTemp As String

    Select Case uMsg&
       Case WM_DESTROY:
          ''Since DefWindowProc doesn't automatically call
          ''PostQuitMessage (WM_QUIT). We need to do it ourselves.
          ''You can use DestroyWindow to get rid of the window manually.
          Call PostQuitMessage(0&)
    End Select
    

  ''Let windows call the default window procedure since we're done.
  WndProc = DefWindowProc(hwnd&, uMsg&, wParam&, lParam&)

End Function
Public Function ButtonWndProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

    Select Case uMsg&
       Case WM_LBUTTONUP:
          ''Left mouse button went up (user clicked the button)
          ''You can use WM_LBUTTONDOWN for the MouseDown event.
          
          ''We use the MessageBox API call because the built in
          ''function 'MsgBox' stops thread processes, which causes
          ''flickering.
          Call MessageBox(gHwnd&, "You clicked the button!", App.Title, MB_OK Or MB_ICONEXCLAMATION)
    End Select
    
  ''Since in MyCreateWindow we made the default window proc
  ''this procedure, we have to call the old one using CallWindowProc
  ButtonWndProc = CallWindowProc(gButOldProc&, hwnd&, uMsg&, wParam&, lParam&)
   
End Function
Public Function GetAddress(ByVal lngAddr As Long) As Long
    ''Used with AddressOf to return the address in memory of a procedure.

    GetAddress = lngAddr&
    
End Function


