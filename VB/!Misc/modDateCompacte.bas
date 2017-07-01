Attribute VB_Name = "modDateCompacte"
Option Explicit
' 1/12/95 PV

' Autorise la saisie des dates de type 241295 et les transforme en 24/12/1965
Public Sub DateCompacte(ByRef d)
  If Len(d) = 6 Or Len(d) = 8 And IsNumeric(d) Then
    Dim j As Integer, m As Integer, a As Integer
    j = Left(d, 2)
    m = Mid(d, 3, 2)
    If Len(d) = 6 Then
      a = Right(d, 2)
      If a < 20 Then a = a + 2000 Else a = a + 1900
    Else
      a = Right(d, 4)
    End If
    If j >= 1 And j <= 31 And m >= 1 And m <= 12 And a >= 1900 And a <= 2100 Then
      d = Left(d, 2) & "/" & Mid(d, 3, 2) & "/" & Format(a, "####")
    End If
  End If
End Sub

