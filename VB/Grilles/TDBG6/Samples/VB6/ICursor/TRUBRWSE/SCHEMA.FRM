VERSION 5.00
Begin VB.Form SchemaForm 
   Caption         =   "SchemaForm"
   ClientHeight    =   3390
   ClientLeft      =   1665
   ClientTop       =   1545
   ClientWidth     =   5700
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "SCHEMA.frx":0000
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3390
   ScaleWidth      =   5700
   Visible         =   0   'False
   Begin VB.TextBox ZoomText 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   2880
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   31
      Top             =   1680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.PictureBox AddPanel 
      BorderStyle     =   0  'None
      Height          =   3195
      Left            =   1440
      ScaleHeight     =   3195
      ScaleWidth      =   1215
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   1200
      Visible         =   0   'False
      Width           =   1215
      Begin VB.CommandButton DoneButton 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "&Done"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   18
         Top             =   2400
         Width           =   975
      End
      Begin VB.CommandButton ZoomButton 
         BackColor       =   &H80000005&
         Caption         =   "&Zoom"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   17
         Top             =   1680
         Width           =   975
      End
      Begin VB.CommandButton ClearButton 
         BackColor       =   &H80000005&
         Caption         =   "&Clear"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   16
         Top             =   960
         Width           =   975
      End
      Begin VB.CommandButton AddButton 
         BackColor       =   &H80000005&
         Caption         =   "&Add"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   15
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.VScrollBar ScrollBar 
      Height          =   2895
      Left            =   5400
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.PictureBox UpdatePanel 
      BorderStyle     =   0  'None
      Height          =   3195
      Left            =   4080
      ScaleHeight     =   3195
      ScaleWidth      =   1215
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   1215
      Begin VB.PictureBox NavigationButton 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         DrawMode        =   6  'Mask Pen Not
         DrawWidth       =   480
         Height          =   480
         Index           =   3
         Left            =   660
         Picture         =   "SCHEMA.frx":030A
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   30
         Top             =   2430
         Width           =   480
      End
      Begin VB.PictureBox NavigationButton 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         DrawMode        =   6  'Mask Pen Not
         DrawWidth       =   480
         Height          =   480
         Index           =   2
         Left            =   60
         Picture         =   "SCHEMA.frx":0754
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   28
         Top             =   2430
         Width           =   480
      End
      Begin VB.PictureBox NavigationButton 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         DrawMode        =   6  'Mask Pen Not
         DrawWidth       =   480
         Height          =   480
         Index           =   1
         Left            =   660
         Picture         =   "SCHEMA.frx":0B9E
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   26
         Top             =   1710
         Width           =   480
      End
      Begin VB.PictureBox NavigationButton 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         DrawMode        =   6  'Mask Pen Not
         DrawWidth       =   480
         Height          =   480
         Index           =   0
         Left            =   60
         Picture         =   "SCHEMA.frx":0FE8
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   24
         Top             =   1710
         Width           =   480
      End
      Begin VB.CommandButton DoneButton 
         BackColor       =   &H80000005&
         Cancel          =   -1  'True
         Caption         =   "&Done"
         Height          =   315
         Index           =   2
         Left            =   120
         TabIndex        =   22
         Top             =   1260
         Width           =   975
      End
      Begin VB.CommandButton ZoomButton 
         BackColor       =   &H80000005&
         Caption         =   "&Zoom"
         Height          =   315
         Index           =   0
         Left            =   120
         TabIndex        =   21
         Top             =   870
         Width           =   975
      End
      Begin VB.CommandButton ClearButton 
         BackColor       =   &H80000005&
         Caption         =   "&Clear"
         Height          =   315
         Index           =   2
         Left            =   120
         TabIndex        =   20
         Top             =   480
         Width           =   975
      End
      Begin VB.CommandButton UpdateButton 
         BackColor       =   &H80000005&
         Caption         =   "&Update"
         Height          =   315
         Left            =   120
         TabIndex        =   32
         Top             =   90
         Width           =   975
      End
      Begin VB.Label NavigationLabel 
         Alignment       =   2  'Center
         Caption         =   "&Next"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   3
         Left            =   600
         TabIndex        =   29
         Top             =   2910
         Width           =   615
      End
      Begin VB.Label NavigationLabel 
         Alignment       =   2  'Center
         Caption         =   "&Prev"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   27
         Top             =   2910
         Width           =   615
      End
      Begin VB.Label NavigationLabel 
         Alignment       =   2  'Center
         Caption         =   "&Last"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   1
         Left            =   600
         TabIndex        =   25
         Top             =   2190
         Width           =   615
      End
      Begin VB.Label NavigationLabel 
         Alignment       =   2  'Center
         Caption         =   "&First"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   0
         Left            =   0
         TabIndex        =   23
         Top             =   2190
         Width           =   615
      End
   End
   Begin VB.PictureBox Background 
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   1350
      ScaleHeight     =   975
      ScaleWidth      =   2415
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   2415
      Begin VB.TextBox FieldText 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   0
         Left            =   1500
         TabIndex        =   33
         Text            =   "Text1"
         Top             =   75
         Width           =   2955
      End
      Begin VB.Label FieldLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   1
         Top             =   150
         Visible         =   0   'False
         Width           =   1440
      End
   End
   Begin VB.PictureBox FindPanel 
      BorderStyle     =   0  'None
      Height          =   3200
      Left            =   0
      ScaleHeight     =   3195
      ScaleWidth      =   1215
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   1215
      Begin VB.CommandButton QueryButton 
         BackColor       =   &H80000005&
         Caption         =   "<="
         Height          =   375
         Index           =   5
         Left            =   720
         TabIndex        =   13
         Top             =   2640
         Width           =   375
      End
      Begin VB.CommandButton QueryButton 
         BackColor       =   &H80000005&
         Caption         =   "<"
         Height          =   375
         Index           =   4
         Left            =   120
         TabIndex        =   12
         Top             =   2640
         Width           =   375
      End
      Begin VB.CommandButton QueryButton 
         BackColor       =   &H80000005&
         Caption         =   ">="
         Height          =   375
         Index           =   3
         Left            =   720
         TabIndex        =   11
         Top             =   2160
         Width           =   375
      End
      Begin VB.CommandButton QueryButton 
         BackColor       =   &H80000005&
         Caption         =   ">"
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   10
         Top             =   2160
         Width           =   375
      End
      Begin VB.CommandButton QueryButton 
         BackColor       =   &H80000005&
         Caption         =   "<>"
         Height          =   375
         Index           =   1
         Left            =   720
         TabIndex        =   9
         Top             =   1680
         Width           =   375
      End
      Begin VB.CommandButton QueryButton 
         BackColor       =   &H80000005&
         Caption         =   "="
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   8
         Top             =   1680
         Width           =   375
      End
      Begin VB.CommandButton DoneButton 
         BackColor       =   &H80000005&
         Caption         =   "&Done"
         Height          =   315
         Index           =   0
         Left            =   120
         TabIndex        =   7
         Top             =   1260
         Width           =   975
      End
      Begin VB.CommandButton ClearButton 
         BackColor       =   &H80000005&
         Caption         =   "&Clear"
         Height          =   315
         Index           =   0
         Left            =   120
         TabIndex        =   6
         Top             =   870
         Width           =   975
      End
      Begin VB.CommandButton FindButton 
         BackColor       =   &H80000005&
         Caption         =   "Find &Also"
         Height          =   315
         Index           =   1
         Left            =   120
         TabIndex        =   5
         Top             =   480
         Width           =   975
      End
      Begin VB.CommandButton FindButton 
         BackColor       =   &H80000005&
         Caption         =   "&Find"
         Height          =   315
         Index           =   0
         Left            =   120
         TabIndex        =   4
         Top             =   90
         Width           =   975
      End
   End
   Begin VB.Menu UnzoomMenu 
      Caption         =   "&Unzoom"
      Visible         =   0   'False
      Begin VB.Menu SaveItem 
         Caption         =   "&Save Changes"
      End
      Begin VB.Menu UnzoomSeparator 
         Caption         =   "-"
      End
      Begin VB.Menu DiscardItem 
         Caption         =   "&Discard Changes"
      End
   End
   Begin VB.Menu EditMenu 
      Caption         =   "&Edit"
      Visible         =   0   'False
      Begin VB.Menu UndoItem 
         Caption         =   "&Undo"
         Enabled         =   0   'False
      End
      Begin VB.Menu EditSeparator 
         Caption         =   "-"
      End
      Begin VB.Menu CutItem 
         Caption         =   "Cu&t"
         Enabled         =   0   'False
      End
      Begin VB.Menu CopyItem 
         Caption         =   "&Copy"
         Enabled         =   0   'False
      End
      Begin VB.Menu PasteItem 
         Caption         =   "&Paste"
         Enabled         =   0   'False
      End
   End
