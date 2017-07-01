Attribute VB_Name = "TableDesSymboles"
' Module TableDesSymboles
' Fonctions de gestion de la table des symboles
' 18/02/1998 PV

Option Explicit

Private colSymboles As New Collection
Public sNomProc�dureCourante As String    ' Proc�dure courante

Enum ePort�e
  poInconnue          ' Symbole utilis� avant d'�tre d�fini
  poLocal
  poModule
  poGlobal
End Enum

Enum eTypeSymbole
  tsInconnu           ' Symbole utilis� avant d'�tre d�fini
  tsProc�dure         ' Sub, Function ou Property
  tsParam�tre
  tsVariable
  tsEtiquette
  tsObjet             ' Objet d'interface
  tsConstante
  tsType
  tsEnum
End Enum

Public Function sPort�e(ByVal p As ePort�e)
  Select Case p
    Case poInconnue:  sPort�e = "???   "
    Case poLocal:     sPort�e = "Local "
    Case poModule:    sPort�e = "Module"
    Case poGlobal:    sPort�e = "Global"
  End Select
End Function

Public Function sTypeSymbole(ByVal t As eTypeSymbole)
  Select Case t
    Case tsInconnu:    sTypeSymbole = "Inconnu  "
    Case tsProc�dure:  sTypeSymbole = "Proc�dure"
    Case tsParam�tre:  sTypeSymbole = "Param�tre"
    Case tsVariable:   sTypeSymbole = "Variable "
    Case tsEtiquette:  sTypeSymbole = "�tiquette"
    Case tsObjet:      sTypeSymbole = "Objet    "
    Case tsConstante:  sTypeSymbole = "Constante"
    Case tsType:       sTypeSymbole = "Type     "
    Case tsEnum:       sTypeSymbole = "Enum     "
  End Select
End Function


Public Sub SorTableSymboles(ByVal poPort�e As ePort�e)
  Print #2, ""
  Print #2, "==============================================="
  Print #2, "Table des symboles " & sPort�e(poPort�e) & " " & sNomProc�dureCourante
  Print #2, ""
  Print #2, "Symbole                   TypeSymb  Port�e Type                 U D�finition"
  
  ' Eventuellement tri de la table des symboles avant �dition
  Dim s As Symbole
  For Each s In colSymboles
    If s.poPort�e = poPort�e Then
      Print #2, clf(s.sNom, 25); " "; sTypeSymbole(s.tsTypeSymbole); " "; sPort�e(s.poPort�e); " "; ;
      Print #2, clf(s.sTypeBasic, 20); " "; clf(s.bUtilis�, 1); " ";
      If s.iDefLigne > 0 Then Print #2, s.sDefFichier; ","; s.iDefLigne;
      Print #2, ""
      
      ' Trace dans le feuille d'analyse
      If (poPort�e = poLocal Or poPort�e = poModule) And Not s.bUtilis� And (s.tsTypeSymbole <> tsParam�tre And s.tsTypeSymbole <> tsObjet) Then
        If s.tsTypeSymbole = tsProc�dure Then
          Dim p As Integer, bPb As Boolean
          p = InStr(s.sNom, "_")
          If p > 0 Then
            bPb = Not bExisteObjet(Left(s.sNom, p - 1))
          Else
            bPb = True
          End If
          If bPb Then frmAnalyse.AddProbl�me s.sDefFichier & "(" & s.iDefLigne & "): " & sNomProc�dureCourante & ": " & sTypeSymbole(s.tsTypeSymbole) & " " & s.sNom & " inutilis�(e) !"
        Else  ' Variable, constante
          frmAnalyse.AddProbl�me s.sDefFichier & "(" & s.iDefLigne & "): " & sNomProc�dureCourante & ": " & sTypeSymbole(s.tsTypeSymbole) & " " & s.sNom & " inutilis�(e) !"
        End If
      End If
    End If
  Next
  Print #2, "==============================================="
  Print #2, ""
  
  Dim i As Integer
  For i = colSymboles.Count To 1 Step -1
    If colSymboles(i).poPort�e = poPort�e Then colSymboles.Remove i
  Next
  
  ' Histoire de laisser respirer�
  DoEvents
End Sub

