Attribute VB_Name = "basExecString"
'------------------------------------------
'   (c) 1999 Trigeminal Software, Inc.  All Rights Reserved
'------------------------------------------
Option Compare Text
Option Explicit

Declare Function EbExecuteLine Lib "vba6.dll" _
 (ByVal pStringToExec As Long, ByVal Foo1 As Long, _
  ByVal Foo2 As Long, ByVal fCheckOnly As Long) As Long

' For VB5 IDE
'Declare Function EbExecuteLine Lib "vba5.dll" _
 (ByVal pStringToExec As Long, ByVal Foo1 As Long, _
  ByVal Foo2 As Long, ByVal fCheckOnly As Long) As Long

' FOR Access 97/VBE.dll clients like Word 97 and Excel 97
'Declare Function EbExecuteLine Lib "vba332.dll" _
 (ByVal pStringToExec As Long, ByVal Foo1 As Long, _
  ByVal Foo2 As Long, ByVal fCheckOnly As Long) As Long

Function FExecuteCode(stCode As String, _
 Optional fCheckOnly As Boolean) As Boolean

    FExecuteCode = EbExecuteLine(StrPtr(stCode), 0&, 0&, Abs(fCheckOnly)) = 0
End Function


Sub main()
    FExecuteCode "Debug.Print ""Hello"""
End Sub
