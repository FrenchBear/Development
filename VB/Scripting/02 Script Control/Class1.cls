VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Class1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public Sub pDisplay(sMessage)
'
' This simple method is callable from a script.
'
MsgBox sMessage, vbInformation, "Procedure from Class Module"
End Sub

Private Sub Class_Initialize()
    MsgBox "class1_initialize"
End Sub

Private Sub Class_Terminate()
    MsgBox "class1_terminate"
End Sub
