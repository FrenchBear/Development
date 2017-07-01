Attribute VB_Name = "modGetIP"
'***************************************************************
' (c) Copyright 2000 Matthew J. Curland
'
' This file is from the CD-ROM accompanying the book:
' Advanced Visual Basic 6: Power Techniques for Everyday Programs
'   Author: Matthew Curland
'   Published by: Addison-Wesley, July 2000
'   ISBN: 0-201-70712-8
'   http://www.PowerVB.com
'
' You are entitled to license free distribution of any application
'   that uses this file if you own a copy of the book, or if you
'   have obtained the file from a source approved by the author. You
'   may redistribute this file only with express written permission
'   of the author.
'
' This file depends on:
'   References:
'     VBoostTypes6.olb (VBoost Object Types (6.0))
'   Files:
'     FunctionDelegator.bas
'   Minimal VBoost conditionals:
'     None
'   Conditional Compilation Values:
'     FUNCTIONDELEGATOR_NOHEAP = 1 'Minimize FunctionDelegator impact
'
' This file is discussed in Chapter 11.
'***************************************************************
Option Explicit

'// Code to get the next instruction in the current function.
'// long GetIP()
'mov eax, [esp] // Get the return address from the current location
'// 8B 04 24
'ret            // Return
'// C3

Private FD As FunctionDelegator
Private Const cGetIPCode As Long = &HC324048B
Private GetIPCode As Long
Private pCallObj As ICallVoidReturnLong
Public Property Get GetIP() As ICallVoidReturnLong
    If pCallObj Is Nothing Then Init
    Set GetIP = pCallObj
End Property
Private Sub Init()
    GetIPCode = cGetIPCode
    Set pCallObj = InitDelegator(FD, VarPtr(GetIPCode))
End Sub
