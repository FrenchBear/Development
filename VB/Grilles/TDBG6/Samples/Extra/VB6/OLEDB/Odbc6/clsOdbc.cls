VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsOdbc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Const AppName = "ODBC Data Source Class"
Const cbErrorMsgMax = 256
Const cbColNameMax = 256
Const cbValueMax = 256
Const MAX_WIDTH = 255

Dim henv As Long
Dim hdbc As Long
Dim hstmt As Long

Dim rgfRowStatus() As Integer
Dim ValueArray() As String
Dim ValueLength() As Long
Dim ValidColumn() As Integer

Private RETCODE As Integer
Private Tmpcode As Integer

Private WithEvents TDBG As TrueOleDBGrid60.TDBGrid
Attribute TDBG.VB_VarHelpID = -1

Public Sub Attach(G As TrueOleDBGrid60.TDBGrid)
    Dim i As Integer
    Set TDBG = G

    If hstmt = 0 Then Exit Sub
    
    ' Get the number of columns in the result set
    Dim pccol As Integer
    RETCODE = SQLNumResultCols(hstmt, pccol)
    If RETCODE <> SQL_SUCCESS Then
        DescribeError hdbc, hstmt
        Screen.MousePointer = vbDefault
        Exit Sub
    End If

    If pccol = 0 Then
        Screen.MousePointer = vbDefault
        MsgBox "Query executed, but no results returned", vbInformation, AppName
        Exit Sub
    End If
  
    ReDim ValidColumn(pccol)
    For i = 0 To pccol
        ValidColumn(i) = True
    Next i
    
    Dim rgbValueLen As Integer
    Dim szColName As String * cbColNameMax
    szColName = String(rgbValueLen, 0)
  
    ' Retrieve the metadata for each column in the result set
    ' and initialize the column widths of the grid.
    Dim GridCols As TrueOleDBGrid60.Columns
    Set GridCols = TDBG.Columns
    
    While GridCols.Count
        GridCols.Remove 0
    Wend

    Dim Col As TrueOleDBGrid60.Column
    For i = 0 To pccol - 1
        Set Col = GridCols.Add(i)
        Col.Visible = True
        Col.HeadFont.Bold = True
    Next i

    Dim pcbColName As Integer, pfSqlType As Integer, pibScale As Integer, pfNullable As Integer
    Dim pcbColDef As Long
    
    For i = 1 To pccol
        ' SQLDescribeCol returns the result descriptor - column name, type,
        ' precision, scale and nullability for one column.  Here it is used
        ' only to get the column name and width
        Attempt SQLDescribeCol(hstmt, i, szColName, cbColNameMax, pcbColName, pfSqlType, pcbColDef, pibScale, pfNullable), "SQLDescribeCol Failed"
        GridCols(i - 1).Caption = Left(szColName, pcbColName)
        If pcbColDef > MAX_WIDTH Then pcbColDef = MAX_WIDTH
        GridCols(i - 1).DataWidth = pcbColDef
    Next i
    
End Sub

Private Sub Attempt(ResultCode As Long, ErrorMessage As String)
    If (ResultCode <> SQL_SUCCESS) Then
        Screen.MousePointer = vbDefault
        DescribeError hdbc, hstmt
        Stop
    End If
End Sub

Private Sub DescribeError(ByVal hdbc As Long, ByVal hstmt As Long)
    
    ' Retrieves and displays error(s) returned by the ODBC calls
    Dim szSqlState As String * 16
    Dim szErrorMsg As String * cbErrorMsgMax
    Dim pcbErrorMsg As Integer
    Dim pfNativeError As Long

    szSqlState = String$(16, 0)
    szErrorMsg = String$(cbErrorMsgMax, 0)
  
    Do
        Tmpcode = SQLError(henv, hdbc, hstmt, szSqlState, pfNativeError, szErrorMsg, cbErrorMsgMax, pcbErrorMsg)
        Screen.MousePointer = vbDefault
        If Tmpcode = SQL_SUCCESS Or Tmpcode = SQL_SUCCESS_WITH_INFO Then
            If pcbErrorMsg = 0 Then
                MsgBox "Error -- No error information available", vbExclamation, AppName
            Else
                If Tmpcode = SQL_ERROR Then
                    MsgBox Left$(szErrorMsg, pcbErrorMsg), vbCritical, AppName
                Else
                    MsgBox Left$(szErrorMsg, pcbErrorMsg), vbExclamation, AppName
                End If
            End If
        End If
    Loop Until Tmpcode <> SQL_SUCCESS
