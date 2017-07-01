Attribute VB_Name = "SyntaxeLigne"
' modTypeLigne
' Analyseur VB: reconnaît un type d'instruction VB
' 17/02/98 PV

Option Explicit

Enum eTypeLigne
  tlEOF
  tlVersion
  tlBeginProperty
  tlEndProperty
  tlAttribute
  tlOption
  tlPréprocesseur
  tlDeclare
  tlConst
  tlDef
  tlForEach
  tlFor
  tlNext
  tlExit
  tlIf
  tlElse
  tlElseIf
  tlEndIf
  tlWhile
  tlWend
  tlDo
  tlLoop
  tlSelect
  tlCase
  tlEndSelect
  tlLabel
  tlGoTo
  tlGosub
  tlReturn
  tlOn
  tlResume
  tlWith
  tlEndWith
  tlProcédure
  tlEndSub
  tlEnum
  tlConstEnum
  tlEndEnum
  tlType
  tlEndType
  tlChampType
  tlBegin
  tlEnd
  tlDim
  tlRedim
  tlStop
  tlOpen
  tlInput
  tlPrint
  tlWrite
  tlAffectation
  tlCall
End Enum

Public tlTypeLigne As eEtatLigne


Function sTypeLigne(tl As eTypeLigne) As String
  Select Case tl
    Case tlEOF:             sTypeLigne = "EOF"
    Case tlVersion:         sTypeLigne = "Version"
    Case tlBeginProperty:   sTypeLigne = "BeginProperty"
    Case tlEndProperty:     sTypeLigne = "EndProperty"
    Case tlAttribute:       sTypeLigne = "Attribute"
    Case tlOption:          sTypeLigne = "Option"
    Case tlPréprocesseur:   sTypeLigne = "#"
    Case tlDeclare:         sTypeLigne = "Declare"
    Case tlConst:           sTypeLigne = "Const"
    Case tlDef:             sTypeLigne = "Def"
    Case tlForEach:         sTypeLigne = "ForEach"
    Case tlFor:             sTypeLigne = "For"
    Case tlNext:            sTypeLigne = "Next"
    Case tlExit:            sTypeLigne = "Exit"
    Case tlIf:              sTypeLigne = "If"
    Case tlElse:            sTypeLigne = "Else"
    Case tlElseIf:          sTypeLigne = "ElseIf"
    Case tlEndIf:           sTypeLigne = "EndIf"
    Case tlWhile:           sTypeLigne = "While"
    Case tlWend:            sTypeLigne = "Wend"
    Case tlDo:              sTypeLigne = "Do"
    Case tlLoop:            sTypeLigne = "Loop"
    Case tlSelect:          sTypeLigne = "Select"
    Case tlCase:            sTypeLigne = "Case"
    Case tlEndSelect:       sTypeLigne = "EndSelect"
    Case tlLabel:           sTypeLigne = "Label"
    Case tlGoTo:            sTypeLigne = "GoTo"
    Case tlGosub:           sTypeLigne = "GoSub"
    Case tlReturn:          sTypeLigne = "Return"
    Case tlOn:              sTypeLigne = "On"
    Case tlResume:          sTypeLigne = "Resume"
    Case tlWith:            sTypeLigne = "With"
    Case tlEndWith:         sTypeLigne = "EndWith"
    Case tlProcédure:       sTypeLigne = "Procédure"
    Case tlEndSub:          sTypeLigne = "EndSub"
    Case tlEnum:            sTypeLigne = "Enum"
    Case tlConstEnum:       sTypeLigne = "ConstEnum"
    Case tlEndEnum:         sTypeLigne = "EndEnum"
    Case tlType:            sTypeLigne = "Type"
    Case tlEndType:         sTypeLigne = "EndType"
    Case tlChampType:       sTypeLigne = "ChampType"
    Case tlBegin:           sTypeLigne = "Begin"
    Case tlEnd:             sTypeLigne = "End"
    Case tlDim:             sTypeLigne = "Dim"
    Case tlRedim:           sTypeLigne = "ReDim"
    Case tlStop:            sTypeLigne = "Stop"
    Case tlOpen:            sTypeLigne = "Open"
    Case tlInput:           sTypeLigne = "Input"
    Case tlPrint:           sTypeLigne = "Print"
    Case tlWrite:           sTypeLigne = "Write"
    Case tlAffectation:     sTypeLigne = "="
    Case tlCall:            sTypeLigne = "Call"
    Case Else:              Stop
  End Select
End Function


