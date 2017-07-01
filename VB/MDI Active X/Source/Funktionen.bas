Attribute VB_Name = "Funktionen"
Option Explicit
'-------------------------------------------------------------'
' Copyright (c)2000/2001 by Michael Wallner                   '
' http://www.wallner-software.com                             '
' mailto:mdiactivex@wallner-software.com                      '
'-------------------------------------------------------------'
' Funktionen für das MDIActiveX Control                       '
'                                                             '
' + 1.0.4                                                     '
'     new in version 1.0.4                                    '
' - 1.0.4                                                     '
' + 1.0.5                                                     '
'     new in version 1.0.5                                    '
' - 1.0.5                                                     '
' + 1.0.6                                                     '
'     new in Version 1.0.6                                    '
' - 1.0.6                                                     '
' + 1.0.7                                                     '
'     new in Version 1.0.7                                    '
' - 1.0.7                                                     '
'-------------------------------------------------------------'

'Ändere Window Style auf Child...
'change windowstyle to child
Public Sub MakeChild(hwnd As Long, Optional undo)
    Dim curStyle As Long
    Dim newStyle As Long

    'Window Style...
    curStyle = GetWindowLong(hwnd, GWL_STYLE)
    If IsMissing(undo) Then
        curStyle = curStyle Or WS_CHILD
        curStyle = curStyle And (Not WS_POPUP)
    Else
        curStyle = curStyle And Not WS_CHILD
        curStyle = curStyle Or WS_POPUP
    End If
    newStyle = SetWindowLong(hwnd, GWL_STYLE, curStyle)

    'Window EXStyle...
    curStyle = GetWindowLong(hwnd, GWL_EXSTYLE)
    curStyle = curStyle Or WS_EX_MDICHILD
    newStyle = SetWindowLong(hwnd, GWL_EXSTYLE, curStyle)

End Sub

'Entferne den Window EXStyle WS_EX_NOPARENTNOTIFY von allen
'Controls auf der Form
'remove WS_EX_NOPARENTNOTIFY from controls
Public Sub ParentNotify(hwnd)
    Dim hChild As Long
    Dim lWStyle As Long

    hChild = GetWindow(hwnd, GW_CHILD)
    While hChild <> 0
    '+ 1.0.7
        ParentNotify hChild
    '- 1.0.7
        lWStyle = GetWindowLong(hChild, GWL_EXSTYLE)
        lWStyle = lWStyle And Not WS_EX_NOPARENTNOTIFY
        lWStyle = SetWindowLong(hChild, GWL_EXSTYLE, lWStyle)
        hChild = GetWindow(hChild, GW_HWNDNEXT)
    Wend

End Sub

'Wenn die Größe des ActiveX Formulars geändert, Größe des 'echten'
'MDIChild ändern
'resize the 'real' MDIChild if the size of the activex form is changed
Public Sub ResizeChild(hwnd As Long)
    Dim rc As RECT
    Dim rp As RECT
    Dim wx, wy, wc As Long
    
    'get border width and caption height
    wx = GetSystemMetrics(SM_CXDLGFRAME)        'frame width
    wy = GetSystemMetrics(SM_CYDLGFRAME)        'frame hight
    wc = GetSystemMetrics(SM_CYCAPTION)         'caption hight
    
    GetWindowRect GetParent(hwnd), rp           'size of parent window
    GetWindowRect hwnd, rc                      'size of the activex form

    rp.Right = rp.Right - rp.Left               'calculate width
    rp.Bottom = rp.Bottom - rp.Top              'and height

    rc.Right = rc.Right - rc.Left
    rc.Bottom = rc.Bottom - rc.Top

    'compare size of parent and activex form
    If rc.Right <> rp.Right Or rc.Bottom <> rp.Bottom Then
        If IsZoomed(GetParent(hwnd)) Then
            'if parents windowstate is maximized then don't change form size!
            Resize hwnd
        Else
            'change size of parent window
            SetWindowPos GetParent(hwnd), 0, 0, 0, rc.Right, rc.Bottom, SWP_NOREPOSITION Or SWP_NOZORDER Or SWP_FRAMECHANGED Or SWP_NOACTIVATE Or SWP_NOMOVE
        End If
    End If

