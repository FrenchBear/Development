Attribute VB_Name = "COMUTILS"
Option Explicit

'-----------------------------------------------------------------------
'               Fonctions d'usage général dans un programme VB
'-----------------------------------------------------------------------
' toutes les fonctions de ce modules sont indépendantes du projet
' elle peuvent donc être réutilisées dans tout programme VB
'-----------------------------------------------------------------------

Global Const TOUS_INTERDITS = ""
Global Const TOUS_AUTORISES = ""

Declare Function GetDesktopWindow Lib "User" () As Integer
Declare Function GetDC Lib "User" (ByVal hWnd As Integer) As Integer
Declare Function ReleaseDC Lib "User" (ByVal hWnd As Integer, ByVal hDC As Integer) As Integer
Declare Function StretchBlt% Lib "GDI" (ByVal hDC%, ByVal X%, ByVal Y%, ByVal nWidth%, ByVal nHeight%, ByVal hSrcDC%, ByVal XSrc%, ByVal YSrc%, ByVal nSrcWidth%, ByVal nSrcHeight%, ByVal dwRop&)
Declare Function ShellExecute Lib "shell.dll" (ByVal hWnd As Integer, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Integer) As Integer
Declare Function GetVersion Lib "Kernel" () As Long
Declare Function GetKeyState% Lib "User" (ByVal nVirtKey%)
Declare Function ShowWindow Lib "User" (ByVal hWnd As Integer, ByVal nCmdShow As Integer) As Integer
Global Const VK_TAB = 9
Global Const VK_MENU = 12


'pour désactiver la sélection complète d'une zone de texte
Global bNePasSélectionnerZoneTexte As Integer

'crée un fichier vide
Function CréerFichierVide(ByVal FichierComplet As String) As Integer

Dim NumFile As Integer
    
    On Error GoTo err_CréerFichierVide
    NumFile = FreeFile
    Open FichierComplet For Output Access Write As NumFile
    Close NumFile
    CréerFichierVide = True
fin_CréerFichierVide:
    Exit Function
    
err_CréerFichierVide:
    CréerFichierVide = False
    Resume fin_CréerFichierVide
    Exit Function

End Function

Public Function ExisteRépertoire(ByVal Repert As String) As Integer

Dim NumFile As Integer

    On Error Resume Next
    NumFile = FreeFile
    Open Repert & "\~bidon.$$$" For Output As NumFile
    If Err Then
        ExisteRépertoire = False
        On Error GoTo 0
        Exit Function
    End If
    Close NumFile
    Kill Repert & "\~bidon.$$$"
    ExisteRépertoire = True
    On Error GoTo 0
    
End Function


Function GetWindowsVersion() As String

Dim i As Long
Dim Windows As Long
Dim Dos As Long
Dim Lowbyte As String
Dim Highbyte As String

    i& = GetVersion()
 
    Windows& = i& And &HFFFF&
    Dos& = (i& And &HFFFF0000) / 65536
 
    ' The low byte is derived by masking off high byte.
    'Lowbyte$ = Str$(Dos& And &HFF)
    ' The high byte is derived by masking off low byte and shifting.
    'Highbyte$ = LTrim$(Str$((Dos& And &HFF00) / 256))
    ' Assign MS-DOS version to Text property.
    'DosVersion = Highbyte$ + "." + Lowbyte$
 
    Lowbyte$ = Str$(Windows& And &HFF)
    ' The high byte is derived by masking off low byte and shifting.
    Highbyte$ = LTrim$(Str$((Windows& And &HFF00) / 256))
    ' Assign Windows version to Text property.
    GetWindowsVersion = Lowbyte$ + "." + Highbyte$

End Function



Public Sub Delay(ByVal temps As Variant)

Dim s As Single

    s = Time
    While Time - s! < TimeValue(temps)
    Wend
    
End Sub


Public Function GetNbLignesDansChaine(ByVal ch As String) As Integer

Dim p As Integer
Dim n As Integer

    If ch = "" Then
        GetNbLignesDansChaine = 0
        Exit Function
    End If

    p = 1
    n = 0
    Do
        p = InStr(p + 1, ch, vbCrLf)
        n = n + 1
    Loop While p <> 0
    GetNbLignesDansChaine = n

End Function

Sub ControleContreBas(ctlcontenu As Control, ctlcontenant As Control)
    
    ctlcontenu.Height = maxi(0, ctlcontenant.Height - ctlcontenu.Top - gap)

End Sub



Sub ControleContreDroite(ctlcontenu As Control, ctlcontenant As Control)

    If TypeOf ctlcontenu Is Line Then
        ctlcontenu.X2 = maxi(0, ctlcontenant.Width - ctlcontenu.X1 - gap)
    Else
        ctlcontenu.Width = maxi(0, ctlcontenant.Width - ctlcontenu.Left - gap)
    End If
End Sub
Function AfficherFenetre(frm As Form) As Integer

    HourGlass "Show"
    Load frm
    CenterInScreen frm
    frm.Tag = ""
    HourGlass "Hide"
    frm.Show MODAL
    AfficherFenetre = (frm.Tag = "")
    Unload frm

