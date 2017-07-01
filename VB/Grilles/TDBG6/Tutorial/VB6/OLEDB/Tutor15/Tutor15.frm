VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 15"
   ClientHeight    =   3120
   ClientLeft      =   1440
   ClientTop       =   1725
   ClientWidth     =   5565
   LinkTopic       =   "Form1"
   ScaleHeight     =   3120
   ScaleWidth      =   5565
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   120
      Width           =   5295
      _ExtentX        =   9340
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
      Caption         =   "Adodc1"
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
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor15.frx":0000
      Height          =   2415
      Left            =   120
      OleObjectBlob   =   "Tutor15.frx":0015
      TabIndex        =   0
      Top             =   600
      Width           =   5295
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
' Before modifying the grid's properties, make sure the
' grid is initialized by refreshing the Data control.
    Adodc1.Refresh

' Create an additional split:
    Dim S As TrueOleDBGrid60.Split
    Set S = TDBGrid1.Splits.Add(0)

' Hide all columns in the leftmost split, Splits(0),
' except for columns 0 and 1
    Dim C As TrueOleDBGrid60.Column
    Dim Cols As TrueOleDBGrid60.Columns
    Set Cols = TDBGrid1.Splits(0).Columns
    For Each C In Cols
        C.Visible = False
    Next C
    Cols(0).Visible = True
    Cols(1).Visible = True

' Configure Splits(0) to display exactly two columns,
' and disable resizing
    With TDBGrid1.Splits(0)
        .SizeMode = dbgNumberOfColumns
        .Size = 2
        .AllowSizing = False
    End With

' Usually, if you fix columns 0 and 1 from scrolling
' in a split, you will want to make them invisible in
' other splits:
    Set Cols = TDBGrid1.Splits(1).Columns
    Cols(0).Visible = False
    Cols(1).Visible = False

' Turn off the record selectors in Split 1:
      TDBGrid1.Splits(1).RecordSelectors = False
End Sub
