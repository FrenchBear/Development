VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8490
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6645
   Height          =   8895
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   8490
   ScaleWidth      =   6645
   Top             =   1170
   Width           =   6765
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   2700
      TabIndex        =   0
      Top             =   4020
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
' PaperBin
' Exemple transmis par le support technique de Microsoft le 27/3/97
' 28/03/97 PV

Option Explicit

Private Const CCHDEVICENAME = 32
Private Const CCHFORMNAME = 32

Private Const STANDARD_RIGHTS_REQUIRED = &HF0000
Private Const PRINTER_ACCESS_ADMINISTER = &H4
Private Const PRINTER_ACCESS_USE = &H8
Private Const PRINTER_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED Or PRINTER_ACCESS_ADMINISTER Or PRINTER_ACCESS_USE)

Private Const DM_MODIFY = 8
Private Const DM_IN_BUFFER = DM_MODIFY
Private Const DM_COPY = 2
Private Const DM_OUT_BUFFER = DM_COPY
Private Const DM_DEFAULTSOURCE = &H200&
Private Const DM_PROMPT = 4
Private Const DM_IN_PROMPT = DM_PROMPT
Private Const DMBIN_LOWER = 2
Private Const DMBIN_UPPER = 1

Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, pDefault As PRINTER_DEFAULTS) As Long
Private Declare Function DocumentProperties Lib "winspool.drv" Alias "DocumentPropertiesA" (ByVal hwnd As Long, ByVal hPrinter As Long, ByVal pDeviceName As String, pDevModeOutput As DEVMODE, pDevModeInput As DEVMODE, ByVal fMode As Long) As Long
Private Declare Function SetPrinter Lib "winspool.drv" Alias "SetPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pPrinter As Any, ByVal Command As Long) As Long
Private Declare Function GetPrinter Lib "winspool.drv" Alias "GetPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pPrinter As Any, ByVal cbBuf As Long, pcbNeeded As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Private Declare Function lstrcpy Lib "kernel32" Alias "lstrcpyA" (ByVal lpStringl As String, ByVal lpString2 As Any) As Long
Private Declare Function lstrcpyn Lib "kernel32" Alias "lstrcpynA" (lpStringl As Any, lpString2 As Any, ByVal count As Long) As Long
Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long

Private Type DEVMODE
  dmDeviceName As String * CCHDEVICENAME
  dmSpecVersion As Integer
  dmDriverVersion As Integer
  dmSize As Integer
  dmDriverExtra As Integer
  dmFields As Long
  dmOrientation As Integer
  dmPaperSize As Integer
  dmPapeLength As Integer
  dmPaperWidth As Integer
  dmScale As Integer
  dmCopies As Integer
  dmDefaultSource As Integer
  dmPrintQuality As Integer
  dmColor As Integer
  dmDuplex As Integer
  dmResolution As Integer
  dmTTOption As Integer
  dmCollate As Integer
  dmFormName As String * CCHFORMNAME
  dmLogPixels As Integer
  dmBitsPerPel As Long
  dmPelsWidth As Long
  dmPelsHeight As Long
  dmDisplayFlags As Long
  dmDisplayFrequency As Long
  dmICMMethod As Long    ' Windows 95 only
  dmICMIntent As Long    ' Windows 95 only
  dmMediaType As Long    ' Windows 95 only
  dmDitherType As Long   ' Windows 95 only
  dmReservedl As Long    ' Windows 95 only
  dmReserved2 As Long    ' Windows 95 only
End Type

Private Type PRINTER_DEFAULTS
  pDatatype As Long
  pDevMode As DEVMODE
  DesiredAccess As Long
End Type

Private Type PRINTER_INFO_2
  pServerName As String
  pPrinterName As String
  pShareName As String
  pPortName As String
  pDriverName As String
  pComment As String
  pLocation As String

' It is critical that pDevmode be set toLong
  pDevMode As Long
  pSepFile As String
  pPrintProcessor As String
  pDatatype As String
  pParameters As String