Private Function bExisteObjet(ByVal sNom As String)
  ' Noms sp�ciaux
  bExisteObjet = True
  Select Case tfTypeFichier
    Case tfFeuille: If ChEq(sNom, "Form") Or ChEq(sNom, "MDIForm") Then Exit Function
    Case tfClasse: If ChEq(sNom, "Class") Then Exit Function
    Case tfUserControl: If ChEq(sNom, "UserControl") Then Exit Function
  End Select
  
  Dim s As Symbole
  For Each s In colSymboles
    If s.tsTypeSymbole = tsObjet And ChEq(s.sNom, sNom) Then
      Exit Function
    End If
  Next
  bExisteObjet = False
End Function


Public Sub AnalyseSymboles()
  Select Case tlTypeLigne
    ' D�finitions
    Case tlProc�dure: AnalyseLigneProc�dure
    Case tlLabel:     AnalyseLigneLabel
    Case tlDim:       AnalyseLigneDim
    Case tlConst:     AnalyseLigneConst
    Case tlType:      AnalyseLigneType
    Case tlEnum:      AnalyseLigneEnum
    Case tlBegin:     AnalyseLigneBegin
    
    ' Utilisation des �tiquettes
    Case tlGoTo, tlGosub: AnalyseLigneGoTo
    Case tlOn:            AnalyseLigneOn
    Case tlResume:        AnalyseLigneResume
    
    ' Utilisation des symboles
    Case tlAffectation:   AnalyseLigneAffectation
    Case tlCall:          AnalyseLigneCall
    Case tlRedim:         AnalyseLigneRedim
    Case tlWith:          AnalyseLigneWith
    Case tlFor:           AnalyseLigneFor
    Case tlForEach:       AnalyseLigneForEach
    Case tlWhile:         AnalyseLigneWhile
    Case tlDo:            AnalyseLigneDoLoop
    Case tlLoop:          AnalyseLigneDoLoop
    Case tlSelect:        AnalyseLigneSelect
    Case tlCase:          AnalyseLigneCase
    Case tlIf, tlElseIf:  AnalyseLigneIf
    
    Case tlOpen:          AnalyseLigneOpen
    Case tlPrint, tlWrite: AnalyseLignePrint
    Case tlInput:         AnalyseLigneInput
    
    ' Rien d'associ�
    Case tlVersion:
    Case tlAttribute:
    Case tlOption:
    Case tlDef:             ' Defint, �
    Case tlDeclare:
    Case tlPr�processeur:
    Case tlBeginProperty:
    Case tlEndProperty:
    Case tlElse:
    Case tlEnd:
    Case tlEndEnum:
    Case tlEndType:
    Case tlEndIf:
    Case tlEndSelect:
    Case tlEndSub:
    Case tlEndWith:
    Case tlWend:
    Case tlExit:
    Case tlNext:
    Case tlStop:
    Case tlReturn:
    Case tlEOF:
    
    ' A voir si traitement sp�cial�
    Case tlConstEnum:
    Case tlChampType:
    
    
    Case Else: Stop
  End Select
  
End Sub


Private Sub AnalyseLigneProc�dure()
  Dim i As Integer, iNiv As Integer
  Dim pPort�e As ePort�e
  Dim sTypeBasic As String
  
  ' On d�termine la port�e par d�faut
  Select Case tfTypeFichier
    Case tfFeuille: pPort�e = poModule
    Case tfModule:  pPort�e = poGlobal
    Case tfClasse:  pPort�e = poGlobal
    Case tfUserControl: pPort�e = poGlobal
  End Select
  
  i = 1
  If tToken(i) = "Private" Then pPort�e = poModule: i = i + 1
  If tToken(i) = "Public" Then pPort�e = poGlobal: i = i + 1
  If tToken(i) = "Friend" Then i = i + 1
  If tToken(i) = "Static" Then i = i + 1
  
  Select Case tToken(i)
    Case "Sub":       sTypeBasic = "Sub"
    Case "Function":  sTypeBasic = "Function"
    Case "Property":
      i = i + 1
      sTypeBasic = "Property " & tToken(i)
  End Select
  
  i = i + 1
  sNomProc�dureCourante = tToken(i)
  AjouteSymbole tsProc�dure, sNomProc�dureCourante, pPort�e, sTypeBasic
  
  ' Analyse des param�tres
  i = i + 1   ' Parenth�se ouvrante
  Do
    i = i + 1 ' Param�tre suivant
    
    If tToken(i) = ")" Then Exit Do
    If tToken(i) = "Optional" Then i = i + 1
    If tToken(i) = "ByVal" Then i = i + 1
    If tToken(i) = "ByRef" Then i = i + 1
    If tToken(i) = "ParamArray" Then i = i + 1
    
    AjouteSymbole tsParam�tre, tToken(i), poLocal, ""
    
    i = i + 1
    iNiv = 0
    Do
      If tToken(i) = "(" Then
        iNiv = iNiv + 1
      ElseIf tToken(i) = ")" Then
        If iNiv = 0 Then Exit Do
        iNiv = iNiv - 1
      Else
        If iNiv = 0 And tToken(i) = "," Then Exit Do
      End If
      i = i + 1
    Loop
    Assert tToken(i) = "," Or tToken(i) = ")"
    
    If tToken(i) = ")" Then Exit Do ' Dernier param�tre
    ' On progresse en d�but de boucle
  Loop
