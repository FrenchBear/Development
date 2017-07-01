VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Launchpad (simulated !)"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Label Label1 
      Caption         =   "A global object of class Eurodat53.Eurodat50Connection with ApplicationPath property equals to ""AZERTY"" should be available"
      Height          =   1215
      Left            =   180
      TabIndex        =   0
      Top             =   180
      Width           =   2415
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim myObj As Object


Private Type GUIDs
    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(0 To 7) As Byte
End Type

'Declares needed to register object in the ROT (Run Object Table)
Private Const ACTIVEOBJECT_STRONG = 0
Private Const ACTIVEOBJECT_WEAK = 1
Private Declare Function CLSIDFromProgID Lib "ole32.dll" (ByVal ProgID As Long, rclsid As GUIDs) As Long
Private Declare Function CoDisconnectObject Lib "ole32.dll" (ByVal pUnk As IUnknown, pvReserved As Long) As Long
Private Declare Function RegisterActiveObject Lib "oleaut32.dll" (ByVal pUnk As IUnknown, rclsid As GUIDs, ByVal dwFlags As Long, pdwRegister As Long) As Long
Private Declare Function RevokeActiveObject Lib "oleaut32.dll" (ByVal dwRegister As Long, ByVal pvReserved As Long) As Long
Private OLEInstance As Long

Public Sub AddToROT()
    Dim mGuid As GUIDs
    Dim lp As Long

    'This code is responsible for creating the entry in the ROT
    'Make sure to insert the correct qualified object (class) that you want in the ROT.
    OLEInstance = 0
    lp = CLSIDFromProgID(StrPtr("Eurodat53.Eurodat50Connection"), mGuid)

    If lp = 0 Then
        lp = RegisterActiveObject(myObj, mGuid, ACTIVEOBJECT_WEAK, OLEInstance)
    End If
End Sub

Public Sub RemoveFromROT()
    'Once we are done with the main program, lets clean up the rot
    'by removing the entry for our ActiveX Server/DLL
    If OLEInstance <> 0 Then
        RevokeActiveObject OLEInstance, 0
    End If
    CoDisconnectObject myObj, 0
End Sub



Private Sub Form_Load()
    Set myObj = CreateObject("Eurodat53.Eurodat50Connection")
    myObj.ApplicationPath = "AZERTY"
    AddToROT
End Sub

Private Sub Form_Terminate()
    RemoveFromROT
End Sub