Sub DétermineTypeLigne()
  If iNbToken = 0 Then tlTypeLigne = tlEOF: Exit Sub
  
  If bTypeVersion Then tlTypeLigne = tlVersion: Exit Sub
  
  If bTypeBeginProperty Then tlTypeLigne = tlBeginProperty: Exit Sub
  If bTypeEndProperty Then tlTypeLigne = tlEndProperty: Exit Sub
  
  If bTypeOption Then tlTypeLigne = tlOption: Exit Sub
  If bTypePréprocesseur Then tlTypeLigne = tlPréprocesseur: Exit Sub
  If bTypeDeclare Then tlTypeLigne = tlDeclare: Exit Sub
  If bTypeConst Then tlTypeLigne = tlConst: Exit Sub
  If bTypeDef Then tlTypeLigne = tlDef: Exit Sub
  
  If bTypeForEach Then tlTypeLigne = tlForEach: Exit Sub
  If bTypeFor Then tlTypeLigne = tlFor: Exit Sub
  If bTypeNext Then tlTypeLigne = tlNext: Exit Sub
  
  If bTypeExit Then tlTypeLigne = tlExit: Exit Sub
  
  If bTypeIf Then tlTypeLigne = tlIf: Exit Sub
  If bTypeElse Then tlTypeLigne = tlElse: Exit Sub
  If bTypeElseIf Then tlTypeLigne = tlElseIf: Exit Sub
  If bTypeEndIf Then tlTypeLigne = tlEndIf: Exit Sub
  
  If bTypeWhile Then tlTypeLigne = tlWhile: Exit Sub
  If bTypeWend Then tlTypeLigne = tlWend: Exit Sub
  If bTypeDo Then tlTypeLigne = tlDo: Exit Sub
  If bTypeLoop Then tlTypeLigne = tlLoop: Exit Sub
  
  If bTypeSelect Then tlTypeLigne = tlSelect: Exit Sub
  If bTypeCase Then tlTypeLigne = tlCase: Exit Sub
  If bTypeEndSelect Then tlTypeLigne = tlEndSelect: Exit Sub
  
  If bTypeLabel Then tlTypeLigne = tlLabel: Exit Sub
  If bTypeGoTo Then tlTypeLigne = tlGoTo: Exit Sub
  If bTypeGoSub Then tlTypeLigne = tlGosub: Exit Sub
  If bTypeReturn Then tlTypeLigne = tlReturn: Exit Sub
  If bTypeOn Then tlTypeLigne = tlOn: Exit Sub
  If bTypeResume Then tlTypeLigne = tlResume: Exit Sub
  
  If bTypeWith Then tlTypeLigne = tlWith: Exit Sub
  If bTypeEndWith Then tlTypeLigne = tlEndWith: Exit Sub
  
  If bTypeProcédure Then tlTypeLigne = tlProcédure: Exit Sub
  If bTypeEndSub Then tlTypeLigne = tlEndSub: Exit Sub
  
  If bTypeEnum Then tlTypeLigne = tlEnum: Exit Sub
  If bTypeEndEnum Then tlTypeLigne = tlEndEnum: Exit Sub
  
  If bTypeType Then tlTypeLigne = tlType: Exit Sub
  If bTypeEndType Then tlTypeLigne = tlEndType: Exit Sub
  If bTypeChampType Then tlTypeLigne = tlChampType: Exit Sub
  
  ' Token Begin / End apairés pour les propriétés
  ' Le End (fin de prog) est converti en tlStop par SyntaxeModule
  If bTypeBegin Then tlTypeLigne = tlBegin: Exit Sub
  If bTypeEnd Then tlTypeLigne = tlEnd: Exit Sub
  
  If bTypeDim Then tlTypeLigne = tlDim: Exit Sub
  If bTypeReDim Then tlTypeLigne = tlRedim: Exit Sub
  
  If bTypeStop Then tlTypeLigne = tlStop: Exit Sub

  If bTypeOpen Then tlTypeLigne = tlOpen: Exit Sub
  If bTypeInput Then tlTypeLigne = tlInput: Exit Sub
  If bTypePrint Then tlTypeLigne = tlPrint: Exit Sub
  If bTypeWrite Then tlTypeLigne = tlWrite: Exit Sub
  
  If bTypeAttribute Then tlTypeLigne = tlAttribute: Exit Sub
  If bTypeAffectation Then tlTypeLigne = tlAffectation: Exit Sub
  
  tlTypeLigne = tlCall
End Sub


Private Function bTypeBeginProperty() As Boolean
  bTypeBeginProperty = False
  If tToken(1) = "BeginProperty" Then bTypeBeginProperty = True
End Function

Private Function bTypeEndProperty() As Boolean
  bTypeEndProperty = False
  If tToken(1) = "EndProperty" Then bTypeEndProperty = True
End Function


Private Function bTypeOption() As Boolean
  bTypeOption = False
  If tToken(1) = "Option" Then bTypeOption = True
End Function

Private Function bTypePréprocesseur() As Boolean
  bTypePréprocesseur = False
  If Left(tToken(1), 1) = "#" Then bTypePréprocesseur = True
