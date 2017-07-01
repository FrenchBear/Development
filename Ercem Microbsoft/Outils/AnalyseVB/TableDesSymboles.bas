Attribute VB_Name = "TableDesSymboles"
' Module TableDesSymboles
' Fonctions de gestion de la table des symboles
' 18/02/1998 PV

Option Explicit

Private colSymboles As New Collection
Public sNomProcédureCourante As String    ' Procédure courante

Enum ePortée
  poInconnue          ' Symbole utilisé avant d'être défini
  poLocal
  poModule
  poGlobal
End Enum

Enum eTypeSymbole
  tsInconnu           ' Symbole utilisé avant d'être défini
  tsProcédure         ' Sub, Function ou Property
  tsParamètre
  tsVariable
  tsEtiquette
  tsObjet             ' Objet d'interface
  tsConstante
  tsType
  tsEnum
End Enum

Public Function sPortée(ByVal p As ePortée)
  Select Case p
    Case poInconnue:  sPortée = "???   "
    Case poLocal:     sPortée = "Local "
    Case poModule:    sPortée = "Module"
    Case poGlobal:    sPortée = "Global"
  End Select
End Function

Public Function sTypeSymbole(ByVal t As eTypeSymbole)
  Select Case t
    Case tsInconnu:    sTypeSymbole = "Inconnu  "
    Case tsProcédure:  sTypeSymbole = "Procédure"
    Case tsParamètre:  sTypeSymbole = "Paramètre"
    Case tsVariable:   sTypeSymbole = "Variable "
    Case tsEtiquette:  sTypeSymbole = "Étiquette"
    Case tsObjet:      sTypeSymbole = "Objet    "
    Case tsConstante:  sTypeSymbole = "Constante"
    Case tsType:       sTypeSymbole = "Type     "
    Case tsEnum:       sTypeSymbole = "Enum     "
  End Select
End Function


Public Sub SorTableSymboles(ByVal poPortée As ePortée)
  Print #2, ""
  Print #2, "==============================================="
  Print #2, "Table des symboles " & sPortée(poPortée) & " " & sNomProcédureCourante
  Print #2, ""
  Print #2, "Symbole                   TypeSymb  Portée Type                 U Définition"
  
  ' Eventuellement tri de la table des symboles avant édition
  Dim s As Symbole
  For Each s In colSymboles
    If s.poPortée = poPortée Then
      Print #2, clf(s.sNom, 25); " "; sTypeSymbole(s.tsTypeSymbole); " "; sPortée(s.poPortée); " "; ;
      Print #2, clf(s.sTypeBasic, 20); " "; clf(s.bUtilisé, 1); " ";
      If s.iDefLigne > 0 Then Print #2, s.sDefFichier; ","; s.iDefLigne;
      Print #2, ""
      
      ' Trace dans le feuille d'analyse
      If (poPortée = poLocal Or poPortée = poModule) And Not s.bUtilisé And (s.tsTypeSymbole <> tsParamètre And s.tsTypeSymbole <> tsObjet) Then
        If s.tsTypeSymbole = tsProcédure Then
          Dim p As Integer, bPb As Boolean
          p = InStr(s.sNom, "_")
          If p > 0 Then
            bPb = Not bExisteObjet(Left(s.sNom, p - 1))
          Else
            bPb = True
          End If
          If bPb Then frmAnalyse.AddProblème s.sDefFichier & "(" & s.iDefLigne & "): " & sNomProcédureCourante & ": " & sTypeSymbole(s.tsTypeSymbole) & " " & s.sNom & " inutilisé(e) !"
        Else  ' Variable, constante
          frmAnalyse.AddProblème s.sDefFichier & "(" & s.iDefLigne & "): " & sNomProcédureCourante & ": " & sTypeSymbole(s.tsTypeSymbole) & " " & s.sNom & " inutilisé(e) !"
        End If
      End If
    End If
  Next
  Print #2, "==============================================="
  Print #2, ""
  
  Dim i As Integer
  For i = colSymboles.Count To 1 Step -1
    If colSymboles(i).poPortée = poPortée Then colSymboles.Remove i
  Next
  
  ' Histoire de laisser respirer…
  DoEvents
End Sub

Private Function bExisteObjet(ByVal sNom As String)
  ' Noms spéciaux
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
    ' Définitions
    Case tlProcédure: AnalyseLigneProcédure
    Case tlLabel:     AnalyseLigneLabel
    Case tlDim:       AnalyseLigneDim
    Case tlConst:     AnalyseLigneConst
    Case tlType:      AnalyseLigneType
    Case tlEnum:      AnalyseLigneEnum
    Case tlBegin:     AnalyseLigneBegin
    
    ' Utilisation des étiquettes
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
    
    ' Rien d'associé
    Case tlVersion:
    Case tlAttribute:
    Case tlOption:
    Case tlDef:             ' Defint, …
    Case tlDeclare:
    Case tlPréprocesseur:
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
    
    ' A voir si traitement spécial…
    Case tlConstEnum:
    Case tlChampType:
    
    
    Case Else: Stop
  End Select
  
End Sub


