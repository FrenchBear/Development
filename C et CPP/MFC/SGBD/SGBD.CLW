; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CAboutDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "sgbd.h"
VbxHeaderFile=sgbd.h
VbxImplementationFile=sgbd.cpp
LastPage=2

ClassCount=6
Class1=CSgbdApp
Class2=CSgbdDoc
Class3=CSgbdView
Class4=CMainFrame
Class6=CAboutDlg

ResourceCount=3
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Class5=CSgbdSet
Resource3=IDD_SGBD_FORM

[CLS:CSgbdApp]
Type=0
HeaderFile=sgbd.h
ImplementationFile=sgbd.cpp
Filter=N

[CLS:CSgbdDoc]
Type=0
HeaderFile=sgbddoc.h
ImplementationFile=sgbddoc.cpp
Filter=N

[CLS:CSgbdView]
Type=0
HeaderFile=sgbdview.h
ImplementationFile=sgbdview.cpp
Filter=D

[CLS:CSgbdSet]
Type=0
HeaderFile=sgbdset.h
ImplementationFile=sgbdset.cpp
Filter=D

[DB:CSgbdSet]
DB=1
ColumnCount=14
Column1=N°,4,4,1
Column2=Nom,1,50,1
Column3=Prénom,1,50,1
Column4=Adresse 1,1,50,1
Column5=Adresse 2,1,50,1
Column6=Adresse 3,1,50,1
Column7=Code Pays,1,4,1
Column8=Téléphone,1,20,1
Column9=Nb réponses,-6,1,1
Column10=A répondre,-7,1,0
Column11=Attributs,1,50,1
Column12=Commentaire,-1,128000000,1
Column13=Profession,1,50,1
Column14=Nom document,1,50,1


[CLS:CMainFrame]
Type=0
HeaderFile=mainfrm.h
ImplementationFile=mainfrm.cpp
Filter=T

[CLS:CAboutDlg]
Type=0
HeaderFile=sgbd.cpp
ImplementationFile=sgbd.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Class=CAboutDlg

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command10=ID_FILE_MRU_FILE1
Command11=ID_APP_EXIT
Command12=ID_EDIT_UNDO
Command13=ID_EDIT_CUT
Command14=ID_EDIT_COPY
Command15=ID_EDIT_PASTE
Command20=ID_RECORD_FIRST
Command21=ID_RECORD_PREV
Command22=ID_RECORD_NEXT
Command23=ID_RECORD_LAST
Command24=ID_VIEW_TOOLBAR
Command25=ID_VIEW_STATUS_BAR
Command28=ID_APP_ABOUT
CommandCount=28

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
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
CommandCount=17

[DLG:IDD_SGBD_FORM]
Type=1
Class=CSgbdView
ControlCount=5
Control1=IDC_EDIT1,edit,1350631552
Control2=IDC_STATIC,static,1342308352
Control3=IDC_EDIT2,edit,1350631552
Control4=IDC_STATIC,static,1342308352
Control5=IDC_BUTTON1,button,1342242817

