VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form MainForm 
   Caption         =   "True Browser (OLE DB)"
   ClientHeight    =   3990
   ClientLeft      =   2715
   ClientTop       =   2025
   ClientWidth     =   7350
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "TRUBRWSE.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3990
   ScaleWidth      =   7350
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   615
      Left            =   120
      Top             =   1920
      Visible         =   0   'False
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   1085
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   1
      LockType        =   3
      CommandType     =   1
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   ""
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   ""
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "TRUBRWSE.frx":030A
      Height          =   1815
      Left            =   0
      OleObjectBlob   =   "TRUBRWSE.frx":031F
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   2775
   End
   Begin MSComDlg.CommonDialog CMDialog1 
      Left            =   120
      Top             =   2640
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      Filter          =   "Database Files|*.mdb;*.dbf;*.dbc|Access(*.mdb)|*.mdb|dBAE(*.dbf)|*.dbf|FoxPro(*.dbc)|*.dbc"
   End
   Begin VB.Menu mFileTitle 
      Caption         =   "&File"
      Begin VB.Menu mFileOption 
         Caption         =   "&Open..."
         Index           =   1
      End
      Begin VB.Menu mFileOption 
         Caption         =   "&Close"
         Enabled         =   0   'False
         Index           =   2
      End
      Begin VB.Menu mFileOption 
         Caption         =   "-"
         Index           =   3
      End
      Begin VB.Menu mFileOption 
         Caption         =   "&Print"
         Enabled         =   0   'False
         Index           =   4
      End
      Begin VB.Menu mFileOption 
         Caption         =   "-"
         Index           =   5
      End
      Begin VB.Menu mFileOption 
         Caption         =   "E&xit"
         Index           =   6
      End
   End
   Begin VB.Menu RecordTitle 
      Caption         =   "&Record"
      Visible         =   0   'False
      Begin VB.Menu mRecordOption 
         Caption         =   "&Add..."
         Index           =   1
      End
      Begin VB.Menu mRecordOption 
         Caption         =   "&Update..."
         Index           =   2
      End
      Begin VB.Menu mRecordOption 
         Caption         =   "&Delete"
         Index           =   3
      End
   End
   Begin VB.Menu SortTitle 
      Caption         =   "&Sort"
      Visible         =   0   'False
      Begin VB.Menu mSortOption 
         Caption         =   "&Unsorted"
         Checked         =   -1  'True
         Index           =   0
      End
      Begin VB.Menu mSortOption 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu mSortOption 
         Caption         =   ""
         Index           =   2
         Visible         =   0   'False
      End
      Begin VB.Menu mSortOption 
         Caption         =   ""
         Index           =   3
         Visible         =   0   'False
      End
      Begin VB.Menu mSortOption 
         Caption         =   ""
         Index           =   4
         Visible         =   0   'False
      End
      Begin VB.Menu mSortOption 
         Caption         =   ""
         Index           =   5
         Visible         =   0   'False
      End
      Begin VB.Menu mSortOption 
         Caption         =   ""
         Index           =   6
         Visible         =   0   'False
      End
      Begin VB.Menu mSortOption 
         Caption         =   ""
         Index           =   7
         Visible         =   0   'False
      End
      Begin VB.Menu mSortOption 
         Caption         =   ""
         Index           =   8
         Visible         =   0   'False
      End
      Begin VB.Menu mSortOption 
         Caption         =   ""
         Index           =   9
      End
      Begin VB.Menu mSortOption 
         Caption         =   "-"
         Index           =   10
      End
      Begin VB.Menu mSortOption 
         Caption         =   "More Fields..."
         Index           =   11
         Visible         =   0   'False
      End
   End
   Begin VB.Menu QueryTitle 
      Caption         =   "&Query"
      Visible         =   0   'False
      Begin VB.Menu mQueryOption 
         Caption         =   "&Find..."
         Index           =   0
      End
      Begin VB.Menu mQueryOption 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu mQueryOption 
         Caption         =   "Find &All"
         Index           =   2
      End
   End
   Begin VB.Menu mOptions 
      Caption         =   "&Options"
      Visible         =   0   'False
      Begin VB.Menu mOptionsMenu 
         Caption         =   "Multiple Lines"
         Index           =   1
      End
      Begin VB.Menu mOptionsMenu 
         Caption         =   "Cell Tips"
         Index           =   2
      End
   End
   Begin VB.Menu mLayout 
      Caption         =   "&Layout"
      Visible         =   0   'False
      Begin VB.Menu mLayoutmenu 
         Caption         =   "Load..."
         Index           =   0
      End
      Begin VB.Menu mLayoutmenu 
         Caption         =   "Save As..."
         Index           =   1
      End
      Begin VB.Menu mLayoutmenu 
         Caption         =   "-"
         Index           =   2
      End
      Begin VB.Menu mLayoutmenu 
         Caption         =   "Remove"
         Index           =   3
      End
   End
   Begin VB.Menu HelpMenuOption 
      Caption         =   "&Help"
      Begin VB.Menu mHelpOption 
         Caption         =   "&Contents"
         Index           =   1
      End
      Begin VB.Menu mHelpOption 
         Caption         =   "&About True Browser..."
         Index           =   2
      End
   End
