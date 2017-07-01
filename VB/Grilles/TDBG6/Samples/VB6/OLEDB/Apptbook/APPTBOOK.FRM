VERSION 5.00
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form ApptForm 
   Caption         =   "Appointment Book (OLE DB)"
   ClientHeight    =   5220
   ClientLeft      =   1950
   ClientTop       =   1905
   ClientWidth     =   10560
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
   Icon            =   "APPTBOOK.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5220
   ScaleWidth      =   10560
   Begin VB.Frame Frame2 
      Caption         =   "Appointment Types"
      ForeColor       =   &H00800000&
      Height          =   2055
      Left            =   7680
      TabIndex        =   12
      Top             =   120
      Width           =   1815
      Begin VB.PictureBox KindFrame 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   3
         Left            =   960
         ScaleHeight     =   675
         ScaleWidth      =   675
         TabIndex        =   16
         Tag             =   "Lunch"
         Top             =   1200
         Width           =   735
         Begin VB.Image KindPict 
            Height          =   480
            Index           =   3
            Left            =   120
            Picture         =   "APPTBOOK.frx":030A
            Tag             =   "Lunch"
            Top             =   120
            Width           =   480
         End
      End
      Begin VB.PictureBox KindFrame 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   2
         Left            =   960
         ScaleHeight     =   675
         ScaleWidth      =   675
         TabIndex        =   15
         Tag             =   "Meeting"
         Top             =   360
         Width           =   735
         Begin VB.Image KindPict 
            Height          =   480
            Index           =   2
            Left            =   120
            Picture         =   "APPTBOOK.frx":0614
            Tag             =   "Meeting"
            Top             =   120
            Width           =   480
         End
      End
      Begin VB.PictureBox KindFrame 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   1
         Left            =   120
         ScaleHeight     =   675
         ScaleWidth      =   675
         TabIndex        =   14
         Tag             =   "Travel"
         Top             =   1200
         Width           =   735
         Begin VB.Image KindPict 
            Height          =   480
            Index           =   1
            Left            =   120
            Picture         =   "APPTBOOK.frx":091E
            Tag             =   "Travel"
            Top             =   120
            Width           =   480
         End
      End
      Begin VB.PictureBox KindFrame 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   0
         Left            =   120
         ScaleHeight     =   675
         ScaleWidth      =   675
         TabIndex        =   13
         Tag             =   "Phone"
         Top             =   360
         Width           =   735
         Begin VB.Image KindPict 
            Height          =   480
            Index           =   0
            Left            =   120
            Picture         =   "APPTBOOK.frx":0C28
            Tag             =   "Phone"
            Top             =   120
            Width           =   480
         End
      End
   End
   Begin VB.Frame Frame1 
      Height          =   2655
      Left            =   7680
      TabIndex        =   5
      Top             =   2160
      Width           =   2775
      Begin VB.TextBox ApptText 
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00000000&
         Height          =   1275
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   9
         Top             =   1320
         Width           =   2535
      End
      Begin VB.CommandButton SaveButton 
         BackColor       =   &H80000005&
         Caption         =   "Save"
         Default         =   -1  'True
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
         TabIndex        =   7
         Top             =   840
         Width           =   735
      End
      Begin VB.TextBox ApptType 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1560
         TabIndex        =   10
         TabStop         =   0   'False
         Top             =   480
         Width           =   1155
      End
      Begin MSMask.MaskEdBox ApptTime 
         Height          =   315
         Left            =   1560
         TabIndex        =   8
         Top             =   840
         Width           =   1155
         _ExtentX        =   2037
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   8388608
         AutoTab         =   -1  'True
         MaxLength       =   8
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   "hh:nn AM/PM"
         Mask            =   "##:## ??"
         PromptChar      =   "_"
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "When:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   960
         TabIndex        =   11
         Top             =   840
         Width           =   555
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Appointment type:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   480
         Width           =   1335
      End
      Begin VB.Image Image1 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   1200
         Picture         =   "APPTBOOK.frx":0F32
         Top             =   120
         Width           =   480
      End
   End
   Begin TrueOleDBGrid60.TDBGrid ApptList 
      Height          =   4815
      Left            =   0
      OleObjectBlob   =   "APPTBOOK.frx":123C
      TabIndex        =   0
      Top             =   120
      Width           =   7575
   End
   Begin VB.Image TrashCan 
      Height          =   480
      Left            =   9840
      Picture         =   "APPTBOOK.frx":5849
      Top             =   1680
      Width           =   480
   End
   Begin VB.Image TrashOpened 
      Height          =   480
      Left            =   9720
      Picture         =   "APPTBOOK.frx":5B53
      Top             =   1080
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image TrashClosed 
      Height          =   480
      Left            =   10200
      Picture         =   "APPTBOOK.frx":5E5D
      Top             =   1080
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Label DragArrow 
      Caption         =   "DragArrow"
      DragIcon        =   "APPTBOOK.frx":6167
      Height          =   255
      Left            =   9720
      TabIndex        =   4
      Top             =   840
      Visible         =   0   'False
      Width           =   915
   End
   Begin VB.Label MoveIcon 
      Caption         =   "MoveIcon"
      DragIcon        =   "APPTBOOK.frx":6471
      Height          =   255
      Left            =   9720
      TabIndex        =   3
      Top             =   600
      Visible         =   0   'False
      Width           =   915
   End
   Begin VB.Label SaveIcon 
      Caption         =   "SaveIcon"
      Height          =   255
      Left            =   9720
      TabIndex        =   2
      Top             =   360
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label NoDrag 
      Caption         =   "NoDrag"
      DragIcon        =   "APPTBOOK.frx":677B
      Height          =   255
      Left            =   9720
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   915
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
         Caption         =   "&About Appointment Book..."
         Index           =   2
      End
   End