End Function

'convertit une chaine Ascii Dos en Ansi Windows
Function AsciiToAnsi(ByVal Ascii As String)

Dim i As Integer, l As Integer
Dim Ansi As String
Dim ch As String
    
    l = Len(Ascii)
    Ansi = ""
    For i = 1 To l
        ch = Mid$(Ascii, i, 1)
        Select Case Asc(ch)
            Case 130:
                Ansi = Ansi & "é"
            Case 138:
                Ansi = Ansi & "è"
            Case 133:
                Ansi = Ansi & "à"
            Case 136:
                Ansi = Ansi & "ê"
            Case Else
                Ansi = Ansi & ch
        End Select
    Next
    AsciiToAnsi = Ansi

End Function

'test la validité d'un nom de fichier pour MS-DOS
Function BadFilename(Fichier As String)

    Fichier = RTrim$(Fichier)

    If InStr(Fichier, " ") Then GoTo badfile

    If Len(Fichier) > 12 Or (Len(Fichier) > 8 And InStr(Fichier, ".") = 0) Then GoTo badfile

    BadFilename = False
    Exit Function

badfile:
    BadFilename = True

End Function

Function bGetItemDansChaine(ByVal ch As String, ByVal n As Integer, Item As String) As Integer

    bGetItemDansChaine = bGetItemDansChaineSep(ch, n, Item, "%")
    
End Function

Function bGetItemDansChaineSep(ByVal ch As String, ByVal n As Integer, Item As String, ByVal separateur As String) As Integer

Dim p1 As Integer
Dim p2 As Integer
Dim i As Integer

    i = n
    p2 = 1 - Len(separateur)
    Do
        p1 = p2 + Len(separateur)
        p2 = InStr(p1, ch, separateur)
        i = i - 1
    Loop While i > 0 And p2 <> 0
    If i = 0 Then
        If p2 = 0 Then
            p2 = Len(ch) + 1
        End If
        Item = Mid$(ch, p1, p2 - p1)
        If Item = "" Then
            bGetItemDansChaineSep = False
        Else
            bGetItemDansChaineSep = True
        End If
    Else
        bGetItemDansChaineSep = False
    End If

End Function

Sub CenterInMain(fmain As Form, f As Form)

    f.Top = (fmain.ScaleHeight - f.Height) / 2
    f.Left = (fmain.ScaleWidth - f.Width) / 2

End Sub

Sub CenterInScreen(f As Form)

    f.Top = (Screen.Height - f.Height) / 2
    f.Left = (Screen.Width - f.Width) / 2
    
End Sub

'charge un fichier texte dans un controle de type
'- textbox
'- label
'- listbox
Sub ChargeTexteDansControl(ctl As Control, ByVal chFichier As String)

Dim NumFile As Integer
Dim chLigne As String
Dim chTexte As String
Dim fFichierOuvert As Integer

    fFichierOuvert = False
    chTexte = ""
    On Error GoTo Err_ChargeTexteDansControl
    NumFile = FreeFile
    Open chFichier For Input As NumFile
    fFichierOuvert = True
    chTexte = ""
    While Not EOF(NumFile)
        Line Input #NumFile, chLigne
        If TypeOf ctl Is ListBox Then
            ctl.AddItem chLigne
        Else
            chTexte = chTexte & vbCrLf & " " & chLigne
        End If
    Wend
    
fin_ChargeTexteDansControl:
    If fFichierOuvert Then
        Close NumFile
    End If
    If TypeOf ctl Is Label Then
        ctl.Caption = chTexte
    End If
    If TypeOf ctl Is TextBox Then
        ctl.Text = chTexte
    End If

    On Error GoTo 0
    Exit Sub

Err_ChargeTexteDansControl:
    ErreurSystemeBox Error$ & ": " & UCase$(chFichier), MB_ICONEXCLAMATION, "ChargeTexteDansControle"
    Resume fin_ChargeTexteDansControl

End Sub

Function ChargeTexteWinIni(Cle As String) As String

Dim chaine As String * 500
Dim cr As Integer

    cr = GetProfileString(NomApplication, Cle, "", chaine, 500)
    If cr = 0 Then
        Cle = ""
        ChargeTexteWinIni = ""
    Else
        ChargeTexteWinIni = Left$(chaine, cr)
    End If

End Function

Function DatesDernierJourDeLannee(ByVal d As Variant) As Variant

    DatesDernierJourDeLannee = DateValue("31/12/" & Year(d))

End Function

Function DatesDernierJourDeSemaine(ByVal d As Variant) As Variant

    DatesDernierJourDeSemaine = DateValue(CVDate(d) + 7 - WeekDay(d))

End Function

'renvoie la date du dernier jour du mois d'une date donnée
Function DatesDernierJourDuMois(ByVal d As Variant) As Variant

