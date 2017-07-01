Attribute VB_Name = "Messages"
Option Explicit
DefInt A-Z

Global Const HTCAPTION = 2

Global Const WM_USER = &H400

Public Const LB_CTLCODE = 0&

' Listbox Return Values
Public Const LB_OKAY = 0
Public Const LB_ERR = (-1)
Public Const LB_ERRSPACE = (-2)

' The idStaticPath parameter to DlgDirList can have the following values
' ORed if the list box should show other details of the files along with
' the name of the files;
' all other details also will be returned

' Listbox Notification Codes
Public Const LBN_ERRSPACE = (-2)
Public Const LBN_SELCHANGE = 1
Public Const LBN_DBLCLK = 2
Public Const LBN_SELCANCEL = 3
Public Const LBN_SETFOCUS = 4
Public Const LBN_KILLFOCUS = 5
' Listbox messages
Public Const LB_ADDSTRING = &H180
Public Const LB_INSERTSTRING = &H181
Public Const LB_DELETESTRING = &H182
Public Const LB_SELITEMRANGEEX = &H183
Public Const LB_RESETCONTENT = &H184
Public Const LB_SETSEL = &H185
Public Const LB_SETCURSEL = &H186
Public Const LB_GETSEL = &H187
Public Const LB_GETCURSEL = &H188
Public Const LB_GETTEXT = &H189
Public Const LB_GETTEXTLEN = &H18A
Public Const LB_GETCOUNT = &H18B
Public Const LB_SELECTSTRING = &H18C
Public Const LB_DIR = &H18D
Public Const LB_GETTOPINDEX = &H18E
Public Const LB_FINDSTRING = &H18F
Public Const LB_GETSELCOUNT = &H190
Public Const LB_GETSELITEMS = &H191
Public Const LB_SETTABSTOPS = &H192
Public Const LB_GETHORIZONTALEXTENT = &H193
Public Const LB_SETHORIZONTALEXTENT = &H194
Public Const LB_SETCOLUMNWIDTH = &H195
Public Const LB_ADDFILE = &H196
Public Const LB_SETTOPINDEX = &H197
Public Const LB_GETITEMRECT = &H198
Public Const LB_GETITEMDATA = &H199
Public Const LB_SETITEMDATA = &H19A
Public Const LB_SELITEMRANGE = &H19B
Public Const LB_SETANCHORINDEX = &H19C
Public Const LB_GETANCHORINDEX = &H19D
Public Const LB_SETCARETINDEX = &H19E
Public Const LB_GETCARETINDEX = &H19F
Public Const LB_SETITEMHEIGHT = &H1A0
Public Const LB_GETITEMHEIGHT = &H1A1
Public Const LB_FINDSTRINGEXACT = &H1A2
Public Const LB_SETLOCALE = &H1A5
Public Const LB_GETLOCALE = &H1A6
Public Const LB_SETCOUNT = &H1A7
Public Const LB_MSGMAX = &H1A8
'=======Listbox styles======
Public Const LBS_DISABLENOSCROLL = &H1000&
Public Const LBS_EXTENDEDSEL = &H800&
Public Const LBS_HASSTRINGS = &H40&
Public Const LBS_MULTICOLUMN = &H200&
Public Const LBS_MULTIPLESEL = &H8&
Public Const LBS_NODATA = &H2000&
Public Const LBS_NOINTEGRALHEIGHT = &H100&
Public Const LBS_NOREDRAW = &H4&
Public Const LBS_NOTIFY = &H1&
Public Const LBS_OWNERDRAWFIXED = &H10&
Public Const LBS_OWNERDRAWVARIABLE = &H20&
Public Const LBS_SORT = &H2&
'Public Const LBS_STANDARD = (LBS_NOTIFY Or LBS_SORT Or WS_VSCROLL Or WS_BORDER)
Public Const LBS_USETABSTOPS = &H80&
Public Const LBS_WANTKEYBOARDINPUT = &H400&

