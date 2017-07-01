VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 23"
   ClientHeight    =   3750
   ClientLeft      =   1410
   ClientTop       =   1635
   ClientWidth     =   5565
   LinkTopic       =   "Form1"
   ScaleHeight     =   3750
   ScaleWidth      =   5565
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor23.frx":0000
      Height          =   2415
      Left            =   120
      OleObjectBlob   =   "Tutor23.frx":0014
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
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   "C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   420
      Left            =   120
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Composer"
      Top             =   120
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
' Initialize the Data control
    Data1.Refresh
    
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


