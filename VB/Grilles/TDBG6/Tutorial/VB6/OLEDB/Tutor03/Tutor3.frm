VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 3"
   ClientHeight    =   4695
   ClientLeft      =   1275
   ClientTop       =   1545
   ClientWidth     =   5805
   LinkTopic       =   "Form1"
   ScaleHeight     =   4695
   ScaleWidth      =   5805
   Begin MSAdodcLib.Adodc Adodc2 
      Height          =   375
      Left            =   120
      Top             =   2520
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
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
      Connect         =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "Opus"
      Caption         =   "Their Compositions"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   120
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
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
      Connect         =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "Composer"
      Caption         =   "Composers"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid2 
      Bindings        =   "Tutor3.frx":0000
      Height          =   1575
      Left            =   120
      OleObjectBlob   =   "Tutor3.frx":0015
      TabIndex        =   1
      Top             =   3000
      Width           =   5535
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor3.frx":262C
      Height          =   1815
      Left            =   120
      OleObjectBlob   =   "Tutor3.frx":2641
      TabIndex        =   0
      Top             =   600
      Width           =   5535
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub TDBGrid1_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
' A query is performed by taking the "LAST" name field from
' the Data1 control and building an SQL query on the LAST
' name field in the Data2 (compositions) file.
    
' The Second grid will respond automatically when the Data
' Control causes the change.  We put up an hourglass so that
' there's a bit of feedback if Access is slow at finishing
' the query.

    Dim lastname$
    Dim bk1 As String, bk2 As String
    
' To reliably compare bookmarks, you must first convert them
' into strings.  You will also need to test for Null
' Bookmarks being passed by LastRow.  This will occur on the
' initial display of the grid and if the user places the
' cursor on the AddNewRow and then moves off.

    If IsNull(LastRow) Then
        bk1 = ""
    Else
        bk1 = LastRow
    End If
        
    bk2 = TDBGrid1.Bookmark
     
    If bk1 <> bk2 Then
        Screen.MousePointer = vbHourglass
        
        lastname$ = Adodc1.Recordset("Last")
        Adodc2.RecordSource = "SELECT * FROM OPUS WHERE LAST = " _
                             + Chr$(34) + lastname$ + Chr$(34)
        Adodc2.Refresh
    
        Screen.MousePointer = vbDefault
    End If

End Sub

