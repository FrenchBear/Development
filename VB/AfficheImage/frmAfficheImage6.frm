VERSION 5.00
Begin VB.Form frmAfficheImage 
   Caption         =   "AfficheImage"
   ClientHeight    =   5145
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10245
   ClipControls    =   0   'False
   Icon            =   "frmAfficheImage6.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   OLEDropMode     =   1  'Manual
   ScaleHeight     =   343
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   683
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkStretch 
      Caption         =   "&Réduire si trop grand"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   8040
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   60
      Value           =   1  'Checked
      Width           =   2160
   End
   Begin VB.PictureBox tbBoutons 
      Height          =   390
      Left            =   75
      ScaleHeight     =   330
      ScaleWidth      =   2865
      TabIndex        =   4
      Top             =   75
      Width           =   2925
   End
   Begin VB.TextBox lblPos 
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3360
      Locked          =   -1  'True
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   105
      Width           =   1215
   End
   Begin VB.Timer tmrTim 
      Left            =   9120
      Top             =   600
   End
   Begin VB.PictureBox sbStatus 
      Align           =   2  'Align Bottom
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   0
      ScaleHeight     =   240
      ScaleWidth      =   10185
      TabIndex        =   3
      Top             =   4845
      Width           =   10245
   End
   Begin VB.CheckBox chkAjuster 
      Caption         =   "Aj&uster à la fenêtre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8040
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   240
      Value           =   1  'Checked
      Width           =   2040
   End
   Begin VB.ComboBox cboFichiers 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4740
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   105
      Width           =   3015
   End
   Begin VB.PictureBox ImageList 
      BackColor       =   &H80000005&
      Height          =   480
      Left            =   6720
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   6
      Top             =   3300
      Width           =   1200
   End
   Begin VB.Image Image2 
      Height          =   1815
      Left            =   6720
      Top             =   1200
      Visible         =   0   'False
      Width           =   2775
   End
   Begin VB.Image Image1 
      Height          =   3495
      Left            =   60
      OLEDropMode     =   1  'Manual
      Top             =   600
      Width           =   6015
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdBalayer 
         Caption         =   "&Balayer..."
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdDébut 
         Caption         =   "&Début"
      End
      Begin VB.Menu cmdPrécédent 
         Caption         =   "&Précédent"
      End
      Begin VB.Menu cmdSuivant 
         Caption         =   "&Suivant"
      End
      Begin VB.Menu cmdFin 
         Caption         =   "&Fin"
      End
      Begin VB.Menu sep2b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdHasard 
         Caption         =   "Au &hasard"
      End
      Begin VB.Menu sep3b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAutomatique 
         Caption         =   "&Automatique..."
      End
      Begin VB.Menu sep4b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdRetour 
         Caption         =   "&Retour"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuEdition 
      Caption         =   "&Edition"
      Begin VB.Menu cmdCopier 
         Caption         =   "Co&pier"
         Shortcut        =   ^C
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSupprimer 
         Caption         =   "&Supprimer"
         Shortcut        =   {DEL}
      End
   End
   Begin VB.Menu mnuCommandes 
      Caption         =   "&Commandes"
      Begin VB.Menu cmdHTML 
         Caption         =   "&Générer HTML..."
      End
      Begin VB.Menu cmdContact 
         Caption         =   "&Planche de contact..."
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu cmdEditer 
         Caption         =   "&Editer"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAbout 
         Caption         =   "&A propos de..."
      End
   End
End
Attribute VB_Name = "frmAfficheImage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' AfficheImage
' Application de navigation simple dans une liste d'images
' Avril 1997, P.Violent
' 15/05/97 PV     Drag'n'drop OLE
' 24/05/97 PV     Édition, effacement de l'image après un suppr, contrôle du dossier à balayer, dossier par défaut
' 25/05/97 PV     Historique, paramétrage de la planche de contact
' 26/05/97 PV     Mode automatique; Boîte A propos spécialisée; police Verdana
' 11/11/97 PV     Effacement dans la corbeille (suite à un effacement malheureux !)
' 15/11/97 PV     Edition correcte des fichiers contenant des espaces
' 07/09/98 PV 1.2 Utilisation du dialogue "Browse for folder"
' 12/09/98 PV 1.3 Barre de boutons, navigation complète

