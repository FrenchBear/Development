Attribute VB_Name = "modCtrlChp"
Option Explicit

' Module g�n�rique de contr�le de champs
' PC 21/11/2001 Version initiale : Traitement des codes barre
' PC 29/11/2001 iCheckEstampFabricant : contr�le estampille fabricant

' constantes utilis�es dans la fonctions de contr�le de l'estampille fabricant
Public Const gintEstFabInvalide As Integer = -1   ' invalide
Public Const gintEstFabStandard As Integer = 0    ' standard
Public Const gintEstFabEtranger As Integer = 1    ' �tranger
Public Const gintEstFabAncien As Integer = 2      ' ancien
Public Const gintEstFabEmballeur As Integer = 3   ' emballeur
Public Const gintEstFabFounisseur As Integer = 4  ' fournisseur
Public Const gintEstFabCasino As Integer = 5      ' founisseur Casino (conserv� pour compatibilit�)
Public Const gintEstFabSurgel� As Integer = 6     ' fabricant surgel�
Public sLibEstFab(-1 To 6) As String              ' tableau des libell�s des estampilles fabriquant

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
  ' Formule stupide, le premier chiffre n'est pas pris en compte (on multiplie par z�ro ...)
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
    sNumEtb = ""          ' Pas n� d'�tablissement dans ce cas (celui de la planche d'IE est parfois bugg� ...)
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

Public Function iCheckEstampFabricant(sEstampilleFabricant As String) As Integer
Attribute iCheckEstampFabricant.VB_Description = "Contr�le l'estampille (le nom) d'un fabricant\r\nretourne -1 si invalide, sinon, valeur de 0 � 6 selon le type d'estampille"
' en entr�e :
' sEstampilleFabricant : chaine de caract�res � contr�ler
' en retour :
' code  type estampille fabricant
' - 1   invalide
'   0   standard
'   1   etranger
'   2   ancien
'   3   emballeur
'   4   founisseur
'   5   founisseur Casino (conserv� pour compatibilit�)
'   6   fabricant surgel�
  
  sEstampilleFabricant = UCase(Trim(sEstampilleFabricant))

  If bEstampFabSTANDARD(sEstampilleFabricant) Then
    iCheckEstampFabricant = gintEstFabStandard
  ElseIf bEstampFabETRANGER(sEstampilleFabricant) Then
    iCheckEstampFabricant = gintEstFabEtranger
  ElseIf bEstampFabANCIEN(sEstampilleFabricant) Then
    iCheckEstampFabricant = gintEstFabAncien
  ElseIf bEstampFabEMBALLEUR(sEstampilleFabricant) Then
    iCheckEstampFabricant = gintEstFabEmballeur
  ElseIf bEstampFabFOURNISSEUR(sEstampilleFabricant) Then
    iCheckEstampFabricant = gintEstFabFounisseur
' PC 16/10/2001
' Code fabricant casino plus utilis�
' ElseIf bEstampFabFOUNISSEUR_CASINO(sEstampilleFabricant) Then
'   iCheckEstampFabricant = gintEstFabCasino
  ElseIf bEstampFabFABRICANT_SURGELES(sEstampilleFabricant) Then
    iCheckEstampFabricant = gintEstFabSurgel�
  Else
    iCheckEstampFabricant = gintEstFabInvalide
  End If

End Function

Public Sub ChargeLibEstFab()
' PC 29/11/2001 : chargemnt en tableau du libell� des estampilles fabriquant
  sLibEstFab(gintEstFabInvalide) = "Invalide"
  sLibEstFab(gintEstFabStandard) = "Standard"
  sLibEstFab(gintEstFabEtranger) = "Etranger"
  sLibEstFab(gintEstFabAncien) = "Ancien"
  sLibEstFab(gintEstFabEmballeur) = "Emballeur"
  sLibEstFab(gintEstFabFounisseur) = "Fournisseur"
  sLibEstFab(gintEstFabCasino) = "Frs Casino"
  sLibEstFab(gintEstFabSurgel�) = "Fab.surgel�"

End Sub
Private Function bEstampFabANCIEN(sEstampilleFabricant As String) As Boolean
' vrai si l'estampille du fabricant est ancien

  Dim I As Integer, iPosTiret As Integer
  Dim sCodePays As String
  Dim sCodeDepartment As String, sCodeCommune As String
  Dim sCodeCee As String, sNomFabricant As String
  
' Initalisation
  bEstampFabANCIEN = False

' contr�les de base
  If Len(sEstampilleFabricant) < 6 Or InStr(sEstampilleFabricant, ".") = 0 Or _
    Right(sEstampilleFabricant, 1) = "." Then
    Exit Function
  End If

' extraction/recherche des sous chaines � ananlyser
  On Error Resume Next
  For I = 0 To 4
    Select Case I
    Case 0
      sCodePays = Split(sEstampilleFabricant, ".")(I)
    Case 1
      sCodeDepartment = Split(sEstampilleFabricant, ".")(I)
    Case 2
      sCodeCommune = Split(sEstampilleFabricant, ".")(I)
    Case 3
      sCodeCee = Split(sEstampilleFabricant, ".")(I)
    Case 4
      sNomFabricant = Split(sEstampilleFabricant, ".")(I)
    End Select
    If Err.Number = 9 Then  ' indice en dehors de bornes
      Exit For
    End If
  Next I
  
  If I = 3 Or I = 4 Then
    I = I - 1
  Else
    Exit Function
  End If
  On Error GoTo 0
  Err.Clear
      
  If sNomFabricant <> "" Then Exit Function ' s�parateur doit �tre "-"
  
  If I = 2 Then
    iPosTiret = InStr(sCodeCommune, "-")
    If iPosTiret > 0 Then
      If iPosTiret = Len(sCodeCommune) Then
        Exit Function 'le tiret ne doit pas �tre le dernier caract�re
      Else
        sNomFabricant = Mid(sCodeCommune, iPosTiret + 1)
        sCodeCommune = Left(sCodeCommune, iPosTiret - 1)
      End If
    End If
  Else  ' i = 4
    iPosTiret = InStr(sCodeCee, "-")
    If iPosTiret > 0 Then
      If iPosTiret = Len(sCodeCee) Then
        Exit Function 'le tiret ne doit pas �tre le dernier caract�re
      Else
        sNomFabricant = Mid(sCodeCee, iPosTiret + 1)
        sCodeCee = Left(sCodeCee, iPosTiret - 1)
      End If
    End If
  End If
  
' analyse/contr�le des sous chaines
  If bEstAncienneFamille(sCodePays) And bEstDepartement(sCodeDepartment) And _
    bKeChiffre(sCodeCommune) Then
    If sCodeCee = "" Then ' facultatif
      If sNomFabricant = "" Then  ' facultatif
         bEstampFabANCIEN = True
      Else
        If bEstNom(sNomFabricant, True) Then
          bEstampFabANCIEN = True
        End If
      End If
    Else  ' code cee renseign�
      If bEstCee(sCodeCee) Then
        If sNomFabricant = "" Then  ' facultatif
          bEstampFabANCIEN = True
        Else
          If bEstNom(sNomFabricant, True) Then
            bEstampFabANCIEN = True
          End If
        End If  'sNomFabricant = ""
      End If    'bEstCee(sCodeCee)
    End If      'sCodeCee = ""
  End If        'bEstAncienneFamille(CodePays) ... And bKeChiffre(sCodeCommune)

End Function

Private Function bEstampFabEMBALLEUR(sEstampilleFabricant As String) As Boolean
' vrai si l'estampille du fabricant est un emballeur
  
  If Left(sEstampilleFabricant, 4) = "EMB." And bEstNom(Mid(sEstampilleFabricant, 5), True) Then
    bEstampFabEMBALLEUR = True
  Else
    bEstampFabEMBALLEUR = False
  End If

End Function

Private Function bEstampFabETRANGER(sEstampilleFabricant As String) As Boolean
' vrai si l'estampille du fabricant est �tranger
  
  Dim I As Integer, iPosTiret As Integer, iPosPointDeb As Integer, iPosPointFin As Integer
  Dim sCodePays As String
  Dim sCodeLibre As String
  Dim sCodeCee As String, sNomFabricant As String
  
' Initalisation
  bEstampFabETRANGER = False

' contr�les de base
  If Len(sEstampilleFabricant) < 7 Or InStr(sEstampilleFabricant, ".") < 2 _
    Or Right(sEstampilleFabricant, 1) = "." Then
    Exit Function
  End If

' extraction/recherche des sous chaines � analyser
  
  iPosPointDeb = InStr(sEstampilleFabricant, ".")
  iPosPointFin = InStrRev(sEstampilleFabricant, ".")  ' recherche un car � partir de la fin
  iPosTiret = InStrRev(sEstampilleFabricant, "-")
  If (iPosPointDeb = iPosPointFin) Or (iPosPointDeb + 1 = iPosPointFin) _
    Or iPosPointDeb > 4 Then
     'qu'un seul point ou 2 c�te � c�te ou code pays de - 3 car
    Exit Function
  End If
    
  sCodePays = Left(sEstampilleFabricant, iPosPointDeb - 1)
  
  If iPosTiret > 0 Then
    If (iPosTiret = Len(sEstampilleFabricant)) Or (iPosTiret < iPosPointFin) Or (iPosTiret = iPosPointFin + 1) Then
      Exit Function 'le tiret ne doit pas �tre le dernier caract�re, �tre apr�s le dernier point et ne pas �tre � cot� du dernier point
    Else
      sNomFabricant = Mid(sEstampilleFabricant, iPosTiret + 1)
      sCodeCee = Mid(sEstampilleFabricant, iPosPointFin + 1, iPosTiret - iPosPointFin - 1)
    End If
  Else
    sNomFabricant = ""
    sCodeCee = Mid(sEstampilleFabricant, iPosPointFin + 1)
  End If
  
  sCodeLibre = Mid(sEstampilleFabricant, iPosPointDeb + 1, iPosPointFin - iPosPointDeb - 1)

' analyse/contr�le des sous chaines
  If bEstPays(sCodePays) And bEstNom(sCodeLibre, True) And bEstCee(sCodeCee) Then
    If sNomFabricant = "" Then
      bEstampFabETRANGER = True
    Else
      If bEstNom(sNomFabricant, True) Then
        bEstampFabETRANGER = True
      End If
    End If
  End If
  
End Function

Private Function bEstampFabFOURNISSEUR(sEstampilleFabricant As String) As Boolean
' vrai si l'estampille du fabricant est un fournisseur
  
  If bKeLettre(Left(sEstampilleFabricant, 1)) And bEstNom(sEstampilleFabricant, False) Then
    bEstampFabFOURNISSEUR = True
  Else
    bEstampFabFOURNISSEUR = False
  End If

End Function

Private Function bEstampFabFOUNISSEUR_CASINO(sEstampilleFabricant As String) As Boolean
' vrai si l'estampille du fabricant est le fournisseur Casino

  If Left(sEstampilleFabricant, 1) = "!" And bEstNom(Mid(sEstampilleFabricant, 2), False) Then
    bEstampFabFOUNISSEUR_CASINO = True
  Else
    bEstampFabFOUNISSEUR_CASINO = False
  End If

End Function

Private Function bEstampFabFABRICANT_SURGELES(sEstampilleFabricant As String) As Boolean
' vrai si l'estampille du fabricant est un fabricant de surgel�s
  
  Dim sTmp As String  ' chaine temporaire
  Dim sNomp1 As String, sNomp2 As String, sSG As String
  Dim I As Integer, iPosPoint As Integer, iPosTiret As Integer
  
  bEstampFabFABRICANT_SURGELES = False ' faux par d�faut
  
  If Left(sEstampilleFabricant, 4) = "FAB." Then
    sTmp = Mid(sEstampilleFabricant, 5)
    If sTmp <> "" Then
' recherche des sous chaines
      iPosTiret = InStr(sTmp, "-")
      If iPosTiret > 0 Then
        sNomp2 = Mid(sTmp, iPosTiret + 1)
        sTmp = Left(sTmp, iPosTiret - 1)
      Else
        sNomp2 = ""
      End If
      iPosPoint = InStr(sTmp, ".")
      If iPosPoint > 1 Then
        sSG = Right(sTmp, 2)
        sNomp1 = Left(sTmp, iPosPoint - 1)
      End If
' contr�les
      If bEstNom(sNomp1, True) Then
        If sSG = "SG" Then
          If iPosTiret > 0 Then
            If iPosTiret > iPosPoint Then
              If bEstNom(sNomp2, True) Then
                bEstampFabFABRICANT_SURGELES = True ' OK
              End If
            End If  'iPosTiret > iPosPoint
          Else
            bEstampFabFABRICANT_SURGELES = True ' OK
          End If    'iPosTiret > 0
        End If      'sSG = "SG"
      End If        'bEstNom(sNomp1, True)
    End If          'sTmp <> ""
  End If            'Left(sEstampilleFabricant, 4) = "FAB."
  
End Function

Private Function bEstampFabSTANDARD(sEstampilleFabricant As String) As Boolean
' vrai si l'estampille du fabricant est standard
' F.99.999.99.AAA

  Dim I As Integer, iPosTiret As Integer
  Dim sCodePays As String
  Dim sCodeDepartment As String, sCodeCommune As String, sCodeAgr�ment As String
  Dim sCodeCee As String, sNomFabricant As String
  
' Initalisation
  bEstampFabSTANDARD = False

' contr�les de base
  If Len(sEstampilleFabricant) < 11 Or InStr(sEstampilleFabricant, ".") = 0 Or _
    Left(sEstampilleFabricant, 1) <> "F" Or Right(sEstampilleFabricant, 1) = "." Then
    Exit Function
  End If

' extraction/recherche des sous chaines � ananlyser
  On Error Resume Next
  For I = 0 To 5
    Select Case I
    Case 0
      sCodePays = Split(sEstampilleFabricant, ".")(I)
    Case 1
      sCodeDepartment = Split(sEstampilleFabricant, ".")(I)
    Case 2
      sCodeCommune = Split(sEstampilleFabricant, ".")(I)
    Case 3
      sCodeAgr�ment = Split(sEstampilleFabricant, ".")(I)
    Case 4
      sCodeCee = Split(sEstampilleFabricant, ".")(I)
    Case 5
      sNomFabricant = Split(sEstampilleFabricant, ".")(I)
    End Select
    If Err.Number = 9 Then  ' indice en dehors de bornes
      Exit For
    End If
  Next I
  
  If I = 4 Or I = 5 Then
    I = I - 1
  Else
    Exit Function
  End If
  On Error GoTo 0
  Err.Clear
      
  If sNomFabricant <> "" Then Exit Function ' s�parateur doit �tre "-"
  
  If I = 3 Then
    iPosTiret = InStr(sCodeAgr�ment, "-")
    If iPosTiret > 0 Then
      If iPosTiret = Len(sCodeAgr�ment) Then
        Exit Function 'le tiret ne doit pas �tre le dernier caract�re
      Else
        sNomFabricant = Mid(sCodeAgr�ment, iPosTiret + 1)
        sCodeAgr�ment = Left(sCodeAgr�ment, iPosTiret - 1)
      End If
    End If
  Else  ' i = 4
    iPosTiret = InStr(sCodeCee, "-")
    If iPosTiret > 0 Then
      If iPosTiret = Len(sCodeCee) Then
        Exit Function 'le tiret ne doit pas �tre le dernier caract�re
      Else
        sNomFabricant = Mid(sCodeCee, iPosTiret + 1)
        sCodeCee = Left(sCodeCee, iPosTiret - 1)
      End If
    End If
  End If
  
' analyse/contr�le des sous chaines
  If sCodePays = "F" And bEstDepartement(sCodeDepartment) And _
    bEstCodeCommune(sCodeCommune) And bEstCodeAgr�ment(sCodeAgr�ment) Then
    If sCodeCee = "" Then ' facultatif
      If sNomFabricant = "" Then  ' facultatif
          bEstampFabSTANDARD = True
      Else
        If bEstNom(sNomFabricant, True) Then
          bEstampFabSTANDARD = True
        End If
      End If
    Else  ' code cee renseign�
      If bEstCee(sCodeCee) Then
        If sNomFabricant = "" Then  ' facultatif
          bEstampFabSTANDARD = True
        Else
          If bEstNom(sNomFabricant, True) Then
            bEstampFabSTANDARD = True
          End If
        End If  'sNomFabricant = ""
      End If    'bEstCee(sCodeCee)
    End If      'sCodeCee = ""
  End If        'sCodePays = "F" ... And bEstCodeAgr�ment(sCodeAgr�ment)
  
End Function

Private Function bEstAncienneFamille(sCodeFamille As String) As Boolean
' vrai si le param�tre est un code ancienne famille

  Select Case sCodeFamille
  Case "PC", "HH", "PP", "D", "F", "PR", "A", "H", "AH", "CR", "TC"
    bEstAncienneFamille = True
  Case Else
    bEstAncienneFamille = False
  End Select

End Function

Private Function bEstCee(sCodeCee As String) As Boolean
' vrai si le param�tre est un code CEE valide

  Select Case sCodeCee
  Case "CEE", "EEC", "EEG", "ISV", "EWG"
    bEstCee = True
  Case Else
    bEstCee = False
  End Select

End Function

Private Function bEstCodeAgr�ment(sCodeAgr�ment As String) As Boolean
' vrai si le param�tre est un code agr�ment valide

  Dim iCodeAgr As Integer

  bEstCodeAgr�ment = False
  
  If bKeChiffre(sCodeAgr�ment) Then
    iCodeAgr = CInt(sCodeAgr�ment)
    If iCodeAgr >= 1 And iCodeAgr <= 999 Then
      bEstCodeAgr�ment = True
    End If
  ElseIf sCodeAgr�ment = "PP" Then
    bEstCodeAgr�ment = True
  End If
    
End Function

Private Function bEstCodeCommune(sCodeCommune As String) As Boolean
' vrai si le param�tre est un code commune valide

  bEstCodeCommune = False
  
  If bKeChiffre(sCodeCommune) Then
    If Len(sCodeCommune) = 3 Then
      If sCodeCommune >= "001" And sCodeCommune <= "999" Then
        bEstCodeCommune = True
      End If
    End If
  End If

End Function

Private Function bEstDepartement(sCodeDpmt As String) As Boolean
' vrai si le param�tre est un code de d�partement m�tropole ou corse
  
  Const cAin = "01", cValdOise = "95"
  
  bEstDepartement = False   ' faux par d�faut
  If Len(sCodeDpmt) = 2 Then
    If bKeChiffre(sCodeDpmt) Then
      If sCodeDpmt >= cAin And sCodeDpmt <= cValdOise Then
        bEstDepartement = True
      End If
    Else  ' controle de la corse
      If sCodeDpmt = "2A" Or sCodeDpmt = "2B" Then
        bEstDepartement = True
      End If
    End If    'bKeChiffre(sCodeDpmt)
  End If      'Len(sCodeDpmt) = 2

End Function

Private Function bEstNom(sNom As String, bAvecPoint As Boolean) As Boolean
' vrai si le param�tre est un nom contenant des caract�res valides
' bAvecPoint : vrai si le caract�re point "." peut �tre un caract�re valide
  
  Dim I As Integer, L As Integer, C As String * 1
  
  bEstNom = True
  L = Len(sNom)
  If L = 0 Then ' chaine de longueur nulle
    bEstNom = False
  Else
    For I = 1 To L
      C = Mid(sNom, I, 1)
      If C Like "[a-zA-Z0-9 '/&.-]" Then
        If Not bAvecPoint And C = "." Then
          bEstNom = False
          Exit For
        End If
      Else
        bEstNom = False
        Exit For
      End If
    Next I
  End If

End Function

Private Function bEstPays(sCodePays As String) As Boolean
' vrai si le param�tre et un code pays valide

  Select Case sCodePays
  Case "B", "D", "DAN", "UK", "AUT", "DK", "E", "ESP", "ME", "NL", "I"
    bEstPays = True
  Case Else
    bEstPays = False
  End Select

End Function

