VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 1"
   ClientHeight    =   3075
   ClientLeft      =   1410
   ClientTop       =   1500
   ClientWidth     =   5565
   LinkTopic       =   "Form1"
   ScaleHeight     =   3075
   ScaleWidth      =   5565
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor1.frx":0000
      Height          =   2295
      Left            =   120
      OleObjectBlob   =   "Tutor1.frx":0014
      TabIndex        =   0
      Top             =   600
      Width           =   5295
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

