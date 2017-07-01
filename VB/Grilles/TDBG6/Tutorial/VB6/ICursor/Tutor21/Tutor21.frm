VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 21"
   ClientHeight    =   4305
   ClientLeft      =   1320
   ClientTop       =   1590
   ClientWidth     =   5505
   LinkTopic       =   "Form1"
   ScaleHeight     =   4305
   ScaleWidth      =   5505
   Begin VB.CommandButton Command1 
      Caption         =   "Display"
      Height          =   375
      Left            =   4200
      TabIndex        =   2
      Top             =   3840
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Text            =   "C:\TDBG6\Bitmaps\Flags"
      Top             =   3840
      Width           =   3975
   End
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Height          =   3615
      Left            =   120
      OleObjectBlob   =   "Tutor21.frx":0000
      TabIndex        =   0
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
Dim x As New XArrayDB

Private Sub Command1_Click()
    Dim s As String
    Dim i As Integer
    
    x.ReDim 0, -1, 0, 1
   
    i = 0
    
' Fill the XArray object with
' all bitmaps found in this directory
    s = Dir(Text1.Text & "\*.bmp")
    
    While s <> ""
        If s <> "." And s <> ".." Then
            x.ReDim 0, x.UpperBound(1) + 1, 0, 1
            x(i, 1) = s
            i = i + 1
        End If
        s = Dir
    Wend
    
' Reinitialize the grid
    TDBGrid1.Bookmark = Null
    TDBGrid1.ReBind
End Sub

Private Sub Form_Load()
' Initially we resize the XArray
' to 0 rows and 2 columns
    x.ReDim 0, -1, 0, 1
    Set TDBGrid1.Array = x
    
' Enable FetchCellStyle Event
    TDBGrid1.Columns(0).FetchStyle = True
    TDBGrid1.MarqueeStyle = dbgDottedRowBorder
End Sub

Private Sub TDBGrid1_FetchCellStyle(ByVal Condition As Integer, _
ByVal Split As Integer, Bookmark As Variant, ByVal Col As Integer, _
ByVal CellStyle As TrueDBGrid60.StyleDisp)

    Dim PathFileName As String
' Full Path file name of a picture
    PathFileName = Text1.Text & "\" & TDBGrid1.Columns(1).CellText(Bookmark)

' Load the picture
    CellStyle.BackgroundPicture = LoadPicture(PathFileName)
End Sub
