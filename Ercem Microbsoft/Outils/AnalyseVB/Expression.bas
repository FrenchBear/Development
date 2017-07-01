Attribute VB_Name = "modExpression"
' Expression
' Module analysant une expression
' 23/02/1998 PV


Option Explicit

Public iTokenExp As Integer       ' Token de d�part/courant d'analyse
Private iNiv As Integer           ' Niveau de (

Public Sub Expression()
  Dim bOp�rateurEspace As Boolean
  
  iNiv = 0
  bOp�rateurEspace = False
  If bFinExp Then Exit Sub
  
  Do
    ' Ouverture de parenth�se en op�rateurs unaires
    While tToken(iTokenExp) = "(" Or tToken(iTokenExp) = "-" Or tToken(iTokenExp) = "Not" Or tToken(iTokenExp) = "#"
      If tToken(iTokenExp) = "(" Then iNiv = iNiv + 1
      iTokenExp = iTokenExp + 1
    Wend
    
    If tToken(iTokenExp) = ")" Then GoTo FermetureParenth�se    ' Cas ()
    
    ' Cas particulier des op�rateur sp�ciaux sans parenth�ses
    If tToken(iTokenExp) = "New" _
      Or tToken(iTokenExp) = "AddressOf" _
      Or tToken(iTokenExp) = "TypeOf" Then
      iTokenExp = iTokenExp + 1
    End If
    
    ' Constante ou symbole
AutreSymbole:
    If Not IsNumericUS(tToken(iTokenExp)) And Left(tToken(iTokenExp), 1) <> """" And Left(tToken(iTokenExp), 1) <> "." And Left(tToken(iTokenExp), 1) <> "#" Then
      UtiliseSymbole tsInconnu, tToken(iTokenExp)
    End If
    iTokenExp = iTokenExp + 1
      
FermetureParenth�se:
    While iNiv > 0 And tToken(iTokenExp) = ")"
      iNiv = iNiv - 1
      iTokenExp = iTokenExp + 1
    Wend
    
    If bFinExp Then Exit Do
    
    If tToken(iTokenExp) = "(" Then GoTo Continue           ' Appel de fonction
    If Left(tToken(iTokenExp), 1) = "." Then GoTo Continue  ' Identificateur qualifi�
    
    Select Case tToken(iTokenExp)
      Case "+", "-", "*", "/", "^", "Mod", "\"
      Case ">", ">=", "<", "<=", "=", "<>", "=", "Is", "Like"
      Case "And", "Or", "Eqv", "Imp", "Xor"
      Case ":=", ",", "&"
      Case "To", "Step", "In", "As"   ' Pseudo-op�rateurs pour simplifier l'�valuation
      Case Else:
        If Not bOp�rateurEspace Then  ' cas d'appels complexes, on autorise un "op�rateur espace"
          bOp�rateurEspace = True     ' cra.cGermes(fgGermes.Row).cBo�tes.Remove fgBo�tes.Row
          GoTo AutreSymbole
        Else
          Stop
        End If
    End Select
    iTokenExp = iTokenExp + 1
    
Continue:
  Loop

End Sub


Private Function bFinExp() As Boolean
  bFinExp = True
  
  If iTokenExp > iNbToken Then Exit Function
  If iNiv = 0 And (tToken(iTokenExp) = "," Or tToken(iTokenExp) = ")") Then Exit Function
  Select Case tToken(iTokenExp)
    Case ";":      Exit Function
    Case "For":    Exit Function    ' dans Open
    Case "GoTo":   Exit Function
    Case "GoSub":  Exit Function
    Case "Resume": Exit Function
    Case "Then":   Exit Function
    Case "Else":   Exit Function
  End Select
  
  bFinExp = False
End Function


Private Function IsNumericUS(ByVal s As String)
  Dim p As Integer
  p = InStr(s, ".")
  If p > 0 Then Mid(s, p, 1) = ","
  IsNumericUS = IsNumeric(s)
End Function

