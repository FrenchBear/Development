VERSION 5.00
Begin VB.UserControl cSysTray 
   CanGetFocus     =   0   'False
   ClientHeight    =   510
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   510
   ClipControls    =   0   'False
   EditAtDesignTime=   -1  'True
   InvisibleAtRuntime=   -1  'True
   MouseIcon       =   "SYSTRAY.ctx":0000
   Picture         =   "SYSTRAY.ctx":030A
   ScaleHeight     =   34
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   34
End
Attribute VB_Name = "cSysTray"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' ------------------------------------------------------------------------
'      Copyright © 1997 Microsoft Corporation.  All rights reserved.
'
' You have a royalty-free right to use, modify, reproduce and distribute
' the Sample Application Files (and/or any modified version) in any way
' you find useful, provided that you agree that Microsoft has no warranty,
' obligations or liability for any Sample Application Files.
' ------------------------------------------------------------------------
Option Explicit
'-------------------------------------------------------
' Control Property Globals...
'-------------------------------------------------------
Private gInTray As Boolean
Private gTrayId As Long
Private gTrayTip As String
Private gTrayHwnd As Long
Private gTrayIcon As StdPicture
Private gAddedToTray As Boolean
Const MAX_SIZE = 510

Private Const defInTray = False
Private Const defTrayTip = "VB 5 - SysTray Control." & vbNullChar

Private Const sInTray = "InTray"
Private Const sTrayIcon = "TrayIcon"
Private Const sTrayTip = "TrayTip"

'-------------------------------------------------------
' Control Events...
'-------------------------------------------------------
Public Event MouseMove(Id As Long)
Public Event MouseDown(Button As Integer, Id As Long)
Public Event MouseUp(Button As Integer, Id As Long)
Public Event MouseDblClick(Button As Integer, Id As Long)

'-------------------------------------------------------
Private Sub UserControl_Initialize()
'-------------------------------------------------------
    gInTray = defInTray                             ' Set global InTray default
    gAddedToTray = False                            ' Set default state
    gTrayId = 0                                     ' Set global TrayId default
    gTrayHwnd = hwnd                                ' Set and keep HWND of user control
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

'-------------------------------------------------------
Private Sub UserControl_InitProperties()
'-------------------------------------------------------
    InTray = defInTray                              ' Init InTray Property
    TrayTip = defTrayTip                            ' Init TrayTip Property
    Set TrayIcon = Picture                          ' Init TrayIcon property
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

'-------------------------------------------------------
Private Sub UserControl_Paint()
'-------------------------------------------------------
    Dim edge As RECT                                ' Rectangle edge of control
'-------------------------------------------------------
    edge.Left = 0                                   ' Set rect edges to outer
    edge.Top = 0                                    ' - most position in pixels
    edge.Bottom = ScaleHeight                       '
    edge.Right = ScaleWidth                         '
    DrawEdge hDC, edge, BDR_RAISEDOUTER, BF_RECT Or BF_SOFT ' Draw Edge...
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

'-------------------------------------------------------
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
'-------------------------------------------------------
    ' Read in the properties that have been saved into the PropertyBag...
    With PropBag
        InTray = .ReadProperty(sInTray, defInTray)       ' Get InTray
        Set TrayIcon = .ReadProperty(sTrayIcon, Picture) ' Get TrayIcon
        TrayTip = .ReadProperty(sTrayTip, defTrayTip)    ' Get TrayTip
    End With
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

'-------------------------------------------------------
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
'-------------------------------------------------------
    With PropBag
        .WriteProperty sInTray, gInTray                 ' Save InTray to propertybag
        .WriteProperty sTrayIcon, gTrayIcon             ' Save TrayIcon to propertybag
        .WriteProperty sTrayTip, gTrayTip               ' Save TrayTip to propertybag
    End With
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

'-------------------------------------------------------
Private Sub UserControl_Resize()
'-------------------------------------------------------
    Height = MAX_SIZE                   ' Prevent Control from being resized...
    Width = MAX_SIZE
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

'-------------------------------------------------------
Private Sub UserControl_Terminate()
'-------------------------------------------------------
    If InTray Then                      ' If TrayIcon is visible
        InTray = False                  ' Cleanup and unplug it.
    End If
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

