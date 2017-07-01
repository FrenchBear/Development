VERSION 5.00
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "Subclass.ocx"
Begin VB.UserControl SimulatedMenuResultat 
   Alignable       =   -1  'True
   BackColor       =   &H00E0E0E0&
   ClientHeight    =   1020
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4515
   KeyPreview      =   -1  'True
   ScaleHeight     =   1020
   ScaleWidth      =   4515
   ToolboxBitmap   =   "SimulatedMenuResultat.ctx":0000
   Begin SubclassCtl.Subclass Subclass2 
      Left            =   2100
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.PictureBox picMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   912
      Index           =   0
      Left            =   0
      ScaleHeight     =   915
      ScaleWidth      =   495
      TabIndex        =   1
      Top             =   0
      Width           =   492
      Begin VB.TextBox FocusTrap 
         Height          =   315
         Index           =   0
         Left            =   0
         TabIndex        =   3
         Top             =   480
         Width           =   255
      End
      Begin VB.Label lblMenu 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Menu"
         Height          =   192
         Index           =   0
         Left            =   0
         TabIndex        =   2
         Top             =   0
         Width           =   396
      End
   End
   Begin SubclassCtl.Subclass Subclass1 
      Left            =   1740
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.TextBox FocusTrap0 
      Height          =   315
      Left            =   1740
      TabIndex        =   0
      Top             =   540
      Width           =   255
   End
   Begin VB.Menu s_mnuMenu 
      Caption         =   "&Menu"
      Begin VB.Menu s_mnuForceE4Calc 
         Caption         =   "ForceE4Calc"
      End
      Begin VB.Menu s_mnuForceSave 
         Caption         =   "ForceSave"
      End
      Begin VB.Menu s_mnuSave 
         Caption         =   "Save"
         Shortcut        =   ^S
      End
      Begin VB.Menu s_mnuCancel 
         Caption         =   "Cancel"
      End
      Begin VB.Menu s_mnuSep7 
         Caption         =   "-"
      End
      Begin VB.Menu s_mnuCustCalcul 
         Caption         =   "CustomizeCalcul"
         Shortcut        =   {F3}
      End
      Begin VB.Menu s_mnuUnvalidRR 
         Caption         =   "UnvalidRR"
         Shortcut        =   {F2}
      End
      Begin VB.Menu s_mnuSep6 
         Caption         =   "-"
      End
      Begin VB.Menu s_mnuImportBalValue 
         Caption         =   "ImportBalanceValue"
         Shortcut        =   {F9}
      End
      Begin VB.Menu s_mnuSep5 
         Caption         =   "-"
      End
      Begin VB.Menu s_mnuQuit 
         Caption         =   "&Quit"
         Shortcut        =   ^{F4}
      End
   End
   Begin VB.Menu s_mnuDisplay 
      Caption         =   "&Display"
      Begin VB.Menu s_mnuDisplayVR 
         Caption         =   "&ValidatedResult"
         Checked         =   -1  'True
      End
      Begin VB.Menu s_mnuDisplayRR 
         Caption         =   "&RawResults"
         Checked         =   -1  'True
      End
      Begin VB.Menu s_mnuDisplaySRR 
         Caption         =   "&SubRawResult"
         Checked         =   -1  'True
      End
      Begin VB.Menu s_mnuDisplayCalculated 
         Caption         =   "&Calculated"
         Checked         =   -1  'True
      End
      Begin VB.Menu s_mnuSep2 
         Caption         =   "-"
      End
      Begin VB.Menu s_mnuShowOnlyEmptyLines 
         Caption         =   "ShowOnlyEmptyLines"
      End
      Begin VB.Menu s_mnuShowOnlyData 
         Caption         =   "S&howOnlyData"
      End
      Begin VB.Menu s_mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu s_mnuRefreshAuto 
         Caption         =   "RefreshAuto"
      End
      Begin VB.Menu s_mnuAutoHideSampleList 
         Caption         =   "AutoHide SampleList"
      End
      Begin VB.Menu s_mnuSep4 
         Caption         =   "-"
      End
      Begin VB.Menu s_mnuDisplayEstimate 
         Caption         =   "&Estimate"
         Begin VB.Menu s_mnuEstiAuto 
            Caption         =   "Auto&matique"
            Checked         =   -1  'True
         End
         Begin VB.Menu s_mnuEstiAlways 
            Caption         =   "&Always"
         End
         Begin VB.Menu s_mnuEstiNever 
            Caption         =   "&Never"
         End
      End
      Begin VB.Menu s_mnuDisplaySpecLimit 
         Caption         =   "&SpecLimit"
         WindowList      =   -1  'True
         Begin VB.Menu s_mnuSpecLimAuto 
            Caption         =   "Auto&matique"
            Checked         =   -1  'True
         End
         Begin VB.Menu s_mnuSpecLimAlways 
            Caption         =   "&Always"
         End
         Begin VB.Menu s_mnuSpecLimNever 
            Caption         =   "&Never"
         End
      End
      Begin VB.Menu s_mnuDisplayNorme 
         Caption         =   "&Norme"
         Begin VB.Menu s_mnuNormeAuto 
            Caption         =   "Auto&matique"
            Checked         =   -1  'True
         End
         Begin VB.Menu s_mnuNormeAlways 
            Caption         =   "&Always"
         End
         Begin VB.Menu s_mnuNormeNever 
            Caption         =   "&Never"
         End
      End
      Begin VB.Menu s_mnuInterpretationValue 
         Caption         =   "&InterpretationValue"
         Begin VB.Menu s_mnuIRAuto 
            Caption         =   "Auto&matique"
            Checked         =   -1  'True
         End
         Begin VB.Menu s_mnuIRAlways 
            Caption         =   "&Always"
         End
         Begin VB.Menu s_mnuIRNever 
            Caption         =   "&Never"
         End
      End
      Begin VB.Menu s_mnuAdditional 
         Caption         =   "&Additional"
         Begin VB.Menu s_mnuAdditional10 
            Caption         =   "additional1&0"
         End
         Begin VB.Menu s_mnuAdditional9 
            Caption         =   "additional&9"
         End
         Begin VB.Menu s_mnuAdditional8 
            Caption         =   "additonal&8"
         End
      End
      Begin VB.Menu s_mnuSep3 
         Caption         =   "-"
      End
      Begin VB.Menu s_mnuDisplayLanguage 
         Caption         =   "Choix de la langue"
      End
   End
   Begin VB.Menu s_mnuSampleList 
      Caption         =   "&SampleList"
      Begin VB.Menu s_mnuAddSample 
         Caption         =   "add&Sample"
         Shortcut        =   {F12}
      End
      Begin VB.Menu s_mnuAddBatch 
         Caption         =   "add&Bach"
         Shortcut        =   {F4}
      End
      Begin VB.Menu s_mnuDelSample 
         Caption         =   "DelSample"
      End
      Begin VB.Menu s_mnuDelList 
         Caption         =   "DelSampleLIst"
      End
      Begin VB.Menu s_mnuCopySL 
         Caption         =   "CopySampleList"
      End
      Begin VB.Menu s_mnuPasteSL 
         Caption         =   "PasteSampleList"
      End
      Begin VB.Menu s_mnuCalculateSL 
         Caption         =   "CalculateSL"
      End
      Begin VB.Menu s_mnuBuildSampleList 
         Caption         =   "BuildSampleList"
      End
   End
