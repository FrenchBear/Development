VERSION 4.00
Begin VB.Form FormMain 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4695
   ClientLeft      =   615
   ClientTop       =   1575
   ClientWidth     =   8520
   Height          =   5370
   HelpContextID   =   6
   Icon            =   "GENBMAIN.frx":0000
   Left            =   555
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4695
   ScaleWidth      =   8520
   Top             =   960
   Width           =   8640
   Begin VB.FileListBox File2 
      Height          =   645
      Left            =   5940
      TabIndex        =   20
      Top             =   3660
      Visible         =   0   'False
      Width           =   915
   End
   Begin VB.TextBox txtR�pertoireDestination 
      Height          =   285
      Left            =   2970
      TabIndex        =   18
      Top             =   3150
      Width           =   4800
   End
   Begin VB.FileListBox File1 
      Height          =   645
      Left            =   6900
      TabIndex        =   15
      Top             =   3645
      Visible         =   0   'False
      Width           =   915
   End
   Begin VB.OptionButton optDestination 
      BackColor       =   &H0000C000&
      Height          =   315
      Index           =   1
      Left            =   720
      TabIndex        =   7
      Top             =   3135
      Width           =   220
   End
   Begin VB.OptionButton optDestination 
      BackColor       =   &H0000C000&
      Height          =   255
      Index           =   0
      Left            =   720
      TabIndex        =   6
      Tag             =   "0"
      Top             =   2895
      Width           =   220
   End
   Begin VB.CheckBox chkModule 
      Height          =   270
      Left            =   2085
      TabIndex        =   8
      Top             =   1800
      Width           =   255
   End
   Begin VB.TextBox txtR�pertoireModule 
      Height          =   285
      Left            =   3180
      TabIndex        =   4
      Top             =   2115
      Width           =   4590
   End
   Begin VB.TextBox txtR�pertoireHaccp 
      Height          =   285
      Left            =   780
      TabIndex        =   1
      Top             =   1380
      Width           =   7035
   End
   Begin DwstgLib.DwStorage DwStorage1 
      Left            =   540
      Top             =   4140
      _version        =   65536
      _extentx        =   741
      _extenty        =   741
      _stockprops     =   0
   End
   Begin MSComDlg.CommonDialog CmDialog1 
      Left            =   1500
      Top             =   3960
      _version        =   65536
      _extentx        =   847
      _extenty        =   847
      _stockprops     =   0
   End
   Begin Threed.SSCommand btnRepDestination 
      Height          =   315
      Left            =   7875
      TabIndex        =   19
      Top             =   3135
      Width           =   450
      _version        =   65536
      _extentx        =   794
      _extenty        =   556
      _stockprops     =   78
      picture         =   "GENBMAIN.frx":030A
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "R�pertoire de disque :"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   1050
      TabIndex        =   17
      Top             =   3180
      Width           =   1995
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "A:\"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   1050
      TabIndex        =   16
      Top             =   2910
      Width           =   390
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H0000FFFF&
      Caption         =   "G�n�ration des disquettes d'installation de HACCP Version 3.0"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   13.5
         underline       =   0   'False
         italic          =   -1  'True
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   720
      Index           =   0
      Left            =   1335
      TabIndex        =   13
      Top             =   195
      Width           =   5895
   End
   Begin Threed.SSCommand btnG�n�rer 
      Height          =   840
      Left            =   2970
      TabIndex        =   12
      Top             =   3750
      Width           =   2880
      _version        =   65536
      _extentx        =   5080
      _extenty        =   1482
      _stockprops     =   78
      caption         =   "G�n�rer les disquettes d'installation"
      picture         =   "GENBMAIN.frx":0444
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      Index           =   1
      Visible         =   0   'False
      X1              =   8505
      X2              =   45
      Y1              =   15
      Y2              =   15
   End
   Begin VB.Line Line1 
      Index           =   0
      Visible         =   0   'False
      X1              =   8520
      X2              =   60
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "4) Lancez la g�n�ration des disquettes"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   270
      Index           =   3
      Left            =   165
      TabIndex        =   11
      Top             =   3495
      Width           =   3570
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "3) Choisissez la destination des fichiers d'installation"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   180
      TabIndex        =   10
      Top             =   2595
      Width           =   5715
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "R�pertoire contenant le &module:"
      ForeColor       =   &H00FFFFFF&
      Height          =   270
      Index           =   2
      Left            =   780
      TabIndex        =   3
      Top             =   2115
      Width           =   2430
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   $"GENBMAIN.frx":0C96
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   270
      Index           =   1
      Left            =   180
      TabIndex        =   9
      Top             =   1815
      Width           =   8190
   End
   Begin Threed.SSCommand btnRepModule 
      Height          =   315
      Left            =   7860
      TabIndex        =   5
      Top             =   2115
      Width           =   450
      _version        =   65536
      _extentx        =   794
      _extenty        =   556
      _stockprops     =   78
      picture         =   "GENBMAIN.frx":0CF6
   End
   Begin Threed.SSCommand btnRepHACCP 
      Height          =   315
      Left            =   7860
      TabIndex        =   2
      Top             =   1335
      Width           =   450
      _version        =   65536
      _extentx        =   794
      _extenty        =   556
      _stockprops     =   78
      picture         =   "GENBMAIN.frx":0E30
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   $"GENBMAIN.frx":0F6A
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   270
      Index           =   0
      Left            =   165
      TabIndex        =   0
      Top             =   1110
      Width           =   7230
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H0000FFFF&
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   13.5
         underline       =   0   'False
         italic          =   -1  'True
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   780
      Index           =   1
      Left            =   195
      TabIndex        =   14
      Top             =   165
      Width           =   8130
   End
   Begin VB.Menu MnuClefs 
      Caption         =   "&Fichier"
      Begin VB.Menu MnuQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu MnuPI 
      Caption         =   "&Aide"
      Begin VB.Menu MnuAide 
         Caption         =   "&Sommaire"
      End
      Begin VB.Menu MnuApropos 
         Caption         =   "A &propos de..."
      End
   End