Option Explicit

Dim sRep As String              ' Répertoire contenant les images
Dim iPos As Integer             ' N° de l'image courante, de 0 à ...
Dim LastKeyAscii As Integer     ' Code de la dernière commande pour répétition avec la barre d'espace

Dim hist As New Historique      ' Liste des images parcourues

Enum EnumAuto                   ' Modes de navigation automatique
  AUTO_AUCUN
  AUTO_SUIVANT
  AUTO_HASARD
End Enum

Dim iAuto As EnumAuto           ' Mode courant de navigation automatique


Function bOkDir(sDir As String) As Boolean
  bOkDir = Dir(sDir, vbDirectory) <> ""
End Function


Private Sub BalayerImages()
  Dim sFic As String, sRepNouv As String
  
  If sRep = "" Then sRep = GetSetting(App.EXEName, "Config", "Path", "C:\")
  If Right(sRep, 1) = "\" And Len(sRep) > 3 Then sRep = Left(sRep, Len(sRep) - 1)
  sRepNouv = sBrowseForFolder(Me.hwnd, sRep, "Sélectionnez le répertoire contenant les images." & vbCrLf & "Précédent: " & sRep)
  If sRepNouv = "" Then Exit Sub
  sRep = sRepNouv
  SaveSetting App.EXEName, "Config", "Path", sRep
  
  cboFichiers.Visible = False
  cboFichiers.clear
  hist.clear
  If Right(sRep, 1) <> "\" Then sRep = sRep & "\"
  sFic = Dir(sRep & "*.*", vbNormal + vbReadOnly + vbArchive)
  sbStatus.SimpleText = "Analyse des images du dossier " & sRep
  sbStatus.Refresh
  While sFic <> ""
    sFic = LCase(sFic)
    If Right(sFic, 4) = ".gif" Or Right(sFic, 4) = ".bmp" Or Right(sFic, 4) = ".htm" Or Right(sFic, 5) = ".html" Or Right(sFic, 4) = ".jpg" Or Right(sFic, 5) = ".jpeg" Then
      ' Par convention on ignore les fichiers dont le nom commence par !
      If Left(sFic, 1) <> "!" Then
        cboFichiers.AddItem sFic
        If cboFichiers.ListCount Mod 100 = 0 Then
          sbStatus.SimpleText = "Analyse des images du dossier " & sRep & ": " & cboFichiers.ListCount & " images"
          'DoEvents
        End If
      End If
    End If
    sFic = Dir()
  Wend
  sbStatus.SimpleText = ""
  iPos = 0
  AfficheImage
  cboFichiers.Visible = True
End Sub

Private Sub NavigueHasard()
  If cboFichiers.ListCount = 0 Then Exit Sub
  iPos = Int(cboFichiers.ListCount * Rnd)
  AfficheImage
End Sub

Private Sub NavigueDébut()
  iPos = 0
  AfficheImage
End Sub

Private Sub NaviguePrécédent()
  If iPos > 0 Then
    iPos = iPos - 1
    AfficheImage
  End If
End Sub

Private Sub NavigueSuivant()
  If iPos < cboFichiers.ListCount - 1 Then
    iPos = iPos + 1
    AfficheImage
  End If
End Sub

Private Sub NavigueFin()
  iPos = cboFichiers.ListCount - 1
  If iPos < 0 Then iPos = 0
  AfficheImage
End Sub


Sub AfficheImage()
  ' Cas où il n'y a rien de chargé
  If cboFichiers.ListCount = 0 Then Exit Sub
  
  On Error Resume Next
  cboFichiers.ListIndex = iPos
  Image2.Picture = LoadPicture(sRep & cboFichiers.Text)
  If Err Then
    Image1.Picture = LoadPicture
    Image1.Print "Échec à l'ouverture de " & sRep & cboFichiers.Text & vbCrLf & "Erreur " & Err & ": " & Error
    Caption = "AfficheImage"
    sbStatus.Panels.clear
  Else
    On Error GoTo 0
    DoAffichage
    Caption = cboFichiers.Text & " - AfficheImage"
    hist.Ajoute iPos
  End If
  lblPos = iPos + 1 & "/" & cboFichiers.ListCount
End Sub

Sub DoAffichage()
  If cboFichiers.Text = "" Then Exit Sub
  
  sbStatus.Panels("Fichier") = sRep & cboFichiers.Text
  sbStatus.Panels("Résolution") = Image2.Width & " x " & Image2.Height
  sbStatus.Panels("Taille") = Format(FileLen(sRep & cboFichiers.Text) / 1024, "#.0 K")
  If chkStretch Then
    Dim r1 As Single, r2 As Single
    r1 = (frmAfficheImage.ScaleWidth - 8) / Image2.Width
    r2 = (frmAfficheImage.ScaleHeight - 63) / Image2.Height
    If r2 < r1 Then r1 = r2
    If chkAjuster = 0 Then If r1 > 1 Then r1 = 1
    Image1.Picture = LoadPicture
    If r1 < 0 Then Exit Sub
    Image1.Move Image1.Left, Image1.Top, Image2.Width * r1, Image2.Height * r1
    sbStatus.Panels("Echelle") = Format(r1, "#%")
  Else
    sbStatus.Panels("Echelle") = "100%"
  End If
  Image1.Picture = Image2.Picture
End Sub


Private Sub cboFichiers_Click()
  If iPos <> cboFichiers.ListIndex Then
    iPos = cboFichiers.ListIndex
    AfficheImage
  End If
End Sub

Private Sub chkAjuster_Click()
  DoAffichage
End Sub

Private Sub chkStretch_Click()
  Image1.Stretch = chkStretch
  chkAjuster.Enabled = chkStretch
  DoAffichage
End Sub

Private Sub NavigueAutomatique()
  If cboFichiers.ListCount = 0 Then Exit Sub
  
  frmAutomatique.Show 1
  If frmAutomatique.chkOk = 0 Then Exit Sub

  If frmAutomatique.optAucun Then
    iAuto = AUTO_AUCUN
    tmrTim.Enabled = False
    Exit Sub
  ElseIf frmAutomatique.optAléatoire Then
    iAuto = AUTO_HASARD
  Else
    iAuto = AUTO_SUIVANT
  End If
  tmrTim.Interval = 1000 * frmAutomatique.txtDélai
  tmrTim.Enabled = True
End Sub

Private Sub NavigueRetour()
  If hist.count > 1 Then
    iPos = hist.Back
    AfficheImage
  End If
End Sub

Private Sub CopieImage()
  If cboFichiers.Text = "" Then Exit Sub

  Clipboard.clear
  Clipboard.SetData Image1.Picture
End Sub


Private Sub SupprimeImage()
  If cboFichiers.Text = "" Then Exit Sub

  sbStatus.SimpleText = sRep & cboFichiers.Text & " : Suppression en cours"
  Screen.MousePointer = vbHourglass
  
  Dim iErr As Long
  iErr = EffaceFichierCorbeille(Me.hwnd, sRep & cboFichiers.Text)
  If iErr Then
    MsgBox "Échec à la suppression du fichier " & sRep & cboFichiers.Text & vbCrLf & "Err: " & Err & Error
  Else
    Image1.Picture = LoadPicture
    sbStatus.SimpleText = sRep & cboFichiers.Text & " : Supprimé (envoyé à la corbeille)"
  End If
  Screen.MousePointer = vbDefault
End Sub


' ===================================================
' Raccourcis clavier

Private Sub Clic(sButtonKey As String, bPressed As Boolean)
  If bPressed Then
    tbBoutons.Buttons(sButtonKey).Value = tbrPressed
    tbBoutons.Refresh
  Else
    tbBoutons.Buttons(sButtonKey).Value = tbrUnpressed
  End If
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Select Case KeyCode
    Case vbKeyHome: Clic "First", True: NavigueDébut: Clic "First", False
    Case vbKeyEnd:  Clic "Last", True: NavigueFin: Clic "Last", False
    Case vbKeyBack: NavigueRetour
  End Select
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If KeyAscii = 32 Then KeyAscii = LastKeyAscii
  Select Case Chr(KeyAscii)
    Case "?": Clic "Open", True: BalayerImages: Clic "Open", False: LastKeyAscii = KeyAscii
    Case "-": Clic "Previous", True: NaviguePrécédent: Clic "Previous", False: LastKeyAscii = KeyAscii
    Case "+": Clic "Next", True: NavigueSuivant: Clic "Next", False: LastKeyAscii = KeyAscii
    Case "*": Clic "Random", True: NavigueHasard: Clic "Random", False: LastKeyAscii = KeyAscii
  End Select
End Sub


' ===================================================
' Barre de boutons

Private Sub tbBoutons_ButtonClick(ByVal Button As ComctlLib.Button)
  Select Case Button.Key
    Case "Open":      BalayerImages
    Case "First":     NavigueDébut
    Case "Previous":  NaviguePrécédent
    Case "Next":      NavigueSuivant
    Case "Last":      NavigueFin
    Case "Random":    NavigueHasard
    Case "Delete":    SupprimeImage
    Case Else:        Stop
  End Select
End Sub



' ===================================================
' Menus

Private Sub cmdBalayer_Click()
  BalayerImages
End Sub


Private Sub cmdDébut_Click()
  NavigueDébut
End Sub

Private Sub cmdPrécédent_Click()
  NaviguePrécédent
End Sub

Private Sub cmdSuivant_Click()
  NavigueSuivant
End Sub

Private Sub cmdFin_Click()
  NavigueFin
End Sub


Private Sub cmdHasard_Click()
  NavigueHasard
End Sub

Private Sub cmdAutomatique_Click()
  NavigueAutomatique
End Sub

Private Sub cmdRetour_Click()
  NavigueRetour
End Sub


Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Sub cmdCopier_Click()
  CopieImage
End Sub

Private Sub cmdSupprimer_Click()
  SupprimeImage
End Sub



Private Sub cmdEditer_Click()
  If cboFichiers.Text = "" Then Exit Sub
  
  FileShellExecute hwnd, Chr(34) & sRep & cboFichiers.Text & Chr(34)
End Sub




Private Sub cmdAbout_Click()
  frmAPropos.Show 1
End Sub


' ===================================================


Private Sub Form_Load()
  cmdBalayer.Caption = "&Balayer" & vbTab & "?"
  cmdDébut.Caption = "&Début" & vbTab & "Début"
  cmdPrécédent.Caption = "&Précédent" & vbTab & "-"
  cmdSuivant.Caption = "&Suivant" & vbTab & "+"
  cmdFin.Caption = "&Fin" & vbTab & "Fin"
  cmdHasard.Caption = "Au &hasard" & vbTab & "*"
  cmdRetour.Caption = "&Retour" & vbTab & "Ret.Arr"
  cmdQuitter.Caption = "&Quitter" & vbTab & "Alt+F4"
  
  Randomize
  Image1.Stretch = chkStretch
  Show
  tbBoutons.Refresh
End Sub

Private Sub Form_Resize()
  Form_Paint
  DoAffichage
End Sub

Private Sub Form_Paint()
  Line (0, 0)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-Step(ScaleWidth, 0), vb3DHighlight

  Line (0, 33)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 34)-Step(ScaleWidth, 0), vb3DHighlight
