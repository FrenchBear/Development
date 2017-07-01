VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmAfficheImage 
   Caption         =   "AfficheImage"
   ClientHeight    =   5145
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   10245
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAfficheImage.frx":0000
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
   Begin MSComctlLib.Toolbar tbBoutons 
      Height          =   390
      Left            =   75
      TabIndex        =   4
      Top             =   75
      Width           =   3330
      _ExtentX        =   5874
      _ExtentY        =   688
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      ImageList       =   "ImageList"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   12
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Open"
            Object.ToolTipText     =   "Balayer (?)"
            ImageKey        =   "imgOpen"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "First"
            Object.ToolTipText     =   "Première image (Début)"
            ImageKey        =   "imgFirst"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Previous"
            Object.ToolTipText     =   "Image précédente (-)"
            ImageKey        =   "imgPrevious"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Next"
            Object.ToolTipText     =   "Image suivante (+)"
            ImageKey        =   "imgNext"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Last"
            Object.ToolTipText     =   "Dernière image (Fin)"
            ImageKey        =   "imgLast"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Random"
            Object.ToolTipText     =   "Sélectionne une image au hasard (*)"
            ImageKey        =   "imgRandom"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Delete"
            Object.ToolTipText     =   "Efface l'image (Suppr)"
            ImageKey        =   "imgDelete"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Fichiers"
            Object.ToolTipText     =   "Affiche la liste des fichiers"
            ImageKey        =   "imgFichiers"
         EndProperty
      EndProperty
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
      Left            =   3600
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
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   300
      Left            =   0
      TabIndex        =   3
      Top             =   4845
      Width           =   10245
      _ExtentX        =   18071
      _ExtentY        =   529
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   9843
            Key             =   "Fichier"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Key             =   "Résolution"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Key             =   "Taille"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Key             =   "Echelle"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
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
      Left            =   4980
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   105
      Width           =   3015
   End
   Begin MSComctlLib.ImageList ImageList 
      Left            =   6720
      Top             =   3300
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAfficheImage.frx":0442
            Key             =   "imgOpen"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAfficheImage.frx":0554
            Key             =   "imgFirst"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAfficheImage.frx":0666
            Key             =   "imgPrevious"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAfficheImage.frx":0778
            Key             =   "imgNext"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAfficheImage.frx":088A
            Key             =   "imgLast"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAfficheImage.frx":099C
            Key             =   "imgRandom"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAfficheImage.frx":0AAE
            Key             =   "imgDelete"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAfficheImage.frx":0BC0
            Key             =   "imgFichiers"
         EndProperty
      EndProperty
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
      Begin VB.Menu sep3c 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAutomatique 
         Caption         =   "&Automatique..."
      End
      Begin VB.Menu sep4b2 
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
      Begin VB.Menu sep3b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdNettoyage 
         Caption         =   "Nettoyage"
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
      Begin VB.Menu sep4b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdListeFichiers 
         Caption         =   "&Liste de fichiers"
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
' 11/10/98 PV 1.4 Mécanisme LastKey (espace) fonctionne su action précédente à la souris
' 20/12/98 PV 1.5 Liste des fichiers
' 10/01/99 PV     Bouton "Liste des fichiers" dans la barre de boutons; synchro image affichée/sélection de frmFichiers
'  7/02/99 PV     Sélection récursive à 1 niveau
' 20/04/02 PV     Limite à 32767 images (une combo ne peut pas contenur un nb d'éléments long...)


Option Explicit

Dim sRep As String              ' Répertoire contenant les images
Public iPos As Integer          ' N° de l'image courante, de 0 à ...
Dim LastKeyAscii As Integer     ' Code de la dernière commande pour répétition avec la barre d'espace

Dim hist As New Historique      ' Liste des images parcourues

Enum EnumAuto                   ' Modes de navigation automatique
  AUTO_AUCUN
  AUTO_SUIVANT
  AUTO_HASARD
End Enum

Dim iAuto As EnumAuto           ' Mode courant de navigation automatique

Dim fso As FileSystemObject     ' Accès à l'objet FileSystem du scripting


Private Sub Analyse1Rep(sRel As String)
  Dim sFic As String
  
  ' D'abord les fichiers du répertoire
  ' L'accès avec l'objet FileSystem est beaucoup trop lent...
  sFic = Dir(sRep & sRel & "*", vbNormal Or vbReadOnly Or vbArchive)
  While sFic <> ""
    sFic = LCase(sFic)
    If Right(sFic, 4) = ".gif" Or Right(sFic, 4) = ".bmp" Or Right(sFic, 5) = ".html" Or Right(sFic, 4) = ".jpg" Or Right(sFic, 5) = ".jpeg" Then
      ' Par convention on ignore les fichiers dont le nom commence par !
      If Left(sFic, 1) <> "!" Then
        If cboFichiers.ListCount < 32766 Then
          cboFichiers.AddItem sRel & sFic
          If cboFichiers.ListCount Mod 100 = 0 Then
            sbStatus.SimpleText = "Analyse des images du dossier " & sRep & sRel & ": " & cboFichiers.ListCount & " images"
          End If
        End If
      End If
    End If
    sFic = Dir
  Wend
  
  ' Puis on analyse les sous-répertoires
  Dim fo As Folder, sfo As Folder
  Set fo = fso.GetFolder(sRep & sRel)
  For Each sfo In fo.SubFolders
    sFic = LCase(sfo.Name)
    Analyse1Rep sRel & sFic & "\"
  Next
End Sub


