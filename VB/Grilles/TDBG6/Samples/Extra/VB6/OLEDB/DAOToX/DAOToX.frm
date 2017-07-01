VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Recordset to XArray"
   ClientHeight    =   4320
   ClientLeft      =   1320
   ClientTop       =   1590
   ClientWidth     =   6630
   Icon            =   "DAOToX.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4320
   ScaleWidth      =   6630
   ShowInTaskbar   =   0   'False
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   3615
      Left            =   0
      OleObjectBlob   =   "DAOToX.frx":0442
      TabIndex        =   2
      Top             =   0
      Width           =   6615
   End
   Begin ComctlLib.ProgressBar PBar 
      Height          =   255
      Left            =   1560
      TabIndex        =   1
      Top             =   3840
      Visible         =   0   'False
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   450
      _Version        =   327682
      Appearance      =   0
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Populate"
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
      TabIndex        =   0
      Top             =   3720
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim x As New XArrayDB
Dim WK As DAO.Workspace
Dim DB As DAO.Database
Dim RS As DAO.Recordset

Private Sub Command1_Click()
    Screen.MousePointer = vbHourglass
    
    Set WK = DBEngine.Workspaces(0)
    Set DB = WK.OpenDatabase("C:\VB6\BIBLIO.MDB")
    Set RS = DB.OpenRecordset("titles", dbOpenSnapshot)
    
    Dim ColCount As Integer
    Dim RowCount As Long
    
    ' Make sure the recordset is fully populated before querying RecordCount
    RS.MoveLast
    
    ColCount = RS.Fields.Count
    RowCount = RS.RecordCount
    
    x.ReDim 0, RowCount - 1, 0, ColCount - 1
    
    With PBar
        .Visible = True
        .Max = RowCount - 1
        .Value = PBar.Min
    End With

    RS.MoveFirst
    Dim Flds As DAO.Fields
    Set Flds = RS.Fields
    
    ' Populate the XArray with data from recordset
    Dim c As Integer, r As Long
    While Not RS.EOF
        PBar.Value = r
        For c = 0 To ColCount - 1
            x.Value(r, c) = Flds(c).Value
        Next c
        RS.MoveNext
        r = r + 1
    Wend
    
    ' Configure the grid
    Dim clmn As TrueOleDBGrid60.Column
    For c = 0 To ColCount - 1
        Set clmn = TDBGrid1.Columns.Add(c)
        clmn.Visible = True
        clmn.Caption = RS.Fields(c).Name
    Next c
    
    Set TDBGrid1.Array = x
    TDBGrid1.Bookmark = Null
    TDBGrid1.ReBind
    
    PBar.Visible = False
    TDBGrid1.SetFocus
    Screen.MousePointer = vbDefault
    
    RS.Close
    DB.Close
    WK.Close
End Sub