End
Attribute VB_Name = "ApptForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ---------------------------------------------------------
'       Copyright ©1995-1998 APEX Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True DBGrid Pro 6.0 sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that APEX  Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------

' Drag mode constants to keep track of dragging activity.

Dim DragType As Integer         ' type of object being dragged
Dim Dragging As Integer         ' TRUE when dragging is in progress
Dim DragIndex As Integer        ' Optional index of dragged obj
Dim DragRow As Integer          ' Optional row being dragged in grid
Dim rowMax As Integer
Dim GridDropCol As Integer      ' Index of column for drop operation
Dim GridDropRow As Integer      ' Bookmark of row for drop operation
Dim GridDragCol As Integer      ' Index of column while dragging
Dim GridDragRow As Integer      ' Bookmark of row while dragging
Dim ApptStyle As New TrueOleDBGrid60.Style
Dim dbDir As String
Dim valid%                      ' used as return for DragValid
Dim i As Integer

' Bitmasks to describe valid drag objects

Const MASK_NEWAPPT = 1      ' a new appointment
Const MASK_OLDAPPT = 2      ' an old appointment
Const MASK_NONE = 0         ' mask used where no drops are allowed

Private Sub ApptEdit()
    ' This subroutine moves the data in the current grid row into
    ' the "post-it" editing area.
    Dim aText As String
    Dim colonPos As Integer

    ' This routine copies appointment data to the edit window

    aText = ApptList.Columns(ApptList.Col).Text
    colonPos = InStr(aText, ":")

    ' If no colon, there's no appointment, so clear the post-it
    ' area.  If there is a colon, fill in the information.

    If colonPos = 0 Then
        ApptText.Text = ""
        ApptTime.Text = Format$(0, ApptTime.Format)
        ApptType.Text = ""
    Else
        ApptType.Text = Left$(aText, colonPos - 1)
        ApptText.Text = Mid$(aText, colonPos + 2)
        ApptTime.Text = Format$(ApptList.Columns(0).Text, ApptTime.Format)
    End If
End Sub

Private Sub ApptList_DragCell(ByVal SplitIndex As Integer, RowBookmark As Variant, ByVal ColIndex As Integer)
    ' This event is intitiating when the user drags the mouse with
    ' the right mouse button depressed.  If the user is in columns 1-5
    ' and there is an appointment then initiate dragging
    If ColIndex > 0 Then
        ApptList.Bookmark = RowBookmark
        GridDragCol = ApptList.Col
        GridDragRow = ApptList.Bookmark

        If InStr(ApptList.Columns(ApptList.Col).Text, ":") <> 0 Then
            DragRow = GridDragRow
            ApptList.DragIcon = MoveIcon.DragIcon
            BeginDragMode ApptList, MASK_OLDAPPT
        End If
    End If
End Sub

