Attribute VB_Name = "modConversions"
Attribute VB_Description = "Effectue les contr�les de types de champ, pour la saisie et pour la recherche"
' module modConversions
' Effectue les contr�les de types de champ, pour la saisie et pour la recherche
'  9/01/97 PV Plusieurs lettres permises dans sLettres1
'  3/09/97 PV IsDate accepte des dates comme "12/18/1997" --> corrig� dans IsDateCompacte
' 11/09/97 PV Fin de sLettres1; contr�le du fait que le couple de lettres est prise en charge par le syst�me (/lettresys)
' 10/12/97 PV Contr�le dynamique des dates extr�mes
' 22/12/97 PV Fonction Today; IsJourF�ri�
' 30/01/98 PV NV� dans VBLib
' 19/04/98 PV Date d'attente, strTime
'  3/06/98 PV sCl�Proprio
' 02/03/99 PV Logos Silliter It+Be
' 21/00/00 PV dDateMin fix�e au 1/1/99 et pas � now-365, trop restricitif
' 11/12/01 FG Traduction du libell� du r�sultat � l'affichage uniquement

Option Explicit

Private dDateMin As Date
Private dDateMax As Date

Public Const dAttente = #1/1/2019#
Public sAttente As String


' D�finit de fa�on dynamique les bornes extr�mes des dates valides
' Cela n'emp�che pas les contr�les plus stricts par ailleurs
Private Sub InitDateMinMax()
  'dDateMin = Now - 365
  dDateMin = #1/1/1998#
  dDateMax = Now + 100 * 4
End Sub


' Fonctions AssertOkxxx
' Bloquent si l'argument n'est pas du type requis

Public Sub AssertOkLettres(sLettres As String)
  Dim sMsg As String
  If Not bOkLettres(sLettres, sMsg) Then
    EchecAssert sLettres, sMsg
    Exit Sub
  End If
End Sub

Public Sub AssertOkDate(dDate As Date)
  If dDateMin = 0 Then InitDateMinMax
  If dDate = dAttente Then Exit Sub
  If dDate < dDateMin Or dDate >= dDateMax Then EchecAssert dDate, "Seules les dates entre le " & Format(dDateMin, "short date") & " et le " & Format(dDateMax, "short date") & " sont accept�es"
End Sub

Sub EchecAssert(Valeur As Variant, sExpressionAssert As String)
  Dim iRep As Integer
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CO080", "Question 080"), sExpressionAssert, Valeur)
  iRep = MsgBox(sMsg, vbAbortRetryIgnore + vbCritical)
  'iRep = MsgBox("�chec au Assert !" & vbCrLf & vbCrLf & sMsg & vbCrLf & "Valeur: " & Valeur, vbAbortRetryIgnore + vbCritical)
  If iRep = vbIgnore Then Exit Sub
  Stop
End Sub


' Fonctions bOkxxx
' Testent si l'argument est du type requis

' bOkLettres ne v�rifie que la syntaxe, mais pas si les lettres sont prises en charge
' par le syst�me distant (c'est le r�le de bOkLettresActuelles)
Function bOkLettres(sLettres As String, sMsg As String) As Boolean
  sLettres = UCase(sLettres)
  bOkLettres = False
  If Len(sLettres) <> 2 Then
    sMsg = sGetIntlLib("CR318", "Lettres incorrectes.|Il doit y avoir exactement deux lettres.")
  ElseIf Left(sLettres, 1) < "@" Or Left(sLettres, 1) > "Z" Or Right(sLettres, 1) < "A" Or Right(sLettres, 1) > "Z" Then
    sMsg = sGetIntlLib("CR319", "Lettres incorrectes.|Il doit y avoir uniquement des lettres entre A et Z. L'espace, les caract�res accentu�s, les chiffres et la ponctuation sont interdits.")
  Else
    bOkLettres = True
  End If
End Function


' V�rifie si les lettres sont correctes et prises en charge par le syst�me informatique distant
Function bOkLettresActuelles(sLettres As String, sMsg As String) As Boolean
  If Not bOkLettres(sLettres, sMsg) Then
    bOkLettresActuelles = False
  Else
    Dim b As Boolean
    b = bOkLettresAssistant(sLettres, "*")    ' On v�rifie si les lettres sont prises en charge par le syst�me distant
    If Not b Then sMsg = sprintf(sGetIntlLib("CR320", "Lettres %1 incorrectes.|Ces deux lettres ne sont pas prises en charge sur le syst�me Unix %2."), sLettres, sSyst�meDistant)
    bOkLettresActuelles = b
  End If
End Function


Function bOkDate(ByVal sDate As String) As Boolean
  If dDateMin = 0 Then InitDateMinMax
  Dim dTemp As Date
  dTemp = dD�codeDate(sDate)
  If dTemp = dAttente Then
    bOkDate = True
  Else
    bOkDate = dTemp >= dDateMin And dTemp < dDateMax
  End If
