VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Select any cell"
   ClientHeight    =   4155
   ClientLeft      =   1350
   ClientTop       =   1935
   ClientWidth     =   6390
   Icon            =   "SelCell.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4155
   ScaleWidth      =   6390
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "Print selected"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   0
      TabIndex        =   1
      Top             =   3600
      Width           =   1215
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      DragIcon        =   "SelCell.frx":0442
      Height          =   3495
      Left            =   0
      OleObjectBlob   =   "SelCell.frx":0594
      TabIndex        =   0
      Top             =   0
      Width           =   6375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Drag a cell inside of the grid"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1800
      TabIndex        =   2
      Top             =   3720
      Width           =   1995
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim GridArray As New XArrayDB
Dim SelCell As New XArrayDB
Dim DragFromCol As Integer
Dim DragOverCol As Integer
Dim DragFromRow As Long
Dim DragOverRow As Long
Dim FirstRow As Long
Dim SCDirty As Boolean

Private Sub Command1_Click()
    Dim Row As Long, Col As Integer
    For Row = SelCell.LowerBound(1) To SelCell.UpperBound(1)
        For Col = SelCell.LowerBound(2) To SelCell.UpperBound(2)
            If SelCell(Row, Col) = True Then
                Debug.Print GridArray(Row, Col)
            End If
        Next Col
    Next Row
End Sub

Private Sub Form_Load()
    Dim dbgCol As TrueOleDBGrid60.Column
    Dim dbgCols As TrueOleDBGrid60.Columns
    
    GridArray.ReDim 0, 99, 0, 3
    SelCell.ReDim GridArray.LowerBound(1), GridArray.UpperBound(1), GridArray.LowerBound(2), GridArray.UpperBound(2)
    
    Dim Row, Col As Long

    For Row = GridArray.LowerBound(1) To GridArray.UpperBound(1)
        For Col = GridArray.LowerBound(2) To GridArray.UpperBound(2)
            GridArray(Row, Col) = "Row " & Row & ", Col " & Col
        Next Col
    Next Row

    Set TDBGrid1.Array = GridArray
    Set dbgCols = TDBGrid1.Columns
    
    For Each dbgCol In dbgCols
        dbgCol.FetchStyle = True
        dbgCol.HeadFont.Bold = True
    Next dbgCol
End Sub

Private Sub TDBGrid1_DragCell(ByVal SplitIndex As Integer, RowBookmark As Variant, ByVal ColIndex As Integer)
    DragFromCol = ColIndex
    DragFromRow = CLng(RowBookmark)
    DragOverCol = -1
    DragOverRow = -1
    
    ' Returns absolute position of the first displayed row
    FirstRow = TDBGrid1.RowBookmark(0)
    TDBGrid1.Drag vbBeginDrag
End Sub

Private Sub TDBGrid1_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
    Dim gRow As Integer, gCol As Integer

    If Source.Name = "TDBGrid1" Then
        With TDBGrid1
            gCol = .ColContaining(X)
            gRow = .RowContaining(Y)
            If gCol < 0 Or gRow < 0 Then Exit Sub
            
            If gRow <> DragOverRow Or gCol <> DragOverCol Then
                DragOverCol = gCol
                DragOverRow = gRow
                SelCell(gRow + FirstRow, gCol) = True
                SCDirty = True
                ' Following line will fire FetchCellStyle only for one cell
                .Columns(gCol).RefreshCell (TDBGrid1.RowBookmark(gRow))
            End If
        End With
    End If
End Sub

Private Sub TDBGrid1_FetchCellStyle(ByVal Condition As Integer, ByVal Split As Integer, Bookmark As Variant, ByVal Col As Integer, ByVal CellStyle As TrueOleDBGrid60.StyleDisp)
    If SelCell(CLng(Bookmark), Col) = True Then
        CellStyle.BackColor = &H8000000D
        CellStyle.ForeColor = &H8000000E
    End If
End Sub

Private Sub TDBGrid1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If SCDirty = True Then
        SelCell.Clear
        TDBGrid1.Refresh
        SCDirty = False
    End If
End Sub

