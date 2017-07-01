Attribute VB_Name = "GlobalPlan"
' GlobalPlan
' Déclarations globales et fonctions globales de tous les programmes Plan EH
' 25/04/1998 PV

Option Explicit

Global PixToCmEcranX As Single, PixToCmEcranY As Single

Public Sub InitConstantes()
  PixToCmEcranX = 2.54 * Screen.TwipsPerPixelX / 1440
  PixToCmEcranY = 2.54 * Screen.TwipsPerPixelY / 1440
End Sub