Dim m As Integer
Dim n As Integer

    m = Month(d)
    Select Case m
        Case 1, 3, 5, 7, 8, 10, 12
            n = 31
        Case 2
            If IsDate("29/02/" & Year(d)) Then
                n = 29
            Else
                n = 28
            End If
        Case 4, 6, 9, 11
            n = 30
    End Select
    DatesDernierJourDuMois = CVDate(n & "/" & m & "/" & Year(d))
    
End Function

'retourne le 1er janvier de l'année d'une date donnée
Function DatesPremierJourDeLAnnée(ByVal d As Variant) As Variant

    DatesPremierJourDeLAnnée = DateValue("01/01/" & Year(d))

End Function

'retourne le 1er jour de la semaine d'une date donnée
Function DatesPremierJourDeSemaine(ByVal d As Variant) As Variant

    DatesPremierJourDeSemaine = DateValue(CVDate(d) - WeekDay(d) + 1)

End Function

'retourne le jour du mois d'une date donnée
Function DatesPremierJourDuMois(ByVal d As Variant) As Variant

    DatesPremierJourDuMois = DateValue("01/" & Month(d) & "/" & Year(d))

End Function

'renvoi le premier jour d'un mois donné suivant une date
'ex: premier juillet après le 05/04/95 = 01/07/95
'ex: premier juillet après le 20/08/95 = 01/07/96
Function DatesPremierJourDuMoisDonnéSuivant(d As Variant, Mois As Integer) As Variant

    If Month(d) >= Mois Then
        DatesPremierJourDuMoisDonnéSuivant = DateValue("01/" & Format$(Mois) & "/" & Format$(Year(d) + 1))
    Else
        DatesPremierJourDuMoisDonnéSuivant = DateValue("01/" & Format$(Mois) & "/" & Year(d))
    End If

End Function

'retourne le premier jour du mois suivant une date
Function DatesPremierJourDuMoisSuivant(ByVal d As Variant) As Variant

    DatesPremierJourDuMoisSuivant = DateAdd("d", 1, DatesDernierJourDuMois(d))

End Function

'fonction appelée quand une erreur du système remet en cause la fonctionnalité demandée
'par l'opérateur. Celui-ci doit en être informé pour ne pas avoir de surprise plus tard
'par exemple : le systeme ne parvient pas à charger un fichier
'entree:
'   message: chaine à afficher
'   icone: type d'icone (idem que pour MsgBox)
'   Proc: nom de la procédure ou a eut lieu l'erreur
Sub ErreurSystemeBox(ByVal Message As String, Icone As Integer, Proc As String)

Dim Titre As String

    Titre = "Erreur système " + Proc
    MsgBox Message, Icone, Titre

End Sub

'fonction appelée pour afficher un message d'erreur
'entree:
'   message: chaine à afficher
'   icone: type d'icone (idem que pour MsgBox)
Sub ErreurUserBox(ByVal Message As String, Icone As Integer)

    MsgBox Message, Icone, NomApplication

End Sub

'retourne VRAI si le fichier "Fichier" existe
'sinon retourne faux
Function ExisteFichier(ByVal Fichier As String)
Dim Exist As String

        On Error Resume Next
        Exist = Dir(Fichier)

        If Exist = "" Then
            ExisteFichier = False
        Else
            ExisteFichier = True
        End If

End Function

Sub FiltreSaisie(keyascii As Integer, ByVal alphaOk As Integer, ByVal NumOk As Integer, ByVal SpaceOk As Integer, ByVal Interdits As String, ByVal Autorisés As String)

Dim c As String

    c = Chr$(keyascii)
    If alphaOk And (keyascii >= Asc("A") And keyascii <= Asc("Z")) Or (keyascii >= Asc("a") And keyascii <= Asc("z")) Then
        Exit Sub
    End If
    If NumOk And (keyascii >= Asc("0") And keyascii <= Asc("9")) Then
        Exit Sub
    End If

    If keyascii = 8 Then
        'backspace
        Exit Sub
    End If

    If SpaceOk And c = " " Then
        Exit Sub
    End If

    If Interdits = TOUS_INTERDITS Then
        'tous caractères interdits sauf ceux de Autorisés
        If InStr(Autorisés, c) Then
            Exit Sub
        End If
        keyascii = 0
        Exit Sub
    End If

    If Autorisés = TOUS_AUTORISES Then
        'tous caractères autorisés sauf ceux de Interdits
        If InStr(Interdits, c) Then
            keyascii = 0
            Exit Sub
        End If
        Exit Sub
    End If

    If InStr(Interdits, c) Then
        keyascii = 0
        Exit Sub
    End If

    If InStr(Autorisés, c) Then
        Exit Sub
    End If

End Sub

Function FixeLongueur(ByVal ch As String, ByVal n As Integer) As String

Dim l As Integer
    
    If n <= 0 Then
        FixeLongueur = ""
        Exit Function
    End If

    If ch = "" Then
        FixeLongueur = String$(n, " ")
        Exit Function
    End If

    l = Len(ch)
    If l < n Then
        FixeLongueur = Format$(ch, "!" & String$(n, "@"))
    Else
        FixeLongueur = Left$(ch, n)
    End If


