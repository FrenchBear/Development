VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CApplication"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

'--------------------------------------------------
'**** VBA Integration code, begin insert
Public Property Get Application() As CApplication
    Set Application = Me
End Property
'**** VBA Integration code, end insert
'--------------------------------------------------



'--------------------------------------------------
'**** VBA Integration code, begin insert
Public Property Get Name() As String
    Name = frmTest.m_apcInt.ApcHost.HostName
End Property
'**** VBA Integration code, end insert
'--------------------------------------------------



'--------------------------------------------------
'**** VBA Integration code, begin insert
Public Property Get Parent() As CApplication
    Set Parent = Me
End Property
'**** VBA Integration code, end insert
'--------------------------------------------------



'--------------------------------------------------
'**** VBA Integration code, begin insert
Public Property Get VBE() As VBIDE.VBE
    Set VBE = frmTest.m_apcInt.ApcHost.VBE
End Property
'**** VBA Integration code, end insert
'--------------------------------------------------



