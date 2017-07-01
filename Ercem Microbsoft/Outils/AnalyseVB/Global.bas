Attribute VB_Name = "Global"
' Global
' Procédures et subs généraux
' 20/02/1998 PV

Option Explicit

Global Const pi = 3.14
Public Const sNomApp As String = "Analyse VB"

Sub Assert(c As Boolean)
  If Not c Then Stop
End Sub

' Chaîne de longueur fixe
Function clf(ByVal sChaîne As String, ByVal iLen As Integer) As String
  If Len(sChaîne) > iLen Then
    clf = Left(sChaîne, iLen)
  Else
    clf = sChaîne & Space(iLen - Len(sChaîne))
  End If
End Function

' Détermine l'équivalence de deux chaînes, sans tenir compte de la casse
Function ChEq(ByRef ch1 As String, ByRef ch2 As String) As Boolean
  ChEq = StrComp(ch1, ch2, vbTextCompare) = 0
End Function

' Variante de InStr qui retourne la longueur de la chaîne de base+1
' si l'expression de recherche n'est pas trouvée
Public Function InStr2(ByVal iStart As Integer, ByVal sBase As String, ByVal sRecherche As String) As Integer
  Dim p As Integer
  p = InStr(iStart, sBase, sRecherche)
  If p = 0 Then
    InStr2 = Len(sBase) + 1
  Else
    InStr2 = p
  End If
End Function