End Function

Private Function bTypeDeclare() As Boolean
  bTypeDeclare = False
  If tToken(1) = "Declare" Then bTypeDeclare = True
End Function

Private Function bTypeForEach() As Boolean
  bTypeForEach = False
  If tToken(1) = "For" And tToken(2) = "Each" Then bTypeForEach = True
End Function

Private Function bTypeFor() As Boolean
  bTypeFor = False
  If tToken(1) = "For" Then bTypeFor = True
End Function

Private Function bTypeNext() As Boolean
  bTypeNext = False
  If tToken(1) = "Next" Then bTypeNext = True
End Function

Private Function bTypeIf() As Boolean
  bTypeIf = False
  If tToken(1) = "If" Then bTypeIf = True
End Function

Private Function bTypeElse() As Boolean
  bTypeElse = False
  If tToken(1) = "Else" Then bTypeElse = True
End Function

Private Function bTypeElseIf() As Boolean
  bTypeElseIf = False
  If tToken(1) = "ElseIf" Then bTypeElseIf = True
End Function

Private Function bTypeEndIf() As Boolean
  bTypeEndIf = False
  If tToken(1) = "End" And tToken(2) = "If" Then bTypeEndIf = True
End Function


Private Function bTypeSelect() As Boolean
  bTypeSelect = False
  If tToken(1) = "Select" Then bTypeSelect = True
End Function

Private Function bTypeCase() As Boolean
  bTypeCase = False
  If tToken(1) = "Case" Then bTypeCase = True
End Function

Private Function bTypeEndSelect() As Boolean
  bTypeEndSelect = False
  If tToken(1) = "End" And tToken(2) = "Select" Then bTypeEndSelect = True
End Function


Private Function bTypeWhile() As Boolean
  bTypeWhile = False
  If tToken(1) = "While" Then bTypeWhile = True
End Function

Private Function bTypeWend() As Boolean
  bTypeWend = False
  If tToken(1) = "Wend" Then bTypeWend = True
End Function

Private Function bTypeDo() As Boolean
  bTypeDo = False
  If tToken(1) = "Do" Then bTypeDo = True
End Function

Private Function bTypeLoop() As Boolean
  bTypeLoop = False
  If tToken(1) = "Loop" Then bTypeLoop = True
End Function

Private Function bTypeLabel() As Boolean
  bTypeLabel = False
  If tToken(1) = "_Label" Then bTypeLabel = True
End Function

Private Function bTypeGoTo() As Boolean
  bTypeGoTo = False
  If tToken(1) = "GoTo" Then bTypeGoTo = True
End Function

Private Function bTypeGoSub() As Boolean
  bTypeGoSub = False
  If tToken(1) = "GoSub" Then bTypeGoSub = True
End Function

Private Function bTypeReturn() As Boolean
  bTypeReturn = False
  If tToken(1) = "Return" Then bTypeReturn = True
End Function


Private Function bTypeExit() As Boolean
  bTypeExit = False
  If tToken(1) = "Exit" Then bTypeExit = True
End Function

Private Function bTypeEndSub() As Boolean
  bTypeEndSub = False
  If tToken(1) = "End" And (tToken(2) = "Sub" Or tToken(2) = "Function" Or tToken(2) = "Property") Then
    bTypeEndSub = True
  End If
End Function

Private Function bTypeProcédure() As Boolean
  bTypeProcédure = False
  Dim i As Integer
  i = 1
  If tToken(i) = "Private" Or tToken(i) = "Public" Or tToken(i) = "Friend" Then i = i + 1
  If tToken(i) = "Static" Then i = i + 1
  If tToken(i) = "Function" Or tToken(i) = "Sub" Or tToken(i) = "Property" Then
    bTypeProcédure = True
  End If
End Function

Private Function bTypeDim() As Boolean
  bTypeDim = False
  If tToken(1) = "Dim" Or tToken(1) = "Static" Or tToken(1) = "Private" Or tToken(1) = "Public" Or tToken(1) = "Global" Then
    bTypeDim = True
  End If
End Function

Private Function bTypeReDim() As Boolean
  bTypeReDim = False
  If tToken(1) = "ReDim" Then bTypeReDim = True
End Function


Private Function bTypeConst() As Boolean
  bTypeConst = False
  Dim i As Integer
  i = 1
  If tToken(i) = "Private" Or tToken(i) = "Public" Or tToken(i) = "Global" Then i = i + 1
  If tToken(i) = "Const" Then
    bTypeConst = True
  End If
End Function

Private Function bTypeEnum() As Boolean
  bTypeEnum = False
  Dim i As Integer
  i = 1
  If tToken(i) = "Private" Or tToken(i) = "Public" Then i = i + 1
  If tToken(i) = "Enum" Then
    bTypeEnum = True
  End If
End Function