End
Attribute VB_Name = "SchemaForm"
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

' True DBGrid Pro 6 Browser Sample Application

' SCHEMA.FRM - This form displays label and text control
' arrays corresponding to the current database schema.
' The controls are contained within a picture control to
' facilitate scrolling.  The form's caption determines
' whether it is used to add, update, or find records.

' ---- Local definitions ----

' Height of the background picture control, in twips

Const BACKHEIGHT = 32768

' Space between control rows, expressed as
' a multiple of the height of a text box

Const SPACING = 1.33

' Space between control rows, in twips

Dim Delta As Single

' Flag used by Form_Paint handler to set focus upon start-up

Dim Initialized As Integer

' Active text box indices

Dim TextIndex As Integer
Dim ZoomIndex As Integer

' Visible states for mode-specific controls

Dim FindVisible As Integer
Dim AddVisible As Integer
Dim UpdateVisible As Integer
Dim ScrollVisible As Integer

' Save flag for zoomed text

Dim SaveZoomText As Integer

Private Sub AddButton_Click()

'Adds a record to the Database using the AddNew and Update methods.
'Again uses the columns property of the Grid to get the valid fieldnames
On Error GoTo AddError

    Screen.MousePointer = vbHourglass
    MainForm.Data1.Recordset.AddNew
    
    'Loop through all the fields
    For ct% = 0 To MainForm.TDBGrid1.Columns.Count - 1
        MainForm.Data1.Recordset.Fields(ct%) = FieldText(ct% + 1).Text
    Next ct%

    'After all the information is loaded into the buffer the update adds the new record
    MainForm.Data1.Recordset.Update
    Screen.MousePointer = Default
    Exit Sub

