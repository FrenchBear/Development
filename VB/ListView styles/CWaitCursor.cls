VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "CWaitCursor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' ****************************************************************
'  Copyright ©1997, Karl E. Peterson
'  http://www.mvps.org/vb
' ****************************************************************
'  You are free to use this code within your own applications, but you
'  are expressly forbidden from selling or otherwise distributing this
'  source code without prior written consent.
' ****************************************************************
Option Explicit

Private m_nPointer As MousePointerConstants

Public Sub ShowCursor(Optional nPointer As MousePointerConstants = vbHourglass)
   Screen.MousePointer = nPointer
End Sub

Private Sub Class_Initialize()
   m_nPointer = Screen.MousePointer
End Sub

Private Sub Class_Terminate()
   Screen.MousePointer = m_nPointer
End Sub