' Class field offsets for GetClassLong() and GetClassWord()
Public Const GCL_MENUNAME = (-8)
Public Const GCL_HBRBACKGROUND = (-10)
Public Const GCL_HCURSOR = (-12)
Public Const GCL_HICON = (-14)
Public Const GCL_HMODULE = (-16)
Public Const GCL_CBWNDEXTRA = (-18)
Public Const GCL_CBCLSEXTRA = (-20)
Public Const GCL_WNDPROC = (-24)
Public Const GCL_STYLE = (-26)
Public Const GCW_ATOM = (-32)

' Window Messages
Public Const WM_NULL = &H0
Public Const WM_CREATE = &H1
Public Const WM_DESTROY = &H2
Public Const WM_MOVE = &H3
Public Const WM_SIZE = &H5

Public Const WM_ACTIVATE = &H6
'
'  WM_ACTIVATE state values

Public Const WA_INACTIVE = 0
Public Const WA_ACTIVE = 1
Public Const WA_CLICKACTIVE = 2

Public Const WM_SETFOCUS = &H7
Public Const WM_KILLFOCUS = &H8
Public Const WM_ENABLE = &HA
Public Const WM_SETREDRAW = &HB
Public Const WM_SETTEXT = &HC
Public Const WM_GETTEXT = &HD
Public Const WM_GETTEXTLENGTH = &HE
Public Const WM_PAINT = &HF
Public Const WM_CLOSE = &H10
Public Const WM_QUERYENDSESSION = &H11
Public Const WM_QUIT = &H12
Public Const WM_QUERYOPEN = &H13
Public Const WM_ERASEBKGND = &H14
Public Const WM_SYSCOLORCHANGE = &H15
Public Const WM_ENDSESSION = &H16
Public Const WM_SHOWWINDOW = &H18
Public Const WM_WININICHANGE = &H1A
Public Const WM_DEVMODECHANGE = &H1B
Public Const WM_ACTIVATEAPP = &H1C
Public Const WM_FONTCHANGE = &H1D
Public Const WM_TIMECHANGE = &H1E
Public Const WM_CANCELMODE = &H1F
Public Const WM_SETCURSOR = &H20
Public Const WM_MOUSEACTIVATE = &H21
Public Const WM_CHILDACTIVATE = &H22
Public Const WM_QUEUESYNC = &H23

Public Const WM_GETMINMAXINFO = &H24

Type MINMAXINFO
        ptReserved As POINTAPI
        ptMaxSize As POINTAPI
        ptMaxPosition As POINTAPI
        ptMinTrackSize As POINTAPI
        ptMaxTrackSize As POINTAPI
End Type

Public Const WM_PAINTICON = &H26
Public Const WM_ICONERASEBKGND = &H27
Public Const WM_NEXTDLGCTL = &H28
Public Const WM_SPOOLERSTATUS = &H2A
Public Const WM_DRAWITEM = &H2B
Public Const WM_MEASUREITEM = &H2C
Public Const WM_DELETEITEM = &H2D
Public Const WM_VKEYTOITEM = &H2E
Public Const WM_CHARTOITEM = &H2F
Public Const WM_SETFONT = &H30
Public Const WM_GETFONT = &H31
Public Const WM_SETHOTKEY = &H32
Public Const WM_GETHOTKEY = &H33
Public Const WM_QUERYDRAGICON = &H37
Public Const WM_COMPAREITEM = &H39
Public Const WM_COMPACTING = &H41
Public Const WM_OTHERWINDOWCREATED = &H42               '  no longer suported
Public Const WM_OTHERWINDOWDESTROYED = &H43             '  no longer suported
Public Const WM_COMMNOTIFY = &H44                       '  no longer suported

' notifications passed in low word of lParam on WM_COMMNOTIFY messages
Public Const CN_RECEIVE = &H1
Public Const CN_TRANSMIT = &H2
Public Const CN_EVENT = &H4

