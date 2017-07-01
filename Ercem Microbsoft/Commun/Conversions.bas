Attribute VB_Name = "modConversions"
Attribute VB_Description = "Effectue les contrôles de types de champ, pour la saisie et pour la recherche"
' module modConversions
' Effectue les contrôles de types de champ, pour la saisie et pour la recherche
'  9/01/97 PV Plusieurs lettres permises dans sLettres1
'  3/09/97 PV IsDate accepte des dates comme "12/18/1997" --> corrigé dans IsDateCompacte
' 11/09/97 PV Fin de sLettres1; contrôle du fait que le couple de lettres est prise en charge par le système (/lettresys)
' 10/12/97 PV Contrôle dynamique des dates extrêmes
' 22/12/97 PV Fonction Today; IsJourFérié
' 30/01/98 PV NV… dans VBLib
' 19/04/98 PV Date d'attente, strTime
'  3/06/98 PV sCléProprio
' 02/03/99 PV Logos Silliter It+Be
' 21/00/00 PV dDateMin fixée au 1/1/99 et pas à now-365, trop restricitif
' 11/12/01 FG Traduction du libellé du résultat à l'affichage uniquement

Option Explicit

Private dDateMin As Date
Private dDateMax As Date

Public Const dAttente = #1/1/2019#
Public sAttente As String


' Définit de façon dynamique les bornes extrêmes des dates valides
' Cela n'empêche pas les contrôles plus stricts par ailleurs
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
  If dDate < dDateMin Or dDate >= dDateMax Then EchecAssert dDate, "Seules les dates entre le " & Format(dDateMin, "short date") & " et le " & Format(dDateMax, "short date") & " sont acceptées"
End Sub

Sub EchecAssert(Valeur As Variant, sExpressionAssert As String)
  Dim iRep As Integer
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CO080", "Question 080"), sExpressionAssert, Valeur)
  iRep = MsgBox(sMsg, vbAbortRetryIgnore + vbCritical)
  'iRep = MsgBox("Échec au Assert !" & vbCrLf & vbCrLf & sMsg & vbCrLf & "Valeur: " & Valeur, vbAbortRetryIgnore + vbCritical)
  If iRep = vbIgnore Then Exit Sub
  Stop
End Sub


' Fonctions bOkxxx
' Testent si l'argument est du type requis

' bOkLettres ne vérifie que la syntaxe, mais pas si les lettres sont prises en charge
' par le système distant (c'est le rôle de bOkLettresActuelles)
Function bOkLettres(sLettres As String, sMsg As String) As Boolean
  sLettres = UCase(sLettres)
  bOkLettres = False
  If Len(sLettres) <> 2 Then
    sMsg = sGetIntlLib("CR318", "Lettres incorrectes.|Il doit y avoir exactement deux lettres.")
  ElseIf Left(sLettres, 1) < "@" Or Left(sLettres, 1) > "Z" Or Right(sLettres, 1) < "A" Or Right(sLettres, 1) > "Z" Then
    sMsg = sGetIntlLib("CR319", "Lettres incorrectes.|Il doit y avoir uniquement des lettres entre A et Z. L'espace, les caractères accentués, les chiffres et la ponctuation sont interdits.")
  Else
    bOkLettres = True
  End If
End Function


' Vérifie si les lettres sont correctes et prises en charge par le système informatique distant
Function bOkLettresActuelles(sLettres As String, sMsg As String) As Boolean
  If Not bOkLettres(sLettres, sMsg) Then
    bOkLettresActuelles = False
  Else
    Dim b As Boolean
    b = bOkLettresAssistant(sLettres, "*")    ' On vérifie si les lettres sont prises en charge par le système distant
    If Not b Then sMsg = sprintf(sGetIntlLib("CR320", "Lettres %1 incorrectes.|Ces deux lettres ne sont pas prises en charge sur le système Unix %2."), sLettres, sSystèmeDistant)
    bOkLettresActuelles = b
  End If
End Function


Function bOkDate(ByVal sDate As String) As Boolean
  If dDateMin = 0 Then InitDateMinMax
  Dim dTemp As Date
  dTemp = dDécodeDate(sDate)
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

Function dDécodeDate(ByVal sDate As String) As Date
  If IsDate(sDate) Then
    dDécodeDate = CDate(sDate)
  ElseIf IsDateCompacte(sDate) Then
    dDécodeDate = CDate(Left(sDate, 2) & "/" & Mid(sDate, 3, 2) & "/" & IIf(Len(sDate) > 4, Mid(sDate, 5), Year(Now)))
  Else
    dDécodeDate = #1/1/1900#
  End If
End Function

' Retourne la chaîne, la 1ère lettre en majuscules
Function l1maj(ByVal s As String) As String
  If s = "" Then
    l1maj = ""
  Else
    l1maj = UCase(Left(s, 1)) & Mid(s, 2)
  End If
End Function

