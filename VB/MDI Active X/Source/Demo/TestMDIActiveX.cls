VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "TestMDIActiveX"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public Sub ShowForm2()
Dim f As Form2
  Set f = New Form2
  f.Show
End Sub

Public Sub ShowForm1()
Dim f As Form1
  Set f = New Form1
  f.Show
End Sub

Public Sub ShowForm3()
Dim f As Form3
  Set f = New Form3
  f.Show
End Sub