Public Const WM_WINDOWPOSCHANGING = &H46
Public Const WM_WINDOWPOSCHANGED = &H47

Public Const WM_POWER = &H48
'
'  wParam for WM_POWER window message and DRV_POWER driver notification

Public Const PWR_OK = 1
Public Const PWR_FAIL = (-1)
Public Const PWR_SUSPENDREQUEST = 1
Public Const PWR_SUSPENDRESUME = 2
Public Const PWR_CRITICALRESUME = 3

Public Const WM_COPYDATA = &H4A
Public Const WM_CANCELJOURNAL = &H4B

Type COPYDATASTRUCT
        dwData As Long
        cbData As Long
        lpData As Long
End Type

Public Const WM_NCCREATE = &H81
Public Const WM_NCDESTROY = &H82
Public Const WM_NCCALCSIZE = &H83
Public Const WM_NCHITTEST = &H84
Public Const WM_NCPAINT = &H85
Public Const WM_NCACTIVATE = &H86
Public Const WM_GETDLGCODE = &H87
Public Const WM_NCMOUSEMOVE = &HA0
Public Const WM_NCLBUTTONDOWN = &HA1
Public Const WM_NCLBUTTONUP = &HA2
Public Const WM_NCLBUTTONDBLCLK = &HA3
Public Const WM_NCRBUTTONDOWN = &HA4
Public Const WM_NCRBUTTONUP = &HA5
Public Const WM_NCRBUTTONDBLCLK = &HA6
Public Const WM_NCMBUTTONDOWN = &HA7
Public Const WM_NCMBUTTONUP = &HA8
Public Const WM_NCMBUTTONDBLCLK = &HA9

Public Const WM_KEYFIRST = &H100
Public Const WM_KEYDOWN = &H100
Public Const WM_KEYUP = &H101
Public Const WM_CHAR = &H102
Public Const WM_DEADCHAR = &H103
Public Const WM_SYSKEYDOWN = &H104
Public Const WM_SYSKEYUP = &H105
Public Const WM_SYSCHAR = &H106
Public Const WM_SYSDEADCHAR = &H107
Public Const WM_KEYLAST = &H108
Public Const WM_INITDIALOG = &H110
Public Const WM_COMMAND = &H111
Public Const WM_SYSCOMMAND = &H112
Public Const WM_TIMER = &H113
Public Const WM_HSCROLL = &H114
Public Const WM_VSCROLL = &H115
Public Const WM_INITMENU = &H116
Public Const WM_INITMENUPOPUP = &H117
Public Const WM_MENUSELECT = &H11F
Public Const WM_MENUCHAR = &H120
Public Const WM_ENTERIDLE = &H121

Public Const WM_CTLCOLORMSGBOX = &H132
Public Const WM_CTLCOLOREDIT = &H133
Public Const WM_CTLCOLORLISTBOX = &H134
Public Const WM_CTLCOLORBTN = &H135
Public Const WM_CTLCOLORDLG = &H136
Public Const WM_CTLCOLORSCROLLBAR = &H137
Public Const WM_CTLCOLORSTATIC = &H138

Public Const WM_MOUSEFIRST = &H200
Public Const WM_MOUSEMOVE = &H200
Public Const WM_LBUTTONDOWN = &H201
Public Const WM_LBUTTONUP = &H202
Public Const WM_LBUTTONDBLCLK = &H203
Public Const WM_RBUTTONDOWN = &H204
Public Const WM_RBUTTONUP = &H205
Public Const WM_RBUTTONDBLCLK = &H206
Public Const WM_MBUTTONDOWN = &H207
Public Const WM_MBUTTONUP = &H208
Public Const WM_MBUTTONDBLCLK = &H209
Public Const WM_MOUSELAST = &H209

