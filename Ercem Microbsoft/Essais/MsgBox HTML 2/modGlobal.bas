Attribute VB_Name = "modGlobal"
Option Explicit

Global Const sNomApp As String = "Test MsgBoxH"

Public Function HMsgBox(sMsg, Optional Buttons As VbMsgBoxStyle = vbOKOnly) As VbMsgBoxResult
  HMsgBox = frmMsgHtml.HMsgBox(sMsg, Buttons, sNomApp)
End Function

