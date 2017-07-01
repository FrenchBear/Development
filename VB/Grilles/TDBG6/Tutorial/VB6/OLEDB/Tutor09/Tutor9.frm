VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True OLEDBGrid Pro 6.0 for VB 6 - Tutorial 9"
   ClientHeight    =   3225
   ClientLeft      =   1275
   ClientTop       =   1620
   ClientWidth     =   7305
   LinkTopic       =   "Form1"
   ScaleHeight     =   3225
   ScaleWidth      =   7305
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   120
      Width           =   7095
      _ExtentX        =   12515
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
      RecordSource    =   "SELECT * FROM Contacts INNER JOIN Customers ON Contacts.UserCode = Customers.UserCode"
      Caption         =   "Customer Contact"
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
   Begin VB.ListBox List1 
      Height          =   1230
      Left            =   5160
      TabIndex        =   0
      Top             =   1800
      Visible         =   0   'False
      Width           =   1215
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor9.frx":0000
      Height          =   2535
      Left            =   120
      OleObjectBlob   =   "Tutor9.frx":0015
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
Dim RSClone As adodb.Recordset

Private Sub Form_Load()
' Define RSClone as a clone
    Adodc1.Refresh
    Set RSClone = Adodc1.Recordset.Clone()
    
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
