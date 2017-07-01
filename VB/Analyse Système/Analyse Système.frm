VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7350
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7515
   LinkTopic       =   "Form1"
   ScaleHeight     =   7350
   ScaleWidth      =   7515
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      Height          =   7080
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   6255
   End
   Begin VB.CommandButton btnAnalyse 
      Caption         =   "&Analyse"
      Height          =   375
      Left            =   6480
      TabIndex        =   0
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Analyse Système
' Analyse un ensemble de fichiers de configuration système
' produits par Windows 95 pour en faire un fichier à analyser
' par un tableau croisé
' PV mai 97

Option Explicit

Public g_sMachine As String

Private Sub btnAnalyse_Click()
  Dim colRep As New Collection
  Dim f As String
  
  f = Dir("p:\ercem grenoble\*", vbDirectory)
  Do While f <> ""
    If f <> "." And f <> ".." Then
      colRep.Add f
    End If
    f = Dir
  Loop
  
  Dim v
  Open "c:\analyse.txt" For Output As #9
  Print #9, "Système"; Chr(9); "Clé"; Chr(9); "Valeur"
  For Each v In colRep
    f = Dir("p:\ercem grenoble\" & v & "\sys*.txt")
    Analyse1Fic v, "p:\ercem grenoble\" & v & "\" & f
  Next
  Close #9
End Sub

Sub Analyse1Fic(ByVal sMachine As String, sPath As String)
  g_sMachine = sMachine
  
  Open sPath For Input As #1
  InfosSystème
  GetIRQ
  GetDMA
  GetRéseau
  GetRab
  Close #1
End Sub

Sub InfosSystème()
  ChampSystème "Version Windows"
  ChampSystème "Type de processeur"
  ChampSystème "Type de BUS systeme"
  ChampSystème "Nom BIOS"
  ChampSystème "Date BIOS"
  ChampSystème "Version BIOS"
  ChampSystème "Type de machine"
  ChampSystème "Coprocesseur arithmetique"
  ChampSystème "Proprietaire inscrit"
  ChampSystème "Organisation inscrite"
End Sub

Sub ChampSystème(sChamp As String)
  Dim l As String, p As Integer
  l = GetLigne(sChamp)
  p = InStr(l, ":")
  l = Mid(l, p + 1)
  AddLigne sChamp, sTrim(l)
End Sub


Sub GetIRQ()
  Dim l As String
  l = GetLigne("Resume de l'utilisation IRQ")
  Do
    Line Input #1, l
    If InStr(l, "*********") <> 0 Then Exit Do
    l = LTrim(l)
    If Left(l, 1) = "*" Then
      l = Mid(l, 2)
    End If
    AddLigne "IRQ " & Left(l, 2), sTrim(Mid(l, 6))
  Loop
End Sub


Sub GetDMA()
  Dim l As String
  l = GetLigne("Resume de l'utilisation du canal DMA")
  Do
    Line Input #1, l
    If InStr(l, "*********") <> 0 Then Exit Do
    l = LTrim(l)
    If Left(l, 1) = "*" Then l = Mid(l, 2)
    AddLigne "DMA " & Left(l, 2), sTrim(Mid(l, 6))
  Loop
End Sub


Sub GetRéseau()
  Dim l As String, p As Integer
  l = GetLigne("Classe : Cartes reseau")
  l = GetLigne("Peripherique")
  p = InStr(l, ":")
  AddLigne "Carte réseau", sTrim(Mid(l, p + 1))
  l = GetLigne("Ressources")
  Do
    Line Input #1, l
    If InStr(l, "Classe") <> 0 Then Exit Do
    l = LTrim(l)
    p = InStr(l, ":")
    If p = 0 Then Exit Do
    AddLigne "Réseau " & sTrim(Left(l, p - 1)), sTrim(Mid(l, p + 1))
  Loop
End Sub


Sub GetRab()
  Dim i As Integer
  Dim l As String, p As Integer, sClé As String, sVersion As String, sTaille As String
  AddFichier "", "", ""
  While Not EOF(1)
    Line Input #1, l
    If UCase(Right(l, 4)) = ".DRV" Or UCase(Right(l, 4)) = ".DLL" Or UCase(Right(l, 4)) = ".EXE" Or UCase(Right(l, 4)) = ".VXD" Then
      If sClé <> "" And sVersion <> "" And sTaille <> "" Then AddFichier sClé, sTaille, sVersion: sClé = ""
      sTaille = ""
      sVersion = ""
      For i = Len(l) To 1 Step -1
        If Mid(l, i, 1) = "\" Then
          sClé = Mid(l, i + 1)
          Exit For
        End If
      Next
    ElseIf InStr(l, "Version du fichier") <> 0 Then
      If sClé <> "" And sVersion <> "" And sTaille <> "" Then AddFichier sClé, sTaille, sVersion: sClé = ""
      p = InStr(l, ":")
      sVersion = sTrim(Mid(l, p + 1))
    ElseIf InStr(l, "Taille de fichier") <> 0 Then
      If sClé <> "" And sVersion <> "" And sTaille <> "" Then AddFichier sClé, sTaille, sVersion: sClé = ""
      p = InStr(l, ":")
      sTaille = sTrim(Mid(l, p + 1))
    End If
  Wend
  If sClé <> "" And sVersion <> "" And sTaille <> "" Then AddFichier sClé, sTaille, sVersion
End Sub

Sub AddFichier(ByVal sClé As String, ByVal sTaille As String, ByVal sVersion As String)
  Static colFichier As New Collection
  
  If sClé = "" Then
    While colFichier.Count > 0
      colFichier.Remove 1
    Wend
    Exit Sub
  End If
  
  sClé = LCase(sClé)
  On Error GoTo fin
  colFichier.Add "", sClé
  
  AddLigne sClé, sTaille & " " & sVersion
fin:
  Exit Sub
End Sub


Function IsSpace(s As String) As Boolean
  IsSpace = (s = " ") Or (s = Chr(9)) Or (s = Chr(10)) Or (s = Chr(12)) Or (s = Chr(13))
End Function

Function sTrim(ByVal l As String) As String
  While IsSpace(Left(l, 1))
    l = Mid(l, 2)
  Wend
  While IsSpace(Right(l, 1))
    l = Left(l, Len(l) - 1)
  Wend
  sTrim = l
End Function

Function GetLigne(sMotif As String) As String
  Dim l As String
  While Not EOF(1)
    Line Input #1, l
    If InStr(l, sMotif) <> 0 Then
      GetLigne = l
      Exit Function
    End If
  Wend
  GetLigne = ""
End Function


Function AddLigne(sClé As String, sValeur As String)
  List1.AddItem g_sMachine & Chr(9) & sClé & Chr(9) & sValeur
  Print #9, g_sMachine & Chr(9) & sClé & Chr(9) & sValeur
End Function
