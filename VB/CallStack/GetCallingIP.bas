Attribute VB_Name = "modGetCallingIP"
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

'// Code to get the next instruction in the calling function.
'// Note that this only works if the compiler generated enough
'// code to warrant pushing a base pointer in the calling
'// function, but calling GetCallingIP.Call is sufficient so
'// this isn't a problem in practice.
'// long GetCallingIP()
'mov eax, [ebp + 4] // Get the return address off the stack
'// 8B 45 04
'ret                // Return
'// C3


Private FD As FunctionDelegator
Private Const cGetCallingIPCode As Long = &HC304458B
Private GetCallingIPCode As Long
Private pCallObj As ICallVoidReturnLong
Public Property Get GetCallingIP() As ICallVoidReturnLong
    If pCallObj Is Nothing Then Init
    Set GetCallingIP = pCallObj
End Property
Private Sub Init()
    GetCallingIPCode = cGetCallingIPCode
    Set pCallObj = InitDelegator(FD, VarPtr(GetCallingIPCode))
End Sub
