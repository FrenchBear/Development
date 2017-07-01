VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.2#0"; "comctl32.ocx"
Begin VB.Form frmLVStyles 
   Caption         =   "ListView Style Demo"
   ClientHeight    =   6210
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12255
   Icon            =   "FLVStyles.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6210
   ScaleWidth      =   12255
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Height          =   975
      Left            =   60
      TabIndex        =   7
      Top             =   840
      Width           =   9255
      Begin VB.OptionButton Option1 
         Caption         =   "IListItem Hack"
         Height          =   195
         Index           =   2
         Left            =   4320
         TabIndex        =   15
         Top             =   690
         Width           =   2175
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Collection Lookup Sort"
         Height          =   195
         Index           =   1
         Left            =   4320
         TabIndex        =   12
         Top             =   450
         Width           =   2175
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Knowledge Base Sort"
         Height          =   195
         Index           =   0
         Left            =   4320
         TabIndex        =   11
         ToolTipText     =   "Based on Microsoft KB Q170884"
         Top             =   210
         Value           =   -1  'True
         Width           =   1875
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Refill List"
         Height          =   375
         Left            =   1260
         TabIndex        =   9
         Top             =   390
         Width           =   1335
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   120
         TabIndex        =   8
         Text            =   "Text1"
         Top             =   480
         Width           =   975
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Label4"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   7200
         TabIndex        =   16
         Top             =   690
         Width           =   585
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Label3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   7200
         TabIndex        =   14
         Top             =   450
         Width           =   585
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Label2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   7200
         TabIndex        =   13
         Top             =   210
         Width           =   585
      End
      Begin VB.Label Label1 
         Caption         =   "ListItems:"
         Height          =   195
         Left            =   120
         TabIndex        =   10
         Top             =   270
         Width           =   735
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Extended ListView Styles"
      Height          =   735
      Left            =   60
      TabIndex        =   1
      Top             =   60
      Width           =   10995
      Begin VB.CommandButton Command3 
         Caption         =   "Adjust Widths"
         Height          =   375
         Left            =   9360
         TabIndex        =   18
         Top             =   225
         Width           =   1335
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Flip Columns"
         Height          =   375
         Left            =   7740
         TabIndex        =   17
         Top             =   225
         Width           =   1335
      End
      Begin VB.CheckBox Check1 
         Caption         =   "HeaderDrag"
         Height          =   195
         Index           =   4
         Left            =   6060
         TabIndex        =   6
         Top             =   360
         Width           =   1515
      End
      Begin VB.CheckBox Check1 
         Caption         =   "CheckBoxes"
         Height          =   195
         Index           =   3
         Left            =   4560
         TabIndex        =   5
         Top             =   360
         Width           =   1515
      End
      Begin VB.CheckBox Check1 
         Caption         =   "GridLines"
         Height          =   195
         Index           =   2
         Left            =   3120
         TabIndex        =   4
         Top             =   360
         Width           =   1515
      End
      Begin VB.CheckBox Check1 
         Caption         =   "TrackSelect"
         Height          =   195
         Index           =   1
         Left            =   1680
         TabIndex        =   3
         Top             =   360
         Width           =   1515
      End
      Begin VB.CheckBox Check1 
         Caption         =   "HighlightRow"
         Height          =   195
         Index           =   0
         Left            =   180
         TabIndex        =   2
         Top             =   360
         Width           =   1515
      End
   End
   Begin ComctlLib.ListView ListView1 
      Height          =   3435
      Left            =   180
      TabIndex        =   0
      Top             =   2520
      Width           =   5835
      _ExtentX        =   10292
      _ExtentY        =   6059
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
End
Attribute VB_Name = "frmLVStyles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ****************************************************************
'  Copyright ©1997, Karl E. Peterson
'  http://www.mvps.org/vb
' ****************************************************************
'  You are free to use this code within your own applications, but you
'  are expressly forbidden from selling or otherwise distributing this
'  source code without prior written consent.
' ****************************************************************
Option Explicit

Private Sub Check1_Click(Index As Integer)
   Select Case Index
      Case 0
         Call LVSetStyleEx(ListView1, FullRowSelect, CBool(Check1(Index).Value))
      Case 1
         Call LVSetStyleEx(ListView1, TrackSelect, CBool(Check1(Index).Value))
      Case 2
         Call LVSetStyleEx(ListView1, GridLines, CBool(Check1(Index).Value))
      Case 3
         Call LVSetStyleEx(ListView1, CheckBoxes, CBool(Check1(Index).Value))
      Case 4
         Call LVSetStyleEx(ListView1, HeaderDragDrop, CBool(Check1(Index).Value))
   End Select
End Sub

Private Sub Command1_Click()
   Call RefillList(ListView1, Val(Text1.Text))
End Sub

Private Sub Command2_Click()
   Dim c As Variant
   Dim i As Long, j As Long
   Dim cols() As Long
   Static flip As Boolean
   
   ReDim cols(0 To ListView1.ColumnHeaders.Count - 1) As Long
   c = LVGetColOrder(ListView1)
   j = UBound(c)
   For i = LBound(c) To UBound(c)
      cols(j) = c(i)
      j = j - 1
   Next i
   Call LVSetColOrder(ListView1, cols)
End Sub

Private Sub Command3_Click()
   ListView1.Visible = False
   Call LVSetAllColWidths(ListView1, LVSCW_AUTOSIZE_USEHEADER)
   ListView1.Visible = True