AddError:
    Screen.MousePointer = Default
    MsgBox "Add Error: " + Error$, vbExclamation
    If MainForm.Data1.Recordset.EditMode = dbEditAdd Then
        MainForm.Data1.Recordset.CancelUpdate
    End If
    
    On Error Resume Next
    Exit Sub

End Sub

Private Sub AdjustSystemMenu(F As Form)

' Remove all but the Move and Close items from the system menu of a form

    ' Get the handle of the system menu

    M% = GetSystemMenu(F.hwnd, 0)
  
    ' Remove items starting from the bottom

    Z% = RemoveMenu(M%, 8, MF_BYPOSITION) ' Switch to
    Z% = RemoveMenu(M%, 7, MF_BYPOSITION) ' Separator
    
    ' Remove the other separator only if the
    ' form has neither min nor max buttons

    If Not (F.MinButton Or F.MaxButton) Then
        Z% = RemoveMenu(M%, 5, MF_BYPOSITION) ' Separator
    End If

End Sub

Private Sub ClearButton_Click(Index As Integer)

' Clear all of the form's text controls

    For i% = 1 To MainForm.TDBGrid1.Columns.Count
        FieldText(i%).Text = ""
    Next i%

End Sub

Private Sub CopyItem_Click()

' Implement Copy using the SendMessage API

    Z& = SendMessage(GetFocus(), WM_COPY, 0, 0&)

End Sub

Private Sub CutItem_Click()

 'Implement Cut using the SendMessage API

    Z& = SendMessage(GetFocus(), WM_CUT, 0, 0&)

End Sub

Private Sub DiscardItem_Click()

' Form_Unload will restore the form to its previous state

    SaveZoomText = False
    Unload SchemaForm

End Sub

Private Sub DoneButton_Click(Index As Integer)
    'Unloads the SchemaForm
    Unload SchemaForm

End Sub

Private Sub EditMenu_Click()

