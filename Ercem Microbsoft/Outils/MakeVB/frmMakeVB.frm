VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMakeVB 
   Caption         =   "MakeVB"
   ClientHeight    =   4635
   ClientLeft      =   2505
   ClientTop       =   2025
   ClientWidth     =   7845
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMakeVB.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4635
   ScaleWidth      =   7845
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7845
      _ExtentX        =   13838
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "imlImages"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   8
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnNouveau"
            Object.ToolTipText     =   "Nouveau (Ctrl+N)"
            ImageKey        =   "imgNouveau"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnOuvrir"
            Object.ToolTipText     =   "Ouvrir (Ctrl+O)"
            ImageKey        =   "imgOuvrir"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnEnregistrer"
            Object.ToolTipText     =   "Enregistrer (Ctrl+S)"
            ImageKey        =   "imgEnregistrer"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnAjouterProjet"
            Object.ToolTipText     =   "Ajouter un projet à la liste (Ctrl+A)"
            ImageKey        =   "imgAjouteProjet"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnMake"
            Object.ToolTipText     =   "Compile les projets à générer (Ctrl+M)"
            ImageKey        =   "imgMake"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lwProjets 
      Height          =   2775
      Left            =   0
      TabIndex        =   2
      Top             =   840
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   4895
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Projet"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Etat"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Détail"
         Object.Width           =   6068
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   300
      Left            =   0
      TabIndex        =   1
      Top             =   4335
      Width           =   7845
      _ExtentX        =   13838
      _ExtentY        =   529
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   6960
      Top             =   1260
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      FontSize        =   2,84358e-38
   End
   Begin MSComctlLib.ImageList imlImages 
      Left            =   6900
      Top             =   660
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   12
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":014A
            Key             =   "imgNouveau"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":025C
            Key             =   "imgOuvrir"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":036E
            Key             =   "imgEnregistrer"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":0480
            Key             =   "imgCouper"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":0592
            Key             =   "imgCopier"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":06A4
            Key             =   "imgColler"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":07B6
            Key             =   "imgRechercher"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":08C8
            Key             =   "imgRechercherSuivant2"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":09DA
            Key             =   "imgRemplacer"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":0AEC
            Key             =   "imgRechercherSuivant"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":0BFE
            Key             =   "imgAjouteProjet"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMakeVB.frx":0F18
            Key             =   "imgMake"
         EndProperty
      EndProperty
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Liste de projets :"
      Height          =   210
      Left            =   60
      TabIndex        =   3
      Top             =   540
      Width           =   1620
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdNouveau 
         Caption         =   "&Nouveau"
         Shortcut        =   ^N
      End
      Begin VB.Menu cmdOuvrir 
         Caption         =   "&Ouvrir…"
         Shortcut        =   ^O
      End
      Begin VB.Menu cmdEnregistrer 
         Caption         =   "&Enregistrer"
         Shortcut        =   ^S
      End
      Begin VB.Menu cmdEnregistrerSous 
         Caption         =   "En&registrer sous…"
      End
      Begin VB.Menu sepFichier1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuProjet 
      Caption         =   "&Projet"
      Begin VB.Menu cmdAjouterProjet 
         Caption         =   "&Ajouter…"
         Shortcut        =   ^A
      End
      Begin VB.Menu cmdSupprimerProjet 
         Caption         =   "&Supprimer"
         Shortcut        =   {DEL}
      End
   End
   Begin VB.Menu mnuBuild 
      Caption         =   "&Build"
      Begin VB.Menu cmdMake1 
         Caption         =   "&Make"
      End
      Begin VB.Menu cmdMake 
         Caption         =   "Make all"
         Shortcut        =   ^M
      End
      Begin VB.Menu sepBuild1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "Optio&ns…"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de MakeVB…"
      End
   End
   Begin VB.Menu mnuListe 
      Caption         =   "(Contextuel)"
      Visible         =   0   'False
      Begin VB.Menu cmdAjouterContextuel 
         Caption         =   "&Ajouter…"
      End
      Begin VB.Menu cmdSupprimerContextuel 
         Caption         =   "&Supprimer"
      End
      Begin VB.Menu sepContextuel 
         Caption         =   "-"
      End
      Begin VB.Menu cmdMake1Contextuel 
         Caption         =   "&Make"
      End
   End
End
Attribute VB_Name = "frmMakeVB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MakeVB
' Utilitaire make adapté au VB
' 17/05/1998 P.Violent
'  4/06/1998 PV Chemin d'accès au VB
' 11/06/1998 PV Menu contextuel complet
' 24/08/1999 PV Mise en couleurs, avec le contrôle listview du VB6


Option Explicit

Const sNoList = "Sans titre"

