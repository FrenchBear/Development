VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8460
   ClientLeft      =   2865
   ClientTop       =   1455
   ClientWidth     =   6645
   Height          =   8865
   Left            =   2805
   LinkTopic       =   "Form1"
   ScaleHeight     =   8460
   ScaleWidth      =   6645
   Top             =   1110
   Width           =   6765
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   3240
      TabIndex        =   1
      Top             =   1080
      Width           =   1215
   End
   Begin VB.ListBox List1 
      Height          =   2595
      Left            =   720
      TabIndex        =   0
      Top             =   1080
      Width           =   1935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Const MaxBins = 6

Private Type PaperBin ' Used for EnumPaperBins
  BinList(1 To MaxBins) As Integer
  PaperNames(1 To MaxBins) As String * 24
End Type

Private Type BinInfo ' Used for GetSetPaperBins
  CurBinNumber As Integer  ' Current Bin
  NumBins As Integer       ' Number of bins supported by printer
  Reserved1 As Integer     ' Reserved
  Reserved2 As Integer     ' Reserved
  Reserved3 As Integer     ' Reserved
  Reserved4 As Integer     ' Reserved
End Type

' Enter each of the following Declare statements on one, single line.

'Private Declare Function GetPaperBinEscape Lib "gdi32" Alias "Escape" (ByVal hdc As Long, ByVal nEscape As Long, ByVal nCount As Long, InBinInfo As Any, OutBinInfo As Any) As Long
'Private Declare Function EnumPaperBinEscape Lib "gdi32" Alias "Escape" (ByVal hdc As Long, ByVal nEscape As Long, ByVal nCount As Long, NumBins%, lpOutData As Any) As Long
'Private Declare Function Escape Lib "gdi32" (ByVal hdc As Long, ByVal nEscape As Long, ByVal nCount As Long, ByVal lpInData As String, lpOutData As Any) As Long

' 16 bits
Private Declare Function EnumPaperBinEscape% Lib "GDI" Alias "Escape" (ByVal hDC%, ByVal nEscape%, ByVal nCount%, NumBins%, lpOutData As Any)
Private Declare Function GetPaperBinEscape% Lib "GDI" Alias "Escape" (ByVal hDC%, ByVal nEscape%, ByVal nCount%, InBinInfo As Any, OutBinInfo As Any)

Const ENUMPAPERBINS = 31
Const GETSETPAPERBINS = 29

Private Sub Command1_Click()
  Dim InPaperBin As PaperBin
  Dim InBinInfo As BinInfo
  Dim result As Long, I As Integer
  
  ' Enter each of the following result% statements on one, single line:
  result = GetPaperBinEscape(Printer.hDC, GETSETPAPERBINS, 0, ByVal 0&, InBinInfo)
'  MsgBox "result GetPaperBinEscape: " & result
  result = EnumPaperBinEscape(Printer.hDC, ENUMPAPERBINS, 2, MaxBins, InPaperBin)
'  MsgBox "result EnumPaperBinEscape: " & result
  List1.Clear
  For I = 1 To InBinInfo.NumBins ' Fill list1 with available bins
     List1.AddItem InPaperBin.PaperNames(I)
     List1.ItemData(List1.NewIndex) = InPaperBin.BinList(I)
  Next I
End Sub


Sub List1_Click()
  Dim InBinInfo As BinInfo
  Dim NewBinInfo As BinInfo
  Dim result As Integer

  NewBinInfo.CurBinNumber = List1.ItemData(List1.ListIndex)
  ' Enter the following result% statement on one, single line.
  result = GetPaperBinEscape(Printer.hDC, GETSETPAPERBINS, Len(NewBinInfo), NewBinInfo, NewBinInfo)

  MsgBox "Sending Sample Output to printer using Bin: " + List1.Text
  Printer.Print "This should of have come from Bin: "; List1.Text
  Printer.EndDoc
End Sub