End Sub

Public Sub Disconnect()
    ' Deallocate ODBC handles
    If hstmt = 0 Then Exit Sub
    Attempt SQLFreeStmt(hstmt, SQL_CLOSE), "Unable to free statment handle"
    Attempt SQLDisconnect(hdbc), "Unable to disconnect"
    Attempt SQLFreeConnect(hdbc), "Unable to free connection handle"
    Attempt SQLFreeEnv(henv), "Unable to free environment handle"
    hstmt = 0
End Sub

Public Sub Connect(hWnd As Long, szConnStrIn As String, szSqlStr As String)
    Screen.MousePointer = vbHourglass

    ' SQLAllocEnv allocates memory for an environment handle
    ' An application must call SQLAllocEnv prior to calling any ODBC function
    Attempt SQLAllocEnv(henv), "Cannot allocate environment handle"

    ' SQLAllocConnect allocates connection handle within the environment
    ' identified by henv.
    Attempt SQLAllocConnect(henv, hdbc), "Cannot allocate connection handle"

    Dim szConnStrOut As String * 100
    Dim pcbConnStrOut As Integer

    ' SQLDriverConnect loads a driver and establishes a connection to a data
    ' source.
    Tmpcode = SQLDriverConnect(hdbc, hWnd, szConnStrIn, Len(szConnStrIn), szConnStrOut, Len(szConnStrOut), pcbConnStrOut, SQL_DRIVER_NOPROMPT)

    If (Tmpcode = SQL_ERROR) Or (Tmpcode = SQL_INVALID_HANDLE) Then
        DescribeError hdbc, 0
        Screen.MousePointer = vbDefault
        Exit Sub
    ElseIf Tmpcode = SQL_NO_DATA_FOUND Then
        Screen.MousePointer = vbDefault
        Exit Sub
    End If

    ' SQLAllocStmt allocates memory for a statement handle associated
    ' with the connection hdbc
    Attempt SQLAllocStmt(hdbc, hstmt), "Cannot allocate statment handle"
        
    ' SQLSetStmtOption sets options related to hstmt
    Attempt SQLSetStmtOption(hstmt, SQL_USE_BOOKMARKS, SQL_UB_ON), "Driver does not support bookmarks"
    Attempt SQLSetStmtOption(hstmt, SQL_CURSOR_TYPE, SQL_CURSOR_KEYSET_DRIVEN), "Driver does not support keyset driven cursors"

    ' Fail silently if cursor is readonly
    Tmpcode = SQLSetStmtOption(hstmt, SQL_CONCURRENCY, SQL_CONCUR_LOCK)

    ' Execute prepared query
    RETCODE = SQLExecDirect(hstmt, szSqlStr, Len(szSqlStr))
    If RETCODE <> SQL_SUCCESS Then
        DescribeError hdbc, hstmt
        Screen.MousePointer = vbDefault
        Exit Sub
    End If

    Screen.MousePointer = vbDefault
End Sub

