VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Main 
   Caption         =   "General Ledger"
   ClientHeight    =   5820
   ClientLeft      =   2445
   ClientTop       =   2070
   ClientWidth     =   9600
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "GENLEDGR.frx":0000
   LinkTopic       =   "Form2"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5820
   ScaleWidth      =   9600
   Begin VB.CommandButton Command1 
      BackColor       =   &H80000005&
      Caption         =   "Add Account..."
      Height          =   315
      Left            =   3720
      TabIndex        =   1
      Top             =   5040
      Width           =   1995
   End
   Begin VB.Data Data1 
      Caption         =   "Accounts"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   345
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   5040
      Width           =   2655
   End
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "GENLEDGR.frx":0742
      Height          =   4695
      Left            =   120
      OleObjectBlob   =   "GENLEDGR.frx":0756
      TabIndex        =   0
      Top             =   120
      Width           =   9375
   End
   Begin VB.Menu ExitMenuOption 
      Caption         =   "E&xit!"
   End
   Begin VB.Menu HelpMenuOption 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpOption 
         Caption         =   "&Contents"
         Index           =   1
      End
      Begin VB.Menu mnuHelpOption 
         Caption         =   "&About General Ledger..."
         Index           =   2
      End
   End
End
Attribute VB_Name = "Main"
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

Option Explicit

Dim RS As Recordset
Dim dbDir As String
Public doreclone As Integer
Public Criteria As String

Private Sub CenterForm(F As Form)
    ' Center the specified form within the screen
    F.Move (Screen.Width - F.Width) \ 2, (Screen.Height - F.Height) \ 2
End Sub

Private Sub Command1_Click()
    ' Bring up the "Add Account" form
    AddForm.Show vbModal
End Sub

Private Sub ExitMenuOption_Click()
    Unload AddForm
    Unload Main
    End
End Sub


Private Sub Form_Load()

Dim NegativeStyle As New TrueDBGrid60.Style

    ' Set the database property of the data control
    dbDir = App.Path
    Data1.DatabaseName = dbDir + "\genledgr.mdb"
    Data1.RecordSource = "Select * From Accounts Order By AccountID"
    Data1.Refresh

    doreclone = True

    ' In the leftmost split, set the general ledger number
    ' so that any value which contains solely numbers (no
    ' decimals) will appear in boldface

    Dim S As New TrueDBGrid60.Style
    S.Font.Bold = True
    S.Font.Name = "Tahoma"
    TDBGrid1.Columns(0).AddRegexCellStyle 0, S, "^[0-9]+$"
    TDBGrid1.Columns(0).AddRegexCellStyle 1, S, "^[0-9]+$"

    'In the Running total column set any number that appears to
    'be negative with a ForeColor of red
    NegativeStyle.ForeColor = vbRed
    TDBGrid1.Splits(2).Columns(7).AddRegexCellStyle 0, NegativeStyle, "^(.+)$"
    TDBGrid1.Splits(2).Columns(7).AddRegexCellStyle 0, NegativeStyle, "^ *-"

    'Set the colors for the even and odd rows
    TDBGrid1.EvenRowStyle.BackColor = &H80FFFF
    TDBGrid1.OddRowStyle.BackColor = &HC0FFFF

    TDBGrid1.HighlightRowStyle.BackColor = &H400000
    TDBGrid1.HighlightRowStyle.ForeColor = vbWhite
    TDBGrid1.AlternatingRowStyle = True

    'Turn CellTips on to show under the mouse pointer
    TDBGrid1.CellTips = 2 'Floating

    'Center Form on Application
    CenterForm Main
End Sub

Private Sub mnuHelpOption_Click(Index As Integer)

Dim temp
Dim HelpDir As String

On Error GoTo ErrorRoutine

    HelpDir = "WinHelp.exe " + dbDir + "\Genledgr.hlp"
  
    Select Case Index
        'Case 1 will bring up the help file for General Ledger.
        Case 1
            temp = Shell(HelpDir, vbNormalFocus)
        'Case 2 shows the about box for General Ledger.
        Case 2
            About.Show 1
        End Select
  
ErrorRoutine:
  If Err = 53 Then
    MsgBox "WinHelp.exe could not be found"
  End If
End Sub

Private Sub TDBGrid1_AfterColUpdate(ByVal ColIndex As Integer)
    'Refresh grid to update running total column
    If ColIndex = 3 Or ColIndex = 6 Then
        TDBGrid1.Update
        TDBGrid1.PostMsg 1
    End If
