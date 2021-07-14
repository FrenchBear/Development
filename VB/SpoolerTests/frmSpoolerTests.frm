VERSION 5.00
Begin VB.Form frmSpoolerTests 
   Caption         =   "Spooler Tests"
   ClientHeight    =   4350
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   9690
   LinkTopic       =   "Form1"
   ScaleHeight     =   4350
   ScaleWidth      =   9690
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Left            =   8940
      Top             =   480
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5940
      TabIndex        =   5
      Top             =   3300
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5880
      TabIndex        =   4
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5880
      TabIndex        =   3
      Top             =   540
      Width           =   1215
   End
   Begin VB.TextBox Text3 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1305
      Left            =   780
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   2820
      Width           =   4500
   End
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1305
      Left            =   780
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   1440
      Width           =   4500
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1305
      Left            =   780
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   60
      Width           =   4500
   End
End
Attribute VB_Name = "frmSpoolerTests"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' From https://jeffpar.github.io/kbarchive/kb/202/Q202480/
  
Option Explicit

Private Sub Command1_Click()
   'Enable the timer to begin printer status checks.
   Timer1.Enabled = True
   
   'Enable and disable start and stop buttons.
   Command1.Enabled = False
   Command2.Enabled = True
   Command3.Enabled = True
End Sub

Private Sub Command2_Click()
   'Disable timer to stop further printer checks.
   Timer1.Enabled = False
   
   'Enable and disable start and stop buttons.
   Command1.Enabled = True
   Command2.Enabled = False
   Command3.Enabled = True
End Sub

Private Sub Command3_Click()
   'Clear the status info.
   Text1.Text = ""
   Text2.Text = ""
   Text3.Text = ""
End Sub

Private Sub Form_Load()
   'Initialize captions for control buttons.
   Command1.Caption = "Start"
   Command2.Caption = "Stop"
   Command3.Caption = "Clear"
   
   'Clear the status info.
   Text1.Text = ""
   Text2.Text = ""
   Text3.Text = ""
   
   Command1.Enabled = True
   'Disable stop and clear buttons.
   Command2.Enabled = False
   Command3.Enabled = False
   
   'Set interval for printer status checking to 1/2 second.
   Timer1.Enabled = False
   Timer1.Interval = 500
End Sub

Private Sub Timer1_Timer()
   Dim PrinterStatus As String
   Dim JobStatus As String
   Dim ErrorInfo As String
   
   'Clear the status info for new info/status.
   Text1.Text = ""
   Text2.Text = ""
   Text3.Text = ""
   
   'Call sub to perform check.
   Text1.Text = CheckPrinter(PrinterStatus, JobStatus)
   Text2.Text = PrinterStatus
   Text3.Text = JobStatus
End Sub

