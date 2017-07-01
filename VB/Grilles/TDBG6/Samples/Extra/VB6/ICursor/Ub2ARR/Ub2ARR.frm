VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Ub2Frm 
   Caption         =   "DataMode 2 Array Class Sample"
   ClientHeight    =   4425
   ClientLeft      =   1260
   ClientTop       =   1665
   ClientWidth     =   7590
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Ub2ARR.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4425
   ScaleWidth      =   7590
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Height          =   3615
      Left            =   0
      OleObjectBlob   =   "Ub2ARR.frx":0442
      TabIndex        =   6
      Top             =   0
      Width           =   7575
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
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   3600
      Width           =   5655
      Begin VB.CommandButton Command1 
         Caption         =   "FILL"
         Height          =   375
         Left            =   4200
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtIn 
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   2
         Text            =   "100"
         Top             =   240
         Width           =   735
      End
      Begin VB.TextBox txtIn 
         Height          =   375
         Index           =   1
         Left            =   1920
         TabIndex        =   1
         Text            =   "4"
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Row(s)"
         Height          =   195
         Index           =   0
         Left            =   960
         TabIndex        =   5
         Top             =   330
         Width           =   510
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Column(s)"
         Height          =   195
         Index           =   1
         Left            =   2760
         TabIndex        =   4
         Top             =   330
         Width           =   720
      End
   End
End
Attribute VB_Name = "Ub2Frm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Sink As New Ub2GridCls

Private Sub Command1_Click()
    Dim row As Long, col As Integer
    Dim c As TrueDBGrid60.Column
    Dim Cols As TrueDBGrid60.Columns
    
    row = CLng(txtIn(0).Text)
    col = CInt(txtIn(1).Text)
    
    Screen.MousePointer = vbHourglass
    
    ' Initialize storage
    Sink.SetDims row, col
    
    ' Fill with values
    For row = 0 To Sink.RowCount - 1
        For col = 0 To Sink.ColCount - 1
            Sink.Value(row, col) = "Row " & row & ", Col " & col
        Next col
    Next row
    
    Screen.MousePointer = vbDefault
    
    ' Make sure no events are fired for the grid yet
    Sink.Attach Nothing
    
    Set Cols = TDBGrid1.Columns
    
    ' Remove all columns
    While Cols.Count
        Cols.Remove 0
    Wend
    TDBGrid1.ReBind
    
    ' Add columns to the grid
    For col = 0 To Sink.ColCount - 1
        Set c = Cols.Add(col)
        c.Visible = True
        c.Caption = "Column " & col
    Next col
    
    ' Initialise the class
    Sink.Attach TDBGrid1
    
    ' Reinitialize the grid
    TDBGrid1.Bookmark = Null
    TDBGrid1.ReBind
    
    ' Calibrate the VScroll bar
    TDBGrid1.ApproxCount = Sink.RowCount
    TDBGrid1.SetFocus
End Sub

Private Sub Form_Load()
    TDBGrid1.MarqueeStyle = dbgDottedCellBorder
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    With Me
    If .WindowState <> vbMinimized Then
        TDBGrid1.Width = .ScaleWidth
        TDBGrid1.Height = .ScaleHeight - 930
        Frame1.Move 0, .ScaleHeight - 825
    End If
    End With
End Sub

Private Sub txtIn_KeyPress(Index As Integer, KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then KeyAscii = 0: Command1_Click
End Sub