End
Attribute VB_Name = "MainForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ---------------------------------------------------------
'       Copyright ©1995-1998 APEX Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True DBGrid Pro 6 sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that APEX Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------

Dim dbDir As String

Private Sub ClearCheck()
  'Clears the previous Sort checkmark
  For ct% = 0 To 10
    mSortOption(ct%).Checked = False
  Next ct%
End Sub

Private Sub Data1_Error(DataErr As Integer, Response As Integer)
  'If the data control generates an error it passes through this event
  'You can either choose to display or ignore the error using the response parameter
  'In this case I simply set the DbOpen flag to false and allow the message to be displayed
  dbOpen = False
End Sub

Private Sub DisplayGrid(Status As Integer, File As String)
  Dim i As Integer

  mFileOption(2).Enabled = Status
  mFileOption(4).Enabled = Status
  RecordTitle.Visible = Status
  SortTitle.Visible = Status
  QueryTitle.Visible = Status
  mOptions.Visible = Status
  mLayout.Visible = Status
  TDBGrid1.Visible = Status
  If Status Then
    MainForm.Caption = "True Browser - " + File
  Else
    MainForm.Caption = "True Browser"
  End If
   
  Screen.MousePointer = Default
  For i = 0 To TDBGrid1.Columns.Count - 1
    TDBGrid1.Columns(i).HeadForeColor = vbWhite
    TDBGrid1.Columns(i).HeadBackColor = &H0&
  Next i
End Sub

Private Sub Form_Load()
  'Center the Form on the screen
  CenterForm MainForm

  dbDir = App.Path

  'Load in database if one is present on the Command Line
  If Command <> "" Then
    dbOpen = True
    OpenFile (Command$)
    If dbOpen = True Then
      Call DisplayGrid(True, Command$)
    End If
  End If
  'Set colors and marquee style for the grid
  TDBGrid1.BackColor = &HC0C0C0
  TDBGrid1.HighlightRowStyle.BackColor = &H808080
  TDBGrid1.HighlightRowStyle.ForeColor = &HFFFFFF
    
  TDBGrid1.MarqueeStyle = 4
    
  'Turn RecordSelectors on
  TDBGrid1.Splits(0).RecordSelectors = True
  TDBGrid1.LayoutFileName = dbDir + "\Layout.grx"
End Sub

Private Sub Form_Resize()
  'Make the grid to the size of the form
  TDBGrid1.Move 0, 0, ScaleWidth, ScaleHeight
End Sub

Private Sub Form_Unload(Cancel As Integer)
  'Unload the the pick form if left open
  Unload PickTable
  End
End Sub

