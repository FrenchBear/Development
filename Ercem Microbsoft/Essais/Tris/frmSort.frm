VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5160
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   5160
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      Height          =   450
      Left            =   3120
      Sorted          =   -1  'True
      TabIndex        =   1
      Top             =   1020
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   3060
      TabIndex        =   0
      Top             =   360
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const NR = 10
Const NE As Integer = 1000
Dim c As Collection

Dim ti

Private Sub Command1_Click()
  Dim j As Integer
  Dim tiTot, tjTot, tkTot, tlTot
  Dim tt() As Integer
  
  For j = 1 To NR
    
    Cls
    Randomize -j
    List1.Clear
    
    Dim t(NE) As String
    Dim i As Integer
    For i = 0 To NE
      t(i) = Mid(Rnd, 2)
    Next
    
    Dim tj
    tj = Timer
    For i = 0 To NE
      List1.AddItem t(i)
    Next
    tj = Timer - tj
    tjTot = tjTot + tj
    Print "Liste: "; tj; "(s)"
    For i = 0 To 3
      Print List1.List(i)
    Next
    Print
    
  '  ' Quicksort
  '  Dim ti
  '  ti = Timer
  '  QuickSort t, 0, NE
  '  ti = Timer - ti
  '  titot=titot+ti
  '  Print "QuickSort: "; ti; "(s)"
  '  For i = 0 To 3
  '    Print t(i)
  '  Next
    
    ' Insertion/collection
    Set c = New Collection
    Dim tk
    Dim bi As Integer, bs As Integer, nb As Integer
    tk = Timer
    For i = 0 To NE
      bi = 1
      bs = c.Count + 1
      If bi = bs Then
        c.Add t(i)
      Else
        While bs - bi > 1
          nb = (bs + bi) \ 2
          If t(i) > c(nb) Then
            bi = nb
          Else
            bs = nb
          End If
        Wend
        If t(i) > c(bi) Then
          c.Add t(i), , , bi
        Else
          c.Add t(i), , bi
        End If
      End If
    Next
    tk = Timer - tk
    tkTot = tkTot + tk
    Print "Insertion/collection: "; tk; "(s)"
    For i = 1 To 4
      Print c(i)
    Next
    
    
    ' Insertion/tableau
    ReDim tt(NE)
    Dim tl
    tl = Timer
    For i = 0 To NE
      bi = 1
      bs = c.Count + 1
      If bi = bs Then
        c.Add t(i)
      Else
        While bs - bi > 1
          nb = (bs + bi) \ 2
          If t(i) > c(nb) Then
            bi = nb
          Else
            bs = nb
          End If
        Wend
        If t(i) > c(bi) Then
          c.Add t(i), , , bi
        Else
          c.Add t(i), , bi
        End If
      End If
    Next
    tl = Timer - tl
    tlTot = tlTot + tl
    Print "Insertion/tableau: "; tl; "(s)"
    For i = 1 To 4
      Print c(i)
    Next
    
    
    
'    For i = 0 To NE
'      If List1.List(i) <> c(i + 1) Then
'        Print "************************"
'        Stop
'      End If
'    Next
'
    Set c = Nothing
    
  Next
  
  Print
  Print "t moy liste"; tjTot / NR
  Print "t moy insco"; tkTot / NR
  Print "t moy insta"; tlTot / NR
End Sub

