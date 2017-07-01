VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Object = "{FAEEE763-117E-101B-8933-08002B2F4F5A}#1.1#0"; "DBLIST32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 4"
   ClientHeight    =   5355
   ClientLeft      =   1425
   ClientTop       =   1605
   ClientWidth     =   6285
   LinkTopic       =   "Form1"
   ScaleHeight     =   5355
   ScaleWidth      =   6285
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor4.frx":0000
      Height          =   2295
      Left            =   120
      OleObjectBlob   =   "Tutor4.frx":0014
      TabIndex        =   0
      Top             =   600
      Width           =   4695
   End
   Begin MSDBCtls.DBList DBList1 
      Bindings        =   "Tutor4.frx":2604
      DataField       =   "LastName"
      DataSource      =   "Data1"
      Height          =   2010
      Left            =   120
      TabIndex        =   11
      Top             =   3240
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   3545
      _Version        =   393216
      ListField       =   "LastName"
   End
   Begin VB.TextBox Text3 
      DataField       =   "Company"
      DataSource      =   "Data1"
      Height          =   345
      Left            =   1920
      TabIndex        =   10
      Text            =   "Text3"
      Top             =   4920
      Width           =   2895
   End
   Begin VB.TextBox Text2 
      DataField       =   "LastName"
      DataSource      =   "Data1"
      Height          =   345
      Left            =   1920
      TabIndex        =   9
      Text            =   "Text2"
      Top             =   4080
      Width           =   2895
   End
   Begin VB.TextBox Text1 
      DataField       =   "FirstName"
      DataSource      =   "Data1"
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
      RecordSource    =   "Customer"
      Top             =   120
      Width           =   4695
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Company:"
      Height          =   195
      Left            =   1920
      TabIndex        =   15
      Top             =   4680
      Width           =   705
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Last Name:"
      Height          =   195
      Left            =   1920
      TabIndex        =   14
      Top             =   3840
      Width           =   810
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "First Name:"
      Height          =   195
      Left            =   1920
      TabIndex        =   13
      Top             =   3000
      Width           =   795
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Last Name List:"
      Height          =   195
      Left            =   120
      TabIndex        =   12
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

    Data1.Recordset.Edit
    Data1.Recordset.Update
    TDBGrid1.SetFocus
End Sub

Private Sub Command2_Click()
' When the current record is deleted, Jet Engine leaves
' the record pointer at the deleted record.  Use MoveNext
' to move the current record to the row after the deleted
' record.

    Data1.Recordset.Delete
    Data1.Recordset.MoveNext
    
    ' If the last record is deleted, move the current record
    ' to the last record
    
    If Data1.Recordset.EOF = True Then
        Data1.Recordset.MoveLast
    End If
    
    TDBGrid1.SetFocus
End Sub

Private Sub Command3_Click()
' This "Add New" button moves the cursor to the
' "new (blank) row" at the end so that user can start
' adding data to the new record.
   
    ' Move to last record so that "new row" will be visible
    Data1.Recordset.MoveLast
    
    ' Move the cursor to the "addnew row"
    TDBGrid1.Row = TDBGrid1.Row + 1
    TDBGrid1.SetFocus
End Sub

Private Sub Command4_Click()
' True DBGrid will follow the record movement.
    Data1.Recordset.MoveFirst
    TDBGrid1.SetFocus
End Sub

Private Sub Command5_Click()
' True DBGrid will follow the record movement.

    Data1.Recordset.MoveNext
    
' Keep the record away from EOF which is not
' a valid position
    If Data1.Recordset.EOF = True Then
        Data1.Recordset.MovePrevious
    End If
    
    TDBGrid1.SetFocus
End Sub

Private Sub Command6_Click()
' True DBGrid will follow the record movement.

    Data1.Recordset.MovePrevious
    
' Keep the record away from BOF which is not
' a valid position
    If Data1.Recordset.BOF = True Then
        Data1.Recordset.MoveNext
    End If
       
    TDBGrid1.SetFocus
End Sub

Private Sub Command7_Click()
' True DBGrid will follow the record movement.

    Data1.Recordset.MoveLast
    TDBGrid1.SetFocus
End Sub

