Attribute VB_Name = "Orient"

'------COMMENTS

'For use on NT:
'  When adding a printer icon to the printer folder (when you double-
'  click on "Add Printer"), it is important to choose to save printer
'  settings on "My Computer" rather than on "Network Printer Server".
'  If "Network Printer Server" is used, then SetPrinter will fail
'  unless the user has privileges on the network printer server to
'  change the network server's global settings - in which case ALL
'  users of that printer are affected.  Whereas, when "My Computer"
'  is selected, the user only needs privileges on the local NT machine
'  and no one else is affected.

'HP LaserJet 5si
'  As of 3/2/98,  The HP LaserJet 5si printer driver does not work
'  properly with the SetPrinter API call.  After using this code,
'  the 5si properties in the Printer folder are unaffected.
'  3/2/98  --  The current workaround is to use the HP 4si driver.


'------CONSTANTS

'Constants used in the DevMode structure
Private Const CCHDEVICENAME = 32
Private Const CCHFORMNAME = 32

'Constants for NT security
Private Const STANDARD_RIGHTS_REQUIRED = &HF0000
Private Const PRINTER_ACCESS_ADMINISTER = &H4
Private Const PRINTER_ACCESS_USE = &H8
Private Const PRINTER_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED Or PRINTER_ACCESS_ADMINISTER Or PRINTER_ACCESS_USE)

'Constants used to make changes to the values contained in the DevMode
Private Const DM_MODIFY = 8
Private Const DM_IN_BUFFER = DM_MODIFY
Private Const DM_COPY = 2
Private Const DM_OUT_BUFFER = DM_COPY
Private Const DM_DUPLEX = &H1000&
Public Const DMDUP_SIMPLEX = 1
Private Const DMDUP_VERTICAL = 2
Private Const DMDUP_HORIZONTAL = 3
Private Const DM_ORIENTATION = &H1&


'------USER DEFINED TYPES

'The DevMode structure contains printing parameters.
'Note that this only represents the PUBLIC portion of the DevMode.
'  The full DevMode also contains a variable length PRIVATE section
'  which varies in length and content between printer drivers.
'NEVER use this User Defined Type directly with any API call.
'  Always combine it into a FULL DevMode structure and then send the
'  full DevMode to the API call.
Private Type DEVMODE
    dmDeviceName As String * CCHDEVICENAME
    dmSpecVersion As Integer
    dmDriverVersion As Integer
    dmSize As Integer
    dmDriverExtra As Integer
    dmFields As Long
    dmOrientation As Integer
    dmPaperSize As Integer
    dmPaperLength As Integer
    dmPaperWidth As Integer
    dmScale As Integer
    dmCopies As Integer
    dmDefaultSource As Integer
    dmPrintQuality As Integer
    dmColor As Integer
    dmDuplex As Integer
    dmYResolution As Integer
    dmTTOption As Integer
    dmCollate As Integer
    dmFormName As String * CCHFORMNAME
    dmLogPixels As Integer
    dmBitsPerPel As Long
    dmPelsWidth As Long
    dmPelsHeight As Long
    dmDisplayFlags As Long
    dmDisplayFrequency As Long
    dmICMMethod As Long        '// Windows 95 only
    dmICMIntent As Long        ' // Windows 95 only
    dmMediaType As Long        ' // Windows 95 only
    dmDitherType As Long       ' // Windows 95 only
    dmReserved1 As Long        ' // Windows 95 only
    dmReserved2 As Long        ' // Windows 95 only
End Type

Private Type PRINTER_DEFAULTS
'Note:
'  The definition of Printer_Defaults in the VB5 API viewer is incorrect.
'  Below, pDevMode has been corrected to LONG.
    pDatatype As String
    pDevMode As Long
    DesiredAccess As Long
End Type


'------DECLARATIONS

Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, pDefault As PRINTER_DEFAULTS) As Long
Private Declare Function SetPrinter Lib "winspool.drv" Alias "SetPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pPrinter As Any, ByVal Command As Long) As Long
Private Declare Function GetPrinter Lib "winspool.drv" Alias "GetPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pPrinter As Any, ByVal cbBuf As Long, pcbNeeded As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long

