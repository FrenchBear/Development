VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "MDI Child #"
   ClientHeight    =   1980
   ClientLeft      =   2430
   ClientTop       =   3285
   ClientWidth     =   2940
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1980
   ScaleWidth      =   2940
   Visible         =   0   'False
   WindowState     =   1  'Minimized
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'MDIPaint - Subclassing Demonstration Program
'Copyright (c) 1997 SoftCircuits Programming (R)
'Redistributed by Permission.
'
'This example program demonstrates use of the Subclass OCX control.
'See Examples.txt for information specific to this example.
'
'The accompanying files may be distributed on the condition that they
'are distributed in full and unchanged, and that no fee is charged for
'such distribution with the exception of reasonable shipping and media
'charges. In addition, the code in these example programs may be
'incorporated into your own programs and the resulting programs may be
'distributed without payment of royalties.
'
'This example program was provided by:
' SoftCircuits Programming
' http://www.softcircuits.com
' P.O. Box 16262
' Irvine, CA 92623
'
'Special thanks to Karl Peterson who wrote the original code on which
'this example was based.
Option Explicit
