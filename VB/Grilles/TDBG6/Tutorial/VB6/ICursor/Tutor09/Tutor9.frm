VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 9"
   ClientHeight    =   3225
   ClientLeft      =   1275
   ClientTop       =   1620
   ClientWidth     =   7305
   LinkTopic       =   "Form1"
   ScaleHeight     =   3225
   ScaleWidth      =   7305
   Begin VB.ListBox List1 
      Height          =   1230
      Left            =   5160
      TabIndex        =   0
      Top             =   1800
      Visible         =   0   'False
      Width           =   1215
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
      Bindings        =   "Tutor9.frx":0000
      Height          =   2535
      Left            =   120
      OleObjectBlob   =   "Tutor9.frx":0014
      TabIndex        =   1
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
' Define RSClone as a clone
    Data1.Refresh
    Set RSClone = Data1.Recordset.Clone()
    
' Add customer types to List1
    List1.AddItem "Prospective"
    List1.AddItem "Normal"
    List1.AddItem "Buyer"
    List1.AddItem "Distributor"
    List1.AddItem "Other"

' Place a button in the CustType column
    TDBGrid1.Columns("CustType").Button = True
End Sub

Private Sub List1_DblClick()
' When an item is selected in List1, copy its index to
' the proper column in TDBGrid1, then make List1
' invisible.
    TDBGrid1.Columns(1).Text = List1.ListIndex + 1
    List1.Visible = False
End Sub

Private Sub List1_LostFocus()
' Hide the list if it loses focus.
    List1.Visible = False
End Sub

Private Sub TDBGrid1_BeforeColEdit(ByVal ColIndex As Integer, ByVal KeyAscii As Integer, Cancel As Integer)
' BeforeColEdit is called before the grid enters into
' edit mode.  You can decide what happens and whether
' standard editing proceeds.  This allows you to
' substitute different kinds of editing for the current
' cell, as is done here.

    If ColIndex = 1 Then
        ' Let the user edit by entering a key.
        If KeyAscii <> 0 Then Exit Sub
      
        ' Otherwise, cancel built-in editing and call the
        ' ButtonClick event to drop down List1.
        Cancel = True
        TDBGrid1_ButtonClick (ColIndex)
    End If
End Sub

Private Sub TDBGrid1_ButtonClick(ByVal ColIndex As Integer)
' Assign the Column object to Co because it will be used
' more than once.
    Dim Co As Column
    Set Co = TDBGrid1.Columns(ColIndex)
    
' Position and drop down List1 at the right edge of the
' current cell.
    List1.Left = TDBGrid1.Left + Co.Left + Co.Width
    List1.Top = TDBGrid1.Top + TDBGrid1.RowTop(TDBGrid1.Row)
    List1.Visible = True
    List1.ZOrder 0
    List1.SetFocus
End Sub

Private Sub TDBGrid1_Scroll(Cancel As Integer)
' Hide the list if we scroll.
    List1.Visible = False
End Sub

Private Sub TDBGrid1_UnboundColumnFetch(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
    RSClone.Bookmark = Bookmark
    Value = RSClone("FirstName") & " " & RSClone("LastName")
End Sub
