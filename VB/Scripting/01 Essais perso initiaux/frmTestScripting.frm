VERSION 5.00
Object = "{0E59F1D2-1FBE-11D0-8FF2-00A0D10038BC}#1.0#0"; "msscript.ocx"
Begin VB.Form frmTestScripting 
   Caption         =   "Tests Scripting"
   ClientHeight    =   3120
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3120
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command5 
      Caption         =   "Word"
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Modules"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Eval"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   1320
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "EvalFunc"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "sc.Run ""NameMe"""
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin MSScriptControlCtl.ScriptControl ScriptControl1 
      Left            =   3960
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
   End
End
Attribute VB_Name = "frmTestScripting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTestScripting
' Essais avec le contrôle ScriptControl
' 28/12/03 PV

Option Explicit

Private Sub Command1_Click()
  ScriptControl1.Run "NameMe"
End Sub

Private Sub Command2_Click()
  EvalFunc
End Sub

Private Sub Command3_Click()
  ScriptControl1.ExecuteStatement "x = 100"
  MsgBox ScriptControl1.Eval("x = 100")  ' True
  MsgBox ScriptControl1.Eval("x = 100/2")  ' False
End Sub

Private Sub Command4_Click()
  Dim modX As Module
  Set modX = ScriptControl1.Modules.Add("myMod")
  Dim strX As String
  strX = "Sub Hello" & vbCrLf & _
  "MsgBox ""Bonjour!""" & vbCrLf & _
  "End Sub"
  
  modX.AddCode strX
  Dim objX As Object
  ' Affecter le CodeObject à la variable, puis
  ' appeler la procédure.
  Set objX = modX.CodeObject
  objX.Hello
End Sub

Private Sub Command5_Click()
  Dim script As String
  script = "Sub TestWord()" & vbCrLf & _
  "dim wd" & vbCrLf & _
  "Set wd = CreateObject(""Word.application"")" & vbCrLf & _
  "wd.Visible = True" & vbCrLf & _
  "wd.Documents.Add" & vbCrLf & _
  "wd.Selection.TypeText (""Il était un petit navire"")" & vbCrLf & _
  "wd.Selection.TypeParagraph" & vbCrLf & _
  "End Sub"
  
  Dim modW As Module
  Set modW = ScriptControl1.Modules.Add("modW")
  modW.AddCode script
  
  Dim omw As Object
  Set omw = modW.CodeObject
  omw.TestWord
End Sub

Private Sub Form_Load()
  Dim strCode As String
  strCode = _
   "Sub NameMe()" & vbCrLf & _
  " Dim strName" & vbCrLf & _
  " strName = InputBox(""Nom?"")" & vbCrLf & _
   " MsgBox ""Votre nom est "" & strName" & vbCrLf & _
  "End Sub"
  ScriptControl1.AddCode strCode
End Sub

Private Sub EvalFunc()
  ' Créer la fonction.
  Dim strFonction As String
  strFonction = _
  "Function ReturnThis(x, y)" & vbCrLf & _
  " ReturnThis = x * y" & vbCrLf & _
  "End Function"
  ' Ajouter le code puis exécuter la fonction.
  ScriptControl1.AddCode strFonction
  MsgBox ScriptControl1.Run("ReturnThis", 3, 25)
End Sub