End Sub


Private Sub AnalyseLigneLabel()
  Assert iNbToken = 2
  AjouteSymbole tsEtiquette, tToken(2), poLocal, ""
End Sub


Private Sub AjouteSymboleSimple(ByVal tsTypeSymbole As eTypeSymbole, ByVal sNom As String, ByVal poPort�e As ePort�e, ByVal sTypeBasic As String)
  If isMotCl�(sNom) Then Exit Sub
  
  Dim bD�fini As Boolean
  Dim s As Symbole
  bD�fini = False
  For Each s In colSymboles
    If ChEq(s.sNom, sNom) And (poPort�e = poInconnue Or s.poPort�e = poInconnue Or poPort�e = s.poPort�e) Then
      bD�fini = True
      Exit For
    End If
  Next
  If Not bD�fini Then
    Set s = New Symbole
    colSymboles.Add s
    
    s.sNom = sNom
    s.bUtilis� = False
  End If
  
  s.tsTypeSymbole = tsTypeSymbole
  s.poPort�e = poPort�e
  s.sTypeBasic = sTypeBasic
  s.sDefFichier = sNomFichier
  s.iDefLigne = iNum�roLigne
End Sub


' AjouteSymbole fait le d�coupage sur les .
Private Sub AjouteSymbole(ByVal tsTypeSymbole As eTypeSymbole, ByVal sNom As String, ByVal poPort�e As ePort�e, ByVal sTypeBasic As String)
  Dim p As Integer
  Do
    p = InStr2(1, sNom, ".")
    If p > 1 Then AjouteSymboleSimple tsTypeSymbole, Left(sNom, p - 1), poPort�e, sTypeBasic
    sNom = Mid(sNom, p + 1)
  Loop Until sNom = ""
End Sub


Public Sub UtiliseSymboleSimple(ByVal tsTypeSymbole As eTypeSymbole, ByVal sNom As String)
  If isMotCl�(sNom) Then Exit Sub
  
  ' On regarde si le symbole est d�j� d�fini
  Dim s As Symbole
  For Each s In colSymboles
    If ChEq(s.sNom, sNom) Then
      s.bUtilis� = True
      Exit Sub
    End If
  Next
  
  ' Sinon on le d�finit partiellement
  Set s = New Symbole
  s.tsTypeSymbole = tsTypeSymbole
  s.sNom = sNom
  s.poPort�e = poInconnue
  s.sTypeBasic = ""
  s.sDefFichier = ""
  s.iDefLigne = -1
  s.bUtilis� = True
  
  colSymboles.Add s
End Sub


Public Sub UtiliseSymbole(ByVal tsTypeSymbole As eTypeSymbole, ByVal sNom As String)
  Dim p As Integer
  Do
    p = InStr2(1, sNom, ".")
    If p > 1 Then UtiliseSymboleSimple tsTypeSymbole, Left(sNom, p - 1)
    sNom = Mid(sNom, p + 1)
  Loop Until sNom = ""
End Sub


