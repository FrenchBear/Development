VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 22"
   ClientHeight    =   4050
   ClientLeft      =   1500
   ClientTop       =   1635
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   ScaleHeight     =   4050
   ScaleWidth      =   6585
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   120
      Width           =   6375
      _ExtentX        =   11245
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
      Bindings        =   "Tutor22.frx":0000
      Height          =   2775
      Left            =   120
      OleObjectBlob   =   "Tutor22.frx":0015
      TabIndex        =   0
      Top             =   600
      Width           =   6375
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Retrieve APEX Layout"
      Height          =   495
      Left            =   4560
      TabIndex        =   3
      Top             =   3480
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Save Layout"
      Height          =   495
      Left            =   2280
      TabIndex        =   2
      Top             =   3480
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Retrieve Layout"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   3480
      Width           =   1935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
On Error GoTo Err:
' Load the layout
    TDBGrid1.LayoutName = "TestLayout"
    TDBGrid1.LayoutFileName = App.Path & "\Tutor22.grx"
    TDBGrid1.LoadLayout
    Exit Sub
Err:
    MsgBox Err.Description
End Sub

Private Sub Command2_Click()
' Save current layout
    TDBGrid1.LayoutFileName = App.Path & "\Tutor22.grx"
    TDBGrid1.Layouts.Add "TestLayout"
End Sub

Private Sub Command3_Click()
' Load layout from APEX
    TDBGrid1.LayoutName = "APEX"
    
' Start the download
    TDBGrid1.LayoutURL = "ftp://ftp.apexsc.com/pub/files/tutor22.grx"
    
' Set the order of records (by Country)
    Adodc1.RecordSource = "Select * From Composer Order By Country"
    Adodc1.Refresh
End Sub

Private Sub TDBGrid1_LayoutReady()
' Load layout as soon as it is available
    TDBGrid1.LoadLayout
End Sub
