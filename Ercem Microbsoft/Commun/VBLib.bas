Attribute VB_Name = "VBLib"
' VBLib
' Bibliothèque VB de base
' 23/01/1998 PV
' 15/02/1998 PV Today
' 25/04/1998 PV Min et Max
' 17/05/1998 PV Debug.Assert, sFilePart, sPathPart
' 30/07/1998 PV bShiftPressed
'  4/08/1998 PV NoPreviousInstance, le 15/08/1998 --> VBLib2
' 15/01/1999 PV Gestion des champs texte de plus de 99 caractères dans AutoSelect
' 12/03/1999 PV EmergencyExit
' 23/10/1999 PV Compactage VB6: min/max, sFilePart/sPathPart; Découverte de la fonction replace qui fait exactement ce que faisait subst !!!
' 25/11/1999 PV Test de VK_MENU dans AutoSelect
' 20/03/2000 PV ForceTextBoxCase plus générique
' 28/04/2000 PV Test d'existence de répertoire
' 21/05/2001 PV sprintf Récupèré du Global plannings
' 29/11/2001 PC Fonctions de contrôle de chaîne (bKeChiffre, bKeLettre, bKeLettreChiffre)

Option Explicit
Option Compare Binary

Declare Function OemToChar Lib "user32" Alias "OemToCharA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long
Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long

Declare Function GetKeyState% Lib "user32" (ByVal nVirtKey%)
Public Const VK_TAB = 9
Public Const VK_SHIFT = &H10
Public Const VK_MENU = &H12     ' Alt !


Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long


' =================================================================================
' Sélectionne le texte d'un champ s'il a obtenu le focus via le clavier
' 15/01/99: SelLength 99 --> 999 pour les champs texte très longs !
' 25/11/99: Ajout de VK_MENU pour les raccourcis clavier

Sub AutoSelect(C As Control, Optional bForcé As Boolean)
  If bForcé Or GetKeyState(VK_TAB) < 0 Or GetKeyState(VK_MENU) < 0 Then
    C.SelStart = 0
    C.SelLength = 999
  End If
End Sub


' =================================================================================
' Change the style of a textbox so that it automatically converts
' typed characters to uppercase or lowercase
' 1: Forme en MAJ, 2 force en min, 0 annule ce forçage
' Si le type du contrôle n'est pas TextBox, délègue à la méthode ForceTextBoxCase
 
Public Sub ForceTextBoxCase(C As Control, Optional ConvertCase As Integer)
  If TypeOf C Is TextBox Then
    Dim Style As Long
    Const GWL_STYLE = (-16)
    Const ES_UPPERCASE = &H8&
    Const ES_LOWERCASE = &H10&
    
    ' get current style
    Style = GetWindowLong(C.hWnd, GWL_STYLE)
    
    Select Case ConvertCase
        Case 0
            ' restore default style
            Style = Style And Not (ES_UPPERCASE Or ES_LOWERCASE)
        Case 1
            ' convert to uppercase
            Style = Style Or ES_UPPERCASE
        Case 2
            ' convert to lowecase
            Style = Style Or ES_LOWERCASE
    End Select
    ' enforce new style
    SetWindowLong C.hWnd, GWL_STYLE, Style
  Else
    On Error Resume Next
    C.ForceTextBoxCase ConvertCase
  End If
End Sub
 

' =================================================================================
' Mécanisme général de détection du shift

Function bShiftPressed() As Boolean
  bShiftPressed = GetKeyState(VK_SHIFT) < 0
End Function


' =================================================================================
' Conversions générales OEM - ANSI

Public Function sOEMtoANSI(ByVal sChaîne As String) As String
  Dim sRésultat As String
  sRésultat = sChaîne
  OemToChar sChaîne, sRésultat
  sOEMtoANSI = sRésultat
End Function

Public Function sANSItoOEM(ByVal sChaîne As String) As String
  Dim sRésultat As String
  sRésultat = sChaîne
  CharToOem sChaîne, sRésultat
  sANSItoOEM = sRésultat
End Function


' =================================================================================
' Gestion des NULL

' Convertit NULL en chaîne vide
Function NV(v As Variant) As String
  If IsNull(v) Then
    NV = ""
  Else
    NV = v
  End If
End Function


