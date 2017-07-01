Attribute VB_Name = "modTestGetDiskFreeSpaceEx"
Attribute VB_Description = "Implante l'accès à GetDiskFreeSpaceEx, pour les disques FAT32 de plus de 2Go"
' Module modTestGetDiskFreeSpaceEx
' Implante l'accès à GetDiskFreeSpaceEx, pour les disques FAT32 de plus de 2Go
' Retourne des currency, integers sur 8 octets avec décalage de 10000 en VB
' 29/11/1997 PV

Option Explicit

Public Declare Function GetDiskFreeSpaceEx Lib "Kernel32" Alias "GetDiskFreeSpaceExA" (ByVal lpRootPathName As String, ByRef FreeBytesAvailableToCaller As Currency, ByRef TotalNumberOfBytes As Currency, ByRef TotalNumberOfFreeBytes As Currency) As Boolean


Public Function VbGetDiskFreeSpaceEx(ByVal lpRootPathName As String, ByRef FreeBytesAvailableToCaller As Currency, ByRef TotalNumberOfBytes As Currency, ByRef TotalNumberOfFreeBytes As Currency) As Boolean
  Dim bRet As Integer
  bRet = GetDiskFreeSpaceEx(lpRootPathName, FreeBytesAvailableToCaller, TotalNumberOfBytes, TotalNumberOfFreeBytes)
  If bRet Then
    FreeBytesAvailableToCaller = FreeBytesAvailableToCaller * 10000
    TotalNumberOfBytes = TotalNumberOfBytes * 10000
    TotalNumberOfFreeBytes = TotalNumberOfFreeBytes * 10000
  End If
  VbGetDiskFreeSpaceEx = bRet
End Function