End
Attribute VB_Name = "FormMain"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Option Explicit



Private Sub zAjouterSectionDeFichiers(ctlListFile As Control, ByVal FichierSetup As String, ByVal Section As String, ByVal Source As String, ByVal NumDisquette As Integer, ByVal NomModule As String)

Dim Fichier As String
Dim i As Integer
Dim valeur As String
       
    ctlListFile.path = Source
    ctlListFile.Pattern = "*.*"
    For i = 1 To ctlListFile.ListCount
        Fichier = ctlListFile.List(i - 1)
        valeur = NumDisquette & ",," & Fichier & "," & Fichier
        valeur = valeur & ",$(AppPath)\" & NomModule & ",,,,," & GetFileSize(Source & "\" & Fichier)
        SetFichierIni Section, "File" & i, valeur, FichierSetup
    Next

End Sub

Function zCopyR�pertoire(ctlListFile As Control, ByVal Source As String, ByVal Destination As String) As Integer

Dim Numfile As Integer
Dim Fichier As String
Dim i As Integer
       
    ctlListFile.path = Source
    ctlListFile.Pattern = "*.*"
    ctlListFile.Refresh
    For i = 1 To ctlListFile.ListCount
        Fichier = ctlListFile.List(i - 1)
        DoEvents
        If ProgressionAnnul�e Then
            zCopyR�pertoire = False
            Exit Function
        End If
        If Not DuplicateFile(Source, Destination, Fichier, Fichier) Then
            ErreurSystemeBox "Impossible de transf�rer le fichier " & Fichier & " sur " & Destination & ". G�n�ration des disquettes interrompue.", MB_ICONSTOP, NomApplication
            zCopyR�pertoire = False
            Exit Function
        End If
        UpdateStatus GetFileSize(Source & "\" & Fichier)
    Next
    zCopyR�pertoire = True

End Function



Sub MetAJourMenus()
    refreshboutons
End Sub






Private Sub btnG�n�rer_Click()

Dim FichierListe As String
Dim Destination As String
Dim FichierSetup As String
Dim TempModule As String
Dim TailleModule As Long
Dim cr As Integer
Dim NumDisquette As Integer
Dim NomModule As String

    HourGlass "show"

    If chkModule.Value <> 0 Then
        If Not ExisteR�pertoire(txtR�pertoireModule.Text) Then
            ErreurUserBox "Le r�pertoire de module choisi est incorrect ou n'existe pas.", MB_ICONEXCLAMATION
            HourGlass "hide"
            Exit Sub
        End If
        If Not ExisteFichier(txtR�pertoireModule.Text & "\module.mul") Then
            ErreurUserBox "Le r�pertoire choisi n'est pas un r�pertoire de module HACCP car il ne contient pas de fichier MODULE.MUL.", MB_ICONEXCLAMATION
            HourGlass "hide"
            Exit Sub
        End If
    End If

    'r�pertoire destination
    If optDestination(0).Tag = "0" Then
        'disquettes
        Destination = "A:\"
        TempModule = RepertoireApplication & "\temp"
    Else
        'r�pertoire du disque dur
        Destination = Trim$(txtR�pertoireDestination.Text)
        If Not IsValidPath(Destination, "c:") Then
            ErreurUserBox "R�pertoire de destination incorrect.", MB_ICONEXCLAMATION
            txtR�pertoireDestination.SetFocus
            HourGlass "hide"
            Exit Sub
        End If
        Destination = Trim$(txtR�pertoireDestination.Text)
        If Not ExisteR�pertoire(Destination) Then
            'cr�ation du r�pertoire destination s'il n'existe pas
            If IDNO = MsgBox("Le r�pertoire destination " & UCase$(Destination) & " n'existe pas. Voulez-vous le cr�er ?", MB_YESNO, NomApplication) Then
                HourGlass "hide"
                Exit Sub
            End If
            If Not CreatePath(Destination) Then
                ErreurUserBox "Le r�pertoire de destination " & UCase$(Destination) & " ne peut pas �tre cr��.", MB_ICONEXCLAMATION
                HourGlass "hide"
                Exit Sub
            End If
        Else
            On Error Resume Next
            Kill Destination & "\*.*"
            On Error GoTo 0
        End If
        TempModule = Destination & "\temp"
    End If

    'cr�e le r�pertoire temporaire pour le module s'il n'existe pas
    If chkModule.Value <> 0 Then
        If Not ExisteR�pertoire(TempModule) Then
            If Not CreatePath(TempModule) Then
                ErreurUserBox "Le r�pertoire temporaire de module " & UCase$(TempModule) & " ne peut pas �tre cr��.", MB_ICONEXCLAMATION
                HourGlass "hide"
                Exit Sub
            End If
        End If
        On Error Resume Next
        Kill TempModule & "\*.*"
        On Error GoTo 0
    End If

    'cr�ation de masters\haccp\setup.lst � partir des mod�les genbset-.lst
    NumDisquette = 0
    If optDestination(0).Tag <> "1" Then
        'disquette
        cr = DuplicateFile(RepertoireApplication, txtR�pertoireHaccp, "genbset2.lst", "setup.lst")
    Else
        'disque dur
        cr = DuplicateFile(RepertoireApplication, txtR�pertoireHaccp, "genbset1.lst", "setup.lst")
    End If
    If Not cr Then
        ErreurSystemeBox "Impossible de copier le mod�le de fichier setup.lst", MB_ICONSTOP, NomApplication
        HourGlass "hide"
        Exit Sub
    End If
    'modification du fichier setup.lst
    'section option: installer un module et son nom
    FichierSetup = txtR�pertoireHaccp & "\setup.lst"
    NomModule = GetFichierSansChemin(txtR�pertoireModule.Text)
    SetFichierIni "Options", "Module", chkModule.Value, FichierSetup
    SetFichierIni "Options", "NomModule", NomModule, FichierSetup
    
    If chkModule.Value <> 0 Then
        'copier le module dans un r�pertoire temporaire en verroullant les projets si n�cessaire
        cr = CopyR�pertoire(File1, txtR�pertoireModule.Text, TempModule, True, "*.*")
        If Not cr Then
            GoTo fin_g�n�rer
        End If
        'File1 contient les fichiers � compresser
        If Not CompresserR�pertoire(File1, TempModule) Then
            GoTo fin_g�n�rer
        End If
    End If
        
    'montre boite de dialogue
    ProgressionAnnul�e = False
    If chkModule.Value <> 0 Then
        TailleModule = GetTailleR�pertoire(File2, TempModule, "*.??_")
    Else
        TailleModule = 0
    End If
    'liste de distribution des fichiers sur les disquettes
    FichierListe = RepertoireApplication & "\" & FICHIER_LST
    ShowStatusDialog "Transfert en cours...", GetTailleFichiersListe(FichierListe, RepertoireApplication) + TailleModule
    
    'distribution des fichiers sur les disquettes
    If Not CopyListe(FichierListe, RepertoireApplication, Destination, optDestination(0).Tag <> "1") Then
        GoTo fin_g�n�rer
    End If
    
    If optDestination(0).Tag <> "1" Then
        'cas des disquettes
        If chkModule.Value <> 0 Then
            'copie du module compress� dans la destination en mettant � jour la section Files de setup.lst
            'File1 contient la liste des fichiers non compress�s mais on copie les fichiers compress�s correspondants
            NumDisquette = 3
            cr = CopyR�pertoireVersDisquettesMajSetup(File1, TempModule, Destination, NumDisquette, FichierSetup, "Files", NomModule, 11)
            If Not cr Then
                GoTo fin_g�n�rer
            End If
            'redemande la premi�re disquette pour y mettre le setup.lst
            If NumDisquette > 1 Then
                If MsgBox("R�-ins�rez la disquette 1", MB_ICONINFORMATION Or MB_OKCANCEL, NomApplication) = IDCANCEL Then
                    GoTo fin_g�n�rer
                End If
            End If
            'transfert de setup.lst dans le r�pertoire de destination
            cr = DuplicateFile(Trim$(txtR�pertoireHaccp), Destination, "setup.lst", "setup.lst")
            If Not cr Then
                GoTo fin_g�n�rer
            End If
        Else
            'on est sur la disquette 2, il faut r�ins�rer la 1 pour y mettre le fichier.lst
            If MsgBox("R�-ins�rez la disquette 1", MB_ICONINFORMATION Or MB_OKCANCEL, NomApplication) = IDCANCEL Then
                GoTo fin_g�n�rer
            End If
            'transfert de setup.lst dans le r�pertoire de destination
            cr = DuplicateFile(Trim$(txtR�pertoireHaccp), Destination, "setup.lst", "setup.lst")
            If Not cr Then
                GoTo fin_g�n�rer
            End If
        End If
        
    Else
        'cas du r�pertoire sur le disque
        If chkModule.Value <> 0 Then
            If GetDiskSpaceFree(UCase$(SuppLastChar(Destination, 1))) < TailleModule Then
                'pas assez de place pour le module
                cr = MsgBox("La place sur " & Destination & " est insuffisante pour y copier le module. G�n�ration impossible dans ce r�pertoire.", MB_ICONEXCLAMATION Or MB_OKCANCEL, NomApplication)
                GoTo fin_g�n�rer
            End If
            'copie des fichiers du module dans la destination
            'File1 contient la liste des fichiers non compress�s mais on copie les fichiers compress�s correspondants
            cr = CopyR�pertoireVersDisqueMajSetup(File1, TempModule, Destination, FichierSetup, "Files", NomModule, 11)
            If Not cr Then
                GoTo fin_g�n�rer
            End If
        End If
        'transfert de setup.lst dans le r�pertoire de destination
        cr = DuplicateFile(Trim$(txtR�pertoireHaccp.Text), Destination, "setup.lst", "setup.lst")
        If Not cr Then
            GoTo fin_g�n�rer
        End If
    End If
    If chkModule.Value <> 0 Then
        On Error Resume Next
        Kill TempModule & "\*.*"
        RmDir TempModule
        On Error GoTo 0
    End If
    MsgBox "G�n�ration termin�e.", MB_ICONINFORMATION, NomApplication
    
fin_g�n�rer:
    Unload StatusDlg
    HourGlass "hide"
        
End Sub

Function CopyR�pertoireVersDisqueMajSetup(ctlListFile As Control, ByVal Source As String, ByVal Destination As String, ByVal FichierSetup As String, ByVal Section As String, ByVal NomModule As String, ByVal i0 As Integer) As Integer

Dim Numfile As Integer
Dim FichierNonComp As String
Dim Fichier As String
Dim i As Integer
Dim cr As Integer
Dim valeur As String
       
    For i = 1 To ctlListFile.ListCount
        FichierNonComp = ctlListFile.List(i - 1)
        If Left$(right$(FichierNonComp, 4), 1) = "." Then
            Fichier = SuppLastChar(FichierNonComp, 1) & "_"
        Else
            If InStr(FichierNonComp, ".") = 0 Then
                Fichier = FichierNonComp & "._"
            Else
                Fichier = FichierNonComp & "_"
            End If
        End If
        DoEvents
        If ProgressionAnnul�e Then
            CopyR�pertoireVersDisqueMajSetup = False
            Exit Function
        End If
        If Not DuplicateFile(Source, Destination, Fichier, Fichier) Then
            ErreurSystemeBox "Impossible de transf�rer le fichier " & Fichier & " sur " & Destination & ". G�n�ration des disquettes interrompue.", MB_ICONSTOP, NomApplication
            CopyR�pertoireVersDisqueMajSetup = False
            Exit Function
        Else
            'met � jour le fichier setup.lst
            valeur = "1,," & Fichier & "," & FichierNonComp
            valeur = valeur & ",$(AppPath)\" & NomModule & ",,,,," & GetFileSize(Source & "\" & Fichier)
            SetFichierIni Section, "File" & (i0 + i), valeur, FichierSetup
        End If
        UpdateStatus GetFileSize(Source & "\" & Fichier)
    Next

    CopyR�pertoireVersDisqueMajSetup = True

End Function

Function CopyR�pertoireVersDisquettesMajSetup(ctlListFile As Control, ByVal Source As String, ByVal Destination As String, NumDisquette As Integer, ByVal FichierSetup As String, ByVal Section As String, ByVal NomModule As String, ByVal i0 As Integer) As Integer

Dim Numfile As Integer
Dim FichierNonComp As String
Dim Fichier As String
Dim i As Integer
Dim cr As Integer
Dim valeur As String
       
    For i = 1 To ctlListFile.ListCount
        FichierNonComp = ctlListFile.List(i - 1)
        Fichier = SuppLastChar(FichierNonComp, 1) & "_"
        DoEvents
        If ProgressionAnnul�e Then
            CopyR�pertoireVersDisquettesMajSetup = False
            Exit Function
        End If
        'cas premi�re disquette
        'If NumDisquette = 1 Then
        '    If MsgBox("Ins�rer une disquette dans le lecteur.", MB_ICONINFORMATION Or MB_OKCANCEL, NomApplication) = IDCANCEL Then
        '        CopyR�pertoireVersDisquettesMajSetup = False
        '        Exit Function
        '    End If
        '    If Dir$("A:\*.*") <> "" Then
        '        If MsgBox("La disquette contient des fichiers qui doivent �tre effac�s. Voulez-vous continuer ?", MB_ICONINFORMATION Or MB_YESNO, NomApplication) = IDNO Then
        '            CopyR�pertoireVersDisquettesMajSetup = False
        '            Exit Function
        '        End If
        '        HourGlass "show"
        '        Kill "a:\*.*"
        '        HourGlass "hide"
        '    End If
        '    NumDisquette = 1
        'End If
        'laisse 64Ko sur la premi�re disquette pour setup.lst
        While GetDiskSpaceFree("A:") + 65535 * (NumDisquette = 1) < GetFileSize(Source & "\" & Fichier)
            cr = MsgBox("Ins�rer la disquette vierge et format�e num�ro " & NumDisquette + 1 & ".", MB_ICONEXCLAMATION Or MB_OKCANCEL, NomApplication)
            If cr = IDCANCEL Then
                CopyR�pertoireVersDisquettesMajSetup = False
                Exit Function
            End If
            If Dir$("a:\*.*") <> "" Then
                If MsgBox("La disquette contient des fichiers qui doivent �tre effac�s. Voulez-vous continuer ?", MB_ICONINFORMATION Or MB_YESNO, NomApplication) = IDNO Then
                    CopyR�pertoireVersDisquettesMajSetup = False
                    Exit Function
                End If
                HourGlass "show"
                Kill "a:\*.*"
                HourGlass "hide"
            End If
            If GetDiskSpaceFree("A:") + 65535 * (NumDisquette = 1) >= GetFileSize(Source & "\" & Fichier) Then
                NumDisquette = NumDisquette + 1
            End If
        Wend
        If Not DuplicateFile(Source, Destination, Fichier, Fichier) Then
            ErreurSystemeBox "Impossible de transf�rer le fichier " & Fichier & " sur " & Destination & ". G�n�ration des disquettes interrompue.", MB_ICONSTOP, NomApplication
            CopyR�pertoireVersDisquettesMajSetup = False
            Exit Function
        Else
            'met � jour le fichier setup.lst
            valeur = NumDisquette & ",," & Fichier & "," & FichierNonComp
            valeur = valeur & ",$(AppPath)\" & NomModule & ",,,,," & GetFileSize(Source & "\" & Fichier)
            SetFichierIni Section, "File" & (i0 + i), valeur, FichierSetup
        End If
        UpdateStatus GetFileSize(Source & "\" & Fichier)
    Next

    CopyR�pertoireVersDisquettesMajSetup = True

End Function

Function CompresserR�pertoire(ctlListFile As Control, ByVal Source As String) As Integer

Dim Numfile As Integer
Dim Fichier As String
Dim i As Integer

    'ctlListFile.path = Source
    'ctlListFile.Pattern = "*.*"
    'ctlListFile.Refresh
    Numfile = FreeFile
    Open Source & "\c.bat" For Output As Numfile
    For i = 1 To ctlListFile.ListCount
        Fichier = ctlListFile.List(i - 1)
        DoEvents
        If ProgressionAnnul�e Then
            CompresserR�pertoire = False
            Close Numfile
            Exit Function
        End If
        Print #Numfile, RepertoireApplication & "\compress.exe -r " & Source & "\" & Fichier
        UpdateStatus GetFileSize(Source & "\" & Fichier)
    Next
    Close Numfile
    If AppExecute(Source & "\c.bat") = False Then
        CompresserR�pertoire = False
        Exit Function
    End If
    Kill Source & "\c.bat"
    
    CompresserR�pertoire = True

End Function

'lancement d'un programme DOS avec attente qu'il se termine
Private Function AppExecute(Programme As String) As Integer

Dim hWndShelledWindow As Integer, TimeOutPeriod As Integer
Dim r As Integer, fTimeOut As Integer, s As Single

    TimeOutPeriod = 15  'augmentez cette valeur si le lancement
                        'du programme DOS dure plus de 15 secondes
    r = Shell(Programme, 3) 'lancement
    fTimeOut = False: s! = Timer
    Do
        r = DoEvents(): hWndShelledWindow = GetActiveWindow()
        If Timer - s! > TimeOutPeriod Then fTimeOut = True
    Loop While hWndShelledWindow = FormMain.hWnd And Not fTimeOut

    'si le programme DOS ne s'est pas lanc�
    If fTimeOut Then
        MsgBox "Programme DOS non lanc�", 16
        AppExecute = False
        Exit Function
    End If

    'attente que le programme DOS soit termin�
    While IsWindow(hWndShelledWindow)
        r = DoEvents()
    Wend
    AppExecute = True

End Function

Function CopyR�pertoire(ctlListFile As Control, ByVal Source As String, ByVal Destination As String, ByVal VerrouillerProjetsHACCP As Integer, ByVal Pattern As String) As Integer

Dim Numfile As Integer
Dim Fichier As String
Dim i As Integer
       
    ctlListFile.path = Source
    ctlListFile.Pattern = Pattern
    ctlListFile.Refresh
    For i = 1 To ctlListFile.ListCount
        Fichier = ctlListFile.List(i - 1)
        DoEvents
        If ProgressionAnnul�e Then
            CopyR�pertoire = False
            Exit Function
        End If
        If Not DuplicateFile(Source, Destination, Fichier, Fichier) Then
            ErreurSystemeBox "Impossible de transf�rer le fichier " & Fichier & " sur " & Destination & ". G�n�ration des disquettes interrompue.", MB_ICONSTOP, NomApplication
            CopyR�pertoire = False
            Exit Function
        End If
        If VerrouillerProjetsHACCP And UCase$(right$(Destination & "\" & Fichier, 3)) = "HAC" Then
            'verrouille le projet HACCP une fois dans le r�pertoire destination
            Dim Projet As New Projet
            Projet.Load dwstorage1, Destination & "\" & Fichier
            Projet.Verrouill� = True
            Projet.Save dwstorage1, Destination & "\" & Fichier
            Set Projet = Nothing
        End If
        UpdateStatus GetFileSize(Source & "\" & Fichier)
    Next
    CopyR�pertoire = True

End Function

Private Sub btnRepDestination_Click()

Dim Repert As String

    Repert = ChoixRepertoireExistant("Choisissez le r�pertoire de destination des fichiers d'installation", "Choisissez un r�pertoire", (txtR�pertoireDestination.Text))
    If Repert <> "" Then
        txtR�pertoireDestination.Text = Repert
        txtR�pertoireDestination.SelStart = 0
        txtR�pertoireDestination.SelLength = Len(txtR�pertoireDestination.Text)
    End If

End Sub

Private Sub btnRepHACCP_Click()

Dim Repert As String

    Repert = ChoixRepertoireExistant("Choisissez le r�pertoire contenant les fichiers d'installation de HACCP.EXE", "Choisissez un r�pertoire", (txtR�pertoireHaccp.Text))
    If Repert <> "" Then
        txtR�pertoireHaccp.Text = Repert
        txtR�pertoireHaccp.SelStart = 0
        txtR�pertoireHaccp.SelLength = Len(txtR�pertoireHaccp.Text)
    End If

End Sub

Private Sub btnRepModule_Click()

Dim Repert As String

    Repert = ChoixRepertoireExistant("Choisissez le r�pertoire contenant le module � installer avec HACCP.EXE", "Choisissez un r�pertoire", (txtR�pertoireModule.Text))
    If Repert <> "" Then
        txtR�pertoireModule.Text = Repert
        txtR�pertoireModule.SelStart = 0
        txtR�pertoireModule.SelLength = Len(txtR�pertoireModule.Text)
    End If

End Sub


Private Sub chkModule_Click()
    refreshboutons
End Sub

Private Sub Form_Load()

Dim chaine As String * 100
Dim chaine1 As String * 100
Dim cr As Integer
Dim hMod As Integer
Const INSIDE_SOLID = 6
Const COPY_PEN = 13
Const PIXELS = 3

DrawStyle = INSIDE_SOLID
DrawMode = COPY_PEN
DrawWidth = 2 'Required for dithering
ScaleMode = PIXELS
ScaleHeight = 256
Dim i As Integer

    For i = 0 To 255
     Line (0, i)-(Me.Width, i + 1), RGB(0, i, 255 - i), B
    Next i


    On Error Resume Next
    HourGlass "show"

    'r�cup�re le r�pertoire de l'ex�cutable
    hMod = GetModuleHandle(NOM_MODULE_EXE)
    If hMod <> 0 Then
        cr = GetModuleFilename(hMod, chaine, 100)
        SeparePathFilename Left$(chaine, cr), RepertoireApplication, chaine1
    Else
        'r�pertoire principal en cas d'ex�cution depuis VB
        On Error Resume Next
        cr = FileLen("f:\real\haccp\genbase.vbp")
        If cr Then
            RepertoireApplication = "f:\real\haccp"
        Else
            cr = FileLen("c:\real\haccp\genbase.vbp")
            If cr Then
                RepertoireApplication = "c:\real\haccp"
            End If
        End If
        On Error GoTo 0
    End If
    
    'r�cup�re le r�pertoire de windows
    cr = GetWindowsDirectory(chaine, 100)
    RepertoireWindows = Left$(chaine, cr)

    'adapte les titres
    Caption = NOM_COURT_APPLICATION & " " & VERSION_APPLICATION
    NomApplication = NOM_COURT_APPLICATION

    On Error GoTo 0
    
    'initialisations au chargement
    FichierConfig = RepertoireApplication & "\" & FICHIER_CONFIG
    txtR�pertoireHaccp.Text = GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_REPERTOIRE_HACCP)
    txtR�pertoireModule.Text = GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_REPERTOIRE_MODULE)
    chkModule.Value = -CInt(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_INSTALLER_MODULE) <> "0")
    optDestination(Val(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_DESTINATION))).Value = 1
    txtR�pertoireDestination.Text = GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_REPERTOIRE_DESTINATION)
    App.HelpFile = RepertoireApplication & "\genbase.hlp"
    
    'redessine les menus
    MetAJourMenus

    'apparition de la fen�tre principale
    FormMain.Show

    HourGlass "hide"
    
    
End Sub






Private Sub Form_Unload(Cancel As Integer)

Dim cr As Integer
Dim i As Integer

    HourGlass "show"
        
    'm�morise les choix effectuer
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_REPERTOIRE_HACCP, txtR�pertoireHaccp.Text
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_REPERTOIRE_MODULE, txtR�pertoireModule.Text
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_INSTALLER_MODULE, chkModule.Value
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_DESTINATION, optDestination(0).Tag
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_REPERTOIRE_DESTINATION, txtR�pertoireDestination.Text
    
    HourGlass "hide"

End Sub



Private Sub Label4_Click(Index As Integer)
    optDestination(Index).Value = 1
End Sub


Private Sub MnuAide_Click()
    WinHelpVB FormMain.CmDialog1, RepertoireApplication & "\genbase.hlp", HELP_INDEX, 1
End Sub

Private Sub MnuApropos_Click()
    formAboutBox.Show MODAL
End Sub




Private Sub MnuQuitter_Click()
    Unload Me
End Sub



Private Sub refreshboutons()

    txtR�pertoireModule.Enabled = chkModule.Value <> 0
    btnRepModule.Enabled = txtR�pertoireModule.Enabled
    btnG�n�rer.Enabled = Trim$(txtR�pertoireHaccp.Text) <> "" And (chkModule.Value = 0 Or (chkModule.Value <> 0 And Trim$(txtR�pertoireModule.Text) <> ""))
    txtR�pertoireDestination.Enabled = optDestination(0).Tag = "1"
    btnRepDestination.Enabled = txtR�pertoireDestination.Enabled
    
End Sub


Private Sub optDestination_Click(Index As Integer)
    optDestination(0).Tag = Index
    refreshboutons
End Sub

Private Sub txtR�pertoireHaccp_Change()
    refreshboutons
End Sub


Private Sub txtR�pertoireModule_Change()
    refreshboutons
End Sub