Private Sub BalayerImages()
  Dim sRepNouv As String
  
  LastKeyAscii = Asc("?")
  If sRep = "" Then sRep = GetSetting(App.EXEName, "Config", "Path", "C:\")
  If Right(sRep, 1) = "\" And Len(sRep) > 3 Then sRep = Left(sRep, Len(sRep) - 1)
  sRepNouv = sBrowseForFolder(Me.hwnd, sRep, "Sélectionnez le répertoire contenant les images." & vbCrLf & "Précédent: " & sRep)
  If sRepNouv = "" Then Exit Sub
  sRep = sRepNouv
  SaveSetting App.EXEName, "Config", "Path", sRep
  If Right(sRep, 1) <> "\" Then sRep = sRep & "\"
  
  Unload frmFichiers
  bFrmFichiersChargé = False
  
  Screen.MousePointer = vbHourglass
  cboFichiers.Visible = False
  cboFichiers.clear
  hist.clear
  
  Set fso = New FileSystemObject
  sbStatus.SimpleText = "Analyse des images du dossier " & sRep
  sbStatus.Refresh
  Analyse1Rep ""
  Set fso = Nothing
  
  sbStatus.SimpleText = ""
  iPos = 0
  AfficheImage
  cboFichiers.Visible = True
  Screen.MousePointer = vbDefault
End Sub

Private Sub NavigueHasard()
  LastKeyAscii = Asc("*")
  If cboFichiers.ListCount = 0 Then Exit Sub
  iPos = Int(cboFichiers.ListCount * Rnd)
  AfficheImage
End Sub

Private Sub NavigueDébut()
  iPos = 0
  AfficheImage
End Sub

Private Sub NaviguePrécédent()
  LastKeyAscii = Asc("-")
  If iPos > 0 Then
    iPos = iPos - 1
    AfficheImage
  End If
End Sub

Private Sub NavigueSuivant()
  LastKeyAscii = Asc("+")
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
  
  ' On synchronise la sélction de frmFichiers
  If bFrmFichiersChargé Then
    Let frmFichiers.lvFichiers.SelectedItem = frmFichiers.lvFichiers.ListItems(iPos + 1)
  End If
  
  On Error Resume Next
  cboFichiers.ListIndex = iPos
  Image2.Picture = LoadPicture(sRep & cboFichiers.Text)
  If Err Then
    Image1.Picture = LoadPicture
    Image1.Print "Échec à l'ouverture de " & sRep & cboFichiers.Text & vbCrLf & "Erreur " & Err & ": " & Error
    Caption = "AfficheImage"
    sbStatus.Panels("Fichier") = ""
    sbStatus.Panels("Résolution") = ""
    sbStatus.Panels("Taille") = ""
    sbStatus.Panels("Echelle") = ""
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


Public Sub SupprimeImage()
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
  
  Dim i As Integer
  i = cboFichiers.ListIndex
  cboFichiers.RemoveItem i
  If i = cboFichiers.ListCount Then i = i - 1
  cboFichiers.ListIndex = i
  AfficheImage
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

Private Sub ListeFichiers()
  Dim l As ListView, i As Integer
  Set l = frmFichiers.lvFichiers
  Dim x As ListItem
  If l.ListItems.count = 0 Then
    Screen.MousePointer = vbHourglass
    For i = 0 To cboFichiers.ListCount - 1
      l.ListItems.Add , , cboFichiers.List(i)
    Next
    Screen.MousePointer = vbDefault
  End If
  
  bFrmFichiersChargé = True
  Let frmFichiers.lvFichiers.SelectedItem = frmFichiers.lvFichiers.ListItems(iPos + 1)
  frmFichiers.Show
End Sub

Private Sub cmdNettoyage_Click()
  Do While iPos < cboFichiers.ListCount - 1
    If Image2.Width <= 2 Then
      Stop
    Else
      NavigueSuivant
    End If
  Loop
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
    Case "?": Clic "Open", True: BalayerImages: Clic "Open", False
    Case "-": Clic "Previous", True: NaviguePrécédent: Clic "Previous", False
    Case "+", Chr(13): Clic "Next", True: NavigueSuivant: Clic "Next", False
    Case "*": Clic "Random", True: NavigueHasard: Clic "Random", False
  End Select
End Sub

Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  Unload frmFichiers      ' La feuille des fichiers n'est pas modale
End Sub

' ===================================================
' Barre de boutons

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "Open":      BalayerImages
    Case "First":     NavigueDébut
    Case "Previous":  NaviguePrécédent
    Case "Next":      NavigueSuivant
    Case "Last":      NavigueFin
    Case "Random":    NavigueHasard
    Case "Delete":    SupprimeImage
    Case "Fichiers":  ListeFichiers
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

Private Sub cmdListeFichiers_Click()
  ListeFichiers
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
  
  cmdBalayer_Click
End Sub

Private Sub Form_Resize()
  If ScaleWidth > 500 Then
    chkAjuster.Left = ScaleWidth - 145
    chkStretch.Left = ScaleWidth - 145
    cboFichiers.Width = ScaleWidth - 480
  End If
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
    'AfficheImage
    'Print #1, "<IMG src=" & Chr(34) & "" & cboFichiers.List(i) & Chr(34) & " width=" & Int(Image2.Width * 0.4) & " height="; Int(Image2.Height * 0.4) & "><BR><BR>"
    'DoEvents
    
    Print #1, "<IMG src=" & Chr(34) & "" & cboFichiers.List(i) & Chr(34) & "><BR><BR>"
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

