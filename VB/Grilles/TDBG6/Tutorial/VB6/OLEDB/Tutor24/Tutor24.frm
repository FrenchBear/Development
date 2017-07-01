VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 24"
   ClientHeight    =   6360
   ClientLeft      =   1185
   ClientTop       =   1470
   ClientWidth     =   9960
   LinkTopic       =   "Form1"
   ScaleHeight     =   6360
   ScaleWidth      =   9960
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   615
      Left            =   120
      Top             =   5520
      Width           =   9735
      _ExtentX        =   17171
      _ExtentY        =   1085
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
      Height          =   6015
      Left            =   120
      OleObjectBlob   =   "Tutor24.frx":0000
      TabIndex        =   0
      Top             =   240
      Width           =   9735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Dim strCn As String
Dim strSh As String

' Create a ConnectionString.
strCn = "Provider=MSDataShape.1;Data Source=TDBGDemo;Data Provider=MSDASQL"

' Create a Shape command.
strSh = "SHAPE {SELECT First, Last, Country FROM `Composer`}  AS Composer " & _
"APPEND ({SELECT Last, Opus FROM `Opus`}  AS Opus RELATE " & _
"Last TO Last) AS Opus"

' Assign the ConnectionString to an ADO Data Control's
' ConnectionString property, and the Shape command to the
' control's RecordSource property.
With Adodc1
    .ConnectionString = strCn
    .RecordSource = strSh
    .Visible = False
End With
' Set the grid control's DataSource property to the ADO Data control.
Set TDBGrid1.DataSource = Adodc1


With TDBGrid1
    .ExtendRightColumn = True
    .Styles("Normal").WrapText = True
End With

End Sub