End Sub



Private Sub cmdHTML_Click()
  If cboFichiers.ListCount = 0 Then Exit Sub
  
  Dim i As Integer
  Dim sFic As String
  
  sFic = sRep & "!images.htm"
  sFic = InputBox("Nom du fichier à générer ?", , sFic)
  If sFic = "" Then Exit Sub
  
  Screen.MousePointer = vbHourglass
  
  Open sFic For Output As #1
  Print #1, "<HTML>"
  Print #1, "<HEAD>"
  Print #1, "<TITLE>Images de " & sRep & "</TITLE>"
  Print #1, "<!-- Généré le " & Format(Now, "ddd dd/mm/yyyy hh:nn:ss") & "-->"
  Print #1, "</HEAD>"
  Print #1, "<BODY>"
  Print #1, "<H1>Images de " & sRep & "</H1>"
  For i = 0 To cboFichiers.ListCount - 1
    iPos = i
    AfficheImage
    Print #1, "<IMG src=" & Chr(34) & "" & cboFichiers.List(i) & Chr(34) & " width=" & Int(Image2.Width * 0.4) & " height="; Int(Image2.Height * 0.4) & "><BR><BR>"
    DoEvents
  Next
  Print #1, "</BODY>"
  Print #1, "</HTML>"
  Close #1
  
  Screen.MousePointer = vbDefault
  
