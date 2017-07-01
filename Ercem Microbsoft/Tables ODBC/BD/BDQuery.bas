Attribute VB_Name = "BDQuery"
' BDQuery
' Module de gestion des requêtes de type Query
' 21/01/1998 PV
' 14/02/1998 PV Protection des " dans les chaînes SQL. Généralisation de BDColType
' 13/08/1998 PV Cas des querys "<10|12" traité correctement, et querys terminés par & ou |
'               Cas IS NULL / IS NOT NULL
'  8/11/1999 PV <>xxx*xxx génère not matches "xxx*xxx" et pas <>"xxx*xxx"
' 12/01/2000 PV Bug dans la modif précédente, <>11 générait "=11" en SQL !!!


Option Explicit

Private dDateMin As Date
Private dDateMax As Date


' Définit de façon arbitraire les bornes extrêmes des dates valides
' Cela n'empêche pas les contrôles plus stricts par ailleurs
Private Sub InitDateMinMax()
  dDateMin = #1/1/1920#
  dDateMax = #12/31/2020#
End Sub

Private Function bOkDate(sDate As String) As Boolean
  If dDateMin = 0 Then InitDateMinMax
  Dim dTemp As Date
  dTemp = dDecodeDate(sDate)
  bOkDate = dTemp >= dDateMin And dTemp < dDateMax
End Function

Private Function IsDateCompacte(sDate As String) As Boolean
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

Public Function dDecodeDate(ByVal sDate As String) As Date
  If IsDate(sDate) Then
    dDecodeDate = CDate(sDate)
  ElseIf IsDateCompacte(sDate) Then
    dDecodeDate = CDate(Left(sDate, 2) & "/" & Mid(sDate, 3, 2) & "/" & IIf(Len(sDate) > 4, Mid(sDate, 5), Year(Now)))
  Else
    dDecodeDate = #1/1/1900#
  End If
End Function

Public Function IsDateSouple(ByVal sDate As String) As Boolean
  'IsDateSouple = dDecodeDate(sDate) <> #1/1/1900#
  IsDateSouple = bOkDate(sDate)
End Function

Public Function bOkValType(sVal As String, iType As BDColType, sValSQL As String, sValNormalisée As String, sMsgErr) As Boolean
  Dim dTemp As Date
  bOkValType = False
  Select Case iType
    Case BDTypeINTEGER, BDTYPESMALLINT, BDTypeDECIMAL:
      Dim sTemp As String
      sTemp = Subst(sVal, ".", ",")
      If Not IsNumeric(sTemp) Then
        sMsgErr = "Valeur numérique incorrecte: " & sVal
        Exit Function
      End If
      sValNormalisée = Subst(sVal, ".", ",")   ' Valeur interne: VB français
      sValSQL = Subst(sVal, ",", ".")
      
    Case BDTypeCHAR:
      sValNormalisée = sVal
      sValSQL = sVal
      Dim p As Integer, p0 As Integer
      p0 = 1
      Do
        p = InStr(p0, sValSQL, Chr(34))
        If p = 0 Then Exit Do
        sValSQL = Left(sValSQL, p - 1) & Chr(34) & Mid(sValSQL, p)
        p0 = p + 2
      Loop
      sValSQL = Chr(34) & sValSQL & Chr(34)
      
    Case BDTypeDATE:
      If Not bOkDate(sVal) Then
        sMsgErr = "Date incorrecte ou hors limites (" & Format(dDateMin, "dd/mm/yyyy") & " - " & Format(dDateMax, "dd/mm/yyyy") & "): " & sVal
        Exit Function
      End If
      dTemp = dDecodeDate(sVal)
      sValNormalisée = Format(dTemp, "yyyy/mm/dd")
      sValSQL = Chr(34) & sValNormalisée & Chr(34)
      
    Case BDTypeTIMESTAMP:
      If Not bOkDate(sVal) Then
        sMsgErr = "Date/Heure incorrecte ou hors limites: " & sVal
        Exit Function
      End If
      dTemp = dDecodeDate(sVal)
      sValNormalisée = Format(dTemp, "yyyy-mm-dd hh:mm:ss")
      sValSQL = Chr(34) & sValNormalisée & Chr(34)
      
    Case Else
      ' Message interne
      MsgBox "Type de données '" & iType & "' incorrect dans bOkValType", vbExclamation, App.Title
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



