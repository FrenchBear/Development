VERSION 5.00
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkMode        =   1  'Source
   LinkTopic       =   "System"
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub MDIForm_LinkClose()
    Trace "MDIForm_LinkClose()"
End Sub

Private Sub MDIForm_LinkError(LinkErr As Integer)
    Trace "MDIForm_LinkError " & LinkErr
End Sub

Private Sub MDIForm_LinkExecute(CmdStr As String, Cancel As Integer)
    Trace "MDIForm_LinkExecute " & CmdStr
    ExecuteCommand CmdStr
    Cancel = 0
End Sub

Private Sub MDIForm_LinkOpen(Cancel As Integer)
    Trace "MDIForm_LinkOpen"
End Sub

Sub Trace(ByVal sMsg As String)
    frmTrace.Show
    frmTrace.lstTrace.AddItem sMsg
    frmTrace.lstTrace.ListIndex = frmTrace.lstTrace.ListCount - 1
End Sub