' Enable/disable Edit menu items as appropriate

    ' Use the GetFocus API to obtain a window handle

    W% = GetFocus()

    ' Determine if the zoomed text box has undo information

    If SendMessage(W%, EM_CANUNDO, 0, 0&) = 0 Then
        Undo% = False
    Else
        Undo% = True
    End If

    ' Determine if the zoomed text box has a text selection

    Sel% = (ZoomText.SelLength > 0)

    ' Determine if there is text in the clipboard

    Clip% = (Clipboard.GetText() <> "")

    ' Adjust the Edit menu accordingly

    UndoItem.Enabled = Undo%
    CutItem.Enabled = Sel%
    CopyItem.Enabled = Sel%
    PasteItem.Enabled = Clip%

End Sub

Private Sub FieldText_GotFocus(Index As Integer)

' Save the index of the active text box for the query
' symbol buttons, and make the control visible if it
' is scrolled out of view

    TextIndex = Index

    If Not ScrollBar.Visible Then Exit Sub

    If Index < ScrollBar.Value Then
        ScrollBar.Value = Index

    ElseIf Index > (ScrollBar.Value + MainForm.TDBGrid1.Columns.Count - ScrollBar.Max) Then
        ScrollBar.Value = Index - MainForm.TDBGrid1.Columns.Count + ScrollBar.Max
    End If

End Sub

Private Sub FindButton_Click(Index As Integer)
    
'The procedure does a find by going out getting the FieldText controls, checking to see if they
'contain a search condition, if they do then they are added to a select statement which is then
'assigned to the Data Control RecordSource property
    Dim First As Integer
    Dim Conjunct As String
    Dim QueryVal As String
    Dim FldType As Integer
    
    'If find is clicked then use AND if Findalso is clicked use OR
    Select Case Index
        Case 0
            Conjunct = " AND "
        Case 1
            Conjunct = " OR "
    End Select

'Any error generated here is usually going to be an SQL Error
On Error GoTo ErrHandler3

    Screen.MousePointer = vbHourglass

    'First time through no AND is used
    First = True

    'Loop through all valid Fields
    For ct% = 1 To MainForm.TDBGrid1.Columns.Count
        
        'If the FieldText control is not empty then add it to the find critera
        If FieldText(ct%) <> "" Then
            
            'Here were get the Field Type and pass that along with FieldText to a procedure
            'That checks the value and formats it for the SQL statement
            FldType = MainForm.Data1.Database.TableDefs(curTable).Fields(FieldLabel(ct%).Caption).Type
            QueryVal = FieldText(ct%).Text
            
            Call SQLFieldValue(FldType, QueryVal)
            If FldType = DB_ERROR Then Error SQLError
            
            If First Then
                First = False
                temp$ = temp$ + Chr$(91) + FieldLabel(ct%).Caption + Chr$(93) + " " + QueryVal
            Else
                temp$ = temp$ + Conjunct + Chr$(91) + FieldLabel(ct%).Caption + Chr$(93) + " " + QueryVal
            End If
        End If
    Next ct%

    'Add the Where clause to the beginning of the Find condition
    curFind = " Where " + temp$

    'Rebuild the Table
    MainForm.Data1.RecordSource = "Select * From " + "[" + curTable + "]" + curFind + curSort
    MainForm.Data1.Refresh


    Screen.MousePointer = Default

Exit Sub

ErrHandler3:
    Screen.MousePointer = Default
    Select Case Err
        Case SQLError
            MsgBox "SQL Error:  Your Field Value is incorrect", vbExclamation
        Case Else
            MsgBox "SQL Error:  " + Str$(Err) + " " + Error, vbExclamation
        
    End Select
    Exit Sub

End Sub

Private Sub FlashIcon(This As Control)

' This routine is used to give the user some feedback
' when selecting one of the picture control buttons

    For i% = 1 To 4
        This.Line (0, 0)-(This.ScaleWidth, This.ScaleHeight), , B
    Next i%

End Sub