End Function

Function FormatNumerique(ByVal valeur As Variant) As String

    If valeur = 0 Then
        FormatNumerique = "0"
        Exit Function
    End If
    'If valeur > 0 And valeur < 1 Then
    '    FormatNumerique = Format$(valeur)
    '    Exit Function
    'End If
    FormatNumerique = Format$(valeur)

End Function

'remplace la virgule par un point dans un réel
'pour une bonne interprétation par Val()
Function FormatVal(ByVal ch As String) As String

    FormatVal = InsereChaineSep(ch, ",", ".")

End Function

Function GetCheminSansFichier(ByVal complet As String) As String

Dim bidon As String
Dim chemin As String

    SeparePathFilename complet, chemin, bidon
    GetCheminSansFichier = chemin

End Function

Function GetConfig(ByVal Section As String, ByVal Cle As String) As String

    GetConfig = GetFichierIni(Section, Cle, FichierConfig)
    
End Function

Function GetDebutCommunDeChaines(ByVal ch1 As String, ByVal ch2 As String) As String
    
Dim i As Integer
Dim ch As String

    If ch1 = "" Or ch2 = "" Then
        GetDebutCommunDeChaines = ""
    End If
    If Len(ch1) > Len(ch2) Then
        ch = ch2
        ch2 = ch1
        ch1 = ch
    End If
    i = 1
    While i < Len(ch1) And Mid$(ch1, i, 1) = Mid$(ch2, i, 1)
        i = i + 1
    Wend
    GetDebutCommunDeChaines = Left$(ch1, i + 1)

End Function

Function GetFichierIni(ByVal Section As String, ByVal Cle As String, ByVal Fichier As String) As String

Dim chaine As String * 500
Dim cr As Integer

    cr = GetPrivateProfileString(Section, Cle, "", chaine, 500, Fichier)
    If cr = 0 Then
        GetFichierIni = ""
    Else
        GetFichierIni = Left$(chaine, cr)
    End If

End Function

'retourne le nom de fichier sans chemin d'accès
Function GetFichierSansChemin(ByVal complet As String) As String

Dim bidon As String
Dim Fichier As String

    SeparePathFilename complet, bidon, Fichier
    GetFichierSansChemin = Fichier

End Function

Function GetFichierSansExtension(ByVal complet As String) As String

