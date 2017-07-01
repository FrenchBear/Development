Attribute VB_Name = "modApiErrorText"
Option Explicit

Private Declare Function FormatMessage Lib "kernel32" Alias "FormatMessageA" (ByVal dwFlags As Long, lpSource As Any, ByVal dwMessageId As Long, ByVal dwLanguageId As Long, ByVal lpBuffer As String, ByVal nSize As Long, Arguments As Long) As Long

Private Const FORMAT_MESSAGE_FROM_SYSTEM As Long = &H1000

Public Function ApiErrorText(ByVal ErrNum As Long) As String
  Dim msg As String
  Dim nRet As Long
  msg = Space$(1024)
  nRet = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, ByVal 0&, ErrNum, 0&, msg, Len(msg), ByVal 0&)
  If nRet Then
     ApiErrorText = Left$(msg, nRet - 2)
  Else
     ApiErrorText = ""
  End If
End Function


