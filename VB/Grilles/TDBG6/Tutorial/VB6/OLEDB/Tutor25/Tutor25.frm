VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 25"
   ClientHeight    =   4200
   ClientLeft      =   1485
   ClientTop       =   1650
   ClientWidth     =   7200
   LinkTopic       =   "Form1"
   ScaleHeight     =   4200
   ScaleWidth      =   7200
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor25.frx":0000
      Height          =   3495
      Left            =   120
      OleObjectBlob   =   "Tutor25.frx":0015
      TabIndex        =   0
      Top             =   600
      Width           =   6975
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   120
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
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
      Connect         =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\Tutorial\TDBGDemo.mdb"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\Tutorial\TDBGDemo.mdb"
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
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub TDBGrid1_GroupColMove(ByVal Position As Integer, _
                                ByVal ColIndex As Integer, Cancel As Integer)
    Dim strSort As String
    Dim Col As TrueOleDBGrid60.Column
    
' Loop through GroupColumns collection and construct
' the sort string for the Sort property of the Recordset
    For Each Col In TDBGrid1.GroupColumns
        If strSort <> vbNullString Then strSort = strSort & ", "
        strSort = strSort & "[" & Col.DataField & "]"
    Next Col

    TDBGrid1.HoldFields
    Adodc1.Recordset.Sort = strSort
End Sub
