VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 11"
   ClientHeight    =   3855
   ClientLeft      =   1350
   ClientTop       =   1800
   ClientWidth     =   7305
   LinkTopic       =   "Form1"
   ScaleHeight     =   3855
   ScaleWidth      =   7305
   Begin VB.CommandButton Command1 
      Caption         =   "Reset the Grid"
      Height          =   495
      Index           =   2
      Left            =   5040
      TabIndex        =   2
      Top             =   3240
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Distributors"
      Height          =   495
      Index           =   1
      Left            =   2640
      TabIndex        =   1
      Top             =   3240
      Width           =   2055
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Prospective Customers"
      Height          =   495
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   3240
      Width           =   2175
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
      Bindings        =   "Tutor11.frx":0000
      Height          =   2535
      Left            =   120
      OleObjectBlob   =   "Tutor11.frx":0014
      TabIndex        =   3
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

Dim ButtonFlag As Integer
Dim Prospective As New TrueDBGrid60.Style
Dim Distributors As New TrueDBGrid60.Style

Private Sub Command1_Click(Index As Integer)
    Select Case Index
    Case 0:
        ButtonFlag = 0
        TDBGrid1.FetchRowStyle = True
    Case 1:
        ButtonFlag = 1
        TDBGrid1.FetchRowStyle = True
    Case 2:
        TDBGrid1.FetchRowStyle = False
    End Select
    
    TDBGrid1.Refresh
End Sub

Private Sub Form_Load()
    Data1.Refresh
    Set RSClone = Data1.Recordset.Clone()

    Set Prospective = TDBGrid1.Styles.Add("Prospective")
    Prospective.Font.Italic = True
    Prospective.Font.Bold = True
    Prospective.ForeColor = vbBlue
        
    Set Distributors = TDBGrid1.Styles.Add("Distributors")
    Distributors.BackColor = vbRed
    Distributors.ForeColor = vbWhite
End Sub

Private Sub TDBGrid1_FetchRowStyle(ByVal Split As Integer, Bookmark As Variant, ByVal RowStyle As TrueDBGrid60.StyleDisp)
    RSClone.Bookmark = Bookmark
        
    If ButtonFlag = 0 And RSClone("CustType").Value = 1 Then
        RowStyle = Prospective
    End If
        
    If ButtonFlag = 1 And RSClone("CustType").Value = 4 Then
        RowStyle = Distributors
    End If
End Sub

Private Sub TDBGrid1_UnboundColumnFetch(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
    RSClone.Bookmark = Bookmark
    Value = RSClone("FirstName") & " " & RSClone("LastName")
End Sub
