Attribute VB_Name = "modArguments"
' modArguments
' Fonction de d�coupage d'arguments
' 26/11/97 PV  Module s�par�

Option Explicit


' R�cup�re le prochain argument de sCha�ne, et l'enl�ve de sCha�ne
' Les arguments sont s�par�s par des espaces et peuvent �tre entour�s de " ou de '
Public Function sGetArg(ByRef sCha�ne As String) As String
  If sCha�ne = "" Then Err.Raise 6000, "sGetArg", "Argument obligatoire manquant"
  
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


Public Sub FinArguments(ByVal sArg As String)
  If sArg <> "" Then Err.Raise 6002, "FinArguments", "Trop d'arguments"
End Sub


