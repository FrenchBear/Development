Attribute VB_Name = "COMSYST"
Option Explicit

'-------------------------------------------------------------------------
'            Type système
'-------------------------------------------------------------------------
Type RECT
    Left As Integer
    Top As Integer
    right As Integer
    bottom As Integer
End Type


'-------------------------------------------------------------------------
'          prototypes des fonctions API utilisées
'-------------------------------------------------------------------------

Declare Function GetProfileString Lib "Kernel" (ByVal lpAppName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Integer) As Integer
Declare Function GetPrivateProfileString Lib "Kernel" (ByVal lpSectionName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Integer, ByVal lpFilename As String) As Integer
Declare Function GetPrivateProfileInt Lib "Kernel" (ByVal lpSectionName As String, ByVal lpKeyName As String, ByVal nDefault As Integer, ByVal lpFilename As String) As Integer
Declare Function WritePrivateProfileString Lib "Kernel" (ByVal lpSectionName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lplFileName As String) As Integer
Declare Function WriteProfileString Lib "Kernel" (ByVal lpSectionName As String, ByVal lpKeyName As Any, ByVal lpString As Any) As Integer
Declare Function GetWindowsDirectory Lib "Kernel" (ByVal lpBuffer As String, ByVal nSize As Integer) As Integer
Declare Function GetModuleHandle Lib "Kernel" (ByVal lpModuleName As String) As Integer
Declare Function GetModuleFilename Lib "Kernel" (ByVal hModule As Integer, ByVal lpFilename As String, ByVal nSize As Integer) As Integer
Declare Function GetModuleUsage% Lib "Kernel" (ByVal hProgram%)
Declare Function setwindowpos Lib "User" (ByVal hWnd As Integer, ByVal hWndInsertAfter As Integer, ByVal X As Integer, ByVal Y As Integer, ByVal cx As Integer, ByVal cy As Integer, ByVal wFlags As Integer) As Integer
Declare Function PtInRect Lib "User" (lpRect As RECT, ptRect As Any) As Integer
Declare Function Winhelp Lib "User" (ByVal hWnd As Integer, ByVal lpHelpFile As String, ByVal wCommand As Integer, ByVal dwData As Any) As Integer

'-------------------------------------------------------------------------
'                              constantes systèmes
'-------------------------------------------------------------------------

' Clipboard formats
Global Const CF_TEXT = 1

' MsgBox return values
Global Const IDOK = 1                  ' OK button pressed
Global Const IDCANCEL = 2              ' Cancel button pressed
Global Const IDABORT = 3               ' Abort button pressed
Global Const IDRETRY = 4               ' Retry button pressed
Global Const IDIGNORE = 5              ' Ignore button pressed
Global Const IDYES = 6                 ' Yes button pressed
Global Const IDNO = 7                  ' No button pressed
Global Const IDSTOP = 8                ' stop button

' MousePointer
Global Const DEFAULT = 0        ' 0 - Default
Global Const HOURGLASS_SHAPE = 11     ' 11 - Hourglass

'Error Constants
'Added for CMDLG.VBX
Global Const CDERR_CANCEL = 32755

'windowState constants
Global Const ICONIZED = 1
Global Const NORMAL = 0
Global Const MAXIMIZED = 2

' Function Parameters
' MsgBox parameters
Global Const MB_OK = 0                 ' OK button only
Global Const MB_OKCANCEL = 1           ' OK and Cancel buttons
Global Const MB_ABORTRETRYIGNORE = 2   ' Abort, Retry, and Ignore buttons
Global Const MB_YESNOCANCEL = 3        ' Yes, No, and Cancel buttons
Global Const MB_YESNO = 4              ' Yes and No buttons
Global Const MB_RETRYCANCEL = 5        ' Retry and Cancel buttons
Global Const MB_OKSTOP = 6             ' Ok ou Stop
Global Const MB_YESNOSTOP = 7          ' oui, non et stop

Global Const MB_ICONSTOP = 16          ' Critical message
Global Const MB_ICONQUESTION = 32      ' Warning query
Global Const MB_ICONEXCLAMATION = 48   ' Warning message
Global Const MB_ICONINFORMATION = 64   ' Information message

Global Const MB_BOUTON1 = 1
Global Const MB_BOUTON2 = 2
Global Const MB_BOUTON3 = 3

'numéro des Couleurs à utiliser avec QBColor()
Global Const QBCOLOR_NOIR = 0
Global Const QBCOLOR_BLEU = 1
Global Const QBCOLOR_VERT = 2
Global Const QBCOLOR_CYAN = 3
Global Const QBCOLOR_ROUGE = 4
Global Const QBCOLOR_MAGENTA = 5
Global Const QBCOLOR_JAUNE = 6
Global Const QBCOLOR_GRIS = 7
Global Const QBCOLOR_GRIS_CLAIR = 8
Global Const QBCOLOR_BLEU_CLAIR = 9
Global Const QBCOLOR_VERT_CLAIR = 10
Global Const QBCOLOR_CYAN_CLAIR = 11
Global Const QBCOLOR_ROUGE_CLAIR = 12
Global Const QBCOLOR_MAGENTA_CLAIR = 13
Global Const QBCOLOR_JAUNE_CLAIR = 14
Global Const QBCOLOR_BLANC = 15

' Show parameters
Global Const MODAL = 1
Global Const MODELESS = 0

'constantes pour Dir$
Global Const ATTR_DIRECTORY = 16

'File Open/Save Dialog Flags
Global Const OFN_READONLY = &H1&
Global Const OFN_OVERWRITEPROMPT = &H2&
Global Const OFN_HIDEREADONLY = &H4&
Global Const OFN_NOCHANGEDIR = &H8&
Global Const OFN_SHOWHELP = &H10&
Global Const OFN_NOVALIDATE = &H100&
Global Const OFN_ALLOWMULTISELECT = &H200&
Global Const OFN_EXTENSIONDIFFERENT = &H400&
Global Const OFN_PATHMUSTEXIST = &H800&
Global Const OFN_FILEMUSTEXIST = &H1000&
Global Const OFN_CREATEPROMPT = &H2000&
Global Const OFN_SHAREAWARE = &H4000&
Global Const OFN_NOREADONLYRETURN = &H8000&


'Help Constants
Global Const HELP_CONTEXT = &H1           'Display topic in ulTopic
Global Const HELP_QUIT = &H2              'Terminate help
Global Const HELP_INDEX = &H3             'Display index
Global Const HELP_CONTENTS = &H3
Global Const HELP_HELPONHELP = &H4        'Display help on using help
Global Const HELP_SETINDEX = &H5          'Set the current Index for multi index help
Global Const HELP_SETCONTENTS = &H5
Global Const HELP_CONTEXTPOPUP = &H8
Global Const HELP_FORCEFILE = &H9
Global Const HELP_KEY = &H101             'Display topic for keyword in offabData
Global Const HELP_COMMAND = &H102
Global Const HELP_PARTIALKEY = &H105      'call the search engine in winhelp

Global Const KEY_DEL = 46

