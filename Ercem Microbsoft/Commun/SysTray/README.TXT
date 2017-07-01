' ------------------------------------------------------------------------
'      Copyright © 1997 Microsoft Corporation.  All rights reserved.
'
' You have a royalty-free right to use, modify, reproduce and distribute
' the Sample Application Files (and/or any modified version) in any way
' you find useful, provided that you agree that Microsoft has no warranty,
' obligations or liability for any Sample Application Files.
' ------------------------------------------------------------------------
Sys Tray Icon Control
Readme document
March 4, 1997

Summary
-------
SysTray.ocx contains the System Tray Icon Control, which exposes functionality to 
the Explorer's System Tray.  

Properties
----------
InTray:    Use this design and runtime boolean property to add/remove an icon 
           to/from the system tray and enable/disable events in the tray.
TrayTip:   Use this design and runtime string property to customize the ToolTip 
           for your system tray icon.
TrayIcon:  Use this design and runtime picture property to change the icon hosted
           in the system tray.

Events
------
The SysTray control provides four mouse events:  MouseMove, MouseDown, MouseUp and
MouseDblClick.  The Id parameter in each event is a unique id that identifies each
instance of the control.  The Button parameter will contain the id of the button 
that activated the current event (Right, Left, and Middle).

  MouseMove(Id As Long)
  MouseDown(Button As Integer, Id As Long)
  MouseUp(Button As Integer, Id As Long)
  MouseDblClick(Button As Integer, Id As Long)
