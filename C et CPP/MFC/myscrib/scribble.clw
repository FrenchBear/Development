; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CScribDoc
LastTemplate=splitter
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "scribble.h"
LastPage=0

ClassCount=7
Class1=CScribbleApp
Class2=CScribDoc
Class3=CScribView
Class4=CMainFrame

ResourceCount=4
Resource1=IDR_SCRIBTYPE
Resource2=IDR_MAINFRAME
Resource3=IDD_PEN_WIDTHS
Class5=CAboutDlg
Class6=CPenWidthsDlg
Class7=CScribFrame
Resource4=IDD_ABOUTBOX

[CLS:CScribbleApp]
Type=0
HeaderFile=scribble.h
ImplementationFile=scribble.cpp
Filter=N

[CLS:CScribDoc]
Type=0
HeaderFile=scribdoc.h
ImplementationFile=scribdoc.cpp
Filter=N
VirtualFilter=DC
LastObject=ID_PEN_AUTRES_COULEURS

[CLS:CScribView]
Type=0
HeaderFile=scribvw.h
ImplementationFile=scribvw.cpp
Filter=C
LastObject=CScribView
VirtualFilter=VWC

[CLS:CMainFrame]
Type=0
HeaderFile=mainfrm.h
ImplementationFile=mainfrm.cpp
Filter=T



[CLS:CAboutDlg]
Type=0
HeaderFile=scribble.cpp
ImplementationFile=scribble.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=7
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Control5=IDC_GENERIC1,SysTabControl32,1342177280
Control6=IDC_GENERIC3,SysTabControl32,1342177280
Control7=IDC_GENERIC4,SysTabControl32,1342177280

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_PRINT_SETUP
Command4=ID_FILE_MRU_FILE1
Command5=ID_APP_EXIT
Command6=ID_VIEW_TOOLBAR
Command7=ID_VIEW_STATUS_BAR
Command8=ID_APP_ABOUT
CommandCount=8

[MNU:IDR_SCRIBTYPE]
Type=1
Class=CScribView
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_CLOSE
Command4=ID_FILE_SAVE
Command5=ID_FILE_SAVE_AS
Command6=ID_FILE_PRINT
Command7=ID_FILE_PRINT_PREVIEW
Command8=ID_FILE_PRINT_SETUP
Command9=ID_FILE_MRU_FILE1
Command10=ID_APP_EXIT
Command11=ID_EDIT_UNDO
Command12=ID_EDIT_CUT
Command13=ID_EDIT_COPY
Command14=ID_EDIT_PASTE
Command15=ID_EDIT_CLEAR_ALL
Command16=ID_PEN_THICK_OR_THIN
Command17=ID_PEN_WIDTHS
Command18=ID_PEN_BLACK
Command19=ID_PEN_RED
Command20=ID_PEN_BLUE
Command21=ID_PEN_GREEN
Command22=ID_PEN_AUTRES_COULEURS
Command23=ID_VIEW_TOOLBAR
Command24=ID_VIEW_STATUS_BAR
Command25=ID_WINDOW_NEW
Command26=ID_WINDOW_CASCADE
Command27=ID_WINDOW_TILE_HORZ
Command28=ID_WINDOW_ARRANGE
Command29=ID_APP_ABOUT
CommandCount=29

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[DLG:IDD_PEN_WIDTHS]
Type=1
Class=CPenWidthsDlg
ControlCount=8
Control1=IDC_STATIC,static,1342308352
Control2=IDC_THIN_PEN_WIDTH,edit,1350631552
Control3=IDC_STATIC,static,1342308352
Control4=IDC_THICK_PEN_WIDTH,edit,1350631552
Control5=IDOK,button,1342242817
Control6=IDCANCEL,button,1342242816
Control7=IDC_DEFAULT_PEN_WIDTHS,button,1342242816
Control8=IDC_GENERIC1,SysTabControl32,1342177280

[CLS:CPenWidthsDlg]
Type=0
HeaderFile=pendlg.h
ImplementationFile=pendlg.cpp
Filter=D
VirtualFilter=dWC
LastObject=IDC_DEFAULT_PEN_WIDTHS

[CLS:CScribFrame]
Type=0
HeaderFile=scribfrm.h
ImplementationFile=scribfrm.cpp
Filter=T