Private Function bTypeEndEnum() As Boolean
  bTypeEndEnum = False
  If tToken(1) = "End" And tToken(2) = "Enum" Then bTypeEndEnum = True
End Function


Private Function bTypeType() As Boolean
  bTypeType = False
  Dim i As Integer
  i = 1
  If tToken(i) = "Private" Or tToken(i) = "Public" Then i = i + 1
  If tToken(i) = "Type" Then
    bTypeType = True
  End If
End Function

Private Function bTypeEndType() As Boolean
  bTypeEndType = False
  If tToken(1) = "End" And tToken(2) = "Type" Then bTypeEndType = True
End Function


Private Function bTypeChampType() As Boolean
  bTypeChampType = False
  Dim i As Integer, iNiv As Integer
  i = 2
  iNiv = 0
  Do While i < iNbToken
    If tToken(i) = "(" Then
      iNiv = iNiv + 1
    ElseIf tToken(i) = ")" Then
      iNiv = iNiv - 1
    Else
      If iNiv = 0 Then Exit Do
    End If
    i = i + 1
  Loop
  If tToken(i) = "As" Then bTypeChampType = True
End Function


Private Function bTypeDef() As Boolean
  bTypeDef = False
  If tToken(1) = "DefBool" Or tToken(1) = "DefByte" Or tToken(1) = "DefInt" Or _
  tToken(1) = "DefLng" Or tToken(1) = "DefCur" Or tToken(1) = "DefSng" Or _
  tToken(1) = "DefDbl" Or tToken(1) = "DefDec" Or tToken(1) = "DefDate" Or _
  tToken(1) = "DefStr" Or tToken(1) = "DefObj" Or tToken(1) = "DefVar" Then
    bTypeDef = True
  End If
End Function

' On Error, On .. GoTo, On .. GoSub
Private Function bTypeOn() As Boolean
  bTypeOn = False
  If tToken(1) = "On" Then bTypeOn = True
End Function

Private Function bTypeResume() As Boolean
  bTypeResume = False
  If tToken(1) = "Resume" Then bTypeResume = True
End Function


Private Function bTypeWith() As Boolean
  bTypeWith = False
  If tToken(1) = "With" Then bTypeWith = True
End Function

Private Function bTypeEndWith() As Boolean
  bTypeEndWith = False
  If tToken(1) = "End" And tToken(2) = "With" Then bTypeEndWith = True
End Function


Private Function bTypeAttribute() As Boolean
  bTypeAttribute = False
  If tToken(1) = "Attribute" Then bTypeAttribute = True
End Function


Private Function bTypeAffectation() As Boolean
  bTypeAffectation = False
  Dim i As Integer, iNiv As Integer
  i = 1
  If tToken(1) = "Let" Or tToken(1) = "Set" Then i = 2
  
  If tToken(i + 1) = "=" Then
    bTypeAffectation = True
  ElseIf tToken(i + 1) = "(" Then
    i = i + 2
    iNiv = 1
    Do While i < iNbToken
      If tToken(i) = "(" Then
        iNiv = iNiv + 1
      ElseIf tToken(i) = ")" Then
        iNiv = iNiv - 1
      Else
        If iNiv = 0 And Left(tToken(i), 1) <> "." And Left(tToken(i), 1) <> "!" Then Exit Do
      End If
      i = i + 1
    Loop
    If tToken(i) = "=" Then bTypeAffectation = True
  End If
End Function

' Attention, begin est écrit Begin ou BEGIN
Private Function bTypeBegin() As Boolean
  bTypeBegin = False
  If LCase(tToken(1)) = "begin" Then bTypeBegin = True
End Function

' Idem pour end
' SyntaxeModule transforme le end (fin du programme) en tlStop
Private Function bTypeEnd() As Boolean
  bTypeEnd = False
  If LCase(tToken(1)) = "end" Then bTypeEnd = True
End Function

Private Function bTypeVersion() As Boolean
  bTypeVersion = False
  If tToken(1) = "VERSION" Then bTypeVersion = True
End Function


Private Function bTypeStop() As Boolean
  bTypeStop = False
  If tToken(1) = "Stop" Then bTypeStop = True
End Function

Private Function bTypeOpen() As Boolean
  bTypeOpen = False
  If tToken(1) = "Open" Then bTypeOpen = True
End Function

Private Function bTypeInput() As Boolean
  bTypeInput = False
  Dim i As Integer
  i = 1
  If tToken(1) = "Line" Then i = 2
  If tToken(i) = "Input" Then bTypeInput = True
End Function

Private Function bTypePrint() As Boolean
  bTypePrint = False
  If tToken(1) = "Print" Then bTypePrint = True
End Function

Private Function bTypeWrite() As Boolean
  bTypeWrite = False
  If tToken(1) = "Write" Then bTypeWrite = True
End Function

