VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form frmOwnerDraw 
   Caption         =   "Form1"
   ClientHeight    =   3630
   ClientLeft      =   1770
   ClientTop       =   2130
   ClientWidth     =   6165
   Icon            =   "OwnerDraw.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3630
   ScaleWidth      =   6165
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   2415
      Left            =   0
      OleObjectBlob   =   "OwnerDraw.frx":0442
      TabIndex        =   0
      Top             =   0
      Width           =   4575
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   120
      Top             =   1920
   End
End
Attribute VB_Name = "frmOwnerDraw"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim x As New XArrayDB
Dim BackBrush As Long, ForeBrush As Long, EllBrush As Long
Dim NewFont As Long, OldFont As Long
Dim Cols As TrueOleDBGrid60.Columns
Dim flag As Boolean

Private Sub Form_Load()
    ' Allocate space for 100 rows, 4 columns
    x.ReDim 0, 99, 0, 3

    Dim row, Col As Long

    For row = x.LowerBound(1) To x.UpperBound(1)
        For Col = x.LowerBound(2) To x.UpperBound(2)
            x(row, Col) = "Row " & row & ", Col " & Col
        Next Col
    Next row

    ' Bind True DBGrid Control to this XArrayDB instance

    Set TDBGrid1.Array = x
    
    Set Cols = TDBGrid1.Columns
    BackBrush = CreateSolidBrush(vbBlack)
    ForeBrush = CreateSolidBrush(vbGreen)
    EllBrush = CreateSolidBrush(vbYellow)
    NewFont = CreateFont(15, 0, 0, 0, 700, 0, 0, 0, 0, 0, 0, 0, 0, "Tahoma")
    
End Sub

Private Sub Form_Resize()
    TDBGrid1.Width = Me.ScaleWidth
    TDBGrid1.Height = Me.ScaleHeight
End Sub

Private Sub Form_Unload(Cancel As Integer)
    DeleteObject BackBrush
    DeleteObject ForeBrush
    DeleteObject EllBrush
    DeleteObject NewFont
End Sub

Private Sub TDBGrid1_OwnerDrawCell(ByVal hdc As Long, ByVal Bookmark As Variant, _
        ByVal Split As Integer, ByVal Col As Integer, _
        ByVal Left As Integer, ByVal Top As Integer, _
        ByVal Right As Integer, ByVal Bottom As Integer, Done As Integer)
      
    Dim ForeRegion As Long, BackRegion As Long
    Dim OldFgColor As Long, OldBkColor As Long, OldBkMode As Long
    
    BackRegion = CreateRectRgn(Left, Top, Right, Bottom)
    ForeRegion = CreateRoundRectRgn(Left + 1, Top + 1, Right - 1, Bottom - 1, 5, 5)
    
    FillRgn hdc, BackRegion, BackBrush
    FillRgn hdc, ForeRegion, ForeBrush
    
    DeleteObject ForeRegion
    DeleteObject BackRegion
    
    OldBkMode = SetBkMode(hdc, OPAQUE)
    
    ' Painting current cell
    If TDBGrid1.Col = Col And _
        TDBGrid1.Bookmark = Bookmark And _
        TDBGrid1.AddNewMode = dbgNoAddNew Then
        
        Dim EllRegion As Long
        
        EllRegion = CreateEllipticRgn(Left + 2, Top + 2, Right - 2, Bottom - 2)
        FillRgn hdc, EllRegion, EllBrush
        
        DeleteObject EllRegion
        If flag Then
            OldFgColor = SetTextColor(hdc, vbWhite)
            OldBkColor = SetBkColor(hdc, vbRed)
        Else
            OldFgColor = SetTextColor(hdc, vbBlue)
            OldBkColor = SetBkColor(hdc, vbMagenta)
        End If
    Else
        OldFgColor = SetTextColor(hdc, vbBlack)
        OldBkColor = SetBkColor(hdc, vbCyan)
    End If
    
    OldFont = SelectObject(hdc, NewFont)
    
    r.Bottom = Bottom
    r.Left = Left
    r.Right = Right
    r.Top = Top
    
    Dim s As String
    s = Cols(Col).CellValue(Bookmark)
    DrawText hdc, s, Len(s), r, DT_CENTER + DT_VCENTER + DT_SINGLELINE  '+ DT_WORDBREAK
    
    SelectObject hdc, OldFont
    SetTextColor hdc, OldFgColor
    SetBkMode hdc, OldBkMode
    SetBkColor hdc, OldBkColor
    
    Done = True
End Sub

Private Sub Timer1_Timer()
    Cols(TDBGrid1.Col).RefreshCell (TDBGrid1.Bookmark)
    flag = flag Xor True
End Sub
