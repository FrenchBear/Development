VERSION 5.00
Begin VB.Form frmTest 
   Caption         =   "Form1"
   ClientHeight    =   4155
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   4155
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnTest5 
      Caption         =   "Test5"
      Height          =   495
      Left            =   300
      TabIndex        =   4
      Top             =   3420
      Width           =   1215
   End
   Begin VB.CommandButton btnTest4 
      Caption         =   "Test4"
      Height          =   495
      Left            =   300
      TabIndex        =   3
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton btnTest3 
      Caption         =   "Test3"
      Height          =   495
      Left            =   300
      TabIndex        =   2
      Top             =   1860
      Width           =   1215
   End
   Begin VB.CommandButton btnTest2 
      Caption         =   "Test2"
      Height          =   495
      Left            =   300
      TabIndex        =   1
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton btnTest1 
      Caption         =   "Test1"
      Height          =   495
      Left            =   300
      TabIndex        =   0
      Top             =   300
      Width           =   1215
   End
   Begin VB.Menu mnuToolsMenuItem 
      Caption         =   "&Tools"
      Begin VB.Menu mnuMacrosMenuItem2 
         Caption         =   "Macro"
         Begin VB.Menu mnuMacrosMenuItem 
            Caption         =   "&Macros                   Alt+F8"
         End
         Begin VB.Menu mnuVbeMenuItem 
            Caption         =   "&Visual Basic Editor  Alt+F11"
         End
      End
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim sScript As String
Dim myScript As ScriptControl

'--------------------------------------------------
'**** VBA Integration code, begin insert
Public m_apcInt As APCIntegration
'**** VBA Integration code, end insert
'--------------------------------------------------


'--------------------------------------------------
'**** VBA Integration code, begin insert
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF11 And Shift = vbAltMask Then m_apcInt.showVBE  '[Alt][F11]
    If KeyCode = vbKeyF8 And Shift = vbAltMask Then m_apcInt.showMacroDialog  '[Alt][F8]
End Sub
'**** VBA Integration code, end insert
'--------------------------------------------------

'--------------------------------------------------
'**** VBA Integration code, begin insert
Private Sub mnuVbeMenuItem_Click()
    ' Show the VBE now
    m_apcInt.showVBE
End Sub
'**** VBA Integration code, end insert
'--------------------------------------------------

'--------------------------------------------------
'**** VBA Integration code, begin insert
Private Sub mnuMacrosMenuItem_Click()
    ' The macros dialog will only be viewable if you have a project loaded
    m_apcInt.showMacroDialog
End Sub
'**** VBA Integration code, end insert
'--------------------------------------------------



'--------------------------------------------------
'**** VBA Integration code, begin insert
Public Sub Form_Load()

'--------------------------------------------------
'**** VBA Integration code, begin insert
    Dim appObj As CApplication

    Set m_apcInt = New APCIntegration
    ' If you already have an existing application object in your
    '  original source, replace "new CApplication" here with a
    '  reference to it.
    Set appObj = New CApplication
    m_apcInt.Initialize appObj, Me.hwnd
'**** VBA Integration code, end insert
'--------------------------------------------------
End Sub
'**** VBA Integration code, end insert
'--------------------------------------------------

'--------------------------------------------------
'**** VBA Integration code, begin insert
Private Sub Form_QueryUnLoad(Cancel As Integer, unloadmode As Integer)
    m_apcInt.QueryUnload Cancel, unloadmode

End Sub '**** VBA Integration code, end insert
'--------------------------------------------------



' Script, create a new object each time
Private Sub btnTest1_Click()
    Dim t As Single, i As Long
    InitFunction1
    t = Timer
    For i = 1 To 10000
        TestFunction1
    Next
    t = Timer - t
    MsgBox "Total time (10 000 exec): " & Format(t, "0.0") & "s", vbInformation, "Test 1: VBS, script object created each time"
End Sub

Sub InitFunction1()
    Open App.Path & "\BM Library.vbs" For Input As #1
    sScript = Input(LOF(1), #1)
    Close #1
End Sub

Sub TestFunction1()
    Dim x As ScriptControl
    Set x = New ScriptControl
    x.Language = "VBScript"
    x.AddCode sScript
    Dim y As Double
    y = x.Run("BMSignificantDigits", 3.1415926, 3)
End Sub



Private Sub btnTest2_Click()
    Dim t As Single, i As Long
    InitFunction2
    t = Timer
    For i = 1 To 100000
        TestFunction2
    Next
    t = Timer - t
    MsgBox "Total time (100 000 exec): " & Format(t, "0.0") & "s", vbInformation, "Test 2: VBS one script object recycled"
End Sub

Sub InitFunction2()
    Open App.Path & "\BM Library.vbs" For Input As #1
    sScript = Input(LOF(1), #1)
    Close #1
    Set myScript = New ScriptControl
    myScript.Language = "VBScript"
    myScript.AddCode sScript
End Sub

Sub TestFunction2()
    Dim y As Double
    y = myScript.Run("BMSignificantDigits", 3.1415926, 3)
End Sub


Private Sub btnTest3_Click()
    Dim t As Single, i As Long
    t = Timer
    For i = 1 To 100000
        TestFunction3
    Next
    t = Timer - t
    MsgBox "Total time (100 000 exec): " & Format(t, "0.0") & "s", vbInformation, "Test 3: VB Compiled"
End Sub

Sub TestFunction3()
    Dim y As Double
    y = BMSignificantDigits(3.1415926, 3)
End Sub





Private Sub btnTest4_Click()
    Dim t As Single, i As Long
    InitFunction4
    t = Timer
    For i = 1 To 100000
        TestFunction4
    Next
    t = Timer - t
    MsgBox "Total time (100 000 exec): " & Format(t, "0.0") & "s", vbInformation, "Test 4: VBA"
End Sub

Sub InitFunction4()
    m_apcInt.ApcProject.Compile
End Sub

Sub TestFunction4()
    Dim y As Double
    y = m_apcInt.ApcProject.Run("Module1", "BMSignificantDigits", 3.1415926, 3)
End Sub



Private Sub btnTest5_Click()
    m_apcInt.ApcProject.Run "Module1", "Test5"
End Sub

