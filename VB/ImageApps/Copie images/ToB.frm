VERSION 5.00
Begin VB.Form frmToB 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "CopieImages ""intelligent"""
   ClientHeight    =   5235
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8925
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5235
   ScaleWidth      =   8925
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnSansCrocUn 
      Caption         =   "Enlève les [1]"
      Height          =   495
      Left            =   7560
      TabIndex        =   2
      Top             =   960
      Width           =   1215
   End
   Begin VB.ListBox lstFichiers 
      Height          =   4935
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   7155
   End
   Begin VB.CommandButton btnGo 
      Caption         =   "Go !"
      Height          =   495
      Left            =   7560
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmToB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Déplaceur de fichiers "intelligent"
' Copie les images dans .. en les renommant avec un suffixe b, c, ... pour ne pas écraser
' 13/01/98 PV Liste
'  1/06/98 PV Bufférisation
'  4/08/98 PV Restructuration des répertoires
' 28/02/99 PV 1 niveau supplémentaire dans sPathDest (1ère lettre)

Option Explicit

Const iTailleBufferMax As Integer = 1
Dim iTailleBufferMove As Integer
Dim sBufferSource As String, sBufferDest As String

Dim sBufferDelete As String
Dim iTailleBufferDelete As Integer

Const sPathSource As String = "C:\XNews\"
Const sPathDest As String = "D:\Pic2\pic\"

Private Sub btnGo_Click()
  btnGo.Enabled = False
  ChDrive Left(sPathSource, 2)
  ChDir sPathSource
  DoFic "*.jpg"
  DoFic "*.jpeg"
  DoFic "*.gif"
  
  ' Vidage final du buffer
  If iTailleBufferMove > 0 Then DéplaceFichier hwnd, sBufferSource, sBufferDest
  If iTailleBufferDelete > 0 Then EffaceFichierCorbeille hwnd, sBufferDelete
  
  'Beep
  MsgBox "Terminé", vbExclamation, "CopieImages"
  btnGo.Enabled = True
  End
End Sub

Sub DoFic(ByVal sMotif As String)
  Dim sFic As String, sFicP As String
  sFic = Dir(sMotif, vbArchive + vbNormal + vbReadOnly)
  While sFic <> ""
    Dim sLettre As String
    
    sLettre = LCase(Left(sFic, 1))
    If sLettre < "a" Or sLettre > "z" Then sLettre = "0"
    sFicP = sPathDest & sLettre & "\" & sFic
    
    Dim pp As Integer
    Dim sBase As String, sSuffixe As String
    pp = Len(sFic) - 1
    While Mid(sFic, pp, 1) <> "."
      pp = pp - 1
    Wend
    sBase = Left(sFic, pp - 1)
    sSuffixe = Mid(sFic, pp + 1)
    
    Dim iLettre As Integer
    iLettre = Asc("b")
    Do While bFileExist(sFicP)
      If FileLen(sFic) = FileLen(sFicP) Then
        sFicP = ""      ' Existe, même nom et même taille: on efface
        Exit Do
      End If
      sFicP = sPathDest & sLettre & "\" & sBase & Chr(iLettre) & "." & sSuffixe
      iLettre = iLettre + 1
    Loop
    
    lstFichiers.AddItem sFic & Chr(9) & sFicP
    lstFichiers.ListIndex = lstFichiers.ListCount - 1
    Refresh
    DoEvents
    
    If sFicP = "" Then
      EffaceFichierBufferisé sPathSource & sFic
    Else
      DéplaceFichierBufferisé sPathSource & sFic, sFicP
    End If

    sFic = Dir
  Wend
End Sub

Function bFileExist(sNomfic As String)
  On Error Resume Next
  Open sNomfic For Input As #1
  If Err Then
    bFileExist = False
  Else
    bFileExist = True
    Close #1
  End If
End Function

Function DéplaceFichierBufferisé(ByVal sSource As String, ByVal sDest As String) As Long
  sBufferSource = sBufferSource & sSource & vbNullChar
  sBufferDest = sBufferDest & sDest & vbNullChar
  iTailleBufferMove = iTailleBufferMove + 1
  If iTailleBufferMove >= iTailleBufferMax Then
    DéplaceFichierBufferisé = DéplaceFichier(hwnd, sBufferSource, sBufferDest)
    sBufferSource = ""
    sBufferDest = ""
    iTailleBufferMove = 0
  Else
    DéplaceFichierBufferisé = 0
  End If
End Function

Function EffaceFichierBufferisé(ByVal sSource As String) As Long
  sBufferDelete = sBufferDelete & sSource & vbNullChar
  iTailleBufferDelete = iTailleBufferDelete + 1
  If iTailleBufferDelete >= iTailleBufferMax Then
    EffaceFichierBufferisé = EffaceFichierCorbeille(hwnd, sBufferDelete)
    sBufferDelete = ""
    iTailleBufferDelete = 0
  Else
    EffaceFichierBufferisé = 0
  End If
End Function

' =================================================================================
' Substitution de chaînes

' Remplace toutes les occurrences de sCherche dans sSource par sRemplace
Public Function Subst(ByVal sSource As String, ByVal sCherche As String, ByVal sRemplace As String) As String
  Dim p As Integer, iStart As Integer
  iStart = 1
  Do
    p = InStr(iStart, sSource, sCherche)
    If p = 0 Then Exit Do
    sSource = Left(sSource, p - 1) & sRemplace & Mid(sSource, p + Len(sCherche))
    iStart = p + Len(sRemplace)
  Loop
  Subst = sSource
End Function


Private Sub btnSansCrocUn_Click()
  Dim sNom As String, sNouveauNom As String
  
  ChDrive Left(sPathSource, 2)
  ChDir sPathSource
  sNom = Dir("*.*")
  Do While sNom <> ""
    If InStr(sNom, "[1]") <> 0 Then
      sNouveauNom = Subst(sNom, "[1]", "")
      lstFichiers.AddItem sNom & " -> " & sNouveauNom
      On Error Resume Next
      Name sNom As sNouveauNom
      If Err = 0 Then sNom = sNouveauNom
      On Error GoTo 0
    End If
    
    If InStr(LCase(sNom), ".jpeg") <> 0 Then
      sNouveauNom = Subst(sNom, ".jpeg", ".jpg")
      lstFichiers.AddItem sNom & " -> " & sNouveauNom
      On Error Resume Next
      Name sNom As sNouveauNom
      If Err = 0 Then sNom = sNouveauNom
      On Error GoTo 0
    End If

    sNom = Dir
  Loop
End Sub