Dim sListePath As String            ' Chemin d'accès de la liste courante
Dim bDirty As Boolean               ' Liste modifiée depuis le dernier enregistrement
Dim bRécursif As Boolean            ' En mode récursif, un projet contient des projets, pas possible d'enregistrer
Public colProjets As New Collection ' Collection des projets

Dim sVBPath As String               ' Chemin d'accès au VB


'===============================================================================
' Interface

Private Sub cmdNouveau_Click()
  DoNouveauInteractif
End Sub

Private Sub cmdOptions_Click()
  Dim sNewVBPath As String
  sNewVBPath = InputBox("Chemin d'accès du compilateur Visual Basic ?", "Options", sVBPath)
  If sNewVBPath <> "" And sNewVBPath <> sVBPath Then
    sVBPath = sNewVBPath
    SaveSetting sNomApp, "Path", "VB", sVBPath
  End If
End Sub

Private Sub cmdOuvrir_Click()
  DoOuvrirInteractif
End Sub

Private Sub cmdEnregistrer_Click()
  bDoEnregistrerInteractif False
End Sub

Private Sub cmdEnregistrerSous_Click()
  bDoEnregistrerInteractif True
End Sub

Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Sub cmdAjouterProjet_Click()
  DoAjouterInteractif
End Sub

Private Sub cmdSupprimerProjet_Click()
  DoSupprimerInteractif
End Sub


Private Sub cmdMake1_Click()
  DoMake1Interactif
End Sub

Private Sub cmdMake_Click()
  DoMakeInteractif
End Sub


Private Sub cmdAPropos_Click()
  MsgBox sNomApp & " " & App.Major & "." & App.Minor & "." & App.Revision & vbCrLf & "Utilitaire make pour le VB" & vbCrLf & vbCrLf & "(c) P.VIOLENT 1998-1999", vbInformation, sNomApp
End Sub


' Menu contextuel

Private Sub cmdAjouterContextuel_Click()
  DoAjouterInteractif
End Sub

Private Sub cmdSupprimerContextuel_Click()
  DoSupprimerInteractif
End Sub

Private Sub cmdMake1Contextuel_Click()
  DoMake1Interactif
End Sub





' Barre de boutons
Private Sub tbBoutons_ButtonClick(ByVal Button As Button)
  Select Case Button.Key
    Case "btnNouveau": cmdNouveau_Click
    Case "btnOuvrir":  cmdOuvrir_Click
    Case "btnEnregistrer": cmdEnregistrer_Click
    Case "btnAjouterProjet": cmdAjouterProjet_Click
    Case "btnMake": cmdMake_Click
    Case Else: Stop
  End Select
End Sub


' Clic droit sur la liste
Private Sub lwProjets_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then PopupMenu mnuListe
End Sub


'===============================================================================
' Gestion de la feuille

Private Sub Form_Resize()
  lwProjets.Width = ScaleWidth
  lwProjets.Height = ScaleHeight - lwProjets.Top - sbStatus.Height
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If Not cmdMake.Enabled Then
    MsgBox "Attendez la fin de la compilation pour quitter.", vbExclamation, sNomApp
    Cancel = 1
    Exit Sub
  End If
  Cancel = IIf(bOkNouveau, 0, 1)
End Sub

Private Sub Form_Load()
  Show
  DoNouveau
  
  sVBPath = GetSetting(sNomApp, "Path", "VB", ".")
  If sVBPath = "." Then sVBPath = ".\vb6.exe"
  
  ' Analyse des arguments
  DécodeTableauArguments
  
  Dim i As Integer
  For i = 1 To iNbArguments
    If Left(TabArguments(i), 1) <> "/" Then bDoOuvrir TabArguments(i)
  Next
  AfficheListe
  
  For i = 1 To iNbArguments
    If StrComp(TabArguments(i), "/make", vbTextCompare) = 0 Then
      DoMakeInteractif
      Unload Me
    End If
  Next
End Sub

Private Sub Form_Paint()
  ' Dessine un trait sous la barre de boutons
  Line (0, tbBoutons.Height)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, tbBoutons.Height + 15)-Step(ScaleWidth, 0), vb3DHighlight
End Sub


'===============================================================================
' Actions interactives

' Détermine s'il faut sauvegarder le projet avant de l'effacer ou de quitter
Private Function bOkNouveau() As Boolean
  If bDirty Then
    Dim i As VbMsgBoxResult
    i = MsgBox("La liste des projets a été modifiée." & vbCrLf & vbCrLf & "Voulez-vous enregistrer les modifications ?", vbQuestion + vbYesNoCancel, sNomApp)
    If i = vbCancel Then
      bOkNouveau = False
      Exit Function
    End If
    
    If i = vbYes Then
      If Not bDoEnregistrerInteractif(False) Then
        bOkNouveau = False
        Exit Function
      End If
    End If
  End If

  bOkNouveau = True