Private Sub Form_Load()

    ' Switch to the hourglass cursor while loading

    Screen.MousePointer = vbHourglass
    Initialized = False

    ' Center the form within the screen

    CenterForm SchemaForm

    ' Remove unwanted menu items

    AdjustSystemMenu SchemaForm

    ' Add accelerators to Edit menu items

    UndoItem.Caption = "&Undo" + Chr$(9) + "Alt+BkSp"
    CutItem.Caption = "Cu&t" + Chr$(9) + "Shift+Del"
    CopyItem.Caption = "&Copy" + Chr$(9) + "Ctrl+Ins"
    PasteItem.Caption = "&Paste" + Chr$(9) + "Shift+Ins"

    ' Compute the spacing between control rows and
    ' reposition the hidden controls accordingly

    Delta = FieldText(0).Height * 1.33
    FieldLabel(0).Top = FieldLabel(0).Top - Delta
    FieldText(0).Top = FieldText(0).Top - Delta

    ' Initialize control array elements for each schema field

    For i% = 1 To MainForm.TDBGrid1.Columns.Count

        Load FieldLabel(i%)
        FieldLabel(i%).Caption = MainForm.TDBGrid1.Columns(i% - 1).Caption
        FieldLabel(i%).Top = FieldLabel(i% - 1).Top + Delta
        FieldLabel(i%).Visible = True

        Load FieldText(i%)
        FieldText(i%).Top = FieldText(i% - 1).Top + Delta
        FieldText(i%).Visible = True

    Next i%

End Sub

Private Sub Form_Paint()

' If this is the first time this event was fired, finish
' initializing the form; otherwise, do nothing.

    If Initialized Then Exit Sub

    Initialized = True

    If SchemaForm.Caption = "Update..." Then
        GetFields
    Else
        ClearButton_Click (0)
    End If
    
    ' Set focus to the first visible text control

    FieldText(1).SetFocus
    Screen.MousePointer = Default

End Sub

Private Sub Form_Resize()

    ' If the Edit menu is visible, adjust the size of the
    ' zoom text box to fit the new form size and exit

    If EditMenu.Visible Then
        ZoomText.Visible = False
        ZoomText.Top = 0
        ZoomText.Left = 0
        ZoomText.Width = SchemaForm.ScaleWidth
        ZoomText.Height = SchemaForm.ScaleHeight
        ZoomText.Visible = True
        Exit Sub
    End If

    ' Hide all controls to avoid flicker

    ZoomText.Visible = False
    FindPanel.Visible = False
    AddPanel.Visible = False
    UpdatePanel.Visible = False
    Background.Visible = False
    ScrollBar.Visible = False

    ' Undo any prior scrolling

    Background.Top = 0

    ' Make the height of the picture control as large as possible
    ' so that control array elements which were not originally
    ' visible will be scrolled into view

    Background.Height = BACKHEIGHT

    ' Assume no scroll bar initially

    NeedScroll% = False
    TextLen% = SchemaForm.ScaleWidth - FieldText(0).Left - Background.Left - ScrollBar.Width

    ' If a scroll bar is needed, move it to the far right of the
    ' form and adjust the size of the picture control accordingly

    If ScrollBarNeeded(SchemaForm) Then
        ScrollBar.Top = 0
        ScrollBar.Left = SchemaForm.ScaleWidth - ScrollBar.Width
        ScrollBar.Height = SchemaForm.ScaleHeight
        ScrollBar.Value = 1
        ScrollBar.Min = 1
        ScrollBar.Max = ScrollBarMax(SchemaForm)
        NeedScroll% = True
        TextLen% = TextLen% - ScrollBar.Width
        Background.Width = ScrollBar.Left - Background.Left

    ' Otherwise, extend the picture control to the end of the form

    Else
        Background.Width = SchemaForm.ScaleWidth - Background.Left
    End If

    ' Set the width of each text box

    If TextLen% > 0 Then
        For i% = 1 To MainForm.TDBGrid1.Columns.Count
            FieldText(i%).Width = TextLen%
        Next i%
    End If

    ' Make the controls visible, if required

    ScrollBar.Visible = NeedScroll%
    Background.Visible = True

    ' Choose the appropriate set of buttons (contained
    ' in a picture control) based on the form's caption,
    ' which is set by the caller

    Select Case SchemaForm.Caption

        Case "Find..."
            FindPanel.Left = 0
            FindPanel.Top = 0
            FindButton(0).Default = True
            DoneButton(0).Cancel = True
            FindPanel.Visible = True

        Case "Add..."
            AddPanel.Left = 0
            AddPanel.Top = 0
            AddButton.Default = True
            DoneButton(1).Cancel = True
            AddPanel.Visible = True

        Case "Update..."
            UpdatePanel.Left = 0
            UpdatePanel.Top = 0
            UpdateButton.Default = True
            DoneButton(2).Cancel = True
            UpdatePanel.Visible = True

    End Select

    ' Give the first text box focus

    FieldText(1).SetFocus

