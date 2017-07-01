VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnStart 
      Caption         =   "Start P1"
      Height          =   495
      Left            =   2460
      TabIndex        =   1
      Top             =   300
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   2460
      TabIndex        =   0
      Top             =   2040
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetProp Lib "user32" Alias "GetPropA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function AllowSetForegroundWindow Lib "user32.dll" (ByVal dwProcessId As Long) As Long

Private Sub btnStart_Click()
    Dim TaskID
    TaskID = Shell("Project1.exe")
    Debug.Print "Shell TaskId: " & TaskID
End Sub

Private Sub Form_Load()
    'KPD-Team 2001
    'URL: http://www.allapi.net/
    'E-Mail: KPDTeam@Allapi.net
    Command1.Caption = "Grant SetForeground permission"
End Sub

Private Sub Command1_Click()
    Dim mWnd As Long, hProcessID As Long
    mWnd = FindWindow(vbNullString, "AllowSetForegroundWindow Example")
    If mWnd = 0 Then
        MsgBox "Couldn't find other window!"
        Exit Sub
    End If
    hProcessID = GetProp(mWnd, "ProcessID")
    AllowSetForegroundWindow hProcessID
    Debug.Print "AllowSetForegroundWindow " & hProcessID
End Sub


' Now start Project2 and Project1. Make sure Project2 has the focus.
' After 10 seconds, Project1 is going to try to set itself to the foreground
' but this will fail on Windows2000/ME. Instead, the caption starts flashing.

' Now, click the button on the main form of Project2. This will call
' the AllowSetForegroundWindow function to allow Project1 to
' set itself to the foreground.
' After 10 seconds, when Project1 tries to put itself on the foreground,
' it will succeed because Project2 granted the SetForeground permission.