Private Sub TDBG_UnboundAddData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, NewRowBookmark As Variant)
    Dim NumCols As Integer
    Dim Bookmark As Long
    Dim hMemCol() As Long
    Dim lpCol() As Long

    If hstmt = 0 Then Exit Sub

    NumCols = RowBuf.ColumnCount
    ReDim ValueArray(NumCols)
    ReDim ValueLength(NumCols)
    ReDim Preserve rgfRowStatus(RowBuf.RowCount)
    ReDim hMemCol(NumCols)
    ReDim lpCol(NumCols)

    ' Set rowsize to one record
    RETCODE = SQLSetStmtOption(hstmt, SQL_ROWSET_SIZE, 1)
    If RETCODE <> SQL_SUCCESS Then GoTo AddError

    Dim icol As Integer
    For icol = 0 To NumCols - 1
        If Not IsNull(RowBuf.Value(0, icol)) Then
            ValueArray(icol) = RowBuf.Value(0, icol)
            ValueLength(icol) = Len(ValueArray(icol))
            
            ' Allocate and lock the memory
            hMemCol(icol) = GlobalAlloc(GMEM_MOVEABLE, ValueLength(icol))
            lpCol(icol) = GlobalLock(hMemCol(icol))
            
            ' Bind all columns
            RETCODE = SQLBindCol(hstmt, icol + 1, SQL_C_CHAR, ByVal lpCol(icol), ByVal ValueLength(icol), ValueLength(icol))
            If RETCODE <> SQL_SUCCESS Then GoTo AddError
            
            ' Copy a VB string to memory
            CopyMemory ByVal lpCol(icol), ByVal ValueArray(icol), ByVal ValueLength(icol)
            
        End If
    Next icol

    ' Execute the Add
    RETCODE = SQLSetPos(hstmt, 0, SQL_ADD, SQL_LOCK_NO_CHANGE)
    If RETCODE <> SQL_SUCCESS Then GoTo AddError
    
    ' Unbind all columns
    RETCODE = SQLFreeStmt(hstmt, SQL_UNBIND)
    If RETCODE <> SQL_SUCCESS Then GoTo AddError
        
    Dim pcrow As Long
    Dim pcbValue As Long
    If RETCODE = SQL_SUCCESS Or RETCODE = SQL_SUCCESS_WITH_INFO Then
        ' Add does not change the current cursor position
        ' therefore we have to do 'MoveLast'
        RETCODE = SQLExtendedFetch(hstmt, SQL_FETCH_LAST, 1, pcrow, rgfRowStatus(0))
        If RETCODE <> SQL_SUCCESS Then GoTo AddError
        
        ' If the row has been added successfully get its bookmark
        ' Column 0 contains bookmark
        RETCODE = SQLGetNumericData(hstmt, 0, SQL_C_BOOKMARK, Bookmark, Len(Bookmark), pcbValue)
        If RETCODE <> SQL_SUCCESS Then GoTo AddError
        NewRowBookmark = Bookmark
    End If
    
    ' Release all allocated memory
    For icol = 0 To NumCols - 1
        If hMemCol(icol) <> 0 Then
            If GlobalUnlock(hMemCol(icol)) Then MsgBox "Unable to Unlock Memory!" & vbCrLf & "(Column " & icol & ")", vbExclamation, AppName
            If GlobalFree(hMemCol(icol)) Then MsgBox "Unable to Free Memory!" & vbCrLf & "(Column " & icol & ")", vbExclamation, AppName
        End If
    Next icol
    
    Exit Sub
    
AddError:
    DescribeError hdbc, hstmt
    RETCODE = SQLFreeStmt(hstmt, SQL_UNBIND)
    RowBuf.RowCount = 0

End Sub

Private Sub TDBG_UnboundDeleteRow(Bookmark As Variant)

    If hstmt = 0 Then Exit Sub
    
    ' Set row set size to 1 (1 row)
    RETCODE = SQLSetStmtOption(hstmt, SQL_ROWSET_SIZE, 1)
    If RETCODE <> SQL_SUCCESS Then GoTo DeleteError

    ' Position to the row specified by Bookmark
    Dim pcrow As Long
    RETCODE = SQLExtendedFetch(hstmt, SQL_FETCH_BOOKMARK, CLng(Bookmark), pcrow, rgfRowStatus(0))
    If RETCODE <> SQL_SUCCESS Then GoTo DeleteError

    ' Execute Delete
    RETCODE = SQLSetPos(hstmt, 0, SQL_DELETE, SQL_LOCK_NO_CHANGE)
    If RETCODE = SQL_SUCCESS Then Exit Sub

