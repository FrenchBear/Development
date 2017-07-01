VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1: True DBGrid Pro 6.0 for VB 6 - Tutorial 2"
   ClientHeight    =   3945
   ClientLeft      =   1485
   ClientTop       =   1620
   ClientWidth     =   5535
   LinkTopic       =   "Form1"
   ScaleHeight     =   3945
   ScaleWidth      =   5535
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor2.frx":0000
      Height          =   2055
      Left            =   120
      OleObjectBlob   =   "Tutor2.frx":0014
      TabIndex        =   0
      Top             =   600
      Width           =   5295
   End
   Begin VB.TextBox Text1 
      Height          =   615
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Tutor2.frx":2604
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
      RecordSource    =   "Customer"
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

Private Sub Command1_Click()
' Execute the SQL statement in Text1, and trigger an error
' message if something goes wrong.
    On Error GoTo SQLErr
    
    Data1.RecordSource = Text1.Text
    Data1.Refresh
    TDBGrid1.SetFocus
    Exit Sub

SQLErr:
    MsgBox "Error Executing SQL Statement"
End Sub
