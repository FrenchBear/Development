Attribute VB_Name = "modGlobal"
Option Explicit

Public colClasseDocument As New Collection


Public Sub InitColClasseDocument()
  colClasseDocument.Add New ClasseCRA, "CRA"
  colClasseDocument.Add New ClasseEH, "EH"
End Sub