End Sub


Private Sub cmdContact_Click()
  If cboFichiers.ListCount = 0 Then Exit Sub
  
  Dim iVignettesLignes As Integer, iVignettesColonnes As Integer
  Dim iImageLignes As Integer, iImageColonnes As Integer
  
  frmOptionsContact.Show 1
  
  If frmOptionsContact.chkOk = 0 Then Exit Sub
  iVignettesLignes = frmOptionsContact.txtVignettesLignes
  iVignettesColonnes = frmOptionsContact.txtVignettesColonnes
  iImageLignes = frmOptionsContact.txtImageLignes
  iImageColonnes = frmOptionsContact.txtImageColonnes
  
  Dim iRang As Integer, i As Integer, j As Integer, iPlanche As Integer
  Dim sContact As String
  iRang = 0
  iPlanche = 1
  
  frmContact.Show
  frmContact.Move 0, 0, Screen.TwipsPerPixelX * (frmContact.Width / Screen.TwipsPerPixelX - frmContact.ScaleWidth + iImageColonnes + 1), Screen.TwipsPerPixelY * (frmContact.Height / Screen.TwipsPerPixelY - frmContact.ScaleHeight + iImageLignes + 1)
  Do
    sContact = "!contact " & Right(Str(iPlanche + 100), 2) & ".bmp"
    frmContact.Cls
    frmContact.Caption = sContact
    For i = 0 To iVignettesLignes - 1
      For j = 0 To iVignettesColonnes - 1
        If iRang < cboFichiers.ListCount Then
          frmContact.Vignette j, i, sRep, cboFichiers.List(iRang), iVignettesColonnes, iVignettesLignes
          iRang = iRang + 1
        End If
      Next
    Next
    SavePicture frmContact.Image, sRep & sContact
    iPlanche = iPlanche + 1
  Loop Until iRang >= cboFichiers.ListCount
  
  Unload frmContact
