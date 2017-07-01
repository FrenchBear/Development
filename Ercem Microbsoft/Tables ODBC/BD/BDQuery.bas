Attribute VB_Name = "BDQuery"
' BDQuery
' Module de gestion des requ�tes de type Query
' 21/01/1998 PV
' 14/02/1998 PV Protection des " dans les cha�nes SQL. G�n�ralisation de BDColType
' 13/08/1998 PV Cas des querys "<10|12" trait� correctement, et querys termin�s par & ou |
'               Cas IS NULL / IS NOT NULL
'  8/11/1999 PV <>xxx*xxx g�n�re not matches "xxx*xxx" et pas <>"xxx*xxx"
' 12/01/2000 PV Bug dans la modif pr�c�dente, <>11 g�n�rait "=11" en SQL !!!


Option Explicit

Private dDateMin As Date
Private dDateMax As Date


' D�finit de fa�on arbitraire les bornes extr�mes des dates valides
' Cela n'emp�che pas les contr�les plus stricts par ailleurs
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

Public Function bOkValType(sVal As String, iType As BDColType, sValSQL As String, sValNormalis�e As String, sMsgErr) As Boolean
  Dim dTemp As Date
  bOkValType = False
  Select Case iType
    Case BDTypeINTEGER, BDTYPESMALLINT, BDTypeDECIMAL:
      Dim sTemp As String
      sTemp = Subst(sVal, ".", ",")
      If Not IsNumeric(sTemp) Then
        sMsgErr = "Valeur num�rique incorrecte: " & sVal
        Exit Function
      End If
      sValNormalis�e = Subst(sVal, ".", ",")   ' Valeur interne: VB fran�ais
      sValSQL = Subst(sVal, ",", ".")
      
    Case BDTypeCHAR:
      sValNormalis�e = sVal
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
      sValNormalis�e = Format(dTemp, "yyyy/mm/dd")
      sValSQL = Chr(34) & sValNormalis�e & Chr(34)
      
    Case BDTypeTIMESTAMP:
      If Not bOkDate(sVal) Then
        sMsgErr = "Date/Heure incorrecte ou hors limites: " & sVal
        Exit Function
      End If
      dTemp = dDecodeDate(sVal)
      sValNormalis�e = Format(dTemp, "yyyy-mm-dd hh:mm:ss")
      sValSQL = Chr(34) & sValNormalis�e & Chr(34)
      
    Case Else
      ' Message interne
      MsgBox "Type de donn�es '" & iType & "' incorrect dans bOkValType", vbExclamation, App.Title
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



' bQueryToWP
' Convertit une requ�te Query (interrogation dans une grille) en where-part
' sColonne: colonne SQL � utiliser pour la conversion
' iType: type de la colonne, �num�ration de BDColType
' sFinal: retourne le moceau de where-part SQL correct (colonne, s�parateur d�cimal, date�)
' sMsg: message d'erreur si la fonction renvoie faux
Function bQueryToWP(ByVal sColonne As String, ByVal sExp As String, iType As BDColType, sFinal As String, sMsg As String) As Boolean
  Dim iPos As Integer
  Dim bOp�rateur As Boolean, sOp�rateur As String
  
  Trim sExp   ' On ignore les blancs en t�te et en fin
  
  sFinal = ""
  sMsg = ""
  ' On traite tout de suite le cas de la cha�ne vide, qui est correct pour cette fonction
  ' Dans ce cas, on retourne une WP vide
  If sExp = "" Then
    bQueryToWP = True
    Exit Function
  End If
  
  bQueryToWP = False
  iPos = 1
  Do
    bOp�rateur = False
    sOp�rateur = ""
    
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
      bOp�rateur = True
      sOp�rateur = Mid(sExp, iPos, 2)
      iPos = iPos + 2
    ElseIf Mid(sExp, iPos, 1) = ">" Or Mid(sExp, iPos, 1) = "<" Or Mid(sExp, iPos, 1) = "=" Then
      bOp�rateur = True
      sOp�rateur = Mid(sExp, iPos, 1)
      iPos = iPos + 1
    End If
    
    Dim sVal As String, sValSQL As String, sValInterne As String
    sVal = sGetValeur(sExp, iPos)
    If Not bOkValType(sVal, iType, sValSQL, sValInterne, sMsg) Then Exit Function
    'sFinal = sFinal & sValNormalis�e
    iPos = iPos + Len(sVal)
    If iPos > Len(sExp) Then
      If sOp�rateur = "" Or sOp�rateur = "=" Or sOp�rateur = "<>" Then
        If InStr(1, sVal, "*") <> 0 Or InStr(1, sVal, "?") <> 0 Then
          If sOp�rateur = "" Or sOp�rateur = "=" Then
            sOp�rateur = " matches "
          Else
            sOp�rateur = " not matches "
          End If
        Else
          If sOp�rateur = "" Then sOp�rateur = "="
        End If
      End If
      bQueryToWP = True
      sFinal = sFinal & sColonne & sOp�rateur & sValSQL
      Exit Function
    End If
    
    If Mid(sExp, iPos, 1) = ":" Then    ' Op�rateur between
      If bOp�rateur Then
        sMsg = "L'op�rateur de plage de valeurs : est incompatible avec les op�rateurs de comparaison " & sOp�rateur
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
      If sOp�rateur = "" Then
        If InStr(1, sVal, "*") <> 0 Or InStr(1, sVal, "?") <> 0 Then
          sOp�rateur = " matches "
        Else
          sOp�rateur = "="
        End If
      End If
      sFinal = sFinal & sColonne & sOp�rateur & sValSQL & " "
    End If
    
FinExpression:
    If Mid(sExp, iPos, 1) = "&" Then
      sFinal = sFinal & " and "
      iPos = iPos + 1
      If iPos > Len(sExp) Then
        sMsg = "L'op�rateur & doit �tre suivi d'une expression"
        Exit Function
      End If
    ElseIf Mid(sExp, iPos, 1) = "|" Then
      sFinal = sFinal & " or "
      iPos = iPos + 1
      If iPos > Len(sExp) Then
        sMsg = "L'op�rateur | doit �tre suivi d'une expression"
        Exit Function
      End If
    Else
      sMsg = "Caract�re " & Mid(sExp, iPos, 1) & " mal plac�"
      Exit Function
    End If
  Loop
End Function

