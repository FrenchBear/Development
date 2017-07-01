VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 20"
   ClientHeight    =   3750
   ClientLeft      =   1710
   ClientTop       =   1650
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   ScaleHeight     =   3750
   ScaleWidth      =   6585
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Height          =   3015
      Left            =   120
      OleObjectBlob   =   "Tutor20.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   6375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Find"
      Height          =   375
      Left            =   5280
      TabIndex        =   3
      Top             =   3240
      Width           =   1215
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   2760
      TabIndex        =   2
      Top             =   3240
      Width           =   615
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   480
      TabIndex        =   1
      Top             =   3240
      Width           =   1215
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "In Column:"
      Height          =   195
      Left            =   1920
      TabIndex        =   5
      Top             =   3330
      Width           =   750
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Find:"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   3330
      Width           =   345
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' General declarations
Option Explicit

Dim x As New XArrayDB

Private Sub Form_Load()
' Allocate space for 100 rows, 4 columns
    x.ReDim 0, 99, 0, 3

    Dim row As Long, col As Integer

' The LowerBound and UpperBound properties correspond
' to the LBound and UBound functions in Visual Basic.
' Hard-coded dimensions can be used instead, if known.
    For row = x.LowerBound(1) To x.UpperBound(1)
        For col = x.LowerBound(2) To x.UpperBound(2)
            x(row, col) = CInt(99 * Rnd + 1)
        Next col
    Next row

' Bind True DBGrid Control to this XArray instance
    Set TDBGrid1.Array = x
    
' Enable footers
    TDBGrid1.ColumnFooters = True
    
' Display headers and footers as buttons
    Dim obcol As TrueDBGrid60.Column
    For Each obcol In TDBGrid1.Columns
        obcol.ButtonFooter = True
        obcol.ButtonHeader = True
    Next obcol
End Sub

Private Sub Command1_Click()
    Dim RowFound As Long
' Execute Find
    RowFound = x.Find(x.LowerBound(1), CInt(Text2.Text), CInt(Text1.Text), XORDER_ASCEND, XCOMP_EQ, XTYPE_NUMBER)

' Successfull Find will return a row number
' Set focus to the row and column
    If RowFound >= 0 Then TDBGrid1.Bookmark = RowFound
    TDBGrid1.col = CInt(Text2.Text)
    TDBGrid1.SetFocus
End Sub

Private Sub TDBGrid1_HeadClick(ByVal ColIndex As Integer)
' Ascending sort
    x.QuickSort x.LowerBound(1), x.UpperBound(1), ColIndex, XORDER_ASCEND, XTYPE_INTEGER
    TDBGrid1.Refresh
End Sub

Private Sub TDBGrid1_FootClick(ByVal ColIndex As Integer)
' Descending sort
    x.QuickSort x.LowerBound(1), x.UpperBound(1), ColIndex, XORDER_DESCEND, XTYPE_INTEGER
    TDBGrid1.Refresh
End Sub


