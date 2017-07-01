Attribute VB_Name = "UtilImpression"
' Utilitaires Impression
' Routines g�n�rales d'assistance � l'impression
' Travaillent sur un object g�n�rique qui peut �tre une forme ou une imprimante
' 20/03/97 PV

Option Explicit


Sub Texte(o As Object, x As Single, y As Single, sTexte As String)
  o.CurrentX = x
  o.CurrentY = y
  o.Print sTexte;
End Sub


Sub TexteCentr�(o As Object, x1 As Single, x2 As Single, y As Single, sTexte As String)
  o.CurrentX = x1 + (x2 - x1 - o.TextWidth(sTexte)) / 2
  o.CurrentY = y
  o.Print sTexte;
End Sub


Sub TexteDroite(o As Object, x As Single, y As Single, sTexte As String)
  o.CurrentX = x - o.TextWidth(sTexte)
  o.CurrentY = y
  o.Print sTexte;
End Sub

' Retourne une taille de police ajust�e selon le pr�riph�rique
Function FSize(o As Object, fTaille As Single) As Single
  If o Is Printer Then
    FSize = fTaille
  Else
    FSize = fTaille / 2
  End If
End Function


' Dessine un texte dans une largeur donn�e, avec retour � la ligne si n�cessaire
Sub BlocTexte(o As Object, ByVal x As Single, ByVal y As Single, fWidth As Single, ByVal sTexte As String, Optional ByVal iMaxLignes As Integer = 99)
  Do
    If o.TextWidth(sTexte) <= fWidth Then
      Texte o, x, y, sTexte
      Exit Sub
    End If
    
    ' On recherche la position du dernier caract�re qui rentre
    ' On part de la fin. Pas performant, � r��crire par dichotomie
    Dim l As Integer
    l = Len(sTexte) - 1
    While (o.TextWidth(Left(sTexte, l)) > fWidth)
      l = l - 1
    Wend
    ' On recherche le 1er blanc
    While Mid(sTexte, l + 1, 1) <> " "
      l = l - 1
    Wend
    Texte o, x, y, Left(sTexte, l)
    sTexte = Mid(sTexte, l + 2)
    y = y + o.TextHeight(sTexte)
    
    iMaxLignes = iMaxLignes - 1
  Loop Until iMaxLignes = 0
End Sub

