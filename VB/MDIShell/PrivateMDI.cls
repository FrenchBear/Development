VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PrivateMDI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
' This method must be called to enable the control
' This is how we prevent other applications from working
' with this control.
Public Sub Enable()

End Sub

' An example of a common property that you can implement
Public Sub SetUser(ByVal UserName As String)

End Sub

' Method to store the properties of the control into a PropertyBag
Public Sub StoreProperties(P As PropertyBag)

End Sub

' Method to load the properties of the control from a PropertyBag
Public Sub LoadProperties(P As PropertyBag)

End Sub

' Used to obtain a list of menu entries for this control
Public Function GetMenuEntry(Index As Integer) As String

End Function

' Called by the container to indicate that a user clicked a menu
Public Sub MenuClicked(MenuName As String)

End Sub

' Program ID of the control to make embedding easy
Public Function ProgID() As String
End Function

 

