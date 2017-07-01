VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form BigAd 
   Caption         =   "APEX True DBGrid Pro 6.0"
   ClientHeight    =   6570
   ClientLeft      =   1230
   ClientTop       =   1590
   ClientWidth     =   12135
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   6570
   ScaleWidth      =   12135
   Begin TrueDBGrid60.TDBDropDown TDBDropDown1 
      Height          =   2145
      Left            =   840
      OleObjectBlob   =   "BigAd.frx":0000
      TabIndex        =   1
      Top             =   4080
      Width           =   1815
   End
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Height          =   6385
      Left            =   120
      OleObjectBlob   =   "BigAd.frx":5C62
      TabIndex        =   0
      Top             =   120
      Width           =   11925
   End
End
Attribute VB_Name = "BigAd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim cols As TrueDBGrid60.Columns

Private Sub Form_Load()
    Set cols = TDBGrid1.Columns
    
    cols("Supplier Country").HeadingStyle.Alignment = dbgCenter
    cols("Supplier Country").Caption = "Supplier" & vbCrLf & "Country"
    
    TDBGrid1.Splits(1).Columns("Product Number").HeadingStyle.Alignment = dbgCenter
    cols("Product Number").Caption = "Product" & vbCrLf & "Number"
    
    TDBGrid1.Splits(1).Columns("Price Per Item").HeadingStyle.Alignment = dbgCenter
    cols("Price Per Item").FooterText = "$198.45"
    cols("Price Per Item").Caption = "Price" & vbCrLf & "Per Item"
    
    cols("Product Line").FooterText = "Total Sale Items:"
    cols("On Sale").FooterText = "25"
    
    cols("Description").FooterText = "Average Price:"
    cols("Description").FooterText = "Average Price:"
   
    LoadX

    Set TDBDropDown1.Array = xd
    Set TDBGrid1.Array = x
    

End Sub

Private Sub TDBGrid1_FetchCellStyle(ByVal Condition As Integer, ByVal Split As Integer, Bookmark As Variant, ByVal Col As Integer, ByVal CellStyle As TrueDBGrid60.StyleDisp)
Select Case Col
  Case 6
    If cols("Reorder").CellText(Bookmark) > cols("on hand").CellText(Bookmark) Then
      CellStyle.BackColor = vbRed
      CellStyle.Font.Bold = True
    End If
    
Case 5
    If cols("On Sale").CellValue(Bookmark) = 1 Then
        CellStyle.Font.Italic = True
        CellStyle.Font.Bold = True
        CellStyle.ForeColor = vbMagenta
        
    End If
End Select
  
End Sub

Private Sub TDBGrid1_FetchCellTips(ByVal SplitIndex As Integer, ByVal ColIndex As Integer, _
ByVal RowIndex As Long, CellTip As String, ByVal FullyDisplayed As Boolean, ByVal TipStyle As TrueDBGrid60.StyleDisp)
    Select Case SplitIndex
    Case 1
        Select Case ColIndex
        Case 3
            CellTip = "Use the Product Number when placing an order"
            TipStyle.WrapText = True
            TipStyle.Font.Bold = True
            TipStyle.BackColor = vbCyan
        End Select
    End Select
    
End Sub


