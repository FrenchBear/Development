VERSION 5.00
Begin VB.Form frmTestProtectData 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmTestProtectData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTestProtectData
' Unit Tests for modProtectData
' 2012-09-24    PV

Option Explicit

Private Sub Form_Load()
    SimpleTest
    ComplexTests
    StringToArrayTests
    ProtectStringTests
    HexStringArrayTests
    SettingsTests

    ' If Units Tests run successfully, app should terminate silently
    ' otherwise it'll break on error or on stop statement
    End
End Sub


Function ByteArrayToHexString(Buff() As Byte) As String
    Dim s As String, i As Integer
    For i = 0 To UBound(Buff)
        s = s & Right(Hex(256 + Buff(i)), 2)
    Next
    ByteArrayToHexString = s
End Function

Function HexStringToByteArray(s As String) As Byte()
    Dim b() As Byte, i As Integer
    ReDim b((Len(s) - 1) \ 2)
    For i = 0 To Len(s) - 1 Step 2
        b(i \ 2) = CByte(Val("&H" + Mid(s, i + 1, 2)))
    Next
    HexStringToByteArray = b
End Function


Sub SettingsTests()
    Dim sPassword As String, i As Integer
    For i = 1 To 1000
        sPassword = RandomString(20)
        SaveSetting "TestApp", "Options", "Password", ByteArrayToHexString(ProtectString(sPassword, "Salt&Pepper"))
        Dim s As String
        s = UnprotectString(HexStringToByteArray(GetSetting("TestApp", "Options", "Password")), "Salt&Pepper")
        If s <> sPassword Then Stop
    Next
End Sub

Sub HexStringArrayTests()
    If ByteArrayToHexString(HexStringToByteArray("CAFE")) <> "CAFE" Then Stop
End Sub




Sub StringToArrayTests()
    Dim s1 As String, s2 As String, i As Integer
    For i = 1 To 1000
        s1 = RandomString(100)
        s2 = ByteArrayToString(StringToByteArray(s1))
        If s1 <> s2 Then Stop
    Next
End Sub


Sub ProtectStringTests()
    ' Simple direct test 1st
    Dim sText As String, sSalt As String, t() As Byte, sText2 As String
    'sText = ChrW(45) & ChrW(431) & ChrW(51966)
    'sSalt = ""
    sText = "C" & ChrW(212) ' C and O circumflex
    sSalt = ""
    t = ProtectString(sText, sSalt)
    sText2 = UnprotectString(t, sSalt)
    If sText2 <> sText Then Stop
    
    
    ' Then a series of random tests
    Dim sClear As String
    Dim sUnprotected As String
    Dim i As Integer
    
    For i = 1 To 1000
        sSalt = ""
        If Rnd > 0.5 Then sSalt = RandomString(1 + 20 * Rnd)
        sClear = RandomString(1 + 200 * Rnd)
        sUnprotected = UnprotectString(ProtectString(sClear, sSalt), sSalt)
        If sClear <> sUnprotected Then Stop
    Next
End Sub


Sub ComplexTests()
    Dim Secret() As Byte
    Dim Protected() As Byte
    Dim Unprotected() As Byte
    
    Dim n As Integer, i As Integer, l As Integer
    
    For l = 1 To 1000
        n = Int(1000 * Rnd + 1)
        ReDim Secret(n)
        For i = 0 To n
            Secret(i) = Int(256 * Rnd)
        Next
        ProtectDataCore VarPtr(Secret(0)), UBound(Secret) + 1, 0&, 0&, Protected
        UnprotectDataCore VarPtr(Protected(0)), UBound(Protected) + 1, 0&, 0&, Unprotected
        
        For i = 0 To n
            If Secret(i) <> Unprotected(i) Then Stop
        Next
    Next
End Sub


Sub SimpleTest()
    Dim BuffIn(8) As Byte
    Dim BuffOut() As Byte
    
    BuffIn(0) = 2
    BuffIn(1) = 3
    BuffIn(2) = 5
    BuffIn(3) = 7
    BuffIn(4) = 11
    BuffIn(5) = 13
    BuffIn(6) = 17
    BuffIn(7) = 19
    BuffIn(8) = 23
    
    Dim Salt(4) As Byte
    Salt(0) = 9
    Salt(1) = 8
    Salt(2) = 7
    Salt(3) = 6
    Salt(4) = 5
    
    Trace "Original", BuffIn
    ProtectDataCore VarPtr(BuffIn(0)), UBound(BuffIn) + 1, VarPtr(Salt(0)), UBound(Salt) + 1, BuffOut
    Trace "Protected", BuffOut
    
    Dim BuffUnprotected() As Byte
    UnprotectDataCore VarPtr(BuffOut(0)), UBound(BuffOut) + 1, VarPtr(Salt(0)), UBound(Salt) + 1, BuffUnprotected
    Trace "Unprotected", BuffUnprotected
End Sub

Private Sub Trace(s As String, b() As Byte)
    Debug.Print s,
    Dim i As Integer
    For i = 0 To UBound(b)
        Debug.Print b(i);
    Next
    Debug.Print
End Sub


Public Function RandomString(l As Integer)
    Dim s As String
    While l > 0
        If Rnd < 0.8 Then
            s = s & Chr(Int(256 * Rnd))
        Else
            s = s & ChrW(Int(65536 * Rnd))
        End If
        l = l - 1
    Wend
    RandomString = s
End Function

