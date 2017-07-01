VERSION 5.00
Object = "{0E59F1D2-1FBE-11D0-8FF2-00A0D10038BC}#1.0#0"; "msscript.ocx"
Begin VB.Form frmLibraySupport 
   Caption         =   "Form1"
   ClientHeight    =   6000
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7185
   LinkTopic       =   "Form1"
   ScaleHeight     =   6000
   ScaleWidth      =   7185
   StartUpPosition =   3  'Windows Default
   Begin MSScriptControlCtl.ScriptControl myScript 
      Left            =   6480
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   300
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton btnProvoque 
      Caption         =   "Provoque"
      Height          =   495
      Left            =   360
      TabIndex        =   3
      Top             =   2580
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   495
      Left            =   2880
      TabIndex        =   2
      Top             =   2580
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   495
      Left            =   2880
      TabIndex        =   1
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   2880
      TabIndex        =   0
      Top             =   840
      Width           =   1215
   End
End
Attribute VB_Name = "frmLibraySupport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Dim myScript As ScriptControl
Public sUserName As String
Dim WithEvents myObject As TestClass
Attribute myObject.VB_VarHelpID = -1

Sub InitializeScript()
 '   If Not myScript Is Nothing Then Exit Sub
    
 '   Set myScript = New ScriptControl
    myScript.Reset
    myScript.Language = "VBScript"
    myScript.AllowUI = True
    
    ' General library load
    Dim sLibrary As String, sLibraryFile As String
    sLibraryFile = App.Path & "\ScriptLibrary.vbs"
    If Dir(sLibraryFile) <> "" Then
        Open sLibraryFile For Input As #1
        sLibrary = Input(LOF(1), #1)
        Close #1
        
        On Error Resume Next
        myScript.Modules("Global").AddCode sLibrary
        If Err Then
            MsgBox "Error while loading ScriptLibrary.vbs, library won't be available." & vbCrLf & "Err " & myScript.Error.Number & ", line " & myScript.Error.Line & ", char " & myScript.Error.Column & ": " & myScript.Error.Description, vbExclamation
            Stop
        End If
    End If
    
    myScript.State = Connected
    
    ' Exposes objects
    myScript.AddObject "Form", Me, True
    myScript.AddObject "MyObject", myObject, True
    myScript.AddObject "Text1", Text1, True
    
    ' Create a separate module for script execution as needed
    myScript.Modules.Add "UserCode"
End Sub

Sub ScriptErr()
    MsgBox "Script execution error." & vbCrLf & "Err " & myScript.Error.Number & ", line " & myScript.Error.Line & ", char " & myScript.Error.Column & ": " & myScript.Error.Description, vbExclamation
End Sub

Sub FormHello()
    MsgBox "FormHello !"
End Sub

Private Sub btnProvoque_Click()
    myObject.ProvoqueEvent
End Sub

Private Sub Command1_Click()
    InitializeScript
    
    Dim sCode As String
    sCode = "x=1" & vbCrLf & _
            "sub main" & vbCrLf & _
            "  msgbox ""hello main, x="" & x" & vbCrLf & _
            "  LibAbout" & vbCrLf & _
            "end sub"
    
    On Error Resume Next
    myScript.Modules("UserCode").AddCode sCode
    If Err Then ScriptErr: Exit Sub
        
    Err.Clear
    myScript.Modules("UserCode").Run "main"
    If Err Then ScriptErr
End Sub

Private Sub Command2_Click()
    InitializeScript
    
    Dim sCode As String
    sCode = "sub toto" & vbCrLf & _
            "  msgbox ""Username: "" & Form.sUserName" & vbCrLf & _
            "  Form.FormHello" & vbCrLf & _
            "end sub"
          
    On Error Resume Next
    myScript.Modules("UserCode").AddCode sCode
    If Err Then ScriptErr: Exit Sub
        
    Err.Clear
    myScript.Modules("UserCode").Run "toto"
    If Err Then ScriptErr
End Sub


Private Sub Command3_Click()
    'InitializeScript
    
    myScript.Reset
    myScript.State = Connected
    
    myScript.AddObject "MyObject", myObject, True
    myScript.AddObject "Text1", Text1, True
    
    Dim sCode As String
    sCode = "sub MyObject_myEvent" & vbCrLf & _
            "  msgbox ""MyObject_myEvent""" & vbCrLf & _
            "end sub" & vbCrLf & _
            "sub Chatouille" & vbCrLf & _
            "  MyObject.ProvoqueEvent" & vbCrLf & _
            "end sub" & vbCrLf

    
    On Error Resume Next
    myScript.AddCode sCode
    If Err Then ScriptErr: Exit Sub
    
    Err.Clear
    myScript.Run "Chatouille"
    If Err Then ScriptErr
End Sub

Private Sub Form_Load()
    sUserName = "FPVI"
    Set myObject = New TestClass
End Sub

'Private Sub myObject_myEvent()
'    MsgBox "$1"
'End Sub
Private Sub Text1_Change()
    Debug.Print "zap" & Rnd
End Sub