Private Sub mFileOption_Click(Index As Integer)
  'User hits cancel button on Common dialog
  On Error GoTo ErrHandler
    Select Case Index
      Case 1
        If dbOpen Then
          Adodc1.Recordset.Close
          TDBGrid1.ClearFields
        End If

        'Set the database open flag to true
        dbOpen = True
        
        'Call common dialog
        CMDialog1.FileName = ""
        CMDialog1.Action = DLGOPEN
        
        Screen.MousePointer = vbHourglass
        
        'Procedure that opens the database
        OpenFile (CMDialog1.FileName)
            
        'Check for read-only
        If (CMDialog1.Flags And cdlOFNReadOnly) <> 0 Then
          Adodc1.Recordset.LockType = adLockReadOnly
          RecordTitle.Visible = False
        End If
            
        File$ = CMDialog1.FileName
          Call DisplayGrid(dbOpen, File$)

        'If close is selected
      Case 2
        If dbOpen = True Then
          Adodc1.Recordset.Close
          TDBGrid1.ClearFields
          mOptionsMenu(1).Checked = False
          mOptionsMenu(2).Checked = False
          TDBGrid1.MultipleLines = 0
          TDBGrid1.CellTips = 0
                
          Call DisplayGrid(False, "")
        End If
          dbOpen = False
            
      'If print is selected
      Case 4
        Dim prn As Printer
        Set prn = Printer   ' get the printer object.  default for now
    
        ' initialize printer object cursor and
        ' drawing characteristics
        '
        prn.CurrentX = 0
        prn.CurrentY = 0
        prn.DrawWidth = 1   ' grid lines will be 1 twip
        '
        ' print some text so we can see the grid nested within the
        ' page listing.
        '
        Dim prnFont As New StdFont
        prnFont.Name = "arial"
        prnFont.Size = 18
        Set prn.Font = prnFont

        prn.Print
        'Call the PrintGrid routine in GridPrn.Bas.
        '
        '   arguments include:  grid, recordset, form, printer, [maxrows]
        '
        '        [maxrows] is an optional argument which restricts the
        '                  maximum number of rows to be printed.
        '
        PrintGrid TDBGrid1, Adodc1.Recordset, Me, prn, 20
        ' We are just printing the grid and nothing else, so call the
        ' object EndDoc method to print it now.
        prn.EndDoc
            
      'If Exit is Chosen
      Case 6
        Unload MainForm
        End
    End Select

  Exit Sub

ErrHandler:
  Screen.MousePointer = Default
  Select Case Err
    Case 19
      Resume Next
    Case 32755
      Exit Sub
    Case 91
      Resume Next
    Case Else
      MsgBox Str$(Err) + " " + Error, vbExclamation
      Resume Next
    End Select
End Sub

Private Sub mHelpOption_Click(Index As Integer)
Dim temp
Dim HelpDir As String

On Error GoTo ErrorRoutine

HelpDir = "WinHelp.exe " + dbDir + "\Trubrwse.hlp"
  
Select Case Index
  'Case 1 will bring up the help file for True Browser.
  Case 1
    temp = Shell(HelpDir, vbNormalFocus)
  'Case 2 shows the about box for True Browser.
  Case 2
    About.Show 1
End Select
  
ErrorRoutine:
  If Err = 53 Then
    MsgBox "WinHelp.exe could not be found"
  End If
End Sub

Private Sub mLayoutmenu_Click(Index As Integer)
  Dim temp As Variant

  On Error GoTo ErrorHandler:

  temp = InputBox("Enter the Layout name.  Click Cancel to abort.")
  If temp = "" Then Exit Sub

  TDBGrid1.LayoutName = temp

  Select Case Index
    Case 0
      'Set the grids LayoutName to name given in the Inputbox
      TDBGrid1.LoadLayout
      
      'Set the menu options to be either checked or unchecked
      'depending on how the properties are set in the layout.
      If TDBGrid1.CellTips > 0 Then
        mOptionsMenu(2).Checked = True
      Else
        mOptionsMenu(2).Checked = False
      End If
      
      If TDBGrid1.MultipleLines = 1 Then
        mOptionsMenu(1).Checked = True
      Else
        mOptionsMenu(1).Checked = False
      End If
   Case 1
     TDBGrid1.Layouts.Add (temp)
   Case 3
     TDBGrid1.Layouts.Remove (temp)
   End Select

  Exit Sub
ErrorHandler:   ' Error-handling routine.
  Select Case Err.Number  ' Evaluate error number.
    Case 6166 'Layout File not specified
      MsgBox ("Layout does not exist")
      Exit Sub
    End Select
End Sub