Public Const WM_PARENTNOTIFY = &H210
Public Const WM_ENTERMENULOOP = &H211
Public Const WM_EXITMENULOOP = &H212
Public Const WM_MDICREATE = &H220
Public Const WM_MDIDESTROY = &H221
Public Const WM_MDIACTIVATE = &H222
Public Const WM_MDIRESTORE = &H223
Public Const WM_MDINEXT = &H224
Public Const WM_MDIMAXIMIZE = &H225
Public Const WM_MDITILE = &H226
Public Const WM_MDICASCADE = &H227
Public Const WM_MDIICONARRANGE = &H228
Public Const WM_MDIGETACTIVE = &H229
Public Const WM_MDISETMENU = &H230
Public Const WM_DROPFILES = &H233
Public Const WM_MDIREFRESHMENU = &H234


Public Const WM_CUT = &H300
Public Const WM_COPY = &H301
Public Const WM_PASTE = &H302
Public Const WM_CLEAR = &H303
Public Const WM_UNDO = &H304
Public Const WM_RENDERFORMAT = &H305
Public Const WM_RENDERALLFORMATS = &H306
Public Const WM_DESTROYCLIPBOARD = &H307
Public Const WM_DRAWCLIPBOARD = &H308
Public Const WM_PAINTCLIPBOARD = &H309
Public Const WM_VSCROLLCLIPBOARD = &H30A
Public Const WM_SIZECLIPBOARD = &H30B
Public Const WM_ASKCBFORMATNAME = &H30C
Public Const WM_CHANGECBCHAIN = &H30D
Public Const WM_HSCROLLCLIPBOARD = &H30E
Public Const WM_QUERYNEWPALETTE = &H30F
Public Const WM_PALETTEISCHANGING = &H310
Public Const WM_PALETTECHANGED = &H311
Public Const WM_HOTKEY = &H312

Public Const WM_PENWINFIRST = &H380
Public Const WM_PENWINLAST = &H38F

'====Edit class msgs========
Public Const EM_CANUNDO = &HC6
Public Const EM_EMPTYUNDOBUFFER = &HCD
Public Const EM_FMTLINES = &HC8
Public Const EM_GETFIRSTVISIBLELINE = &HCE
Public Const EM_GETHANDLE = &HBD
Public Const EM_GETLINE = &HC4
Public Const EM_GETLINECOUNT = &HBA
Public Const EM_GETMODIFY = &HB8
Public Const EM_GETPASSWORDCHAR = &HD2
Public Const EM_GETRECT = &HB2
Public Const EM_GETSEL = &HB0
Public Const EM_GETTHUMB = &HBE
Public Const EM_GETWORDBREAKPROC = &HD1
Public Const EM_LIMITTEXT = &HC5
Public Const EM_LINEFROMCHAR = &HC9
Public Const EM_LINEINDEX = &HBB
Public Const EM_LINELENGTH = &HC1
Public Const EM_LINESCROLL = &HB6
Public Const EM_REPLACESEL = &HC2
Public Const EM_SCROLL = &HB5
Public Const EM_SCROLLCARET = &HB7
Public Const EM_SETHANDLE = &HBC
Public Const EM_SETMODIFY = &HB9
Public Const EM_SETPASSWORDCHAR = &HCC
Public Const EM_SETREADONLY = &HCF
Public Const EM_SETRECT = &HB3
Public Const EM_SETRECTNP = &HB4
Public Const EM_SETSEL = &HB1
Public Const EM_SETTABSTOPS = &HCB
Public Const EM_SETWORDBREAKPROC = &HD0
Public Const EM_UNDO = &HC7
Public Const EN_CHANGE = &H300
Public Const EN_ERRSPACE = &H500
Public Const EN_HSCROLL = &H601
Public Const EN_KILLFOCUS = &H200
Public Const EN_MAXTEXT = &H501
Public Const EN_SETFOCUS = &H100
Public Const EN_UPDATE = &H400
Public Const EN_VSCROLL = &H602
'========Edit styles=======
Public Const ES_AUTOHSCROLL = &H80&
Public Const ES_AUTOVSCROLL = &H40&
Public Const ES_CENTER = &H1&
Public Const ES_LEFT = &H0&
Public Const ES_LOWERCASE = &H10&
Public Const ES_MULTILINE = &H4&
Public Const ES_NOHIDESEL = &H100&
Public Const ES_OEMCONVERT = &H400&
Public Const ES_PASSWORD = &H20&
Public Const ES_READONLY = &H800&
Public Const ES_RIGHT = &H2&
Public Const ES_UPPERCASE = &H8&
Public Const ES_WANTRETURN = &H1000&