DeleteError:
    DescribeError hdbc, hstmt
    ' Delete was unsuccessful, let Grid know
    Bookmark = Null

End Sub

Private Sub TDBG_UnboundReadDataEx(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, StartLocation As Variant, ByVal offset As Long, ApproximatePosition As Long)
    
    Dim NumCols As Integer
    Dim pcrow As Long
    Dim Bookmark As Long

    If hstmt = 0 Then GoTo NoData

    ReDim Preserve rgfRowStatus(RowBuf.RowCount)
    NumCols = RowBuf.ColumnCount

    ' Rowbuf.RowCount specifies how many rows we will retrieve
    ' at once.
    RETCODE = SQLSetStmtOption(hstmt, SQL_ROWSET_SIZE, RowBuf.RowCount)
    If RETCODE <> SQL_SUCCESS Then GoTo ReadError
    
    Dim fFetchType As Integer
    If IsNull(StartLocation) Then
        If offset < 0 Then
            ' Move to the last rowset
            fFetchType = SQL_FETCH_LAST
        Else
            ' Move to the first rowset
            fFetchType = SQL_FETCH_FIRST
        End If

        ' Following call will position the cursor before the first row of
        ' the first or last row set
        RETCODE = SQLExtendedFetch(hstmt, fFetchType, 0, pcrow, rgfRowStatus(0))

        If RETCODE = SQL_NO_DATA_FOUND Then GoTo NoData
        If RETCODE <> SQL_SUCCESS And RETCODE <> SQL_SUCCESS_WITH_INFO Then GoTo ReadError
    Else
        ' Go to the row specified by StartLocation
        RETCODE = SQLExtendedFetch(hstmt, SQL_FETCH_BOOKMARK, CLng(StartLocation), pcrow, rgfRowStatus(0))
            
        If RETCODE = SQL_NO_DATA_FOUND Or rgfRowStatus(0) = SQL_ROW_DELETED Then GoTo NoData
        If RETCODE <> SQL_SUCCESS Then GoTo ReadError

        If offset <> 0 Then
            ' Go to the row specified by current position + offset
            RETCODE = SQLExtendedFetch(hstmt, SQL_FETCH_RELATIVE, offset, pcrow, rgfRowStatus(0))
            If RETCODE <> SQL_SUCCESS Then GoTo ReadError
        End If
    End If
    
    Dim pcbValue As Long
    Dim rgbValue As String * cbValueMax
    Dim i As Integer
    Dim j As Integer
    For i = 0 To pcrow - 1
        ' Positioning within the current rowset
        RETCODE = SQLSetPos(hstmt, i + 1, SQL_POSITION, SQL_LOCK_NO_CHANGE)
        If RETCODE <> SQL_SUCCESS Then GoTo ReadError
      
        ' Get a bookmark for this row
        RETCODE = SQLGetNumericData(hstmt, 0, SQL_C_BOOKMARK, Bookmark, Len(Bookmark), pcbValue)
        If RETCODE <> SQL_SUCCESS Then GoTo ReadError

        RowBuf.Bookmark(i) = Bookmark

        Dim icol As Integer
        For j = 1 To NumCols
            ' Get data for column j and store it into rgbValue buffer
            icol = RowBuf.ColumnIndex(i, j - 1)
            RETCODE = SQLGetData(hstmt, icol + 1, SQL_C_CHAR, ByVal rgbValue, cbValueMax, pcbValue)
            If RETCODE <> SQL_SUCCESS And RETCODE <> SQL_SUCCESS_WITH_INFO Then
                If ValidColumn(j) = True Then
                    DescribeError hdbc, hstmt
                    ValidColumn(j) = False
                    If RETCODE = SQL_ERROR Then
                        MsgBox "Result Column " + Str$(j) + " will be ignored", vbExclamation, AppName
                    End If
                End If
            End If
            
            If RETCODE <> SQL_ERROR Then
                ' Display a default value in case of Null
                If pcbValue = SQL_NULL_DATA Then
                    RowBuf.Value(i, j - 1) = "NULL"
                Else
                    RowBuf.Value(i, j - 1) = Left(rgbValue, pcbValue)
                End If
            End If
        Next j
    Next i

    ' Tell Grid how many rows were fetched
    RowBuf.RowCount = pcrow
    
    Exit Sub

