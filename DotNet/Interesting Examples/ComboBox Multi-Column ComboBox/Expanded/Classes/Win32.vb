Option Strict On
Option Explicit On 
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
Imports System.ComponentModel
Imports System.Runtime.InteropServices
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


Namespace Win32
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Enumerations"

	'Custom Draw Return Flags
	Public Enum CustomDrawReturnFlags
		cdrfDoDefault = &H0
		cdrfNewFont = &H2
		cdrfSkipDefault = &H4
		cdrfNotifyPostPaint = &H10
		cdrfNotifyItemDraw = &H20
		cdrfNotifySubItemDraw = &H20
		cdrfNotifyPostErase = &H40
	End Enum

	'Custom Draw State Flags
	Public Enum CustomDrawStateFlags
		cddsPrePaint = &H1
		cddsPostPaint = &H2
		cddsPreErase = &H3
		cddsPostErase = &H4
		cddsItem = &H10000
		cddsItemPrePaint = (Win32.CustomDrawStateFlags.cddsItem Or Win32.CustomDrawStateFlags.cddsPrePaint)
		cddsItemPostPaint = (Win32.CustomDrawStateFlags.cddsItem Or Win32.CustomDrawStateFlags.cddsPostPaint)
		cddsItemPreErase = (Win32.CustomDrawStateFlags.cddsItem Or Win32.CustomDrawStateFlags.cddsPreErase)
		cddsItemPostErase = (Win32.CustomDrawStateFlags.cddsItem Or Win32.CustomDrawStateFlags.cddsPostErase)
		cddsSubItem = &H20000
	End Enum

	Public Enum DeviceChangeMessages
		dbtDeviceArrival = &H8000&
		dbtDeviceRemoveComplete = &H8004&
	End Enum

	'Mouse Activation Enumeration
	Public Enum MouseActivations
		maActivate = 1
		maActivateAndEat = 2
		maNoActivate = 3
		maNoActivateAndEat = 4
	End Enum

	'Notification Messages
	Public Enum NotificationMessages
		nmFirst = 0
		nmCustomDraw = (Win32.NotificationMessages.nmFirst - 12)
		nmNCHitTest = (Win32.NotificationMessages.nmFirst - 14)
	End Enum

	'Redraw Window Enumeration
	Public Enum RedrawWindowMessages
		rdwAllChildren = &H80		  'Includes child windows, if any, in the repainting operation.
		rdwErase = &H4		  'Causes the window to receive a WM_ERASEBKGND message, RDW_INVALIDATE flag must also be specified; otherwise, RDW_ERASE has no effect.
		rdwEraseNow = &H200		  'Causes the affected windows (as specified by the RDW_ALLCHILDREN and RDW_NOCHILDREN flags) to receive WM_NCPAINT and WM_ERASEBKGND messages, if necessary, before the function returns. WM_PAINT messages are received at the ordinary time.
		rdwFrame = &H400		  'Causes any part of the NonClient Area of the window to receive a WM_NCPAINT message. The RDW_INVALIDATE flag must also be specified.
		rdwInternalPaint = &H2		  'Causes a WM_PAINT message to be posted to the window regardless of whether any portion of the window is invalid.
		rdwUpdateNow = &H100		  'Causes the affected windows (as specified by the RDW_ALLCHILDREN and RDW_NOCHILDREN flags) to receive WM_NCPAINT, WM_ERASEBKGND, and WM_PAINT messages, if necessary, before the function returns.
		rdwInvalidate = &H1		  'Invalidates lprcUpdate or hrgnUpdate (only one may be non-NULL). If both are NULL, the entire window is invalidated.

		'The following flags are used to validate the window:
		rdwNoChildren = &H40		  'Excludes child windows, if any, from the repainting operation.
		rdwNoErase = &H20		  'Suppresses any pending WM_ERASEBKGND messages.
		rdwNoFrame = &H800		  'Suppresses any pending WM_NCPAINT messages. This flag must be used with RDW_VALIDATE and is typically used with RDW_NOCHILDREN.  RDW_NOFRAME should be used with care, as it could cause parts of a window to be painted improperly.
		rdwNoInternalPaint = &H10		  'Suppresses any pending internal WM_PAINT messages. This flag does not affect WM_PAINT messages resulting from a non-NULL update area.
		rdwValidate = &H8		  'Validates lprcUpdate or hrgnUpdate (only one may be non-NULL). If both are NULL, the entire window is validated. This flag does not affect internal WM_PAINT messages.
	End Enum

	'Reflected Messages
	Public Enum ReflectedMessages
		ocmBase = (Win32.WindowMessages.wmUser + &H1C00)
		ocmCommand = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCommand)
		ocmCTLColorButton = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCTLColorButton)
		ocmCTLColorEdit = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCTLColorEdit)
		ocmCTLColorDialog = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCTLColorDialog)
		ocmCTLColorListBox = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCTLColorListBox)
		ocmCTLColorMsgBox = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCTLColorMsgBox)
		ocmCTLColorScrollbar = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCTLColorScrollbar)
		ocmCTLColorStatic = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCTLColorStatic)
		ocmCTLColor = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCTLColor)
		ocmDrawItem = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmDrawItem)
		ocmMeasureItem = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmMeasureItem)
		ocmDeleteItem = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmDeleteItem)
		ocmVKeyToItem = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmVKeyToItem)
		ocmCharToItem = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCharToItem)
		ocmCompareItem = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmCompareItem)
		ocmHScroll = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmHScroll)
		ocmVScroll = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmVScroll)
		ocmParentNotify = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmParentNotify)
		ocmNotify = (Win32.ReflectedMessages.ocmBase + Win32.WindowMessages.wmNotify)
	End Enum

	'Windows Messages Enumeration
	Public Enum WindowMessages
		wmSelectNow = (WindowMessages.wmUser + 100)
		wmNull = &H0
		wmCreate = &H1
		wmDestroy = &H2
		wmMove = &H3
		wmSize = &H5
		wmActivate = &H6
		wmSetFocus = &H7
		wmKillFocus = &H8
		wmEnable = &HA
		wmSetReDraw = &HB
		wmSetText = &HC
		wmGetText = &HD
		wmGetTextLength = &HE
		wmPaint = &HF
		wmClose = &H10
		wmQueryEndSession = &H11
		wmQuit = &H12
		wmQueryOpen = &H13
		wmEraseBackground = &H14
		wmSysColorChange = &H15
		wmEndSession = &H16
		wmShowWindow = &H18
		wmWinINIChange = &H1A
		wmSettingChanged = &H1A
		wmDevModeChanged = &H1B
		wmActivateApp = &H1C
		wmFontChange = &H1D
		wmTimeChange = &H1E
		wmCancelMode = &H1F
		wmSetCursor = &H20
		wmMouseActivate = &H21
		wmChildActivate = &H22
		wmQueueSync = &H23
		wmGetMinMaxInfo = &H24
		wmIconPaint = &H26
		wmIconEraseBackground = &H27
		wmNextDialogControl = &H28
		wmSpoolerStatus = &H2A
		wmDrawItem = &H2B
		wmMeasureItem = &H2C
		wmDeleteItem = &H2D
		wmVKeyToItem = &H2E
		wmCharToItem = &H2F
		wmSetFont = &H30
		wmGetFont = &H31
		wmSetHotKey = &H32
		wmGetHotKey = &H33
		wmQueryDragIcon = &H37
		wmCompareItem = &H39
		wmGetObject = &H3D
		wmCompacting = &H41
		wmCommNotify = &H44
		wmWindowPosChanging = &H46
		wmWindowPosChanged = &H47
		wmPower = &H48
		wmCopyData = &H4A
		wmCancelJournal = &H4B
		wmNotify = &H4E
		wmInputLangChangeRequest = &H50
		wmInputLangChange = &H51
		wmTCard = &H52
		wmHelp = &H53
		wmUserChanged = &H54
		wmNotifyFormat = &H55
		wmContextMenu = &H7B
		wmStyleChanging = &H7C
		wmStyleChanged = &H7D
		wmDisplayChanged = &H7E
		wmGetIcon = &H7F
		wmSetIcon = &H80
		wmNCCreate = &H81
		wmNCDestroy = &H82
		wmNCCalcSize = &H83
		wmNCHitTest = &H84
		wmNCPaint = &H85
		wmNCActivate = &H86
		wmGetDialogCode = &H87
		wmSyncPaint = &H88
		wmNCMouseMove = &HA0
		wmNCLButtonDown = &HA1
		wmNCLButtonUp = &HA2
		wmNCLButtonDBLClick = &HA3
		wmNCRButtonDown = &HA4
		wmNCRButtonUp = &HA5
		wmNCRButtonDBLClick = &HA6
		wmNCMButtonDown = &HA7
		wmNCMButtonUp = &HA8
		wmNCMButtonDBLClick = &HA9
		wmKeyDown = &H100
		wmKeyUp = &H101
		wmChar = &H102
		wmDeadChar = &H103
		wmSysKeyDown = &H104
		wmSysKeyUp = &H105
		wmSysChar = &H106
		wmSysDeadChar = &H107
		wmKeyLast = &H108
		wmIME_StartComposition = &H10D
		wmIME_EndComposition = &H10E
		wmIME_Composition = &H10F
		wmIME_KeyLast = &H10F
		wmInitDialog = &H110
		wmCommand = &H111
		wmSysCommand = &H112
		wmTimer = &H113
		wmHScroll = &H114
		wmVScroll = &H115
		wmInitMenu = &H116
		wmInitMenuPopup = &H117
		wmMenuSelect = &H11F
		wmMenuChar = &H120
		wmEnterIdle = &H121
		wmMenuRButtonUp = &H122
		wmMenuDrag = &H123
		wmMenuGetObject = &H124
		wmUnInitMenuPopUp = &H125
		wmMenuCommand = &H126
		wmCTLColor = &H19
		wmCTLColorMsgBox = &H132
		wmCTLColorEdit = &H133
		wmCTLColorListBox = &H134
		wmCTLColorButton = &H135
		wmCTLColorDialog = &H136
		wmCTLColorScrollbar = &H137
		wmCTLColorStatic = &H138
		wmDialogNotify = (WindowMessages.wmUser + 20)
		wmMouseMove = &H200
		wmLButtonDown = &H201
		wmLButtonUp = &H202
		wmLButtonDBLClick = &H203
		wmRButtonDown = &H204
		wmRButtonUp = &H205
		wmRButtonDBLClick = &H206
		wmMButtonDown = &H207
		wmMButtonUp = &H208
		wmMButtonDBLClick = &H209
		wmMouseWheel = &H20A
		wmParentNotify = &H210
		wmEnterMenuLoop = &H211
		wmExitMenuLoop = &H212
		wmNextMenu = &H213
		wmSizing = &H214
		wmCaptureChanged = &H215
		wmMoving = &H216
		wmDeviceChanged = &H219
		wmMDICreate = &H220
		wmMDIDestroy = &H221
		wmMDIActivate = &H222
		wmMDIRestore = &H223
		wmMDINext = &H224
		wmMDIMaximize = &H225
		wmMDITile = &H226
		wmMDICascade = &H227
		wmMDIIconArrange = &H228
		wmMDIGetActive = &H229
		wmMDISetMenu = &H230
		wmEnterSizeMove = &H231
		wmExitSizeMove = &H232
		wmDropFiles = &H233
		wmMDIRefreshMenu = &H234
		wmIME_SetContext = &H281
		wmIME_Notify = &H282
		wmIME_Control = &H283
		wmIME_CompositionFull = &H284
		wmIME_Select = &H285
		wmIME_Char = &H286
		wmIME_Request = &H288
		wmIME_KeyDown = &H290
		wmIME_KeyUp = &H291
		wmMouseHover = &H2A1
		wmMouseLeave = &H2A3
		wmCut = &H300
		wmCopy = &H301
		wmPaste = &H302
		wmClear = &H303
		wmUndo = &H304
		wmRenderFormat = &H305
		wmRenderAllFormats = &H306
		wmDestroyClipboard = &H307
		wmDrawClipboard = &H308
		wmPaintClipboard = &H309
		wmVScrollClipboard = &H30A
		wmSizeClipboard = &H30B
		wmAskCBFormatName = &H30C
		wmChangeCBChain = &H30D
		wmHScrollClipboard = &H30E
		wmQueryNewPalette = &H30F
		wmPaletteIsChanging = &H310
		wmPaletteChanged = &H311
		wmHotKey = &H312
		wmPrint = &H317
		wmPrintClient = &H318
		wmHandHeldFirst = &H358
		wmHandHeldLast = &H35F
		wmAFXFirst = &H360
		wmAFXLast = &H37F
		wmPenWinFirst = &H380
		wmPenWinLast = &H38F
		wmApp = &H8000
		wmUser = &H400
	End Enum

	'Window Placement Modes
	Public Enum WindowPositionModes
		hwndBottom = 1
		hwndNoTopMost = -2
		hwndTop = 0
		hwndTopMost = -1
	End Enum

	'Window Properties Enum
	Public Enum WindowProperties
		gwlExStyle = (-20)
		gwlHInstance = (-6)
		gwlParentHandle = (-8)
		gwlID = (-12)
		gwlStyle = (-16)
		gwlUserData = (-21)
		gwlWndProc = (-4)
	End Enum

	'Window Size Modes
	Public Enum WindowSizeModes
		swpDrawFrame = &H20
		swpFrameChanged = &H20
		swpHideWindow = &H80
		swpNoActivate = &H10
		swpNoCopyBits = &H100
		swpNoMove = &H2
		swpNoOwnerZOrder = &H200
		swpNoRedraw = &H8
		swpNoReposition = &H200
		swpNoSendChanging = &H400
		swpNoSize = &H1
		swpNoZOrder = &H4
		swpShowWindow = &H40
	End Enum

	'Window Show Modes
	Public Enum WindowShowModes
		swHide = 0
		swMaximize = 3
		swMinimize = 6
		swRestore = 9
		swShow = 5
		swShowDefault = 10
		swShowMaximized = 3
		swShowMinimized = 2
		swShowMinNoActive = 7
		swShowNA = 8
		swShowNoActivate = 4
		swShowNormal = 1
	End Enum

	'Window Style Enumeration
	Public Enum WindowStyles
		wsActiveCaption = &H1
		wsBorder = &H800000
		wsCaption = &HC00000
		wsChild = &H40000000
		wsClipChildren = &H2000000
		wsClipSiblings = &H4000000
		wsDisabled = &H8000000
		wsDialogFrame = &H400000
		wsGroup = &H20000
		wsGT = (WindowStyles.wsGroup Or WindowStyles.wsTabStop)
		wsHScroll = &H100000
		wsMaximize = &H1000000
		wsMaximizeBox = &H10000
		wsMinimize = &H20000000
		wsMinimizeBox = &H20000
		wsOverLapped = &H0
		wsOverLappedWindow = (WindowStyles.wsOverLapped Or WindowStyles.wsCaption Or WindowStyles.wsSysMenu Or WindowStyles.wsThickFrame Or WindowStyles.wsMinimizeBox Or WindowStyles.wsMaximizeBox)
		wsPopUp = &H80000000
		wsPopUpWindow = (WindowStyles.wsPopUp Or WindowStyles.wsBorder Or WindowStyles.wsSysMenu)
		wsSizeBox = WindowStyles.wsThickFrame
		wsSysMenu = &H80000
		wsTabStop = &H10000
		wsThickFrame = &H40000
		wsTiled = WindowStyles.wsOverLapped
		wsTiledWindow = WindowStyles.wsOverLappedWindow
		wsVisible = &H10000000
		wsVScroll = &H200000
	End Enum

	'Window Style Ex Enumerations
	Public Enum WindowStylesEx
		wsDialogModalFrame = &H1
		wsNoParentNotify = &H4
		wsTopMost = &H8
		wsAcceptFiles = &H10
		wsTransparent = &H20
		wsMDIChild = &H40
		wsToolWindow = &H80
		wsWindowEdge = &H100
		wsClientEdge = &H200
		wsContextHelp = &H400
		wsRight = &H1000
		wsLeft = &H0
		wsRTLReading = &H2000
		wsLTRReading = &H0
		wsScrollbarLeft = &H4000
		wsScrollbarRight = &H0
		wsControlParent = &H10000
		wsStaticEdge = &H20000
		wsAppWindow = &H40000
		wsOverlappedWindow = &H300
		wsPaletteWindow = &H188
		wsLayered = &H80000
	End Enum

	'Windows System Commands
	Public Enum SystemCommands
		scRestore = &HF120
		scClose = &HF060
		scMaximize = &HF030
		scMinimize = &HF020
	End Enum

