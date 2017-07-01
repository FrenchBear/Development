Attribute VB_Name = "modArguments"
' modArguments
' Fonction de découpage d'arguments
' 26/11/97 PV  Module séparé

Option Explicit


' Récupère le prochain argument de sChaîne, et l'enlève de sChaîne
' Les arguments sont séparés par des espaces et peuvent être entourés de " ou de '
Public Function sGetArg(ByRef sChaîne As String) As String
  If sChaîne = "" Then Err.Raise 6000, "sGetArg", "Argument obligatoire manquant"
  
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


Public Sub FinArguments(ByVal sArg As String)
  If sArg <> "" Then Err.Raise 6002, "FinArguments", "Trop d'arguments"
End Sub


