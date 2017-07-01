Attribute VB_Name = "UtilImpression"
' Utilitaires Impression
' Routines générales d'assistance à l'impression
' Travaillent sur un object générique qui peut être une forme ou une imprimante
' 20/03/1997 PV
' 21/09/1999 PV SetFont
' 27/10/2000 PV TexteTronqué
' 17/11/2000 PV Réécriture de bloctexte pour coupure sur -/ et retour à la ligne sur |
' 22/11/2001 PV BlocTexte gère les ruptures de ligne sur vbcrlf


Option Explicit


Sub Texte(o As Object, x As Single, y As Single, sTexte As String)
  o.CurrentX = x
  o.CurrentY = y
  o.Print sTexte;
End Sub


Sub TexteTronqué(o As Object, x As Single, xMax As Single, y As Single, ByVal sTexte As String)
  o.CurrentX = x
  o.CurrentY = y
  
  Do While sTexte <> "" And o.TextWidth(sTexte) > xMax - x
    sTexte = Left(sTexte, Len(sTexte) - 1)
  Loop
  o.Print sTexte;
End Sub


Sub TexteCentré(o As Object, x1 As Single, x2 As Single, y As Single, sTexte As String)
  o.CurrentX = x1 + (x2 - x1 - o.TextWidth(sTexte)) / 2
  o.CurrentY = y
  o.Print sTexte;
End Sub


Sub TexteDroite(o As Object, x As Single, y As Single, sTexte As String)
  o.CurrentX = x - o.TextWidth(sTexte)
  o.CurrentY = y
  o.Print sTexte;
End Sub

' Retourne une taille de police ajustée selon le prériphérique
Function FSize(o As Object, fTaille As Single) As Single
  If o Is Printer Then
    FSize = fTaille
  Else
    FSize = fTaille / 2
  End If
End Function


' Dessine un texte dans une largeur donnée, avec retour à la ligne si nécessaire
' Les | et les vbcrlf sont remplacés par des retours à la ligne
Function BlocTexte(o As Object, ByVal x As Single, ByVal y As Single, fWidth As Single, ByVal sTexte As String, Optional ByVal iMaxLignes As Integer = 99, Optional bOutput As Boolean = True) As Integer
  Dim nbl As Integer
  Dim p As Integer, p1 As Integer, p2 As Integer
  Do
    nbl = nbl + 1
    If o.TextWidth(sTexte) <= fWidth And InStr(1, sTexte, "|") = 0 And InStr(1, sTexte, vbCrLf) = 0 Then
      If bOutput Then Texte o, x, y, sTexte
      BlocTexte = nbl
      Exit Function
    End If
    
    p = 1
    p1 = -1
    While Mid(sTexte, p, 1) <> "|" And Mid(sTexte, p, 2) <> vbCrLf And o.TextWidth(Left(sTexte, p)) <= fWidth
      If Mid(sTexte, p, 1) = " " Then
        p1 = p - 1
        p2 = p + 1
      End If
      If Mid(sTexte, p, 1) Like "[-/]" Then
        p1 = p
        p2 = p + 1
      End If
      p = p + 1
    Wend
    If Mid(sTexte, p, 1) = "|" Then
      p1 = p - 1
      p2 = p + 1
    ElseIf Mid(sTexte, p, 2) = vbCrLf Then
      p1 = p - 1
      p2 = p + 2
    End If
    If p1 < 0 Then    ' Pas trouvé de point de coupure
      p1 = p - 1
      p2 = p
    End If
    
    If bOutput Then Texte o, x, y, Left(sTexte, p1)
    sTexte = Mid(sTexte, p2)
    y = y + o.TextHeight(sTexte)
    
    iMaxLignes = iMaxLignes - 1
  Loop Until iMaxLignes = 0
End Function


' Sélectionne une police valide pour le support o parmi une liste variable
' (la première de la liste qui convienne)
Function SetFont(o As Object, ParamArray tFont() As Variant) As String
  Dim v As Variant
  On Error Resume Next
  For Each v In tFont
    o.Font = v
    If Err = 0 Then
      SetFont = v
      Exit Function
    End If
  Next
  SetFont = ""
End Function

