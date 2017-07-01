Attribute VB_Name = "modExplodeForm"
Option Explicit

Sub ExplodeForm(myform As Form, Optional BackWards As Boolean = False, Optional steps As Integer = 120)
If myform.WindowState = vbMaximized Then Exit Sub
Dim X As Integer
    Dim MyLeft, MyTop As Integer
    MyLeft = myform.Left
    MyTop = myform.Top
    Dim MyWidth, MyHeight As Integer
    MyWidth = myform.Width / steps
    MyHeight = myform.Height / steps
If BackWards = False Then
            For X = 1 To steps - 1
        MyLeft = (Screen.Width - myform.Width) / 2
        MyTop = (Screen.Height - myform.Height) / 2
        myform.Move MyLeft, MyTop, myform.Width - MyWidth, myform.Height - MyHeight
    Next X
    Else
    myform.Width = 0
    myform.Height = 0
Dim startWidth As Integer, startHeight As Integer
Dim lostSteps As Integer
startWidth = myform.Width
startHeight = myform.Height
lostSteps = startWidth / steps
'The above values are needed because the
'Width and height won't really go to zero
    For X = 1 + lostSteps To steps - 1
        MyLeft = ((Screen.Width - myform.Width) / 2)
        MyTop = ((Screen.Height - myform.Height) / 2)
        myform.Move MyLeft, MyTop, myform.Width + MyWidth, myform.Height + MyHeight
    myform.Show
    Next X
End If
End Sub


