VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - DataMode 4 Tutorial"
   ClientHeight    =   3795
   ClientLeft      =   1455
   ClientTop       =   1755
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   ScaleHeight     =   3795
   ScaleWidth      =   6585
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Height          =   3615
      Left            =   120
      OleObjectBlob   =   "Tutor19.frx":0000
      TabIndex        =   0
      Top             =   120
      Width           =   6375
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
            x(row, col) = "Row " & row & ", Col " & col
        Next col
    Next row

' Bind True DBGrid Control to this XArray instance
    Set TDBGrid1.Array = x
End Sub
