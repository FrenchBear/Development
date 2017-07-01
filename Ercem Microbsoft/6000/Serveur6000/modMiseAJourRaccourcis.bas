Attribute VB_Name = "modMiseAJourRaccourcis"
' Module miseMiseAJourRaccourcis
' Mise � jour automatique des raccourcis de X: sur Z: du menu microbsoft
' 26/10/00 PV

Option Explicit


Declare Function GetKeyState% Lib "user32" (ByVal nVirtKey%)
Public Const VK_TAB = 9
Public Const VK_SHIFT = &H10
Public Const VK_MENU = &H12     ' Alt !


Public Sub MiseAJourRaccourcis()
  InitRaccourcis    ' D�termine les menus syst�me
  
  ' On regarde si le menu est candidat � une mise � jour...
  Dim s As String
  Dim bMAJ As Boolean
  s = Dir(sMenuProgMicrobsoft)
  Do While s <> ""
    ' ...
    If bRaccourciPointantSurZ(sMenuProgMicrobsoft & s) Then
      bMAJ = True
      Exit Do
    End If
    s = Dir
  Loop
  
  If bMAJ Then
    MsgBox "Un raccourci du menu Microb'Soft pointe sur Z:, mise � jour automatique du menu.", vbInformation, App.Title
    If Not bShiftPressed Then MAJMenuMicrobsoft
  End If
End Sub


' =================================================================================
' M�canisme g�n�ral de d�tection du shift

Function bShiftPressed() As Boolean
  bShiftPressed = GetKeyState(VK_SHIFT) < 0
End Function