'-------------------------------------------------------
Public Property Set TrayIcon(Icon As StdPicture)
'-------------------------------------------------------
    Dim Tray As NOTIFYICONDATA                          ' Notify Icon Data structure
    Dim rc As Long                                      ' API return code
'-------------------------------------------------------
    If Not (Icon Is Nothing) Then                       ' If icon is valid...
        If (Icon.Type = vbPicTypeIcon) Then             ' Use ONLY if it is an icon
            If gAddedToTray Then                        ' Modify tray only if it is in use.
                Tray.uID = gTrayId                      ' Unique ID for each HWND and callback message.
                Tray.hwnd = gTrayHwnd                   ' HWND receiving messages.
                Tray.hIcon = Icon.Handle                ' Tray icon.
                Tray.uFlags = NIF_ICON                  ' Set flags for valid data items
                Tray.cbSize = Len(Tray)                 ' Size of struct.
                
                rc = Shell_NotifyIcon(NIM_MODIFY, Tray) ' Send data to Sys Tray.
            End If
    
            Set gTrayIcon = Icon                        ' Save Icon to global
            Set Picture = Icon                          ' Show user change in control as well(gratuitous)
            PropertyChanged sTrayIcon                   ' Notify control that property has changed.
        End If
    End If
'-------------------------------------------------------
End Property
'-------------------------------------------------------

'-------------------------------------------------------
Public Property Get TrayIcon() As StdPicture
'-------------------------------------------------------
    Set TrayIcon = gTrayIcon                        ' Return Icon value
'-------------------------------------------------------
End Property
'-------------------------------------------------------

'-------------------------------------------------------
Public Property Let TrayTip(Tip As String)
Attribute TrayTip.VB_ProcData.VB_Invoke_PropertyPut = ";Misc"
Attribute TrayTip.VB_UserMemId = -517
'-------------------------------------------------------
    Dim Tray As NOTIFYICONDATA                      ' Notify Icon Data structure
    Dim rc As Long                                  ' API Return code
'-------------------------------------------------------
    If gAddedToTray Then                            ' if TrayIcon is in taskbar
        Tray.uID = gTrayId                          ' Unique ID for each HWND and callback message.
        Tray.hwnd = gTrayHwnd                       ' HWND receiving messages.
        Tray.szTip = Tip & vbNullChar               ' Tray tool tip
        Tray.uFlags = NIF_TIP                       ' Set flags for valid data items
        Tray.cbSize = Len(Tray)                     ' Size of struct.
        
        rc = Shell_NotifyIcon(NIM_MODIFY, Tray)     ' Send data to Sys Tray.
    End If
    
    gTrayTip = Tip                                  ' Save Tip
    PropertyChanged sTrayTip                        ' Notify control that property has changed
'-------------------------------------------------------
End Property
'-------------------------------------------------------

'-------------------------------------------------------
Public Property Get TrayTip() As String
'-------------------------------------------------------
    TrayTip = gTrayTip                              ' Return Global Tip...
'-------------------------------------------------------
End Property
'-------------------------------------------------------

'-------------------------------------------------------
Public Property Let InTray(Show As Boolean)
Attribute InTray.VB_ProcData.VB_Invoke_PropertyPut = ";Behavior"
'-------------------------------------------------------
    Dim ClassAddr As Long                           ' Address pointer to Control Instance
'-------------------------------------------------------
    If (Show <> gInTray) Then                       ' Modify ONLY if state is changing!
        If Show Then                                ' If adding Icon to system tray...
            If Ambient.UserMode Then                ' If in RunMode and not in IDE...
                 ' SubClass Controls window proc.
                PrevWndProc = SetWindowLong(gTrayHwnd, GWL_WNDPROC, AddressOf SubWndProc)
                
                ' Get address to user control object
                'CopyMemory ClassAddr, UserControl, 4&
                
                ' Save address to the USERDATA of the control's window struct.
                ' this will be used to get an object reference to the control
                ' from an HWND in the callback.
                SetWindowLong gTrayHwnd, GWL_USERDATA, ObjPtr(Me) 'ClassAddr
                
                AddIcon gTrayHwnd, gTrayId, TrayTip, TrayIcon ' Add TrayIcon to System Tray...
                gAddedToTray = True                 ' Save state of control used in teardown procedure
            End If
        Else                                        ' If removing Icon from system tray
            If gAddedToTray Then                    ' If Added to system tray then remove...
                DeleteIcon gTrayHwnd, gTrayId       ' Remove icon from system tray
                
                ' Un SubClass controls window proc.
                SetWindowLong gTrayHwnd, GWL_WNDPROC, PrevWndProc
                gAddedToTray = False                ' Maintain the state for teardown purposes
            End If
        End If
        
        gInTray = Show                              ' Update global variable
        PropertyChanged sInTray                     ' Notify control that property has changed
    End If
