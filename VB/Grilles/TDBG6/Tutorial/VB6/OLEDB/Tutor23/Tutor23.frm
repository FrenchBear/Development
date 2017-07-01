VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 23"
   ClientHeight    =   3750
   ClientLeft      =   1410
   ClientTop       =   1635
   ClientWidth     =   5565
   LinkTopic       =   "Form1"
   ScaleHeight     =   3750
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
      Bindings        =   "Tutor23.frx":0000
      Height          =   2415
      Left            =   120
      OleObjectBlob   =   "Tutor23.frx":0015
      TabIndex        =   0
      Top             =   600
      Width           =   5295
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Export Selected Rows"
      Height          =   495
      Left            =   3960
      TabIndex        =   3
      Top             =   3120
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Export HTML"
      Height          =   495
      Left            =   2640
      TabIndex        =   2
      Top             =   3120
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Print Preview"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   3120
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
' Initialize the Data control
    Adodc1.Refresh
    
' Allow user to change the column order
    TDBGrid1.AllowColMove = True
    
' Change the presentation of the grid
    With TDBGrid1.Columns
        .Item("Country").BackColor = vbCyan
        .Item("Country").Font.Name = "Times New Roman"
        .Item("Last").NumberFormat = ">"
        .Item("Last").ForeColor = vbRed
    End With
    
    With TDBGrid1.HeadingStyle
        .Font.Bold = True
        .BackColor = vbBlue
        .ForeColor = vbYellow
    End With
End Sub

Private Sub Command1_Click()
    With TDBGrid1.PrintInfo
        ' Set the page header
        .PageHeaderFont.Italic = True
        .PageHeader = "Composers table"
        
        ' Column headers will be on every page
        .RepeatColumnHeaders = True
        
        ' Display page numbers (centered)
        .PageFooter = "\tPage: \p"
        ' Invoke Print Preview
        .PrintPreview
    End With
End Sub

Private Sub Command2_Click()
' Depending on the Check1.Value
' the grid will export all or just selected rows
    TDBGrid1.ExportToFile App.Path & _
                "\Tutor23.html", False, Check1.Value
End Sub