Private Sub AnalyseLigneDim()
  Dim poPort�e As ePort�e
  
  ' On d�termine la port�e par d�faut
  Select Case elEtat
    Case elExterne:
      If tfTypeFichier = tfModule Then
        poPort�e = poGlobal
      Else
        poPort�e = poModule
      End If
    Case elProc�dure:   poPort�e = poLocal
    Case Else:          Stop
  End Select
  
  If tToken(1) = "Private" Then
    Assert elEtat = elExterne
    poPort�e = poModule
  End If
  
  Dim iTokenNom As Integer, iTokenType As Integer
  Dim iToken As Integer, iNiv As Integer
  iToken = 1
  Do
    iToken = iToken + 1     ' Variable suivante / Saute le dim/global�
    
    ' On ajoutera le symbole quand on conna�tra son type
    iTokenNom = iToken
    iTokenType = -1
    
    iToken = iToken + 1
    If iToken > iNbToken Then Exit Do
    
    ' Progression jusqu'� la virgule ou la fin de ligne
    iNiv = 0
    Do
      If tToken(iToken) = "(" Then
        iNiv = iNiv + 1
      ElseIf tToken(iToken) = ")" Then
        iNiv = iNiv - 1
      ElseIf tToken(iToken) = "As" Then
        If tToken(iToken + 1) = "New" Then    ' Dim � As New �
          iTokenType = iToken + 2
        Else
          iTokenType = iToken + 1
        End If
      Else
        If iNiv = 0 And tToken(iToken) = "," Then Exit Do
      End If
      iToken = iToken + 1
      If iToken > iNbToken Then Exit Do
    Loop
    
    If iTokenType > 0 Then
      AjouteSymbole tsVariable, tToken(iTokenNom), poPort�e, tToken(iTokenType)
    Else
      AjouteSymbole tsVariable, tToken(iTokenNom), poPort�e, ""
    End If
    iTokenNom = -1

    
    If iToken > iNbToken Then Exit Do
    Assert tToken(iToken) = ","
    ' On consomme la virgule en d�but de boucle
  Loop
  
  If iTokenNom > 0 Then
    If iTokenType > 0 Then
      AjouteSymbole tsVariable, tToken(iTokenNom), poPort�e, tToken(iTokenType)
    Else
      AjouteSymbole tsVariable, tToken(iTokenNom), poPort�e, ""
    End If
  End If
End Sub


Private Sub AnalyseLigneConst()
  Dim poPort�e As ePort�e
  Dim iToken As Integer
  
  ' On d�termine la port�e par d�faut
  Select Case elEtat
    Case elExterne:
      If tfTypeFichier = tfModule Then
        poPort�e = poGlobal
      Else
        poPort�e = poModule
      End If
    Case elProc�dure:   poPort�e = poLocal
    Case Else:          Stop
  End Select
  
  iToken = 1
  If tToken(1) = "Private" Then
    Assert elEtat = elExterne
    poPort�e = poModule
    iToken = iToken + 1
  End If
  If tToken(iToken) = "Public" Or tToken(iToken) = "Global" Then
    Assert elEtat = elExterne
    poPort�e = poGlobal
    iToken = iToken + 1
  End If

  Assert tToken(iToken) = "Const"
  
  Dim iTokenNom As Integer, iTokenType As Integer
  Dim iNiv As Integer
  Do
    iToken = iToken + 1     ' Constante suivante / Saute le Const
        
    ' On ajoutera le symbole quand on conna�tra son type
    iTokenNom = iToken
    iTokenType = -1
    
    iToken = iToken + 1
    If iToken > iNbToken Then Exit Do
    
    ' Progression jusqu'� la virgule ou la fin de ligne
    iNiv = 0
    Do
      If tToken(iToken) = "(" Then
        iNiv = iNiv + 1
      ElseIf tToken(iToken) = ")" Then
        iNiv = iNiv - 1
      ElseIf tToken(iToken) = "As" Then
        iTokenType = iToken + 1
      Else
        If iNiv = 0 And tToken(iToken) = "," Then Exit Do
      End If
      iToken = iToken + 1
      If iToken > iNbToken Then Exit Do
    Loop
    
    If iTokenType > 0 Then
      AjouteSymbole tsConstante, tToken(iTokenNom), poPort�e, tToken(iTokenType)
    Else
      AjouteSymbole tsConstante, tToken(iTokenNom), poPort�e, ""
    End If
    iTokenNom = -1
    
    If iToken > iNbToken Then Exit Do
    Assert tToken(iToken) = ","
    ' On consomme la virgule en d�but de boucle
  Loop
  
  ' Ajout du dernier symbole
  If iTokenNom > 0 Then
    If iTokenType > 0 Then
      AjouteSymbole tsConstante, tToken(iTokenNom), poPort�e, tToken(iTokenType)
    Else
      AjouteSymbole tsConstante, tToken(iTokenNom), poPort�e, ""
    End If
  End If
End Sub