End Sub


'die Größe des 'echten' MDIChild Fensters wird
'geändert --> ActiveX Form anpassen
'resize 'real' MDIChild window...
Public Sub Resize(hwnd As Long)
    Dim r As RECT
    Dim wx, wy, wc As Long
    Dim wStyle As Long
    
    wx = GetSystemMetrics(SM_CXDLGFRAME)        'frame width
    wy = GetSystemMetrics(SM_CYDLGFRAME)        'frame hight
    wc = GetSystemMetrics(SM_CYCAPTION)         'caption hight
    
    GetWindowRect GetParent(hwnd), r            'size of parent window
    
    r.Right = r.Right - r.Left                  'calculate width and height
    r.Bottom = r.Bottom - r.Top
    r.Left = 0 - wx                             'calculate position
    r.Top = 0 - wy - wc                         '(relative to parent window)

    SetWindowPos hwnd, 0, r.Left, r.Top, r.Right, r.Bottom, SWP_NOREPOSITION Or SWP_NOZORDER Or SWP_FRAMECHANGED Or SWP_NOACTIVATE

End Sub

Function GetProcPointer(ByVal lWndProc As Long) As Long
    GetProcPointer = lWndProc
End Function

'WindowProc für das 'echte' MDIChild Fenster
'windowproc for the 'real' MDIChild window
Private Function MyWndProc(ByVal hwnd As Long, ByVal message As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    
    Dim mmiT As MINMAXINFO
    Dim hChild As Long
    Dim r As RECT
    
'+ 1.0.7
    Static owparam As Long
    Static s As Long
'- 1.0.7
    
    Select Case message
    
'+ 1.0,7
    Case WM_KEYDOWN
      If (owparam <> wParam) Or (s <> CLng(Timer * 10)) Then
        MyWndProc = PostMessage(GetParent(hwnd), message, wParam, lParam)
        owparam = wParam
      Else
        owparam = 0
      End If
      s = CLng(Timer * 10)
      Exit Function

    Case WM_CHILDACTIVATE, WM_MOUSEACTIVATE
      APISetFocus GetWindow(hwnd, GW_CHILD)
'- 1.0.7
    
'+ 1.0.5
    'If child is closed --> Close me!
    Case WM_PARENTNOTIFY
      If LoWord(wParam) = WM_DESTROY Then 'Need LoWord for Windows95
        SendMessage GetParent(hwnd), WM_MDIDESTROY, hwnd, ByVal 0
      End If
    
    'fire events form_activate & from_deactivate...
    Case WM_MDIACTIVATE
      hChild = GetWindow(hwnd, GW_CHILD)
      MyWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)
      If hChild <> 0 Then
        If hwnd = wParam Then
          PostMessage hChild, &H100E, &HB, 1
        Else
          PostMessage hChild, &H100E, &HA, 1
        End If
      End If
      Exit Function
'- 1.0.5
      
   
'+ 1.0.4
    Case WM_GETMINMAXINFO
      MyWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)
      'ignore if windowstate is maximized!
      If IsZoomed(hwnd) Then Exit Function
      ' Copy parameter to local variable for processing
      CopyMemory mmiT, ByVal lParam, LenB(mmiT)
      ' Minimium width and height for sizing
      If GetProp(hwnd, "MinSizeX") <> 0 Then mmiT.ptMinTrackSize.x = GetProp(hwnd, "MinSizeX")
      If GetProp(hwnd, "MinSizeY") <> 0 Then mmiT.ptMinTrackSize.y = GetProp(hwnd, "MinSizeY")
      If GetProp(hwnd, "MaxSizeX") <> 0 Then mmiT.ptMaxTrackSize.x = GetProp(hwnd, "MaxSizeX")
      If GetProp(hwnd, "MaxSizeY") <> 0 Then mmiT.ptMaxTrackSize.y = GetProp(hwnd, "MaxSizeY")
      ' Copy modified results back to parameter
      CopyMemory ByVal lParam, mmiT, LenB(mmiT)
      Exit Function