#End Region
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "WIN32 Structures"

	'MinMax Info Structure
	<StructLayout(LayoutKind.Sequential)> _
	Public Structure MINMAXINFO
		Dim Reserved As Win32.POINTAPI
		Dim MaxSize As Win32.POINTAPI
		Dim MaxPosition As Win32.POINTAPI
		Dim MinTrackSize As Win32.POINTAPI
		Dim MaxTrackSize As Win32.POINTAPI
	End Structure

	'Paint Structure
	Public Structure PAINTSTRUCT
		Dim hDC As IntPtr
		Dim iErase As Integer
		Dim rcPaint As Win32.RECT
		Dim iRestore As Integer
		Dim IncUpdate As Integer
		<MarshalAs(UnmanagedType.ByValArray, SizeConst:=32)> Dim rgbReserved As Byte()

		Public Overrides Function ToString() As String
			Dim sValue As String = String.Format("hdc = {0} , fErase = {1}, rcPaint = {2}, fRestore = {3}, fIncUpdate = {4}", hDC, iErase, rcPaint.ToString(), iRestore, IncUpdate)
			Return sValue
		End Function
	End Structure

	'Point Structure
	<StructLayout(LayoutKind.Sequential)> _
	Public Structure POINTAPI
		Dim x As Integer
		Dim y As Integer
	End Structure

	'Rectangle Structure
	<StructLayout(LayoutKind.Sequential)> _
	Public Structure RECT
		Dim Left As Integer
		Dim Top As Integer
		Dim Right As Integer
		Dim Bottom As Integer
	End Structure