End Sub

Private Sub Form_Unload(Cancel As Integer)

' If a zoomed text box is open, restore the form to its
' prior state without unloading it.  Otherwise, hide the
' form before unloading control array elements.

    If ZoomText.Visible Then

        ' Hide zoom controls

        ZoomText.Visible = False
        UnzoomMenu.Visible = False
        EditMenu.Visible = False

        ' Restore the form to its previous state

        ScrollBar.Visible = ScrollVisible
        Background.Visible = True
        FindPanel.Visible = FindVisible
        AddPanel.Visible = AddVisible
        UpdatePanel.Visible = UpdateVisible

        ' Copy the edited text to the current text box,
        ' if desired, and give the text box focus

        If SaveZoomText Then
            FieldText(ZoomIndex).Text = ZoomText.Text
        End If

        FieldText(ZoomIndex).SetFocus

        ' Don't unload the form yet

        Cancel = True

    Else

        ' Hide the form to eliminate flicker

        SchemaForm.Hide

        ' Unload control array elements

        For i% = 1 To MainForm.TDBGrid1.Columns.Count
            Unload FieldLabel(i%)
            Unload FieldText(i%)
        Next i%

    End If

End Sub

Private Sub GetFields()
    
'Display the current record in the FieldText controls by accessing the current
'record of the data control

    For i% = 0 To MainForm.TDBGrid1.Columns.Count - 1
        
        'If the value is NULL in the database then assign a blank, otherwise an error is generated
        If MainForm.Data1.Recordset(i%) <> "#NULL#" Then
            FieldText(i% + 1).Text = MainForm.Data1.Recordset(i%)
        Else
            FieldText(i% + 1).Text = ""
        End If
    Next i%

End Sub

Private Sub NavigationButton_Click(Index As Integer)

' Perform the navigation operation associated with
' the specified picture control button
    
 On Error GoTo ErrHandler1

    FlashIcon NavigationButton(Index)

    Select Case Index
        Case 0
            MainForm.Data1.Recordset.MoveFirst
        Case 1
            MainForm.Data1.Recordset.MoveLast
        Case 2
            MainForm.Data1.Recordset.MovePrevious
        Case 3
            MainForm.Data1.Recordset.MoveNext
    End Select

    'After Navigation update SchemaForm text controls with GetFields
    GetFields

    'If users goes beyond the end or before the beginning of the file, give warning beep
    If MainForm.Data1.Recordset.BOF Or MainForm.Data1.Recordset.EOF Then Beep

Exit Sub

ErrHandler1:
    
    'The only error generated in the case is the BOF and EOF and you can ignore them
    Resume Next

End Sub

Private Sub NavigationButton_GotFocus(Index As Integer)

' Toggle the FontItalic property of the label associated
' with the specified picture control button

    UpdateButton.Default = False
    NavigationLabel(Index).FontItalic = Not NavigationLabel(Index).FontItalic

End Sub

Private Sub NavigationButton_KeyPress(Index As Integer, KeyAscii As Integer)

' Make the Enter key work for picture control buttons

    If KeyAscii = KEY_RETURN Then NavigationButton_Click Index

End Sub

Private Sub NavigationButton_LostFocus(Index As Integer)

' Toggle the FontItalic property of the label associated
' with the specified picture control button

    NavigationLabel(Index).FontItalic = Not NavigationLabel(Index).FontItalic
    UpdateButton.Default = True

End Sub

Private Sub PasteItem_Click()

' Implement Paste using the SendMessage API

    Z& = SendMessage(GetFocus(), WM_PASTE, 0, 0&)

