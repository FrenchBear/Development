Attribute VB_Name = "Module1"
Option Explicit


Sub Main()
    Dim hWnd As Long
    hWnd = FindWindowByPartialTitle("MDIForm1")
    If hWnd <> 0 Then
        UsePreviousInstance
        End
    End If
    
    MDIForm1.Show
    ExecuteCommand Command
End Sub

Public Sub ExecuteCommand(ByVal sCmd As String)
    Select Case sCmd
        Case "1"
            Form1.Show
        Case "2"
            Form2.Show
    End Select
End Sub



Sub UsePreviousInstance()
    MsgBox "Use previous instance"
    
    Load frmDDESource
    frmDDESource.Text1.LinkTopic = "Project1|System"
    frmDDESource.Text1.LinkMode = vbLinkManual
    frmDDESource.Text1.LinkExecute Command
    Unload frmDDESource
End Sub
