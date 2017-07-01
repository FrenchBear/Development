VERSION 5.00
Begin VB.Form frmTest 
   Caption         =   "Feuille de test"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   Icon            =   "frmTest.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin AnalyseVB.ctlTest ctlTest1 
      Height          =   795
      Left            =   2760
      TabIndex        =   4
      Top             =   1680
      Width           =   1155
      _ExtentX        =   2037
      _ExtentY        =   1402
   End
   Begin VB.Frame fraFrame 
      Caption         =   "Frame1"
      Height          =   1395
      Left            =   240
      TabIndex        =   1
      Top             =   540
      Width           =   1935
      Begin VB.OptionButton Option2 
         Caption         =   "Option2"
         Height          =   315
         Left            =   180
         TabIndex        =   3
         Top             =   720
         Width           =   1035
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Option1"
         Height          =   255
         Left            =   180
         TabIndex        =   2
         Top             =   360
         Width           =   1155
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Ok"
      Height          =   495
      Left            =   2580
      TabIndex        =   0
      Top             =   660
      Width           =   1215
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTest
' Feuille de test pour l'analyseur VB
' 15/02/1998 PV

Option Explicit

DefBool A
DefByte B
DefInt C
DefLng D
DefCur E
DefSng F
DefDbl G
'DefDec h
DefDate I
DefStr J
DefObj K
DefVar L

#If whin32 Then
Declare Function GetKeyState% Lib "user32" (ByVal nVirtKey%)
Private Const VK_TAB = 9
#End If

Const k1 = 1
Const k2 As String = "Hello"
Private Const k3 = k1

Private b4 As Integer
Public b5 As String

Enum e1
  e1a = ctlK1
  e2b = tstK1
End Enum

Private Type t1
  a As Integer
  b As Boolean
  c As String
  d(1 To 3) As Date
  e As e1
  f(1, 2 To 3) As Variant
End Type

Public Enum eTest
  tstK4 = 3
End Enum

Private Sub RechercheEtablissement()
End Sub


Sub Test()
  Dim a As Integer: Dim b _
    As _
    Single
  b = a + frmTest.b5
  b = -a
  b = -Sin(45)
etiquette: sub1: sub2 b:=b
  sub1
  Call sub1
  
  Dim KeyCode As Integer, Shift As Integer
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheEtablissement
  
  Open "toto" For Input As #1
  Open "ti" & b For Append Access Write As #Len(b)
  
  Name "toto" As "ti" & "ti"
  Line (10, 20)-(30, 40), , B
  Line -(30, 40), , BF
  Line -Step(30, 40), RGB(0, 0, 0)
  Line Step(10, 20)-Step(30, 40)
  Circle (10, 20), 30
  Circle Step(40, 50), 60
  PSet (10, 20), 30
  PSet Step(10, 20), 30
  b = frmTest.Point(10, 20)
  b = 0.2
End Sub

Function aa()
  Dim a As Variant, b, c(), d(2, 2) As t1
  Const kpi = 3.14
  For Each a In c()
  Next
  With d(0, 0)
    For a = 1 To 10
      If a = 5 Then
        Exit For
      End If
    Next
    .d(1) = Now
  End With
  If a = 0 Then
    b = 0
  ElseIf b = 0 Then
    a = 0
  Else
    b = 1
  End If
  While a > 0
    a = a - 1
  Wend
  Do
    If a <= 0 Then
      Exit Do
    End If
    a = a - 1
  Loop
  Do Until a < 0
    a = a - 1
  Loop
  Do While a < 10
    a = a + 1
  Loop
début:
  Do
    a = a - 1
  Loop While a > 0
  Do
    a = a + 1
  Loop Until a > 10
  GoTo suite
suite:
  GoSub sousprog
  
  ReDim c(3)
  Static b2
  
  Print #a, 10
  Close #b
  
  a = b + b - b * b / b ^ b Mod b \ b
  a = b > b >= b < b <= b = b <> b = b
  a = b And b Or b Eqv b Imp b Xor b
  a = b & b Like "a*a"
  a = Abs(Atn(Cos(Exp(Fix(Int(Log(Rnd(Sgn(Sin(Sqr(Tan(b))))))))))))
  
  
  sub2 0, AddressOf AnalyseFichier
  If TypeOf a Is Object  Then GoTo 400 Else GoTo 410
400
  If True Then GoTo 300
410
  GoSub 310
  Resume 300
  On Error GoTo 310
  On a GoTo 300, 310
  On b GoSub 300, 310
  GoTo début
  End
  
300:
  Select Case a
    Case 1
      a = 0
    Case 2 + 1, 3: b = 0
    Case Is >= 0
      a = 1
    Case Else
      a = b
  End Select
  
  If a > 0 Then a = 0 Else b = 1
  
  Dim x, y, z, t, u
  If x > 0 Then If y > 0 Then z = 0 Else t = 0 Else u = 0
  
310 a = 1
311 Print a                ' Ligne trois cent onze

  Let b2 = k1
  c(3) = b2
  c(c(3)) = b2
  sub2 ((a + 1) = 0), b = 1
  c(a, b) = 1
  d(1, 2).d(2) = #2/17/98#
  Dim sDate As String
  sDate = Format(#2/26/97 8:25:00 AM#, "dd/mm/yyyy hh:mm:ss")
  
  Open "c:\autoexec.bat" For Input As #1
  Input #1, a
  Line Input #2, a
  Print "Hello"
  Print #1, "Suite"
  Write #1, "Et fin", 2
  Close #1
  
  On Error GoTo Problème
  On Error Resume Next
  On Error GoTo 0
  
  Exit Function
sousprog:
  Return
  
Problème:
  Resume
  Resume Next
  Resume 300
  Resume sousprog
End Function

Sub sub1()
12:
End Sub

Function sub2(ByVal b As Single, Optional c As Variant) As Integer: End Function

Sub s1(): End Sub
Private Sub s2(): End Sub
Public Sub s3(): End Sub
Friend Sub s4(): End Sub
Static Sub s5(): End Sub
Private Static Sub s6(): End Sub
Public Static Sub s7(): s6: End Sub
Friend Static Sub s8(): End Sub

Property Get p() As Integer
  p = 2
End Property

Private Sub Commande1_Click()
  MsgBox "Ok"
End Sub

Private Sub Command1_Click()
  MsgBox "Ok"
End Sub

Private Sub Form_Load(): Show: End Sub