' Attention, un type n'a pas la m�me port�e par d�faut qu'un enum !
Private Sub AnalyseLigneType()
  Dim poPort�e As ePort�e
  Dim iToken As Integer
  
  ' On d�termine la port�e par d�faut
  If (tfTypeFichier = tfModule) Then
    poPort�e = poGlobal
  Else
    poPort�e = poModule
  End If
  
  iToken = 1
  If tToken(1) = "Private" Then
    poPort�e = poModule
    iToken = iToken + 1
  End If
  If tToken(iToken) = "Public" Then
    poPort�e = poGlobal
    iToken = iToken + 1
  End If

  Assert tToken(iToken) = "Type"
  AjouteSymbole tsType, tToken(iToken + 1), poPort�e, ""
End Sub


' Attention, un enum n'a pas la m�me port�e par d�faut qu'un type !
Private Sub AnalyseLigneEnum()
  Dim poPort�e As ePort�e
  Dim iToken As Integer
  
  ' On d�termine la port�e par d�faut
  poPort�e = poGlobal
  
  iToken = 1
  If tToken(1) = "Private" Then
    poPort�e = poModule
    iToken = iToken + 1
  End If
  If tToken(iToken) = "Public" Then
    poPort�e = poGlobal
    iToken = iToken + 1
  End If

  Assert tToken(iToken) = "Enum"
  AjouteSymbole tsEnum, tToken(iToken + 1), poPort�e, ""
End Sub



Private Sub AnalyseLigneBegin()
  If iNbToken = 3 Then
    AjouteSymbole tsObjet, tToken(3), poModule, tToken(2)
  End If
End Sub



Private Sub AnalyseLigneGoTo()
  UtiliseSymbole tsEtiquette, tToken(2)
End Sub

Private Sub AnalyseLigneOn()
  iTokenExp = 2
  Expression
  If tToken(iTokenExp) = "Resume" Then Exit Sub
  Assert tToken(iTokenExp) = "GoTo" Or tToken(iTokenExp) = "GoSub"
  If tToken(iTokenExp + 1) <> "0" Then    ' Syntaxe sp�ciale on error goto 0
    UtiliseSymbole tsEtiquette, tToken(iTokenExp + 1)
  End If
End Sub

Private Sub AnalyseLigneResume()
  If iNbToken = 1 Then Exit Sub         ' Resume sans n� de ligne
  If tToken(2) = "Next" Then Exit Sub
  If tToken(2) = "0" Then Exit Sub
  UtiliseSymbole tsEtiquette, tToken(2)
End Sub




Private Sub AnalyseLigneAffectation()
  iTokenExp = 1
  If tToken(1) = "Let" Or tToken(1) = "Set" Then iTokenExp = iTokenExp + 1
  Do
    Expression
    If iTokenExp > iNbToken Then Exit Do
    iTokenExp = iTokenExp + 1 ' Cas sp�cial t�te: Object = "{�}#1.2#0"; "COMCTL32.OCX"
  Loop
End Sub


' Progresse sur un groupe d'expressions s�par�es par une virgule
Private Sub AnalyseExpressions(ByVal iStart As Integer)
  iTokenExp = iStart
  Do
    Expression
    If iTokenExp > iNbToken Then Exit Do
    Assert tToken(iTokenExp) = "," Or tToken(iTokenExp) = ";"   ' Cas du print
    iTokenExp = iTokenExp + 1
  Loop
End Sub


' Progresse sur une seule expression
Private Sub AnalyseUneExpression(ByVal iStart As Integer)
  iTokenExp = iStart
  Expression
  Assert iTokenExp > iNbToken
End Sub



Private Sub AnalyseLigneCall()
  If tToken(1) = "Call" Then
    AnalyseUneExpression 2
  Else
    UtiliseSymbole tsProc�dure, tToken(1)
    AnalyseExpressions 2
  End If
End Sub

Private Sub AnalyseLigneRedim()
  Dim i As Integer
  i = 2
  If tToken(2) = "Preserve" Then i = 3
  AnalyseExpressions i
End Sub

Private Sub AnalyseLigneWith()
  AnalyseUneExpression 2
End Sub

Private Sub AnalyseLigneFor()
  AnalyseUneExpression 2
End Sub

Private Sub AnalyseLigneForEach()
  AnalyseUneExpression 3
End Sub

Private Sub AnalyseLigneWhile()
  AnalyseUneExpression 2
End Sub

