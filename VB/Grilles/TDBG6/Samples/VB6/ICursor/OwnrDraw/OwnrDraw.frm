VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form frmOwnerDraw 
   Caption         =   "OwnerDraw"
   ClientHeight    =   5040
   ClientLeft      =   1650
   ClientTop       =   1830
   ClientWidth     =   6465
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "OwnrDraw.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5040
   ScaleWidth      =   6465
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "OwnrDraw.frx":0442
      Height          =   3975
      Left            =   0
      OleObjectBlob   =   "OwnrDraw.frx":0456
      TabIndex        =   0
      Top             =   840
      Width           =   6375
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   495
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   120
      Width           =   6375
   End
   Begin VB.Menu ExitMenuOption 
      Caption         =   "E&xit!"
   End
   Begin VB.Menu HelpMenuOption 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpOption 
         Caption         =   "&About Owner Draw..."
      End
   End
End
Attribute VB_Name = "frmOwnerDraw"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ---------------------------------------------------------
'       Copyright �1995-1998 APEX Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True DBGrid Pro 6 sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that APEX Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------
Option Explicit

    Dim BackBrush As Long
    Dim ForeBrush As Long
    Dim EllBrush As Long
    Dim HatchBrush As Long
    Dim HBackBrush As Long
    Dim NewFont As Long, OldFont As Long
    Dim Cols As TrueDBGrid60.Columns

Private Sub ExitMenuOption_Click()
  Unload frmOwnerDraw
  End
End Sub

Private Sub Form_Load()
    Data1.DatabaseName = App.Path & "\TDBGDemo.mdb"
    Data1.RecordSource = "Select * from Customers"
    Data1.Refresh

    Set Cols = TDBGrid1.Columns
    
    ' Create an unbound Column
    Dim C As TrueDBGrid60.Column
    Set C = TDBGrid1.Columns.Add(1)
    With C
        .Visible = True        ' Make it visible
        .Caption = "Name"      ' Set the column's caption
        .Width = Cols(0).Width
    End With
    
' Rebind grid to create unbound column
    TDBGrid1.ReBind
       
    BackBrush = CreateSolidBrush(vbBlack)
    ForeBrush = CreateSolidBrush(vbGreen)
    EllBrush = CreateSolidBrush(vbYellow)
    HatchBrush = CreateHatchBrush(HS_BDIAGONAL, vbWhite)
    HBackBrush = CreateSolidBrush(&HC0C0C0)
    
    NewFont = CreateFont(15, 0, 0, 0, 700, 0, 0, 0, 0, 0, 0, 0, 0, "Tahoma")
    
' Set Grid properties
    With TDBGrid1
        .BackColor = &HC0C0C0
        .AnchorRightColumn = True
        .ExtendRightColumn = True
        .RowHeight = TDBGrid1.RowHeight * 1.5
        .MarqueeStyle = dbgHighlightCell
        .EditorStyle.Alignment = dbgCenter
        .EditorStyle.VerticalAlignment = dbgVertCenter
        .EmptyRows = True
        .Caption = "True DBGrid Pro 6.0 -- OwnerDraw Sample"
    End With
    
' Set Column properties
    Cols("LastName").Visible = False
    Cols("FirstName").Visible = False
    Cols("Name").AllowFocus = False
    Cols("Custtype").OwnerDraw = True
    Cols("Name").OwnerDraw = True
    Cols("Phone").NumberFormat = "(###)###-####"
    Cols("Phone").EditMask = "(###)###-####"
    Cols("Contacted").NumberFormat = "mm/dd/yyyy"
    Cols("FirstName").AllowSizing = False
    Cols("LastName").AllowSizing = False

' Set Styles properties
    With TDBGrid1.Styles
        .Item("Heading").BackColor = vbMagenta
        .Item("HighlightRow").BackColor = vbYellow
        .Item("HighlightRow").ForeColor = vbBlack
        .Item("Normal").VerticalAlignment = dbgVertCenter
        .Item("Normal").Font.Name = "Tahoma"
        .Item("Heading").Font.Bold = True
        .Item("Caption").BackColor = vbCyan
    End With
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ' Make sure objects are deleted when form is unloaded.
    DeleteObject BackBrush
    DeleteObject ForeBrush
    DeleteObject EllBrush
    DeleteObject NewFont
    DeleteObject HBackBrush
    DeleteObject HatchBrush
    
