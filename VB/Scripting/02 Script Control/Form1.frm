VERSION 5.00
Object = "{0E59F1D2-1FBE-11D0-8FF2-00A0D10038BC}#1.0#0"; "msscript.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Using the Script Control"
   ClientHeight    =   5085
   ClientLeft      =   5700
   ClientTop       =   2115
   ClientWidth     =   4215
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5085
   ScaleWidth      =   4215
   StartUpPosition =   2  'CenterScreen
   Begin MSScriptControlCtl.ScriptControl scScript 
      Left            =   60
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      AllowUI         =   0   'False
   End
   Begin VB.Frame Frame2 
      Caption         =   "Work With Script Controls Methods"
      Height          =   1575
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   3975
      Begin VB.TextBox Text1 
         Height          =   1095
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   10
         Top             =   360
         Width           =   2775
      End
      Begin VB.CommandButton cmdExecute 
         Caption         =   "Execute"
         Height          =   375
         Left            =   3000
         TabIndex        =   9
         Top             =   360
         Width           =   855
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Work With Controls and Class Modules"
      Height          =   3255
      Left            =   120
      TabIndex        =   0
      Top             =   1800
      Width           =   3975
      Begin VB.ListBox lstCtrls 
         Height          =   840
         Left            =   240
         TabIndex        =   7
         Top             =   600
         Width           =   1815
      End
      Begin VB.CommandButton cmdAddCtl 
         Caption         =   "Expose Control"
         Height          =   855
         Left            =   2160
         TabIndex        =   6
         Top             =   600
         Width           =   1695
      End
      Begin VB.CommandButton cmdMethod 
         Caption         =   "Run Class1 Procedure"
         Height          =   375
         Left            =   2040
         TabIndex        =   3
         Top             =   2760
         Width           =   1815
      End
      Begin VB.TextBox txtScript 
         Height          =   855
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   2
         Top             =   1800
         Width           =   3615
      End
      Begin VB.CommandButton cmdRunScript 
         Caption         =   "Run Script"
         Height          =   375
         Left            =   240
         TabIndex        =   1
         Top             =   2760
         Width           =   1095
      End
      Begin VB.Label Label2 
         Caption         =   "Enter the Script to Run"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   1560
         Width           =   2055
      End
      Begin VB.Label Label1 
         Caption         =   "Select Control to Expose"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   360
         Width           =   1815
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdQuit_Click()
Unload Me
End Sub

Private Sub cmdMethod_Click()
Dim sProcedure As String
Dim sMessage   As String
'
' This is the parameter to pass to Class1's 'pDisplay' method.
'
sMessage = "This message is displayed from method 'pDisplay' in Class1.  It shows how to call a procedure from a script."
'
' Here is the script which calls the 'pDisplay' method with
' the above parameter.
'
sProcedure = "Sub Test" & vbCrLf & _
             "    MyClass.pDisplay " & Chr$(34) & sMessage & Chr$(34) & vbCrLf & _
             "End Sub"
'
' Add the script and run it.
'
With scScript
    .AddCode sProcedure
    .Run "Test"
End With
End Sub

Private Sub cmdRunScript_Click()
If Trim$(txtScript) = "" Then
    MsgBox "Enter your script into the textbox", vbExclamation, "No Script Code"
    Exit Sub
End If
'
' Executes the statement specified in the textbox.
'
' The context of the ExecuteStatement method is
'  determined by the object argument. If object is
'  a module, the context is restricted to the named
'  module. If object is the ScriptControl, the
'  context is global.
'
scScript.ExecuteStatement txtScript.Text
End Sub

Private Sub cmdExecute_Click()
Dim l     As Long
Dim scMod As Module
Dim sProc As String
Dim oMod  As Object

If Trim$(Text1.Text) = "" Then Exit Sub
With scScript
    '
    ' Add the script that was pasted into the top
    ' textbox to the script control.
    '
    .AddCode Text1.Text
    '
    ' If you wanted to add the code programatically instead of
    ' typing or pasting it in you could have used the following
    ' lines.
    '
    'Dim sFunction  As String
    'Dim sProcedure As String
    '
    'sFunction = "Function AddTwoNumbers(X1, X2)" & vbCrLf & _
    '            "Dim Result                    " & vbCrLf & _
    '            "    Result = X1 + X2          " & vbCrLf & _
    '            "    AddTwoNumbers = Result    " & vbCrLf & _
    '            "End Function"
    '
    'sProcedure = "Sub Hello(sName)" & vbCrLf & _
    '             "    Msgbox ""Hello "" & sName " & _
    '             "End Sub"
    '
    '    .AddCode sFunction
    '    .AddCode sProcedure
    '
    ' Retrieve properties of the function just added.
    '
    MsgBox "Function 'AddTwoNumbers'" & vbCrLf & vbCrLf & _
           "Number of arguments: " & .Procedures.Item(1).NumArgs & vbCrLf & _
           "Has a return value:  " & .Procedures.Item("AddTwoNumbers").HasReturnValue, _
           vbInformation, "Scripting Example"
    '
    ' Use the 'Eval' method on the function just added.
    '
    On Error Resume Next
    l = .Eval("AddTwoNumbers(5,2)")
    If .Error.Number <> 0 Then
        Call pDisplayError
    End If
    MsgBox l, vbInformation, "Result of Eval Method"
    '
    ' Use the 'Run' method to execute a procedure.
    '
    .Run "Hello", "Jane Doe"
    Call .Run("Hello", "James Smith")
    '
    ' Use the 'Run' method to execute a function.
    ' First discard the return value then display it.
    '
    ' Note: The procedure name is in quotes
    '       followed by the list of parameters.
    '
    .Run "AddTwoNumbers", 4, 6
    MsgBox .Run("AddTwoNumbers", 7, 8), vbInformation, "Result of Run Method"
    '
    ' Use the 'ExecuteStatement' method to execute a statement.
    '
    .ExecuteStatement "Hello ""Sue Smith"""
    .ExecuteStatement "AddTwoNumbers 9,18"
    .ExecuteStatement "MsgBox CStr(AddTwoNumbers(3,8)), vbInformation, ""Result of ExecuteStatement Method"""
    '
    '
    '
