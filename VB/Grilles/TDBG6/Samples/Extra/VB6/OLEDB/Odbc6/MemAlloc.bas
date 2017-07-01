Attribute VB_Name = "MemAlloc"
Option Explicit

' Memory allocation declares and constants
Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long

Global Const GMEM_MOVEABLE = &H2
Global Const GMEM_ZEROINIT = &H40
Global Const GHND = (GMEM_MOVEABLE Or GMEM_ZEROINIT)
Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)


