VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 14"
   ClientHeight    =   4620
   ClientLeft      =   1425
   ClientTop       =   1620
   ClientWidth     =   5505
   LinkTopic       =   "Form1"
   ScaleHeight     =   4620
   ScaleWidth      =   5505
   Begin VB.TextBox Text1 
      Height          =   855
      Left            =   120
      MultiLine       =   -1  'True
      OLEDragMode     =   1  'Automatic
      OLEDropMode     =   2  'Automatic
      TabIndex        =   1
      Text            =   "Tutor14.frx":0000
      Top             =   3600
      Width           =   5295
   End
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor14.frx":00B7
      Height          =   3015
      Left            =   120
      OleObjectBlob   =   "Tutor14.frx":00CB
      TabIndex        =   0
      Top             =   480
      Width           =   5295
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   "C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
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

