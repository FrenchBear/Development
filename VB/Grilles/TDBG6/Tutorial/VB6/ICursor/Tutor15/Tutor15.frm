VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 15"
   ClientHeight    =   3120
   ClientLeft      =   1440
   ClientTop       =   1725
   ClientWidth     =   5565
   LinkTopic       =   "Form1"
   ScaleHeight     =   3120
   ScaleWidth      =   5565
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor15.frx":0000
      Height          =   2415
      Left            =   120
      OleObjectBlob   =   "Tutor15.frx":0014
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

Private Sub Form_Load()
' Before modifying the grid's properties, make sure the
' grid is initialized by refreshing the Data control.
    Data1.Refresh

' Create an additional split:
    Dim S As TrueDBGrid60.Split
    Set S = TDBGrid1.Splits.Add(0)

' Hide all columns in the leftmost split, Splits(0),
' except for columns 0 and 1
    Dim C As TrueDBGrid60.Column
    Dim Cols As TrueDBGrid60.Columns
    Set Cols = TDBGrid1.Splits(0).Columns
    For Each C In Cols
        C.Visible = False
    Next C
    Cols(0).Visible = True
    Cols(1).Visible = True

' Configure Splits(0) to display exactly two columns,
' and disable resizing
    With TDBGrid1.Splits(0)
        .SizeMode = dbgNumberOfColumns
        .Size = 2
        .AllowSizing = False
    End With

' Usually, if you fix columns 0 and 1 from scrolling
' in a split, you will want to make them invisible in
' other splits:
    Set Cols = TDBGrid1.Splits(1).Columns
    Cols(0).Visible = False
    Cols(1).Visible = False

' Turn off the record selectors in Split 1:
      TDBGrid1.Splits(1).RecordSelectors = False
End Sub