' Convertit un texte vide en NULL
' Convertit un texte en valeur numérique long
Function VN(v) As Variant
  If VarType(v) = vbNull Then
    VN = v
  ElseIf v = "" Then
    VN = Null
  ElseIf IsNumeric(v) Then
    ' Gag: 2F et F2 sont considérés comme numériques…
    If IsNumeric(Left(v, 1)) And IsNumeric(Right(v, 1)) Then
      VN = CDbl(v)
    Else
      VN = v
    End If
  Else
    VN = v
  End If
End Function


' Convertit un texte vide en NULL
' Convertit un texte en une date
Function DVN(v As String) As Variant
  If v = "" Then
    DVN = Null
  Else
    DVN = CDate(v)
  End If
End Function


' Convertit un texte vide ou un zéro en NULL
' Convertit un texte en valeur numérique long
Function VZN(v As String) As Variant
  If v = "" Then
    VZN = Null
  Else
    VZN = CLng(v)
    If VZN = 0 Then VZN = Null
  End If
End Function


' Convertit NULL en 0
Function NZ(v As Variant) As Variant
  If IsNull(v) Then
    NZ = 0
  Else
    NZ = v
  End If
End Function


' =================================================================================
' Substitution de chaînes
' Remplace toutes les occurrences de sCherche dans sSource par sRemplace
' 23/08/1999: En VB6 il y a la nouvelle fonction replace qui fait exactement ça !

Public Function Subst(ByVal sSource As String, ByVal sCherche As String, ByVal sRemplace As String) As String
'  Dim p As Integer, iStart As Integer
'  iStart = 1
'  Do
'    p = InStr(iStart, sSource, sCherche)
'    If p = 0 Then Exit Do
'    sSource = Left(sSource, p - 1) & sRemplace & Mid(sSource, p + Len(sCherche))
'    iStart = p + Len(sRemplace)
'  Loop
'  Subst = sSource
  Subst = Replace(sSource, sCherche, sRemplace)
End Function


' Variante de InStr qui retourne la longueur de la chaîne de base+1
' si l'expression de recherche n'est pas trouvée
Public Function InStr2(ByVal iStart As Integer, ByVal sBase As String, ByVal sRecherche As String) As Integer
  Dim p As Integer
  p = InStr(iStart, sBase, sRecherche)
  If p = 0 Then
    InStr2 = Len(sBase) + 1
  Else
    InStr2 = p
  End If
End Function



' =================================================================================
' Contrôle d'assertions, en attendant mieux…
' 17/05/98: Debug.Assert
' Attention, debug.assert n'arrête pas une version compilée !

Sub Assert(C As Boolean)
  'If Not c Then Stop
  Debug.Assert C
End Sub


' =================================================================================
' Effacement d'une collection.
' Pourquoi est-ce que ce n'est pas fourni en standard ???
' Difficile de l'implanter avec un paramètre byref et ensuite set col=new collection
' à cause des ref multiples

Sub EffaceCollection(col As Collection)
  Dim i As Integer
  For i = col.Count To 1 Step -1
    col.Remove 1
  Next
End Sub


' =================================================================================
' Retourne la date du jour, sans les heures et les minutes comme now
' Utilise int, qui tronque, et pas clng qui arrondit !
Function Today() As Date
  Today = CDate(Int(Now))
End Function


' =================================================================================
' Minimum, maximum
' 23/08/1999: Astuce, le nom d'une fonction est une variable locale légale !

Function Min(ParamArray p() As Variant) As Variant
  Dim v As Variant
  
  Min = 1E+100
  For Each v In p
    If v < Min Then Min = v
  Next
End Function

Function Max(ParamArray p() As Variant) As Variant
  Dim v As Variant
  
  Max = -1E+100
  For Each v In p
    If v > Max Then Max = v
  Next
End Function


' =================================================================================
' Décodage de la partie non de fichier d'un chemin d'accès complet
' 23/08/1999: Compactage avec InStrRev du VB6

