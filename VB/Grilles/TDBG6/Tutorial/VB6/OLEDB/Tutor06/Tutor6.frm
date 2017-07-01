VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 6"
   ClientHeight    =   3255
   ClientLeft      =   1275
   ClientTop       =   1620
   ClientWidth     =   7305
   LinkTopic       =   "Form1"
   ScaleHeight     =   3255
   ScaleWidth      =   7305
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   120
      Width           =   7095
      _ExtentX        =   12515
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
      RecordSource    =   "SELECT * FROM Contacts INNER JOIN Customers ON Contacts.UserCode = Customers.UserCode"
      Caption         =   "Customer Contact"
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
      Bindings        =   "Tutor6.frx":0000
      Height          =   2535
      Left            =   120
      OleObjectBlob   =   "Tutor6.frx":0015
      TabIndex        =   0
      Top             =   600
      Width           =   7095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim RSClone As ADODB.Recordset

Private Sub Form_Load()
    Adodc1.Refresh
    Set RSClone = Adodc1.Recordset.Clone()
End Sub

Private Sub TDBGrid1_UnboundColumnFetch(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
    RSClone.Bookmark = Bookmark
    Value = RSClone("FirstName") & " " & RSClone("LastName")
End Sub
