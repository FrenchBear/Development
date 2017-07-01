Option Strict Off
Option Explicit On
Module modShellFileOperation
	' ShellFileOperation
	' Acces VB à SHFileOperation (effacement -> poubelle, copie, ...)
	' 11/11/97 PV Créé d'après la KB VB Microsoft
	'  3/01/98 PV DéplaceFichier
	'  5/08/99 PV EffaceFichierCorbeille envoie réellement dans la corbeille !!!
	
	
	Public Const FO_MOVE As Integer = &H1s
	Public Const FO_COPY As Integer = &H2s
	Public Const FO_DELETE As Integer = &H3s
	Public Const FO_RENAME As Integer = &H4s
	
	
	Public Const FOF_MULTIDESTFILES As Integer = &H1s
	Public Const FOF_CONFIRMMOUSE As Integer = &H2s
	Public Const FOF_SILENT As Integer = &H4s
	Public Const FOF_RENAMEONCOLLISION As Integer = &H8s
	Public Const FOF_NOCONFIRMATION As Integer = &H10s
	Public Const FOF_WANTMAPPINGHANDLE As Integer = &H20s
	Public Const FOF_CREATEPROGRESSDLG As Integer = &H0s
	Public Const FOF_ALLOWUNDO As Integer = &H40s
	Public Const FOF_FILESONLY As Integer = &H80s
	Public Const FOF_SIMPLEPROGRESS As Integer = &H100s
	Public Const FOF_NOCONFIRMMKDIR As Integer = &H200s
	
	
	Structure SHFILEOPSTRUCT
		Dim hwnd As Integer
		Dim wFunc As Integer
		Dim pFrom As String
		Dim pTo As String
		Dim fFlags As Integer
		Dim fAnyOperationsAborted As Integer
		Dim hNameMappings As Integer
		Dim lpszProgressTitle As String
	End Structure
	
	'UPGRADE_WARNING: La structure SHFILEOPSTRUCT peut nécessiter que des attributs de marshaling soient passés en tant qu'argument dans cette instruction Declare. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1050"'
	Declare Function SHFileOperation Lib "Shell32.dll"  Alias "SHFileOperationA"(ByRef lpFileOp As SHFILEOPSTRUCT) As Integer
	
	
	Function EffaceFichierCorbeille(ByVal hwnd As Integer, ByVal sNomfic As String) As Integer
		Dim DelFileOp As SHFILEOPSTRUCT
		Dim result As Integer
		While Right(sNomfic, 2) <> vbNullChar & vbNullChar : sNomfic = sNomfic & vbNullChar : End While
		With DelFileOp
			.hwnd = hwnd
			.wFunc = FO_DELETE
			.pFrom = sNomfic
			.fFlags = FOF_NOCONFIRMATION Or FOF_ALLOWUNDO
			
		End With
		result = SHFileOperation(DelFileOp)
		EffaceFichierCorbeille = result
	End Function
	
	Function DéplaceFichier(ByVal hwnd As Integer, ByVal sSource As String, ByVal sDest As String) As Integer
		Dim MoveFileOp As SHFILEOPSTRUCT
		Dim result As Integer
		While Right(sSource, 2) <> vbNullChar & vbNullChar : sSource = sSource & vbNullChar : End While
		While Right(sDest, 2) <> vbNullChar & vbNullChar : sDest = sDest & vbNullChar : End While
		With MoveFileOp
			.hwnd = hwnd
			.wFunc = FO_MOVE
			.pFrom = sSource
			.pTo = sDest
			.fFlags = CInt(FOF_NOCONFIRMATION & FOF_MULTIDESTFILES)
		End With
		result = SHFileOperation(MoveFileOp)
		DéplaceFichier = result
	End Function
End Module