Private Sub ApptList_DragDrop(Source As Control, X As Single, Y As Single)
    ' Drop a new appointment or existing appointment at a new
    ' row position.
    Dim aText As String
    Dim i%
    Dim rowsVisible As Integer
    
    ' Check the location of the drag and drop
    GridDropRow = ApptList.RowContaining(Y)
    GridDropCol = ApptList.ColContaining(X)
    
    If Not EndDragMode(MASK_NEWAPPT Or MASK_OLDAPPT) Then
     Exit Sub
    End If

    If GridDropCol <= 0 Or GridDropRow = -1 Then
        DragRow = 0
        ApptList.Bookmark = GridDragRow
        ApptList.Col = GridDragCol
        Exit Sub
    End If

    'If new appointment add to grid otherwise change appt time
    If DragType = MASK_NEWAPPT Then
        ApptList.Bookmark = ApptList.RowBookmark(GridDropRow)
        ApptInfo(GridDropCol, ApptList.RowBookmark(GridDropRow)) = Source.Tag & ": "
        ApptList.Columns(GridDropCol).Text = Source.Tag & ": "
        ApptList.Col = GridDropCol
        ApptEdit
     Else
        rowsVisible = ApptList.VisibleRows - 1
        aText = ApptList.Columns(0).Text
        ApptList.Bookmark = DragRow
        i% = ChangeApptTime(TimeValue(aText), rowsVisible)
    End If
    
    ' Clear drag row
    DragRow = 0
    ApptList.Update
    ApptText.SetFocus
End Sub

Private Sub ApptList_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
    ' When dragging over the grid, both new and old appointments
    ' are considered.
    If Not DragValid(Source, MASK_NEWAPPT Or MASK_OLDAPPT, State) Then
        Exit Sub
    End If
    
            GridDropRow = ApptList.RowContaining(Y)
            If ApptList.ColContaining(X) <> -1 Then
              GridDropCol = ApptList.ColContaining(X)
            Else
              GridDropCol = ApptList.Col
            End If
            
            ' If RowContaining is valid then set the grids bookmark
            If ApptList.RowContaining(Y) <> -1 Then
                ApptList.Bookmark = ApptList.RowBookmark(GridDropRow)
                ApptList.Col = GridDropCol
            End If
End Sub

Private Sub ApptList_FetchCellStyle(ByVal Condition As Integer, ByVal Split As Integer, Bookmark As Variant, ByVal Col As Integer, ByVal CellStyle As TrueOleDBGrid60.StyleDisp)
    ' If dragging is occuring then highlight the cell being
    ' dragged from in blue and white.
    If DragRow = Bookmark And Col = GridDragCol Then
        CellStyle.BackColor = vbBlue
        CellStyle.ForeColor = vbWhite
    End If
End Sub

Private Sub ApptList_LostFocus()
  ApptList.Update
End Sub

Private Sub ApptList_PostEvent(ByVal MsgId As Integer)
  If MsgId = 1 Then
    ApptList.Update
  End If
End Sub

Private Sub ApptList_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
' If the current cell changes call ApptEdit to update Post-it area
ApptEdit
End Sub

Private Sub ApptText_DragDrop(Source As Control, X As Single, Y As Single)
  DragRow = 0
  valid% = EndDragMode(MASK_NONE)
End Sub

Private Sub ApptText_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NONE, State)
End Sub

Private Sub ApptTime_DragDrop(Source As Control, X As Single, Y As Single)
  DragRow = 0
  valid% = EndDragMode(MASK_NONE)
End Sub

Private Sub ApptTime_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NONE, State)
End Sub

Private Sub ApptTime_GotFocus()
  ApptTime.SelStart = 0
  ApptTime.SelLength = Len(ApptTime.Text)
End Sub

Private Sub ApptTime_LostFocus()
  Dim i As Integer
  i = ChangeTime(TimeValue(ApptTime))
End Sub

Private Sub ApptTime_ValidationError(InvalidText As String, StartPosition As Integer)
  ApptTime.Text = Format$(ApptList.Columns(0).Text, ApptTime.Format)
  ' Check for valid time if user manually changes time
  MsgBox "Invalid time"
  ApptList.SetFocus
End Sub

Private Sub ApptType_DragDrop(Source As Control, X As Single, Y As Single)
  ' Accept a drop only for a NEWAPPT icon, otherwise the
  ' operation will be cancelled.
  If EndDragMode(MASK_NEWAPPT) Then
    ApptType.Text = Source.Tag
  End If
End Sub

Private Sub ApptType_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NEWAPPT, State)
End Sub

Private Sub ApptType_KeyPress(KeyAscii As Integer)
  ' Don't allow a colon to be entered, since we use a colon to
  ' separate the appointment "kind" from the text.
  If KeyAscii = Asc(":") Then
    Beep
    KeyAscii = 0
  End If
