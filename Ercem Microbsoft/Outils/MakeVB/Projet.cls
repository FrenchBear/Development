VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Projet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' classe Projet
' Gère les infos d'un projet VB
' 18/05/1998 PV


Option Explicit

Public sPath As String          ' Chemin du projet
Public sTitre As String         ' Titre du projet
Public sExeName As String       ' Nom du .exe
Public sExePath As String       ' Répertoire du .exe
Public sEtatDétaillé As String

Public Enum eEtat
  ePasAnalysé = 0
  eAJour            ' Tout est Ok
  eAGénérer         ' Exécutable non trouvé ou pas à jour
  eErreur           ' Dépendance non trouvée ou erreur d'accès
End Enum

Public état As eEtat

Public Function bAGénérer() As Boolean
  bAGénérer = état = eAGénérer
End Function

Public Function sEtat() As String
  Select Case état
    Case ePasAnalysé: sEtat = "Pas analysé"
    Case eAJour:      sEtat = "A jour"
    Case eAGénérer:   sEtat = "A générer"
    Case eErreur:     sEtat = "Erreur !"
  End Select
End Function


Public Function bLire(ByVal sNomProj As String) As Boolean
  sPath = sNomProj
  
  Dim fProj As Integer
  Dim sLigne As String, sClé As String, sValeur As String, sDép As String
  Dim sNomDép As String, sNomDépMax As String
  Dim p As Integer
  Dim dDépMax As Date
  
  dDépMax = 0
  fProj = FreeFile
  On Error GoTo ProblèmeOuverture
  Open sNomProj For Input As #fProj
  ChDrive sNomProj
  ChDir sPathPart(sNomProj)
  On Error GoTo ProblèmeDépendance
  While Not EOF(fProj)
    Line Input #fProj, sLigne
    If sLigne = "" Then GoTo Continue
    If Left(sLigne, 1) = "[" Then GoTo Terminé
    
    p = InStr(sLigne, "=")
    Debug.Assert p > 0
    sClé = Left(sLigne, p - 1)
    sValeur = Mid(sLigne, p + 1)
    sDép = ""
    Select Case sClé
      Case "Name": sTitre = Mid(sValeur, 2, Len(sValeur) - 2)
      Case "ExeName32": sExeName = Mid(sValeur, 2, Len(sValeur) - 2)
      Case "Path32": sExePath = Mid(sValeur, 2, Len(sValeur) - 2)
      Case "Form", "PropertyPage"    ', "UserControl"
        sNomDép = sClé & " " & sValeur
        sDép = sValeur
      Case "Module", "Class":
        p = InStr(sValeur, ";")
        Debug.Assert p > 0
        sNomDép = sClé & " " & Left(sValeur, p - 1)
        sDép = Trim(Mid(sValeur, p + 1))
    End Select
    If sDép <> "" Then
      Dim dDép As Date
      dDép = FileDateTime(sDép)
      If dDép > dDépMax Then
        dDépMax = dDép
        sNomDépMax = sNomDép
      End If
    End If
Continue:
  Wend
Terminé:
  Close #fProj
  
  If sExeName = "" Then
    état = eErreur
    sEtatDétaillé = "Pas de nom d'exécutable !"
    bLire = False
    Exit Function
  End If
  
  If sExePath = "" Then sExePath = "."
  Dim dExe As Date
  On Error Resume Next
  dExe = FileDateTime(sExePath & "\" & sExeName)
  If Err = 53 Then   ' Fichier inexistant
    dExe = 0
  ElseIf Err <> 0 Then
    bLire = False
    état = eErreur
    sEtatDétaillé = "Échec lors de l'accès à l'exécutable '" & sExeName & "' : " & Err.Number & " (" & Err.Source & "): " & Err.Description
    Exit Function
  End If
  
  If dExe < dDépMax Then
    état = eAGénérer
    sEtatDétaillé = sNomDépMax & " plus récent que " & sExeName
  Else
    état = eAJour
    sEtatDétaillé = ""
  End If
  bLire = True
  Exit Function
  
ProblèmeOuverture:
  bLire = False
  état = eErreur
  sEtatDétaillé = "Échec à l'ouverture du projet: " & Err.Number & " (" & Err.Source & "): " & Err.Description
  Close #fProj  ' si échec à l'ouverture ???
  Exit Function
  
ProblèmeDépendance:
  bLire = False
  état = eErreur
  sEtatDétaillé = "Échec lors de l'accès à la dépendance '" & sDép & "' : " & Err.Number & " (" & Err.Source & "): " & Err.Description
  Close #fProj
  Exit Function
End Function

