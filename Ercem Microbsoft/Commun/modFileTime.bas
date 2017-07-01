Attribute VB_Name = "modFileTime"
' modFileTime
' Accès Win32 aux dates et heures des fichiers
' Les temps en seconde impairs sont arrondis au multiple de 2 supérieur
' 22/07/1998 PV

Option Explicit

Private Const OF_READ = &H0
Private Const OF_WRITE = &H1
Private Const OF_SHARE_DENY_NONE = &H40
Private Const OFS_MAXPATHNAME = 128

Private Type OFSTRUCTREC
     cBytes As Byte
     fFixedDisk As Byte
     nErrCode As Integer
     Reserved1 As Integer
     Reserved2 As Integer
     szPathName(OFS_MAXPATHNAME) As Byte
End Type

Private Type FILETIMEREC
     dwLowDateTime As Long
     dwHighDateTime As Long
End Type

Private Type SYSTEMTIMEREC
     wYear As Integer
     wMonth As Integer
     wDayOfWeek As Integer
     wDay As Integer
     wHour As Integer
     wMinute As Integer
     wSecond As Integer
     wMilliseconds As Integer
End Type

Private Declare Function GetLastError Lib "kernel32" () As Long

Private Declare Function OpenFile Lib "kernel32" (ByVal lpFileName As String, lpReOpenBuff As OFSTRUCTREC, ByVal wStyle As Long) As Long
Private Declare Function lclose Lib "kernel32" Alias "_lclose" (ByVal hFile As Long) As Long

Private Declare Function FileTimeToSystemTime Lib "kernel32" (lpFileTime As FILETIMEREC, lpSystemTime As SYSTEMTIMEREC) As Long
Private Declare Function SystemTimeToFileTime Lib "kernel32" (lpSystemTime As SYSTEMTIMEREC, lpFileTime As FILETIMEREC) As Long

Private Declare Function FileTimeToLocalFileTime Lib "kernel32" (lpFileTime As FILETIMEREC, lpLocalFileTime As FILETIMEREC) As Long
Private Declare Function LocalFileTimeToFileTime Lib "kernel32" (lpLocalFileTime As FILETIMEREC, lpFileTime As FILETIMEREC) As Long

Private Declare Function GetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As FILETIMEREC, lpLastAccessTime As FILETIMEREC, lpLastWriteTime As FILETIMEREC) As Long
Private Declare Function SetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As Any, lpLastAccessTime As Any, lpLastWriteTime As Any) As Long

' Définit la date de dernière écriture pour un fichier,
' retournée par FileDateTime du VB

Public Sub SetFileDateTime(ByVal sNomfic As String, ByVal dDate As Date)
  Dim FileStruct As OFSTRUCTREC
  Dim hFile As Long
  Dim SystemTime As SYSTEMTIMEREC
  Dim LFileTime As FILETIMEREC, FileTime As FILETIMEREC
  
  ' Les secondes impaires sont arrondies au multiple de 2 supérieur,
  ' puisque selon les versions de Windows l'arrondi est fait différement !!!!!!
  If (Second(dDate) And 1) = 1 Then dDate = dDate + TimeSerial(0, 0, 1)
  
  With SystemTime
    .wYear = Year(dDate)
    .wMonth = Month(dDate)
    .wDay = Day(dDate)
    .wHour = Hour(dDate)
    .wMinute = Minute(dDate)
    .wSecond = Second(dDate)
    .wMilliseconds = 0
  End With
  
  If SystemTimeToFileTime(SystemTime, LFileTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au SystemTimeToFileTime(" & GetLastError & ")": Exit Sub
  If LocalFileTimeToFileTime(LFileTime, FileTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au LocalFileTimeToFileTime(" & GetLastError & ")": Exit Sub
  
  ' Open it to get a stream handle
  hFile = OpenFile(sNomfic, FileStruct, OF_WRITE Or OF_SHARE_DENY_NONE)
  If hFile = 0 Then Err.Raise 1000, "modFileTime", "Échec à l'accès au fichier(" & GetLastError & ")": Exit Sub
  
  If SetFileTime(hFile, vbNullString, vbNullString, FileTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au SetFileTime(" & GetLastError & ")"
  lclose hFile
End Sub


' Retourne les trois timestamp pour un fichier
Sub GetFileDateTime(ByVal sNomfic As String, ByRef dCreation As Date, ByRef dLastAccess As Date, ByRef dLastWrite As Date)
  Dim hFile As Long
  Dim FileStruct As OFSTRUCTREC
  Dim CreationTime As FILETIMEREC
  Dim LastAccessTime As FILETIMEREC
  Dim LastWriteTime As FILETIMEREC
  Dim LocalFileTime As FILETIMEREC
  Dim SystemTime As SYSTEMTIMEREC
  
  hFile = OpenFile(sNomfic, FileStruct, OF_READ Or OF_SHARE_DENY_NONE)
  If hFile = 0 Then Err.Raise 1000, "modFileTime", "Échec à l'accès au fichier(" & GetLastError & ")": Exit Sub

  If GetFileTime(hFile, CreationTime, LastAccessTime, LastWriteTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au GetFileTime(" & GetLastError & ")": Exit Sub
  
  If FileTimeToLocalFileTime(CreationTime, LocalFileTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au FileTimeToLocalFileTime(" & GetLastError & ")": Exit Sub
  If FileTimeToSystemTime(LocalFileTime, SystemTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au FileTimeToSystemTime(" & GetLastError & ")": Exit Sub
  dCreation = DateSerial(SystemTime.wYear, SystemTime.wMonth, SystemTime.wDay) + TimeSerial(SystemTime.wHour, SystemTime.wMinute, SystemTime.wSecond)
  
  If FileTimeToLocalFileTime(LastAccessTime, LocalFileTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au FileTimeToLocalFileTime(" & GetLastError & ")": Exit Sub
  If FileTimeToSystemTime(LocalFileTime, SystemTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au FileTimeToSystemTime(" & GetLastError & ")": Exit Sub
  dLastAccess = DateSerial(SystemTime.wYear, SystemTime.wMonth, SystemTime.wDay) + TimeSerial(SystemTime.wHour, SystemTime.wMinute, SystemTime.wSecond)
  
  If FileTimeToLocalFileTime(LastWriteTime, LocalFileTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au FileTimeToLocalFileTime(" & GetLastError & ")": Exit Sub
  If FileTimeToSystemTime(LocalFileTime, SystemTime) = 0 Then Err.Raise 1000, "modFileTime", "Échec au FileTimeToSystemTime(" & GetLastError & ")": Exit Sub
  dLastWrite = DateSerial(SystemTime.wYear, SystemTime.wMonth, SystemTime.wDay) + TimeSerial(SystemTime.wHour, SystemTime.wMinute, SystemTime.wSecond)
  
  lclose hFile
End Sub