End
Attribute VB_Name = "SimulatedMenuResultat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' SimulatedMenuResultat for Maestro frmResultat
' Quick-and-dirty simulation of a menubar for a MDIChild window
' 2005-12-10    FPVI
' 2005-12-15    FPVI    Mouse tracking for better visual feed-back

Option Explicit

Private tabMenuHeaders As Variant

Const colNormalMenuBackground = &HE0E0E0
Const colSelectedMenuBackground = &HC0C0C0

Private Declare Function GetSystemMetrics Lib "user32" (ByVal nindex As Long) As Long
Private Const SM_CYMENU = 15

Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hDC As Long, ByVal nindex As Long) As Long
Private Const LOGPIXELSY = 90    '  Logical pixels/inch in Y

Private Declare Function GetKeyState% Lib "user32" (ByVal nVirtKey%)
Private Const VK_MENU = &H12     ' Alt !

Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" ( _
    ByVal uAction As Long, _
    ByVal uParam As Long, _
    lpvParam As Any, _
    ByVal fuWinIni As Long) As Long
    
Private Const SPI_GETICONMETRICS = 45
Private Const SPI_GETICONTITLELOGFONT = 31
Private Const LF_FACESIZE = 32
Private Const LF_FULLFACESIZE = 64
    
Private Const SPI_GETNONCLIENTMETRICS = 41
Private Const SPI_SETNONCLIENTMETRICS = 42
    
' Normal log font structure:
Private Type LOGFONT
    lfHeight As Long
    lfWidth As Long
    lfEscapement As Long
    lfOrientation As Long
    lfWeight As Long
    lfItalic As Byte
    lfUnderline As Byte
    lfStrikeOut As Byte
    lfCharSet As Byte
    lfOutPrecision As Byte
    lfClipPrecision As Byte
    lfQuality As Byte
    lfPitchAndFamily As Byte
    lfFaceName(LF_FACESIZE) As Byte
