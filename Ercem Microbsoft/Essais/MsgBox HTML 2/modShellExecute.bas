Attribute VB_Name = "modShellExecute"
Attribute VB_Description = "Emballage de la fonction syst�me ShellExecute"
' modShellExecute
' Emballage de la fonction syst�me ShellExecute
' 2/11/96 PV
' 8/11/96 Analyse des param�tres

Option Explicit

Declare Function ShellExecute Lib "Shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Declare Function GetActiveWindow Lib "user32" () As Integer
Declare Function ShowWindow Lib "user32" (ByVal hWnd As Integer, ByVal nCmdShow As Integer) As Integer

' lancement d'un programme avec attente qu'il se termine

Function FileShellExecute(ByVal hWnd As Long, ByVal sFichierComplet As String) As Integer
  Dim hWndShelledWindow As Integer
  Dim TimeOutPeriod As Integer
  Dim r As Integer
  Dim s As Single
  Dim fTimeOut As Integer
  Dim sParam�tres As String, c As String
  
  ' On analyse la cha�ne de commande pour s�paper la commande des arguments
  Dim i As Integer, bDansGuillemets As Boolean
  bDansGuillemets = False
  For i = 1 To Len(sFichierComplet)
    c = Mid(sFichierComplet, i, 1)
    If c = " " And Not bDansGuillemets Then
      sParam�tres = Mid(sFichierComplet, i + 1)
      sFichierComplet = Left(sFichierComplet, i - 1)
      Exit For
    ElseIf c = """" Then
      bDansGuillemets = Not bDansGuillemets
    End If
  Next
  
  ' On �limine les guillemets autour de la commande,
  ' puisque cela ne pla�t pas � ShellExecute
  If Left(sFichierComplet, 1) = """" Then
    sFichierComplet = Mid(sFichierComplet, 2, Len(sFichierComplet) - 2)
  End If

  TimeOutPeriod = 15  'augmentez cette valeur si le lancement
                      'du programme dure plus de 15 secondes

  r = ShellExecute(hWnd, "open", sFichierComplet, sParam�tres, "", 1)
  If r = 2 Or r = 31 Then
      FileShellExecute = r
      Exit Function
  End If
  fTimeOut = False: s = Timer
  'tant que la fen�tre active est la fen�tre m�re
  Do
      r = DoEvents(): hWndShelledWindow = GetActiveWindow()
      If Timer - s > TimeOutPeriod Then fTimeOut = True
  Loop While hWndShelledWindow = hWnd And Not fTimeOut

  'si le programme ne s'est pas lanc�
  If fTimeOut Then
      FileShellExecute = 1
      Exit Function
  End If

  'active le programme lanc�
  r = ShowWindow(hWndShelledWindow, 5)
  
  'ok
  FileShellExecute = 0
End Function

