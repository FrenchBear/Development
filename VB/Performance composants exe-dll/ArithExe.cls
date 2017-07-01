VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ArithExe"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Function f0() As Double
  f0 = 2
End Function

Function f1(ByVal x As Double) As Double
  f1 = Sqr(x)
End Function

Function f2(ByRef x As Double) As Double
  f2 = Sqr(x)
End Function


