VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2385
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2010
   LinkTopic       =   "Form1"
   ScaleHeight     =   2385
   ScaleWidth      =   2010
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Call Routine foo"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   1680
      Width           =   1455
   End
   Begin VB.TextBox TxtThisIsTheName 
      Height          =   735
      Left            =   240
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   240
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Get Textbox name"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   1080
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'needs a reference to typelib information (tLbinf32.dll)
'MSDN has tLbinf32.dll documentation in addons area
'http://msdn.microsoft.com/vbasic/downloads/addon.asp
'http://msdn.microsoft.com/vbasic/downloads/download.asp?ID=094
'If you can understand this documentation then you must be  a COM
'programmer!
'VB6 declare ;VB5 is in msvbvm50.dll
Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (Ptr() As Any) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal ByteLen As Long)
Private m_TLInf As TypeLibInfo

Private Sub Command1_Click()
    hook
End Sub
Sub hook()
    Dim ret As Variant
    'The Invoke members of the TLIApplication object
    'allow you to easily use IDispatch::Invoke directly from VB code
    'This has similar functionality to the VB6 callbyname function
    'I left out The ReverseArg();ret receives the property value
    
    ret = tli.InvokeHook(Me.TxtThisIsTheName, "Name", INVOKE_PROPERTYGET)
    MsgBox "The name of this textbox is '" & ret & "'"
End Sub
Sub hook2()
    'call a function of form1 object
    'foo(integer,integer array)
    'Function call takes 2 arguments
    
    Dim tli As TLIApplication
    Set tli = New TLIApplication
    Dim arg() As Variant, iarr() As Integer
    Dim i As Integer
    Dim vt As Integer
    ReDim args(1): ReDim iarr(1)

    iarr(0) = 77: iarr(1) = 12345
    'arguments for function are in reverse order: Order that IDispatch::Invoke wants them
    'pointer to the integer array put in arg  array which ia a variant array
    args(0) = VarPtrArray(iarr)
    'In order to support ByRef parameters with InvokeHookArray,
    'you'll have to modify the Variants in the argument list by assigning a Long pointer value to the Variant, then using the CopyMemory API to modify the vt (VarType) field in the underlying Variant structure to be the VarType of the argument combined with the VT_BYREF bit.
    vt = VT_BYREF Or VT_ARRAY Or VT_I2
    CopyMemory args(0), vt, 2

    args(1) = VarPtr(i)
    vt = VT_BYREF Or VT_I2
    CopyMemory args(1), vt, 2

    tli.InvokeHookArray Form1, "Foo", INVOKE_FUNC, args
    Set tli = Nothing
End Sub

Sub foo(i As Integer, iarray() As Integer)
    Dim x As Integer
    MsgBox "In Foo subroutine: i= " & i
    ''MsgBox "iarray(0) " & iarray(0)
    MsgBox "iarray count= " & UBound(iarray) + 1
    'assume Lbound=0
    For x = 0 To UBound(iarray) '- 1
        MsgBox "iarray( " & x & ")= " & iarray(x)

    Next x

End Sub

Private Sub Command2_Click()
    hook2
End Sub

Private Sub Form_Load()
    '
End Sub
