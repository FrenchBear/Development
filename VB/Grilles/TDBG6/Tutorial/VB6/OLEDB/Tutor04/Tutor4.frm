VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 4"
   ClientHeight    =   5355
   ClientLeft      =   1425
   ClientTop       =   1605
   ClientWidth     =   6285
   LinkTopic       =   "Form1"
   ScaleHeight     =   5355
   ScaleWidth      =   6285
   Begin MSDataListLib.DataList DataList1 
      Bindings        =   "Tutor4.frx":0000
      DataField       =   "LastName"
      DataSource      =   "Adodc1"
      Height          =   2010
      Left            =   120
      TabIndex        =   15
      Top             =   3240
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   3545
      _Version        =   393216
      ListField       =   "LastName"
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   120
      Width           =   4695
      _ExtentX        =   8281
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
      RecordSource    =   "Customer"
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
      Bindings        =   "Tutor4.frx":0015
      Height          =   2295
      Left            =   120
      OleObjectBlob   =   "Tutor4.frx":002A
      TabIndex        =   0
      Top             =   600
      Width           =   4695
   End
   Begin VB.TextBox Text3 
      DataField       =   "Company"
      DataSource      =   "Adodc1"
      Height          =   345
      Left            =   1920
      TabIndex        =   10
      Text            =   "Text3"
      Top             =   4920
      Width           =   2895
   End
   Begin VB.TextBox Text2 
      DataField       =   "LastName"
      DataSource      =   "Adodc1"
      Height          =   345
      Left            =   1920
      TabIndex        =   9
      Text            =   "Text2"
      Top             =   4080
      Width           =   2895
   End
   Begin VB.TextBox Text1 
      DataField       =   "FirstName"
      DataSource      =   "Adodc1"
      Height          =   345
      Left            =   1920
      TabIndex        =   8
      Text            =   "Text1"
      Top             =   3240
      Width           =   2895
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Last"
      Height          =   495
      Left            =   4920
      TabIndex        =   7
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Previous"
      Height          =   495
      Left            =   4920
      TabIndex        =   6
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Next"
      Height          =   495
      Left            =   4920
      TabIndex        =   5
      Top             =   3600
      Width           =   1215
   End
   Begin VB.CommandButton Command4 
      Caption         =   "First"
      Height          =   495
      Left            =   4920
      TabIndex        =   4
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Add New"
      Height          =   495
      Left            =   4920
      TabIndex        =   3
      Top             =   2040
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Delete"
      Height          =   495
      Left            =   4920
      TabIndex        =   2
      Top             =   1320
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Update"
      Height          =   495
      Left            =   4920
      TabIndex        =   1
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Company:"
      Height          =   195
      Left            =   1920
      TabIndex        =   14
      Top             =   4680
      Width           =   705
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Last Name:"
      Height          =   195
      Left            =   1920
      TabIndex        =   13
      Top             =   3840
      Width           =   810
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "First Name:"
      Height          =   195
      Left            =   1920
      TabIndex        =   12
      Top             =   3000
      Width           =   795
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Last Name List:"
      Height          =   195
      Left            =   120
      TabIndex        =   11
      Top             =   3000
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
' True DBGrid will automatically respond to the
' update and will clear the "modified indicator"
' (the pencil icon) on the record selector column
' to indicate that the modified data has been written
' to the database.

    If Adodc1.Recordset.EditMode = adEditInProgress Or _
            Adodc1.Recordset.EditMode = adEditAdd Then
        Adodc1.Recordset.Update
    End If
    TDBGrid1.SetFocus
End Sub

Private Sub Command2_Click()
' When the current record is deleted, Jet Engine leaves
' the record pointer at the deleted record.  Use MoveNext
' to move the current record to the row after the deleted
' record.

    Adodc1.Recordset.Delete
    Adodc1.Recordset.MoveNext
    
    ' If the last record is deleted, move the current record
    ' to the last record
    
    If Adodc1.Recordset.EOF = True Then
        Adodc1.Recordset.MoveLast
    End If
    
    TDBGrid1.SetFocus
End Sub

Private Sub Command3_Click()
' This "Add New" button moves the cursor to the
' "new (blank) row" at the end so that user can start
' adding data to the new record.
   
    ' Move to last record so that "new row" will be visible
    Adodc1.Recordset.MoveLast
    
    ' Move the cursor to the "addnew row"
    TDBGrid1.Row = TDBGrid1.Row + 1
    TDBGrid1.SetFocus
End Sub

Private Sub Command4_Click()
' True DBGrid will follow the record movement.
    Adodc1.Recordset.MoveFirst
    TDBGrid1.SetFocus
End Sub

Private Sub Command5_Click()
' True DBGrid will follow the record movement.

    Adodc1.Recordset.MoveNext
    
' Keep the record away from EOF which is not
' a valid position
    If Adodc1.Recordset.EOF = True Then
        Adodc1.Recordset.MovePrevious
    End If
    
    TDBGrid1.SetFocus
End Sub

Private Sub Command6_Click()
' True DBGrid will follow the record movement.

    Adodc1.Recordset.MovePrevious
    
' Keep the record away from BOF which is not
' a valid position
    If Adodc1.Recordset.BOF = True Then
        Adodc1.Recordset.MoveNext
    End If
       
    TDBGrid1.SetFocus
End Sub

Private Sub Command7_Click()
' True DBGrid will follow the record movement.

    Adodc1.Recordset.MoveLast
    TDBGrid1.SetFocus
End Sub

