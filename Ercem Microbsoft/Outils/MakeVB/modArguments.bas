Attribute VB_Name = "modArguments"
' modArguments
' Découpe les arguments de command en un tableau
' 18/05/1998 PV

Option Explicit

Public iNbArguments As Integer
Public TabArguments() As String

Private sCommand As String

' Récupère le prochain argument de sChaîne, et l'enlève de sChaîne
' Les arguments sont séparés par des espaces et peuvent être entourés de " ou de '
Private Function sGetArg(ByRef sChaîne As String) As String
  Debug.Assert sChaîne <> ""
  
  Dim cSep As String, iStart As Integer
  cSep = Left(sChaîne, 1)
  If cSep <> "'" And cSep <> Chr(34) Then
    iStart = 1
    cSep = " "
  Else
    iStart = 2
  End If
  Dim iPos As Integer
  iPos = InStr(2, sChaîne, cSep)
  If iPos = 0 Then
    If cSep = " " Then
      iPos = Len(sChaîne) + 1
    Else
      Err.Raise 6001, "sGetArg", "Guillemets non équilibrés"
    End If
  End If
  
  sGetArg = Mid(sChaîne, iStart, iPos - iStart)
  sChaîne = LTrim(Mid(sChaîne, iPos + 1))
End Function

Public Sub DécodeTableauArguments()
  sCommand = Trim(Command)
  While sCommand <> ""
    iNbArguments = iNbArguments + 1
    ReDim Preserve TabArguments(1 To iNbArguments)
    TabArguments(iNbArguments) = sGetArg(sCommand)
  Wend
End Sub
