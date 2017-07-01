VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 5"
   ClientHeight    =   3435
   ClientLeft      =   1275
   ClientTop       =   1560
   ClientWidth     =   5430
   LinkTopic       =   "Form1"
   ScaleHeight     =   3435
   ScaleWidth      =   5430
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   120
      Width           =   5175
      _ExtentX        =   9128
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
      RecordSource    =   "SELECT * FROM composer, opus, composer INNER JOIN opus ON composer.last = opus.last"
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
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor5.frx":0000
      Height          =   2175
      Left            =   120
      OleObjectBlob   =   "Tutor5.frx":0015
      TabIndex        =   0
      Top             =   600
      Width           =   5175
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Clear"
      Height          =   495
      Left            =   1440
      TabIndex        =   2
      Top             =   2880
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Select"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   2880
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
' This routine loops through the Recordset to find and
' highlight all records with Country = "Germany"
    
' We shall use a clone so that we do not move the actual
' record position of the Data control
Dim dclone As ADODB.Recordset
Set dclone = Adodc1.Recordset.Clone()

' In case there is a large Recordset to search through
Screen.MousePointer = vbHourglass
    
' For each matching record, add the bookmark to the
' SelBookmarks collection of the grid.  The grid will
' highlight the corresponding rows.  Note that the bookmarks
' of a clone are compatible with the original set.
' This is ONLY true of clones.
Dim SelBks As TrueOLEDBGrid60.SelBookmarks
Set SelBks = TDBGrid1.SelBookmarks

Dim Criteria$
Criteria$ = "Germany"
dclone.MoveFirst
While Not dclone.EOF
    If dclone!Country.Value = Criteria$ Then
        SelBks.Add dclone.Bookmark
    End If
    dclone.MoveNext
Wend
    
' Restore regular mouse pointer
Screen.MousePointer = vbDefault
End Sub

Private Sub Command2_Click()
' Clear all selected rows by removing the selected records from
' the SelBookmarks collection.

Dim SelBks As TrueOLEDBGrid60.SelBookmarks
Set SelBks = TDBGrid1.SelBookmarks

While SelBks.Count
    SelBks.Remove 0
Wend
End Sub

