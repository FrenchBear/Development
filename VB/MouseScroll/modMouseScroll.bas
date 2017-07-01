Attribute VB_Name = "Module1"
Option Explicit
'
' Original Idea From
' :) Ulli's VBMouseWheel (10.09.2002)
' then
' codé par EBArtSoft@ (2004) : VB6 Wheel AddIn : ebartsoft@hotmail.com
' pour activer la molette dans l'éditeur de VB6, y avait un copyright
' then
' modifié par philippe734 pour l'activation de la molette
' d'un object ayant :
' soit deux scroll bar, vertical et horizontale de type
' .scroll(cols as long, rows as long) (datagrid par ex)
' soit de type
' .toprow as long (flexgrid par ex)
' Rq : Référencer le fichier Wheel.tlb de EBArtSoft@
'
Private Const REG_SZ                As Long = 1
Private Const GWL_WNDPROC           As Long = (-4)
Private Const MAX_PATH              As Long = 260
Private Const WM_KILLFOCUS          As Long = &H8
Private Const WM_MOUSEWHEEL         As Long = &H20A

Private Const WM_MOUSEMOVE          As Long = &H200

Private Const HKEY_CURRENT_USER     As Long = &H80000001
Private Const PRPNAME               As String = "WheelPrc"
Private Const HKEYDESKTOP           As String = "Control Panel\Desktop"
Private Const HKEYLINES             As String = "WheelScrollLines"
Private Const HKEYSMOOTH            As String = "SmoothScroll"

Private mSmooth     As Boolean
Private mLines      As Long
Private mhWnd       As Long

Private bMoletteActive As Boolean
Private ObjetScroll As Object
Private iTypeScroll As Byte
Private Enum TypeScroll
    ScrollColRow = 1
    TopRow = 2
End Enum

Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
'Private Declare Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nindex As Long) As Long

'**** Procédure à appeller pour
Public Sub ActiverMoletteEtDéfinirObjetScroll(ByVal QuelObjetFautilScrollerDeTypeScrollVerticaleEtHorizontale As Object)
    On Error GoTo MoletteErr
    Call LoadSettings
    If bMoletteActive Then
        Call UnhookWindow
    End If
    Set ObjetScroll = QuelObjetFautilScrollerDeTypeScrollVerticaleEtHorizontale
    On Error GoTo PeutEtreTopRow    'sinon on essaye une autre propriété
    If IsError(ObjetScroll.Scroll(0, 0)) = False Then    'teste si l'objet
        'a une propriété .scroll(cols as long, rows as long)
        iTypeScroll = TypeScroll.ScrollColRow
        GoTo ProprieteOK    'si oui alors on active la molette
    Else
PeutEtreTopRow:
        On Error GoTo MoletteErr    'sinon on ne peut pas activer la molette
        If IsError(ObjetScroll.TopRow) = False Then    'test si l'objet
            'a une propriété .toprow
            iTypeScroll = TypeScroll.TopRow
        End If    'si oui alors on active la molette
    End If
ProprieteOK:
    Call HookWindow
    Exit Sub
MoletteErr:
    MsgBox "Prise en charge de la molette impossible", vbExclamation
    bMoletteActive = False
    Exit Sub
End Sub

Private Sub HookWindow()
    Dim tWnd As Long
    'test si la fenetre est de class ThunderFormDC
    mhWnd = FindWindow("ThunderFormDC", vbNullString)
    'tWnd = FindWindowEx(mhWnd, ByVal 0&, "ThunderFormDC", vbNullString)
    'avec lui, il ne la trouve pas le handle de notre fenetre donc
    'je l'ai enlevé car j'ai due mal le faire
    'If tWnd = 0 Then Exit Sub '<- normalement
    If mhWnd = 0 Then    '<- donc on fait comme ca
        'test si la fenetre est de class ThunderRT6FormDC
        'form vb6 une fois compilé
        mhWnd = FindWindow("ThunderRT6FormDC", vbNullString)
    End If
    If mhWnd = 0 Then
        'test si la fenetre est de class MDIClient
        'fenetre mère
        mhWnd = FindWindow("MDIClient", vbNullString)
    End If
    If mhWnd = 0 Then
        MsgBox "Prise en charge de la molette impossible", vbExclamation
        bMoletteActive = False
        Exit Sub
    End If
    SetProp mhWnd, PRPNAME, GetWindowLong(mhWnd, GWL_WNDPROC)
    SetWindowLong mhWnd, GWL_WNDPROC, AddressOf WindowProc
    bMoletteActive = True