'- 1.0.4
    
    'change size....
    Case WM_SIZE
        hChild = GetWindow(hwnd, GW_CHILD)
        Resize hChild
        
    'set focus to child form (=activeX form)
    Case WM_SETFOCUS
        hChild = GetWindow(hwnd, GW_CHILD)
        APISetFocus hChild

    'das 'echte' MDI Fenster wird aktiviert...
    'Active 'real' mdiform
    Case WM_NCACTIVATE
        If wParam <> 0 Then
            'richtiges Menü anzeigen...
            'to change the menu bar...
            PostMessage GetParent(GetParent(hwnd)), &H1056, 0, 0
            SendMessage GetParent(hwnd), WM_MDISETMENU, 0, ByVal 0&
        End If
        MyWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)
        hChild = GetWindow(hwnd, GW_CHILD)
        If wParam <> 0 Then
            'Aktiviere das ActiveX Formular und setze den Focus
            'activate activex form and set focus
            SendMessage hChild, WM_NCACTIVATE, 1, ByVal lParam
            APISetFocus hwnd
        Else
            'Daktiviere auch das ActiveX Formular
            'deactivate activex form
            SendMessage hChild, WM_NCACTIVATE, 0, ByVal lParam
        End If
        Exit Function

    'Systemcommand Close -> schließe das activex Formular
    'systemcommand close -> close the activex form
    Case WM_SYSCOMMAND
'+1.0.5
        'If wParam = SC_CLOSE Then
        If (wParam = 61536) Or (wParam = SC_CLOSE) Then
'- 1.0.5
            hChild = GetWindow(hwnd, GW_CHILD)
            If hChild <> 0 Then
                'send message to the activex form
                SendMessage hChild, WM_SYSCOMMAND, wParam, ByVal lParam
                MyWndProc = 0
                'and ignore this message!
                  Exit Function
            End If
        End If

    'Message close
    Case WM_CLOSE
'+ 1.0.5
        hChild = GetWindow(hwnd, GW_CHILD)
        If hChild <> 0 Then
          'send message to the activex form
          SendMessage hChild, WM_CLOSE, wParam, ByVal lParam
          MyWndProc = 0
          'and ignore this message
          Exit Function
        End If
'- 1.0.5

    Case WM_DESTROY
    
'+ 1.0.6
        MyWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)
'- 1.0.6

        'remove all Properties ans restore old hMenu
        RemoveProp hwnd, "hMDIMenu"
        RemoveProp hwnd, "hFileMenu"
        RemoveProp hwnd, "pMDIChild"
        RemoveProp hwnd, "MinSizeX"
        RemoveProp hwnd, "MinSizeY"
        RemoveProp hwnd, "MaxSizeX"
        RemoveProp hwnd, "MaxSizeY"
        SendMessage GetParent(hwnd), WM_MDISETMENU, g_oldhMenu, ByVal g_oldhWindow

'+ 1.0.6
        Exit Function
'- 1.0.6
    End Select

    'call standard MDI Window Proc!
    MyWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)

End Function

'Eigene Fensterclasse registrieren
'register my window class
Public Function myRegisterClass() As Boolean
    Dim wndcls As WNDCLASS
    Dim r As Long

    wndcls.style = CS_HREDRAW + CS_VREDRAW
    wndcls.lpfnwndproc = GetProcPointer(AddressOf MyWndProc)
    wndcls.cbClsextra = 0
    wndcls.cbWndExtra2 = 0
    wndcls.hInstance = App.hInstance
    wndcls.hIcon = 0
    wndcls.hCursor = LoadCursor(0, IDC_ARROW)
    wndcls.hbrBackground = COLOR_WINDOW
    wndcls.lpszMenuName = 0
    wndcls.lpszClassName = "MDIActiveXClass"
    r = RegisterClass(wndcls)
    myRegisterClass = (r <> 0)

End Function

Public Sub myUnregisterClass()
    Call UnregisterClass("MDIActiveXClass", App.hInstance)
End Sub