End Type

' Here but thanks to a bit of hacking (testing cbSize
' parameter until it worked - see sub XXXTest1!) is the required
' definition for NONCLIENTMETRICS structure - differs
' to the one in WIN32API.TXT with VB.
' For some bizarre reason, maybe to do with byte
' alignment, the LOGFONT structure we must apply
' to NONCLIENTMETRICS seems to require an LF_FACESIZE
' 4 bytes smaller than normal:
Private Type NMLOGFONT
    lfHeight As Long
    lfWidth As Long
    lfEscapement As Long
    lfOrientation As Long
    lfWeight As Long
    lfItalic As Byte
    lfUnderline As Byte
    lfStrikeOut As Byte
    lfCharSet As Byte
    lfOutPrecision As Byte
    lfClipPrecision As Byte
    lfQuality As Byte
    lfPitchAndFamily As Byte
    lfFaceName(LF_FACESIZE - 4) As Byte
End Type

Private Type NONCLIENTMETRICS
    cbSize As Long
    iBorderWidth As Long
    iScrollWidth As Long
    iScrollHeight As Long
    iCaptionWidth As Long
    iCaptionHeight As Long
    lfCaptionFont As NMLOGFONT
    iSMCaptionWidth As Long
    iSMCaptionHeight As Long
    lfSMCaptionFont As NMLOGFONT
    iMenuWidth As Long
    iMenuHeight As Long
    lfMenuFont As NMLOGFONT
    lfStatusFont As NMLOGFONT
    lfMessageFont As NMLOGFONT
End Type

Private Const WM_MOUSELEAVE = &H2A3&

Private m_TrackedControl As Control
Private m_bMenuOpen As Boolean

Private Const WM_MENUSELECT = &H11F


Dim sMenuFontname As String, bMenuFontBold As Boolean, iMenuFontSize As Integer

Private Sub FocusTrap_GotFocus(Index As Integer)
    If Index <= 2 And GetKeyState(VK_MENU) < 0 Then
        FocusTrap0.SetFocus
        lblMenu_Click Index
    End If
End Sub

