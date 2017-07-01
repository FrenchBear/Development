Option Strict Off
Option Explicit On
Imports VB = Microsoft.VisualBasic
Module modShellExecute
	' modShellExecute
	' Emballage de la fonction système ShellExecute
	'  2/11/96 PV
	'  8/11/96 PV Analyse des paramètres
	
	
	Declare Function ShellExecute Lib "Shell32.dll"  Alias "ShellExecuteA"(ByVal hwnd As Integer, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Integer) As Integer
	Declare Function GetActiveWindow Lib "user32" () As Short
	Declare Function ShowWindow Lib "user32" (ByVal hwnd As Short, ByVal nCmdShow As Short) As Short
	
	' lancement d'un programme avec attente qu'il se termine
	
	Function FileShellExecute(ByVal hwnd As Integer, ByRef sFichierComplet As String) As Short
		
		Dim hWndShelledWindow As Short
		Dim TimeOutPeriod As Short
		Dim r As Short
		Dim fTimeOut As Short
		Dim s As Single
		Dim sParamètres, c As String
		
		' On analyse la chaîne de commande pour sépaper la commande des arguments
		Dim i As Short
		Dim bDansGuillemets As Boolean
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
		
		TimeOutPeriod = 15 'augmentez cette valeur si le lancement
		'du programme dure plus de 15 secondes
		
		'  frmServeur6000.Trace "ShellExecute " & Chr(34) & "open" & Chr(34) & ", " & Chr(34) & sFichierComplet & Chr(34) & ", " & Chr(34) & sParamètres & Chr(34) & ", " & Chr(34) & Chr(34) & ", 1"
		r = ShellExecute(hwnd, "open", sFichierComplet, sParamètres, "", 1)
		If r = 2 Or r = 31 Then
			FileShellExecute = r
			Exit Function
		End If
		fTimeOut = False : s = VB.Timer()
		'tant que la fenêtre active est la fenêtre mère
		Do 
			'UPGRADE_ISSUE: DoEvents ne retourne pas une valeur. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1022"'
			r = System.Windows.Forms.Application.DoEvents() : hWndShelledWindow = GetActiveWindow()
			If VB.Timer() - s > TimeOutPeriod Then fTimeOut = True
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
End Module