'-------------------------------------------------------
End Property
'-------------------------------------------------------

'-------------------------------------------------------
Public Property Get InTray() As Boolean
'-------------------------------------------------------
    InTray = gInTray                                ' Return global property
'-------------------------------------------------------
End Property
'-------------------------------------------------------

'-------------------------------------------------------
Private Sub AddIcon(hwnd As Long, Id As Long, Tip As String, Icon As StdPicture)
'-------------------------------------------------------
    Dim Tray As NOTIFYICONDATA                      ' Notify Icon Data structure
    Dim tFlags As Long                              ' Tray action flag
    Dim rc As Long                                  ' API return code
'-------------------------------------------------------
    Tray.uID = Id                                   ' Unique ID for each HWND and callback message.
    Tray.hwnd = hwnd                                ' HWND receiving messages.
    
    If Not (Icon Is Nothing) Then                   ' Validate Icon picture
        Tray.hIcon = Icon.Handle                    ' Tray icon.
        Tray.uFlags = Tray.uFlags Or NIF_ICON       ' Set ICON flag to validate data item
        Set gTrayIcon = Icon                        ' Save icon
    End If
    
    If (Tip <> "") Then                             ' Validate Tip text
        Tray.szTip = Tip & vbNullChar               ' Tray tool tip
        Tray.uFlags = Tray.uFlags Or NIF_TIP        ' Set TIP flag to validate data item
        gTrayTip = Tip                              ' Save tool tip
    End If
    
    Tray.uCallbackMessage = TRAY_CALLBACK           ' Set user defined message
    Tray.uFlags = Tray.uFlags Or NIF_MESSAGE        ' Set flags for valid data item
    Tray.cbSize = Len(Tray)                         ' Size of struct.
    
    rc = Shell_NotifyIcon(NIM_ADD, Tray)            ' Send data to Sys Tray.
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

'-------------------------------------------------------
Private Sub DeleteIcon(hwnd As Long, Id As Long)
'-------------------------------------------------------
    Dim Tray As NOTIFYICONDATA                      ' Notify Icon Data structure
    Dim rc As Long                                  ' API return code
'-------------------------------------------------------
    Tray.uID = Id                                   ' Unique ID for each HWND and callback message.
    Tray.hwnd = hwnd                                ' HWNDreceiving messages.
    Tray.uFlags = 0&                                ' Set flags for valid data items
    Tray.cbSize = Len(Tray)                         ' Size of struct.
    
    rc = Shell_NotifyIcon(NIM_DELETE, Tray)         ' Send delete message.
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

'-------------------------------------------------------
Friend Sub SendEvent(MouseEvent As Long, Id As Long)
'-------------------------------------------------------
    Select Case MouseEvent                          ' Dispatch mouse events to control
    Case WM_MOUSEMOVE
        RaiseEvent MouseMove(Id)
    Case WM_LBUTTONDOWN
        RaiseEvent MouseDown(vbLeftButton, Id)
    Case WM_LBUTTONUP
        RaiseEvent MouseUp(vbLeftButton, Id)
    Case WM_LBUTTONDBLCLK
        RaiseEvent MouseDblClick(vbLeftButton, Id)
    Case WM_RBUTTONDOWN
        RaiseEvent MouseDown(vbRightButton, Id)
    Case WM_RBUTTONUP
        RaiseEvent MouseUp(vbRightButton, Id)
    Case WM_RBUTTONDBLCLK
        RaiseEvent MouseDblClick(vbRightButton, Id)
    End Select
'-------------------------------------------------------
End Sub
'-------------------------------------------------------