End Sub

' ========================================================================
' Drag and drop OLE: liste de fichiers depuis l'explorateur

Private Sub Form_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)
  If Data.GetFormat(vbCFFiles) Then
    'Si le format des données est approprié, indique à la source l'action à exécuter
    Effect = vbDropEffectCopy And Effect
    Exit Sub
  End If
  'Si le format des données est incorrect, pas de déplacement.
  Effect = vbDropEffectNone
End Sub

Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
  cboFichiers.clear
  hist.clear
  
  Dim f, sFic As String
  sRep = ""       ' Chemin absolu pour le drag'n'drop
  For Each f In Data.Files
    sFic = LCase(f)
    If Right(sFic, 4) = ".gif" Or Right(sFic, 4) = ".bmp" Or Right(sFic, 4) = ".htm" Or Right(sFic, 5) = ".html" Or Right(sFic, 4) = ".jpg" Or Right(sFic, 5) = ".jpeg" Then
      ' Par convention on ignore les fichiers dont le nom commence par !
      If Left(sFic, 1) <> "!" Then cboFichiers.AddItem sFic
    End If
  Next
  iPos = 0
  AfficheImage
End Sub

Private Sub Image1_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
  Call Form_OLEDragDrop(Data, Effect, Button, Shift, x, y)
End Sub

Private Sub Image1_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)
  Call Form_OLEDragOver(Data, Effect, Button, Shift, x, y, State)
End Sub

Private Sub tmrTim_Timer()
  Select Case iAuto
    Case AUTO_HASARD:   NavigueHasard
    Case AUTO_SUIVANT:  NavigueSuivant
  End Select
End Sub

