Attribute VB_Name = "modCP"
Option Explicit

Public Declare Function GetOEMCP Lib "kernel32" () As Integer
Public Declare Function GetACP Lib "kernel32" () As Integer

Public Declare Function GetThreadLocale Lib "kernel32" () As Long
Public Declare Function SetThreadLocale Lib "kernel32" (ByVal lcid As Long) As Long

Public Declare Function GetLastError Lib "kernel32" () As Long
