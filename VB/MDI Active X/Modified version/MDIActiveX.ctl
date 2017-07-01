VERSION 5.00
Begin VB.UserControl MDIActiveX 
   ClientHeight    =   705
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1275
   InvisibleAtRuntime=   -1  'True
   Picture         =   "MDIActiveX.ctx":0000
   ScaleHeight     =   705
   ScaleWidth      =   1275
   ToolboxBitmap   =   "MDIActiveX.ctx":0B82
End
Attribute VB_Name = "MDIActiveX"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Description = "MDI Kindfenster in ActiveX-DLLs erstellen - Einfach eine Instanz in die MDIForm und in die Form der ActiveX-DLL laden. dort KeyPreview auf True setzten - Fertig!"
Option Explicit
'-------------------------------------------------------------'
' Copyright (c)2000/2001 by Michael Wallner                   '
' http://www.wallner-software.com                             '
' mailto:mdiactivex@wallner-software.com                      '
'-------------------------------------------------------------'
' MDIActiveX Control Version 1.0.7                            '
'                                                             '
' Module: Definitionen                                        '
'         Funktionen                                          '
'-------------------------------------------------------------'
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

' 1.0.8: Pierre Violent 2004/09/10
' Addition of a callback to DisplayedAsMDIChild boolean function
' of parent to optionally disable functionality of control, thus allowing
' forms with control to be MDIChild or not defending on application needs
' Especially useful for Modal Forms: a MDI Child can't be modal (not supported
' by Windows), thus a mechanism to disable MDIChild is necessary.
' Can't use a "Enabled" property because any reference to a control property
' leads to form load and initialize before control code is executed, but then
' it's too late...

' 1.0.9: Pierre Violent 2004/10/13
' Do not "crash" if no MDI form is found: just ignores silently

'---------------------'
'Private definitionen '
'---------------------'
Private m_inMDI As Boolean              ' Control run in MDIForm
Private m_inUserMode As Boolean         ' Control run in UserMode
Private m_hMenu As Long                 ' handle menu of the activex form
Private m_hFileMenu As Long             ' handel windowlist menu of the activex form
'+ 1.0.4
Private m_BorderStyle As eBorderStyle
Private m_OptionClose As Boolean
Private m_MinButton As Boolean
Private m_MaxButton As Boolean
Private m_OptionSize As Boolean
Private m_OptionMove As Boolean
Private m_MinSizeX As Long
Private m_MinSizeY As Long
Private m_MaxSizeX As Long
Private m_MaxSizeY As Long
'- 1.0.4

'+ 1.0.5
Private m_hWndLastActive As Long        ' last active MDIChild (should stay active if
                                        ' form is load invisilble!)
'- 1.0.5

'+1.0.8
Private m_bEnabled As Boolean           ' Is controle active ?
'-1.0.8

'MDIChild Forms
Private m_State As Long                 ' current window is maximized ?
Private m_hWndParent As Long            ' handle to 'real' mdi child window
Private m_hWndForm As Long              ' handle ActiveX mdi form (control parentform)
Private m_ignorekey As Boolean
Private WithEvents myForm As Form       ' parent form
Attribute myForm.VB_VarHelpID = -1

'MDIForm
Private m_MDIClient As Long             ' handle MDICLient window
Private WithEvents myMDIForm As MDIForm ' parent form
Attribute myMDIForm.VB_VarHelpID = -1


'---------------------'
'Public Properties    '
'---------------------'
Public Enum eBorderStyle                ' unused!
 NoBorder = 0
 FixSingle = 1
 Sizeable = 2
End Enum                                ' unused!

' eine Kollektion aller geladenen MDIChild formularen welche mit MDIActiveX erstellt wurden
' a collection of all MDIChild forms created with the mdiactivex control
Public Forms As Collection

'+ 1.0.5
Public Event FormLoad()

Property Get hWndMDIChild() As Long
  hWndMDIChild = m_hWndParent
End Property
'-1.0.5

'+ 1.0.6
' Ergibt die y Position des Fensters (Parameter, aktives MDIChild oder Control Elternfenster)
' returns the window y position (parameter or active mdichild or control parent)
Property Get WindowTop(Optional Form) As Long
On Error Resume Next
Dim hwnd
  hwnd = 0
  If IsMissing(Form) Then                   ' no Parameter?
    If m_inMDI Then                         ' in MDIFomr
      hwnd = Me.ActiveForm.hwnd             '  --> Active Child
    Else                                    ' else
      hwnd = myForm.hwnd                    '  --> Control Parent
    End If
  Else
    hwnd = Form.hwnd
  End If
  If hwnd <> 0 Then WindowTop = GetTop(hwnd)
On Error GoTo 0
End Property

' Ergibt die x Position des Fensters (Parameter, aktives MDIChild oder Control Elternfenster)
' returns the window x position (parameter or active mdichild or control parent)
Property Get WindowLeft(Optional Form) As Long
On Error Resume Next
Dim hwnd
  hwnd = 0
  If IsMissing(Form) Then
    If m_inMDI Then
      hwnd = Me.ActiveForm.hwnd
    Else
      hwnd = myForm.hwnd
    End If
  Else
    hwnd = Form.hwnd
  End If
  If hwnd <> 0 Then WindowLeft = GetLeft(hwnd)
On Error GoTo 0
End Property

'+ 1.0.4
' Achtung! Attention! Y is NOT optional!!!!!
' ersetzt window.move bei MDIChild Formularen
' Moves the mdichild form
Public Sub Move(x As Long, Optional y As Long, Optional width, Optional height)
Dim r As RECT

  If m_inUserMode And m_bEnabled Then
    If Not m_inMDI Then
'+ 1.0.5
      If Me.WindowState <> 0 Then
        Exit Sub
      End If
'- 1.0.5
      GetWindowRect m_hWndParent, r
      x = myForm.ScaleX(x, myForm.ScaleMode, vbPixels)
'+ 1.0.6
'      Definition ...Optional y as Long... is wrong!!!!
'                    y must be a variant!
'      If IsMissing(y) Then
'        y = r.Top
'      Else
         y = myForm.ScaleY(y, myForm.ScaleMode, vbPixels)
'      End If
'- 1.0.6
      If IsMissing(width) Then
        width = r.Right - r.Left
      Else
        width = myForm.ScaleX(width, myForm.ScaleMode, vbPixels)
      End If
      If IsMissing(height) Then
        height = r.Bottom - r.Top
      Else
        height = myForm.ScaleY(height, myForm.ScaleMode, vbPixels)
      End If
      SetWindowPos m_hWndParent, 0, x, y, width, height, SWP_NOZORDER Or SWP_NOACTIVATE
    Else
        Err.Raise vbObjectError + 1051, "MDIActiveX Extender Control", "Can't be used in MDIForm!"
    End If
  End If
End Sub

Public Sub ZOrder(Wert As Long)
  If m_inUserMode And m_bEnabled Then
    If Not m_inMDI Then
      If Wert = 0 Then
'+ 1.0.6
        'SendMessage m_MDIClient, WM_MDIACTIVATE, m_hWndParent, ByVal 0&
        SendMessage GetParent(m_hWndParent), WM_MDIACTIVATE, m_hWndParent, ByVal 0&
'- 1.0.6
      Else
        SendMessage GetParent(m_hWndForm), WM_SYSCOMMAND, SC_PREVWINDOW, ByVal 0&
      End If
    Else
      Err.Raise vbObjectError + 1051, "MDIActiveX Extender Control", "Can't be used in MDIForm!"
    End If
  End If
End Sub

Property Get MinSizeX() As Long
  MinSizeX = m_MinSizeX
End Property

Property Let MinSizeX(Wert As Long)
  m_MinSizeX = Wert
  PropertyChanged ("MinSizeX")
  If m_inUserMode And m_bEnabled And Not m_inMDI Then
      SetProp m_hWndParent, "MinSizeX", myForm.ScaleX(m_MinSizeX, myForm.ScaleMode, vbPixels)
  End If
End Property

Property Get MinSizeY() As Long
  MinSizeY = m_MinSizeY
End Property

Property Let MinSizeY(Wert As Long)
  m_MinSizeY = Wert
  PropertyChanged ("MinSizeY")
  If m_inUserMode And m_bEnabled And Not m_inMDI Then
    SetProp m_hWndParent, "MinSizeY", myForm.ScaleY(m_MinSizeY, myForm.ScaleMode, vbPixels)
  End If
End Property

Property Get MaxSizeX() As Long
  MaxSizeX = m_MaxSizeX
End Property

Property Let MaxSizeX(Wert As Long)
  m_MaxSizeX = Wert
  PropertyChanged ("MaxSizeX")
  If m_inUserMode And m_bEnabled And Not m_inMDI Then
      SetProp m_hWndParent, "MaxSizeX", myForm.ScaleX(m_MaxSizeX, myForm.ScaleMode, vbPixels)
  End If
End Property

Property Get MaxSizeY() As Long
  MaxSizeY = m_MaxSizeY
End Property

Property Let MaxSizeY(Wert As Long)
  m_MaxSizeY = Wert
  PropertyChanged ("MaxSizeY")
  If m_inUserMode And m_bEnabled And Not m_inMDI Then
    SetProp m_hWndParent, "MaxSizeY", myForm.ScaleY(m_MaxSizeY, myForm.ScaleMode, vbPixels)
  End If
End Property

Property Get OptionSize() As Boolean
  OptionSize = m_OptionSize
End Property

Property Let OptionSize(Wert As Boolean)
Dim wStyle As Long

  If m_inUserMode And m_bEnabled Then
    If Not m_inMDI Then
       wStyle = GetWindowLong(m_hWndParent, GWL_STYLE)
       If Wert Then
         wStyle = wStyle Or WS_THICKFRAME
       Else
         wStyle = wStyle And (Not WS_THICKFRAME)
       End If
       wStyle = SetWindowLong(m_hWndParent, GWL_STYLE, wStyle)
       
       wStyle = GetWindowLong(m_hWndForm, GWL_STYLE)
       If Wert Then
         wStyle = wStyle Or WS_THICKFRAME
       Else
         wStyle = wStyle And (Not WS_THICKFRAME)
       End If
       wStyle = SetWindowLong(m_hWndForm, GWL_STYLE, wStyle)
       SetWindowPos m_hWndParent, 0, 0, 0, 0, 0, SWP_NOREPOSITION Or SWP_NOZORDER Or SWP_FRAMECHANGED Or SWP_NOACTIVATE Or SWP_NOSIZE Or SWP_NOMOVE
       SetWindowPos m_hWndForm, 0, 0, 0, 0, 0, SWP_NOREPOSITION Or SWP_NOZORDER Or SWP_FRAMECHANGED Or SWP_NOACTIVATE Or SWP_NOSIZE Or SWP_NOMOVE
     End If
   End If
       
  m_OptionSize = Wert
  
  PropertyChanged ("OptionSize")
  
End Property

Property Get MinButton() As Boolean
  MinButton = m_MinButton
End Property

Property Let MinButton(Wert As Boolean)
Dim wStyle As Long
Dim hWindow As Long

  If m_inUserMode And m_bEnabled Then
    If m_inMDI Then
      hWindow = m_hWndForm
    Else
      hWindow = m_hWndParent
    End If
    wStyle = GetWindowLong(hWindow, GWL_STYLE)
    
    If wStyle And WS_BORDER = 0 Then
      Wert = False
    End If
    
    If Wert Then
      wStyle = wStyle Or WS_MINIMIZEBOX
      If m_inMDI Then MenuItemEnable hWindow, SC_MINIMIZE, True
    Else
      wStyle = wStyle - WS_MINIMIZEBOX
      If m_inMDI Then MenuItemEnable hWindow, SC_MINIMIZE, False
    End If
    wStyle = SetWindowLong(hWindow, GWL_STYLE, wStyle)
    SendMessage hWindow, WM_NCACTIVATE, 1, ByVal 0&
  End If
    
  m_MinButton = Wert
  PropertyChanged "MinButton"
  
End Property

Property Get MaxButton() As Boolean
  MaxButton = m_MaxButton
End Property

Property Let MaxButton(Wert As Boolean)
Dim wStyle As Long
Dim hWindow As Long

  If m_inUserMode And m_bEnabled Then
    If m_inMDI Then
      hWindow = m_hWndForm
    Else
      hWindow = m_hWndParent
    End If
    wStyle = GetWindowLong(hWindow, GWL_STYLE)
    
    If wStyle And WS_BORDER = 0 Then
      Wert = False
    End If
    
    If Wert Then
      wStyle = wStyle Or WS_MAXIMIZEBOX
      If m_inMDI Then MenuItemEnable hWindow, SC_MAXIMIZE, True
    Else
      wStyle = wStyle - WS_MAXIMIZEBOX
      If m_inMDI Then MenuItemEnable hWindow, SC_MAXIMIZE, False
    End If
    wStyle = SetWindowLong(hWindow, GWL_STYLE, wStyle)
    SendMessage hWindow, WM_NCACTIVATE, 1, ByVal 0&
  End If
    
  m_MaxButton = Wert
  PropertyChanged "MaxButton"
  
End Property

Property Get OptionMove() As Boolean
  OptionMove = m_OptionMove
End Property

Property Let OptionMove(Wert As Boolean)
  If m_inUserMode And m_bEnabled And Wert <> m_OptionMove Then
    If m_inMDI = False Then
      MenuItemEnable m_hWndParent, SC_MOVE, Wert
    Else
      MenuItemEnable m_hWndForm, SC_MOVE, Wert
    End If
  End If
  m_OptionMove = Wert
  PropertyChanged "OptionMove"
End Property

Property Get OptionClose() As Boolean
  OptionClose = m_OptionClose
End Property

Property Let OptionClose(Wert As Boolean)
  If m_inUserMode And m_bEnabled And Wert <> m_OptionClose Then
    If m_inMDI = False Then
      MenuItemEnable m_hWndParent, 61536, Wert
    Else
      MenuItemEnable m_hWndForm, 61536, Wert
    End If
  End If
  m_OptionClose = Wert
  PropertyChanged "OptionClose"
End Property
'-1.0.4

'Handle auf das Menü des ActiveX Formulares
'handle to the axtivex form menu
Property Get hMenu() As Long            'get menu handle
    hMenu = m_hMenu
End Property

'version of the control
Property Get Version() As String
    Version = App.Major & "." & App.Minor & "." & App.Revision
End Property

'copyright information
Property Get Copyright() As String
    Copyright = "Copyright (c)2000/2001 by Michael Wallner" & vbCrLf & "http://wallner-software.com" & vbCrLf & "mailto:mdiactivex@wallner-software.com" & vbCrLf & "Modifications (c) 2004 P.Violent"
End Property

'gibt die MDIForm des Projektes zurück
'get the MDIForm of the project
Property Get MDIForm() As Object
    Dim hParent As Long
    Dim f As Form
    Dim pointer As Long

    If m_inMDI Then
        Err.Raise vbObjectError + 1050, "MDIActiveX Extender Control", "Not in MDIChild!"
        Exit Property
    End If

    hParent = GetParent(GetParent(m_hWndParent))
    If hParent <> 0 Then
        pointer = GetProp(hParent, "pMDIFrame")
        If pointer <> 0 Then
            CopyMemory f, pointer, 4
        End If
    End If
    Set MDIForm = f
    If pointer <> 0 Then
        CopyMemory f, 0&, 4
    End If
End Property

'Gibt das active MFIChild Fromular zurück- egal ob normales oder mit MDIActiveX erstelltes
'Get the active childform (normal MDIChild or an activex form with mdiactivex control
Property Get ActiveForm() As Object
    Dim hChild As Long
    Dim f As Form
    Dim pointer As Long

    If Not m_inMDI Then
        Err.Raise vbObjectError + 1051, "MDIActiveX Extender Control", "Not in MDIForm!"
        Exit Property
    End If

    hChild = SendMessage(m_MDIClient, WM_MDIGETACTIVE, 0, ByVal 0&)
    
'+ 1.0.4
    If (GetWindowLong(hChild, GWL_STYLE) And WS_VISIBLE) = 0 Then
      hChild = 0      'wenn Fenster unsichtbar -> kein actives Fenster
    End If            'if window invisible -> no active window!
'- 1.0.4
    If hChild <> 0 Then
        'Get pointer to the form object
        pointer = GetProp(hChild, "pMDIChild")
        If pointer <> 0 Then
            'copy adress to object pointer
            CopyMemory f, pointer, 4
        Else
            'pointer=0 --> normal MDIChild --> return MDIForm property!
            Set f = myMDIForm.ActiveForm
        End If
    End If
    Set ActiveForm = f                          'Return object

    If pointer <> 0 Then
        'if work with copymemory then take back!
        CopyMemory f, 0&, 4
    End If
End Property

'Gibt WindowState des ActiveX Formulars in welchem das Control geladen wurde oder
'WindowState des activen MDIChild Fensters (wenn in MDIForm geladen) zurück
'get the windowstate of the activex form (when control in an activex form)
'or the windowstate of the actual mdichild (when control in the MDIForm)
Property Get WindowState() As Long
    Dim hWindow As Long

    If m_inMDI = False Then
        hWindow = m_hWndParent
    Else
        hWindow = SendMessage(m_MDIClient, WM_MDIGETACTIVE, 0, ByVal 0&)
    End If
    WindowState = 0
    If hWindow <> 0 Then
        If IsZoomed(hWindow) Then
            WindowState = 2
        ElseIf IsIconic(hWindow) Then
            WindowState = 1
        Else
            WindowState = 0
        End If
    End If
End Property

'Setzt WindowState des ActiveX Formulars in welchem das Control geladen wurde oder
'setzt den WindowState des activen MDIChildFensters (wenn in MDIForm geladen)
'set the windowstate of the activex form (when control in an activex form)
'or the windowstate of the actual mdichild (when control in the MDIForm)
Property Let WindowState(State As Long)
    Dim hWindow As Long

    If m_inMDI Then
        hWindow = SendMessage(m_MDIClient, WM_MDIGETACTIVE, 0, ByVal 0&)
    Else
        hWindow = m_hWndParent
    End If

    If hWindow <> 0 Then
        If State = 2 Then
            SendMessage GetParent(hWindow), WM_MDIMAXIMIZE, hWindow, ByVal 0&
        ElseIf State = 1 Then
            ShowWindow hWindow, SW_MINIMIZE
        Else
            SendMessage GetParent(hWindow), WM_MDIRESTORE, hWindow, ByVal 0&
        End If
    End If
End Property

'Ab Version 1.0.2 wird diese Methode nicht mehr benötigt!
'can be ignored since version 1.0.2
Public Sub EvalKeyDown(KeyCode As Integer, Shift As Integer)
Attribute EvalKeyDown.VB_MemberFlags = "40"
End Sub


'---------------------'
'Private functions    '
'---------------------'

'+ 1.0.6
Private Function GetTop(ByVal hwnd) As Long
Dim r1 As RECT
Dim r2 As RECT
Dim hParent As Long

    hParent = GetParent(hwnd)
    If isActiveX(hParent) Then
      hwnd = hParent
    End If
    
    GetWindowRect hwnd, r1
    GetWindowRect GetParent(hwnd), r2
    r1.Left = r1.Left - r2.Left - 2
    r1.Top = r1.Top - r2.Top - 2
    GetTop = r1.Top * Screen.TwipsPerPixelY
    
End Function

Private Function GetLeft(ByVal hwnd) As Long
Dim r1 As RECT
Dim r2 As RECT
Dim hParent As Long

    hParent = GetParent(hwnd)
    If isActiveX(hParent) Then
      hwnd = hParent
    End If
    
    GetWindowRect hwnd, r1
    GetWindowRect GetParent(hwnd), r2
    r1.Left = r1.Left - r2.Left - 2
    r1.Top = r1.Top - r2.Top - 2
    GetLeft = r1.Left * Screen.TwipsPerPixelX
    
End Function
'- 1.0.6


'Init wenn das Control in einer MDIForm geladen wird
'Init if control is in the MDIForm of the project
Private Sub InitParent()
    m_inMDI = True
    If m_inUserMode And m_bEnabled Then
        Set Forms = New Collection
        Set myMDIForm = UserControl.Extender.Parent
        SetProp myMDIForm.hwnd, "pMDIFrame", ObjPtr(myMDIForm)
'+ 1.0.5
        'm_MDIClient = GetWindow(m_hWndForm, GW_CHILD)     'MDIClient Fenster
        m_MDIClient = GetMDIClient(m_hWndForm)            'MDIClient Fenster
'- 1.0.5
'+ 1.0.6
        'start subclassing later to work with the VBAccelerator PopUP.ocx
        'start subclassing
'        SubStartMDI m_MDIClient
'        SubStartMDI m_hWndForm
'- 1.0.6
        myRegisterClass                                   'register WindowClass
    End If
End Sub

'Init wenn das Control in ein Formular einer ActiveX-DLL geladen wird
'Init if control is in an activex form
Private Sub InitChild()
    Dim hMDI As Long
    Dim hwnd As Long
    Dim hIcon As Long

    m_inMDI = False
    If m_inUserMode And m_bEnabled Then
        Set myForm = UserControl.Extender.Parent
        'find MDIFrame window...
        hMDI = GetMDIFrame
        If hMDI = 0 Then
            'MsgBox "Konnte keine geladene MDIForm finden!"
'- 1.0.10
            'MsgBox "Can't find MDIForm!"
'+ 1.0.9
            'Unload UserControl.Extender.Parent          '!!!!!
            m_bEnabled = False
'- 1.0.9
            Exit Sub
        End If
        hIcon = SendMessage(m_hWndForm, WM_GETICON, 0, ByVal 0&)
'+ 1.0.5
        'SendMessage GetWindow(hMDI, GW_CHILD), WM_MDIGETACTIVE, 0, m_State
'+ 1.0.6
        'm_hWndLastActive = SendMessage(GetWindow(hMDI, GW_CHILD), WM_MDIGETACTIVE, 0, m_State)
        m_hWndLastActive = SendMessage(GetMDIClient(hMDI), WM_MDIGETACTIVE, 0, m_State)
'- 1.0.6
'- 1.0.5
        'create MDIChild Window...
        m_hWndParent = CreateMDIChild(hMDI, UserControl.Extender.Parent.caption)
        If m_hWndParent = 0 Then
            MsgBox "Fehler beim Erstellen der MDIClient Form!" & vbCrLf & _
                   "Can't create MDIChild window!"
            Unload UserControl.Extender.Parent          '!!!!!
            Exit Sub
        End If
        
'+ 1.0.4
        If Not m_OptionClose Then
            MenuItemEnable m_hWndParent, 61536, False
        End If
        If Not m_OptionMove Then
          MenuItemEnable m_hWndParent, SC_MOVE, False
        End If
        
        OptionSize = m_OptionSize
        MinButton = m_MinButton
        MaxButton = m_MaxButton
        MinSizeX = m_MinSizeX
        MinSizeY = m_MinSizeY
        MaxSizeX = m_MaxSizeX
        MaxSizeY = m_MaxSizeY
'- 1.0.4
        
        'start subclassing  activex form
        SubStart m_hWndForm
    End If

End Sub

'init control
Private Sub Init()
    On Error Resume Next

    m_hWndForm = UserControl.Extender.Parent.hwnd

    If UserControl.Ambient.UserMode Then
        m_inUserMode = True
    Else
        m_inUserMode = False
    End If

    'test if parent is Form or MDIForm...
    If TypeOf UserControl.Extender.Parent Is MDIForm Then
        InitParent
    ElseIf TypeOf UserControl.Extender.Parent Is Form Then
        InitChild
    Else
        MsgBox "Dieses Control wurde exklusiv für Visual Basic entwickelt!" & vbCrLf & _
                "This Control is designed for Visual Basic!"
    End If


End Sub

'damit beim öffnen einer Form der Focus richtig gesetzt wird, ist diese Procedur nötig
'this code set the focus to the right control on form load/open
Private Sub myForm_Activate()
    Dim hParent As Long
    
'+ 1.0.6
    If myForm.Visible = False Then
      SendMessage GetParent(m_hWndForm), WM_SYSCOMMAND, SC_NEXTWINDOW, ByVal 0&
    Else
'- 1.0.6
      'set focus to the right control!
      If m_hWndParent = SendMessage(GetParent(m_hWndParent), WM_MDIGETACTIVE, 0, ByVal 0&) Then
        SendMessage m_hWndParent, WM_NCACTIVATE, 1, ByVal 0& 'activate form
      End If
'+ 1.0.6
    End If
    
'+ 1.0.5
    'wenn ein Formular unsichtbar geladen wurde, so muß es kurz angezeigt werden um Probleme mit den Menüs zu vermeiden
    'if form is load invisible, formhas to be shown shortly ti avoid problems with menu
    'If myForm.Visible = False Then
    '  SendMessage GetParent(m_hWndParent), WM_SETREDRAW, False, ByVal 0&       'we don't want to see the creation of the window!
    '  myForm.Visible = True
    '  SendMessage GetParent(m_hWndParent), WM_SETREDRAW, True, ByVal 0&
    '  myForm.Visible = False
    'End If
'- 1.0.5
'- 1.0.6
    
End Sub

'Kombinationen mit der Strg und Alt Taste müssen besonders behandelt werden!
'event activex keydown
'ctrl+F6, ctrl+F4 and alt+ accelerator keys!
Private Sub myForm_KeyDown(KeyCode As Integer, Shift As Integer)
Debug.Print "KeyDown", KeyCode, Shift

    Dim lParam As Long
    'Ctrl+F6
'+ 1.0.7
'    If KeyCode = 117 And (Shift = 2 Or Shift = 3) Then
    If (KeyCode = 117 Or KeyCode = 9) And (Shift = 2 Or Shift = 3) Then
'- 1.0.7
        If Shift = 2 Then
            PostMessage GetParent(m_hWndForm), WM_SYSCOMMAND, SC_NEXTWINDOW, ByVal 0&
        Else
            PostMessage GetParent(m_hWndForm), WM_SYSCOMMAND, SC_PREVWINDOW, ByVal 0&
        End If
        KeyCode = 0
        Shift = 0
        'Ctrl + F4
    ElseIf KeyCode = 115 And (Shift = 2 Or Shift = 3) And m_OptionClose Then '+ 1.0.4
'+ 1.0.7
        KeyCode = 0
        Shift = 0
'- 1.0.7
        PostMessage GetParent(m_hWndForm), WM_CLOSE, 0, ByVal 0&
        'Alt + ? menu accelerator!
    ElseIf Shift = 4 And KeyCode <> 18 And KeyCode <> 115 And KeyCode <> 32 Then
        lParam = ((KeyCode Or &H2000) * &H10000) Or &H1
        PostMessage GetParent(GetParent(GetParent(m_hWndForm))), WM_SYSCHAR, KeyCode, lParam
        'Alt + Space
    ElseIf Shift = 4 And KeyCode = 32 Then
'+ 1.0.7
        KeyCode = 0
        Shift = 0
        'm_ignorekey = True
'- 1.0.7
    ElseIf Shift <> 0 Then
        'if there is no form  menu  --> send to 'real' MDIChild Window
        If GetProp(GetParent(m_hWndForm), "hMDIMenu") = 0 Then
'+ 1.0.6 (Thanks to Keith Dimmock!)
'            PostMessage GetParent(GetParent(m_hWndForm)), WM_KEYDOWN, KeyCode, 0
'+ 1.0,7
'            SendMessage GetParent(GetParent(m_hWndForm)), WM_KEYDOWN, KeyCode, 0
             SendMessage GetParent(m_hWndForm), WM_KEYDOWN, KeyCode, 0
'- 1.0.6
            'm_ignorekey = True
'- 1.0.7
        End If
    End If

End Sub

'wurde ein Tastendruck an die MDIForm weitergeleitet,
'so muß er in der ActiveX Form unterdrückt werden
'event activex form keypress
Private Sub myForm_KeyPress(KeyAscii As Integer)
'+ 1.0.7
    'if key is send to main window -> ignore key or we will get a beep!
    'If m_ignorekey Then
    '    m_ignorekey = False
    '    KeyAscii = 0
    'End If
'-1.0.7
End Sub

'wurde die Activex Form geladen, so muß sie erst zu einer MDIChild From gemacht werden!
'event activex form load
'after the form is loaded, there's a lot of work to do!
Private Sub myForm_Load()
    Dim hParent As Long
    Dim hIcon As Long
    Dim ctl As Control
    
'+ 1.0.6
    Dim hChild As Long
    Dim r As RECT
'- 1.0.6
 
'+ 1.0.9
    If Not m_bEnabled Then Exit Sub
'- 1.0.9

    'Jetzt gibt es bereits ein Menu (falls die Form ein eigenes Menu hat!)
    'this ist the right moment to look for a menu!
    'if there is a form menu
    m_hMenu = GetMenu(m_hWndForm)
    'and a WindowList
    m_hFileMenu = FindWindowMenu(m_hMenu)

    'Fenster zu Kindfenster machen
    MakeChild m_hWndForm                  'change WindowStyle(ex)
    ParentNotify m_hWndForm               'erase WS_EX_NOPARENTNOTIFY styles
    SetProp m_hWndParent, "pMDIChild", ObjPtr(myForm)
    SetParent m_hWndForm, m_hWndParent    'change Parent
    Resize m_hWndForm                     'correct size
    hParent = GetParent(m_hWndForm)
    'Speichere die Menuhandles des Fensters
    SetProp hParent, "hMDIMenu", m_hMenu        'store handle menu
    SetProp hParent, "hFileMenu", m_hFileMenu   'store handle windowlist
    'set icon
    hIcon = SendMessage(m_hWndForm, WM_GETICON, 0, ByVal 0&)
    SendMessage m_hWndParent, WM_SETICON, 0, ByVal hIcon
    
'+ 1.0.5
    myForm.caption = myForm.caption
'- 1.0.5
    
    'die Form zu der Forms Auflistung in der MDIForm hinzufügen
    'add the form to the forms collection of the mdiactivex control in the MDIForm
    For Each ctl In Me.MDIForm.Controls
        If TypeOf ctl Is MDIActiveX Then
            'found MDIActivex.ocx
            ctl.Forms.Add myForm, CStr(m_hWndParent)
            Exit For
        End If
    Next
    
    'OptionSize = m_OptionSize
    'War die zuletzt aktive Form maximiert?
    'was the active mdichild window maximized?
'+ 1.0.6
    'If m_State = 1 Then
      'yes --> maximize me
    '  SendMessage GetParent(m_hWndParent), WM_MDIMAXIMIZE, m_hWndParent, ByVal 0&
    'End If
    
    If m_State = 1 And m_MaxButton Then
      SendMessage GetParent(m_hWndParent), WM_MDIMAXIMIZE, m_hWndParent, ByVal 0&
    End If

    'Die anderen MDIChild Fenster neu zeichnen!
    'Refresh the other MDIChild windows...
    hChild = GetWindow(GetParent(m_hWndParent), GW_CHILD)
    While hChild <> 0
        If hChild <> m_hWndParent Then
          'GetClientRect hChild, r
          InvalidateRect hChild, 0&, 1
          SetWindowPos hChild, 0, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOREPOSITION Or SWP_NOZORDER Or SWP_FRAMECHANGED Or SWP_NOMOVE Or SWP_NOACTIVATE
        End If
        hChild = GetWindow(hChild, GW_HWNDNEXT)
    Wend
'    GetClientRect GetParent(m_hWndParent), r
    InvalidateRect GetParent(m_hWndParent), 0&, 1
    UpdateWindow GetParent(m_hWndParent)
'- 1.0.6
   
       
    'Aktiviere die gerade geladene Form
    'activate the activex form
    SendMessage hParent, WM_NCACTIVATE, 1, ByVal 0& 'activate form
    
    
'+ 1.0.5
    PostMessage m_hWndForm, &H100E, &HA, 1
    'Jetzt is das Formular geladen und das Fenster des Fromulars ist ein Kindfenster
    'eines 'echten' MDIChild Fensters. (Propertie hWndMDIChild!)
    'Now the Form is load and the form window is a child of a'real' mdichild
    'window' (Property hWndMDIChild!)
    RaiseEvent FormLoad
'- 1.0.5
    
End Sub

'event MDIForm load
Private Sub myMDIForm_Load()
    'Original Menuhandle der Applikation sichern
    'save the menu handle
    g_oldhMenu = GetMenu(myMDIForm.hwnd)
    m_hMenu = g_oldhMenu
'+ 1.0.4
    If Not m_OptionClose Then
       MenuItemEnable myMDIForm.hwnd, 61536, False
    End If
    If Not m_OptionMove Then
      MenuItemEnable myMDIForm.hwnd, SC_MOVE, False
    End If
    If Not m_MinButton Then MinButton = m_MinButton
    If Not m_MaxButton Then MaxButton = m_MaxButton
'- 1.0.4
    
'+ 1.0.6
    SubStartMDI m_MDIClient
    SubStartMDI m_hWndForm

    RaiseEvent FormLoad
'- 1.0.6

    
End Sub

'+1.0.4
Private Sub myMDIForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If m_OptionClose = False And UnloadMode = 0 Then
     Cancel = True
  End If
End Sub
'-1.0.4

'event MDIForm unload
Private Sub myMDIForm_Unload(Cancel As Integer)
    Dim hChild As Long
    Dim hChild1 As Long

    'erstes MDIChild suchen
    'find first MDIChild window
    hChild = GetWindow(m_MDIClient, GW_CHILD)
    
    While hChild <> 0
        'save handle
        hChild1 = hChild
        'Schließe das Fenster / close first MDIChild
        SendMessage hChild, WM_CLOSE, 0, ByVal 0
        'neues erstes MDIChild finden / find new first MDIChild window
        hChild = GetWindow(m_MDIClient, GW_CHILD)
        'ist 'neues' = 'altes' ---> abbrechen!
        'if this is the same window ---> Cancel!
        If hChild = hChild1 Then
            Cancel = True
            Exit Sub
        End If
        'else perform new MDIChild window
    Wend

End Sub

Private Sub UserControl_Initialize()
'+ 1.0.6
'  m_OptionClose = True
'  m_OptionSize = True
'  m_OptionMove = True
'  m_MinButton = True
'  m_MaxButton = True
'  m_MinSizeX = 0
'  m_MinSizeY = 0
'  m_MaxSizeX = 0
'  m_MaxSizeY = 0
'  m_BorderStyle = 2
'- 1.0.6
End Sub

Private Sub UserControl_InitProperties()
'+ 1.0.6
  m_OptionClose = True
  m_OptionSize = True
  m_OptionMove = True
  m_MinButton = True
  m_MaxButton = True
  m_MinSizeX = 0
  m_MinSizeY = 0
  m_MaxSizeX = 0
  m_MaxSizeY = 0
  'm_BorderStyle = 2
'- 1.0.6
  m_bEnabled = True
End Sub

'+ 1.0.4
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    m_OptionClose = PropBag.ReadProperty("OptionClose", True)
    m_OptionSize = PropBag.ReadProperty("OptionSize", True)
    m_OptionMove = PropBag.ReadProperty("OptionMove", True)
    m_MaxButton = PropBag.ReadProperty("MaxButton", True)
    m_MinButton = PropBag.ReadProperty("MinButton", True)
    m_MinSizeX = PropBag.ReadProperty("MinSizeX", 0)
    m_MinSizeY = PropBag.ReadProperty("MinSizeY", 0)
    m_MaxSizeX = PropBag.ReadProperty("MaxSizeX", 0)
    m_MaxSizeY = PropBag.ReadProperty("MaxSizeY", 0)
    m_BorderStyle = PropBag.ReadProperty("BorderStyle", 2)
    
    On Error Resume Next
    m_bEnabled = UserControl.Parent.DisplayedAsMDIChild
    If Err Then m_bEnabled = True
    Err.Clear
    On Error GoTo 0
    
    Init
End Sub
'-1.0.4

Private Sub UserControl_Resize()
    UserControl.height = UserControl.ScaleX(30, vbPixels, UserControl.ScaleMode)
    UserControl.width = UserControl.ScaleY(32, vbPixels, UserControl.ScaleMode)
End Sub

Private Sub UserControl_Terminate()
On Error Resume Next
    Dim ctl As Control
    If m_inUserMode And m_bEnabled Then
        If m_inMDI Then
'+ 1.0.6
            'SubStop m_MDIClient
            'SubStop m_hWndForm
'- 1.0.6
            myUnregisterClass
            RemoveProp myMDIForm.hwnd, "pMDIFrame"
        Else
            'delete from the forms collection in the MDIForm
'+ 1.0.6
            If IsWindow(m_hWndParent) Then 'or vb ide hang in halt!
'- 1.0.6
              For Each ctl In Me.MDIForm.Controls
                If TypeOf ctl Is MDIActiveX Then
                    ctl.Forms.Remove CStr(m_hWndParent)
                    Exit For
                End If
              Next
            End If
            'SubStop m_hWndForm
'- 1.0.6
'+ 1.0.5
            'SendMessage m_hWndParent, WM_CLOSE, 255, ByVal 0&
'- 1.0.5
        End If
    End If
End Sub

'suche das Menü mit der Eigenschaft WindowList = true
'find the windowList menu in a child window
Private Function FindWindowMenu(hMenu As Long) As Long
    Dim c As Control
    Dim m As Menu
    Dim caption As String
    Dim i As Long
    Dim cMenu As Long
    Dim hSubMenu As Long
    Dim mCaption As String
    Dim Result As Long

    caption = ""

    'Find VB-Menu with WindowList
    For Each c In myForm.Controls
        If TypeOf c Is Menu Then
            Set m = c
            If m.WindowList Then
                caption = m.caption
                Exit For
            End If
        End If
    Next

    If caption <> "" Then
        cMenu = GetMenuItemCount(m_hMenu)         'number of main menus
        For i = 0 To cMenu - 1
            hSubMenu = GetSubMenu(m_hMenu, i)     'get submenu Handle
            mCaption = String(255, 0)
            'get menu caption
            Result = GetMenuString(m_hMenu, i, mCaption, 254, MF_BYPOSITION)
            mCaption = Left$(mCaption, Result)
            If mCaption = caption Then            'caption = caption.vb-menu?
                FindWindowMenu = hSubMenu         'yes --> return handle
                Exit For                          'and exit loop
            End If
        Next
    End If

End Function

'+ 1.0.4
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  PropBag.WriteProperty "OptionSize", m_OptionSize, True
  PropBag.WriteProperty "OptionClose", m_OptionClose, True
  PropBag.WriteProperty "OptionMove", m_OptionMove, True
  PropBag.WriteProperty "MaxButton", m_MaxButton, True
  PropBag.WriteProperty "MinButton", m_MinButton, True
  PropBag.WriteProperty "MinSizeX", m_MinSizeX, 0
  PropBag.WriteProperty "MinSizeY", m_MinSizeY, 0
  PropBag.WriteProperty "MaxSizeX", m_MaxSizeX, 0
  PropBag.WriteProperty "MaxSizeY", m_MaxSizeY, 0
  PropBag.WriteProperty "BorderStyle", m_BorderStyle, 2
End Sub
'- 1.0.4