'erzeuge das 'echte' MDIChild fenster
'create the 'real' MDIChild window
Public Function CreateMDIChild(hWndParent As Long, caption As String) As Long
'+ 1.0.5
    Dim lWStyle As Long
    Dim hwnd As Long
    Dim hMDIClient As Long
    Dim mc As MDICREATESTRUCT
    Dim acthWnd As Long
    
'+ 1.0.6
    Dim OldAnimation As Integer
'- 1.0.6
    
    lWStyle = WS_CHILD Or _
              WS_CLIPSIBLINGS Or _
              WS_CLIPCHILDREN Or _
              WS_BORDER Or _
              WS_DLGFRAME Or _
              WS_THICKFRAME Or _
              WS_SYSMENU Or _
              WS_OVERLAPPED Or _
              WS_MINIMIZEBOX Or _
              WS_MAXIMIZEBOX Or _
              WS_VISIBLE                'must be visible or the window will
                                        'never be listet in the windowlist menu!

'    hMDIClient = GetWindow(hWndParent, GW_CHILD)
    hMDIClient = GetMDIClient(hWndParent)
    
    If hMDIClient <> 0 Then
      mc.cx = CW_USEDEFAULT
      mc.cy = CW_USEDEFAULT
      mc.x = CW_USEDEFAULT
      mc.y = CW_USEDEFAULT
      mc.hOwner = App.hInstance
      mc.lParam = 0&
      mc.szClass = "MDIActiveXClass"
      mc.szTitle = caption
      mc.style = lWStyle
    
      acthWnd = SendMessage(hMDIClient, WM_MDIGETACTIVE, 0, ByVal 0)
'+ 1.0.6
      'SendMessage acthWnd, WM_NCACTIVATE, 0, ByVal 0          'otherwise the titlebar won't be draw in deactive state!
      OldAnimation = GetAnimation
      If OldAnimation <> 0 Then SetAnimation False
'- 1.0.6
      SendMessage hMDIClient, WM_SETREDRAW, False, ByVal 0&   'we don't want to see the creation of the window!
      hwnd = SendMessage(hMDIClient, WM_MDICREATE, 0&, mc)    'create MDIChild
      ShowWindow hwnd, SW_HIDE                                'hide the new Window
      SendMessage hMDIClient, WM_SETREDRAW, True, ByVal 0&
      
'+ 1.0.6
      'InvalidateRect hMDIClient, 0&, True
      'UpdateWindow hMDIClient
      If OldAnimation <> 0 Then SetAnimation True
'- 1.0.6
    
    End If
    
    CreateMDIChild = hwnd

'- 1.0.5

'    Dim lWStyle As Long
'    Dim hwnd As Long
'    Dim hMDIClient As Long
'
'    lWStyle = WS_CHILD Or WS_CLIPSIBLINGS Or WS_CLIPCHILDREN Or WS_BORDER Or WS_DLGFRAME Or WS_THICKFRAME Or WS_SYSMENU Or WS_OVERLAPPED Or WS_MINIMIZEBOX Or WS_MAXIMIZEBOX Or WS_VISIBLE
'    'old version
'    'hMDIClient = FindWindowEx(hWndParent, 0, "MDIClient", vbNullString)
''+ 1.0.3
'    hMDIClient = GetWindow(hWndParent, GW_CHILD)
''- 1.0.3
'    hwnd = CreateMDIWindow("MDIActiveXClass", caption, lWStyle, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, hMDIClient, App.hInstance, 0)
'    CreateMDIChild = hwnd

End Function

'Ermittle den Klassennamen eines Fensters
'Get classname of a window
Function WindowClass(ByVal hwnd As Long) As String
    Dim TextLen As Long
    Dim ret As String
    Dim i As Long

    ret = String$(255, 0)
    TextLen = GetClassName(hwnd, ret, 256)
    WindowClass = Left$(ret, TextLen)

End Function

