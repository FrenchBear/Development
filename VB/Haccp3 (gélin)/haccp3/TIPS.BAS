Attribute VB_Name = "modTips"
Option Explicit

Global Const SW_SHOWNOACTIVATE = 4
Global Const GW_CHILD = 5         ' Needed for edit portion of combo box
 
Type POINTAPI       ' Stores location of cursor
   X As Integer
   Y As Integer
End Type
 
Declare Sub GetCursorPos Lib "User" (lpPoint As POINTAPI)
Declare Function GetActiveWindow Lib "User" () As Integer
' Enter each of the following Declare statements on one, single line:
Declare Function WindowFromPoint Lib "User" (ByVal lpPointY As Integer, ByVal lpPointX As Integer) As Integer
Declare Function GetWindow Lib "User" (ByVal hWnd As Integer, ByVal wCmd As Integer) As Integer
Declare Function ShowWindow Lib "User" (ByVal hWnd As Integer, ByVal nCmdShow As Integer) As Integer
 
  Sub DisplayHelp(Help$)
      Dim lpPoint As POINTAPI ' Cursor Point variable
      Dim ret As Integer      ' Return value of ShowWindow() API function
 
      Rem Display Help String
      Rem
      Rem This Function displays the Help$ if Help$ <> "".
      Rem if Help$ = "" then the Help String is removed.
      Rem
      Rem FUNCTION REQUIREMENTS:
      Rem     GetCursorPos()    Windows API function
      Rem     frmHelp           Name of the Help form
      Rem
 
      If Len(Help$) <> 0 Then  ' Double check help$
 
         ' Make sure help form is invisible:
         frmHelp.Hide
 
         ' Change caption of label:
         frmHelp.Label1.Caption = Help$
 
         ' Get the cursor position so you can calculate where to place the
         ' help form:
         Call GetCursorPos(lpPoint)
 
         ' Offset the form from the cursor by 18 and 2 pixels (values
         ' chosen to simulate the look of Microsoft Word version 6.0)
         frmHelp.Top = (lpPoint.Y + 18) * Screen.TwipsPerPixelY
         frmHelp.Left = (lpPoint.X - 2) * Screen.TwipsPerPixelY
 
         ' Adjust width of form to label + 4  because 2 are needed for each
         ' pixel of the border and 2 are needed to center the label (the
         ' label is inset by 1 pixel on the form). Also, adjust height of
         ' form to height of label + 2 because 2 ar needed for each pixel
         ' of the border:
         frmHelp.Width = frmHelp.Label1.Width + (4 * Screen.TwipsPerPixelX)
         frmHelp.Height = frmHelp.Label1.Height + 2 * Screen.TwipsPerPixelY
 
         ' Make sure form is on top:
         frmHelp.ZOrder
 
         ' Show form without the focus:
         ret = ShowWindow(frmHelp.hWnd, SW_SHOWNOACTIVATE)
      Else
         ' Hide the form:
         frmHelp.Hide
      End If
   End Sub
 
Sub TimerTipsTimer(Optional bEfface As Variant)

Dim curhWnd As Integer      'Current hWnd
Dim p As POINTAPI
Static LasthWnd As Integer  'Hold previous hWnd
Static BackupInterval As Integer
 
    If IsMissing(bEfface) Then
        bEfface = False
    End If
    If bEfface Then
        DisplayHelp ""
        FormMain.TimerTips.Interval = iif2(BackupInterval = 0, BackupInterval, 5)
        Exit Sub
    End If

      ' Make sure the program has the input focus:
      If GetActiveWindow() = FormMain.hWnd Then
         ' Initialize point structure:
         Call GetCursorPos(p)
         ' Which window is the mouse cursor over?
         curhWnd = WindowFromPoint(p.Y, p.X)
 
         ' Same as last window? If so, don't need to redraw:
         If curhWnd <> LasthWnd Then
            ' Store the current hWnd:
            LasthWnd = curhWnd
            ' Decrease timer interval to 5 ms (could choose 1 ms):
            If FormMain.TimerTips.Interval <> 5 Then
                BackupInterval = FormMain.TimerTips.Interval
                FormMain.TimerTips.Interval = 5
            End If
            ' Which control is the cursor over?
            Select Case curhWnd
                Case FormMain.btnFichierNouveau.hWnd
                    DisplayHelp "Créer un nouveau projet"
                Case FormMain.btnFichierOuvrir.hWnd
                    DisplayHelp "Ouvrir un projet existant"
                Case FormMain.btnFichierEnregistrer.hWnd
                    DisplayHelp "Enregistrer le projet"
                Case FormMain.btnEditionCopier.hWnd
                    DisplayHelp "Copier"
                Case FormMain.btnEditionCouper.hWnd
                    DisplayHelp "Couper"
                Case FormMain.btnEditionColler.hWnd
                    DisplayHelp "Coller"
                Case FormMain.btnFenetre(0).hWnd
                    DisplayHelp FormMain.ActiveForm.SSTab1.TabCaption(0)
                Case FormMain.btnFenetre(1).hWnd
                    DisplayHelp FormMain.ActiveForm.SSTab1.TabCaption(1)
                Case FormMain.btnFenetre(2).hWnd
                    DisplayHelp FormMain.ActiveForm.SSTab1.TabCaption(2)
                Case FormMain.btnFenetre(3).hWnd
                    DisplayHelp FormMain.ActiveForm.SSTab1.TabCaption(3)
                Case FormMain.btnFenetre(4).hWnd
                    DisplayHelp FormMain.ActiveForm.SSTab1.TabCaption(4)
                Case FormMain.btnFenetre(5).hWnd
                    DisplayHelp FormMain.ActiveForm.SSTab1.TabCaption(5)
                Case FormMain.btnFenetre(6).hWnd
                    DisplayHelp FormMain.ActiveForm.SSTab1.TabCaption(6)
                Case FormMain.btnDétail.hWnd
                    DisplayHelp "Pour en savoir plus..."
                Case FormMain.btnAide.hWnd
                    DisplayHelp "Aide sur l'affichage en cours"
                Case FormMain.btnCohérence.hWnd
                    DisplayHelp "Contrôler la cohérence du projet"
                Case frmHelp.hWnd
                    ' If it moves onto the help window, hide it:
                    frmHelp.Hide
                Case Else
                    ' Cursor is over the form or something else, so
                    ' change interval back to 1 sec delay:
                    DisplayHelp ""
                    FormMain.TimerTips.Interval = BackupInterval
            End Select
            
         End If
      End If

End Sub


