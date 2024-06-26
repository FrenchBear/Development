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
' G�re les infos d'un projet VB
' 18/05/1998 PV


Option Explicit

Public sPath As String          ' Chemin du projet
Public sTitre As String         ' Titre du projet
Public sExeName As String       ' Nom du .exe
Public sExePath As String       ' R�pertoire du .exe
Public sEtatD�taill� As String

Public Enum eEtat
  ePasAnalys� = 0
  eAJour            ' Tout est Ok
  eAG�n�rer         ' Ex�cutable non trouv� ou pas � jour
  eErreur           ' D�pendance non trouv�e ou erreur d'acc�s
End Enum

Public �tat As eEtat

Public Function bAG�n�rer() As Boolean
  bAG�n�rer = �tat = eAG�n�rer
End Function

Public Function sEtat() As String
  Select Case �tat
    Case ePasAnalys�: sEtat = "Pas analys�"
    Case eAJour:      sEtat = "A jour"
    Case eAG�n�rer:   sEtat = "A g�n�rer"
    Case eErreur:     sEtat = "Erreur !"
  End Select
End Function


Public Function bLire(ByVal sNomProj As String) As Boolean
  sPath = sNomProj
  
  Dim fProj As Integer
  Dim sLigne As String, sCl� As String, sValeur As String, sD�p As String
  Dim sNomD�p As String, sNomD�pMax As String
  Dim p As Integer
  Dim dD�pMax As Date
  
  dD�pMax = 0
  fProj = FreeFile
  On Error GoTo Probl�meOuverture
  Open sNomProj For Input As #fProj
  ChDrive sNomProj
  ChDir sPathPart(sNomProj)
  On Error GoTo Probl�meD�pendance
  While Not EOF(fProj)
    Line Input #fProj, sLigne
    If sLigne = "" Then GoTo Continue
    If Left(sLigne, 1) = "[" Then GoTo Termin�
    
    p = InStr(sLigne, "=")
    Debug.Assert p > 0
    sCl� = Left(sLigne, p - 1)
    sValeur = Mid(sLigne, p + 1)
    sD�p = ""
    Select Case sCl�
      Case "Name": sTitre = Mid(sValeur, 2, Len(sValeur) - 2)
      Case "ExeName32": sExeName = Mid(sValeur, 2, Len(sValeur) - 2)
      Case "Path32": sExePath = Mid(sValeur, 2, Len(sValeur) - 2)
      Case "Form", "PropertyPage"    ', "UserControl"
        sNomD�p = sCl� & " " & sValeur
        sD�p = sValeur
      Case "Module", "Class":
        p = InStr(sValeur, ";")
        Debug.Assert p > 0
        sNomD�p = sCl� & " " & Left(sValeur, p - 1)
        sD�p = Trim(Mid(sValeur, p + 1))
    End Select
    If sD�p <> "" Then
      Dim dD�p As Date
      dD�p = FileDateTime(sD�p)
      If dD�p > dD�pMax Then
        dD�pMax = dD�p
        sNomD�pMax = sNomD�p
      End If
    End If
Continue:
  Wend
Termin�:
  Close #fProj
  
  If sExeName = "" Then
    �tat = eErreur
    sEtatD�taill� = "Pas de nom d'ex�cutable !"
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
    �tat = eErreur
    sEtatD�taill� = "�chec lors de l'acc�s � l'ex�cutable '" & sExeName & "' : " & Err.Number & " (" & Err.Source & "): " & Err.Description
    Exit Function
  End If
  
  If dExe < dD�pMax Then
    �tat = eAG�n�rer
    sEtatD�taill� = sNomD�pMax & " plus r�cent que " & sExeName
  Else
    �tat = eAJour
    sEtatD�taill� = ""
  End If
  bLire = True
  Exit Function
  
Probl�meOuverture:
  bLire = False
  �tat = eErreur
  sEtatD�taill� = "�chec � l'ouverture du projet: " & Err.Number & " (" & Err.Source & "): " & Err.Description
  Close #fProj  ' si �chec � l'ouverture ???
  Exit Function
  
Probl�meD�pendance:
  bLire = False
  �tat = eErreur
  sEtatD�taill� = "�chec lors de l'acc�s � la d�pendance '" & sD�p & "' : " & Err.Number & " (" & Err.Source & "): " & Err.Description
  Close #fProj
  Exit Function
End Function