End Sub

Private Sub TDBGrid1_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
    'When the credit or debit columns are update set
    'the LastPosting field and the Balance field.
    If Trim$(TDBGrid1.Columns(ColIndex).Value) = "" Then
        TDBGrid1.Columns("Balance").Value = Null
        TDBGrid1.Columns("LastPosting").Text = Now
    Else
        If TDBGrid1.Columns(ColIndex).Caption = "Credit" Then
            TDBGrid1.Columns("Balance").Value = TDBGrid1.Columns(ColIndex).Value
            TDBGrid1.Columns("LastPosting").Text = Now
        Else
            If TDBGrid1.Columns(ColIndex).Caption = "Debit" Then
                TDBGrid1.Columns("Balance").Value = -(TDBGrid1.Columns(ColIndex).Value)
                TDBGrid1.Columns("LastPosting").Text = Now
            End If
        End If
    End If
End Sub

Private Sub TDBGrid1_FetchCellTips(ByVal SplitIndex As Integer, ByVal ColIndex As Integer, ByVal RowIndex As Long, CellTip As String, ByVal FullyDisplayed As Boolean, ByVal TipStyle As StyleDisp)

Dim rowbk As Variant
    If RowIndex >= 0 Then
        rowbk = TDBGrid1.RowBookmark(RowIndex)
    End If

    If RowIndex = -1 Then
  
        Select Case ColIndex
            Case 0
                CellTip = "Account ID Number"
            Case 1
                CellTip = "Account Information"
            Case 4
                CellTip = "Comments on Account"
            Case 5
                CellTip = "Last Posting"
            Case 6
                CellTip = "Credit Column"
            Case 3
                CellTip = "Debit Column"
            Case 7
                CellTip = "Running Account Balance"
        End Select
    Else
        Select Case ColIndex
            Case 3
                CellTip = ""
            Case 5
                If TDBGrid1.Columns(5).CellText(rowbk) = Format(Now, "Short Date") Then
                    CellTip = "Posted Today"
                End If
            Case 6
                CellTip = ""
            Case 7
                If TDBGrid1.Columns(7).CellText(rowbk) < 0 Then
                    CellTip = "In the Red"
                Else
                    CellTip = "In the Black"
                End If
            End Select
    End If
End Sub

Private Sub TDBGrid1_FormatText(ByVal ColIndex As Integer, Value As Variant, Bookmark As Variant)
Select Case ColIndex
    'Indent the AccountId if there is a decimal in
    'the number.
    Case 0
        If InStr(Value, ".") <> 0 Then
            Value = "  " & Value
        End If
    'Display a negative number as positive
    Case 3
        If Val(Value) < 0 Then
            Value = Abs(Val(Value))
            Value = Format(Val(Value), "$##,###,###.00")
        Else
            Value = ""
        End If
    End Select
End Sub

Private Sub TDBGrid1_PostEvent(ByVal MsgId As Integer)
    If MsgId = 1 Then TDBGrid1.Refresh
    
    If MsgId = 2 Then
        
        TDBGrid1.SetFocus
        'Set focus to split zero and column 0
        TDBGrid1.Split = 0
        TDBGrid1.Col = 0
    End If
End Sub

Private Sub TDBGrid1_UnboundColumnFetch(Bookmark As Variant, ByVal Col As Integer, Value As Variant)

Dim Bkmk1 As String, Bkmk2 As String
Dim Sum As Double

    'Check if the a new clone needs to be created.
    If doreclone Then
        Set RS = Data1.Recordset.Clone
        doreclone = False
    End If

    Bkmk1 = Bookmark
    Select Case Col
        'Credit field
        Case 6
            RS.Bookmark = Bookmark
            If RS!balance > 0 Then
                Value = RS!balance
            Else
                Value = ""
            End If
        'Debit field
        Case 3
            RS.Bookmark = Bookmark
            If RS!balance < 0 Then
                Value = RS!balance
            Else
                Value = ""
            End If
        'Running Balance
        Case 7
            Sum = 0
            RS.MoveFirst
            Do
                Bkmk2 = RS.Bookmark
                If IsNull(RS!balance) Then
                    Sum = Sum
                Else
                    Sum = Sum + RS!balance
                End If
                RS.MoveNext
            Loop Until Bkmk1 = Bkmk2
            Value = Sum
    End Select
End Sub