' It is critical that pSecurityDescriptor be set toLong
  pSecurityDescriptor As Long
  Attributes As Long
  Priority As Long
  DefaultPriority As Long
  StartTime As Long
  UntilTime As Long
  Status As Long
  cJobs As Long
  AveragePPM As Long
End Type


Sub Pr(bin As String)
  Dim Handle As Long
  Dim dmbin As Long

  Dim PrinterName As String
  Dim retval As Boolean
  Dim pd As PRINTER_DEFAULTS
  Dim LastError As Long
  Dim lpDevMode As DEVMODE
  Dim x As Long
  Dim need As Long
  Dim pi2 As PRINTER_INFO_2
  Dim l As Long

  PrinterName = Printer.DeviceName
  If PrinterName = "" Then
    Exit Sub
  End If

  Select Case bin
    Case "haut"
      dmbin = DMBIN_UPPER

    Case "bas"
      dmbin = DMBIN_LOWER
    
    Case Else
      MsgBox "pas de bac sélectionné!"
      Exit Sub
  End Select

  pd.pDatatype = 0&
  pd.DesiredAccess = PRINTER_ALL_ACCESS

  x = OpenPrinter(PrinterName, Handle, pd)
  Print "OpenPrinter: "; x
  x = GetPrinter(Handle, 2, ByVal 0&, 0, need)
  Print "GetPrinter: "; x; " Need: "; need
  ReDim t(need \ 4) As Long
  x = GetPrinter(Handle, 2, t(0), need, need)
  Print "GetPrinter: "; x

  pi2.pServerName = PtrCtoVbString(t(0))
  pi2.pPrinterName = PtrCtoVbString(t(1))
  pi2.pShareName = PtrCtoVbString(t(2))
  pi2.pPortName = PtrCtoVbString(t(3))
  pi2.pDriverName = PtrCtoVbString(t(4))
  pi2.pComment = PtrCtoVbString(t(5))
  pi2.pComment = "New Comment"
  pi2.pLocation = PtrCtoVbString(t(6))
  CopyMemory lpDevMode, ByVal t(7), Len(lpDevMode)
  pi2.pSepFile = PtrCtoVbString(t(8))
  pi2.pPrintProcessor = PtrCtoVbString(t(9))
  pi2.pDatatype = PtrCtoVbString(t(10))
  pi2.pParameters = PtrCtoVbString(t(11))
  pi2.pSecurityDescriptor = 0&
  pi2.Attributes = t(13)
  pi2.Priority = t(14)
  pi2.DefaultPriority = t(15)
  pi2.StartTime = t(16)
  pi2.UntilTime = t(17)
  pi2.Status = t(18)
  pi2.cJobs = t(19)
  pi2.AveragePPM = t(20)

  lpDevMode.dmDefaultSource = dmbin
  lpDevMode.dmFields = DM_DEFAULTSOURCE
  x = DocumentProperties(Me.hwnd, Handle, PrinterName, lpDevMode, lpDevMode, DM_IN_BUFFER Or DM_OUT_BUFFER)
  Print "DocumentProperties: "; x
  ReDim bytes(Len(lpDevMode)) As Byte
  CopyMemory bytes(0), lpDevMode, Len(lpDevMode)
  pi2.pDevMode = lstrcpyn(bytes(0), bytes(0), 0)

  x = SetPrinter(Handle, 2, pi2, 0)
  Print "SetPrinter: "; x

  x = ClosePrinter(Handle)
  Print "ClosePrinter: "; x
End Sub

Function PtrCtoVbString(Add As Long) As String
  Dim sTemp As String * 512, x As Long

  x = lstrcpy(sTemp, Add)
  If (InStr(1, sTemp, Chr(0)) = 0) Then
    PtrCtoVbString = ""
  Else
    PtrCtoVbString = Left(sTemp, InStr(1, sTemp, Chr(0)) - 1)
  End If
End Function


Private Sub Command1_Click()
  Pr "haut"
  Printer.Print "Ceci est imprimé sur bin haut"
  Printer.EndDoc
  Pr "bas"
  Printer.Print "Ceci est imprimé sur bin bas"
  Printer.EndDoc
  MsgBox "ok"
End Sub

