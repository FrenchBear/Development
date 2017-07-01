VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Crayon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Crayon de couleur"
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Public Couleur As String
Public ID As String

Private Sub Class_Initialize()
  Debug.Print "Crayon.Class_Initialize"
End Sub

Private Sub Class_Terminate()
  Debug.Print "Crayon.Class_Terminate"
End Sub