Private Sub UserControl_Initialize()
    ' Customized section begin
    tabMenuHeaders = Array(mnuMenu, mnuDisplay, mnuSampleList)
    ' Customized section end

    Dim lR As Long
    Dim m_tNCM As NONCLIENTMETRICS
    m_tNCM.cbSize = 340 'LenB(m_tNCM) - why doesn't this go?
    lR = SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, m_tNCM, 0)
    sMenuFontname = StrConv(m_tNCM.lfMenuFont.lfFaceName, vbUnicode)
    If InStr(1, sMenuFontname, Chr(0)) > 1 Then sMenuFontname = Left(sMenuFontname, InStr(1, sMenuFontname, Chr(0)) - 1)
    bMenuFontBold = m_tNCM.lfMenuFont.lfWeight > 400
    iMenuFontSize = Abs((72# / GetDeviceCaps(hDC, LOGPIXELSY)) * m_tNCM.lfMenuFont.lfHeight)
    
    Dim i As Integer
    For i = 1 To UBound(tabMenuHeaders)
        Load picMenu(i)
        picMenu(i).Visible = True
        picMenu(i).TabIndex = 3 * i + 1
        Load lblMenu(i)
        Set lblMenu(i).Container = picMenu(i)
        lblMenu(i).Visible = True
        lblMenu(i).TabIndex = 3 * i + 2
        Load FocusTrap(i)
        Set FocusTrap(i).Container = picMenu(i)
        FocusTrap(i).Visible = True
        FocusTrap(i).TabIndex = 3 * i + 3
    Next

    Subclass2.hWnd = hWnd
    Subclass2.Messages(WM_MENUSELECT) = True
End Sub

Private Sub Subclass2_WndProc(msg As Long, wParam As Long, lParam As Long, result As Long)
    If lParam = 0 Then
        Dim i As Integer
        For i = 0 To UBound(tabMenuHeaders)
            picMenu(i).BackColor = colNormalMenuBackground
        Next
        m_bMenuOpen = False
    End If

    ' Calls default action
    result = Subclass2.CallWndProc(msg, wParam, lParam)
End Sub

Private Sub UserControl_Resize()
    UserControl.Height = GetSystemMetrics(SM_CYMENU) * Screen.TwipsPerPixelY
    Dim i As Integer
    For i = 0 To UBound(tabMenuHeaders)
        lblMenu(i).Font = sMenuFontname
        lblMenu(i).FontBold = bMenuFontBold
        lblMenu(i).FontSize = iMenuFontSize
        lblMenu(i).Top = (UserControl.Height - lblMenu(i).Height) / 2
        lblMenu(i).Caption = " " & tabMenuHeaders(i).Caption & " "
        picMenu(i).Height = UserControl.Height
        picMenu(i).Width = lblMenu(i).Width
        If i = 0 Then
            picMenu(i).Left = 50
        Else
            picMenu(i).Left = picMenu(i - 1).Left + picMenu(i - 1).Width
        End If
    Next
End Sub

Private Sub lblMenu_Click(Index As Integer)
    picMenu(Index).BackColor = colSelectedMenuBackground
    m_bMenuOpen = True
    PopupMenu tabMenuHeaders(Index), , picMenu(Index).Left, UserControl.Height
End Sub


Sub StartMouseTracking(c As Control)
    Dim tET As tagTRACKMOUSEEVENT
    Dim lR As Long
    
    ' Tells Windows to start tracking the mouse over the specified hWnd:
    If m_TrackedControl Is Nothing Then
        ' Tracking will stop whenever a WM_MOUSEHOVER or WM_MOUSELEAVE event occurs.
        tET.cbSize = Len(tET)
        tET.dwFlags = TME_HOVER Or TME_LEAVE
        tET.dwHoverTime = HOVER_DEFAULT
        tET.hwndTrack = c.hWnd
        lR = TrackMouseEvent(tET)
           
        Set m_TrackedControl = c
        
        Subclass1.hWnd = c.hWnd
        Subclass1.Messages(WM_MOUSELEAVE) = True
    End If
End Sub

Sub StopTracking()
    Subclass1.Messages(WM_MOUSEHOVER) = False
    Subclass1.Messages(WM_MOUSELEAVE) = False
    Set m_TrackedControl = Nothing
End Sub

Private Sub Subclass1_WndProc(msg As Long, wParam As Long, lParam As Long, result As Long)
    Dim x As Single, y As Single
    Dim sProc As String, iIndex As Integer
   
    ' Respond to WM_MOUSEHOVER and WM_MOUSELEAVE messages
    Select Case msg
        Case WM_MOUSELEAVE
            sProc = m_TrackedControl.Name & "_MouseLeave"
            iIndex = m_TrackedControl.Index
            StopTracking
            CallByName Me, sProc, VbMethod, iIndex
    End Select
    
    ' Calls default action
    result = Subclass1.CallWndProc(msg, wParam, lParam)
End Sub

Private Sub picMenu_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
   If m_TrackedControl Is Nothing Then
      picMenu(Index).BackColor = &HC0C0C0
      StartMouseTracking picMenu(Index)
   End If
End Sub


Private Sub lblMenu_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
   If m_TrackedControl Is Nothing Then
      picMenu(Index).BackColor = colSelectedMenuBackground
      StartMouseTracking picMenu(Index)
   End If
End Sub

Public Sub picMenu_MouseLeave(Index As Integer)
    If Not m_bMenuOpen Then picMenu(Index).BackColor = colNormalMenuBackground
End Sub



' Customized section begin
Public Property Get mnuMenu() As Menu: Set mnuMenu = s_mnuMenu: End Property
Public Property Get mnuForceE4Calc() As Menu: Set mnuForceE4Calc = s_mnuForceE4Calc: End Property
Public Property Get mnuForceSave() As Menu: Set mnuForceSave = s_mnuForceSave: End Property
Public Property Get mnuSave() As Menu: Set mnuSave = s_mnuSave: End Property
Public Property Get mnuCancel() As Menu: Set mnuCancel = s_mnuCancel: End Property
Public Property Get mnuCustCalcul() As Menu: Set mnuCustCalcul = s_mnuCustCalcul: End Property
Public Property Get mnuUnvalidRR() As Menu: Set mnuUnvalidRR = s_mnuUnvalidRR: End Property
Public Property Get mnuImportBalValue() As Menu: Set mnuImportBalValue = s_mnuImportBalValue: End Property
Public Property Get mnuQuit() As Menu: Set mnuQuit = s_mnuQuit: End Property
Public Property Get mnuDisplay() As Menu: Set mnuDisplay = s_mnuDisplay: End Property
Public Property Get mnuDisplayVR() As Menu: Set mnuDisplayVR = s_mnuDisplayVR: End Property
Public Property Get mnuDisplayRR() As Menu: Set mnuDisplayRR = s_mnuDisplayRR: End Property
Public Property Get mnuDisplaySRR() As Menu: Set mnuDisplaySRR = s_mnuDisplaySRR: End Property
Public Property Get mnuDisplayCalculated() As Menu: Set mnuDisplayCalculated = s_mnuDisplayCalculated: End Property
Public Property Get mnuShowOnlyEmptyLines() As Menu: Set mnuShowOnlyEmptyLines = s_mnuShowOnlyEmptyLines: End Property
Public Property Get mnuShowOnlyData() As Menu: Set mnuShowOnlyData = s_mnuShowOnlyData: End Property
Public Property Get mnuRefreshAuto() As Menu: Set mnuRefreshAuto = s_mnuRefreshAuto: End Property
Public Property Get mnuAutoHideSampleList() As Menu: Set mnuAutoHideSampleList = s_mnuAutoHideSampleList: End Property
Public Property Get mnuDisplayEstimate() As Menu: Set mnuDisplayEstimate = s_mnuDisplayEstimate: End Property
Public Property Get mnuEstiAuto() As Menu: Set mnuEstiAuto = s_mnuEstiAuto: End Property
Public Property Get mnuEstiAlways() As Menu: Set mnuEstiAlways = s_mnuEstiAlways: End Property
Public Property Get mnuEstiNever() As Menu: Set mnuEstiNever = s_mnuEstiNever: End Property
Public Property Get mnuDisplaySpecLimit() As Menu: Set mnuDisplaySpecLimit = s_mnuDisplaySpecLimit: End Property
Public Property Get mnuSpecLimAuto() As Menu: Set mnuSpecLimAuto = s_mnuSpecLimAuto: End Property
Public Property Get mnuSpecLimAlways() As Menu: Set mnuSpecLimAlways = s_mnuSpecLimAlways: End Property
Public Property Get mnuSpecLimNever() As Menu: Set mnuSpecLimNever = s_mnuSpecLimNever: End Property
Public Property Get mnuDisplayNorme() As Menu: Set mnuDisplayNorme = s_mnuDisplayNorme: End Property
Public Property Get mnuNormeAuto() As Menu: Set mnuNormeAuto = s_mnuNormeAuto: End Property
Public Property Get mnuNormeAlways() As Menu: Set mnuNormeAlways = s_mnuNormeAlways: End Property
Public Property Get mnuNormeNever() As Menu: Set mnuNormeNever = s_mnuNormeNever: End Property
Public Property Get mnuInterpretationValue() As Menu: Set mnuInterpretationValue = s_mnuInterpretationValue: End Property
Public Property Get mnuIRAuto() As Menu: Set mnuIRAuto = s_mnuIRAuto: End Property
Public Property Get mnuIRAlways() As Menu: Set mnuIRAlways = s_mnuIRAlways: End Property
Public Property Get mnuIRNever() As Menu: Set mnuIRNever = s_mnuIRNever: End Property
Public Property Get mnuAdditional() As Menu: Set mnuAdditional = s_mnuAdditional: End Property
Public Property Get mnuAdditional10() As Menu: Set mnuAdditional10 = s_mnuAdditional10: End Property
Public Property Get mnuAdditional9() As Menu: Set mnuAdditional9 = s_mnuAdditional9: End Property
Public Property Get mnuAdditional8() As Menu: Set mnuAdditional8 = s_mnuAdditional8: End Property
Public Property Get mnuDisplayLanguage() As Menu: Set mnuDisplayLanguage = s_mnuDisplayLanguage: End Property
Public Property Get mnuSampleList() As Menu: Set mnuSampleList = s_mnuSampleList: End Property
Public Property Get mnuAddSample() As Menu: Set mnuAddSample = s_mnuAddSample: End Property
Public Property Get mnuAddBatch() As Menu: Set mnuAddBatch = s_mnuAddBatch: End Property
Public Property Get mnuDelSample() As Menu: Set mnuDelSample = s_mnuDelSample: End Property
Public Property Get mnuDelList() As Menu: Set mnuDelList = s_mnuDelList: End Property
Public Property Get mnuCopySL() As Menu: Set mnuCopySL = s_mnuCopySL: End Property
Public Property Get mnuPasteSL() As Menu: Set mnuPasteSL = s_mnuPasteSL: End Property
Public Property Get mnuCalculateSL() As Menu: Set mnuCalculateSL = s_mnuCalculateSL: End Property
Public Property Get mnuBuildSampleList() As Menu: Set mnuBuildSampleList = s_mnuBuildSampleList: End Property



