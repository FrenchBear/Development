VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form DataBoundForm 
   Caption         =   "WebBrowser - DataBound Form"
   ClientHeight    =   5910
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11820
   LinkTopic       =   "Form1"
   ScaleHeight     =   5910
   ScaleWidth      =   11820
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Height          =   975
      Left            =   3000
      TabIndex        =   2
      Top             =   4920
      Width           =   8775
      Begin VB.TextBox txtRevenue 
         Alignment       =   1  'Right Justify
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   7320
         TabIndex        =   6
         Top             =   480
         Width           =   1335
      End
      Begin VB.TextBox txtUnits 
         Alignment       =   1  'Right Justify
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Left            =   5280
         TabIndex        =   4
         Top             =   487
         Width           =   735
      End
      Begin VB.Label lblProductName 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   11.25
            Charset         =   161
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   120
         Width           =   8535
      End
      Begin VB.Label Label2 
         Caption         =   "Revenue"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   6360
         TabIndex        =   5
         Top             =   540
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "Units Sold"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4200
         TabIndex        =   3
         Top             =   540
         Width           =   1215
      End
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser2 
      Height          =   4935
      Left            =   2880
      TabIndex        =   1
      Top             =   0
      Width           =   8895
      ExtentX         =   15690
      ExtentY         =   8705
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   5895
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2895
      ExtentX         =   5106
      ExtentY         =   10398
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
End
Attribute VB_Name = "DataBoundForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' The ShowAllCategories subroutine connects to the local SQL Server
' and retrieves the names and IDs of all rows in the Categories table.
' These values (which are stored in the RS Recordset) are used to
' populate the WebBrowser control on the left,
' which acts as a navigational tool.
Private Sub ShowAllCategories()
 Dim CN As New ADODB.Connection
    Dim RS As ADODB.Recordset
    
    CN.ConnectionString = "Provider=SQLOLEDB.1;User ID=sa;Initial Catalog=Northwind;Data Source=ATHENS"
    CN.Open
    Set RS = CN.Execute("SELECT CategoryID, CategoryName FROM Categories")
    Dim iCol As Integer
    Dim HTMLText As String
    HTMLText = "<HTML><BODY BGCOLOR=#FFEEEE><TABLE>"
    RS.MoveFirst
    While Not RS.EOF
        HTMLText = HTMLText & "<TR>"
        HTMLText = HTMLText & "<TD><A HREF='CATEGORYID?" & RS.Fields(0) & "'><FONT SIZE=4>" & RS.Fields(1).Value & "</FONT></A></TD>"
        RS.MoveNext
        HTMLText = HTMLText & "</TR>"
    Wend
    CN.Close
    HTMLText = HTMLText & "</TABLE></BODY></HTML>"
    WebBrowser1.Document.script.Document.Clear
    WebBrowser1.Document.script.Document.Write HTMLText
    WebBrowser1.Document.script.Document.Close
End Sub

Private Sub Form_Load()
    WebBrowser1.Navigate2 "about:blank"
    WebBrowser2.Navigate2 "about:blank"
    Me.MousePointer = vbHourglass
    ShowAllCategories
    Me.MousePointer = vbDefault
End Sub

Private Sub Form_Resize()
    WebBrowser2.Width = Me.Width - WebBrowser2.Left - 14 * Screen.TwipsPerPixelX
    WebBrowser2.Height = Me.Height - WebBrowser2.Top - Frame1.Height - 30 * Screen.TwipsPerPixelX
    Frame1.Top = WebBrowser2.Top + WebBrowser2.Height + 1 * Screen.TwipsPerPixelY
    WebBrowser1.Height = Frame1.Top + Frame1.Height - 6 * Screen.TwipsPerPixelY
End Sub

' When the user selects a category on the WebBrowser1 control,
' the BeforeNavigate2 event is raised. In this event's handler
' we extract the part of the URL following the question mark.
' This part of the URL is the ID of the selected category.
' This ID is passed to the ShowProductsInCategory() subroutine, which
' displays the products in the selected category on the right pane.
Private Sub WebBrowser1_BeforeNavigate2(ByVal pDisp As Object, URL As Variant, Flags As Variant, TargetFrameName As Variant, PostData As Variant, Headers As Variant, Cancel As Boolean)
    Dim pos As Integer
    pos = InStr(URL, "?")
    If pos > 0 Then
        Cancel = True
        ShowProductsInCategory (CInt(Mid(URL, pos + 1)))
    End If
End Sub

' The ShowProductsInCategory subroutine connects to the local SQL Server
' and retrieves information about the rows of the Products table that
' belong to the category specified by the CategoryID argument.
' These values (which are stored in the RS Recordset) are used to
' populate the WebBrowser control on the right.

