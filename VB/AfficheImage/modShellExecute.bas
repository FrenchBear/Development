Attribute VB_Name = "modShellExecute"
' modShellExecute
' Emballage de la fonction système ShellExecute
'  2/11/96 PV
'  8/11/96 PV Analyse des paramètres

Option Explicit

Declare Function ShellExecute Lib "Shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Declare Function GetActiveWindow Lib "user32" () As Integer
Declare Function ShowWindow Lib "user32" (ByVal hwnd As Integer, ByVal nCmdShow As Integer) As Integer

' lancement d'un programme avec attente qu'il se termine

Function FileShellExecute(ByVal hwnd As Long, sFichierComplet As String) As Integer

  Dim hWndShelledWindow As Integer
  Dim TimeOutPeriod As Integer
  Dim r As Integer
  Dim fTimeOut As Integer
  Dim s As Single
  Dim sParamètres As String, c As String
  
  ' On analyse la chaîne de commande pour sépaper la commande des arguments
  Dim i As Integer, bDansGuillemets As Boolean
  bDansGuillemets = False
  For i = 1 To Len(sFichierComplet)
    c = Mid(sFichierComplet, i, 1)
    If c = " " And Not bDansGuillemets Then
      sParamètres = Mid(sFichierComplet, i + 1)
      sFichierComplet = Left(sFichierComplet, i - 1)
      Exit For
    ElseIf c = Chr(34) Then
      bDansGuillemets = Not bDansGuillemets
    End If
  Next
  
  ' On élimine les guillemets autour de la commande,
  ' puisque cela ne plaît pas à ShellExecute
  If Left(sFichierComplet, 1) = Chr(34) Then
    sFichierComplet = Mid(sFichierComplet, 2, Len(sFichierComplet) - 2)
  End If

  TimeOutPeriod = 15  'augmentez cette valeur si le lancement
                      'du programme dure plus de 15 secondes

'  frmServeur6000.Trace "ShellExecute " & Chr(34) & "open" & Chr(34) & ", " & Chr(34) & sFichierComplet & Chr(34) & ", " & Chr(34) & sParamètres & Chr(34) & ", " & Chr(34) & Chr(34) & ", 1"
  r = ShellExecute(hwnd, "open", sFichierComplet, sParamètres, "", 1)
  If r = 2 Or r = 31 Then
      FileShellExecute = r
      Exit Function
  End If
  fTimeOut = False: s! = Timer
  'tant que la fenêtre active est la fenêtre mère
  Do
      r = DoEvents(): hWndShelledWindow = GetActiveWindow()
      If Timer - s! > TimeOutPeriod Then fTimeOut = True
  Loop While hWndShelledWindow = hwnd And Not fTimeOut

  'si le programme ne s'est pas lancé
  If fTimeOut Then
      FileShellExecute = 1
      Exit Function
  End If

  'active le programme lancé
  r = ShowWindow(hWndShelledWindow, 5)
  
  'ok
  FileShellExecute = 0

End Function

