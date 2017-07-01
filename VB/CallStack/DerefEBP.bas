Attribute VB_Name = "modDerefEBP"
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

'//Code to get the current base pointer, offset, and deref it
'mov ecx, [esp + 4]
'//8B 4C 24 04
'mov eax, [ebp + ecx]
'//8B 44 0D 00
'ret 4
'//C2 04 00

Private Type DerefEBPCode
    Code(2) As Long
End Type
Private FD As FunctionDelegator
Private DerefEBPCode As DerefEBPCode
Private pCallObj As ICallLongReturnLong
Public Function DerefEBP() As ICallLongReturnLong
    If pCallObj Is Nothing Then Init
    Set DerefEBP = pCallObj
End Function
Private Sub Init()
    With DerefEBPCode
        .Code(0) = &H4244C8B
        .Code(1) = &HD448B
        .Code(2) = &H900004C2
    End With
    Set pCallObj = InitDelegator(FD, VarPtr(DerefEBPCode))
End Sub