Private Sub mOptionsMenu_Click(Index As Integer)
  'Toggle the check marks in the Option menu
  Select Case Index
    Case 1
      If TDBGrid1.MultipleLines = 1 Then
        TDBGrid1.MultipleLines = 0
        mOptionsMenu(Index).Checked = False
      Else
        TDBGrid1.MultipleLines = 1
        mOptionsMenu(Index).Checked = True
      End If
    Case 2
      If TDBGrid1.CellTips > 0 Then
        TDBGrid1.CellTips = 0
        mOptionsMenu(Index).Checked = False
      Else
        TDBGrid1.CellTips = 2
        mOptionsMenu(Index).Checked = True
      End If
  End Select
 
End Sub

Private Sub mQueryOption_Click(Index As Integer)
  TDBGrid1.HoldFields
  'Event calls SchemaForm and set the caption property of the form
  'to "Find..." which is what the SchemaForm uses to determine that its setup
  'will be for doing a Find
  Select Case Index
    Case 0
      SchemaForm.Caption = "Find..."
      SchemaForm.Show 1
    Case 2
      Screen.MousePointer = vbHourglass
      'If case 2 is chosen the database simply reverts to it status before the find
      curFind = ""
      Adodc1.RecordSource = "Select * From " + curTable + curSort
      Adodc1.Refresh
      Screen.MousePointer = Default
    End Select
  TDBGrid1.ClearFields
End Sub

Private Sub mRecordOption_Click(Index As Integer)
  'Event calls SchemaForm and set the caption property of the form,
  'this is what the SchemaForm uses to determine its setup
  'In this case the Add and Update sections of Schema form are used
  On Error GoTo ErrRecord
  
  Select Case Index
    Case 1
      SchemaForm.Caption = "Add..."
      SchemaForm.Show 1
    Case 2
      SchemaForm.Caption = "Update..."
      SchemaForm.Show 1
    Case 3
      'If case 3 is chosen the current record is deleted
      Adodc1.Recordset.Delete
      DoEvents
      If Adodc1.Recordset.EOF Then
        Adodc1.Recordset.MovePrevious
        TDBGrid1.SetFocus
      Else
        Adodc1.Recordset.MoveNext
      End If
    End Select
Exit Sub

ErrRecord:
    MsgBox Str$(Err) + " " + Error, vbExclamation
    If Adodc1.Recordset.EditMode = adEditDelete Then
        Adodc1.Recordset.CancelUpdate
    End If
    Exit Sub
End Sub

Private Sub mSortOption_Click(Index As Integer)
  TDBGrid1.HoldFields
  'This event sorts the database based on the option the user has checked
  'If there are more than 8 fields for a given database then a table is
  'brought up so that user can scroll through the rest of the fields

  Dim selField As String

  'In most cases an error here is becuase the user hit cancel on the More Fields form
  On Error GoTo ErrHandler2
    
  ' If the user selected the same option exit sub
  If mSortOption(Index).Checked Then Exit Sub
    
    Select Case Index
      'UnSorted
      Case 0
        selField = ""
        ClearCheck
        mSortOption(Index).Checked = True
        
        'More Fields...
      Case 11
        Call ShowTable("Choose Sort Field", Int(TDBGrid1.Columns.Count), selField, dbFields())
        ClearCheck
        
        'Any field displayed in the drop down menu list
      Case Else
        selField = mSortOption(Index).Caption
        ClearCheck
        mSortOption(Index).Checked = True

    End Select
    
    If selField <> "" Then
      curSort = " Order by [" + selField + "]"
    Else
      curSort = ""
    End If

    'Rebuild the Table
    Screen.MousePointer = vbHourglass
    Adodc1.RecordSource = "Select * From " + curTable + curFind + curSort
    Adodc1.Refresh
    Screen.MousePointer = Default
    
Exit Sub

ErrHandler2:
  'If error occurs remove any sort criteria from db
  Screen.MousePointer = Default
    
  'Check UnSort on Menu bar
  ClearCheck
  mSortOption(0).Checked = True

  'Clear sort criteria and refresh recordsource
  curSort = ""
  Adodc1.RecordSource = "Select * From " + curTable + curFind
  Adodc1.Refresh
  If Err = TableCancel Then
    Exit Sub
  Else
    MsgBox Str$(Err) + " " + Error, vbExclamation
    Exit Sub
  End If

  TDBGrid1.ClearFields
End Sub


