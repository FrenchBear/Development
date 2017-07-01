Attribute VB_Name = "modArguments"
' modArguments
' D�coupe les arguments de command en un tableau
' 18/05/1998 PV

Option Explicit

Public iNbArguments As Integer
Public TabArguments() As String

Private sCommand As String

' R�cup�re le prochain argument de sCha�ne, et l'enl�ve de sCha�ne
' Les arguments sont s�par�s par des espaces et peuvent �tre entour�s de " ou de '
Private Function sGetArg(ByRef sCha�ne As String) As String
  Debug.Assert sCha�ne <> ""
  
  Dim cSep As String, iStart As Integer
  cSep = Left(sCha�ne, 1)
  If cSep <> "'" And cSep <> Chr(34) Then
    iStart = 1
    cSep = " "
  Else
    iStart = 2
  End If
  Dim iPos As Integer
  iPos = InStr(2, sCha�ne, cSep)
  If iPos = 0 Then
    If cSep = " " Then
      iPos = Len(sCha�ne) + 1
    Else
      Err.Raise 6001, "sGetArg", "Guillemets non �quilibr�s"
    End If
  End If
  
  sGetArg = Mid(sCha�ne, iStart, iPos - iStart)
  sCha�ne = LTrim(Mid(sCha�ne, iPos + 1))
End Function

Public Sub D�codeTableauArguments()
  sCommand = Trim(Command)
  While sCommand <> ""
    iNbArguments = iNbArguments + 1
    ReDim Preserve TabArguments(1 To iNbArguments)
    TabArguments(iNbArguments) = sGetArg(sCommand)
  Wend
End Sub
