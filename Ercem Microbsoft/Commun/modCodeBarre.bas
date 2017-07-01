Attribute VB_Name = "modCodesBarre"
Option Explicit
' Traitement des codes barre
' PC 21/11/2001 Version initiale
  
Private Const cSite As String = "GAPMOTBCDEFHIJKLNQRSUVWXYZ"

Public Function bDecodeCB_FP(sCodeBarre As String, _
  Optional sRéférencePrélèvement As String = "", _
  Optional sCodeEtablissement As String = "", _
  Optional iSommeContrôleLue As Integer = 0, _
  Optional iSommeContrôleCalculée As Integer = 0) As Boolean
Attribute bDecodeCB_FP.VB_Description = "Décodage des Codes Barre des Fiches de Prélèvement"

' Décodage des Codes Barre des Fiches de Prélèvement
' En entrée :
' - sCodeBarre : Chaine de caractère contenant le code barre à décoder
' En sortie :
' - Vrai si le code barre est valide, Faux sinon
' - sRéférencePrélèvement : chaîne de caractères contenant la référence du prélèvement
' - sCodeEtablissement : chaîne de caractères contenant le code de l'établissement
' - iSommeContrôleLue : Somme de contrôle du code barre ("checksum") lue dans le code barre
' - iSommeContrôleCalculée : Somme de contrôle du code barre ("checksum") calculée par la fonctions
'   si le code barre est correct, ces deux dernières valeurs sont égales


' sous-chaines du code barre
  Dim iSite As Integer, iPrel As Integer
  Dim iCS_Lu As Integer       ' CheckSum Lu
  Dim iIng As Integer
  Dim lPrest As Long
  Dim sEtb As String          ' code établissement lu
  Dim bEtbFimebio As Boolean  ' vrai si l'établissement est de type Fimebio (càd contenant un caractère alpha)
  
' utilisés dans le cacul de la somme de contrôle
  Dim I As Integer            ' compteur de boucle
  Dim iCS_Ca As Integer       ' CheckSum Calculé
  Dim sCarCB As String * 1    ' caractère du code barre
  Dim iCarCB As Integer       ' le même converti en entier
  Dim iValAjout  As Integer   ' valeur à ajouter dans le calcul de la check sum

  Dim sRéférence As String    ' Référence de l'échantillon extrait du code barre
  Dim sNumEtb As String       ' numéro d'établissement extrait du code barre

' vérifications de base
  If Len(sCodeBarre) <> 18 Then
    bDecodeCB_FP = False
    Exit Function
  End If
  If Not IsNumeric(sCodeBarre) Then
    bDecodeCB_FP = False
    Exit Function
  End If
  
  ' Vérification de la somme de contrôle
  ' les 2 derniers caractères du code barre correspondent à la check sum
  iCS_Lu = CInt(Mid(sCodeBarre, 17, 2))
  iCS_Ca = 0: sCarCB = ""
  ' Formule stupide, le premier chiffre n'est pas pris en compte (on multiplie par zéro…)
  ' correction PC du 21/11/2001 : on part dorénavant de 1, c'est moins stupide . . .
  For I = 1 To 15
    sCarCB = Mid(sCodeBarre, I + 1, 1): iCarCB = CInt(sCarCB)
    iValAjout = iCarCB * I
    iCS_Ca = iCS_Ca + iValAjout
'   iCS_Ca = iCS_Ca + (Asc(Mid(sCodeBarre, i + 1, 1)) - 48) * i
  Next
' contrôle spécifique Fimebio
  If iCS_Lu = (iCS_Ca + 11) Mod 100 Then
    iCS_Ca = iCS_Ca + 11
    bEtbFimebio = True  ' type de code barre Fimebio conteant un caractère alpha dans le code établissement
  Else
    bEtbFimebio = False
  End If
  
  iCS_Ca = iCS_Ca Mod 100
' mise à jour des paramètres à retourner
  iSommeContrôleLue = iCS_Lu
  iSommeContrôleCalculée = iCS_Ca
  
  If iCS_Lu <> iCS_Ca Then
    bDecodeCB_FP = False
    Exit Function
  End If

  iSite = CInt(Left(sCodeBarre, 3))
  lPrest = CDbl(Mid(sCodeBarre, 4, 6))
  iPrel = CInt(Mid(sCodeBarre, 10, 2))
  sEtb = Val(Mid(sCodeBarre, 12, 5))     ' Ne gère pas les n°s alphanumériques

  iIng = iSite Mod 26
  iSite = iSite \ 26
  
' extraction du code établissement
  If iPrel = 0 Then       ' Cas des étiquettes .FP
    sNumEtb = ""          ' Pas n° d'établissement dans ce cas (celui de la planche d'IE est parfois buggé…)
    iPrel = 1
  Else
    If sEtb = "1" Then    ' Scan de la FRT (idiot, mais…)
      sNumEtb = ""
    Else
      If bEtbFimebio Then sEtb = sEtb & Chr(65 + Val(sEtb) Mod 26)
      sNumEtb = sEtb
    End If
  End If
  sCodeEtablissement = sNumEtb

' extraction de la référence du prélèvement
' pas de point dans la référence...
  'sRéférence = Mid(cSite, iSite + 1, 1) & Chr(65 + iIng) & lPrest & "." & Right(Str(100 + iPrel), 2)
  sRéférence = Mid(cSite, iSite + 1, 1) & Chr(65 + iIng) & lPrest & Right(Str(100 + iPrel), 2)
  sRéférencePrélèvement = sRéférence

  bDecodeCB_FP = True

End Function
