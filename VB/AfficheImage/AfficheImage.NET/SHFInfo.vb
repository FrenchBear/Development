Option Strict Off
Option Explicit On
Module ModSHFileInfo
	
	Declare Function DrawIcon Lib "user32" (ByVal hdc As Integer, ByVal x As Integer, ByVal y As Integer, ByVal hIcon As Integer) As Boolean
	
	Declare Function DrawIconEx Lib "user32" (ByVal hdc As Integer, ByVal xLeft As Integer, ByVal yTop As Integer, ByVal hIcon As Integer, ByVal cxWidth As Integer, ByVal cyWidth As Integer, ByVal istepIfAniCur As Integer, ByVal hbrFlickerFreeDraw As Integer, ByVal diFlags As Integer) As Boolean
	' DrawIconEx() diFlags values:
	Public Const DI_MASK As Short = &H1s
	Public Const DI_IMAGE As Short = &H2s
	Public Const DI_NORMAL As Short = &H3s
	Public Const DI_COMPAT As Short = &H4s
	Public Const DI_DEFAULTSIZE As Short = &H8s
	
	'UPGRADE_WARNING: La structure SHFILEINFO peut nécessiter que des attributs de marshaling soient passés en tant qu'argument dans cette instruction Declare. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1050"'
	'UPGRADE_ISSUE: La déclaration d'un paramètre 'As Any' n'est pas prise en charge. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1016"'
	Declare Function SHGetFileInfo Lib "Shell32"  Alias "SHGetFileInfoA"(ByVal pszPath As Any, ByVal dwFileAttributes As Integer, ByRef psfi As SHFILEINFO, ByVal cbFileInfo As Integer, ByVal uFlags As Integer) As Integer
	
	' pszPath:
	' Pointer to a buffer that contains the path and filename. Both absolute and
	' relative paths are valid. If uFlags includes the SHGFI_PIDL, value pszPath
	' must be the address of an ITEMIDLIST structure that contains the list of
	' item identifiers that uniquely identifies the file within the shell's name space.
	' This string can use either short (the 8.3 form) or long filenames.
	
	' dwFileAttributes:
	' Array of file attribute flags (FILE_ATTRIBUTE_ values). If uFlags does not
	' include the SHGFI_USEFILEATTRIBUTES value, this parameter is ignored.
	
	Public Const FILE_ATTRIBUTE_READONLY As Short = &H1s
	Public Const FILE_ATTRIBUTE_HIDDEN As Short = &H2s
	Public Const FILE_ATTRIBUTE_SYSTEM As Short = &H4s
	Public Const FILE_ATTRIBUTE_DIRECTORY As Short = &H10s
	Public Const FILE_ATTRIBUTE_ARCHIVE As Short = &H20s
	Public Const FILE_ATTRIBUTE_NORMAL As Short = &H80s
	Public Const FILE_ATTRIBUTE_TEMPORARY As Short = &H100s
	Public Const FILE_ATTRIBUTE_COMPRESSED As Short = &H800s
	
	' psfi and cbFileInfo:
	' Address and size, in bytes, of the SHFILEINFO structure that receives the file information.
	
	' Maximun long filename path length
	Public Const MAX_PATH As Short = 260
	
	Structure SHFILEINFO ' shfi
		Dim hIcon As Integer
		Dim iIcon As Integer
		Dim dwAttributes As Integer
		<VBFixedString(MAX_PATH),System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.ByValTStr,SizeConst:=MAX_PATH)> Public szDisplayName As String
		<VBFixedString(80),System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.ByValTStr,SizeConst:=80)> Public szTypeName As String
	End Structure
	
	' uFlags:
	' Flag that specifies the file information to retrieve. This parameter can
	' be a combination of the following values:
	
	
	' Modifies SHGFI_ICON, causing the function to retrieve the file's large icon.
	Public Const SHGFI_LARGEICON As Integer = &H0
	
	' Modifies SHGFI_ICON, causing the function to retrieve the file's small icon.
	Public Const SHGFI_SMALLICON As Integer = &H1
	
	' Modifies SHGFI_ICON, causing the function to retrieve the file's open icon.
	' A container object displays an open icon to indicate that the container is open.
	Public Const SHGFI_OPENICON As Integer = &H2
	
	' Modifies SHGFI_ICON, causing the function to retrieve a shell-sized icon.
	' If this flag is not specified, the function sizes the icon according to the system metric values.
	Public Const SHGFI_SHELLICONSIZE As Integer = &H4
	
	' Indicates that pszPath is the address of an ITEMIDLIST structure rather than a path name.
	Public Const SHGFI_PIDL As Integer = &H8
	
	' Indicates that the function should use the dwFileAttributes parameter.
	Public Const SHGFI_USEFILEATTRIBUTES As Integer = &H10
	
	' Retrieves the handle of the icon that represents the file and the index of the
	' icon within the system image list. The handle is copied to the hIcon member
	' of the structure specified by psfi, and the index is copied to the iIcon member.
	' The return value is the handle of the system image list.
	Public Const SHGFI_ICON As Integer = &H100
	
	' Retrieves the display name for the file. The name is copied to the szDisplayName
	' member of the structure specified by psfi. The returned display name uses the
	' long filename, if any, rather than the 8.3 form of the filename.
	Public Const SHGFI_DISPLAYNAME As Integer = &H200
	
	' Retrieves the string that describes the file's type. The string is copied to the
	' szTypeName member of the structure specified by psfi.
	Public Const SHGFI_TYPENAME As Integer = &H400
	
	' Retrieves the file attribute flags. The flags are copied to the dwAttributes
	' member of the structure specified by psfi.
	Public Const SHGFI_ATTRIBUTES As Integer = &H800
	
	' Retrieves the name of the file that contains the icon representing the file.
	' The name is copied to the szDisplayName member of the structure specified by psfi.
	Public Const SHGFI_ICONLOCATION As Integer = &H1000
	
	' Returns the type of the executable file if pszPath identifies an executable file.
	' To retrieve the executable file type, uFlags must specify only SHGFI_EXETYPE.
	' The return value specifies the type of the executable file:
	' 0                                                                       Nonexecutable file or an error condition.
	' LOWORD = NE or PEHIWORD = 3.0, 3.5, or 4.0  Windows application
	' LOWORD = MZHIWORD = 0                               MS-DOS .EXE, .COM or .BAT file
	' LOWORD = PEHIWORD = 0                               Win32 console application
	Public Const SHGFI_EXETYPE As Integer = &H2000
	
	' Retrieves the index of the icon within the system image list. The index is copied to the iIcon
	' member of the structure specified by psfi. The return value is the handle of the system image list.
	Public Const SHGFI_SYSICONINDEX As Integer = &H4000
	
	' Modifies SHGFI_ICON, causing the function to add the link overlay to the file's icon.
	Public Const SHGFI_LINKOVERLAY As Integer = &H8000
	
	' Modifies SHGFI_ICON, causing the function to blend the file's icon with the system highlight color.
	Public Const SHGFI_SELECTED As Integer = &H10000
End Module