#End Region
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'Message Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public Class Message
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Shared Methods"

		'Function to Get a Point from an LParam
		Shared Function GetPointFromLParam(ByVal LParam As IntPtr) As Point
			Dim xPos As Integer = (LParam.ToInt32 And &HFFFF)
			Dim yPos As Integer = CType((LParam.ToInt32 / (2 ^ 16)), Integer)
			Return New Point(xPos, yPos)
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'Window Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public Class Window
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

		'API Declarations
		Private Declare Auto Function GetClientRect Lib "user32.dll" (ByVal hWnd As IntPtr, ByRef Rect As Win32.RECT) As Integer
		Private Declare Auto Function GetDesktopWindow Lib "user32.dll" () As Integer
		Private Declare Auto Function GetDlgItem Lib "user32.dll" (ByVal hDialog As IntPtr, ByVal ControlID As Integer) As IntPtr
		Private Declare Ansi Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" (ByVal hWnd As IntPtr, ByVal Index As Integer) As Integer
		Private Declare Auto Function InvalidateRect Lib "user32.dll" (ByVal hWnd As IntPtr, ByRef pRect As Win32.RECT, ByVal [Erase] As Integer) As Integer
		Private Declare Auto Function InvalidateRectPointer Lib "user32.dll" Alias "InvalidateRect" (ByVal hWnd As IntPtr, ByRef pRect As IntPtr, ByVal [Erase] As Integer) As Integer
		Private Declare Auto Function MoveWindow Lib "user32.dll" (ByVal hWnd As IntPtr, ByVal x As Long, ByVal y As Long, ByVal Width As Integer, ByVal Height As Integer, ByVal bRepaint As Integer) As Integer
		Private Declare Auto Function RedrawWindow Lib "user32.dll" (ByVal Handle As IntPtr, ByRef UpdateRect As Win32.RECT, ByVal RgnUpdate As Integer, ByVal fuRedraw As Integer) As Integer
		Private Declare Auto Function RedrawWindow Lib "user32.dll" (ByVal Handle As IntPtr, ByRef UpdateRect As Integer, ByVal RgnUpdate As Integer, ByVal fuRedraw As Integer) As Integer
		Private Declare Auto Function SetParentWindow Lib "user32.dll" Alias "SetParent" (ByVal hWndChild As IntPtr, ByVal hWndParent As IntPtr) As Integer
		Private Declare Ansi Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal hWnd As IntPtr, ByVal Index As Integer, ByVal NewValue As Integer) As Integer
		Private Declare Auto Function SetWindowPos Lib "user32.dll" (ByVal hWnd As IntPtr, ByVal hWndInsertAfter As Integer, ByVal x As Integer, ByVal y As Integer, ByVal cx As Integer, ByVal cy As Integer, ByVal wFlags As Integer) As Integer
		Private Declare Auto Function ShowWindow Lib "user32.dll" Alias "ShowWindow" (ByVal hWnd As IntPtr, ByVal CmdShow As Integer) As Integer

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Shared Properties"

		'Property for the Desktop Window
		Shared ReadOnly Property DesktopWindow() As IntPtr
			Get
				Return New IntPtr(Window.GetDesktopWindow())
			End Get
		End Property

		'Property for the WIndow's Properties
		Shared Property PropertyValue(ByVal Handle As IntPtr, ByVal PropType As Win32.WindowProperties) As Integer
			Get
				Return Window.GetWindowLong(Handle, PropType)
			End Get
			Set(ByVal Value As Integer)
				Call Window.SetWindowLong(Handle, PropType, Value)
			End Set
		End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Shared Methods"

		'Function to Convert a Rectangle to a RECT Structure
		Shared Function ConvertRectangleToRECT(ByVal Rect As Rectangle) As Win32.RECT
			Dim pRect As Win32.RECT

			With pRect
				.Left = Rect.Left : .Top = Rect.Top
				.Right = (Rect.Left + Rect.Width) : .Bottom = (Rect.Top + Rect.Height)
			End With
		End Function

		'Function to Convert a Rectangle to a RECT Structure
		Shared Function ConvertRECTtoRectangle(ByVal Rect As Win32.RECT) As Rectangle
			Return New Rectangle(Rect.Left, Rect.Top, Rect.Right - Rect.Left, Rect.Bottom - Rect.Top)
		End Function

		'Function to Get a Client Rectangle
		Shared Function GetClientRectangle(ByVal Handle As IntPtr) As Rectangle
			Dim vRect As New Win32.RECT()
			Call Win32.Window.GetClientRect(Handle, vRect)
			Return Win32.Window.ConvertRECTtoRectangle(vRect)
			vRect = Nothing
		End Function

		'Function to Get the Dialog Handle of a Window
		Shared Function GetDialogItem(ByVal Dialog As IntPtr, ByVal ControlID As Integer) As IntPtr
			Return Win32.Window.GetDlgItem(Dialog, ControlID)
		End Function

		'Routine to Invalidate a Rectangle
		Shared Sub InvalidateRectangle(ByVal Handle As IntPtr, ByRef Rect As Rectangle, ByVal [Erase] As Boolean)
			Dim vRect As Win32.RECT = Win32.Window.ConvertRectangleToRECT(Rect)
			Call Win32.Window.InvalidateRect(Handle, vRect, Math.Abs(CType([Erase], Integer)))
			vRect = Nothing
		End Sub

		'Routine to Invalidate a Rectangle
		Shared Sub InvalidateRectangle(ByVal Handle As IntPtr, ByRef Rect As IntPtr, ByVal [Erase] As Boolean)
			Call Win32.Window.InvalidateRectPointer(Handle, Rect, CType([Erase], Integer))
		End Sub

		'Routine to Move the Window
		Shared Sub Move(ByVal Handle As IntPtr, ByVal x As Integer, ByVal y As Integer, ByVal Width As Integer, ByVal Height As Integer, ByVal Repaint As Boolean)
			Call Window.MoveWindow(Handle, x, y, Width, Height, Math.Abs(CInt(Repaint)))
		End Sub

		'Routine to Position the Window
		Shared Sub Position(ByVal Handle As IntPtr, ByVal PositionMode As Win32.WindowPositionModes, ByVal x As Integer, ByVal y As Integer, ByVal cx As Integer, ByVal cy As Integer, ByVal SizeMode As Win32.WindowSizeModes)
			Call Window.SetWindowPos(Handle, PositionMode, x, y, cx, cy, SizeMode)
		End Sub

		'Routine to Redraw the Window
		Shared Sub ReDraw(ByVal Handle As IntPtr, ByVal RedrawMode As Win32.RedrawWindowMessages)
			Call Win32.Window.RedrawWindow(Handle, 0, 0, RedrawMode)
		End Sub

		'Routine to Redraw the Window
		Shared Sub ReDraw(ByVal Handle As IntPtr, ByVal DrawRect As Rectangle, ByVal RedrawMode As Win32.RedrawWindowMessages)
			Dim vRect As Win32.RECT = Win32.Window.ConvertRectangleToRECT(DrawRect)
			Call Win32.Window.RedrawWindow(Handle, vRect, 0, RedrawMode)
		End Sub

		'Routine to Set the Parent
		Shared Sub SetParent(ByVal Handle As IntPtr, ByVal ParentHandle As IntPtr)
			Call Window.SetParentWindow(Handle, ParentHandle)
		End Sub

		'Routine to Show a Window
		Shared Sub Show(ByVal Handle As IntPtr, ByVal ShowMode As Win32.WindowShowModes)
			Call Window.ShowWindow(Handle, ShowMode)
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
End Namespace
