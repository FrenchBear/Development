VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ODBC API to XArray"
   ClientHeight    =   5655
   ClientLeft      =   1140
   ClientTop       =   1635
   ClientWidth     =   7200
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "APIToX.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5655
   ScaleWidth      =   7200
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   1440
      TabIndex        =   3
      Text            =   "SELECT * FROM Composer"
      Top             =   4560
      Width           =   5655
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Text            =   "DSN=TEST"
      Top             =   4560
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Populate"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   5040
      Width           =   1215
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   4335
      Left            =   120
      OleObjectBlob   =   "APIToX.frx":0442
      TabIndex        =   0
      Top             =   120
      Width           =   6975
   End
   Begin VB.Label Label2 
      Caption         =   "row(s) retrieved"
      Height          =   255
      Left            =   2520
      TabIndex        =   5
      Top             =   5160
      Width           =   1335
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1440
      TabIndex        =   4
      Top             =   5160
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim x As New XArrayDB

Dim henv As Long
Dim hdbc As Long
Dim hstmt As Long

Private Sub Command1_Click()
    Screen.MousePointer = vbHourglass
    
    SQLAllocEnv henv
    SQLAllocConnect henv, hdbc
    
    Dim szConnStrOut As String * 1024
    Dim bufLen As Integer
    Dim pcbConnStrOut As Integer
    Dim szConnStrIn As String
    szConnStrIn = Text1.Text
    
    ' Connect to the ODBC driver
    SQLDriverConnect hdbc, Me.hWnd, szConnStrIn, Len(szConnStrIn), szConnStrOut, Len(szConnStrOut), pcbConnStrOut, SQL_DRIVER_NOPROMPT
    
    SQLAllocStmt hdbc, hstmt
    
    Dim szSqlStr As String
    szSqlStr = Text2.Text
    
    ' Execute SQL statement
    SQLExecDirect hstmt, szSqlStr, Len(szSqlStr)
   
    Dim nCols As Integer
    
    ' Get number of columns
    SQLNumResultCols hstmt, nCols
    
    Dim row As Long, col As Long
    Dim szVal As String * 255
    ' Redim the XArray to 1000 rows initially.  Following code will cut down on ReDim
    ' considerably.  Because the XArray preserves data on ReDim it is very resource and
    ' time consuming.
    ' A common mistake is to put x.ReDim into the main loop and do the ReDim for every row.
    ' If we have for example 1000 rows, the ReDim is executed (and data realocated) 1000 times.
    ' With this algorithm we ReDim only once or twice.  For 5000 rows we ReDim about
    ' 5 - 6 times (as opposed to 5000!) Use this code whenever you don't know number of rows
    ' up front.
    x.ReDim 0, 999, 0, nCols - 1
    
    While SQLFetch(hstmt) = 0
        row = row + 1
        If row Mod 10 = 0 Then
            Label1.Caption = CStr(row)
            DoEvents
        End If
        ' If we run out of space, make room for another 1000 rows
        If row >= x.Count(1) Then x.ReDim 0, x.Count(1) + 999, 0, nCols - 1
        
        For col = 0 To nCols - 1
            szVal = ""
            ' Retrieve the data
            SQLGetData hstmt, col + 1, SQL_C_CHAR, szVal, 255, 0
            x.Value(row - 1, col) = Trim(szVal)
        Next col
    Wend
    ' One last ReDim - for the actual number of records
    x.ReDim 0, row - 1, 0, nCols - 1
    Label1.Caption = CStr(row)
    
    Screen.MousePointer = vbDefault
    
    Dim cs As TrueOleDBGrid60.Columns
    Dim c As TrueOleDBGrid60.Column
    
    Set cs = TDBGrid1.Columns
    ' Remove all columns initially
    While cs.Count
        cs.Remove 0
    Wend
    
    Dim pcbColName As Integer
    Dim szColName As String * 256
    Dim i As Integer
    
    ' Add only necessary columns
    For i = 0 To nCols - 1
        Set c = cs.Add(i)
        c.Visible = True
        
        ' Get the caption (field name)
        SQLDescribeCol hstmt, i + 1, szColName, 256, pcbColName, 0, 0, 0, 0
        c.Caption = Left(szColName, pcbColName)
        c.ButtonHeader = True
    Next i
    
    Set TDBGrid1.Array = x
    ' Reinitialize the grid
    TDBGrid1.Bookmark = Null
    TDBGrid1.ReBind

    ' Deallocate ODBC handles
    If hstmt = 0 Then Exit Sub
    SQLFreeStmt hstmt, SQL_CLOSE
    SQLDisconnect hdbc
    SQLFreeConnect hdbc
    SQLFreeEnv henv
    hstmt = 0

    TDBGrid1.SetFocus
End Sub

Private Sub TDBGrid1_FetchCellTips(ByVal SplitIndex As Integer, ByVal ColIndex As Integer, ByVal RowIndex As Long, CellTip As String, ByVal FullyDisplayed As Boolean, ByVal TipStyle As TrueOleDBGrid60.StyleDisp)
    CellTip = "Click the column header to sort"
End Sub

Private Sub TDBGrid1_HeadClick(ByVal ColIndex As Integer)
    Screen.MousePointer = vbHourglass
    ' Sort ascending on clicked column
    x.QuickSort x.LowerBound(1), x.UpperBound(1), ColIndex, XORDER_ASCEND, XTYPE_STRING
    TDBGrid1.Refresh
    Screen.MousePointer = vbDefault
End Sub
