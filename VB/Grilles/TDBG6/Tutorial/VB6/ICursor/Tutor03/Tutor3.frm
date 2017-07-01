VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 3"
   ClientHeight    =   4695
   ClientLeft      =   1275
   ClientTop       =   1545
   ClientWidth     =   5805
   LinkTopic       =   "Form1"
   ScaleHeight     =   4695
   ScaleWidth      =   5805
   Begin TrueDBGrid60.TDBGrid TDBGrid2 
      Bindings        =   "Tutor3.frx":0000
      Height          =   1575
      Left            =   120
      OleObjectBlob   =   "Tutor3.frx":0014
      TabIndex        =   1
      Top             =   3000
      Width           =   5535
   End
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor3.frx":2604
      Height          =   1815
      Left            =   120
      OleObjectBlob   =   "Tutor3.frx":2618
      TabIndex        =   0
      Top             =   600
      Width           =   5535
   End
   Begin VB.Data Data2 
      Caption         =   "Their Compositions"
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
      RecordSource    =   "Opus"
      Top             =   2520
      Width           =   5535
   End
   Begin VB.Data Data1 
      Caption         =   "Composers"
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
      Width           =   5535
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub TDBGrid1_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
' A query is performed by taking the "LAST" name field from
' the Data1 control and building an SQL query on the LAST
' name field in the Data2 (compositions) file.
    
' The Second grid will respond automatically when the Data
' Control causes the change.  We put up an hourglass so that
' there's a bit of feedback if Access is slow at finishing
' the query.

    Dim lastname$
    Dim bk1 As String, bk2 As String
    
' To reliably compare bookmarks, you must first convert them
' into strings.  You will also need to test for Null
' Bookmarks being passed by LastRow.  This will occur on the
' initial display of the grid and if the user places the
' cursor on the AddNewRow and then moves off.

    If IsNull(LastRow) Then
        bk1 = ""
    Else
        bk1 = LastRow
    End If
        
    bk2 = TDBGrid1.Bookmark
     
    If bk1 <> bk2 Then
        Screen.MousePointer = vbHourglass
        
        lastname$ = Data1.Recordset("Last")
        Data2.RecordSource = "SELECT * FROM OPUS WHERE LAST = " _
                             + Chr$(34) + lastname$ + Chr$(34)
        Data2.Refresh
    
        Screen.MousePointer = vbDefault
    End If

End Sub
