Attribute VB_Name = "modShellFileOperation"
' ShellFileOperation
' Acces VB à SHFileOperation (effacement -> poubelle, copie, ...)
' 11/11/97 PV Créé d'après la KB VB Microsoft
'  3/01/98 PV DéplaceFichier
'  5/08/99 PV EffaceFichierCorbeille envoie réellement dans la corbeille !!!

Option Explicit

Public Const FO_MOVE As Long = &H1
Public Const FO_COPY As Long = &H2
Public Const FO_DELETE As Long = &H3
Public Const FO_RENAME As Long = &H4


Public Const FOF_MULTIDESTFILES As Long = &H1
Public Const FOF_CONFIRMMOUSE As Long = &H2
Public Const FOF_SILENT As Long = &H4
Public Const FOF_RENAMEONCOLLISION As Long = &H8
Public Const FOF_NOCONFIRMATION As Long = &H10
Public Const FOF_WANTMAPPINGHANDLE As Long = &H20
Public Const FOF_CREATEPROGRESSDLG As Long = &H0
Public Const FOF_ALLOWUNDO As Long = &H40
Public Const FOF_FILESONLY As Long = &H80
Public Const FOF_SIMPLEPROGRESS As Long = &H100
Public Const FOF_NOCONFIRMMKDIR As Long = &H200


Type SHFILEOPSTRUCT
   hwnd As Long
   wFunc As Long
   pFrom As String
   pTo As String
   fFlags As Long
   fAnyOperationsAborted As Long
   hNameMappings As Long
   lpszProgressTitle As String
End Type

Declare Function SHFileOperation Lib "Shell32.dll" Alias "SHFileOperationA" (lpFileOp As SHFILEOPSTRUCT) As Long


Function EffaceFichierCorbeille(ByVal hwnd As Long, ByVal sNomfic As String) As Long
  Dim DelFileOp As SHFILEOPSTRUCT
  Dim result As Long
  While Right(sNomfic, 2) <> vbNullChar & vbNullChar: sNomfic = sNomfic & vbNullChar: Wend
  With DelFileOp
     .hwnd = hwnd
     .wFunc = FO_DELETE
     .pFrom = sNomfic
     .fFlags = FOF_NOCONFIRMATION Or FOF_ALLOWUNDO

  End With
  result = SHFileOperation(DelFileOp)
  EffaceFichierCorbeille = result
End Function

Function DéplaceFichier(ByVal hwnd As Long, ByVal sSource As String, ByVal sDest As String) As Long
  Dim MoveFileOp As SHFILEOPSTRUCT
  Dim result As Long
  While Right(sSource, 2) <> vbNullChar & vbNullChar: sSource = sSource & vbNullChar: Wend
  While Right(sDest, 2) <> vbNullChar & vbNullChar: sDest = sDest & vbNullChar: Wend
  With MoveFileOp
     .hwnd = hwnd
     .wFunc = FO_MOVE
     .pFrom = sSource
     .pTo = sDest
     .fFlags = FOF_NOCONFIRMATION & FOF_MULTIDESTFILES
  End With
  result = SHFileOperation(MoveFileOp)
  DéplaceFichier = result
End Function