End Sub

Private Sub BeginDragMode(ctl As Control, objType As Integer)
  ' Whenever a drag is about to start, this routine is called.
  ' The type mask of the drag is flagged, and we remember that
  ' dragging is in progress.   This routine MUST be matched
  ' by an EndDragMode function call.
  DragType = objType
  Dragging = True
    
  ' Start the drag process
  ctl.Drag vbBeginDrag
End Sub

Private Function ChangeApptTime(newtime As Variant, rowsVisible) As Integer
  ' Given a new time for an appointment at the current row, this
  ' routine moves the appointment to the new location in the
  ' grid.
  Dim trow As Integer
  Dim oldAppt As String

  trow = TimeRow(newtime)
  
  ' If we're already there, then do nothing and return False,
  ' indicating no row change occurred.
  If trow = ApptList.Bookmark And ApptList.Col = GridDragCol Then
    ChangeApptTime = False
    Exit Function
  End If

  ' If the user entered an invalid time print an error
  If trow > (rowsVisible) Or trow < 0 Then
    ChangeApptTime = False
    MsgBox "Invalid time"
    Exit Function
  End If
    
  ChangeApptTime = True
    
  ' Actually move the row.
  oldAppt = ApptList.Columns(GridDragCol).Text
    
  If ApptList.Bookmark < 1 Then
    ApptList.Bookmark = Null
    ApptList.ReBind
    Exit Function
  End If

  ApptList.Columns(GridDragCol).Text = ""
  ApptList.Bookmark = trow + 1
    
  ApptList.Columns(GridDropCol).Text = oldAppt
  ApptList.PostMsg (1)
  
  ApptEdit            ' move the data to the post-it area
End Function

Private Function DragValid(src As Control, mask As Integer, State As Integer) As Integer
  ' This function is called by an object's DragOver event to
  ' automatically change the drag cursor to the "no drop"
  ' cursor if necessary.  It also returns True if the object
  ' can legally be dropped according to the input mask.
  If (mask And DragType) Then
    DragValid = True
    Exit Function
  End If
    
  ' This is not a valid drag.  Return False, but also change the
  ' object's drag icon to the NoDrag icon (remembering the old
  ' value for later restore when we exit this object).
  DragValid = False

  Select Case State
    Case vbEnter
      ' Entering, remember old icon
      SaveIcon.DragIcon = src.DragIcon
      src.DragIcon = NoDrag.DragIcon
    Case vbLeave
      ' Exiting, restore old icon
      src.DragIcon = SaveIcon.DragIcon
  End Select
End Function

Private Function EndDragMode(mask As Integer) As Integer
  ' This function is called when a drag has ended, either
  ' successfully or unsuccessfully.  This routine removes any
  ' user feedback related to the drag operation and returns
  ' TRUE if the passed mask matches the dragged object.
  ' Set Current cell colors back to previous settings
  Select Case DragType
    Case MASK_NEWAPPT
      ' If a "new appointment" icon was dragged, change the
      ' frame background to LTGREY again so that the drag
      ' is officially over.
      KindFrame(DragIndex).BackColor = LTGREY
    Case MASK_OLDAPPT
      ' If this is an item dragged from the grid, refresh
      ' the grid in case the drag ended outside the grid
      ' frame (and the inverted row remains).
                
      ApptList.Refresh
  End Select

  Dragging = False
  EndDragMode = (mask And DragType) <> 0
End Function

Private Sub ExitMenuOption_Click()
  'Unload forms and exit
  Unload About
  Unload ApptForm
  End
End Sub

Private Sub Form_Activate()
  ApptList.Col = 1
  ApptList.SetFocus
  
  ApptStyle.BackColor = &HC000& 'Green
  ApptStyle.ForeColor = vbWhite
  
  ApptList.AddRegexCellStyle 1, ApptStyle, ":"
  ApptList.Refresh
End Sub

Private Sub Form_DragDrop(Source As Control, X As Single, Y As Single)
  ' Ignore drops which occur on the form
  DragRow = 0
  valid% = EndDragMode(MASK_NONE)
  ApptList.Bookmark = GridDragRow
  ApptList.Col = GridDragCol
End Sub

Private Sub Form_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  ' Assure that the "no drop" icon is displayed when passing
  ' over the form.
  valid% = DragValid(Source, MASK_NONE, State)
End Sub

Private Sub Form_Load()
  Dim curTime As Variant
  Dim curRow As Integer
  Dim i As Integer

  ' Fill the leftmost column with appointment times.
  curRow = 1
  For curTime = Prefs.timeStart To Prefs.timeEnd Step Prefs.timeIncrement
    ApptTimes(curRow) = Format$(curTime, "hh:mm am/pm")
    curRow = curRow + 1
  Next curTime
    
  rowMax = (Prefs.timeEnd - Prefs.timeStart) / Prefs.timeIncrement
       
  ' Inform the grid of how many rows are in the data
  ' set.  This helps with scroll bar positioning.
  ApptList.Height = (ApptList.RowHeight + (Screen.TwipsPerPixelY + 1)) * (rowMax - 0.1)
  ' ApptList column colors
  ApptList.BackColor = &H80FFFF
  ApptList.Columns(0).BackColor = &HC0C0C0
  ApptList.Columns(0).Locked = True

  
  ' Forces the FetchCellStyle event to be called for column 1-5
  For i = 1 To 5
    ApptList.Columns(i).FetchStyle = True
  Next i
  
  dbDir = App.Path
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  ' Since we can't trap a "drop" which occurs outside of our
  ' application, this is a pretty good solution.  Whenever the
  ' cursor passes over the form, if we're still dragging check
  ' to see if the button is now up.  If so, just cancel the
  ' operation
  If Dragging Then
    If (Button And vbLeftButton) = 0 Then
      valid% = EndDragMode(MASK_NONE)
    End If
  End If
End Sub

Private Sub Frame1_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
 valid% = DragValid(Source, MASK_NONE, State)
End Sub

Private Sub Frame2_DragDrop(Source As Control, X As Single, Y As Single)
  DragRow = 0
  valid% = EndDragMode(MASK_NONE)
End Sub

Private Sub Frame2_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NONE, State)
End Sub

