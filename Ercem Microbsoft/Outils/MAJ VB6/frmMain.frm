VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "MAJ VB6"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstTrace 
      Height          =   2985
      Left            =   60
      TabIndex        =   1
      Top             =   60
      Width           =   3135
   End
   Begin VB.CommandButton btnMAJ 
      Caption         =   "MAJ"
      Height          =   495
      Left            =   3360
      TabIndex        =   0
      Top             =   60
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MAJ VB6
' Effectue la mise à jour des CommonControls du VB5 en version VB6
' en mettant à jour toutes les feuilles d'un projet (mais pas la
' feuille projet elle-même !)
'
' La mise à jour n'est pas automatique par le VB, car ils ne sont pas
' strictement compatibles (d'après la doc), mais en dehors d'une réduction
' de la taille des colonnes du ListView en mode report, je n'ai pas vu
' d'autres problèmes…
'
' Octobre 98, PV

Option Explicit

Dim c As Control

Sub TPrint(sMsg As String)
  lstTrace.AddItem sMsg
  lstTrace.ListIndex = lstTrace.ListCount - 1
End Sub

Private Sub btnMAJ_Click()
  'MAJMVB "d:\microbsoft\tout.mvb"
  MAJProjet "D:\Microbsoft\Outils\FindBrowseMaster\FBM.vbp"
End Sub


' Mise à jour (éventuellement récursive) d'un MVB
Sub MAJMVB(sMVB As String)
  Dim sLigne As String
  Dim f As Integer
  
  f = FreeFile
  Open sMVB For Input As #f
  Line Input #f, sLigne
  If sLigne <> "MAKEVB 1.0" Then Stop
  While Not EOF(f)
    Line Input #f, sLigne
    If StrComp(Right(sLigne, 4), ".vbp", vbTextCompare) = 0 Then
      MAJProjet sLigne
    ElseIf StrComp(Right(sLigne, 4), ".mvb", vbTextCompare) = 0 Then
      MAJMVB sLigne
    Else
      Stop
    End If
  Wend
  Close #f
  TPrint "Terminé !"
End Sub

Sub MAJProjet(ByVal sProjet As String)
  Dim p1 As Integer, p2 As Integer
  Dim sDir As String
  
  p2 = 0
  Do
    p1 = InStr(p2 + 1, sProjet, "\")
    If p1 = 0 Then Exit Do
    p2 = p1
  Loop
  If p2 = 0 Then Stop
  sDir = Left(sProjet, p2)
  
  Dim sFichier As String
  sFichier = Dir(sProjet)
  While sFichier <> ""
    MAJ1Projet sDir & sFichier
    sFichier = Dir
  Wend
End Sub


Sub MAJ1Projet(ByVal sProjet As String)
  Dim sProjet2 As String
  Dim bMAJ As Boolean
  
  TPrint "Projet " & sProjet
  
  If Mid(sProjet, 2, 1) = ":" Then
    ChDrive Left(sProjet, 2)
    sProjet = Mid(sProjet, 3)
  End If
  Dim p1 As Integer, p2 As Integer
  p2 = 0
  Do
    p1 = InStr(p2 + 1, sProjet, "\")
    If p1 = 0 Then Exit Do
    p2 = p1
  Loop
  If p2 = 0 Then Stop
  ChDir Left(sProjet, p2)
  sProjet = Mid(sProjet, p2 + 1)
  
  sProjet2 = sProjet & "2"

  Dim sLigne As String
  Dim fi As Integer, fo As Integer
  
  fi = FreeFile
  Open sProjet For Input As #fi
  fo = FreeFile
  Open sProjet2 For Output As #fo
  While Not EOF(fi)
    Line Input #fi, sLigne
    If InStr(sLigne, "{6B7E6392-850A-101B-AFC0-4210102A8DA7}") <> 0 Then
      sLigne = "Object={831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0; MSCOMCTL.OCX"
      bMAJ = True
    ElseIf Left(sLigne, 5) = "Form=" Then
      MAJForm Mid(sLigne, 6)
    ElseIf Left(sLigne, 12) = "UserControl=" Then
      MAJForm Mid(sLigne, 13)
    End If
    Print #fo, sLigne
  Wend
  Close #fi
  Close #fo
  
  If Not bMAJ Then
    Kill sProjet2
  Else
    On Error Resume Next
    Kill sProjet & ".bak"
    On Error GoTo 0
    Name sProjet As sProjet & ".bak"
    Name sProjet2 As sProjet
  End If
  
  TPrint ""
End Sub


Sub MAJForm(sForm As String)
  Dim sForm2 As String
  Dim bMAJ As Boolean
  
  sForm2 = sForm & "2"
  
  Dim sLigne As String
  TPrint sForm
  Dim fi As Integer, fo As Integer
  
  fi = FreeFile
  Open sForm For Input As #fi
  fo = FreeFile
  Open sForm2 For Output As #fo
  
  bMAJ = False
  While Not EOF(fi)
    Line Input #fi, sLigne
    If InStr(sLigne, "{6B7E6392-850A-101B-AFC0-4210102A8DA7}") <> 0 Then
      sLigne = "Object = ""{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0""; ""MSCOMCTL.OCX"""
      bMAJ = True
    ElseIf InStr(sLigne, "MSMSComctlLib.") <> 0 Then
      sLigne = Subst(sLigne, "MSMSComctlLib.", "MSComctlLib.")
      bMAJ = True
    ElseIf InStr(sLigne, "MSComctlLib.") <> 0 Then
      ' Nop
    ElseIf InStr(sLigne, "ComctlLib.") <> 0 Then
      sLigne = Subst(sLigne, "ComctlLib.", "MSComctlLib.")
      bMAJ = True
    End If
    Print #fo, sLigne
  Wend
  Close #fi
  Close #fo
  
  If Not bMAJ Then
    Kill sForm2
  Else
    On Error Resume Next
    Kill sForm & ".bak"
    On Error GoTo 0
    Name sForm As sForm & ".bak"
    Name sForm2 As sForm
  End If
End Sub

