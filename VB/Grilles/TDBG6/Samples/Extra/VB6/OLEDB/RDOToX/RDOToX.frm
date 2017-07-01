VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Resultset to XArray"
   ClientHeight    =   4335
   ClientLeft      =   1335
   ClientTop       =   1575
   ClientWidth     =   6630
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "RDOToX.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4335
   ScaleWidth      =   6630
   ShowInTaskbar   =   0   'False
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   3615
      Left            =   0
      OleObjectBlob   =   "RDOToX.frx":0442
      TabIndex        =   2
      Top             =   0
      Width           =   6615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Populate"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   3720
      Width           =   1215
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   1560
      TabIndex        =   1
      Top             =   3780
      Width           =   2055
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
    Dim envEnv As rdoEnvironment
    Dim Con As rdoConnection
    Dim strDSN As String, strSQL As String
    Dim rdoResSet As rdoResultset
    
    Set envEnv = rdoCreateEnvironment("", "", "")
    envEnv.CursorDriver = rdUseNone
    
    strDSN = InputBox("Enter ODBC Name...")
    strSQL = InputBox("Enter an SQL string:")
    
    Screen.MousePointer = vbHourglass
    
    Set Con = envEnv.OpenConnection(strDSN)
    Set rdoResSet = Con.OpenResultset(strSQL, rdOpenForwardOnly, rdConcurReadOnly)
    
    Dim ColCount As Integer
    ColCount = rdoResSet.rdoColumns.Count
    
    ' Avoid executing ReDim many times - it is time and resource consuming
    ' Using following technique if we had for example 5000 rows
    ' we have to execute ReDim only 5 - 6 times.  This is
    ' a significant improvement over ReDim or Insert for every row
    
    ' Make room for 1000 rows initially
    x.ReDim 0, 999, 0, ColCount - 1
    
    Dim rdoCols As rdoColumns
    Set rdoCols = rdoResSet.rdoColumns
    
    Dim c As Integer, r As Long
    While Not rdoResSet.EOF
        ' Fill in the values from the resultset
        For c = 0 To ColCount - 1
            x(r, c) = rdoCols(c).Value
        Next c
        
        r = r + 1
            
        ' If we run out of space, make room for another 1000 rows
        If r >= x.Count(1) Then
            x.ReDim 0, x.Count(1) + 999, 0, ColCount - 1
            DoEvents
            Label1.Caption = Str(r) & " records retrieved"
        End If
        
        rdoResSet.MoveNext
    Wend
    
    ' One last ReDim - for the actual number of records
    x.ReDim 0, r - 1, 0, ColCount - 1
    Label1.Caption = Str(r) & " records retrieved"
    
    Dim clmn As TrueOleDBGrid60.Column
    For c = 0 To ColCount - 1
        Set clmn = TDBGrid1.Columns.Add(c)
        clmn.Visible = True
        clmn.Caption = rdoCols(c).Name
    Next c
    
    Set TDBGrid1.Array = x
    
    TDBGrid1.Bookmark = Null
    TDBGrid1.ReBind
    Screen.MousePointer = vbDefault
    TDBGrid1.SetFocus
    
    rdoResSet.Close
    Con.Close
End Sub