' The core of this subroutine, as well as the core of the ShowCategories subroutine,
' is a While loop that iterates through the rows of the RS Recordset and
' builds an HTML table, which is rendered on the corresponding WebBrowser control.
Private Sub ShowProductsInCategory(CategoryID As Integer)
    Dim CN As New ADODB.Connection
    Dim RS As ADODB.Recordset
   
    CN.ConnectionString = "Provider=SQLOLEDB.1;User ID=sa;Initial Catalog=Northwind;Data Source=ATHENS"
    CN.Open
    Set RS = CN.Execute("SELECT ProductID, ProductName, CompanyName, UnitPrice FROM Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID WHERE Products.categoryID=" & CategoryID)
    Dim iCol, iRow As Integer
    Dim HTMLText As String
    HTMLText = "<HTML><BODY BGCOLOR=#FFFFEE><TABLE BORDER=ALL>"
    HTMLText = HTMLText & "<TR><TD></TD><TD BGCOLOR=black><FONT FACE='Verdana' SIZE=3 COLOR=#FFFFEE>ProductName</FONT></TD><TD BGCOLOR=black><FONT FACE='Verdana' SIZE=3 COLOR=#FFFFEE>Supplier</FONT></TD><TD BGCOLOR=black><FONT FACE='Verdana' SIZE=3 COLOR=#FFFFEE>Price</TD></TR>"
    RS.MoveFirst
    While Not RS.EOF
        HTMLText = HTMLText & "<TR>"
        HTMLText = HTMLText & "<TD><A HREF=ShowSales?" & RS.Fields(0).Value & "><FONT FACE='VERDANA' SIZE=2>Sales</FONT></A></TD>"
        For iCol = 1 To RS.Fields.Count - 1
            If RS.Fields(iCol).Type = adInteger Or RS.Fields(iCol).Type = adNumeric Or _
                    RS.Fields(iCol).Type = adCurrency Or RS.Fields(iCol).Type = adDecimal Or RS.Fields(iCol).Type = adSingle Then
                HTMLText = HTMLText & vbCrLf & "<TD ALIGN=right VALIGN=top><FONT FACE='Verdana' SIZE=2>" & Format(RS.Fields(iCol).Value, "$#,###.00") & "</FONT></TD>"
            Else
                HTMLText = HTMLText & vbCrLf & "<TD ALIGN=left VALIGN=top><FONT FACE='Verdana' SIZE=2>" & RS.Fields(iCol).Value & "</FONT></TD>"
            End If
        Next
        RS.MoveNext
        HTMLText = HTMLText & "</TR>"
    Wend
    CN.Close
    HTMLText = HTMLText & "</TABLE></FORM></BODY></HTML>"
    WebBrowser2.Document.script.Document.Clear
    WebBrowser2.Document.script.Document.Write HTMLText
    WebBrowser2.Document.script.Document.Close
End Sub

' When the user clicks the Sales hyperlink on a product's row,
' the BeforeNavigate2 of the WebBrowser2 control.
' In this event's handler we extract the part of the URL following t
' he question mark. This part of the URL is the ID of the selected
' product. This ID is passed to the ShowSales() subroutine,
' which displays sales information about the selected product on the
' TextBox controls at the bottom of the form.
Private Sub WebBrowser2_BeforeNavigate2(ByVal pDisp As Object, URL As Variant, Flags As Variant, TargetFrameName As Variant, PostData As Variant, Headers As Variant, Cancel As Boolean)
    Dim pos As Integer
    pos = InStr(URL, "?")
    If pos > 0 Then
        Cancel = True
        ShowSales (CInt(Mid(URL, pos + 1)))
    End If
End Sub

' The ShowSales subroutine connects to the local SQL Server
' and retrieves sales information about the selected product.
' The program calls the ProductSales stored procedure to retrieve
' the number of units sold and the total revenue they generated.
Private Sub ShowSales(ProdID As Integer)
    Dim CN As New ADODB.Connection
    Dim RS As ADODB.Recordset
   
    CN.ConnectionString = "Provider=SQLOLEDB.1;User ID=sa;Initial Catalog=Northwind;Data Source=ATHENS"
    CN.Open
    Dim CMD As New ADODB.Command
    CMD.ActiveConnection = CN
    CMD.CommandText = "ProductSales"
    CMD.CommandType = adCmdStoredProc
    Dim Param1 As New ADODB.Parameter
    ' The first parameter is the ID of the selected product
    Param1.Direction = adParamInput
    Param1.Type = adInteger
    Param1.Value = ProdID
    CMD.Parameters.Append Param1
    ' The second parameter is the number of units sold and it's an output parameter
    Dim Param2 As New ADODB.Parameter
    Param2.Direction = adParamOutput
    Param2.Type = adInteger
    CMD.Parameters.Append Param2
    ' The third parameter is the total revenue generated by the specific product and it's also an output parameter
    Dim param3 As New ADODB.Parameter
    param3.Direction = adParamOutput
    param3.Type = adDecimal
    param3.Precision = 18
    param3.NumericScale = 2
    CMD.Parameters.Append param3
    
    Dim param4 As New ADODB.Parameter
    param4.Direction = adParamOutput
    param4.Type = adVarWChar
    param4.Size = 100
    CMD.Parameters.Append param4
    
    CMD.Execute
    
    txtUnits.Text = CMD.Parameters(1)
    txtRevenue.Text = Format(CMD.Parameters(2), "#,###.00")
    lblProductName.Caption = CMD.Parameters(3)
    CN.Close
End Sub

' The ProductSales stored procedure that retrieves sales data about a specific product
' must be attached to the database before you can use this form of the project.
' Its listing is shown next. Copy the following code, delete the two comment marks in
' front of each line and use the T-SQL code to attach the ProductSales stored procedure
' to the Northwind database.

'' ALTER PROCEDURE dbo.ProductSales
'' @ProductID int,
'' @Units int OUTPUT,
'' @Revenue decimal(12,2) OUTPUT,
'' @Name varchar(100) OUTPUT
''
'' AS
'' DECLARE @ProdName varchar
'' DECLARE ProductSales CURSOR
''    KEYSET
''    FOR SELECT  SUM([Order Details].Quantity),
''                SUM([Order Details].UnitPrice*[Order Details].Quantity*(1-[Order Details].Discount)),
''                Products.ProductName
''                FROM [Order Details] INNER JOIN Products
''                                        ON Products.ProductID = [Order Details].ProductID
''                WHERE [Order Details].ProductID=@ProductID GROUP BY ProductName
''    OPEN ProductSales
''    FETCH FIRST FROM ProductSales INTO @Units, @Revenue, @Name

