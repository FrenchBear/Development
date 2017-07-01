Attribute VB_Name = "miniVLib"
Option Explicit


Declare Function GetKeyState% Lib "user32" (ByVal nVirtKey%)
Public Const VK_TAB = 9
Public Const VK_SHIFT = &H10
Public Const VK_MENU = &H12     ' Alt !


' =================================================================================
' Sélectionne le texte d'un champ s'il a obtenu le focus via le clavier
' 15/01/99: SelLength 99 --> 999 pour les champs texte très longs !
' 25/11/99: Ajout de VK_MENU pour les raccourcis clavier

Sub AutoSelect(c As Control, Optional bForcé As Boolean)
  If bForcé Or GetKeyState(VK_TAB) < 0 Or GetKeyState(VK_MENU) < 0 Then
    c.SelStart = 0
    c.SelLength = 999
  End If
End Sub

