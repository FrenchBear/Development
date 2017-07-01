VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4515
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6765
   LinkTopic       =   "Form1"
   ScaleHeight     =   4515
   ScaleWidth      =   6765
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstTrace 
      Height          =   2595
      Left            =   4020
      TabIndex        =   1
      Top             =   1620
      Width           =   2295
   End
   Begin MSDataGridLib.DataGrid dgVentilation 
      Height          =   2655
      Left            =   60
      TabIndex        =   0
      Top             =   1620
      Width           =   3795
      _ExtentX        =   6694
      _ExtentY        =   4683
      _Version        =   393216
      AllowUpdate     =   -1  'True
      HeadLines       =   1
      RowHeight       =   15
      AllowAddNew     =   -1  'True
      AllowDelete     =   -1  'True
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim r As Recordset

Dim bOkCancel As Boolean


Private Sub Form_Load()
  Set r = New Recordset
  
  r.Fields.Append "T1", adChar, 10
  r.Fields.Append "N1", adInteger
  
  r.Open
  r.AddNew
  r!T1 = "pomme"
  r!N1 = 10
  
  r.AddNew
  r!T1 = "poire"
  r!N1 = 1234
  
  r.AddNew
  r!T1 = "ananas"
  r!N1 = 2718
  
  r.Sort = "T1"
  
  Set dgVentilation.DataSource = r
End Sub



Private Sub Trace(sMsg As String)
  lstTrace.AddItem sMsg
  lstTrace.ListIndex = lstTrace.ListCount - 1
End Sub

Private Sub dgVentilation_AfterColEdit(ByVal ColIndex As Integer)
  Trace "AfterColEdit"
End Sub

Private Sub dgVentilation_AfterColUpdate(ByVal ColIndex As Integer)
  Trace "AfterColUpdate"
End Sub

Private Sub dgVentilation_AfterDelete()
  Trace "AfterDelete"
End Sub

Private Sub dgVentilation_AfterInsert()
  Trace "AfterInsert"
End Sub

Private Sub dgVentilation_AfterUpdate()
  Trace "AfterUpdate"
End Sub

Private Sub dgVentilation_BeforeColEdit(ByVal ColIndex As Integer, ByVal KeyAscii As Integer, Cancel As Integer)
  Trace "BeforeColEdit"
End Sub

Private Sub dgVentilation_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
  Trace "BeforeColUpdate"
End Sub

Private Sub dgVentilation_BeforeDelete(Cancel As Integer)
  Trace "BeforeDelete"
  Cancel = CInt(MsgBox("Confirmez-vous la suppression ?", vbQuestion + vbYesNo) = vbNo)
End Sub

Private Sub dgVentilation_BeforeInsert(Cancel As Integer)
  Trace "BeforeInsert"
End Sub

Private Sub dgVentilation_BeforeUpdate(Cancel As Integer)
  Trace "BeforeUpdate"
End Sub

Private Sub dgVentilation_ButtonClick(ByVal ColIndex As Integer)
  Trace "ButtonClick"
End Sub

Private Sub dgVentilation_Change()
  Trace "Change"
  bOkCancel = True
'  If Not bGrilleModifiée Then
'    dgVentilation.BackColor = RGB(0, 255, 255)
'    bGrilleModifiée = True
'  End If
End Sub

Private Sub dgVentilation_Click()
  Trace "Click"
End Sub

Private Sub dgVentilation_ColEdit(ByVal ColIndex As Integer)
  Trace "ColEdit"
End Sub

Private Sub dgVentilation_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
  Trace "ColResize"
End Sub

Private Sub dgVentilation_DblClick()
  Trace "DblClick"
End Sub

Private Sub dgVentilation_Error(ByVal DataError As Integer, Response As Integer)
  Trace "Error"
End Sub

Private Sub dgVentilation_GotFocus()
  Trace "GotFocus"
End Sub

Private Sub dgVentilation_HeadClick(ByVal ColIndex As Integer)
  Trace "HeadClick"
End Sub

Private Sub dgVentilation_KeyDown(KeyCode As Integer, Shift As Integer)
  Trace "KeyDown"
  ' Bug de 2xEchap détruit la ligne...
  If KeyCode = 27 Then
    If bOkCancel Then
      bOkCancel = False
    Else
      KeyCode = 0
      Beep
    End If
  End If
End Sub

Private Sub dgVentilation_KeyPress(KeyAscii As Integer)
  Trace "KeyPress"
End Sub

Private Sub dgVentilation_KeyUp(KeyCode As Integer, Shift As Integer)
  Trace "KeyUp"
End Sub

Private Sub dgVentilation_LostFocus()
  Trace "LostFocus"
End Sub

Private Sub dgVentilation_OnAddNew()
  Trace "OnAddNew"
End Sub

Private Sub dgVentilation_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Trace "RowColChange " & LastRow & "/" & LastCol
  bOkCancel = False
End Sub

Private Sub dgVentilation_RowResize(Cancel As Integer)
  Trace "RowResize"
End Sub

Private Sub dgVentilation_Scroll(Cancel As Integer)
  Trace "Scroll"
End Sub

Private Sub dgVentilation_SelChange(Cancel As Integer)
  Trace "SelChange"
End Sub

Private Sub dgVentilation_SplitChange()
  Trace "SplitChange"
End Sub

Private Sub dgVentilation_Validate(Cancel As Boolean)
  Trace "Validate"
End Sub

