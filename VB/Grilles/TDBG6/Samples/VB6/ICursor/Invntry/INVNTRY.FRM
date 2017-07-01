VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00808000&
   Caption         =   "Inventory Styles"
   ClientHeight    =   5655
   ClientLeft      =   1665
   ClientTop       =   1875
   ClientWidth     =   9840
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "INVNTRY.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5655
   ScaleWidth      =   9840
   Begin VB.Data Data2 
      Caption         =   "Data2"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   1200
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   5160
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   120
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   5160
      Visible         =   0   'False
      Width           =   9495
   End
   Begin TrueDBGrid60.TDBDropDown TDBDropDown1 
      Bindings        =   "INVNTRY.frx":0442
      Height          =   1575
      Left            =   7680
      OleObjectBlob   =   "INVNTRY.frx":0456
      TabIndex        =   1
      Top             =   3480
      Width           =   1695
   End
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "INVNTRY.frx":293C
      Height          =   4935
      Left            =   120
      OleObjectBlob   =   "INVNTRY.frx":2950
      TabIndex        =   0
      Top             =   120
      Width           =   9510
   End
   Begin VB.Menu mnuSelect 
      Caption         =   "&Select"
      Begin VB.Menu mnuReset 
         Caption         =   "None"
      End
      Begin VB.Menu mItemsToOrder 
         Caption         =   "Items to Order"
      End
      Begin VB.Menu mHighlightItems 
         Caption         =   "Product Lines"
      End
      Begin VB.Menu mseperator 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "&Exit"
      End
   End
   Begin VB.Menu HelpMenuOption 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpOption 
         Caption         =   "&Contents"
         Index           =   1
      End
      Begin VB.Menu mnuHelpOption 
         Caption         =   "&About Inventory Styles..."
         Index           =   2
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ---------------------------------------------------------
'       Copyright ©1995-1998 APEX Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True DBGrid Pro 6 sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that APEX Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------


Dim rs As Recordset
Dim ButtonFlag As Variant
Dim ProdLine As Variant
Dim Col As TrueDBGrid60.Column
Dim Cols As TrueDBGrid60.Columns
Dim Flag As Integer
Dim dbDir As String

' Define New Style that will be used within this Application
Dim ItemSelected As New TrueDBGrid60.Style

Private Sub Form_Load()
  ' Set the database property of the data controls
  dbDir = App.Path
  Data1.DatabaseName = dbDir + "\Invntry.mdb"
  Data1.RecordSource = "Select * From Inventory Order By Product_Line, Product_Number"
  ' Data2 is the data control used for TDBDropDown1
  Data2.DatabaseName = dbDir + "\Invntry.mdb"
  Data2.RecordSource = "Select Distinct Product_Line From Inventory"

  ' Set flag which will be used to know when to create
  ' a new clone in the FetchRowStyle event.
  Flag = True

  Data2.Refresh
  Data1.Refresh
  Set rs = Data1.Recordset.Clone
    
  ' Set some grid and column properties.
  Dim C As TrueDBGrid60.Column
  For Each C In TDBGrid1.Columns
   C.HeadAlignment = 2
   C.HeadingStyle.WrapText = True
  Next

  TDBGrid1.HeadLines = 2
  TDBGrid1.MarqueeStyle = dbgDottedCellBorder
  TDBGrid1.HighlightRowStyle.BackColor = vbBlue
  TDBGrid1.FetchRowStyle = True
        
  ' Define a New Style that will be used within this Application
  Set OrderItems = TDBGrid1.Styles.Add("ItemSelected")
  OrderItems.BackColor = vbBlue
  OrderItems.ForeColor = vbWhite

  ' Define the Style that will be used for items that are 0
  Dim NoItem As New TrueDBGrid60.Style
  NoItem.BackColor = vbRed
  TDBGrid1.Columns("Number_On_hand").AddRegexCellStyle dbgNormalCell, NoItem, "^0"
  TDBGrid1.Columns("Number_On_hand").AddRegexCellStyle dbgNormalCell + dbgCurrentCell, NoItem, "^0"
  
  ButtonFlag = 3
  
  'Set the ListField property of the drop-down
  TDBDropDown1.ListField = "Product Line"
End Sub