Private Sub Image1_DragDrop(Source As Control, X As Single, Y As Single)
  DragRow = 0
  valid% = EndDragMode(MASK_NONE)
End Sub

Private Sub Image1_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NONE, State)
End Sub

Private Sub KindFrame_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
  DragRow = 0
  valid% = EndDragMode(MASK_NONE)
End Sub

Private Sub KindFrame_DragOver(Index As Integer, Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NEWAPPT, State)
End Sub

Private Sub KindPict_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
  DragRow = 0
  valid% = EndDragMode(MASK_NONE)
End Sub

Private Sub KindPict_DragOver(Index As Integer, Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NEWAPPT, State)
End Sub

Private Sub KindPict_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  ' When the left button goes down over an "appointment type"
  ' icon, drag its image in NEWAPPT mode.  Copy the DragIcon
  ' each time, since it may still be set to the "no drop" icon
  ' from a previous cancellation.

  If Button And vbLeftButton Then
    KindFrame(Index).DragIcon = DragArrow.DragIcon
    BeginDragMode KindFrame(Index), MASK_NEWAPPT
    KindFrame(Index).BackColor = vbCyan
        
    ' Save the index, we'll need it in EndDragMode
    DragIndex = Index
  End If
End Sub

Private Sub Label1_DragDrop(Source As Control, X As Single, Y As Single)
  DragRow = 0
  valid% = EndDragMode(MASK_NONE)
End Sub

Private Sub Label1_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NONE, State)
End Sub

Private Sub Label2_DragDrop(Source As Control, X As Single, Y As Single)
  DragRow = 0
  valid% = EndDragMode(MASK_NONE)
End Sub

Private Sub Label2_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NONE, State)
End Sub

Private Sub mnuHelpOption_Click(Index As Integer)
  Dim temp
  Dim HelpDir As String

  On Error GoTo ErrorRoutine

  HelpDir = "WinHelp.exe " + dbDir + "\Apptbook.hlp"
  
  Select Case Index
    'Case 1 will bring up the help file for Appointment Book.
    Case 1
      temp = Shell(HelpDir, vbNormalFocus)
    'Case 2 shows the about box for Appointment Book.
    Case 2
      About.Show 1
  End Select
  
ErrorRoutine:
  If Err = 53 Then
    MsgBox "WinHelp.exe could not be found"
  End If
End Sub

