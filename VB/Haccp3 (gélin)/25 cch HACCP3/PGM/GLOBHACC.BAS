Option Explicit

Global Const sVersion = "2.5"
Global sNomProg As String   ' Titre des fenêtres
Global sSujet As String     ' Sujet (HACCP, DTS, ...)
Global Const sNomIni = "HACCP.INI"
Global sNomDoc As String    ' Fichier de documentation

Global sHelp1 As String     ' Intitulé de l'écran d'accueil
Global tLbl(6) As String    ' Libellés des 7 niveaux

Global Const VK_TAB = 9
Global Const HELP_CONTEXT = &H1
Global Const HELP_QUIT = &H2

Declare Function GetKeyState% Lib "User" (ByVal nVirtKey%)
Declare Function WinHelp Lib "User" (ByVal hWnd As Integer, ByVal HelpFile$, ByVal wCommand As Integer, ByVal dwData As Long) As Integer

Global Const NIV = 7

Global db As database

Global bStop As Integer   ' Arrêt de la géneration du document externe

' Dialogue communs
Global Const OFN_ALLOWMULTISELECT = &H200&   'Specifies that the File Name list box allows multiple selections.The user can select more than one file at run time by pressing the Shift key and using the Up and Down Arrow keys to select the desired files. When this is done, the FileName property returns a string containing the names of all selected files. The names in the string are delimited by spaces.
Global Const OFN_CREATEPROMPT = &H2000&      'Specifies that the dialog box should ask if the user wants to create a file that does not currently exist. This flag automatically sets the OFN_PATHMUSTEXIST and OFN_FILEMUSTEXIST flags.
Global Const OFN_EXTENSIONDIFFERENT = &H400& 'Indicates that the extension of the returned file name is different from the extension specified by the DefaultExt property. This flag is not set if the DefaultExt property is Null, if the extensions match, or if the file has no extension. This flag value can be checked upon returning from the dialog box.
Global Const OFN_FILEMUSTEXIST = &H1000&     'Specifies that the user can enter only names of existing files in the File Name text box. If this flag is set and the user enters an invalid file name, a warning is displayed. This flag automatically sets the OFN_PATHMUSTEXIST flag.
Global Const OFN_HIDEREADONLY = &H4&         'Hides the Read Only check box.
Global Const OFN_NOCHANGEDIR = &H8&          'Forces the dialog box to set the current directory to what it was when the dialog box was invoked.
Global Const OFN_NOREADONLYRETURN = &H8000&  'Specifies that the returned file will not have the Read Only attribute set and will not be in a write-protected directory.
Global Const OFN_NOVALIDATE = &H100&         'Specifies that the common dialog box allows invalid characters in the returned file name.
Global Const OFN_OVERWRITEPROMPT = &H2&      'Causes the Save As dialog box to generate a message box if the selected file already exists. The user must confirm whether to overwrite the file.
Global Const OFN_PATHMUSTEXIST = &H800&      'Specifies that the user can enter only valid path names. If this flag is set and the user enters an invalid path name, a warning message is displayed.
Global Const OFN_READONLY = &H1&             'Causes the Read Only check box to be initially checked when the dialog box is created. This flag also indicates the state of the Read Only check box when the dialog box is closed.
Global Const OFN_SHAREAWARE = &H4000&        'Specifies that sharing violation errors will be ignored.
Global Const OFN_SHOWHELP = &H10&            'Causes the dialog box to display the Help button.

Declare Function GetPrivateProfileInt Lib "Kernel" (ByVal Appname As String, ByVal KeyName As String, ByVal DEFAULT As Integer, ByVal FileName As String) As Integer
Declare Function GetPrivateProfileString Lib "Kernel" (ByVal Appname As String, ByVal KeyName As String, ByVal DEFAULT As String, ByVal ReturnedString As String, ByVal MaxSize As Integer, ByVal FileName As String) As Integer
Declare Function WritePrivateProfileString Lib "Kernel" (ByVal Appname As String, ByVal KeyName As String, ByVal NewString As String, ByVal FileName As String) As Integer

Sub ColorBox (c As Control, ByVal i As Integer)

  Select Case i
    Case 1:
      c.BackColor = RGB(256, 256, 0)
      c.ForeColor = &H0

    Case 2:
      c.BackColor = RGB(256, 128, 0)
      c.ForeColor = &H0

    Case 3:
      c.BackColor = RGB(256, 0, 0)
      c.ForeColor = &H0

    Case 4:
      c.BackColor = RGB(256, 0, 256)
      c.ForeColor = RGB(256, 256, 256)

    Case Else '0
      c.BackColor = &H80000005
      c.ForeColor = &H80000008
      
  End Select

End Sub

Function IniChaine (sToken As String, sDefaut As String) As String
  Dim lbl As String
  Dim x As Integer, p  As Integer

  lbl = Space$(100)
  x = GetPrivateProfileString("HACCP", sToken, sDefaut, lbl, Len(lbl), sNomIni)
  p = InStr(lbl, Chr(0))
  If p <> 0 Then lbl = Left(lbl, p - 1)
  IniChaine = lbl
End Function

Sub ShowHelp (ByVal i As Integer)
  Dim r
  Dim nomfic As String, CurrentDir As String

  CurrentDir = app.Path
  If Right$(CurrentDir, 1) <> "\" Then CurrentDir = CurrentDir + "\"
  nomfic = CurrentDir & "HACCPPGM.HLP"

  r = WinHelp(frmHACCP.hWnd, nomfic, HELP_CONTEXT, CLng(i))
End Sub

