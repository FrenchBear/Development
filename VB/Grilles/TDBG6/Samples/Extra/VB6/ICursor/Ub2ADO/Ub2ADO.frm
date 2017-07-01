VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form UB2ADO 
   Caption         =   "DataMode 2 ADO Class Sample"
   ClientHeight    =   5490
   ClientLeft      =   1155
   ClientTop       =   1620
   ClientWidth     =   6990
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Ub2ADO.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5490
   ScaleWidth      =   6990
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Height          =   4215
      Left            =   0
      OleObjectBlob   =   "Ub2ADO.frx":0442
      TabIndex        =   7
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
      Height          =   1215
      Left            =   0
      TabIndex        =   2
      Top             =   4200
      Width           =   6975
      Begin VB.CommandButton Command3 
         Caption         =   "Move Last"
         Height          =   495
         Left            =   5640
         TabIndex        =   6
         Top             =   600
         Width           =   1215
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Move First"
         Height          =   495
         Left            =   4200
         TabIndex        =   5
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txtDBName 
         Height          =   285
         Left            =   120
         TabIndex        =   0
         Text            =   "C:\VB6\BIBLIO.MDB"
         ToolTipText     =   "Type Database name (full path)"
         Top             =   240
         Width           =   3855
      End
      Begin VB.TextBox txtSQL 
         Height          =   495
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   1
         Text            =   "Ub2ADO.frx":2A2A
         ToolTipText     =   "Type SQL statement"
         Top             =   600
         Width           =   2655
      End
      Begin VB.CommandButton Command1 
         Caption         =   "&Get Recordset"
         Height          =   495
         Left            =   2880
         TabIndex        =   3
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label1 
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00FF0000&
         Height          =   285
         Left            =   4200
         TabIndex        =   4
         Top             =   240
         Width           =   2655
      End
   End
End
Attribute VB_Name = "UB2ADO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Sink As New ADOCls

Dim cn As New ADODB.Connection
Dim rs As New ADODB.RecordSet
Dim Flds As ADODB.Fields

Private Sub Command1_Click()
    Dim Col As TrueDBGrid60.Column
    Dim Cols As TrueDBGrid60.Columns
    Dim strConnect As String
    Dim C As Integer
    
    
    Screen.MousePointer = vbHourglass
    ' Open a database and working recordset
    On Error GoTo OpenRecSetError
    strConnect = "driver={Microsoft Access Driver (*.mdb)};DBQ=" & txtDBName.Text
    cn.Open strConnect
    
    rs.CursorType = adOpenKeyset
    rs.LockType = adLockOptimistic
    
    ' Use client cursor to enable AbsolutePosition property.
    rs.CursorLocation = adUseClient
    
    rs.Open txtSQL.Text, cn
    
    Sink.RecordSet = rs
    
    Set Cols = TDBGrid1.Columns
    Set Flds = rs.Fields
    
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
    
    Label1.Caption = Str(Sink.RowCount) & "  Record(s) retrieved"
    
    Screen.MousePointer = vbDefault
    
    Exit Sub
OpenRecSetError:
    MsgBox "Error openning Recordset!" & vbCrLf & Err.Number & "  " & Err.Description
    Stop
End Sub

Private Sub Command2_Click()
    TDBGrid1.MoveFirst
    TDBGrid1.SetFocus
End Sub

Private Sub Command3_Click()
    TDBGrid1.MoveLast
    TDBGrid1.SetFocus
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If rs.State = adStateOpen Then rs.Close
    If cn.State = adStateOpen Then cn.Close
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    With Me
    If .WindowState <> vbMinimized Then
        TDBGrid1.Width = .ScaleWidth
        TDBGrid1.Height = .ScaleHeight - 1200
        Frame1.Move 0, .ScaleHeight - 1200
    End If
    End With
End Sub

