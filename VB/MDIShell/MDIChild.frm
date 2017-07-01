VERSION 5.00
Begin VB.Form frmDocument 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
End
Attribute VB_Name = "frmDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim WithEvents EmbeddedControl As VBControlExtender
Attribute EmbeddedControl.VB_VarHelpID = -1
Dim PrivateInt As PrivateInterface.PrivateMDI


Public Function CreateControl(ControlName As String)
   If Not EmbeddedControl Is Nothing Then
      Controls.Remove "Embedded"
      Set EmbeddedControl = Nothing
   End If

   ' Error will be raised here if control doesn't load
   Set EmbeddedControl = Me.Controls.Add(ControlName, "Embedded")
   EmbeddedControl.Visible = True
   Set PrivateInt = EmbeddedControl.object
   PrivateInt.Enable
   PrivateInt.SetUser "Pierre"

   Form_Resize

End Function

Private Sub Form_Resize()
   On Error Resume Next
   EmbeddedControl.Move 0, 0, ScaleWidth, ScaleHeight
End Sub


Private Sub EmbeddedControl_ObjectEvent(Info As EventInfo)
   If Info.Name = "DblClick" Then
      MsgBox "Control was double-clicked"
   End If
End Sub



Public Function SaveDocument() As Variant
   Dim p As New PropertyBag
   p.WriteProperty "EmbeddedControl", EmbeddedControl.object, Nothing
   SaveDocument = p.Contents
End Function

Public Function LoadDocument(ctldata As Variant)
   Dim p As New PropertyBag
   Dim pmdi As PrivateMDI
   p.Contents = ctldata
   Set pmdi = p.ReadProperty("EmbeddedControl")
   Set p = New PropertyBag
   ' Store current property set (without ctl GUID)
   pmdi.StoreProperties p
   ' Create a new control with this GUID
   Call CreateControl(pmdi.ProgId)
   ' We've actually created a second control here,
   ' which will be placed
   Set pmdi = EmbeddedControl.object
   ' Load current property set (without ctl GUID)
   pmdi.LoadProperties p
End Function

 