' bQueryToWP
' Convertit une requête Query (interrogation dans une grille) en where-part
' sColonne: colonne SQL à utiliser pour la conversion
' iType: type de la colonne, énumération de BDColType
' sFinal: retourne le moceau de where-part SQL correct (colonne, séparateur décimal, date…)
' sMsg: message d'erreur si la fonction renvoie faux
Function bQueryToWP(ByVal sColonne As String, ByVal sExp As String, iType As BDColType, sFinal As String, sMsg As String) As Boolean
  Dim iPos As Integer
  Dim bOpérateur As Boolean, sOpérateur As String
  
  Trim sExp   ' On ignore les blancs en tête et en fin
  
  sFinal = ""
  sMsg = ""
  ' On traite tout de suite le cas de la chaîne vide, qui est correct pour cette fonction
  ' Dans ce cas, on retourne une WP vide
  If sExp = "" Then
    bQueryToWP = True
    Exit Function
  End If
  
  bQueryToWP = False
  iPos = 1
  Do
    bOpérateur = False
    sOpérateur = ""
    
    ' Cas particulier = et <> (IS NULL / IS NOT NULL)
    If Mid(sExp, iPos) = "=" Or Mid(sExp, iPos) = "<>" Or Mid(sExp, iPos, 3) = "<>|" Or Mid(sExp, iPos, 3) = "<>&" Or Mid(sExp, iPos, 2) = "=|" Or Mid(sExp, iPos, 2) = "=&" Then
      If Mid(sExp, iPos) = "=" Or Mid(sExp, iPos, 2) = "=|" Or Mid(sExp, iPos, 2) = "=&" Then
        sFinal = sFinal & sColonne & " IS NULL"
        iPos = iPos + 1
      Else
        sFinal = sFinal & sColonne & " IS NOT NULL"
        iPos = iPos + 2
      End If
      If iPos > Len(sExp) Then
        bQueryToWP = True
        Exit Function
      End If
      GoTo FinExpression
    End If
    
    If Mid(sExp, iPos, 2) = ">=" Or Mid(sExp, iPos, 2) = "<=" Or Mid(sExp, iPos, 2) = "<>" Then
      bOpérateur = True
      sOpérateur = Mid(sExp, iPos, 2)
      iPos = iPos + 2
    ElseIf Mid(sExp, iPos, 1) = ">" Or Mid(sExp, iPos, 1) = "<" Or Mid(sExp, iPos, 1) = "=" Then
      bOpérateur = True
      sOpérateur = Mid(sExp, iPos, 1)
      iPos = iPos + 1
    End If
    
    Dim sVal As String, sValSQL As String, sValInterne As String
    sVal = sGetValeur(sExp, iPos)
    If Not bOkValType(sVal, iType, sValSQL, sValInterne, sMsg) Then Exit Function
    'sFinal = sFinal & sValNormalisée
    iPos = iPos + Len(sVal)
    If iPos > Len(sExp) Then
      If sOpérateur = "" Or sOpérateur = "=" Or sOpérateur = "<>" Then
        If InStr(1, sVal, "*") <> 0 Or InStr(1, sVal, "?") <> 0 Then
          If sOpérateur = "" Or sOpérateur = "=" Then
            sOpérateur = " matches "
          Else
            sOpérateur = " not matches "
          End If
        Else
          If sOpérateur = "" Then sOpérateur = "="
        End If
      End If
      bQueryToWP = True
      sFinal = sFinal & sColonne & sOpérateur & sValSQL
      Exit Function
    End If
    
    If Mid(sExp, iPos, 1) = ":" Then    ' Opérateur between
      If bOpérateur Then
        sMsg = "L'opérateur de plage de valeurs : est incompatible avec les opérateurs de comparaison " & sOpérateur
        Exit Function
      End If
      sFinal = sFinal & sColonne & " between " & sValSQL & " and "
      iPos = iPos + 1
      sVal = sGetValeur(sExp, iPos)
      If Not bOkValType(sVal, iType, sValSQL, sValInterne, sMsg) Then Exit Function
      sFinal = sFinal & sValSQL & " "
      iPos = iPos + Len(sVal)
      If iPos > Len(sExp) Then
        bQueryToWP = True
        Exit Function
      End If
    Else
      If sOpérateur = "" Then
        If InStr(1, sVal, "*") <> 0 Or InStr(1, sVal, "?") <> 0 Then
          sOpérateur = " matches "
        Else
          sOpérateur = "="
        End If
      End If
      sFinal = sFinal & sColonne & sOpérateur & sValSQL & " "
    End If
    
FinExpression:
    If Mid(sExp, iPos, 1) = "&" Then
      sFinal = sFinal & " and "
      iPos = iPos + 1
      If iPos > Len(sExp) Then
        sMsg = "L'opérateur & doit être suivi d'une expression"
        Exit Function
      End If
    ElseIf Mid(sExp, iPos, 1) = "|" Then
      sFinal = sFinal & " or "
      iPos = iPos + 1
      If iPos > Len(sExp) Then
        sMsg = "L'opérateur | doit être suivi d'une expression"
        Exit Function
      End If
    Else
      sMsg = "Caractère " & Mid(sExp, iPos, 1) & " mal placé"
      Exit Function
    End If
  Loop
End Function