End Sub

Private Sub Form_Click()
   '
End Sub

Private Sub Form_Load()
   Dim w As Long, h As Long
   '
   ' Position form so it nearly fills screen
   '
   w = Screen.Width
   h = Screen.Height
   Me.Move w * 0.1, h * 0.1, w * 0.8, h * 0.75
   Frame1.Move 0, 0
   Frame2.Move 0, Frame1.Height
   Label2.Caption = ""
   Label3.Caption = ""
   Label4.Caption = ""
   '
   ' Clear and refill the list
   '
   Call RefillList(ListView1, 500)
End Sub

Private Sub Form_Resize()
   With Frame1
      .Width = Me.ScaleWidth
      Frame2.Width = .Width
      ListView1.Move 0, .Height + Frame2.Height, Me.ScaleWidth, Me.ScaleHeight - .Height - Frame2.Height - .Top * 2
   End With
End Sub

Private Sub Option1_Click(Index As Integer)
   Frame1.Tag = Index
End Sub

Private Sub ListView1_ColumnClick(ByVal ColumnHeader As ComctlLib.ColumnHeader)
   'toggle the sortorder for use in the CompareXX routines
   Dim cur As New CWaitCursor
   Dim el As Long
   
   cur.ShowCursor vbHourglass
   DoEvents
   With ListView1
      .SortKey = ColumnHeader.Index - 1
      .SortOrder = Abs(Not .SortOrder = 1)
      If Option1(0).Value = True Then 'KB method
         If .SortKey > 3 Then
            LVSortK ListView1, .SortKey, lvDate, .SortOrder
         Else
            LVSortK ListView1, .SortKey, lvNumber, .SortOrder
         End If
         Label2.Caption = ""
         Label3.Caption = "Perform Sort: " & MListView.PerformSort & " milliseconds"
      ElseIf Option1(1).Value = True Then 'collection method
         If .SortKey >= 3 Then
            LVSortC ListView1, .SortKey, lvDate, .SortOrder
         Else
            LVSortC ListView1, .SortKey, lvNumber, .SortOrder
         End If
         Label2.Caption = "Build Collection: " & MListView.BuildLookup & " milliseconds"
         Label3.Caption = "Perform Sort: " & MListView.PerformSort & " milliseconds"
      ElseIf Option1(2).Value = True Then 'IListView hack method
         If .SortKey >= 3 Then
            LVSortI ListView1, .SortKey, lvDate, .SortOrder
         Else
            LVSortI ListView1, .SortKey, lvNumber, .SortOrder
         End If
         Label2.Caption = ""
         Label3.Caption = "Perform Sort: " & MListView.PerformSort & " milliseconds"
      End If
   End With
   Label4.Caption = "Total Time: " & (MListView.BuildLookup + MListView.PerformSort) & " milliseconds"
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
   If KeyAscii = vbKeyReturn Then
      KeyAscii = 0
      Command1_Click
   End If
End Sub

Private Sub RefillList(ByVal lv As ListView, ByVal nItems As Long)
   Dim clm As ColumnHeader
   Dim itm As ListItem
   Dim i As Long, j As Long
   Dim cur As New CWaitCursor
   '
   ' Clear existing data
   '
   cur.ShowCursor vbHourglass
   lv.ListItems.Clear
   lv.ColumnHeaders.Clear
   lv.View = lvwReport
   lv.LabelEdit = lvwManual
   '
   ' Fill 10 column headers with random crud.
   '
   Set clm = lv.ColumnHeaders.Add(, , "$#,##0.00")
   Set clm = lv.ColumnHeaders.Add(, , "0")
   Set clm = lv.ColumnHeaders.Add(, , "#,##0")
   Set clm = lv.ColumnHeaders.Add(, , "#,##0.0000")
   Set clm = lv.ColumnHeaders.Add(, , "short date")
   Set clm = lv.ColumnHeaders.Add(, , "medium date")
   Set clm = lv.ColumnHeaders.Add(, , "mmmm dd, yyyy")
   Set clm = lv.ColumnHeaders.Add(, , "short time")
   Set clm = lv.ColumnHeaders.Add(, , "medium time")
   Set clm = lv.ColumnHeaders.Add(, , "long time")
   '
   ' Fill 30 rows with random crud.
   '
   For i = 1 To nItems
      Set itm = lv.ListItems.Add(, "Row" & i, Format(Rnd * 100000, "$#,##0.00"))
      itm.SubItems(1) = Format(Rnd * 100000, "0")
      itm.SubItems(2) = Format(Rnd * 100000, "#,##0")
      itm.SubItems(3) = Format(Rnd * 100000, "#,##0.0000")
      itm.SubItems(4) = Format(CDate(Rnd * 100 + Now), "short date")
      itm.SubItems(5) = Format(CDate(Rnd * 100 + Now), "medium date")
      itm.SubItems(6) = Format(CDate(Rnd * 100 + Now), "mmmm dd, yyyy")
      itm.SubItems(7) = Format(CDate(Rnd * 100 + Now), "short time")
      itm.SubItems(8) = Format(CDate(Rnd * 100 + Now), "medium time")
      itm.SubItems(9) = Format(CDate(Rnd * 100 + Now), "long time")
   Next i
   
   Text1.Text = nItems
End Sub