End Function

Function IsDateCompacte(ByVal sDate As String) As Boolean
  If Len(sDate) <> 4 And Len(sDate) <> 6 And Len(sDate) <> 8 Then
    IsDateCompacte = False
    Exit Function
  End If
  Dim i As Integer
  For i = 1 To Len(sDate)
    If Mid(sDate, i, 1) < "0" Or Mid(sDate, i, 1) > "9" Then
      IsDateCompacte = False
      Exit Function
    End If
  Next
  If Val(Left(sDate, 2)) < 1 Or Val(Left(sDate, 2)) > 31 Or Val(Mid(sDate, 3, 2)) < 1 Or Val(Mid(sDate, 3, 2)) > 12 Then
    IsDateCompacte = False
  Else
    IsDateCompacte = IsDate(Left(sDate, 2) & "/" & Mid(sDate, 3, 2) & "/" & IIf(Len(sDate) > 4, Mid(sDate, 5), Year(Now)))
  End If
End Function

Function dD�codeDate(ByVal sDate As String) As Date
  If IsDate(sDate) Then
    dD�codeDate = CDate(sDate)
  ElseIf IsDateCompacte(sDate) Then
    dD�codeDate = CDate(Left(sDate, 2) & "/" & Mid(sDate, 3, 2) & "/" & IIf(Len(sDate) > 4, Mid(sDate, 5), Year(Now)))
  Else
    dD�codeDate = #1/1/1900#
  End If
End Function

' Retourne la cha�ne, la 1�re lettre en majuscules
Function l1maj(ByVal s As String) As String
  If s = "" Then
    l1maj = ""
  Else
    l1maj = UCase(Left(s, 1)) & Mid(s, 2)
  End If
End Function

Private Function bOkValType(sVal As String, sType As String, sValNormalis�e As String, sMsgErr) As Boolean
  bOkValType = False
  Select Case LCase(sType)
    Case "n":
      Dim sTemp As String
      sTemp = Subst(sVal, ".", ",")
      If Not IsNumeric(sTemp) Then
        sMsgErr = sprintf(sGetIntlLib("CO094", "Valeur num�rique incorrecte: %1"), sVal)
        Exit Function
      End If
      sValNormalis�e = Subst(sVal, ",", ".")
      
    Case "a":
      sValNormalis�e = sVal
      
    Case "l":       ' Variante de A, lettres de planning
      Dim sMsgErr2 As String
      If Not bOkLettres(sVal, sMsgErr2) Then
        bOkValType = False
        sMsgErr = sMsgErr2
        Exit Function
      End If
      sValNormalis�e = UCase(sVal)
      
    Case "d":
      If Not bOkDate(sVal) Then
        sMsgErr = sprintf(sGetIntlLib("CO095", "Date incorrecte ou hors limites %1 - %2 : %3"), Format(dDateMin, "short date"), Format(dDateMax, "short date"), sVal)
        Exit Function
      End If
      Dim dTemp As Date
      dTemp = dD�codeDate(sVal)
      sValNormalis�e = Format(Day(dTemp), "00") & "/" & Format(Month(dTemp), "00") & "/" & Format(Year(dTemp), "0000")
      ' Surtout pas Format(dTemp, "short date") qui tient compte du panneau de config !
      
    Case Else
      ' Message interne
      MsgBox2i "CO081", sType
      'MsgBox "Type de donn�es '" & sType & "' incorrect dans bOkValType", vbCritical, sNomApp
      Stop
  End Select
  bOkValType = True
End Function

' R�cup�re le prochain champ de valeur dans la cha�ne sExp � partir de la position iPos
' La version actuelle simplifi�e s'arr�te au premier : | & trouv�, mais dans le cas
' des cha�nes de caract�re, il faudrait g�rer \ et "
Private Function sGetValeur(ByVal sExp As String, ByVal iPos As Integer) As String
  Dim p1 As Integer, p2 As Integer, p3 As Integer
  p1 = InStr2(iPos, sExp, ":")
  p2 = InStr2(iPos, sExp, "|")
  p3 = InStr2(iPos, sExp, "&")
  If p2 < p1 Then p1 = p2
  If p3 < p1 Then p1 = p3
  
  sGetValeur = Mid(sExp, iPos, p1 - iPos)
End Function

' bTestQuery
' V�rifie que le crit�re de recherche sExp est correct pour un champ de type sType
' sType: "n" num�rique,  "d" date,  "a" alphanum�rique,  "l" lettres
' sFinal: retourne le champ de requ�te correct pour le d�mon (s�parateur d�cimal, date�)
' sMsg: message d'erreur si la fonction renvoie faux