Public Function CheckPrinter(PrinterStr As String, JobStr As String) As String
   Dim hPrinter As Long
   Dim ByteBuf As Long
   Dim BytesNeeded As Long
   Dim PI2 As PRINTER_INFO_2
   Dim JI2 As JOB_INFO_2
   Dim PrinterInfo() As Byte
   Dim JobInfo() As Byte
   Dim result As Long
   Dim LastError As Long
   Dim PrinterName As String
   Dim tempStr As String
   Dim NumJI2 As Long
   Dim pDefaults As PRINTER_DEFAULTS
   Dim I As Integer
   
   'Set a default return value if no errors occur.
   CheckPrinter = "Printer info retrieved"
   
   'NOTE: You can pick a printer from the Printers Collection
   'or use the EnumPrinters() API to select a printer name.
   
   'Use the default printer of Printers collection.
   'This is typically, but not always, the system default printer.
   PrinterName = Printer.DeviceName
   
   'Set desired access security setting.
   pDefaults.DesiredAccess = PRINTER_ACCESS_USE
   
   'Call API to get a handle to the printer.
   result = OpenPrinter(PrinterName, hPrinter, pDefaults)
   If result = 0 Then
      'If an error occurred, display an error and exit sub.
      CheckPrinter = "Cannot open printer " & PrinterName & _
         ", Error: " & Err.LastDllError
      Exit Function
   End If

   'Init BytesNeeded
   BytesNeeded = 0

   'Clear the error object of any errors.
   Err.Clear

   'Determine the buffer size that is needed to get printer info.
   result = GetPrinter(hPrinter, 2, 0&, 0&, BytesNeeded)
   
   'Check for error calling GetPrinter.
   If Err.LastDllError <> ERROR_INSUFFICIENT_BUFFER Then
      'Display an error message, close printer, and exit sub.
      CheckPrinter = " > GetPrinter Failed on initial call! <"
      ClosePrinter hPrinter
      Exit Function
   End If
   
   'Note that in Charles Petzold's book "Programming Windows 95," he
   'states that because of a problem with GetPrinter on Windows 95 only, you
   'must allocate a buffer as much as three times larger than the value
   'returned by the initial call to GetPrinter. This is not done here.
   ReDim PrinterInfo(1 To BytesNeeded)
   
   ByteBuf = BytesNeeded
   
   'Call GetPrinter to get the status.
   result = GetPrinter(hPrinter, 2, PrinterInfo(1), ByteBuf, _
     BytesNeeded)
   
   'Check for errors.
   If result = 0 Then
      'Determine the error that occurred.
      LastError = Err.LastDllError()
      
      'Display error message, close printer, and exit sub.
      CheckPrinter = "Couldn't get Printer Status!  Error = " _
         & LastError
      ClosePrinter hPrinter
      Exit Function
   End If

   'Copy contents of printer status byte array into a
   'PRINTER_INFO_2 structure to separate the individual elements.
   CopyMemory PI2, PrinterInfo(1), Len(PI2)
   
   'Check if printer is in ready state.
   PrinterStr = CheckPrinterStatus(PI2.Status)
   
   'Add printer name, driver, and port to list.
   PrinterStr = PrinterStr & "Printer Name = " & _
     GetString(PI2.pPrinterName) & vbCrLf
   PrinterStr = PrinterStr & "Printer Driver Name = " & _
     GetString(PI2.pDriverName) & vbCrLf
   PrinterStr = PrinterStr & "Printer Port Name = " & _
     GetString(PI2.pPortName) & vbCrLf
   
   'Call API to get size of buffer that is needed.
   result = EnumJobs(hPrinter, 0&, &HFFFFFFFF, 2, ByVal 0&, 0&, _
      BytesNeeded, NumJI2)
   
   'Check if there are no current jobs, and then display appropriate message.
   If BytesNeeded = 0 Then
      JobStr = "No Print Jobs!"
   Else
      'Redim byte array to hold info about print job.
      ReDim JobInfo(0 To BytesNeeded)
      
      'Call API to get print job info.
      result = EnumJobs(hPrinter, 0&, &HFFFFFFFF, 2, JobInfo(0), _
        BytesNeeded, ByteBuf, NumJI2)
      
      'Check for errors.
      If result = 0 Then
         'Get and display error, close printer, and exit sub.
         LastError = Err.LastDllError
         CheckPrinter = " > EnumJobs Failed on second call! <  Error = " _
            & LastError
         ClosePrinter hPrinter
         Exit Function
      End If
      
      'Copy contents of print job info byte array into a
      'JOB_INFO_2 structure to separate the individual elements.
      For I = 0 To NumJI2 - 1   ' Loop through jobs and walk the buffer
          CopyMemory JI2, JobInfo(I * Len(JI2)), Len(JI2)
             
          ' List info available on Jobs.
          Debug.Print "Job ID" & vbTab & JI2.JobId
          Debug.Print "Name Of Printer" & vbTab & _
            GetString(JI2.pPrinterName)
          Debug.Print "Name Of Machine That Created Job" & vbTab & _
            GetString(JI2.pMachineName)
          Debug.Print "Print Job Owner's Name" & vbTab & _
            GetString(JI2.pUserName)
          Debug.Print "Name Of Document" & vbTab & GetString(JI2.pDocument)
          Debug.Print "Name Of User To Notify" & vbTab & _
            GetString(JI2.pNotifyName)
          Debug.Print "Type Of Data" & vbTab & GetString(JI2.pDatatype)
          Debug.Print "Print Processor" & vbTab & _
            GetString(JI2.pPrintProcessor)
          Debug.Print "Print Processor Parameters" & vbTab & _
            GetString(JI2.pParameters)
          Debug.Print "Print Driver Name" & vbTab & _
            GetString(JI2.pDriverName)
          Debug.Print "Print Job 'P' Status" & vbTab & _
            GetString(JI2.pStatus)
          Debug.Print "Print Job Status" & vbTab & JI2.Status
          Debug.Print "Print Job Priority" & vbTab & JI2.Priority
          Debug.Print "Position in Queue" & vbTab & JI2.Position
          Debug.Print "Earliest Time Job Can Be Printed" & vbTab & _
            JI2.StartTime
          Debug.Print "Latest Time Job Will Be Printed" & vbTab & _
            JI2.UntilTime
          Debug.Print "Total Pages For Entire Job" & vbTab & JI2.TotalPages
          Debug.Print "Size of Job In Bytes" & vbTab & JI2.Size
          'Because of a bug in Windows NT 3.51, the time member is not set correctly.
          'Therefore, do not use the time member on Windows NT 3.51.
          Debug.Print "Elapsed Print Time" & vbTab & JI2.time
          Debug.Print "Pages Printed So Far" & vbTab & JI2.PagesPrinted
             
          'Display basic job status info.
          JobStr = JobStr & "Job ID = " & JI2.JobId & _
             vbCrLf & "Total Pages = " & JI2.TotalPages & vbCrLf
          
          tempStr = ""   'Clear
          'Check for a ready state.
          If JI2.pStatus = 0& Then   ' If pStatus is Null, check Status.
            If JI2.Status = 0 Then
               tempStr = tempStr & "Ready!  " & vbCrLf
            Else  'Check for the various print job states.
               If (JI2.Status And JOB_STATUS_SPOOLING) Then
                  tempStr = tempStr & "Spooling  "
               End If
               
               If (JI2.Status And JOB_STATUS_OFFLINE) Then
                  tempStr = tempStr & "Off line  "
               End If
               
               If (JI2.Status And JOB_STATUS_PAUSED) Then
                  tempStr = tempStr & "Paused  "
               End If
               
               If (JI2.Status And JOB_STATUS_ERROR) Then
                  tempStr = tempStr & "Error  "
               End If
               
               If (JI2.Status And JOB_STATUS_PAPEROUT) Then
                  tempStr = tempStr & "Paper Out  "
               End If
               
               If (JI2.Status And JOB_STATUS_PRINTING) Then
                  tempStr = tempStr & "Printing  "
               End If
               
               If (JI2.Status And JOB_STATUS_USER_INTERVENTION) Then
                  tempStr = tempStr & "User Intervention Needed  "
               End If
               
               If Len(tempStr) = 0 Then
                  tempStr = "Unknown Status of " & JI2.Status
               End If
            End If
        Else
            ' Dereference pStatus.
            tempStr = PtrCtoVbString(JI2.pStatus)
        End If
          
          'Report the Job status.
          JobStr = JobStr & tempStr & vbCrLf
          Debug.Print JobStr & tempStr
      Next I
   End If
   
   'Close the printer handle.
   ClosePrinter hPrinter
End Function

