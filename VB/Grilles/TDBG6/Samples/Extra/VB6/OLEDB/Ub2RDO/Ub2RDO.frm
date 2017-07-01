VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form RDOForm 
   Caption         =   "DataMode 2 Resultset Class Sample"
   ClientHeight    =   5115
   ClientLeft      =   1215
   ClientTop       =   1560
   ClientWidth     =   6975
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Ub2RDO.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5115
   ScaleWidth      =   6975
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   4215
      Left            =   0
      OleObjectBlob   =   "Ub2RDO.frx":0442
      TabIndex        =   2
      Top             =   0
      Width           =   6975
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   0
      TabIndex        =   0
      Top             =   4200
      Width           =   2775
      Begin VB.CommandButton Command1 
         Caption         =   "Connect"
         Height          =   495
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1215
      End
   End
End
Attribute VB_Name = "RDOForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Sink As New rdoClass

Dim en As rdoEnvironment
Dim rs As rdoResultset
Dim cn As rdoConnection

Private Sub Command1_Click()
    Dim Col As TrueOleDBGrid60.Column
    Dim Cols As TrueOleDBGrid60.Columns
    Dim Flds As rdoColumns
    Dim strDSN As String, strSQL As String
    
    Dim C As Integer
    
    ' Open a database and working resultsset
    Set en = rdoCreateEnvironment("", "", "")
    ' Enable AbsolutePosition
    en.CursorDriver = rdUseOdbc
    
    ' Prompt user for ODBC DSN and SQL String to use
    strDSN = InputBox("Enter ODBC Name...")
    strSQL = InputBox("Enter an SQL string:")
    
    ' Open a connection to the database and create the
    ' resultset
    Set cn = en.OpenConnection(strDSN)
    Set rs = cn.OpenResultset(strSQL, rdOpenKeyset, rdConcurRowVer)
    
    Sink.ResultSet = rs
    
    Set Cols = TDBGrid1.Columns
    Set Flds = rs.rdoColumns
    
    While Cols.Count
        Cols.Remove 0
    Wend
    TDBGrid1.ReBind
    
    ' Configure the grid
    For C = 0 To Sink.ColCount - 1
        Set Col = Cols.Add(C)
        Col.Caption = Flds(C).Name
        Col.Visible = True
    Next C
    
    ' Associate the grid object with our class
    Sink.Attach TDBGrid1
    
    ' Reinitialise the grid
    TDBGrid1.Bookmark = Null
    TDBGrid1.ReBind
    
    ' Callibrate VScroll bar
    TDBGrid1.ApproxCount = Sink.RowCount
    TDBGrid1.SetFocus
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    rs.Close
    cn.Close
    en.Close
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    With Me
    If .WindowState <> vbMinimized Then
        TDBGrid1.Width = .ScaleWidth
        TDBGrid1.Height = .ScaleHeight - 930
        Frame1.Move 0, .ScaleHeight - 900
    End If
    End With
End Sub

