VERSION 5.00
Begin VB.Form frmQuatuor 
   AutoRedraw      =   -1  'True
   Caption         =   "Form1"
   ClientHeight    =   7875
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8460
   LinkTopic       =   "Form1"
   ScaleHeight     =   7875
   ScaleWidth      =   8460
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   6960
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "frmQuatuor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim nbSol As Integer
Const TMAX = 25


Private Sub Command1_Click()
  Dim G As Integer
  Dim D As Integer
  Dim E As String
  
  
  G = 1 + 2 + 4 + 8
  D = 0
  
  E = "<ABCD|>"
  Mouvement True, G, D, 0, "", E
  MsgBox "Terminé, " & nbSol & " solutions en temps <= " & TMAX
End Sub


Function Etat(ByVal X As Integer, ByVal Y As Integer) As String
  Dim i As Integer
  Dim sRes As String
  For i = 1 To 4
    If MembrePrésent(X, i) Then sRes = sRes & Chr(64 + i)
  Next
  sRes = sRes & "|"
  For i = 1 To 4
    If MembrePrésent(Y, i) Then sRes = sRes & Chr(64 + i)
  Next
  Etat = sRes
End Function


Sub Mouvement(ByVal bSensGD As Boolean, ByVal G As Integer, ByVal D As Integer, ByVal T As Integer, ByVal P As String, ByVal E As String)
  If T > TMAX Then Exit Sub
  
  If G = 0 And D = 15 Then
    Print T & ": " & P
    nbSol = nbSol + 1
    Exit Sub
  End If
  
  Dim i As Integer
  Dim j As Integer
  Dim G2 As Integer
  Dim D2 As Integer
  Dim T2 As Integer
  Dim P2 As String
  Dim E2 As String
  
  If bSensGD Then
  
    For i = 1 To 4
      For j = i To 4
        If MembrePrésent(G, i) And MembrePrésent(G, j) Then
          G2 = G
          D2 = D
          EnlèveMembre G2, i
          EnlèveMembre G2, j
          AjouteMembre D2, i
          AjouteMembre D2, j
          
          If InStr(1, E, "<" & Etat(G2, D2) & ">") = 0 Then
            T2 = T + Max(Temps(i), Temps(j))
            P2 = P
            If P <> "" Then P2 = P2 & ", "
            P2 = P2 & Chr(64 + i)
            If i <> j Then P2 = P2 & Chr(64 + j)
            P2 = P2 & "->"
            
            E2 = E & "<" & Etat(G2, D2) & ">"
            Mouvement False, G2, D2, T2, P2, E2
          End If
        End If
      Next
    Next
        
  Else
  
    For i = 1 To 4
      For j = i To 4
        If MembrePrésent(D, i) And MembrePrésent(D, j) Then
          G2 = G
          D2 = D
          EnlèveMembre D2, i
          EnlèveMembre D2, j
          AjouteMembre G2, i
          AjouteMembre G2, j
          
          If InStr(1, E, "<" & Etat(G2, D2) & ">") = 0 Then
            T2 = T + Max(Temps(i), Temps(j))
            P2 = P
            If P <> "" Then P2 = P2 & ", "
            P2 = P2 & Chr(64 + i)
            If i <> j Then P2 = P2 & Chr(64 + j)
            P2 = P2 & "<-"
            
            E2 = E & "<" & Etat(G2, D2) & ">"
            Mouvement True, G2, D2, T2, P2, E2
          End If
        End If
      Next
    Next
  
  End If
End Sub



Function Temps(i As Integer) As Integer
  Select Case i
    Case 1: Temps = 1
    Case 2: Temps = 2
    Case 3: Temps = 5
    Case 4: Temps = 10
  End Select
End Function


Function Max(a As Integer, b As Integer) As Integer
  If a > b Then
    Max = a
  Else
    Max = b
  End If
End Function



Function MembrePrésent(X As Integer, i As Integer) As Boolean
  MembrePrésent = (X And (2 ^ (i - 1))) = (2 ^ (i - 1))
End Function

Sub AjouteMembre(ByRef X As Integer, i As Integer)
  X = X Or (2 ^ (i - 1))
End Sub

Sub EnlèveMembre(ByRef X As Integer, i As Integer)
  X = X And Not (2 ^ (i - 1))
End Sub

