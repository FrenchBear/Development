VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
' If you are adding an ActiveX control at run-time that is
' not referenced in your project, you need to declare it
' as VBControlExtender.
Dim WithEvents ctlDynamic As VBControlExtender
Attribute ctlDynamic.VB_VarHelpID = -1
Dim WithEvents ctlText As VB.TextBox
Attribute ctlText.VB_VarHelpID = -1
Dim WithEvents ctlCommand As VB.CommandButton
Attribute ctlCommand.VB_VarHelpID = -1


Private Sub ctlCommand_Click()
  ctlText.Text = "You Clicked the Command button"
End Sub

Private Sub ctlDynamic_ObjectEvent(Info As EventInfo)
' test for the click event of the TreeView
  If Info.Name = "Click" Then
    ctlText.Text = "You clicked " _
     & ctlDynamic.object.selecteditem.Text
  End If
End Sub

Private Sub Form_Load()
  Dim i As Integer
  ' Add the license for the treeview to the license collection.
  ' If the license is already in the collection you will get
  ' the run-time error number 732.
  Licenses.Add "MSComctlLib.TreeCtrl"
  ' Dynamically add a TreeView control to the form.
  ' If you want the control to be added to a different
  ' container such as a Frame or PictureBox, you use the third
  ' parameter of the Controls.Add to specify the container.
  Set ctlDynamic = Controls.Add("MSComctlLib.TreeCtrl", _
    "myctl", Form1)
  ' set the location and size of the control.
  ctlDynamic.Move 1, 1, 2500, 3500
  ' Add some nodes to the control.
  For i = 1 To 10
    ctlDynamic.object.nodes.Add Key:="Test" & Str(i), Text:="Test" _
      & Str(i)
    ctlDynamic.object.nodes.Add Relative:="Test" & Str(i), _
      Relationship:=4, Text:="TestChild" & Str(i)
  Next i
  ' Make the control visible.
  ctlDynamic.Visible = True
  ' add a textbox
  Set ctlText = Controls.Add("VB.TextBox", "ctlText1", Form1)
  ' Set the location and size of the textbox
  ctlText.Move (ctlDynamic.Left + ctlDynamic.Width + 50), _
    1, 2500, 100
  ' Change the backcolor.
  ctlText.BackColor = vbYellow
  ' Make it visible
  ctlText.Visible = True
  ' Add a CommandButton.
  Set ctlCommand = Controls.Add("VB.CommandButton", _
    "ctlCommand1", Form1)
  ' Set the location and size of the CommandButton.
  ctlCommand.Move (ctlDynamic.Left + ctlDynamic.Width + 50), _
    ctlText.Height + 50, 1500, 500
  ' Set the caption
  ctlCommand.Caption = "Click Me"
  ' Make it visible
  ctlCommand.Visible = True
End Sub