Private Sub AnalyseLigneDoLoop()
  If iNbToken = 1 Then Exit Sub
  Assert tToken(2) = "While" Or tToken(2) = "Until"
  AnalyseUneExpression 3
End Sub

Private Sub AnalyseLigneSelect()
  AnalyseUneExpression 3
End Sub

Private Sub AnalyseLigneCase()
  AnalyseExpressions 2
End Sub

Private Sub AnalyseLigneIf()
  iTokenExp = 2
  Expression
  Assert tToken(iTokenExp) = "Then"
  iTokenExp = iTokenExp + 1
  Assert iTokenExp > iNbToken
End Sub

Private Sub AnalyseLignePrint()
  AnalyseExpressions 2
End Sub


Private Sub AnalyseLigneInput()
  Dim i As Integer
  i = 2
  If tToken(1) = "Line" Then i = 3
  AnalyseExpressions i
End Sub

Private Sub AnalyseLigneOpen()
  iTokenExp = 2
  Expression
  Assert tToken(iTokenExp) = "For"
  Do
    iTokenExp = iTokenExp + 1
    Assert tToken(iTokenExp) <> ""
    If tToken(iTokenExp) = "As" Then Exit Do
  Loop
  ' Attention, ne g�re pas Len= en fin d'open !!!
  iTokenExp = iTokenExp + 1
  Expression
End Sub


Private Function isMotCl�(ByVal sNom As String)
  isMotCl� = True

  Select Case sNom
    Case "To":    Exit Function
    Case "Step":  Exit Function
    Case "Is":    Exit Function
    Case "In":    Exit Function
    Case "As":    Exit Function

    Case "Len":   Exit Function
    Case "Space": Exit Function
    Case "Tab":   Exit Function
    Case "Err":   Exit Function
    Case "Error": Exit Function
    
    Case "Name":  Exit Function
    Case "Kill":  Exit Function
    Case "Open":  Exit Function
    Case "Close": Exit Function
    Case "Reset": Exit Function
    
    Case "Print": Exit Function
    Case "Write": Exit Function
    Case "Input": Exit Function
    
    Case "Now":   Exit Function
    Case "Timer": Exit Function
    Case "Date":  Exit Function
    Case "Time":  Exit Function
    Case "Year":  Exit Function
    Case "Month": Exit Function
    Case "WeekDay": Exit Function
    Case "Day":   Exit Function
    Case "Hour":  Exit Function
    Case "Minute": Exit Function
    Case "Second": Exit Function
    
    Case "Abs":   Exit Function
    Case "Atn":   Exit Function
    Case "Cos":   Exit Function
    Case "Exp":   Exit Function
    Case "Fix":   Exit Function
    Case "Int":   Exit Function
    Case "Log":   Exit Function
    Case "Rnd":   Exit Function
    Case "Sgn":   Exit Function
    Case "Sin":   Exit Function
    Case "Sqr":   Exit Function
    Case "Tan":   Exit Function
    
    Case "CBool": Exit Function
    Case "CByte": Exit Function
    Case "CCur":  Exit Function
    Case "CDate": Exit Function
    Case "CDbl":  Exit Function
    Case "CDec":  Exit Function
    Case "CInt":  Exit Function
    Case "CLng":  Exit Function
    Case "CSng":  Exit Function
    Case "CVar":  Exit Function
    Case "CStr":  Exit Function

    Case "Asc":  Exit Function
    Case "Chr":  Exit Function
    Case "Format":  Exit Function
    Case "Hex":  Exit Function
    Case "Oct":  Exit Function
    Case "Str":  Exit Function
    Case "Val":  Exit Function

    Case "Mid":  Exit Function
    Case "Left":  Exit Function
    Case "Right":  Exit Function
    Case "InStr":  Exit Function
    Case "LCase":  Exit Function
    Case "UCase":  Exit Function

    Case "IsNumeric": Exit Function
    Case "IsArray":  Exit Function
    Case "IsDate":   Exit Function
    Case "IsEmpty":  Exit Function
    Case "IsError":  Exit Function
    Case "IsMissing": Exit Function
    Case "IsNull":   Exit Function
    Case "IsObject": Exit Function
    
    Case "PSet":     Exit Function
    Case "Circle":   Exit Function
    Case "Line":     Exit Function
    
    Case "False":    Exit Function
    Case "True":     Exit Function
    
    Case "Me":       Exit Function
    Case "DoEvents": Exit Function
  
  End Select
  isMotCl� = False
End Function

