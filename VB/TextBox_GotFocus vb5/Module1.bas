Attribute VB_Name = "Module1"
Option Explicit

Global Const VK_TAB = 9
Global Const VK_LSHIFT = &HA0
Global Const HELP_CONTEXT = &H1
Global Const HELP_QUIT = &H2

Declare Function GetKeyState% Lib "User32" (ByVal nVirtKey%)


