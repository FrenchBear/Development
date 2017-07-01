Attribute VB_Name = "VLib"
Option Explicit

' =================================================================================
' Gestion des NULL

' Convertit NULL en cha�ne vide
Function NV(v As Variant) As String
  If IsNull(v) Then
    NV = ""
  Else
    NV = v
  End If
End Function


' Convertit un texte vide en NULL
' Convertit un texte en valeur num�rique long
Function VN(v) As Variant
  If VarType(v) = vbNull Then
    VN = v
  ElseIf v = "" Then
    VN = Null
  ElseIf IsNumeric(v) Then
    ' Gag: 2F et F2 sont consid�r�s comme num�riques�
    If IsNumeric(Left(v, 1)) And IsNumeric(Right(v, 1)) Then
      VN = CDbl(v)
    Else
      VN = v
    End If
  Else
    VN = v
  End If
End Function


' Convertit un texte vide en NULL
' Convertit un texte en une date
Function DVN(v As String) As Variant
  If v = "" Then
    DVN = Null
  Else
    DVN = CDate(v)
  End If
End Function


' Convertit un texte vide ou un z�ro en NULL
' Convertit un texte en valeur num�rique long
Function VZN(v As String) As Variant
  If v = "" Then
    VZN = Null
  Else
    VZN = CLng(v)
    If VZN = 0 Then VZN = Null
  End If
End Function


' Convertit NULL en 0
Function NZ(v As Variant) As Variant
  If IsNull(v) Then
    NZ = 0
  Else
    NZ = v
  End If
End Function