End Sub

Private Sub mnuHelpOption_Click()
    About.Show 1
End Sub

Private Sub TDBGrid1_OwnerDrawCell(ByVal hdc As Long, ByVal Bookmark As Variant, _
        ByVal Split As Integer, ByVal col As Integer, _
        ByVal Left As Integer, ByVal Top As Integer, _
        ByVal Right As Integer, ByVal Bottom As Integer, Done As Integer)
      
    Dim ForeRegion As Long
    Dim BackRegion As Long
    Dim HatchRegion As Long
    
    Dim OldBkColor As Long
    Dim OldFgColor As Long
    Dim OldBkMode As Long
    Dim oldHBrush As Long
    
    BackRegion = CreateRectRgn(Left, Top, Right, Bottom)
    HatchRegion = CreateRectRgn(Left, Top, Right, Bottom)
    
    Select Case Cols(col).Caption
        Case "CustType"
            ' Draw cell for 'CustType' column when a '1' is the value.
            If Cols("CustType").CellValue(Bookmark) = 1 Then
                
                ForeRegion = CreateRoundRectRgn(Left + 1, Top + 1, Right - 1, Bottom - 1, 15, 15)
            
                FillRgn hdc, BackRegion, BackBrush
                FillRgn hdc, ForeRegion, ForeBrush
                
                DeleteObject ForeRegion
                DeleteObject BackRegion
            
                OldBkMode = SetBkMode(hdc, OPAQUE)
            Else
                FillRgn hdc, BackRegion, HBackBrush
            End If
            
            ' Draw cell for 'CustType' column when it is the current cell.
            If TDBGrid1.col = col And _
                TDBGrid1.Bookmark = Bookmark And _
                TDBGrid1.AddNewMode = dbgNoAddNew Then

                Dim EllRegion As Long

                EllRegion = CreateEllipticRgn(Left + 2, Top + 2, Right - 2, Bottom - 2)
                FillRgn hdc, EllRegion, EllBrush

                DeleteObject EllRegion

                OldFgColor = SetTextColor(hdc, vbRed)
                OldBkColor = SetBkColor(hdc, vbYellow)

            Else
                OldFgColor = SetTextColor(hdc, vbRed)
                OldBkColor = SetBkColor(hdc, vbWhite)
            End If


        Case "Name"
            ' Hatch Name column of the grid.
            OldFgColor = SetTextColor(hdc, vbBlack)
            FillRgn hdc, BackRegion, HBackBrush
            FillRgn hdc, HatchRegion, HatchBrush
            FillRgn hdc, ForeRegion, ForeBrush

    End Select
    
    DeleteObject BackRegion
    DeleteObject HatchRegion
    DeleteObject ForeRegion
    
    OldFont = SelectObject(hdc, NewFont)
    
    r.Bottom = Bottom
    r.Left = Left
    r.Right = Right
    r.Top = Top
    
    Dim s As String
    s = Cols(col).CellText(Bookmark)
    
    Select Case Cols(col).Caption
        ' Set text in 'CustType' column to be horizontally centered
        Case "CustType"
            DrawText hdc, s, Len(s), r, DT_CENTER + DT_VCENTER + DT_SINGLELINE
        
        ' Set text in 'Name' column NOT to be horizontally centered
        Case Else
            DrawText hdc, s, Len(s), r, DT_VCENTER + DT_SINGLELINE
    End Select
    
    'Reset object back to their original state
    SelectObject hdc, OldFont
    SetTextColor hdc, OldFgColor
    SetBkMode hdc, OldBkMode
    SetBkColor hdc, OldBkColor
    
    Done = True
End Sub

Private Sub TDBGrid1_UnboundColumnFetch(Bookmark As Variant, ByVal col As Integer, Value As Variant)
    ' Fill unbound column 'Name' with the FirstName and LastName fields.
    Select Case Cols(col).Caption
        Case "Name"
            Value = Cols("FirstName").CellValue(Bookmark) & " " & Cols("LastName").CellValue(Bookmark)
    End Select
End Sub