Private Sub SaveButton_Click()
  ' Save all data in the post-it area to the grid.
  Dim i As String
  Dim rowsVisible As Integer
  Dim tempCol As Integer
   
  tempCol = ApptList.Col
  rowsVisible = ApptList.VisibleRows - 1
    
  ' We can only save if there's an appointment on the current
  ' grid row already (at least a blank one).
  If InStr(ApptList.Columns(ApptList.Col).Text, ":") = 0 Then
    MsgBox "No appointment at current row"
    Exit Sub
  End If
    
  ApptInfo(ApptList.Col, ApptList.Bookmark) = ApptType.Text & ": " & ApptText.Text
  ApptList.Columns(ApptList.Col).RefetchCell
  ApptList.Col = tempCol
  IgnoreRowChange = False
End Sub

Private Sub SaveButton_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  valid% = DragValid(Source, MASK_NONE, State)
End Sub

Private Function TimeRow(thetime As Variant) As Integer
  ' Given a time value, return the row number within the grid
  ' where the specified time slot is located.
  TimeRow = (thetime - TimeValue("08:00am")) / TimeValue("00:30")
End Function

Private Sub TrashCan_DragDrop(Source As Control, X As Single, Y As Single)
  ' The trash can only accepts drops for "old appointments" from
  ' the grid.
  If EndDragMode(MASK_OLDAPPT) Then
    ' Get rid of feedback
    TrashCan.Picture = TrashClosed.Picture

    ' Clear the grid row and update the post-it area
    ApptInfo(GridDragCol, GridDragRow) = ""
    ApptList.Columns(GridDragCol).RefetchCell
    ApptList.Col = GridDragCol
    ApptList.Bookmark = GridDragRow
    DragRow = 0
    ApptEdit
    ApptList.SetFocus
  End If
End Sub

Private Sub TrashCan_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
  ' Provide feedback by "opening the trashcan" whenever an
  ' old appointment is dragged over the trash.
  If DragValid(Source, MASK_OLDAPPT, State) Then
    Select Case State
      Case vbEnter
        ' Open when entering
        TrashCan.Picture = TrashOpened.Picture
      Case vbLeave
        ' Close when leaving
        TrashCan.Picture = TrashClosed.Picture
    End Select
  End If
End Sub

' MakeBookmark function
Private Function MakeBookmark(Index As Long) As Variant
    ' This support function is used only by the remaining
    ' support functions.  It is not used directly by the
    ' unbound events.  It is a good idea to create a
    ' MakeBookmark function such that all bookmarks can
    ' be created in the same way.  Thus the method by
    ' which bookmarks are created is consistent and easy
    ' to modify.  This function creates a bookmark when
    ' given an array row index.

    ' Since we have data stored in an array, we will just
    ' use the array index as our bookmark.  We will convert
    ' it to a string first, using the Str$ function.  Thus,
    ' if Index = 27, the Bookmark that is created is the
    ' string, " 27".  (Str$ always leaves a leading space
    ' for the sign of the number.)
    
    MakeBookmark = Str$(Index)
End Function

' IndexFromBookmark function
Private Function IndexFromBookmark(Bookmark As Variant, _
        Offset As Long) As Long
    ' This support function is used only by the remaining
    ' support functions.  It is not used directly by the
    ' unbound events.
    
    ' IndexFromBookmark computes the row index that
    ' corresponds to a row that is (Offset) rows from the
    ' row specified by the Bookmark parameter.  For example,
    ' if Bookmark refers to the index 50 of the dataset
    ' array and Offset = -10, then IndexFromBookmark will
    ' return 50 + (-10), or 40.  Thus to get the index of
    ' the row specified by the bookmark itself, call
    ' IndexFromBookmark with an Offset of 0.  If the given
    ' Bookmark is Null, it refers to BOF or EOF.  If
    ' Offset < 0, the grid is requesting rows before the
    ' row specified by Bookmark, and so we must be at EOF
    ' because prior rows do not exist for BOF.  Conversely,
    ' if Offset > 0, we are at BOF.
    
    Dim Index As Long
    
    If IsNull(Bookmark) Then
        If Offset <= 0 Then
            ' Bookmark refers to EOF.  Since rowMax
            ' is the index of the last record, we can use
            ' an index of (rowMax + 1) to represent EOF.
            Index = (rowMax + 1) + Offset
        Else
            ' Bookmark refers to BOF.  Since 1 is the index
            ' of the first record, we can use an index of
            ' 0 to represent BOF.
            Index = 0 + Offset
        End If
    Else
        ' Convert string to long integer
        Index = Val(Bookmark) + Offset
    End If
    
    ' Check to see if the row index is valid:
    '   (0 <= Index < rowMax).
    ' If not, set it to a large negative number to
    ' indicate that it is invalid.
    If Index > 0 And Index < rowMax Then
       IndexFromBookmark = Index
    Else
       IndexFromBookmark = -9999
    End If