Private Sub Form_Resize()
  'Make the grid to the size of the form
  TDBGrid1.Move 0, 0, ScaleWidth, ScaleHeight
End Sub

Private Sub mHighlightItems_Click()
  ' Set ButtonFlag to 2 for the FetchRowStyle routine
  ButtonFlag = 2
    
  ' Display an InputBox asking the user for the Product Line number they wish to highlight
  ProdLine = InputBox("Enter the Product Line to Highlight." & _
    NL & "Enter 000 to Highlight the Product Line for the Current Item." & NL & _
    "Click Cancel to abort.", "SELECT PRODUCT LINE")
   
  ' Check the value of ProdLine if i is an empty string("") then exit the routine (this would
  ' happen if the user clicked on the Cancel button), else if the user entered 000 in the
  ' InputBox then retrieve the Product Line number for the current row in the grid, else
  ' pass ProdLine to FetchRowStyle
  If ProdLine = "" Then
    Exit Sub
  Else
   If ProdLine = "000" Then
     ' Assign the bookmark of the recordset clone to the grid's current row bookmark
     rs.Bookmark = TDBGrid1.Bookmark
     ' Assign the value of the current row's Product Line to ProdLine
     ProdLine = rs("Product_Line")
   End If
  End If

  Flag = True
  TDBGrid1.Refresh
End Sub

Private Sub mItemsToOrder_Click()
  ' Set ButtonFlag to 1 for the FetchRowStyle routine
  ButtonFlag = 1
  Flag = True
  TDBGrid1.Refresh
End Sub

Private Sub mnuExit_Click()
  End
End Sub

Private Sub mnuHelpOption_Click(Index As Integer)
Dim temp
Dim HelpDir As String

On Error GoTo ErrorRoutine

HelpDir = "WinHelp.exe " + dbDir + "\Invntry.hlp"
  
Select Case Index
  'Case 1 will bring up the help file for Inventory Styles.
  Case 1
    temp = Shell(HelpDir, vbNormalFocus)
  'Case 2 shows the about box for Inventory Styles.
  Case 2
    About.Show 1
End Select
  
ErrorRoutine:
  If Err = 53 Then
    MsgBox "WinHelp.exe could not be found"
  End If
End Sub

Private Sub mnuReset_Click()
  ' Set the ButtonFlag to 3 for the FetchRowStyle routine
  ButtonFlag = 3
  Flag = True
  TDBGrid1.Refresh
End Sub

Private Sub TDBDropDown1_UnboundColumnFetch(Bookmark As Variant, ByVal Col As Integer, Value As Variant)
  Select Case TDBDropDown1.Columns("Product_Line").CellText(Bookmark)
    Case "020"
      Value = "Home/Office"
    Case "050"
      Value = "Office"
    Case "020"
      Value = "Home/Office"
    Case "200"
      Value = "Dining Room"
    Case "250"
      Value = "Family/Living Room"
    Case "300"
      Value = "Bar/Grill"
    Case "400"
      Value = "Audio/Video"
  End Select
End Sub

Private Sub TDBGrid1_FetchRowStyle(ByVal Split As Integer, Bookmark As Variant, ByVal RowStyle As StyleDisp)
  If Flag = True Then
    Set rs = Data1.Recordset.Clone
    Flag = False
  End If

  rs.Bookmark = Bookmark

  ' Check ButtonFlag, process as necessary
  ' If the ButtonFlag is 1 then highlight the Rows where the Quantity
  ' On Hand is less than or equal to the Reorder Level.
  Select Case ButtonFlag
    Case 1
      If Val(rs("Number_On_Hand")) <= Val(rs("Reorder_Level")) Then
        RowStyle = "ItemSelected"
        RowStyle = "ItemSelected"
      End If
    Case 2
      ' If the ButtonFlag is 2 then highlight the cells in the rows where the Product
      ' Line of the Row is equal to the value passed in ProdLine (ProdLine is a variable
      ' that is passed from the Command2_Click event's InputBox)
      If rs("Product_Line") = ProdLine Then
        RowStyle = "ItemSelected"
        RowStyle = "ItemSelected"
      End If
    Case 3
      ' If the ButtonFlag is 3 then reset the grid's background to the initial colors
      ' that were displayed
        RowStyle = TDBGrid1.Styles("Normal")
  End Select
End Sub