Private Sub AnalyseLigneProcédure()
  Dim i As Integer, iNiv As Integer
  Dim pPortée As ePortée
  Dim sTypeBasic As String
  
  ' On détermine la portée par défaut
  Select Case tfTypeFichier
    Case tfFeuille: pPortée = poModule
    Case tfModule:  pPortée = poGlobal
    Case tfClasse:  pPortée = poGlobal
    Case tfUserControl: pPortée = poGlobal
  End Select
  
  i = 1
  If tToken(i) = "Private" Then pPortée = poModule: i = i + 1
  If tToken(i) = "Public" Then pPortée = poGlobal: i = i + 1
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
  sNomProcédureCourante = tToken(i)
  AjouteSymbole tsProcédure, sNomProcédureCourante, pPortée, sTypeBasic
  
  ' Analyse des paramètres
  i = i + 1   ' Parenthèse ouvrante
  Do
    i = i + 1 ' Paramètre suivant
    
    If tToken(i) = ")" Then Exit Do
    If tToken(i) = "Optional" Then i = i + 1
    If tToken(i) = "ByVal" Then i = i + 1
    If tToken(i) = "ByRef" Then i = i + 1
    If tToken(i) = "ParamArray" Then i = i + 1
    
    AjouteSymbole tsParamètre, tToken(i), poLocal, ""
    
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
    
    If tToken(i) = ")" Then Exit Do ' Dernier paramètre
    ' On progresse en début de boucle
  Loop
End Sub


Private Sub AnalyseLigneLabel()
  Assert iNbToken = 2
  AjouteSymbole tsEtiquette, tToken(2), poLocal, ""
End Sub


Private Sub AjouteSymboleSimple(ByVal tsTypeSymbole As eTypeSymbole, ByVal sNom As String, ByVal poPortée As ePortée, ByVal sTypeBasic As String)
  If isMotClé(sNom) Then Exit Sub
  
  Dim bDéfini As Boolean
  Dim s As Symbole
  bDéfini = False
  For Each s In colSymboles
    If ChEq(s.sNom, sNom) And (poPortée = poInconnue Or s.poPortée = poInconnue Or poPortée = s.poPortée) Then
      bDéfini = True
      Exit For
    End If
  Next
  If Not bDéfini Then
    Set s = New Symbole
    colSymboles.Add s
    
    s.sNom = sNom
    s.bUtilisé = False
  End If
  
  s.tsTypeSymbole = tsTypeSymbole
  s.poPortée = poPortée
  s.sTypeBasic = sTypeBasic
  s.sDefFichier = sNomFichier
  s.iDefLigne = iNuméroLigne
End Sub


' AjouteSymbole fait le découpage sur les .
Private Sub AjouteSymbole(ByVal tsTypeSymbole As eTypeSymbole, ByVal sNom As String, ByVal poPortée As ePortée, ByVal sTypeBasic As String)
  Dim p As Integer
  Do
    p = InStr2(1, sNom, ".")
    If p > 1 Then AjouteSymboleSimple tsTypeSymbole, Left(sNom, p - 1), poPortée, sTypeBasic
    sNom = Mid(sNom, p + 1)
  Loop Until sNom = ""
End Sub


Public Sub UtiliseSymboleSimple(ByVal tsTypeSymbole As eTypeSymbole, ByVal sNom As String)
  If isMotClé(sNom) Then Exit Sub
  
  ' On regarde si le symbole est déjà défini
  Dim s As Symbole
  For Each s In colSymboles
    If ChEq(s.sNom, sNom) Then
      s.bUtilisé = True
      Exit Sub
    End If
  Next
  
  ' Sinon on le définit partiellement
  Set s = New Symbole
  s.tsTypeSymbole = tsTypeSymbole
  s.sNom = sNom
  s.poPortée = poInconnue
  s.sTypeBasic = ""
  s.sDefFichier = ""
  s.iDefLigne = -1
  s.bUtilisé = True
  
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
  Dim poPortée As ePortée
  
  ' On détermine la portée par défaut
  Select Case elEtat
    Case elExterne:
      If tfTypeFichier = tfModule Then
        poPortée = poGlobal
      Else
        poPortée = poModule
      End If
    Case elProcédure:   poPortée = poLocal
    Case Else:          Stop
  End Select
  
  If tToken(1) = "Private" Then
    Assert elEtat = elExterne
    poPortée = poModule
  End If
  
  Dim iTokenNom As Integer, iTokenType As Integer
  Dim iToken As Integer, iNiv As Integer
  iToken = 1
  Do
    iToken = iToken + 1     ' Variable suivante / Saute le dim/global…
    
    ' On ajoutera le symbole quand on connaîtra son type
    iTokenNom = iToken
    iTokenType = -1
    
    iToken = iToken + 1
    If iToken > iNbToken Then Exit Do
    
    ' Progression jusqu'à la virgule ou la fin de ligne
    iNiv = 0
    Do
      If tToken(iToken) = "(" Then
        iNiv = iNiv + 1
      ElseIf tToken(iToken) = ")" Then
        iNiv = iNiv - 1
      ElseIf tToken(iToken) = "As" Then
        If tToken(iToken + 1) = "New" Then    ' Dim … As New …
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
      AjouteSymbole tsVariable, tToken(iTokenNom), poPortée, tToken(iTokenType)
    Else
      AjouteSymbole tsVariable, tToken(iTokenNom), poPortée, ""
    End If
    iTokenNom = -1

    
    If iToken > iNbToken Then Exit Do
    Assert tToken(iToken) = ","
    ' On consomme la virgule en début de boucle
  Loop
  
  If iTokenNom > 0 Then
    If iTokenType > 0 Then
      AjouteSymbole tsVariable, tToken(iTokenNom), poPortée, tToken(iTokenType)
    Else
      AjouteSymbole tsVariable, tToken(iTokenNom), poPortée, ""
    End If
  End If