End Function

Private Sub DoNouveauInteractif()
  If Not bOkNouveau Then Exit Sub
  DoNouveau
  lwProjets.ListItems.Clear
  Caption = sNomApp & " - " & sNoList
End Sub

Sub DoOuvrirInteractif()
  If Not bOkNouveau Then Exit Sub
  
  CommonDialog.Flags = cdlOFNFileMustExist Or cdlOFNExplorer Or cdlOFNHideReadOnly
  CommonDialog.FileName = ""
  CommonDialog.MaxFileSize = 32767
  CommonDialog.Filter = "Listes de projets (*.mvb)|*.mvb|Tous les fichiers (*.*)|*.*"
  CommonDialog.ShowOpen
  
  If CommonDialog.FileName = "" Then Exit Sub
  
  EffaceCollection colProjets
  lwProjets.ListItems.Clear
  
  If bDoOuvrir(CommonDialog.FileName) Then AfficheListe
End Sub

Private Sub AfficheListe()
  If bRécursif Then
    Caption = sNomApp & " - Listes multiples"
  Else
    Caption = sNomApp & " - " & sFilePart(sListePath)
  End If
  
  Dim p As Projet
  lwProjets.ListItems.Clear
  For Each p In colProjets
    AjouterProjetListe p
  Next
End Sub


Function bDoEnregistrerInteractif(bDemanderNom As Boolean) As Boolean
  If bDemanderNom Or sListePath = sNoList Then
    CommonDialog.Filter = "Listes de projets (*.mvb)|*.mvb|Tous les fichiers (*.*)|*.*"
    CommonDialog.FileName = sFilePart(sListePath)
    CommonDialog.Flags = cdlOFNExplorer Or cdlOFNHideReadOnly Or cdlOFNOverwritePrompt Or cdlOFNPathMustExist
    CommonDialog.ShowSave
    If CommonDialog.FileName = "" Then
      bDoEnregistrerInteractif = False
      Exit Function
    End If
  End If
  
  bDoEnregistrerInteractif = bDoEnregistrer(CommonDialog.FileName)
  Caption = sNomApp & " - " & sFilePart(sListePath)
End Function

Private Sub DoAjouterInteractif()
  CommonDialog.Flags = cdlOFNAllowMultiselect Or cdlOFNFileMustExist Or cdlOFNExplorer Or cdlOFNHideReadOnly
  CommonDialog.FileName = ""
  CommonDialog.MaxFileSize = 32767
  CommonDialog.Filter = "Projets VB (*.vbp)|*.vbp|Tous les fichiers (*.*)|*.*"
  CommonDialog.ShowOpen
  
  Dim s As String
  s = CommonDialog.FileName
  If s = "" Then Exit Sub
  
  bDoAjouterProjet s
  AjouterProjetListe colProjets(colProjets.Count)
End Sub


Sub AjouterProjetListe(p As Projet)
  Dim x As ListItem
  Set x = lwProjets.ListItems.Add
  x.Text = IIf(p.sTitre = "", p.sPath, p.sTitre)
  x.SubItems(1) = p.sEtat
  With x.ListSubItems(1)
    Select Case p.état
      Case ePasAnalysé: .ForeColor = &H80000008
      Case eAJour: .ForeColor = RGB(0, 128, 0)
      Case eAGénérer: .ForeColor = RGB(0, 0, 128)
      Case eErreur: .ForeColor = RGB(128, 0, 0)
    End Select
  End With
  x.SubItems(2) = p.sEtatDétaillé
End Sub


' Retourne vrai si un item de la liste est sélectionné
Private Function bOkSélection() As Boolean
  If lwProjets.SelectedItem Is Nothing Then
    MsgBox "Sélectionnez un projet à supprimer de la liste.", vbExclamation, sNomApp
    bOkSélection = False
    Exit Function
  End If
  
  If Not lwProjets.ListItems(lwProjets.SelectedItem.Index).Selected Then
    MsgBox "Sélectionnez un projet à supprimer de la liste.", vbExclamation, sNomApp
    bOkSélection = False
    Exit Function
  End If

  bOkSélection = True
End Function


Private Sub DoSupprimerInteractif()
  If Not bOkSélection Then Exit Sub

  colProjets.Remove lwProjets.SelectedItem.Index
  lwProjets.ListItems.Remove lwProjets.SelectedItem.Index
End Sub


Private Sub DoMake1Interactif()
  If Not bOkSélection Then Exit Sub
  
  EnableBuild False
  If colProjets(lwProjets.SelectedItem.Index).bAGénérer Then
    DoMake1Projet colProjets(lwProjets.SelectedItem.Index), lwProjets.SelectedItem.Index
  End If
  EnableBuild True
