VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form Ub2RS 
   Caption         =   "DataMode 2 Recordset and Transactions"
   ClientHeight    =   5490
   ClientLeft      =   1215
   ClientTop       =   1755
   ClientWidth     =   6990
   Icon            =   "Trans.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5490
   ScaleWidth      =   6990
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   4215
      Left            =   0
      OleObjectBlob   =   "Trans.frx":0442
      TabIndex        =   8
      Top             =   0
      Width           =   6975
   End
   Begin VB.Frame Frame1 
      Height          =   1215
      Left            =   0
      TabIndex        =   2
      Top             =   4200
      Width           =   6975
      Begin VB.CommandButton btnTrans 
         Caption         =   "Commit"
         Enabled         =   0   'False
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
         Index           =   1
         Left            =   5160
         TabIndex        =   7
         Top             =   600
         Width           =   800
      End
      Begin VB.CommandButton btnTrans 
         Caption         =   "Rollback"
         Enabled         =   0   'False
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
         Index           =   2
         Left            =   6000
         TabIndex        =   6
         Top             =   600
         Width           =   800
      End
      Begin VB.CommandButton btnTrans 
         Caption         =   "Begin Trans."
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
         Index           =   0
         Left            =   4200
         TabIndex        =   5
         Top             =   600
         Width           =   800
      End
      Begin VB.TextBox Text3 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   0
         Text            =   "C:\VB6\BIBLIO.MDB"
         Top             =   240
         Width           =   3855
      End
      Begin VB.TextBox Text1 
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
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   1
         Text            =   "Trans.frx":2A51
         Top             =   600
         Width           =   2655
      End
      Begin VB.CommandButton Command1 
         Caption         =   "&Get Recordset"
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
         Left            =   2880
         TabIndex        =   3
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label Label1 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   285
         Left            =   4200
         TabIndex        =   4
         Top             =   240
         Width           =   2570
      End
   End
End
Attribute VB_Name = "Ub2RS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Sink As New RsGridCls

Dim WK As DAO.Workspace
Dim DB As DAO.Database
Dim RS As DAO.RecordSet
Dim Flds As DAO.Fields

Private Sub Command1_Click()
    Dim Col As TrueOleDBGrid60.Column
    Dim Cols As TrueOleDBGrid60.Columns
    
    Dim C As Integer
    
    ' Open a database and working recordset
    On Error GoTo OpenRecSetError
    Set WK = DBEngine.Workspaces(0)
    Set DB = WK.OpenDatabase(Text3.Text)
    Set RS = DB.OpenRecordset(Text1.Text, dbOpenDynaset)
    
    Sink.RecordSet = RS
    
    Set Cols = TDBGrid1.Columns
    Set Flds = RS.Fields
    
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
    
    Label1.Caption = Str(Sink.RowCount) & "  Record(s)"
    
    Exit Sub
OpenRecSetError:
    MsgBox "Error openning Recordset!"
End Sub

Private Sub btnTrans_Click(Index As Integer)
    Select Case btnTrans(Index).Caption
    Case "Begin Trans."
        WK.BeginTrans
        btnTrans(0).Enabled = False
        btnTrans(1).Enabled = True
        btnTrans(2).Enabled = True
    Case "Commit"
        WK.CommitTrans
        btnTrans(0).Enabled = True
        btnTrans(1).Enabled = False
        btnTrans(2).Enabled = False
    Case "Rollback"
        WK.Rollback
        btnTrans(0).Enabled = True
        btnTrans(1).Enabled = False
        btnTrans(2).Enabled = False
        
        TDBGrid1.Bookmark = Null
        TDBGrid1.ReBind
    End Select
    TDBGrid1.SetFocus
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    RS.Close
    DB.Close
    WK.Close
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

