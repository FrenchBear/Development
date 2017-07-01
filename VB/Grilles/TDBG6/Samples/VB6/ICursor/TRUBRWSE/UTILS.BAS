Attribute VB_Name = "UTILS"
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

'TBrowser Constants
Global Const DLGOPEN = 1 'Dialog action, Open
Global Const DLGSVAS = 2 'Dialog action, Save As
Global Const DB_ERROR = 99

'Database constants
Global Const MAX_FIELDS = 50
Global Const MAX_INDEXES = 50
Global Const MAX_TABLES = 50
Global noRows As Integer

'Global Variables
Global dbFields(1 To MAX_FIELDS) As String
Global curTable As String
Global curSort As String
Global curFind As String
Global selList(0 To 50) As String
Global selTable As String
Global selCancel As Integer
Global dbOpen As Integer

'User defined errors
Global Const TableCancel = 32000
Global Const InvalidDB = 31000
Global Const SQLError = 30000
Global Const ISAM_Error = 3170

' System menu manipulation

Global Const MF_BYPOSITION = &H400
#If Win16 Then
 Declare Function GetSystemMenu Lib "User" (ByVal hwnd As Integer, ByVal bRevert As Integer) As Integer
 Declare Function RemoveMenu Lib "User" (ByVal hMenu As Integer, ByVal nPosition As Integer, ByVal wFlags As Integer) As Integer
#ElseIf Win32 Then
 Declare Function GetSystemMenu Lib "user32" (ByVal hwnd As Long, ByVal bRevert As Integer) As Integer
 Declare Function RemoveMenu Lib "user32" (ByVal hMenu As Long, ByVal nPosition As Integer, ByVal wFlags As Integer) As Integer
#End If

' Miscellaneous functions
#If Win16 Then
 Declare Function GetFocus Lib "User" () As Integer
 Declare Function SendMessage Lib "User" (ByVal hwnd As Integer, ByVal wMsg As Integer, ByVal wParam As Integer, lParam As Any) As Long
#ElseIf Win32 Then
 Declare Function GetFocus Lib "user32" () As Integer
 Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
#End If

Type MULTIKEYHELP
    mkSize As Integer
    mkKeylist As String * 1
    szKeyphrase As String * 253
End Type

Sub CenterForm(F As Form)

' Center the specified form within the screen

    F.Move (Screen.Width - F.Width) \ 2, (Screen.Height - F.Height) \ 2

End Sub

Sub DbaseOpen()

'Uses current path and file to set DatabaseName and RecordSource
'Uses ShowTable to get dBASE format

    Dim FileType As String
    ReDim dbTypeList(1 To 4) As String

    MainForm.Data1.DatabaseName = CurDir$
    dbTypeList(1) = "dBASE IV"
    dbTypeList(2) = "dBASE III"
    dbTypeList(3) = "FoxPro 2.0"
    dbTypeList(4) = "FoxPro 2.5"

    'Display list for user to choose from
    Call ShowTable("dBASE Format", 4, FileType, dbTypeList())
    MainForm.Data1.Connect = FileType + ";"
    MainForm.Data1.RecordSource = curTable
    
End Sub

Sub GetFields()
    
'Gets all the fields so that the Sort Menu item can be set up
    Dim ct As Integer
    
    'Loop through all the valid database fields
    For ct = 0 To MainForm.Data1.Database.TableDefs(curTable).Fields.Count - 1
        dbFields(ct + 1) = MainForm.Data1.Database.TableDefs(curTable).Fields(ct).Name
        If ct < 8 Then
            'Set the Caption, Visible, and Checked properties
            MainForm.mSortOption(ct + 2).Caption = dbFields(ct + 1)
            MainForm.mSortOption(ct + 2).Visible = True
            MainForm.mSortOption(ct + 2).Checked = False
        ElseIf ct = 8 Then
            'Once the # of fields exceeds 8 then display the
            'more fields option
            MainForm.mSortOption(ct + 2).Visible = True
            MainForm.mSortOption(ct + 3).Visible = True
            MainForm.mSortOption(ct + 3).Checked = False
        End If
    Next ct

    'If there are not at least 8 fields, hide the rest from the user
    For ct2 = (ct + 2) To 10
        MainForm.mSortOption(ct2).Visible = False
    Next ct2

End Sub

Sub GetTables()

'Gets all the Tables for a given DatabaseName

    Dim noTables As Integer
    ReDim dbTables(1 To 15) As String

    ct2% = 1
    For ct% = 0 To MainForm.Data1.Database.TableDefs.Count - 1
        If (MainForm.Data1.Database.TableDefs(ct%).Attributes And dbSystemObject) = 0 Then
            dbTables(ct2%) = MainForm.Data1.Database.TableDefs(ct%).Name
            ct2% = ct2% + 1
        End If
    Next ct%
    noTables = ct2% - 1
    
    'Give the user a list from with which to pick a table
    Call ShowTable("Table List", noTables, curTable, dbTables())
    MainForm.Data1.RecordSource = curTable
    MainForm.Data1.Refresh