End Sub

Private Sub DoMakeInteractif()
  EnableBuild False
  Dim i As Integer
  For i = 1 To colProjets.Count
    If colProjets(i).bAGénérer Then
      DoMake1Projet colProjets(i), i
    End If
  Next
  EnableBuild True
End Sub

Private Sub EnableBuild(bEnable As Boolean)
  cmdMake.Enabled = bEnable
  cmdMake1.Enabled = bEnable
  tbBoutons.Buttons("btnMake").Enabled = bEnable
End Sub

Private Sub DoMake1Projet(ByRef p As Projet, i As Integer)
  With lwProjets.ListItems(i).ListSubItems(1)
    .Text = "Compilation"
    .ForeColor = &H80000008
    .Bold = True
  End With
  lwProjets.ListItems(i).SubItems(2) = ""
  lwProjets.ListItems(i).EnsureVisible
  lwProjets.Refresh
  sbStatus.SimpleText = "Compilation de " & p.sTitre
  ShellWait sVBPath & " /m " & Chr(34) & p.sPath & Chr(34)
  sbStatus.SimpleText = ""
  p.bLire p.sPath
  With lwProjets.ListItems(i).ListSubItems(1)
    .Text = p.sEtat
    .Bold = False
    Select Case p.état
      Case ePasAnalysé: .ForeColor = &H80000008
      Case eAJour: .ForeColor = RGB(0, 128, 0)
      Case eAGénérer: .ForeColor = RGB(0, 0, 128)
      Case eErreur: .ForeColor = RGB(128, 0, 0)
    End Select
  End With
  lwProjets.ListItems(i).SubItems(2) = p.sEtatDétaillé
  lwProjets.Refresh
End Sub


'===============================================================================
' Actions non interactives

Private Sub DoNouveau()
  EffaceCollection colProjets
  bDirty = False
  bRécursif = False
  sListePath = sNoList
  cmdEnregistrer.Enabled = True
  cmdEnregistrerSous.Enabled = True
  tbBoutons.Buttons("btnEnregistrer").Enabled = True
End Sub


Function bDoOuvrir(ByVal sNomfic As String) As Boolean
  Dim f As Integer
  f = FreeFile
  Dim sLigne As String
  On Error GoTo Problème
  Open sNomfic For Input As #f
  Line Input #f, sLigne
  If UCase(Trim(sLigne)) <> "MAKEVB 1.0" Then
    MsgBox "Fichier liste de projets '" & sNomfic & "' invalide !", vbCritical, sNomApp
    bDoOuvrir = False
    Close #f
    Exit Function
  End If
  
  While Not EOF(f)
    Line Input #f, sLigne
    If UCase(Right(sLigne, 4)) = ".MVB" Then
      bDoOuvrir sLigne
      bRécursif = True
    Else
      bDoAjouterProjet sLigne
    End If
  Wend
  Close #f
  bDirty = False
  
  sListePath = sNomfic
  bDoOuvrir = True
  
  If bRécursif Then
    cmdEnregistrer.Enabled = False
    cmdEnregistrerSous.Enabled = False
    tbBoutons.Buttons("btnEnregistrer").Enabled = False
  End If
  
  Exit Function
  
Problème:
  MsgBox "Échec lors de la lecture de la liste des projets '" & sNomfic & "'." & vbCrLf & vbCrLf & "Erreur " & Err.Number & " (" & Err.Source & "): " & Err.Description, vbExclamation, sNomApp
  Close #f
  bDoOuvrir = False
  Exit Function
End Function


' Retour faux en cas de problème
Function bDoEnregistrer(ByVal sNomProj As String) As Boolean
  Dim f As Integer
  f = FreeFile
  On Error GoTo Problème
  Open sNomProj For Output As #f
  Print #f, "MAKEVB 1.0"
  Dim p As Projet
  For Each p In colProjets
    Print #f, p.sPath
  Next
  Close #f

  bDoEnregistrer = True
  sListePath = sNomProj
  bDirty = False
  Exit Function
  
Problème:
  MsgBox "Échec lors de l'écriture de la liste des projets." & vbCrLf & vbCrLf & "Err " & Err.Number & " (" & Err.Source & "): " & Err.Description, vbExclamation, sNomApp
  Close #f
  bDoEnregistrer = False
  Exit Function
End Function


' Ajoute un projet à la collection des projets
' Retour faux si problème de lecture
Function bDoAjouterProjet(ByVal sNomfic As String)
  Dim p As New Projet
  If p.bLire(sNomfic) Then
    bDoAjouterProjet = True
  Else
    bDoAjouterProjet = False
  End If
  colProjets.Add p
  bDirty = True
End Function