End Function

' GetRelativeBookmark function
Private Function GetRelativeBookmark(Bookmark As Variant, _
        Offset As Long) As Variant
    ' GetRelativeBookmark is used to get a bookmark for a
    ' row that is a specified number of rows away from the
    ' given row.  Offset specifies the number of rows to
    ' move.  A positive Offset indicates that the desired
    ' row is after the one referred to by Bookmark, and a
    ' negative Offset means it is before the one referred
    ' to by Bookmark.
    
    Dim Index As Long
    
    ' Compute the row index for the desired row
    Index = IndexFromBookmark(Bookmark, Offset)
    If Index <= 0 Or Index > rowMax Then
        ' Index refers to a row before the first or after
        ' the last, so just return Null.
        GetRelativeBookmark = Null
    Else
        GetRelativeBookmark = MakeBookmark(Index)
    End If
End Function

' GetUserData function
Private Function GetUserData(Bookmark As Variant, _
        Col As Integer) As Variant
    ' In this example, GetUserData is called by
    ' UnboundReadData to ask the user what data should be
    ' displayed in a specific cell in the grid.  The grid
    ' row the cell is in is the one referred to by the
    ' Bookmark parameter, and the column it is in it given
    ' by the Col parameter.  GetUserData is called on a
    ' cell-by-cell basis.
    
    Dim Index As Long
        
    ' Figure out which row the bookmark refers to
    Index = IndexFromBookmark(Bookmark, 0)
    
    If Index <= 0 Or Index > rowMax Then
        ' Cell position is invalid, so just return null to
        ' indicate failure
        GetUserData = Null
    Else
    If Col = 0 Then
     GetUserData = ApptTimes(Index)
    Else
     GetUserData = ApptInfo(Col, Index)
    End If
    End If
End Function

' StoreUserData function
Private Function StoreUserData(Bookmark As Variant, Col As Integer, Userval As Variant) As Boolean
    ' StoreUserData is called from UnboundWriteData to
    ' write the newly changed information in the grid to
    ' the array.  This function is called once for each
    ' field that needs to be stored.  The grid cell that
    ' this function is called to store is referenced in
    ' the same way as in GetUserData.

    Dim Index As Long
    
    ' Figure out which row the bookmark refers to
    Index = IndexFromBookmark(Bookmark, 0)
    
    If Index <= 0 Or Index > rowMax Then
        ' Cell position is invalid, so just return null
        ' to indicate failure
        StoreUserData = False
    Else
        StoreUserData = True
        If Col = 0 Then
        ApptTimes(Index) = Userval
        Else
          ApptInfo(Col, Index) = Userval
        End If
   End If
End Function