Function sFilePart(ByVal sFullPath As String) As String
'  Dim p As Integer, lp As Integer
'  p = 0
'  Do
'    lp = p
'    p = InStr(lp + 1, sFullPath, "\")
'  Loop Until p = 0
'  sFilePart = Mid(sFullPath, lp + 1)
  sFilePart = Mid(sFullPath, 1 + InStrRev(sFullPath, "\"))
End Function

Function sPathPart(ByVal sFullPath As String) As String
'  Dim p As Integer, lp As Integer
'  p = 0
'  Do
'    lp = p
'    p = InStr(lp + 1, sFullPath, "\")
'  Loop Until p = 0
'  sPathPart = Left(sFullPath, lp)
  sPathPart = Left(sFullPath, InStrRev(sFullPath, "\"))
End Function


' =========================================================================
' Fin rapide de programme

Public Sub EmergencyExit()
  Dim F As Form
  On Error Resume Next
  For Each F In Forms
    Unload F
  Next
  End
End Sub


' =========================================================================
' Message d'erreur standard

Public Sub MessageErreurStandard(sTexte As String)
  MsgBox sTexte & vbCrLf & vbCrLf & "Erreur " & Err.Number & " (" & Err.Source & "): " & Err.Description, vbCritical, App.Title
End Sub


' =========================================================================
' Test de l'existence d'un répertoire

Public Function bDirExists(sPath As String) As Boolean
  bDirExists = Dir(sPath, vbDirectory) <> ""
End Function


' =================================================================================
' sprintf
' Remplace %1, %2, %3…, %9, %a, %b… de la chaîne par les arguments (dans l'ordre)

Public Function sprintf(ByVal sFormat As String, ParamArray tChamps()) As String
  Dim i As Integer, nc As Integer
  nc = 1
  
  Dim tchamps2() As Variant
  If VarType(tChamps(0)) >= vbArray Then
    tchamps2 = tChamps(0)
  Else
    tchamps2 = tChamps
  End If
  
  For i = LBound(tchamps2) To UBound(tchamps2)
    sFormat = Subst(sFormat, "%" & LCase(Hex(nc)), tchamps2(i))
    nc = nc + 1
  Next
  sprintf = sFormat
End Function

' fonctions génériques de contrôle de chaînes
' PC 16/10/2001 Quelle grève de bus ! )8~{
Public Function bKeChiffre(sChaine As String) As Boolean
' vrai si la chaine de caractères en paramètre ne contient que des chiffres
' càd des caractères compris entre "0" et "9"
' la fonction IsNumeric est insuffisante car elle renvoie vrai
' si les caractères ".", "-", "," ou " " sont dans la chaine

  Dim i As Integer, l As Integer, C As String * 1
  
  bKeChiffre = True
  l = Len(sChaine)
  If l = 0 Then ' chaine de longueur nulle
    bKeChiffre = False
  Else
    For i = 1 To l
      C = Mid$(sChaine, i, 1)
      If C Like "[!0-9]" Then
'     If C < "0" Or C > "9" Then
        bKeChiffre = False
        Exit For
      End If
    Next i
  End If

End Function

Public Function bKeLettre(sChaine As String) As Boolean
' vrai si la chaine de caractères en paramètre ne contient que des lettres
' càd des caractères compris entre "a" et "z" ou entre "A" et "Z"

  Dim i As Integer, l As Integer, C As String * 1
  
  bKeLettre = True
  l = Len(sChaine)
  If l = 0 Then ' chaine de longueur nulle
    bKeLettre = False
  Else
    For i = 1 To l
      C = Mid$(sChaine, i, 1)
      If C Like "[!a-z!A-Z]" Then
'     If (C < "a" Or C > "z") And (C < "A" Or C > "Z") Then
        bKeLettre = False
        Exit For  ' on s'arrête
      End If
    Next i
  End If

End Function

Public Function bKeLettreChiffre(sChaine As String) As Boolean
' vrai si la chaine de caractères en paramètre ne contient que des lettres ou des chiffres
' càd des caractères compris entre "a" et "z" ou entre "A" et "Z" ou entre "0" et "9"

  Dim i As Integer, l As Integer, C As String * 1
  
  bKeLettreChiffre = True
  l = Len(sChaine)
  If l = 0 Then ' chaine de longueur nulle
    bKeLettreChiffre = False
  Else
    For i = 1 To l
      C = Mid$(sChaine, i, 1)
      If C Like "[!a-z!A-Z!0-9]" Then
'     If (C < "a" Or C > "z") And (C < "A" Or C > "Z") And (C < "0" Or C > "9") Then
        bKeLettreChiffre = False
        Exit For  ' on s'arrête
      End If
    Next i
  End If

End Function

