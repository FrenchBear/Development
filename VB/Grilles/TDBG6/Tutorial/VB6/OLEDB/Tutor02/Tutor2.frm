VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1: True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 2"
   ClientHeight    =   3945
   ClientLeft      =   1485
   ClientTop       =   1620
   ClientWidth     =   5535
   LinkTopic       =   "Form1"
   ScaleHeight     =   3945
   ScaleWidth      =   5535
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
      RecordSource    =   "Customer"
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
      Bindings        =   "Tutor2.frx":0000
      Height          =   2055
      Left            =   120
      OleObjectBlob   =   "Tutor2.frx":0015
      TabIndex        =   0
      Top             =   600
      Width           =   5295
   End
   Begin VB.TextBox Text1 
      Height          =   615
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Tutor2.frx":262C
      Top             =   3240
      Width           =   5295
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Execute SQL"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   2760
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
' Execute the SQL statement in Text1, and trigger an error
' message if something goes wrong.
    On Error GoTo SQLErr
    
    Adodc1.RecordSource = Text1.Text
    Adodc1.Refresh
    TDBGrid1.SetFocus
    Exit Sub

SQLErr:
    MsgBox "Error Executing SQL Statement"
End Sub

