VERSION 5.00
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "Subclass.ocx"
Begin VB.Form frmMouseTrack 
   Caption         =   "Mouse Leave Demonstration"
   ClientHeight    =   2745
   ClientLeft      =   4200
   ClientTop       =   2145
   ClientWidth     =   4065
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMouseTrack.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   2745
   ScaleWidth      =   4065
   Begin VB.PictureBox picTrack2 
      Height          =   1155
      Left            =   1380
      ScaleHeight     =   1095
      ScaleWidth      =   1155
      TabIndex        =   4
      Top             =   60
      Width           =   1215
   End
   Begin SubclassCtl.Subclass Subclass1 
      Left            =   3600
      Top             =   1260
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.PictureBox picVB 
      Height          =   1155
      Left            =   2700
      ScaleHeight     =   1095
      ScaleWidth      =   1215
      TabIndex        =   2
      Top             =   60
      Width           =   1275
   End
   Begin VB.PictureBox picTrack 
      Height          =   1155
      Left            =   60
      ScaleHeight     =   1095
      ScaleWidth      =   1155
      TabIndex        =   0
      Top             =   60
      Width           =   1215
   End
   Begin VB.Label lblMouse2 
      Caption         =   "Not over"
      Height          =   735
      Left            =   1380
      TabIndex        =   5
      Top             =   1260
      Width           =   1275
   End
   Begin VB.Image imgPic2 
      Height          =   480
      Left            =   720
      Picture         =   "frmMouseTrack.frx":1272
      Top             =   2100
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgPic 
      Height          =   480
      Left            =   60
      Picture         =   "frmMouseTrack.frx":1B3C
      Top             =   2100
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Label lblVB 
      Caption         =   "-"
      Height          =   435
      Left            =   2700
      TabIndex        =   3
      Top             =   1320
      Width           =   1275
   End
   Begin VB.Label lblMouse 
      Caption         =   "Not over"
      Height          =   735
      Left            =   60
      TabIndex        =   1
      Top             =   1260
      Width           =   1275
   End
End
Attribute VB_Name = "frmMouseTrack"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Const WM_MOUSEHOVER = &H2A1&
Private Const WM_MOUSELEAVE = &H2A3&

Private m_TrackedControl As Control

Private Sub Form_Load()
   Set imgPic.Container = picTrack
   imgPic.Move (picTrack.ScaleWidth - imgPic.Width) \ 2, (picTrack.ScaleHeight - imgPic.Height) \ 2
   Set imgPic2.Container = picTrack2
   imgPic2.Move (picTrack2.ScaleWidth - imgPic2.Width) \ 2, (picTrack2.ScaleHeight - imgPic2.Height) \ 2
End Sub

Sub StartMouseTracking(c As Control)
    Dim tET As tagTRACKMOUSEEVENT
    Dim lR As Long
    
    ' Tells Windows to start tracking the mouse over the specified hWnd:
    If m_TrackedControl Is Nothing Then
        ' Tracking will stop whenever a WM_MOUSEHOVER or WM_MOUSELEAVE event occurs.
        tET.cbSize = Len(tET)
        tET.dwFlags = TME_HOVER Or TME_LEAVE
        tET.dwHoverTime = HOVER_DEFAULT
        tET.hwndTrack = c.hWnd
        lR = TrackMouseEvent(tET)
           
        Set m_TrackedControl = c
        
        Subclass1.hWnd = c.hWnd
        Subclass1.Messages(WM_MOUSEHOVER) = True
        Subclass1.Messages(WM_MOUSELEAVE) = True
    End If
End Sub

Sub StopTracking()
    Subclass1.Messages(WM_MOUSEHOVER) = False
    Subclass1.Messages(WM_MOUSELEAVE) = False
    Set m_TrackedControl = Nothing
End Sub


Private Sub Subclass1_WndProc(msg As Long, wParam As Long, lParam As Long, result As Long)
    Dim x As Single, y As Single
    Dim sProc As String
   
    ' Respond to WM_MOUSEHOVER and WM_MOUSELEAVE messages
    Select Case msg
        Case WM_MOUSEHOVER
            Dim Button As MouseButtonConstants
            Dim Shift As ShiftConstants
            
            sProc = m_TrackedControl.Name & "_MouseHover"
            StopTracking
            If (wParam And MK_LBUTTON) = MK_LBUTTON Then Button = Button Or vbLeftButton
            If (wParam And MK_RBUTTON) = MK_RBUTTON Then Button = Button Or vbRightButton
            If (wParam And MK_MBUTTON) = MK_MBUTTON Then Button = Button Or vbMiddleButton
            If (wParam And MK_CONTROL) = MK_CONTROL Then Shift = Shift Or vbCtrlMask
            If (wParam And MK_SHIFT) = MK_SHIFT Then Shift = Shift Or vbShiftMask
            x = lParam And &HFFFF&
            y = lParam \ &H10000
            CallByName Me, sProc, VbMethod, Button, Shift, x, y
        
        Case WM_MOUSELEAVE
            sProc = m_TrackedControl.Name & "_MouseLeave"
            StopTracking
            CallByName Me, sProc, VbMethod
    End Select
    
    ' Calls default action
    result = Subclass1.CallWndProc(msg, wParam, lParam)
End Sub


Public Sub picTrack_MouseHover(Button As MouseButtonConstants, Shift As ShiftConstants, x As Single, y As Single)
   ' Hover event, support for user32 and comctl32 methods:
   lblMouse.Caption = "Mouse Hover!"
   StartMouseTracking picTrack
End Sub

Public Sub picTrack_MouseLeave()
   ' End tracking:
   lblMouse.Caption = "Mouse Has Left Control"
   imgPic.Visible = False
   picTrack.BackColor = Me.BackColor
End Sub

Private Sub picTrack_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
   ' Tracking is initialised by entering the control:
   If m_TrackedControl Is Nothing Then
      picTrack.BackColor = vbHighlight
      lblMouse.Caption = "Mouse over control"
      StartMouseTracking picTrack
      imgPic.Visible = True
   End If
End Sub


Public Sub picTrack2_MouseHover(Button As MouseButtonConstants, Shift As ShiftConstants, x As Single, y As Single)
   ' Hover event, support for user32 and comctl32 methods:
   lblMouse2.Caption = "Mouse Hover!"
   StartMouseTracking picTrack2
End Sub

Public Sub picTrack2_MouseLeave()
   lblMouse2.Caption = "Mouse Has Left Control"
   imgPic2.Visible = False
   picTrack2.BackColor = Me.BackColor
End Sub

Private Sub picTrack2_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
   ' Tracking is initialised by entering the control:
   If m_TrackedControl Is Nothing Then
      picTrack2.BackColor = vbHighlight
      lblMouse2.Caption = "Mouse over control"
      StartMouseTracking picTrack2
      imgPic2.Visible = True
   End If
End Sub

Private Sub picVB_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
   lblVB.Caption = "Mouse at " & x & "," & y
End Sub
