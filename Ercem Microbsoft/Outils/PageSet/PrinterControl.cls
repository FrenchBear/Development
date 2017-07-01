VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PrinterControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Private PageDirection As Integer
 
Public Sub ChngOrientationLandscape()
  PageDirection = 2
  Call SetOrientation(DMDUP_SIMPLEX, PageDirection)
End Sub

Public Sub ReSetOrientation()
  If PageDirection = 1 Then
   PageDirection = 2
  Else
   PageDirection = 1
  End If
  Call SetOrientation(DMDUP_SIMPLEX, PageDirection)
End Sub

Public Sub ChngOrientationPortrait()
  PageDirection = 1
  Call SetOrientation(DMDUP_SIMPLEX, 1)
End Sub
