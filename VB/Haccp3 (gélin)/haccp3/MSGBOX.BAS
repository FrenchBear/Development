Attribute VB_Name = "modMsgBox"
Option Explicit

Public Sub MsgBoxOkHelp(ByVal Message As String, ByVal Icon As Integer, ByVal Titre As String, ByVal FichierAideProgramme As String, ByVal ContextIDProgramme As Integer, ByVal FichierAideHACCP As String, ByVal ContextIDHACCP As Integer)

    Load formMsgBox
    formMsgBox.btnInfos.Tag = Format$(ContextIDHACCP)
    formMsgBox.Caption = Titre
    formMsgBox.HelpContextID = ContextIDProgramme
    formMsgBox.lblMessage = Message
    formMsgBox.Show MODAL

End Sub


