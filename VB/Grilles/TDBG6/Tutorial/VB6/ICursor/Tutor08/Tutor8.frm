VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 8"
   ClientHeight    =   3285
   ClientLeft      =   1275
   ClientTop       =   1620
   ClientWidth     =   7305
   LinkTopic       =   "Form1"
   ScaleHeight     =   3285
   ScaleWidth      =   7305
   Begin TrueDBGrid60.TDBDropDown TDBDropDown1 
      Bindings        =   "Tutor8.frx":0000
      Height          =   1170
      Left            =   4800
      OleObjectBlob   =   "Tutor8.frx":0014
      TabIndex        =   1
      Top             =   1800
      Width           =   2295
   End
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
      RecordSource    =   "CustType"
      Top             =   2760
      Visible         =   0   'False
      Width           =   1980
   End
   Begin VB.Data Data1 
      Caption         =   "Customer Contact"
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
      RecordSource    =   "SELECT * FROM Contacts INNER JOIN Customers ON Contacts.UserCode = Customers.UserCode"
      Top             =   120
      Width           =   7095
   End
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor8.frx":1F8E
      Height          =   2535
      Left            =   120
      OleObjectBlob   =   "Tutor8.frx":1FA2
      TabIndex        =   0
      Top             =   600
      Width           =   7095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim RSClone As Recordset

Private Sub Form_Load()
    Data1.Refresh
    Set RSClone = Data1.Recordset.Clone()
End Sub

Private Sub TDBGrid1_UnboundColumnFetch(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
    RSClone.Bookmark = Bookmark
    Value = RSClone("FirstName") & " " & RSClone("LastName")
End Sub