Private Function bOkValType(sVal As String, sType As String, sValNormalisée As String, sMsgErr) As Boolean
  bOkValType = False
  Select Case LCase(sType)
    Case "n":
      Dim sTemp As String
      sTemp = Subst(sVal, ".", ",")
      If Not IsNumeric(sTemp) Then
        sMsgErr = sprintf(sGetIntlLib("CO094", "Valeur numérique incorrecte: %1"), sVal)
        Exit Function
      End If
      sValNormalisée = Subst(sVal, ",", ".")
      
    Case "a":
      sValNormalisée = sVal
      
    Case "l":       ' Variante de A, lettres de planning
      Dim sMsgErr2 As String
      If Not bOkLettres(sVal, sMsgErr2) Then
        bOkValType = False
        sMsgErr = sMsgErr2
        Exit Function
      End If
      sValNormalisée = UCase(sVal)
      
    Case "d":
      If Not bOkDate(sVal) Then
        sMsgErr = sprintf(sGetIntlLib("CO095", "Date incorrecte ou hors limites %1 - %2 : %3"), Format(dDateMin, "short date"), Format(dDateMax, "short date"), sVal)
        Exit Function
      End If
      Dim dTemp As Date
      dTemp = dDécodeDate(sVal)
      sValNormalisée = Format(Day(dTemp), "00") & "/" & Format(Month(dTemp), "00") & "/" & Format(Year(dTemp), "0000")
      ' Surtout pas Format(dTemp, "short date") qui tient compte du panneau de config !
      
    Case Else
      ' Message interne
      MsgBox2i "CO081", sType
      'MsgBox "Type de données '" & sType & "' incorrect dans bOkValType", vbCritical, sNomApp
      Stop
  End Select
  bOkValType = True
End Function

' Récupère le prochain champ de valeur dans la chaîne sExp à partir de la position iPos
' La version actuelle simplifiée s'arrête au premier : | & trouvé, mais dans le cas
' des chaînes de caractère, il faudrait gérer \ et "
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
' Vérifie que le critère de recherche sExp est correct pour un champ de type sType
' sType: "n" numérique,  "d" date,  "a" alphanumérique,  "l" lettres
' sFinal: retourne le champ de requête correct pour le démon (séparateur décimal, date…)
' sMsg: message d'erreur si la fonction renvoie faux

Function bTestQuery(ByVal sExp As String, sType As String, sFinal As String, sMsg As String) As Boolean
  Dim iPos As Integer
  Dim bOperateur As Boolean, sOperateur As String
  
  ' On traite tout de suite le cas de la chaîne vide, qui est correct
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
    
    Dim sVal As String, sValNormalisée As String
    sVal = sGetValeur(sExp, iPos)
    If Not bOkValType(sVal, sType, sValNormalisée, sMsg) Then Exit Function
    sFinal = sFinal & sValNormalisée
    iPos = iPos + Len(sVal)
    If iPos > Len(sExp) Then
      bTestQuery = True
      Exit Function
    End If
    
    If Mid(sExp, iPos, 1) = ":" Then
      If bOperateur Then
        sMsg = sprintf(sGetIntlLib("CO096", "L'opérateur de plage de valeurs : est incompatible avec les opérateurs de comparaison %1"), sOperateur)
        Exit Function
      End If
      sFinal = sFinal & Mid(sExp, iPos, 1)
      iPos = iPos + 1
      sVal = sGetValeur(sExp, iPos)
      If Not bOkValType(sVal, sType, sValNormalisée, sMsg) Then Exit Function
      sFinal = sFinal & sValNormalisée
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
      sMsg = sprintf(sGetIntlLib("CO097", "Caractère %1 mal placé"), Mid(sExp, iPos, 1))
      Exit Function
    End If
  Loop
End Function

' Normalise une expression de query pour le type de champ donné
Function sNormaliseQuery(ByVal sExp As String, sType As String) As String
  Dim sNormalisé As String, sMsg As String, bOk As Boolean
  bOk = bTestQuery(sExp, sType, sNormalisé, sMsg)
  If Not bOk Then
    MsgBox2i "CO082", sExp, sType, sMsg
    'MsgBox "Erreur interne - Échec à l'appel de bTestQuery dans sNormaliseQuery" & vbCrLf & "sExp: " & sExp & vbCrLf & "sType: " & sType & vbCrLf & "sMsg: " & sMsg, vbCritical, sNomApp
    Stop
  End If
  sNormaliseQuery = sNormalisé
End Function


' Ajoute un espace tous les trois chiffres
' pour les rendre plus lisibles
Public Function sFormateRésultat(ByVal r) As String
  If VarType(r) = vbNull Then
    sFormateRésultat = ""
    Exit Function
  End If

  If IsNumeric(r) Then
    sFormateRésultat = Format(r, "#,###,##0")
  ElseIf IsNumeric(Mid(r, 2)) Then
    sFormateRésultat = Left(r, 1) & Format(Mid(r, 2), "#,###,##0")
  Else
    'CO098
    If r = "EN COURS" Then
      sFormateRésultat = sGetIntlLib("CO098", "EN COURS")
    Else
      sFormateRésultat = r
    End If
  End If
End Function



' Formatage des heures entières
Public Function strTime(t As Integer) As String
  strTime = t \ 100 & ":" & Format(t Mod 100, "00")
End Function


'$Intl  Traduire le nom de la langue dans la langue
Public Function sLibelléLangue(ByVal cLangue As String) As String
  Select Case cLangue
    Case "F": sLibelléLangue = "Français"
    Case "A": sLibelléLangue = "English"
    Case "D": sLibelléLangue = "Deutsch"
    Case "E": sLibelléLangue = "Espagnol"
    Case "I": sLibelléLangue = "Italiano"
    Case "H": sLibelléLangue = "Hollandais"
    Case "P": sLibelléLangue = "Portugais"
    Case Else: sLibelléLangue = "(défaut)"
  End Select
End Function

