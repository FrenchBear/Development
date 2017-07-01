VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3510
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3510
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   435
      Left            =   1500
      TabIndex        =   3
      Top             =   3000
      Width           =   735
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   2880
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   2580
      TabIndex        =   1
      Top             =   2880
      Visible         =   0   'False
      Width           =   1215
   End
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Height          =   2775
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   4895
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub Command1_Click()
    MSFlexGrid1.CellBackColor = RGB(128 * Rnd + 127, 128 * Rnd + 127, 128 * Rnd + 127)
End Sub

Private Sub Form_Load()
    MSFlexGrid1.Rows = 50
    MSFlexGrid1.Cols = 3
    
    MSFlexGrid1.TextMatrix(1, 2) = "R1C2"
    
End Sub

Private Sub MSFlexGrid1_DblClick()
   GridEdit Asc(" ")
End Sub

Private Sub MSFlexGrid1_KeyPress(KeyAscii As Integer)
   GridEdit KeyAscii
End Sub

Sub GridEdit(KeyAscii As Integer)
   'use correct font
   Text1.FontName = MSFlexGrid1.FontName
   Text1.FontSize = MSFlexGrid1.FontSize
   Select Case KeyAscii
      Case 0 To Asc(" ")
         Text1 = MSFlexGrid1
         Text1.SelStart = 1000
      Case Else
         Text1 = Chr(KeyAscii)
         Text1.SelStart = 1
   End Select
   
   'position the edit box
   Text1.Left = MSFlexGrid1.CellLeft + MSFlexGrid1.Left
   Text1.Top = MSFlexGrid1.CellTop + MSFlexGrid1.Top
   Text1.Width = MSFlexGrid1.CellWidth
   Text1.Height = MSFlexGrid1.CellHeight
   Text1.Visible = True
   Text1.SetFocus
End Sub



Private Sub MSFlexGrid1_LeaveCell()
   If Text1.Visible Then
      MSFlexGrid1 = Text1
      Text1.Visible = False
   End If
End Sub

Private Sub MSFlexGrid1_GotFocus()
   If Text1.Visible Then
      MSFlexGrid1 = Text1
      Text1.Visible = False
   End If
End Sub

Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)
   Select Case KeyCode
      Case vbKeyEscape
         Text1.Visible = False
         MSFlexGrid1.SetFocus
      Case vbKeyReturn
         MSFlexGrid1.SetFocus
      Case vbKeyDown
         MSFlexGrid1.SetFocus
         DoEvents
         If MSFlexGrid1.Row < MSFlexGrid1.Rows - 1 Then
            MSFlexGrid1.Row = MSFlexGrid1.Row + 1
         End If
      Case vbKeyUp
         MSFlexGrid1.SetFocus
         DoEvents
         If MSFlexGrid1.Row > MSFlexGrid1.FixedRows Then
            MSFlexGrid1.Row = MSFlexGrid1.Row - 1
         End If
   End Select
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
   'noise suppression
   If KeyAscii = vbKeyReturn Then KeyAscii = 0
End Sub