End Sub

Private Sub QueryButton_Click(Index As Integer)

' Append the button's caption to the current text box

    T$ = FieldText(TextIndex).Text + QueryButton(Index).Caption
    FieldText(TextIndex).Text = T$
    FieldText(TextIndex).SelLength = 0
    FieldText(TextIndex).selStart = Len(T$)
    FieldText(TextIndex).SetFocus

End Sub

Private Sub SaveItem_Click()

' Form_Unload will restore the form to its previous state

    SaveZoomText = True
    Unload SchemaForm

End Sub

Private Sub ScrollBar_Change()

' Scroll the label and text controls simply
' by moving the background picture control

    Background.Top = -Delta * (ScrollBar.Value - 1)

End Sub

Private Function ScrollBarMax(This As Form) As Integer

' Return the maximum value for the scroll bar (at least 2)

    N% = MainForm.TDBGrid1.Columns.Count - (This.ScaleHeight / Delta) + 1

    If N% > 1 Then
        ScrollBarMax = N%
    Else
        ScrollBarMax = 2
    End If

End Function

Private Function ScrollBarNeeded(This As Form) As Integer

' Return FALSE if all controls fit on the form, TRUE otherwise

    i% = MainForm.TDBGrid1.Columns.Count

    If FieldText(i%).Top + FieldText(i%).Height > This.ScaleHeight Then
        ScrollBarNeeded = True
    Else
        ScrollBarNeeded = False
    End If

End Function

Private Sub UndoItem_Click()

' Implement Undo using the SendMessage API

    Z& = SendMessage(GetFocus(), EM_UNDO, 0, 0&)

End Sub

Private Sub UpdateButton_Click()

'Update the the current record by first entering the Edit mode of the RecordSet,
'change the value to the value in the FieldText control, then call the Update
On Error GoTo UpdateError

    Screen.MousePointer = vbHourglass

    'Loop through all valid field names
    For ct% = 0 To MainForm.TDBGrid1.Columns.Count - 1
        MainForm.Data1.Recordset.Edit
        MainForm.Data1.Recordset.Fields(ct%) = FieldText(ct% + 1).Text
        MainForm.Data1.Recordset.Update
    Next ct%
    Screen.MousePointer = Default
    Exit Sub

UpdateError:
    Screen.MousePointer = Default
    MsgBox "Update Error: " + Error$, vbExclamation
    If MainForm.Data1.Recordset.EditMode = dbEditInProgress Then
        MainForm.Data1.Recordset.CancelUpdate
    End If
    Exit Sub
            
End Sub

Private Sub ZoomButton_Click(Index As Integer)

    ' Save the visible state of mode-specific controls

    FindVisible = FindPanel.Visible
    AddVisible = AddPanel.Visible
    UpdateVisible = UpdatePanel.Visible
    ScrollVisible = ScrollBar.Visible

    ' Hide all controls to avoid flicker

    ZoomText.Visible = False
    FindPanel.Visible = False
    AddPanel.Visible = False
    UpdatePanel.Visible = False
    Background.Visible = False
    ScrollBar.Visible = False

    ' Make the menu bar visible

    EditMenu.Visible = True
    UnzoomMenu.Visible = True

    ' Resize the text control

    ZoomText.Top = 0
    ZoomText.Left = 0
    ZoomText.Width = SchemaForm.ScaleWidth
    ZoomText.Height = SchemaForm.ScaleHeight
    ZoomText.Visible = True

    ' Copy the contents of the current text box

    ZoomIndex = TextIndex
    ZoomText.Text = FieldText(ZoomIndex).Text

    ' Changes will be saved unless the Discard item is chosen

    SaveZoomText = True

End Sub

Private Sub ZoomText_KeyUp(KeyCode As Integer, Shift As Integer)

' Map Alt+BkSp to the Undo menu item since we can't assign
' it as an accelerator key using the Menu Design Window

    If KeyCode = KEY_BACK And (Shift And ALT_MASK) Then
        If SendMessage(GetFocus(), EM_CANUNDO, 0, 0&) <> 0 Then
            KeyCode = 0
            UndoItem_Click
        End If
    End If
    
End Sub

