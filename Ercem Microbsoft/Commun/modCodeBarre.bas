Attribute VB_Name = "modCodesBarre"
Option Explicit
' Traitement des codes barre
' PC 21/11/2001 Version initiale
  
Private Const cSite As String = "GAPMOTBCDEFHIJKLNQRSUVWXYZ"

Public Function bDecodeCB_FP(sCodeBarre As String, _
  Optional sR�f�rencePr�l�vement As String = "", _
  Optional sCodeEtablissement As String = "", _
  Optional iSommeContr�leLue As Integer = 0, _
  Optional iSommeContr�leCalcul�e As Integer = 0) As Boolean
Attribute bDecodeCB_FP.VB_Description = "D�codage des Codes Barre des Fiches de Pr�l�vement"

' D�codage des Codes Barre des Fiches de Pr�l�vement
' En entr�e :
' - sCodeBarre : Chaine de caract�re contenant le code barre � d�coder
' En sortie :
' - Vrai si le code barre est valide, Faux sinon
' - sR�f�rencePr�l�vement : cha�ne de caract�res contenant la r�f�rence du pr�l�vement
' - sCodeEtablissement : cha�ne de caract�res contenant le code de l'�tablissement
' - iSommeContr�leLue : Somme de contr�le du code barre ("checksum") lue dans le code barre
' - iSommeContr�leCalcul�e : Somme de contr�le du code barre ("checksum") calcul�e par la fonctions
'   si le code barre est correct, ces deux derni�res valeurs sont �gales


' sous-chaines du code barre
  Dim iSite As Integer, iPrel As Integer
  Dim iCS_Lu As Integer       ' CheckSum Lu
  Dim iIng As Integer
  Dim lPrest As Long
  Dim sEtb As String          ' code �tablissement lu
  Dim bEtbFimebio As Boolean  ' vrai si l'�tablissement est de type Fimebio (c�d contenant un caract�re alpha)
  
' utilis�s dans le cacul de la somme de contr�le
  Dim I As Integer            ' compteur de boucle
  Dim iCS_Ca As Integer       ' CheckSum Calcul�
  Dim sCarCB As String * 1    ' caract�re du code barre
  Dim iCarCB As Integer       ' le m�me converti en entier
  Dim iValAjout  As Integer   ' valeur � ajouter dans le calcul de la check sum

  Dim sR�f�rence As String    ' R�f�rence de l'�chantillon extrait du code barre
  Dim sNumEtb As String       ' num�ro d'�tablissement extrait du code barre

' v�rifications de base
  If Len(sCodeBarre) <> 18 Then
    bDecodeCB_FP = False
    Exit Function
  End If
  If Not IsNumeric(sCodeBarre) Then
    bDecodeCB_FP = False
    Exit Function
  End If
  
  ' V�rification de la somme de contr�le
  ' les 2 derniers caract�res du code barre correspondent � la check sum
  iCS_Lu = CInt(Mid(sCodeBarre, 17, 2))
  iCS_Ca = 0: sCarCB = ""
  ' Formule stupide, le premier chiffre n'est pas pris en compte (on multiplie par z�ro�)
  ' correction PC du 21/11/2001 : on part dor�navant de 1, c'est moins stupide . . .
  For I = 1 To 15
    sCarCB = Mid(sCodeBarre, I + 1, 1): iCarCB = CInt(sCarCB)
    iValAjout = iCarCB * I
    iCS_Ca = iCS_Ca + iValAjout
'   iCS_Ca = iCS_Ca + (Asc(Mid(sCodeBarre, i + 1, 1)) - 48) * i
  Next
' contr�le sp�cifique Fimebio
  If iCS_Lu = (iCS_Ca + 11) Mod 100 Then
    iCS_Ca = iCS_Ca + 11
    bEtbFimebio = True  ' type de code barre Fimebio conteant un caract�re alpha dans le code �tablissement
  Else
    bEtbFimebio = False
  End If
  
  iCS_Ca = iCS_Ca Mod 100
' mise � jour des param�tres � retourner
  iSommeContr�leLue = iCS_Lu
  iSommeContr�leCalcul�e = iCS_Ca
  
  If iCS_Lu <> iCS_Ca Then
    bDecodeCB_FP = False
    Exit Function
  End If

  iSite = CInt(Left(sCodeBarre, 3))
  lPrest = CDbl(Mid(sCodeBarre, 4, 6))
  iPrel = CInt(Mid(sCodeBarre, 10, 2))
  sEtb = Val(Mid(sCodeBarre, 12, 5))     ' Ne g�re pas les n�s alphanum�riques

  iIng = iSite Mod 26
  iSite = iSite \ 26
  
' extraction du code �tablissement
  If iPrel = 0 Then       ' Cas des �tiquettes .FP
    sNumEtb = ""          ' Pas n� d'�tablissement dans ce cas (celui de la planche d'IE est parfois bugg�)
    iPrel = 1
  Else
    If sEtb = "1" Then    ' Scan de la FRT (idiot, mais�)
      sNumEtb = ""
    Else
      If bEtbFimebio Then sEtb = sEtb & Chr(65 + Val(sEtb) Mod 26)
      sNumEtb = sEtb
    End If
  End If
  sCodeEtablissement = sNumEtb

' extraction de la r�f�rence du pr�l�vement
' pas de point dans la r�f�rence...
  'sR�f�rence = Mid(cSite, iSite + 1, 1) & Chr(65 + iIng) & lPrest & "." & Right(Str(100 + iPrel), 2)
  sR�f�rence = Mid(cSite, iSite + 1, 1) & Chr(65 + iIng) & lPrest & Right(Str(100 + iPrel), 2)
  sR�f�rencePr�l�vement = sR�f�rence

  bDecodeCB_FP = True

End Function