End With
'
' Script code can be organized into modules just as in VB.
' There is always at least one module. If a module is not
' explicitly declared, an implicit Global module exists that
' is used for all added scripting code.
'
' Add a module and add a proceure to it.
'
Set scMod = scScript.Modules.Add("MyMod")
sProc = "Sub Hello                  " & vbCrLf & _
        "    MsgBox ""Hello, World""" & vbCrLf & _
        "End Sub"
scMod.AddCode sProc
'
' Retrieve the module's properties.
'
With scScript.Modules
    MsgBox "Number of modules: " & .Count & vbCrLf & _
           "Module '" & .Item("MyMod").Procedures.Item(1).Name & _
           "' has " & .Item("MyMod").Procedures.Count & " procedure(s)", _
           vbInformation, "Script Control"
End With
'
' Set a variable to the CodeObject, then
' invoke the procedure.
'
Set oMod = scMod.CodeObject
oMod.Hello
Set oMod = Nothing
End Sub

Private Sub cmdAddCtl_Click()
Dim sControl As String
Dim sCtlName As String
'
' Illustrate the AddObject method by adding a
' control to the scripting engine.
'
sControl = lstCtrls.Text
If sControl = "" Then
    MsgBox "Select a control from the list.", vbExclamation, _
           "No Control Selected"
    Exit Sub
End If
'
' Get a name to refer to the control by in script.
'
sCtlName = Trim$(InputBox("Enter a name to refer to '" & sControl & "' by.", _
                    "AddObject Example", sControl))
If sCtlName = "" Then Exit Sub
'
' AddObject makes the run-time functionality of an object
'   available to a scripting engine.  The AddObject method
'   uses a name to refer to the object by and the object
'   itself.
'
scScript.AddObject sCtlName, Me.Controls(lstCtrls.ListIndex)
'
' Although not show here, the State property turns on event
' handling for your script.  This means your script can respond
' to events in your application.
'
'scScript.state = Connected
'
' Now your script can handle events. You need to write an event
' handler for the desired event. Event handler names must follow
' the naming convention of the script language used.  In VBScript
' it is "object_eventname".  So you would add a script or procedure
' called "object_eventname" to execute when your script experienced
' the event "eventname".
'
MsgBox "You can now use the keyword '" & sCtlName & "'" & vbCrLf & _
       "to access the properties and methods of " & _
       sControl & vbCrLf & vbCrLf & "Type a few statements " & _
       "in the textbox and click on 'Run Script'", vbInformation, "Expose Control Example"
End Sub


Private Sub Form_Load()
Dim ctl        As Control
Dim cls        As New Class1
Dim sProcedure As String
'
' Add the form's controls to a listbox.
'
With lstCtrls
    For Each ctl In Form1.Controls
        .AddItem ctl.Name
    Next
    .ListIndex = -1

    cmdAddCtl.Caption = _
        "Expose the " & vbCrLf & .Text & " object" & vbCrLf
End With
'
' Initialize the Script Control.
'
' Add the form's controls collection to the Script
' Control.  In the script, the controls collection
' will be referred to using the name 'Ctrls'.
'
With scScript
    '
    ' Indicates if a script, or the ScriptControl itself
    ' is allowed to display user-interface elements
    ' such as a message box.
    '
    .AllowUI = True
    .Language = "VBScript"
    .AddObject "Ctrls", Me.Controls
End With
'
' Add a sample script to the textbox.  The script uses the
' 'count' property of the 'Ctrls' object.
'
txtScript = "Msgbox ""The number of controls is: "" & Ctrls.count"
'
' Create a script to call the 'pDisplay' method of 'Class1'.
' Add this script to the script control.
'
scScript.AddObject "MyClass", cls, True
Set cls = Nothing
End Sub

Private Sub Form_Unload(Cancel As Integer)
Set Form1 = Nothing
End Sub

Private Sub lstCtrls_Click()
'
' When a control is selected, change
' the command button's caption.
'
cmdAddCtl.Caption = "Expose the " & vbCrLf & lstCtrls.Text & " object"
End Sub

Private Sub scScript_Error()
Call pDisplayError
End
End Sub

Private Sub pDisplayError()
Dim sError As String

With scScript
    sError = "Description:   " & .Error.Description & vbCrLf & _
             "Script Text:   " & .Error.Text & vbCrLf & _
             "Error Number:  " & .Error.Number & vbCrLf & _
             "Line Number:   " & .Error.Line & vbCrLf & _
             "Column Number: " & .Error.Column
End With

MsgBox sError, vbCritical, "Script Error"
End Sub