'Finde das MDIFrame Fenster
'get handle to the MDIFrame window
Public Function GetMDIFrame() As Long
    Dim hwnd As Long
    Dim ProcessID As Long

    'Muß ein Child des Desktop Windows sein!
    'must be child from the desktop window
    hwnd = GetWindow(GetDesktopWindow, GW_CHILD)
    'solange ich ein Fenster gefunden habe...
    'while theres a window...
    While hwnd <> 0
        'ProcessID ermitteln
        ProcessID = GetWindowThreadProcessId(hwnd, ProcessID)
        If ProcessID = App.ThreadID Then 'same thread?
            'im richtigen Thread -> Fensterklasse vergleichen...
            'same thread --> test window class
            If Right(LCase(WindowClass(hwnd)), 7) = "mdiform" Then
                'Fenster gefunden...
                'yea!
                GetMDIFrame = hwnd
                Exit Function
            End If
        End If
        'Nächstes Fenster suchen
        'next window
        hwnd = GetWindow(hwnd, GW_HWNDNEXT)
    Wend
    'Kein MDIClient Fenster gefunden!
    'sorry theres no MDIClient Window
    GetMDIFrame = 0
    
End Function

'+ 1.0.5
Public Function GetMDIClient(hFrame As Long)
  Dim hwnd As Long
  hwnd = GetWindow(hFrame, GW_CHILD)
  While hwnd <> 0
    If Right(LCase(WindowClass(hwnd)), 9) = "mdiclient" Then
      GetMDIClient = hwnd
      Exit Function
    End If
    hwnd = GetWindow(hwnd, GW_HWNDNEXT)
  Wend
  GetMDIClient = 0
End Function
'- 1.0.5

'eigene windowProc für das Formular in der ActiveX-DLL
'my windowproc for the activex form
Public Function WndProc(ByVal hwnd As Long, ByVal iMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    Dim hParent As Long
    Dim hChild As Long
    Dim caption As String
    Dim lCaption As Long
    Dim hIcon As Long
    Dim hoIcon As Long
    Dim mywParam As Long
    Dim oldWndProc As Long
    Dim mmiT As MINMAXINFO
    
    hParent = GetParent(hwnd)
    oldWndProc = GetProp(hwnd, "MDIActiveXold")

    Select Case iMsg

'+ 1.0.6
    Case WM_DESTROY
      WndProc = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
      SubStop hwnd
'- 1.0.6

    
'+ 1.0.5
    Case &H100E
      If lParam = 0 Then
        Exit Function
      Else
        lParam = 0
      End If
      WndProc = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
'- 1.0.5
    
'+ 1.0.4
    Case WM_MOVE
      If (HiWord(lParam) > 1) Or (LoWord(lParam) > 1) Then
        Resize hwnd
        Exit Function
      End If
    
    'Minimale und Maximale Größe des Fensters festlegen...
    'get minimum and maximum size of the window...
    Case WM_GETMINMAXINFO
      WndProc = DefMDIChildProc(hwnd, iMsg, wParam, lParam)
      If IsZoomed(hParent) Then Exit Function
      ' Kopiere die Parameter in eine lokale Variable um sie so bearbeiten zu können
      ' Copy parameter to local variable for processing
      CopyMemory mmiT, ByVal lParam, LenB(mmiT)
      ' Minimale und Maximale Größe festlegen
      ' Minimium width and height for sizing
      ' (ignore if 0)
      If GetProp(hParent, "MinSizeX") <> 0 Then mmiT.ptMinTrackSize.x = GetProp(hParent, "MinSizeX")
      If GetProp(hParent, "MinSizeY") <> 0 Then mmiT.ptMinTrackSize.y = GetProp(hParent, "MinSizeY")
      If GetProp(hParent, "MaxSizeX") <> 0 Then mmiT.ptMaxTrackSize.x = GetProp(hParent, "MaxSizeX")
      If GetProp(hParent, "MaxSizeY") <> 0 Then mmiT.ptMaxTrackSize.y = GetProp(hParent, "MaxSizeY")
      ' und das Ergebnis wieder zurückkopieren...
      ' Copy modified results back to parameter
      CopyMemory ByVal lParam, mmiT, LenB(mmiT)
    
    'Methoden Form.Hide, Form.Show und Propertie Visible...
    'Methods form.hide, form.show and propety visible...
    Case WM_SHOWWINDOW
        WndProc = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
        If lParam = 0 Then
          If wParam = 0 Then
            'activate next mdichild
            SendMessage GetParent(hParent), WM_MDINEXT, 0, ByVal 0
            'hide window
            ShowWindow hParent, SW_HIDE
          Else
            'show mdichild
            ShowWindow hParent, SW_SHOWNA
            'and activate mdichild
            SendMessage GetParent(hParent), WM_MDIACTIVATE, GetParent(hwnd), ByVal 0
          End If
          'set the menu
          SendMessage GetParent(hParent), WM_MDISETMENU, g_oldhMenu, ByVal g_oldhWindow
        End If
'- 1.0.4
    
    'property form.caption
    Case WM_SETTEXT, WM_STYLECHANGED
        WndProc = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
        caption = String(255, 0)
        lCaption = GetWindowText(hwnd, caption, 254)
        caption = Left(caption, lCaption + 1)
        SetWindowText hParent, caption

    'Property form.icon
    Case WM_SETICON
        WndProc = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
        hIcon = SendMessage(hwnd, WM_GETICON, 0, ByVal 0&)
        If hIcon <> 0 Then
            hoIcon = SendMessage(hParent, WM_SETICON, 0, ByVal hIcon)
            If hoIcon <> 0 And hoIcon <> hIcon Then
                DestroyIcon hoIcon
            End If
        End If

    'hit frame or caption...
    Case WM_NCLBUTTONDOWN
        If wParam = HTCAPTION Or wParam = HTBOTTOM Or _
                wParam = HTLEFT Or wParam = HTRIGHT Or _
                wParam = HTBOTTOMRIGHT Or wParam = HTBOTTOMLEFT Or _
                wParam = HTTOPLEFT Or wParam = HTTOPRIGHT _
                Then
        ReleaseCapture
        If IsZoomed(GetParent(hwnd)) Then
            'Send message to the app window
            WndProc = SendMessage(GetParent(GetParent(GetParent(hwnd))), WM_NCLBUTTONDOWN, wParam, ByVal 0&)
        Else
            'send message to the 'real' MDIChild window
            WndProc = SendMessage(GetParent(hwnd), WM_NCLBUTTONDOWN, wParam, ByVal 0&)
        End If
    Else
        'send message to activex form
        WndProc = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
    End If

    'properties width & height
    Case WM_SIZE
        ResizeChild (hwnd)
        WndProc = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)

     Case Else
        WndProc = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
     
     End Select