Function bTestQuery(ByVal sExp As String, sType As String, sFinal As String, sMsg As String) As Boolean
  Dim iPos As Integer
  Dim bOperateur As Boolean, sOperateur As String
  
  ' On traite tout de suite le cas de la cha�ne vide, qui est correct
  sMsg = ""
  If sExp = "" Then
    bTestQuery = True
    Exit Function
  End If
  
  bTestQuery = False
  
  iPos = 1
  Do
    bOperateur = False
    If Mid(sExp, iPos, 2) = ">=" Or Mid(sExp, iPos, 2) = "<=" Or Mid(sExp, iPos, 2) = "<>" Then
      bOperateur = True
      sOperateur = Mid(sExp, iPos, 2)
      sFinal = sFinal & sOperateur
      iPos = iPos + 2
    ElseIf Mid(sExp, iPos, 1) = ">" Or Mid(sExp, iPos, 1) = "<" Or Mid(sExp, iPos, 1) = "=" Then
      bOperateur = True
      sOperateur = Mid(sExp, iPos, 1)
      sFinal = sFinal & sOperateur
      iPos = iPos + 1
    End If
    
    Dim sVal As String, sValNormalis�e As String
    sVal = sGetValeur(sExp, iPos)
    If Not bOkValType(sVal, sType, sValNormalis�e, sMsg) Then Exit Function
    sFinal = sFinal & sValNormalis�e
    iPos = iPos + Len(sVal)
    If iPos > Len(sExp) Then
      bTestQuery = True
      Exit Function
    End If
    
    If Mid(sExp, iPos, 1) = ":" Then
      If bOperateur Then
        sMsg = sprintf(sGetIntlLib("CO096", "L'op�rateur de plage de valeurs : est incompatible avec les op�rateurs de comparaison %1"), sOperateur)
        Exit Function
      End If
      sFinal = sFinal & Mid(sExp, iPos, 1)
      iPos = iPos + 1
      sVal = sGetValeur(sExp, iPos)
      If Not bOkValType(sVal, sType, sValNormalis�e, sMsg) Then Exit Function
      sFinal = sFinal & sValNormalis�e
      iPos = iPos + Len(sVal)
      If iPos > Len(sExp) Then
        bTestQuery = True
        Exit Function
      End If
    End If
    
    If Mid(sExp, iPos, 1) = "|" Or Mid(sExp, iPos, 1) = "&" Then
      sFinal = sFinal & Mid(sExp, iPos, 1)
      iPos = iPos + 1
    Else
      sMsg = sprintf(sGetIntlLib("CO097", "Caract�re %1 mal plac�"), Mid(sExp, iPos, 1))
      Exit Function
    End If
  Loop
End Function

' Normalise une expression de query pour le type de champ donn�
Function sNormaliseQuery(ByVal sExp As String, sType As String) As String
  Dim sNormalis� As String, sMsg As String, bOk As Boolean
  bOk = bTestQuery(sExp, sType, sNormalis�, sMsg)
  If Not bOk Then
    MsgBox2i "CO082", sExp, sType, sMsg
    'MsgBox "Erreur interne - �chec � l'appel de bTestQuery dans sNormaliseQuery" & vbCrLf & "sExp: " & sExp & vbCrLf & "sType: " & sType & vbCrLf & "sMsg: " & sMsg, vbCritical, sNomApp
    Stop
  End If
  sNormaliseQuery = sNormalis�
End Function


' Ajoute un espace tous les trois chiffres
' pour les rendre plus lisibles
Public Function sFormateR�sultat(ByVal r) As String
  If VarType(r) = vbNull Then
    sFormateR�sultat = ""
    Exit Function
  End If

  If IsNumeric(r) Then
    sFormateR�sultat = Format(r, "#,###,##0")
  ElseIf IsNumeric(Mid(r, 2)) Then
    sFormateR�sultat = Left(r, 1) & Format(Mid(r, 2), "#,###,##0")
  Else
    'CO098
    If r = "EN COURS" Then
      sFormateR�sultat = sGetIntlLib("CO098", "EN COURS")
    Else
      sFormateR�sultat = r
    End If
  End If
End Function



' Formatage des heures enti�res
Public Function strTime(t As Integer) As String
  strTime = t \ 100 & ":" & Format(t Mod 100, "00")
End Function


'$Intl  Traduire le nom de la langue dans la langue
Public Function sLibell�Langue(ByVal cLangue As String) As String
  Select Case cLangue
    Case "F": sLibell�Langue = "Fran�ais"
    Case "A": sLibell�Langue = "English"
    Case "D": sLibell�Langue = "Deutsch"
    Case "E": sLibell�Langue = "Espagnol"
    Case "I": sLibell�Langue = "Italiano"
    Case "H": sLibell�Langue = "Hollandais"
    Case "P": sLibell�Langue = "Portugais"
    Case Else: sLibell�Langue = "(d�faut)"
  End Select
End Function

