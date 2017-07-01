VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 13"
   ClientHeight    =   4950
   ClientLeft      =   2130
   ClientTop       =   1650
   ClientWidth     =   5625
   LinkTopic       =   "Form1"
   ScaleHeight     =   4950
   ScaleWidth      =   5625
   Begin VB.Data Data2 
      Caption         =   "Data2"
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
      RecordSource    =   "CallList"
      Top             =   4440
      Visible         =   0   'False
      Width           =   2460
   End
   Begin TrueDBGrid60.TDBGrid TDBGrid2 
      Bindings        =   "Tutor13.frx":0000
      Height          =   1575
      Left            =   120
      OleObjectBlob   =   "Tutor13.frx":0014
      TabIndex        =   1
      Top             =   3240
      Width           =   5295
   End
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor13.frx":2EA8
      DragIcon        =   "Tutor13.frx":2EBC
      Height          =   2055
      Left            =   120
      OleObjectBlob   =   "Tutor13.frx":32FE
      TabIndex        =   0
      Top             =   840
      Width           =   5295
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
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
      RecordSource    =   "Customers"
      Top             =   120
      Width           =   5340
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "To here:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   3000
      Width           =   600
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Drag from here:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub ResetDragDrop()
' Turn off drag-and-drop by resetting the highlight and data
' control caption.
    If TDBGrid1.MarqueeStyle = dbgSolidCellBorder Then Exit Sub
    TDBGrid1.MarqueeStyle = dbgSolidCellBorder
    TDBGrid2.MarqueeStyle = dbgSolidCellBorder
    Data1.Caption = "Drag a row, or just phone #"
End Sub

Private Sub TDBGrid1_DragCell(ByVal SplitIndex As Integer, RowBookmark As Variant, ByVal ColIndex As Integer)
' DragCell is triggered when True DBGrid detects an attempt
' to drag data from a cell.

' Set the current cell to the one being dragged.
    TDBGrid1.Col = ColIndex
    TDBGrid1.Bookmark = RowBookmark

' See if the starting cell is in the "Phone" column
    Select Case TDBGrid1.Columns(ColIndex).Caption
        Case "Phone"
            ' Highlight the phone number cell to indicate data
            ' from the cell is being dragged.
            TDBGrid1.MarqueeStyle = dbgHighlightCell
            Data1.Caption = "Dragging phone number..."
        Case Else
            ' Highlight the entire row to indicate data from the
            ' entire row is being dragged.
            TDBGrid1.MarqueeStyle = dbgHighlightRow
            Data1.Caption = "Create new call when dropped..."
    End Select

' Use Visual Basic manual drag support
    TDBGrid1.Drag vbBeginDrag
End Sub

Private Sub TDBGrid1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
' If the button is up and we get MouseMove, that means
' we exited the form and tried to drop elsewhere.
' Reset the drag upon returning.
    If Button = 0 Then ResetDragDrop
End Sub

Private Sub TDBGrid2_DragDrop(Source As Control, X As Single, Y As Single)
' Allow phone drops right into the cell, other
' drops cause a new row to be added

    If TDBGrid1.Columns(TDBGrid1.Col).Caption = "Phone" Then
        TDBGrid2.Columns(TDBGrid2.Col).Value = _
            TDBGrid1.Columns(TDBGrid1.Col).Value
        Data2.UpdateRecord
    Else
        Data2.Recordset.AddNew
        Data2.Recordset!CallDate = Now
        Data2.Recordset!Phone = Data1.Recordset!Phone
        Data2.Recordset!Customer = Data1.Recordset!FirstName & _
            " " & Data1.Recordset!LastName & ", " & _
            Data1.Recordset!Company
        Data2.Recordset.Update
        Data2.Recordset.MoveLast
    End If
    
    ResetDragDrop
End Sub

Private Sub TDBGrid2_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
' DragOver provides different visual feedback as we are
' dragging a row, or just the phone number.

    Dim dragFrom As String
    Dim overCol As Integer
    Dim overRow As Long
    
    dragFrom = TDBGrid1.Columns(TDBGrid1.Col).DataField
    
    Select Case State
        Case vbEnter
            If dragFrom = "Phone" Then
                TDBGrid2.MarqueeStyle = dbgHighlightCell
            Else
                TDBGrid2.MarqueeStyle = dbgNoMarquee
            End If
        Case vbLeave
            TDBGrid2.MarqueeStyle = dbgHighlightCell
        Case vbOver
            If dragFrom = "Phone" Then
                overCol = 1
            Else
                overCol = TDBGrid2.ColContaining(X)
            End If
            overRow = TDBGrid2.RowContaining(Y)
            If overCol >= 0 Then TDBGrid2.Col = overCol
            If overRow >= 0 Then TDBGrid2.Row = overRow
    End Select
End Sub