End Function

'+ 1.0.5
'WindowProc für standard MDIChild Fenster
'windowproc for standard MDIchild windows
Private Function sMDIWndProc(ByVal hwnd As Long, ByVal message As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim oldWndProc As Long

  oldWndProc = GetProp(hwnd, "MDIActiveXold")

  Select Case message
  
    'ignore standard message 'fire event form_activate/deactivate
    Case &H100E
      If wParam = &HA Or wParam = &HB Then
        If lParam = 0 Then
          'ignote standard vb message
          Exit Function
        Else
          'make my message a 'standard' message
          lParam = 0
        End If
      End If
      
    Case WM_DESTROY
      SubStop hwnd
      
    Case WM_MDIACTIVATE
      sMDIWndProc = CallWindowProc(oldWndProc, hwnd, message, wParam, lParam)
      If hwnd = wParam Then
        PostMessage hwnd, &H100E, &HB, 1
      Else
        PostMessage hwnd, &H100E, &HA, 1
      End If
      Exit Function
  End Select
  
  sMDIWndProc = CallWindowProc(oldWndProc, hwnd, message, wParam, lParam)
  
End Function
'- 1.0.5


'Eigene WidowProc für das MDIFrame und MDIClient Fenster
'my windowproc for the MDIFrame and MDIClient window
Public Function WndProcMDI(ByVal hwnd As Long, ByVal iMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    Dim hParent As Long
    Dim hChild As Long
    Dim caption As String
    Dim lCaption As Long
    Dim hIcon As Long
    Dim mywParam As Long
    Dim oldWndProc As Long

    hParent = GetParent(hwnd)
    oldWndProc = GetProp(hwnd, "MDIActiveXold")

    Select Case iMsg
    
'+ 1.0.6
    Case WM_DESTROY
      WndProcMDI = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
      SubStop hwnd
'- 1.0.6
    
    'MDIFrame
    Case WM_COMMAND
'+ 1.0.5
        'hChild = SendMessage(Getwindow(hWnd, GW_CHILD), WM_MDIGETACTIVE, 0, ByVal 0&)
        hChild = SendMessage(GetMDIClient(hwnd), WM_MDIGETACTIVE, 0, ByVal 0&)
'- 1.0.5
        
'+ 1.0.4
        If (GetWindowLong(hChild, GWL_STYLE) And WS_VISIBLE) = 0 Then
          hChild = 0      'wenn Fenster unsichtbar -> Befehl nicht weiterleiten
        End If            'if window invisible -> original menu
'- 1.0.4
        
        If hChild <> 0 Then
            'if child has its own menu.... (wParam > 32767 --> Select window)
            If GetProp(hChild, "hMDIMenu") <> 0 And lParam = 0 And (wParam < 32768) Then
                'send message to the activex form
                hChild = GetWindow(hChild, GW_CHILD)
                WndProcMDI = SendMessage(hChild, iMsg, wParam, ByVal lParam)
            Else
                WndProcMDI = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
            End If
        Else
            WndProcMDI = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
        End If

    'MDIClient
    Case WM_MDISETMENU
    
        'find active window
        hChild = SendMessage(hwnd, WM_MDIGETACTIVE, 0, ByVal 0&)
        
'+ 1.0.4
        If (GetWindowLong(hChild, GWL_STYLE) And WS_VISIBLE) = 0 Then
          hChild = 0      'wenn Fenster unsichtbar -> menu handle nicht ändern
        End If            'if window invisible -> don't change menu handle
'- 1.0.4
        
        If isActiveX(hChild) = False Then
          hChild = 0
        End If
        
'+ 1.0.6
        'If there is a menu in a standard vb mdichild form, display a warning!
        If isActiveX(hChild) = False And _
          wParam <> 0 And wParam <> g_oldhMenu And _
          g_Warning = False And g_oldhMenu <> 0 Then
          g_Warning = True
          MsgBox "Verwenden Sie keine Menüs in standard VB MDIChild Formularen!" & vbCrLf & _
                 "(Benutzen Sie standard Formulare mit dem MDIActiveX Control)" & vbCrLf & vbCrLf & _
                 "Do not use menu in standard vb mdichild forms!" & vbCrLf & _
                 "(use standard forms with the MDIActiveX control)", vbCritical Or vbOKOnly, "MDIActiveX Control"
        End If
'- 1.0.6

        
        If hChild = 0 Then
            'save original handle to windowlist (if not done yet)
            If g_oldhWindow = 0 And lParam <> 0 Then
                g_oldhWindow = lParam
            End If
        Else
            'is there a menu handle stored
            If GetProp(hChild, "hMDIMenu") <> 0 Then
                wParam = GetProp(hChild, "hMDIMenu")
                'is there a windowlist stored
                If GetProp(hChild, "hFileMenu") <> 0 Then
                    lParam = GetProp(hChild, "hFileMEnu")
                End If
            Else
                'no --> original handles
                wParam = g_oldhMenu
                lParam = g_oldhWindow
            End If
        End If

        WndProcMDI = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
        SendMessage hwnd, WM_MDIREFRESHMENU, 0, ByVal 0&    'refresh window list!
        DrawMenuBar GetParent(hwnd)                         'redraw menubar
        'PostMessage GetParent(hwnd), &H1056, 0, 0
        

'+ 1.0.5
    'subclass 'normal' mdichild forms!
    Case WM_MDICREATE
        WndProcMDI = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)
        If WndProcMDI <> 0 Then
          If Not isActiveX(WndProcMDI) Then
            sSubStart WndProcMDI
          End If
        End If
'- 1.0.5
    
    Case Else
        WndProcMDI = CallWindowProc(oldWndProc, hwnd, iMsg, wParam, lParam)

    End Select

End Function

'Starten und beenden des Subclassings

'start subclassing of the MDIFrame and MDIClient window
Public Sub SubStartMDI(hwnd As Long)
    Dim OldWindowProc As Long
    OldWindowProc = SetWindowLong(hwnd, GWL_WNDPROC, AddressOf WndProcMDI)
    SetProp hwnd, "MDIActiveXold", OldWindowProc
End Sub

'start subclassing of a real mdichild
Public Sub sSubStart(hwnd As Long)
    Dim OldWindowProc As Long

    OldWindowProc = SetWindowLong(hwnd, GWL_WNDPROC, AddressOf sMDIWndProc)
    SetProp hwnd, "MDIActiveXold", OldWindowProc

End Sub

'start subclassing of the activex form
Public Sub SubStart(hwnd As Long)
    Dim OldWindowProc As Long

    OldWindowProc = SetWindowLong(hwnd, GWL_WNDPROC, AddressOf WndProc)
    SetProp hwnd, "MDIActiveXold", OldWindowProc

End Sub

'stop subclassing
Public Sub SubStop(hwnd As Long)
    Dim OldWindowProc As Long

    OldWindowProc = SetWindowLong(hwnd, GWL_WNDPROC, GetProp(hwnd, "MDIActiveXold"))
    RemoveProp hwnd, "MDIActiveXold"

End Sub

'+ 1.0.4
'enable or disable a systemmenu option....
Public Sub MenuItemEnable(hwnd As Long, mItem As Long, Enable As Boolean)
Dim mii As MENUITEMINFO
Dim ret As Long
Dim hMenu As Long
  
  hMenu = GetSystemMenu(hwnd, False)
  mii.cbSize = Len(mii)
  
  If Enable = False Then
    'Disable Option!
    mii.wID = -10 - mItem                           'New ID
    mii.fMask = MIIM_ID                             'Mask = Option ID
    ret = SetMenuItemInfo(hMenu, mItem, False, mii) 'Change ID
    mii.fMask = MIIM_STATE                          'Mask = Option State
    ret = GetMenuItemInfo(hMenu, mii.wID, False, mii) 'Get act, State
    mii.fState = mii.fState Or MF_GRAYED            'Edit State
    ret = SetMenuItemInfo(hMenu, mii.wID, False, mii) 'Set new State
  Else
    'Enable Option!
    mii.wID = mItem                                 'New ID (=original ID!)
    mii.fMask = MIIM_ID                             'Mask = Option ID
    ret = SetMenuItemInfo(hMenu, -10 - mItem, False, mii)   'Change ID
    mii.fMask = MIIM_STATE                          'Mask ....
    ret = GetMenuItemInfo(hMenu, mii.wID, False, mii)
    mii.fState = mii.fState - MF_GRAYED
    ret = SetMenuItemInfo(hMenu, mii.wID, False, mii)
  
  End If
  
  'Refresh caption...
  SendMessage hwnd, WM_NCACTIVATE, True, ByVal 0

End Sub
'- 1.0.4

'+ 1.0.5
Public Function isActiveX(hwnd As Long) As Boolean
  If WindowClass(hwnd) = "MDIActiveXClass" Then
    isActiveX = True
  Else
    isActiveX = False
  End If
  'Debug.Print "Fenster", hwnd, isActiveX
End Function
'- 1.0.5

'+ 1.0.6
Function GetAnimation() As Integer
Dim p As ANIMATIONINFO
   p.cbSize = LenB(p)
   p.iMinAnimate = 0
   SystemParametersInfo SPI_GETANIMATION, LenB(p), p, 0
   GetAnimation = p.iMinAnimate
End Function

Sub SetAnimation(ein As Boolean)
Dim p As ANIMATIONINFO
   p.cbSize = LenB(p)
   p.iMinAnimate = ein
   SystemParametersInfo SPI_SETANIMATION, LenB(p), p, 0 'SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE)
End Sub
'- 1.0.6