ReadError:
    DescribeError hdbc, hstmt

NoData:
    RowBuf.RowCount = 0

End Sub

Private Sub TDBG_UnboundWriteData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, WriteLocation As Variant)
    Dim NumCols As Integer
    Dim hMemCol() As Long
    Dim lpCol() As Long
    
    If hstmt = 0 Then Exit Sub

    NumCols = RowBuf.ColumnCount
    ReDim ValueArray(NumCols)
    ReDim ValueLength(NumCols)
    ReDim Preserve rgfRowStatus(RowBuf.RowCount)
    ReDim hMemCol(NumCols)
    ReDim lpCol(NumCols)

    ' Change the rowset to one row
    RETCODE = SQLSetStmtOption(hstmt, SQL_ROWSET_SIZE, 1)
    If RETCODE <> SQL_SUCCESS Then GoTo WriteError

    ' Position to the row specified by WriteLocation
    Dim pcrow As Long
    RETCODE = SQLExtendedFetch(hstmt, SQL_FETCH_BOOKMARK, CLng(WriteLocation), pcrow, rgfRowStatus(0))
    If RETCODE <> SQL_SUCCESS Then GoTo WriteError

    Dim icol As Integer
    For icol = 0 To NumCols - 1
        If Not IsNull(RowBuf.Value(0, icol)) Then
            ValueArray(icol) = RowBuf.Value(0, icol)
            ValueLength(icol) = Len(ValueArray(icol))
            
            ' It is possible to pass the address of a Visual Basic string to SQLBindCol
            ' but as strings may be moved in memory by VB, it is not safe to use
            ' SQLBindCol without first locking the memory.
            hMemCol(icol) = GlobalAlloc(GMEM_MOVEABLE, ValueLength(icol))
            lpCol(icol) = GlobalLock(hMemCol(icol))
            
            ' Bind all columns that we will update
            RETCODE = SQLBindCol(hstmt, icol + 1, SQL_C_CHAR, ByVal lpCol(icol), ByVal ValueLength(icol), ValueLength(icol))
            If RETCODE <> SQL_SUCCESS Then GoTo WriteError

            ' Copy a VB string to memory
            Call CopyMemory(ByVal lpCol(icol), ByVal ValueArray(icol), ByVal ValueLength(icol))
            
        End If
    Next icol
    
    ' Execute the update
    RETCODE = SQLSetPos(hstmt, 1, SQL_UPDATE, SQL_LOCK_NO_CHANGE)
    If RETCODE <> SQL_SUCCESS Then GoTo WriteError
    
    ' Unbind all columns
    RETCODE = SQLFreeStmt(hstmt, SQL_UNBIND)
    If RETCODE <> SQL_SUCCESS Then GoTo WriteError
    
    ' Release all allocated memory
    For icol = 0 To NumCols - 1
        If hMemCol(icol) <> 0 Then
            If GlobalUnlock(hMemCol(icol)) Then MsgBox "Unable to Unlock Memory!" & vbCrLf & "(Column " & icol & ")", vbExclamation, AppName
            If GlobalFree(hMemCol(icol)) Then MsgBox "Unable to Free Memory!" & vbCrLf & "(Column " & icol & ")", vbExclamation, AppName
        End If
    Next icol
      
    Exit Sub

WriteError:
  DescribeError hdbc, hstmt
  RETCODE = SQLFreeStmt(hstmt, SQL_UNBIND)
  RowBuf.RowCount = 0

End Sub