End Sub


Private Sub AnalyseLigneConst()
  Dim poPortée As ePortée
  Dim iToken As Integer
  
  ' On détermine la portée par défaut
  Select Case elEtat
    Case elExterne:
      If tfTypeFichier = tfModule Then
        poPortée = poGlobal
      Else
        poPortée = poModule
      End If
    Case elProcédure:   poPortée = poLocal
    Case Else:          Stop
  End Select
  
  iToken = 1
  If tToken(1) = "Private" Then
    Assert elEtat = elExterne
    poPortée = poModule
    iToken = iToken + 1
  End If
  If tToken(iToken) = "Public" Or tToken(iToken) = "Global" Then
    Assert elEtat = elExterne
    poPortée = poGlobal
    iToken = iToken + 1
  End If

  Assert tToken(iToken) = "Const"
  
  Dim iTokenNom As Integer, iTokenType As Integer
  Dim iNiv As Integer
  Do
    iToken = iToken + 1     ' Constante suivante / Saute le Const
        
    ' On ajoutera le symbole quand on connaîtra son type
    iTokenNom = iToken
    iTokenType = -1
    
    iToken = iToken + 1
    If iToken > iNbToken Then Exit Do
    
    ' Progression jusqu'à la virgule ou la fin de ligne
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
      AjouteSymbole tsConstante, tToken(iTokenNom), poPortée, tToken(iTokenType)
    Else
      AjouteSymbole tsConstante, tToken(iTokenNom), poPortée, ""
    End If
    iTokenNom = -1
    
    If iToken > iNbToken Then Exit Do
    Assert tToken(iToken) = ","
    ' On consomme la virgule en début de boucle
  Loop
  
  ' Ajout du dernier symbole
  If iTokenNom > 0 Then
    If iTokenType > 0 Then
      AjouteSymbole tsConstante, tToken(iTokenNom), poPortée, tToken(iTokenType)
    Else
      AjouteSymbole tsConstante, tToken(iTokenNom), poPortée, ""
    End If
  End If
End Sub


' Attention, un type n'a pas la même portée par défaut qu'un enum !
Private Sub AnalyseLigneType()
  Dim poPortée As ePortée
  Dim iToken As Integer
  
  ' On détermine la portée par défaut
  If (tfTypeFichier = tfModule) Then
    poPortée = poGlobal
  Else
    poPortée = poModule
  End If
  
  iToken = 1
  If tToken(1) = "Private" Then
    poPortée = poModule
    iToken = iToken + 1
  End If
  If tToken(iToken) = "Public" Then
    poPortée = poGlobal
    iToken = iToken + 1
  End If

  Assert tToken(iToken) = "Type"
  AjouteSymbole tsType, tToken(iToken + 1), poPortée, ""
End Sub


' Attention, un enum n'a pas la même portée par défaut qu'un type !
Private Sub AnalyseLigneEnum()
  Dim poPortée As ePortée
  Dim iToken As Integer
  
  ' On détermine la portée par défaut
  poPortée = poGlobal
  
  iToken = 1
  If tToken(1) = "Private" Then
    poPortée = poModule
    iToken = iToken + 1
  End If
  If tToken(iToken) = "Public" Then
    poPortée = poGlobal
    iToken = iToken + 1
  End If

  Assert tToken(iToken) = "Enum"
  AjouteSymbole tsEnum, tToken(iToken + 1), poPortée, ""
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
  If tToken(iTokenExp + 1) <> "0" Then    ' Syntaxe spéciale on error goto 0
    UtiliseSymbole tsEtiquette, tToken(iTokenExp + 1)
  End If
End Sub

Private Sub AnalyseLigneResume()
  If iNbToken = 1 Then Exit Sub         ' Resume sans n° de ligne
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
    iTokenExp = iTokenExp + 1 ' Cas spécial tête: Object = "{…}#1.2#0"; "COMCTL32.OCX"
  Loop
End Sub


' Progresse sur un groupe d'expressions séparées par une virgule
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
    UtiliseSymbole tsProcédure, tToken(1)
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
  ' Attention, ne gère pas Len= en fin d'open !!!
  iTokenExp = iTokenExp + 1
  Expression
End Sub


Private Function isMotClé(ByVal sNom As String)
  isMotClé = True

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
  isMotClé = False
End Function