Dim pos1 As Integer, pos2 As Integer
Dim FileName As String

    'recherche du dernier caractère "\"
    Do
        pos2 = pos1
        pos1 = InStr(pos2 + 1, complet, "\")
    Loop While pos1 <> 0
    If pos2 <> 0 Then
        'chemin et nom de fichier existant
        FileName = right$(complet, Len(complet) - pos2)
    Else
        'uniquement nom de fichier
        FileName = complet
    End If
    
    pos1 = InStr(FileName, ".")
    If pos1 <> 0 Then
        FileName = Left$(FileName, pos1 - 1)
    End If
    GetFichierSansExtension = FileName

End Function

Function GetItemDansChaine(ByVal ch As String, ByVal n As Integer) As String

    GetItemDansChaine = GetItemDansChaineSep(ch, n, "%")
    
End Function

Function GetItemDansChaineSep(ByVal ch As String, ByVal n As Integer, ByVal separateur As String) As String

Dim p1 As Integer
Dim p2 As Integer
Dim i As Integer

    i = n
    p2 = 1 - Len(separateur)
    Do
        p1 = p2 + Len(separateur)
        p2 = InStr(p1, ch, separateur)
        i = i - 1
    Loop While i > 0 And p2 <> 0
    If i = 0 Then
        If p2 = 0 Then
            p2 = Len(ch) + 1
        End If
        GetItemDansChaineSep = Mid$(ch, p1, p2 - p1)
    Else
        GetItemDansChaineSep = ""
    End If

End Function

'extrait un mot dans une chaine (mots séparés par blancs)
'entrée:
'   chaine
'   n=ordre du mot
'retour:
'   mot extrait ou "" si pas de mot
Function GetMotDansChaine(ByVal chaine As String, ByVal n As Integer) As String

Dim ch As String
Dim l As Integer
Dim i As Integer
Dim c As String

    chaine = Trim$(chaine)
    l = Len(chaine)
    If l = 0 Then
        GetMotDansChaine = ""
        Exit Function
    End If
    ch = ""
    i = 1
    While i <= l
        c = Mid$(chaine, i, 1)
        If c = " " Then
            ch = ch & " "
            i = i + 1
            While i <= l And Mid$(chaine, i, 1) = " "
                i = i + 1
            Wend
        Else
            ch = ch & c
            i = i + 1
        End If
        
    Wend
    GetMotDansChaine = GetItemDansChaineSep(ch, n, " ")

End Function

'retourne le nombre de lignes d'un fichier text
Function GetNbLignesFichierText(ByVal chFichier As String) As Integer

Dim iNumFile As Integer
Dim chLigne As String
Dim n As Integer

    On Error GoTo err_GetNbLignesFichierText
    n = 0
    iNumFile = FreeFile
    Open chFichier For Input As iNumFile
    While Not EOF(iNumFile)
        Line Input #iNumFile, chLigne
        n = n + 1
    Wend
    Close iNumFile
    GetNbLignesFichierText = n

fin_GetNbLignesFichierText:
    On Error GoTo 0
    Exit Function

err_GetNbLignesFichierText:
    GetNbLignesFichierText = 0
    Resume fin_GetNbLignesFichierText

End Function

Sub HourGlass(ByVal Method As String)
   
Static HourglassCount As Integer ' Set to 0 when initialized
Static HourGlassOldPointer As Integer
    
    ' Perform Method
    Select Case UCase$(Method)
        Case "SHOW"
            ' Increment HourglassCount
            HourglassCount = HourglassCount + 1
            ' If this is the first call then save pointer before changing
            If HourglassCount = 1 Then HourGlassOldPointer = Screen.MousePointer
            ' Change cursor if not already an hourglass
            If Screen.MousePointer <> HOURGLASS_SHAPE Then Screen.MousePointer = HOURGLASS_SHAPE
                

        Case "HIDE"
            ' Decrement HourglassCount
            HourglassCount = HourglassCount - 1
            ' If no more requests to Show hourglass then set back to old
            If HourglassCount < 1 Then Screen.MousePointer = HourGlassOldPointer: HourglassCount = 0

        Case Else
            ' (put your error handling here)

    End Select

End Sub

Public Function iif2(ByVal condition As Variant, SiVrai As Variant, SIFaux As Variant) As Variant

    If condition Then
        iif2 = SiVrai
    Else
        iif2 = SIFaux
    End If

End Function

Public Sub MsgDebug(sMessage As String, sTitre As String)
  'If (bDebug) Then MsgBox sMessage, , sTitre
End Sub


'imprime directement une fenêtre
'entrée:
'   handle de fenêtre à imprimer
'   picture utilisée
'   feuille dans laquelle se trouve la picture
'   mode d'impression: à l'échelle ou sur toute la feuille
Function ImprimerFenetre(frm As Form, ctlcontenant As Control, CtlPicture As Control, ByVal ModeImpression As String, ByVal chTitre As String) As Integer

Const SRCCOPY = &HCC0020

Dim hdcLocal  As Integer
Dim cr As Integer
Dim xp As Integer
Dim yp As Integer
Dim OldScaleMode As Integer

    HourGlass "show"
    ImprimerFenetre = False

    'HDC de la fenêtre
    hdcLocal = GetDC(frm.hWnd)

    'retaille le controle picture à la taille de l'écran
    ctlcontenant.ScaleMode = 3 'pixels
    OldScaleMode = frm.ScaleMode
    frm.ScaleMode = 3 'pixels
    CtlPicture.Width = frm.ScaleWidth
    CtlPicture.Height = frm.ScaleHeight
    frm.ScaleMode = OldScaleMode
    'initialise le device-contexte d'imprimante
    Printer.Print chTitre
    'copie de la fenêtre dans le controle picture
    If StretchBlt(CtlPicture.hDC, 0, 0, CtlPicture.Width, CtlPicture.Height, hdcLocal, 0, 0, CtlPicture.Width, CtlPicture.Height, SRCCOPY) <> 0 Then
        'copie le controle picture sur l'imprimante
        Printer.ScaleMode = 3
        'deux modes d'impressions
        If UCase$(ModeImpression) = "STRETCH" Then
            'impression sur toute la surface de la page
            xp = Printer.ScaleWidth: yp = Printer.ScaleHeight
        Else
            'impression respectant les ratios en hauteur et largeur
            If Printer.ScaleHeight > Printer.ScaleWidth Then
                xp = Printer.ScaleWidth
                yp = xp * CtlPicture.Height / CtlPicture.Width
            Else
                yp = Printer.ScaleHeight
                xp = yp * CtlPicture.Width / CtlPicture.Height
            End If
        End If
        'copie de l'image dans l'objet Printer
        ImprimerFenetre = (StretchBlt(Printer.hDC, 0, Printer.TextHeight(chTitre), xp, yp, CtlPicture.hDC, 0, 0, CtlPicture.ScaleWidth, CtlPicture.ScaleHeight, SRCCOPY) <> 0)
    End If
    'sort la feuille
    Printer.EndDoc
    'libère le device-contexte de l'écran
    cr = ReleaseDC(frm.hWnd, hdcLocal)

    HourGlass "hide"
    
End Function

'impression d'un fichier texte
'entree:
'   nom du fichier à imprimer
Sub ImprimerFichierTexte(NomFichier As String)

Dim iNumFile As Integer
Dim HWidth As Integer
Dim HHeight As Integer
Dim LWidth As Integer
Dim LHeight As Integer
Dim EWidth As Integer
Dim EHeight As Integer
Dim i As Integer
Dim Msg As String
Dim MsgBasPage As String
Dim Entete As String

    HourGlass "Show"

    On Error Resume Next  ' Set up error handler.

    Printer.CurrentY = 0

    MsgBasPage = "Page " & Printer.Page & "."
    HWidth = Printer.TextWidth(MsgBasPage) / 2 ' Get half width.
    HHeight = Printer.TextHeight(MsgBasPage)   ' Get height.

    Err = 0
    Open NomFichier For Input As iNumFile   ' If it does, open it.
    If Err Then
        ErreurSystemeBox "Erreur à l'ouverture du fichier " + NomFichier + "." + vbCr + "L'impression est annulée.", MB_ICONSTOP, "UTILS.BAS|ImprimerFichierTexte"
        HourGlass "Hide"
        Exit Sub
    End If

    Entete = NomFichier + " - " + Format$(Now, "dd/mm/yyyy hh:ss")
    EWidth = Printer.TextWidth(Entete) / 2 ' Get half width.
    EHeight = Printer.TextHeight(Entete)   ' Get height.

    Printer.CurrentX = Printer.ScaleWidth / 2 - EWidth
    Printer.CurrentY = 0
    Printer.Print Entete  ' Print.
    Printer.CurrentY = Printer.CurrentY + 2 * EHeight

    While Not EOF(iNumFile)
    
        Line Input #iNumFile, Msg ' Get complete line.
    
        LWidth = Printer.TextWidth(Msg) / 2 ' Get half width.
        LHeight = Printer.TextHeight(Msg)   ' Get height.
    
        If ((Printer.CurrentY + LHeight) < Printer.ScaleHeight - 2 * HHeight) Then
            Printer.CurrentX = 0
            Printer.CurrentY = Printer.CurrentY + LHeight
            Printer.Print Msg  ' Print.
        Else
            'Impression du bas de page
            Printer.CurrentX = Printer.ScaleWidth / 2 - HWidth
            Printer.CurrentY = Printer.ScaleHeight - HHeight
            Printer.Print MsgBasPage  ' Print.
            Printer.NewPage ' Send new page.

            'définition du nouveau bas de page
            MsgBasPage = "Page " & Printer.Page & "."
            HWidth = Printer.TextWidth(MsgBasPage) / 2 ' Get half width.
            HHeight = Printer.TextHeight(MsgBasPage)   ' Get height.

            'Impression de l'entête
            Printer.CurrentX = Printer.ScaleWidth / 2 - EWidth
            Printer.CurrentY = 0
            Printer.Print Entete  ' Print.
            
            'Impression de la ligne courante
            Printer.CurrentX = 0
            Printer.CurrentY = Printer.CurrentY + 2 * EHeight
            Printer.Print Msg  ' Print.
        End If
    Wend

    'Impression du bas de page
    Printer.CurrentX = Printer.ScaleWidth / 2 - HWidth
    Printer.CurrentY = Printer.ScaleHeight - HHeight
    Printer.Print MsgBasPage  ' Print.

    Err = 0
    Printer.EndDoc  ' Print done.
    If Err Then
        ErreurSystemeBox "Erreur à l'impression." + vbCr + "L'impression est annulée.", MB_ICONSTOP, "UTILS.BAS|ImprimerFichierTexte"
        HourGlass "Hide"
        Exit Sub
    End If

    Close iNumFile    ' Close file.

    HourGlass "Hide"

End Sub

'insère chaine2 dans chaine1 à la position du caractère %
Function InsereChaine(chaine1 As String, ByVal chaine2 As String) As String
Dim pos1 As Integer

    pos1 = InStr(chaine1, "%")
    If pos1 Then
        InsereChaine = Left$(chaine1, pos1 - 1) + chaine2 + right$(chaine1, Len(chaine1) - pos1)
    End If

End Function


Public Function CodeChaineCrLF(ch As String)

    While InStr(ch, vbCrLf)
        ch = InsereChaineSep(ch, vbCrLf, "|")
    Wend
    
    CodeChaineCrLF = ch
    
End Function


Function InsereChaineSep(chaine1 As String, ByVal Sep As String, chaine2 As String) As String

Dim pos1 As Integer

    pos1 = InStr(chaine1, Sep)
    If pos1 Then
        InsereChaineSep = Left$(chaine1, pos1 - 1) + chaine2 + right$(chaine1, Len(chaine1) - pos1 - Len(Sep) + 1)
    Else
        InsereChaineSep = chaine1
    End If

End Function

'renvoie l'entier juste supérieur à s ou juste inférieur
'si s est négatif
'IntPlus(2.1) = 3
'IntPlus(-2.1) = -3
'IntPlus(2.0) = 2
Function IntPlus(ByVal s As Single) As Integer

    If s > 0 Then
        If s - Int(s) <> 0 Then
            IntPlus = Int(s) + 1
        Else
            IntPlus = s
        End If
    Else
        IntPlus = Int(s)
    End If

End Function

'retourne vrai dès que la chaine contient au moins 1 caractère de l'alphabet
Function IsAlphaNumerique(ByVal ch As String)

Dim i As Integer

    For i = 1 To Len(ch)
        If Mid$(ch, i, 1) <> "-" And Mid$(ch, i, 1) <> "." And (Mid$(ch, i, 1) < "0" Or Mid$(ch, i, 1) > "9") Then
            IsAlphaNumerique = True
            Exit Function
        End If
    Next
    IsAlphaNumerique = False
    
End Function

Sub KeyAsciiNumeriqueOnly(Cont As Control, keyascii As Integer)

    If keyascii <> 8 And keyascii <> Asc("-") And keyascii <> Asc(".") And Not (keyascii >= Asc("0") And keyascii <= Asc("9")) Then
        keyascii = 0
        Exit Sub
    End If
    If keyascii = Asc("-") And InStr(Cont.Text, "-") <> 0 Then
        keyascii = 0
        Exit Sub
    End If
    If keyascii = Asc(".") And InStr(Cont.Text, ".") <> 0 Then
        keyascii = 0
        Exit Sub
    End If

End Sub

Function maxi(A As Variant, b As Variant) As Variant

    If A > b Then
        maxi = A
    Else
        maxi = b
    End If

End Function

Function mini(A As Variant, b As Variant) As Variant

    If A < b Then
        mini = A
    Else
        mini = b
    End If

End Function

'ote les blancs du début, de la fin et en trop entre les
'mots dans une chaine
Sub OteBlancsDeTropDansChaine(chaine As String)

Dim ch As String
Dim l As Integer
Dim i As Integer
Dim c As String

    chaine = Trim$(chaine)
    l = Len(chaine)
    If l = 0 Then
        chaine = ""
        Exit Sub
    End If
    ch = ""
    i = 1
    While i <= l
        c = Mid$(chaine, i, 1)
        If c = " " Then
            ch = ch & " "
            i = i + 1
            While i <= l And Mid$(chaine, i, 1) = " "
                i = i + 1
            Wend
        Else
            ch = ch & c
            i = i + 1
        End If
        
    Wend
    chaine = ch

End Sub

'Retourne la position de la chaine de caractère "chaine"
'   dans la liste "ctl"
'sinon retourne -1
Function PositionDansListe(ctl As Control, ByVal chaine As String) As Integer
Dim NumListe As Integer

    'Si la chaine est vide : pas de sélection
    'Par défaut : pas de sélection
    PositionDansListe = -1
    If chaine <> "" Then
        'Tag non vide : recherche de l'élément dans la liste
        For NumListe = 0 To ctl.ListCount - 1
            If (UCase$(ctl.List(NumListe)) = UCase$(chaine)) Then
            'Sélection de l'item
                PositionDansListe = NumListe
            End If
        Next
    End If

End Function

'Retourne la position de l'itemdata d d'une liste ctl
'sinon retourne -1
Function PositionDataDansListe(ctl As Control, ByVal d As Long) As Integer
Dim i As Integer

    PositionDataDansListe = -1
    'Tag non vide : recherche de l'élément dans la liste
    For i = 0 To ctl.ListCount - 1
        If ctl.ItemData(i) = d Then
            'item data trouvé
            PositionDataDansListe = i
        End If
    Next

End Function


'renvoie la partie entière de s avec arrondi à l'entier
'supérieur (ou inférieur si s négatif)
'Round(2.1) = 2
'Round(2.6) = 3
'Round(2.0) = 2
'Round(-2.1) = -2
'Round(-2.6) = -3
Function Round(ByVal s As Single) As Integer

    If s > 0 Then
        Round = Int(s + 0.5)
    Else
        Round = Int(s - 0.5)
    End If

End Function

Function SaisieNomFichier(DefVal As String, Msg As String, title As String, Extension As String) As String
Dim Answer As String
Dim Defaut As String
Dim Fini As Integer

    Defaut = DefVal
    Fini = False
    'Saisie du nom du fichier
    Do
        Answer = InputBox(Msg, title, Defaut)   ' Get user input.
        If Answer = "" Then
            GoTo Cancel
        End If
        Defaut = Answer
        'Suppression éventuelle puis Ajout de l'extension du fichier
        Answer = GetFichierSansExtension(Answer) + Extension
        If BadFilename(Answer) = False Then
            Fini = True
        Else
            ErreurUserBox "Le nom du fichier est incorrect : " & Answer, MB_ICONEXCLAMATION
        End If


    Loop Until Fini = True

    SaisieNomFichier = Answer
    Exit Function

Cancel:
    SaisieNomFichier = ""

End Function

Sub SelectionneZoneTexte(ctl As Control, Optional AltKey As Variant)

    'dans certains cas, on désactive la sélection du champ complet
    'à l'aide d'une variable globale
    If bNePasSélectionnerZoneTexte Then
        Exit Sub
    End If
    
    If IsMissing(AltKey) Then
        AltKey = 0
    End If
    If TypeOf ctl Is TextBox Then
        If (Not IsMissing(AltKey) And GetKeyState(AltKey) < 0) Or GetKeyState(VK_TAB) < 0 Then
            ctl.SelStart = 0
            ctl.SelLength = Len(ctl.Text)
        Else
            ctl.SelLength = 0
        End If
    End If

End Sub

'sépare le repertoire et le nom du fichier d'une chaîne contenant
'un nom de fichier avec son chemin d'acces
'
'entree:
'   Complet : nom complet
'sortie:
'   Path : chemin répertoire
'   Filename : nom du fichier
Sub SeparePathFilename(complet As String, path As String, FileName As String)

Dim pos1 As Integer, pos2 As Integer

    'recherche du dernier caractère "\"
    Do
        pos2 = pos1
        pos1 = InStr(pos2 + 1, complet, "\")
    Loop While pos1 <> 0
    If pos2 <> 0 Then
        'chemin et nom de fichier existant
        path = Left$(complet, pos2 - 1)
        FileName = right$(complet, Len(complet) - pos2)
    Else
        'uniquement nom de fichier
        path = ""
        FileName = complet
    End If

End Sub

Sub SetConfig(ByVal Section As String, ByVal key As String, ByVal valeur As String)

Dim cr As Integer

    cr = WritePrivateProfileString(Section, key, valeur, FichierConfig)

End Sub



Sub SetFichierIni(ByVal Section As String, ByVal key As String, ByVal valeur As String, ByVal chFichier As String)

Dim cr As Integer

    cr = WritePrivateProfileString(Section, key, valeur, chFichier)

End Sub

'somme des tailles des fichiers d'un répertoire
Public Function GetTailleRépertoire(ctlListFile As Control, ByVal Repert As String, ByVal Pattern As String) As Long

Dim i As Integer
Dim taille As Long

    'en cas d'erreur de la fonction FileLen()
    On Error Resume Next
    taille = 0
    
    ctlListFile.path = Repert
    ctlListFile.Pattern = Pattern
    If right$(Repert, 1) = "\" Then
        Repert = Left$(Repert, Len(Repert) - 1)
    End If

    'parcours des fichiers
    For i% = 0 To ctlListFile.ListCount - 1

        taille& = taille& + FileLen(Repert + "\" + ctlListFile.List(i%))
    Next

    GetTailleRépertoire = taille&

End Function


Sub SkipKeyAscii(ByVal ch As String, keyascii As Integer, ByVal DejaSaisi As String)

    If keyascii = 8 Then Exit Sub

    If InStr(ch, Chr$(keyascii)) Then GoTo skip

    If Chr$(keyascii) = "." Then
    If InStr(DejaSaisi, ".") Then
        GoTo skip
    Else
        Exit Sub
    End If
    End If

    If Chr$(keyascii) = "," Then
    If InStr(DejaSaisi, ".") Then
        GoTo skip
    Else
        keyascii = Asc(".")
        Exit Sub
    End If
    End If

    If Chr$(keyascii) = "-" Then
        If Len(DejaSaisi) > 0 Then
            GoTo skip
        Else
            Exit Sub
        End If
    End If

    If InStr(ch, "A") And (keyascii < Asc("0") Or keyascii > Asc("9")) Then GoTo skip

    Exit Sub
skip:
    keyascii = 0

End Sub

Function suppfirstchar(ByVal chaine As String, ByVal NbChar As Integer) As String

    If NbChar > Len(chaine) Then
        suppfirstchar = ""
    Else
        suppfirstchar = right$(chaine, Len(chaine) - NbChar)
    End If

End Function

Function SuppLastChar(ByVal chaine As String, ByVal NbChar As Integer) As String

    If NbChar > Len(chaine) Then
        SuppLastChar = ""
    Else
        SuppLastChar = Left$(chaine, Len(chaine) - NbChar)
    End If

End Function

'Manipulation d'un fichier d'aide avec cmdialog
Sub WinHelpVB(ctl As Control, ByVal FichierHLP As String, ByVal Commande As Integer, ByVal num As Integer)

    MsgDebug "Trace 20" & vbCrLf & "FichierHLP: " & FichierHLP & vbCrLf & "Commande: " & Commande & vbCrLf & "num: " & num, "COMUTILS.WinHelpVB"
    
Dim cr As Integer
Dim DummyVal As String

    ctl.HelpFile = FichierHLP
    ctl.HelpCommand = Commande
    Select Case Commande
        Case HELP_KEY
            ctl.HelpKey = num
            ctl.Action = 6
        Case HELP_CONTEXT
            ctl.HelpContext = num
            ctl.Action = 6
        Case HELP_PARTIALKEY
            'le cmdialog ne permet pas de passer une chaine vide
            'on utilise l'api WinHelp
            DummyVal = ""
            cr = Winhelp(FormMain.hWnd, FichierHLP, Commande, DummyVal)
        Case HELP_INDEX
            ctl.Action = 6
    End Select

End Sub