' UnboundReadDataEx event
Private Sub ApptList_UnboundReadDataEx(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, StartLocation As Variant, ByVal Offset As Long, ApproximatePosition As Long)
    ' UnboundReadData is fired by an unbound grid whenever
    ' it requires data for display.  This event will fire
    ' when the grid is first shown, when Refresh or ReBind
    ' is used, when the grid is scrolled, and after a
    ' record in the grid is modified and the user commits
    ' the change by moving off of the current row.  The
    ' grid fetches data in "chunks", and the number of rows
    ' the grid is asking for is given by RowBuf.RowCount.
    
    ' RowBuf is the row buffer where you place the data
    ' the bookmarks for the rows that the grid is
    ' requesting to display.  It will also hold the number
    ' of rows that were successfully supplied to the grid.
    
    ' StartLocation is a bookmark which, together with
    ' Offset, specifies the row for the programmer to start
    ' transferring data.  A StartLocation of Null indicates
    ' a request for data from BOF or EOF.
    
    ' Offset specifies the relative position (from
    ' StartLocation) of the row for the programmer to start
    ' transferring data.  A positive number indicates a
    ' forward relative position while a negative number
    ' indicates a backward relative position.  Regardless
    ' of whether the rows to be read are before or after
    ' StartLocation, rows are always fetched going forward
    ' (this is why there is no ReadPriorRows parameter to
    ' the procedure).
    
    ' If you page down on the grid, for instance, the new
    ' top row of the grid will have an index greater than
    ' the StartLocation (Offset > 0).  If you page up on
    ' the grid, the new index is less than that of
    ' StartLocation, so Offset < 0.  If StartLocation is
    ' a bookmark to row N, the grid always asks for row
    ' data in the following order:
    '   (N + Offset), (N + Offset + 1), (N + Offset + 2)...
    
    ' ApproximatePosition is a value you can set to indicate
    ' the ordinal position of (StartLocation + Offset).
    ' Setting this variable will enhance the ability of the
    ' grid to display its vertical scroll bar accurately.
    ' If the exact ordinal position of the new location is
    '' not known, you can set it to a reasonable,
    ' approximate value, or just ignore this parameter.
    
    Dim ColIndex As Integer, J As Integer
    Dim RowsFetched As Integer, i As Long
    Dim NewPosition As Long, Bookmark As Variant

    RowsFetched = 0
    
    For i = 0 To RowBuf.RowCount - 1
        ' Get the bookmark of the next available row
        Bookmark = GetRelativeBookmark(StartLocation, _
                   Offset + i)
    
        ' If the next row is BOF or EOF, then stop fetching
        ' and return any rows fetched up to this point.
        If IsNull(Bookmark) Then Exit For
    
        ' Place the record data into the row buffer
        For J = 0 To RowBuf.ColumnCount - 1
            ColIndex = RowBuf.ColumnIndex(i, J)
            RowBuf.Value(i, J) = GetUserData(Bookmark, _
                                 ColIndex)
        Next J
    
        ' Set the bookmark for the row
        RowBuf.Bookmark(i) = Bookmark
    
        ' Increment the count of fetched rows
        RowsFetched = RowsFetched + 1
    Next i
    
    ' Tell the grid how many rows were fetched
    RowBuf.RowCount = RowsFetched
    
    ' Set the approximate scroll bar position.  Only
    ' nonnegative values of IndexFromBookmark() are valid.
    NewPosition = IndexFromBookmark(StartLocation, Offset)
    If NewPosition >= 0 Then _
       ApproximatePosition = NewPosition
End Sub

' UnboundWriteData event
Private Sub ApptList_UnboundWriteData(ByVal RowBuf As TrueOleDBGrid60.RowBuffer, WriteLocation As Variant)
    ' UnboundWriteData event is fired when the user
    ' modifies an existing row within an unbound grid and
    ' attempts to commit the changes by moving to another
    ' row or calling the Update method of the grid.  This
    ' notifies the program that data has changed in the
    ' grid and it needs to be stored in the data source.
    
    ' RowBuf is the row buffer from which you retrieve the
    ' data to be stored in the data source.  Since only
    ' one row can be updated at a time, RowBuf.RowCount
    ' always equals 1.  If a particular column in the row
    ' has not been changed, its element in the RowBuf.Value
    ' array will be null.
    
    ' WriteLocation is a bookmark that identifies the row
    ' to be updated.
    
    ' Assume that a function StoreUserData(bookmark, col,
    ' value) takes a row bookmark, a column index, and a
    ' variant with the appropriate data to be stored in
    ' an array or database.  The function returns True if
    ' the data is acceptable and can be stored, False
    ' otherwise.
    
    Dim i As Integer
    
    ' Loop over all the columns of the row, storing
    ' non-Null values
    For i = 0 To RowBuf.ColumnCount - 1
        If Not IsNull(RowBuf.Value(0, i)) Then
            If Not StoreUserData(WriteLocation, i, _
               RowBuf.Value(0, i)) Then
                RowBuf.RowCount = 0 ' Tell the grid the
                                    ' update failed, so
            End If                  ' exit the event.
        End If
    Next i
End Sub

Public Function ChangeTime(newtime As Variant)
  ' Given a new time for an appointment at the current row, this
  ' routine moves the appointment to the new location in the grid.
  
  Dim trow As Integer
  Dim oldAppt As String
  Dim rowsVisible As Integer
    
  trow = TimeRow(newtime)
  rowsVisible = ApptList.VisibleRows - 1
  ' If the user entered an invalid time print an error
  If trow > (rowsVisible) Or trow < 0 Then
    ChangeTime = False
    MsgBox "Invalid time"
    Exit Function
  End If
    
  ChangeTime = True
    
  ' Actually move the row.
  oldAppt = ApptList.Columns(ApptList.Col).Text
    
  If ApptList.Bookmark < 1 Then
    ApptList.Bookmark = Null
    ApptList.ReBind
    Exit Function
  End If

  ApptList.Columns(ApptList.Col).Text = ""
  ApptList.Bookmark = trow + 1
    
  ApptList.Columns(ApptList.Col).Text = oldAppt
  ApptList.PostMsg (1)
End Function