'========Button msgs=======
Public Const BM_GETCHECK = &HF0
Public Const BM_GETSTATE = &HF2
Public Const BM_SETCHECK = &HF1
Public Const BM_SETSTATE = &HF3
Public Const BM_SETSTYLE = &HF4
Public Const BN_CLICKED = 0
Public Const BN_DISABLE = 4
Public Const BN_DOUBLECLICKED = 5
Public Const BN_HILITE = 2
Public Const BN_PAINT = 1
Public Const BN_UNHILITE = 3
'=====Button styles=====
Public Const BS_3STATE = &H5&
Public Const BS_AUTO3STATE = &H6&
Public Const BS_AUTOCHECKBOX = &H3&
Public Const BS_AUTORADIOBUTTON = &H9&
Public Const BS_CHECKBOX = &H2&
Public Const BS_DEFPUSHBUTTON = &H1&
Public Const BS_DIBPATTERN = 5
Public Const BS_DIBPATTERN8X8 = 8
Public Const BS_DIBPATTERNPT = 6
Public Const BS_GROUPBOX = &H7&
Public Const BS_HATCHED = 2
Public Const BS_NULL = 1
Public Const BS_HOLLOW = BS_NULL
Public Const BS_INDEXED = 4
Public Const BS_LEFTTEXT = &H20&
Public Const BS_OWNERDRAW = &HB&
Public Const BS_PATTERN = 3
Public Const BS_PATTERN8X8 = 7
Public Const BS_PUSHBUTTON = &H0&
Public Const BS_RADIOBUTTON = &H4&
Public Const BS_SOLID = 0
Public Const BS_USERBUTTON = &H8&

'======ComboBox msgs=======
Public Const CB_ADDSTRING = &H143
Public Const CB_DELETESTRING = &H144
Public Const CB_DIR = &H145
Public Const CB_ERR = (-1)
Public Const CB_ERRSPACE = (-2)
Public Const CB_FINDSTRING = &H14C
Public Const CB_FINDSTRINGEXACT = &H158
Public Const CB_GETCOUNT = &H146
Public Const CB_GETCURSEL = &H147
Public Const CB_GETDROPPEDCONTROLRECT = &H152
Public Const CB_GETDROPPEDSTATE = &H157
Public Const CB_GETEDITSEL = &H140
Public Const CB_GETEXTENDEDUI = &H156
Public Const CB_GETITEMDATA = &H150
Public Const CB_GETITEMHEIGHT = &H154
Public Const CB_GETLBTEXT = &H148
Public Const CB_GETLBTEXTLEN = &H149
Public Const CB_GETLOCALE = &H15A
Public Const CB_INSERTSTRING = &H14A
Public Const CB_LIMITTEXT = &H141
Public Const CB_MSGMAX = &H15B
Public Const CB_OKAY = 0
Public Const CB_RESETCONTENT = &H14B
Public Const CB_SELECTSTRING = &H14D
Public Const CB_SETCURSEL = &H14E
Public Const CB_SETEDITSEL = &H142
Public Const CB_SETEXTENDEDUI = &H155
Public Const CB_SETITEMDATA = &H151
Public Const CB_SETITEMHEIGHT = &H153
Public Const CB_SETLOCALE = &H159
Public Const CB_SHOWDROPDOWN = &H14F
'======Combobox styles======