End Sub

Sub OpenFile(File As String)
    
'This is the main procedure for Opening the database files.
'If you want to add support for additional file formats then you need to
'add a case statement with the extension of your database file.
'In the case statement you need to set the Data Control Connect, RecordSource, and
'database name properties.  You can make use of the Extract functions, and the GetTable
'function if needed.  The only other change is to add the extension in the Common Dialog

Dim FileBase As String

On Error GoTo ErrHandler2

    'Resets all the Data Control properties
    MainForm.Data1.Connect = ""
    MainForm.Data1.RecordSource = ""
    MainForm.Data1.DatabaseName = ""
    
    'Reset all the Selection criteria
    curTable = ""
    curFind = ""
    curSort = ""

    'Extracts the file name from the Common Dialog FileName property
    FileBase = ExtractBase(File)

    Select Case UCase$(Right$(File, 3))
        Case "MDB"
            MainForm.Data1.DatabaseName = File
            MainForm.Data1.Refresh
            GetTables
        Case "DBF"
            curTable = FileBase
            DbaseOpen
        Case ".DB"
            MainForm.Data1.Connect = "Paradox 3.X;"
            MainForm.Data1.DatabaseName = CurDir$
            MainForm.Data1.RecordSource = FileBase
            curTable = FileBase
        Case "DDF"
            MainForm.Data1.DatabaseName = CurDir$ + "\FILE.DDF"
            MainForm.Data1.Connect = "Btrieve;"
            MainForm.Data1.Refresh
            GetTables
        Case Else
            'If a valid selection is not chosen generate an error message
            selTable = ""
            Error InvalidDB

    End Select
    MainForm.Data1.Refresh
    
    'Setup sort menu
    GetFields

Exit Sub

ErrHandler2:
    Screen.MousePointer = Default
    Select Case Err
        Case TableCancel
            dbOpen = False
            Exit Sub
        Case InvalidDB
            MsgBox "Open File Error : 'Database Type not supported'", vbExclamation
            dbOpen = False
            Exit Sub
        Case Else
            MsgBox "Open File Error " + Str$(Err) + " : " + Error, vbExclamation
            dbOpen = False
            Exit Sub
   End Select

End Sub

Sub ShowTable(Heading As String, Rownum As Integer, Choice As String, TableList() As String)
'ShowTable can be used in a variety of places where you need the user to pick from
'a certain list of options.  So far it is used to pick a Sort field, dBASE format,
'several database type tables.  You need to provide a heading for the form
'the number of rows that your array is, a value for the returned selection, and
'the actual list of values to choose from

    'Transfers array
    For ct% = 1 To Rownum
        selList(ct%) = TableList(ct%)
    Next ct%

    'Initializes selCancel
    selCancel = False

    'Sets various values
    noRows = Rownum
   
    Screen.MousePointer = Default
    PickTable.Show 1
   
    If Not selCancel Then
        'If selection was successful then Choice contains that selection
        Choice = selTable
    Else
        'If selection failed set dbOpen to False
        Screen.MousePointer = Default
        Error TableCancel
        Exit Sub
    End If

End Sub

Sub SQLFieldValue(DType As Integer, FValue As String)
    ' Trim leading and trailing spaces
    FValue = Trim$(FValue)

    ' Check if FValue starts with "=", "<>", ">",
    ' ">=", "<" or "<'"
    L1$ = Left$(FValue, 1)
    L2$ = Left$(FValue, 2)
    If L2$ = "<>" Or L2$ = ">=" Or L2$ = "<=" Then
        SQL$ = L2$
        FValue = LTrim$(Mid$(FValue, 3))
    ElseIf L1$ = "=" Or L1$ = ">" Or L1$ = "<" Then
        SQL$ = L1$
        FValue = LTrim$(Mid$(FValue, 2))
    Else
        SQL$ = "="
    End If

    Select Case DType
        Case dbBoolean
            U$ = UCase$(FValue)
            If U$ = "T" Or U$ = "TRUE" Or U$ = "YES" Or U$ = "Y" Or U$ = "-1" Then
                FValue = SQL$ + "-1"
            Else
                FValue = SQL$ + "0"
            End If
        Case dbInteger, dbLong, dbCurrency, dbSingle, dbDouble
            FValue = SQL$ + FValue
        Case dbDate
            FValue = SQL$ + "#" + FValue + "#"
        Case dbByte, dbText, dbMemo
            FValue = SQL$ + Chr$(34) + FValue + Chr$(34)
        Case Else
            FType = DB_ERROR
            FValue = ""
    End Select
End Sub

