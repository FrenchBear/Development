Attribute VB_Name = "myModule"
Option Explicit

Public Function Cube(ByVal x As Double) As Double
    Cube = x * x * x
End Function

Public Sub ShowForm1()
    UserForm1.Show False
End Sub