End Sub

Private Sub UnhookWindow()
    Dim mWndProc  As Long
    mWndProc = GetProp(mhWnd, PRPNAME)
    If mWndProc = 0 Then Exit Sub
    RemoveProp mhWnd, PRPNAME
    SetWindowLong mhWnd, GWL_WNDPROC, mWndProc
    Set ObjetScroll = Nothing
    bMoletteActive = False
End Sub

Private Sub LoadSettings()
    Dim sData As String * MAX_PATH
    Dim hKey  As Long
    Dim lSize As Long
    If RegOpenKey(HKEY_CURRENT_USER, HKEYDESKTOP, hKey) Then
        mSmooth = True
        mLines = 3
    Else
        lSize = MAX_PATH
        If RegQueryValueEx(hKey, HKEYSMOOTH, 0, REG_SZ, sData, lSize) Then
            mSmooth = True
        Else
            mSmooth = Asc(Left(sData, lSize)) <> 0
        End If
        lSize = MAX_PATH
        If RegQueryValueEx(hKey, HKEYLINES, 0, REG_SZ, sData, lSize) Then
            mLines = 3
        Else
            mLines = CLng(Left(sData, lSize))
        End If
        RegCloseKey hKey
    End If
End Sub

Private Function WindowProc(ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    Dim mWndProc     As Long
    Dim NumLines     As Long
    Dim ScrollTo     As Long
    Dim TopLn        As Long
    mWndProc = GetProp(hWnd, PRPNAME)
    If mWndProc = 0 Then Exit Function
    WindowProc = CallWindowProc(mWndProc, hWnd, uMsg, wParam, lParam)
    'wParam indique le mouvement de la molette
    'pour wParam négatif, c'est pour voir en haut
    'positif, on descend le curseur du scrollbar
    Select Case uMsg
        'Case WM_KILLFOCUS
        '    UnhookWindow
        '    HookWindow
    Case WM_MOUSEWHEEL
        WindowProc = 0
        If ObjetScroll Is Nothing Then Exit Function
        TopLn = 0
        Select Case mLines
        Case "-2": NumLines = (10 * (1 / 2))
            '10 pour 10 lignes visibles, mais ça change pas grand chose
        Case "-1": NumLines = (10 - 1)
        Case Else: NumLines = Abs(mLines)
        End Select
        If NumLines < 1 Then NumLines = 1
        ScrollTo = TopLn - Sgn(wParam) * NumLines / ((wParam And &HFFFF&) \ 4 + 1)    'compute new top line
        If mSmooth Then
            If iTypeScroll = TypeScroll.ScrollColRow Then
                ObjetScroll.Scroll 0, ScrollTo
            ElseIf iTypeScroll = TypeScroll.TopRow Then
                If ObjetScroll.TopRow + ScrollTo <= 1 Then
                    ObjetScroll.TopRow = 1    'ligne min
                ElseIf ObjetScroll.TopRow + ScrollTo >= ObjetScroll.Rows Then
                    ObjetScroll.TopRow = ObjetScroll.Rows    'ligne max
                Else    'c'est bon, on peut scroller
                    ObjetScroll.TopRow = ObjetScroll.TopRow + ScrollTo
                End If
            End If
        End If
    End Select
End Function


