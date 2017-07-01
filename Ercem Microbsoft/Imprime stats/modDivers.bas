Attribute VB_Name = "modDivers"
' modDivers
' Fonctions utilitaires diverses pour l'impression des stats
' 16/1/98 PV

Option Explicit

Declare Function GetKeyState% Lib "user32" (ByVal nVirtKey%)
Public Const VK_TAB = 9

' =================================================================================
' Sélectionne le texte d'un champ s'il a obtenu le focus via le clavier

Sub AutoSelect(c As Control)
  If GetKeyState(VK_TAB) < 0 Then
    c.SelStart = 0
    c.SelLength = 99
  End If
End Sub

' =================================================================================
' Teste l'existence d'un fichier

Public Function bExist(ByVal sNomfic As String) As Boolean
  bExist = Dir(sNomfic) <> ""
End Function

' =================================================================================
' Pause

Public Sub Sleep(tDélai)
  Dim t
  t = Timer
  While Timer - t < tDélai
    DoEvents
  Wend
End Sub

