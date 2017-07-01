Attribute VB_Name = "Fichier"
' Fichier
' Gère un fichier dans l'analyse d'un projet
' 18/02/1998 PV

Option Explicit

Enum eTypeFichier
  tfFeuille
  tfModule
  tfClasse
  tfUserControl
End Enum

Public tfTypeFichier As eTypeFichier
Public sNomFichier As String


Public Sub AnalyseFichier(ByVal sFichier As String)
  Dim i As Integer, s As String, s2 As String
  
  sNomFichier = sFichier
  
  For i = Len(sFichier) To 1 Step -1
    If Mid(sFichier, i, 1) = "." Then Exit For
  Next
  Select Case LCase(Mid(sFichier, i + 1))
    Case "frm": tfTypeFichier = tfFeuille
    Case "bas": tfTypeFichier = tfModule
    Case "cls": tfTypeFichier = tfClasse
    Case "ctl": tfTypeFichier = tfUserControl
    Case Else: Stop
  End Select
  
  Open sFichier For Input As #1
  InitModule
  
  s = Left(sFichier, i) & "token"
  Open s For Output As #2
  
  Do
    NextLigneModule
    If bFinModule Then Exit Do
    s = sTypeLigne(tlTypeLigne)
    s2 = sEtatLigne(elEtat)
    AnalyseSymboles
    
    Print #2, clf(s2, 11); clf(s, 15);
    For i = 1 To iNbToken
      Print #2, "<"; tToken(i); "> ";
    Next
    Print #2, ""
    
    If tlTypeLigne = tlEndSub Then
      SorTableSymboles poLocal
      sNomProcédureCourante = ""    ' Bâtard de le placer là, mais…
    End If
  Loop
  
  SorTableSymboles poModule
  
  Close #2
  Close #1
  
End Sub


