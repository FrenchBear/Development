Attribute VB_Name = "Utilitaires"
' Utilitaires.bas
' Fonctions de service du programme automate
' PV 4/5/99

Option Explicit


Public Const SWP_NOMOVE = 2
Public Const SWP_NOSIZE = 1
Public Const FLAGS = SWP_NOMOVE Or SWP_NOSIZE
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2

Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Public Function SetTopMostWindow(hwnd As Long, Topmost As Boolean) As Long
  If Topmost = True Then 'Make the window topmost
    SetTopMostWindow = SetWindowPos(hwnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS)
  Else
    SetTopMostWindow = SetWindowPos(hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, FLAGS)
    SetTopMostWindow = False
  End If
End Function




' R�cup�re le premier mot de sLigne termin� par espace ou une virgule
' Ignore sagement ce qui est entre guillemets
' A l'int�rieur de guillemets le double guillemet est ignor�, mais est remplac� par un guillemet simple dans le r�sultat retourn�
' Tout ce qui suit une apostrophe (hors guillemets) est ignor�
Public Function sPremierMot(ByRef sLigne As String) As String
  Dim i As Integer
  Dim bDansGuillemets As Boolean
  
  bDansGuillemets = False
  For i = 1 To Len(sLigne)
    Select Case Mid(sLigne, i, 1)
      
    ' on trouve des guillemets
      Case Chr(34):
        bDansGuillemets = Not bDansGuillemets
      
     ' on trouve une apostrophe (commentaires)
      Case "'":
        If Not bDansGuillemets Then
          sLigne = Left(sLigne, i - 1)    ' On �limine le commentaire
          Exit For
        End If
        
    ' on trouve un s�parateur : espace, virgule ou tabulation
      Case " ", ",", Chr(9):
        If Not bDansGuillemets Then Exit For
    
    End Select
  Next

  ' On a trouv� le premier "mot"
  Dim sResultat As String
  sResultat = Left(sLigne, i - 1)
  
  ' On commence par �liminer les guillemets externes s'il y en a
  sResultat = sTrimGuillemets(sResultat)
  
  ' S'il y avait des guillemets en double dans le premier mot, on les
  ' remplace par des guillemets simple avant de retourner le r�sultat
  sPremierMot = Replace(sResultat, Chr(34) & Chr(34), Chr(34))
  
  ' On "mange" le mot retourn� et tous les s�parateurs qui suivent de sLigne
  Do While Mid(sLigne, i, 1) = " " Or Mid(sLigne, i, 1) = Chr(9)
    i = i + 1
  Loop
  If Mid(sLigne, i, 1) = "," Then i = i + 1
  Do While Mid(sLigne, i, 1) = " " Or Mid(sLigne, i, 1) = Chr(9)
    i = i + 1
  Loop
  
  sLigne = Mid(sLigne, i)
End Function

' Enl�ve le premier et le dernier guillemets d'une cha�ne
' Retourne la cha�ne telle quelle si elle ne commence et ne se termine pas par des guillemets
Public Function sTrimGuillemets(ByVal s As String) As String
  If Left(s, 1) = Chr(34) And Right(s, 1) = Chr(34) Then
    sTrimGuillemets = Mid(s, 2, Len(s) - 2)
  Else
    sTrimGuillemets = s
  End If
End Function

' =================================================================================
' Substitution de cha�nes
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

' =================================================================================
' Nom de fichier extrait d'un chemin complet

Public Function sBaseName(ByVal sPath As String) As String
  Dim p As Integer
  
  p = InStrRev(sPath, "\")
  sBaseName = Mid(sPath, p + 1)
End Function
