Attribute VB_Name = "modShellDoc"
' modShellDoc
' Gestion de l'indirection d'acc�s aux diff�rentes classes document
' 03/02/1999 PV

Option Explicit

Public colClasseDocument As New Collection      ' Acc�s aux classes de document

Public Sub InitColClasseDocument()
  colClasseDocument.Add New ShellDocCRA, "CR"
  colClasseDocument.Add New ShellDocEH, "EH"
End Sub

