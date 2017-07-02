Module [Global]
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

	'Routine to Display an Error Message
	Public Sub ErrorMessage(Optional ByVal Location As String = "")
		Dim sMsg As System.Text.StringBuilder
		Dim sTrace As String = Err.GetException.StackTrace

		sMsg = New System.Text.StringBuilder
		sMsg.Append("Error No: " & Err.Number & ControlChars.CrLf)
		sMsg.Append("Error Location: " & Location & ControlChars.CrLf)
		sMsg.Append(Chr(Asc("-")), 25)
		sMsg.Append(ControlChars.CrLf)
		sMsg.Append("Exception Message: " & Err.GetException.Message & ControlChars.CrLf)
		sMsg.Append("Exception Source: " & Err.GetException.Source & ControlChars.CrLf)
		sMsg.Append("Exception Target Site: " & Err.GetException.TargetSite.Name & ControlChars.CrLf)
		sMsg.Append("Exception Location: " & sTrace.Substring(sTrace.IndexOf(":") + 1))
		sMsg.Append(Chr(Asc("-")), 25)
		MsgBox(sMsg.ToString, MsgBoxStyle.Critical, "Errors Occured")
		sMsg = Nothing
	End Sub

#End Region
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
End Module
