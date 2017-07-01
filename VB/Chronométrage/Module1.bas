Attribute VB_Name = "Module1"
Option Explicit

#If Win32 Then
  Declare Function GetTickCount Lib "kernel32" () As Long
#Else
  Declare Function GetTickCount Lib "User" () As Long
#End If


Public Sub ForEach()
  Dim MyArrayS(1 To 3000) As String
  Dim MyArrayI(1 To 3000) As Integer
  Dim MyArrayO(1 To 3000) As Object
  Dim MyArrayV(1 To 3000) As Variant
  Dim obj As Object
  Dim j As Integer, i As Integer
  Dim CurrElement, TheName, v
  Dim Date1 As Long, Date2 As Long, Date3 As Long
  Dim MyInt As New Collection
  Dim MyClasses As New Collection
  Dim a As Variant

  Date1 = GetTickCount()
  For i = 1 To 3000
     MyArrayS(i) = "dummy"
  Next
  Date2 = GetTickCount()
  For Each CurrElement In MyArrayS
     CurrElement = "dummy"
  Next
  Date3 = GetTickCount()
  Form1.Print "For i on String Array    " & CStr(Date2 - Date1)
  Form1.Print "For Each on String Array " & CStr(Date3 - Date2)

  Date1 = GetTickCount()
  For i = 1 To 3000
     MyArrayI(i) = 1
  Next
  Date2 = GetTickCount()
  For Each CurrElement In MyArrayI
     CurrElement = 1
  Next
  Date3 = GetTickCount()
  Form1.Print "For i on Integer Array    " & CStr(Date2 - Date1)
  Form1.Print "For Each on Integer Array " & CStr(Date3 - Date2)

  Date1 = GetTickCount()
  For i = 1 To 3000
     Set MyArrayO(i) = obj
  Next
  Date2 = GetTickCount()
  For Each CurrElement In MyArrayO
     Set CurrElement = obj
  Next
  Date3 = GetTickCount()
  Form1.Print "For i on Object Array    " & CStr(Date2 - Date1)
  Form1.Print "For Each on Object Array " & CStr(Date3 - Date2)

  Date1 = GetTickCount()
  For i = 1 To 3000
     MyArrayV(i) = v
  Next
  Date2 = GetTickCount()
  For Each CurrElement In MyArrayV
     CurrElement = v
  Next
  Date3 = GetTickCount()
  Form1.Print "For i on Variant Array    " & CStr(Date2 - Date1)
  Form1.Print "For Each on Variant Array " & CStr(Date3 - Date2)

  For i = 1 To 500
     MyInt.Add Item:=j, Key:=CStr(i)
  Next
  Date1 = GetTickCount()
  For i = 1 To 500
     j = MyInt.Item(i)
  Next
  Date2 = GetTickCount()
  For Each CurrElement In MyInt
     j = CurrElement
  Next
  Date3 = GetTickCount()

  Form1.Print "For i on Integer Collection    " & CStr(Date2 - Date1)
  Form1.Print "For Each on Integer Collection " & CStr(Date3 - Date2)

  For i = 1 To 500
     Dim Inst As New Class1
     TheName = "Mike" & CStr(i)
     Inst.InstanceName = TheName
     MyClasses.Add Item:=Inst, Key:=CStr(i)
     Set Inst = Nothing
  Next
  Date1 = GetTickCount()
  For i = 1 To 500
     Set a = MyClasses.Item(i)
  Next
  Date2 = GetTickCount()
  For Each CurrElement In MyClasses
     Set a = CurrElement
  Next
  Date3 = GetTickCount()

  Form1.Print "For i on Object Collection    " & CStr(Date2 - Date1)
  Form1.Print "For Each on Object Collection " & CStr(Date3 - Date2)
End Sub


