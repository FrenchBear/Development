VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 13"
   ClientHeight    =   4950
   ClientLeft      =   2130
   ClientTop       =   1650
   ClientWidth     =   5625
   LinkTopic       =   "Form1"
   ScaleHeight     =   4950
   ScaleWidth      =   5625
   Begin MSAdodcLib.Adodc Adodc2 
      Height          =   375
      Left            =   120
      Top             =   4440
      Visible         =   0   'False
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "CallList"
      Caption         =   "Adodc2"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   120
      Width           =   5295
      _ExtentX        =   9340
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "Customers"
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid2 
      Bindings        =   "Tutor13.frx":0000
      Height          =   1575
      Left            =   120
      OleObjectBlob   =   "Tutor13.frx":0015
      TabIndex        =   0
      Top             =   3240
      Width           =   5295
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor13.frx":2ED0
      DragIcon        =   "Tutor13.frx":2EE5
      Height          =   2055
      Left            =   120
      OleObjectBlob   =   "Tutor13.frx":3327
      TabIndex        =   3
      Top             =   840
      Width           =   5295
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "To here:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   3000
      Width           =   600
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Drag from here:"
      Height          =   195
      Left            =   120
      TabIndex        =   1
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
    Adodc1.Caption = "Drag a row, or just phone #"
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
            Adodc1.Caption = "Dragging phone number..."
        Case Else
            ' Highlight the entire row to indicate data from the
            ' entire row is being dragged.
            TDBGrid1.MarqueeStyle = dbgHighlightRow
            Adodc1.Caption = "Create new call when dropped..."
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
        TDBGrid2.Update
    Else
        Adodc2.Recordset.AddNew
        Adodc2.Recordset!CallDate = Now
        Adodc2.Recordset!Phone = Adodc1.Recordset!Phone
        Adodc2.Recordset!Customer = Adodc1.Recordset!FirstName & _
            " " & Adodc1.Recordset!LastName & ", " & _
            Adodc1.Recordset!Company
        Adodc2.Recordset.Update
        Adodc2.Recordset.MoveLast
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
