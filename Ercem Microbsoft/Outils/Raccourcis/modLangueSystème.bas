Attribute VB_Name = "modLangueSyst�me"
' modLangueSysteme
' D�clarations globales pour les raccourcis
' 26/10/2000 PV   ' S�paration de modGlobal

Option Explicit

Public Declare Function GetSystemDefaultLangID Lib "kernel32" () As Integer

Public Const LANG_ENGLISH = &H9
Public Const LANG_DUTCH = &H13
Public Const LANG_FRENCH = &HC
Public Const LANG_GERMAN = &H7
Public Const LANG_ITALIAN = &H10
Public Const LANG_SPANISH = &HA
Public Const LANG_POLISH = &H15


Public Function LangueSyst�me() As Integer
  LangueSyst�me = GetSystemDefaultLangID And &H3FF
End Function


  