'The following is an unusual declaration of DocumentProperties:
'  pDevModeOutput and pDevModeInput are usually declared ByRef.  They are declared
'  ByVal in this program because we're using a Printer_Info_2 structure.
'  The pi2 structure contains a variable of type LONG which contains the address
'  of the DevMode structure (this is called a pointer).  This LONG variable must
'  be passed ByVal.
'  Normally this function is called with a BYTE ARRAY which contains the DevMode
'  structure and the Byte Array is passed ByRef.
Private Declare Function DocumentProperties Lib "winspool.drv" Alias "DocumentPropertiesA" (ByVal hwnd As Long, ByVal hPrinter As Long, ByVal pDeviceName As String, ByVal pDevModeOutput As Any, ByVal pDevModeInput As Any, ByVal fMode As Long) As Long


'------CODE

Public Sub SetOrientation(NewSetting As Long, chng As Integer)
    Dim PrinterHandle As Long
    Dim PrinterName As String
    Dim pd As PRINTER_DEFAULTS
    Dim MyDevMode As DEVMODE
    Dim Result As Long
    Dim Needed As Long
    Dim pFullDevMode As Long
    Dim pi2_buffer() As Long     'This is a block of memory for the Printer_Info_2 structure
        'If you need to use the Printer_Info_2 User Defined Type, the
        '  definition of Printer_Info_2 in the API viewer is incorrect.
        '  pDevMode and pSecurityDescriptor should be defined As Long.
    
    PrinterName = Printer.DeviceName
    If PrinterName = "" Then
        Exit Sub
    End If
    
    pd.pDatatype = vbNullString
    pd.pDevMode = 0&
    'Printer_Access_All is required for NT security
    pd.DesiredAccess = PRINTER_ALL_ACCESS
    
    Result = OpenPrinter(PrinterName, PrinterHandle, pd)
    
    'The first call to GetPrinter gets the size, in bytes, of the buffer needed.
    'This value is divided by 4 since each element of pi2_buffer is a long.
    Result = GetPrinter(PrinterHandle, 2, ByVal 0&, 0, Needed)
    ReDim pi2_buffer((Needed \ 4))
    Result = GetPrinter(PrinterHandle, 2, pi2_buffer(0), Needed, Needed)
    
    'The seventh element of pi2_buffer is a Pointer to a block of memory
    '  which contains the full DevMode (including the PRIVATE portion).
    pFullDevMode = pi2_buffer(7)
    
    'Copy the Public portion of FullDevMode into our DevMode structure
    Call CopyMemory(MyDevMode, ByVal pFullDevMode, Len(MyDevMode))
    
    'Make desired changes
    MyDevMode.dmDuplex = NewSetting
    MyDevMode.dmFields = DM_DUPLEX Or DM_ORIENTATION
    MyDevMode.dmOrientation = chng
    
    'Copy our DevMode structure back into FullDevMode
    Call CopyMemory(ByVal pFullDevMode, MyDevMode, Len(MyDevMode))
    
    'Copy our changes to "the PUBLIC portion of the DevMode" into "the PRIVATE portion of the DevMode"
    Result = DocumentProperties(Form1.hwnd, PrinterHandle, PrinterName, ByVal pFullDevMode, ByVal pFullDevMode, DM_IN_BUFFER Or DM_OUT_BUFFER)
    
    'Update the printer's default properties (to verify, go to the Printer folder
    '  and check the properties for the printer)
    Result = SetPrinter(PrinterHandle, 2, pi2_buffer(0), 0&)
    
    Call ClosePrinter(PrinterHandle)
    
    'Note: Once "Set Printer = " is executed, anywhere in the code, after that point
    '      changes made with SetPrinter will ONLY affect the system-wide printer  --
    '      -- the changes will NOT affect the VB printer object.
    '      Therefore, it may be necessary to reset the printer object's parameters to
    '      those chosen in the devmode.
    Dim p As Printer
    For Each p In Printers
        If p.DeviceName = PrinterName Then
            Set Printer = p
            Exit For
        End If
    Next p
    Printer.Duplex = MyDevMode.dmDuplex
End Sub

