VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MDIProjets 
   BackColor       =   &H8000000C&
   Caption         =   "Gestion informatique: Projets et documentation BD"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   10605
   Icon            =   "MDIProjets.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   570
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   1005
      ButtonWidth     =   1508
      ButtonHeight    =   953
      AllowCustomize  =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "ilProjets"
      DisabledImageList=   "ilProjets"
      HotImageList    =   "ilProjets"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   15
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Projets"
            Key             =   "Projet"
            Description     =   "Gestion des projets"
            Object.ToolTipText     =   "Gestion des projets"
            Object.Tag             =   "Projets"
            ImageKey        =   "imgProjet"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Etapes"
            Key             =   "Etape"
            Description     =   "Gestion des Etapes des Projets"
            Object.ToolTipText     =   "Gestion des étapes des projets"
            Object.Tag             =   "Étapes"
            ImageKey        =   "imgEtape"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Incidents"
            Key             =   "GestIncidents"
            Description     =   "Gestion des incidents informatique"
            Object.ToolTipText     =   "Gestion des incidents informatique"
            Object.Tag             =   "Incidents"
            ImageKey        =   "imgIncident"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Jeux"
            Key             =   "Jeux"
            Description     =   "Jeux de données"
            Object.ToolTipText     =   "Gestion des Jeux de données"
            Object.Tag             =   "Jeux"
            ImageKey        =   "imgJeu"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Tables"
            Key             =   "Tables"
            Description     =   "Gestion de la documentation des tables"
            Object.ToolTipText     =   "Gestion de la documentation des tables"
            Object.Tag             =   "Tables"
            ImageKey        =   "imgTab"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Colonnes"
            Key             =   "Colonnes"
            Description     =   "Gestion de la documentation des colonnes"
            Object.ToolTipText     =   "Gestion de la documentation des colonnes"
            Object.Tag             =   "Colonnes"
            ImageKey        =   "imgCol"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Copie"
            Key             =   "Copie"
            Description     =   "Copie"
            Object.ToolTipText     =   "Copie les données dans le presse-papiers"
            Object.Tag             =   "Copie"
            ImageKey        =   "imgCopie"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Impression"
            Key             =   "Impr"
            Description     =   "Impression"
            Object.ToolTipText     =   "Impression des données"
            Object.Tag             =   "Impression"
            ImageKey        =   "imgImpr"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Aperçu"
            Key             =   "Aperçu"
            Description     =   "Aperçu avant impression"
            Object.ToolTipText     =   "Aperçu avant impression"
            Object.Tag             =   "Aperçu"
            ImageKey        =   "imgAperçu"
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Ouaibe"
            Key             =   "Web"
            Description     =   "Accès à Internet"
            Object.ToolTipText     =   "Affiche les informations sur le Web"
            Object.Tag             =   "Web"
            ImageKey        =   "imgWeb"
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
      EndProperty
      BorderStyle     =   1
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   1
      Top             =   6900
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   10292
            Key             =   "Message"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
            Picture         =   "MDIProjets.frx":0442
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connecté"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDIProjets.frx":0994
            Key             =   "DataSource"
            Object.ToolTipText     =   "Source de données"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.ImageList ilProjets 
      Left            =   8220
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   16
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":0D16
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1030
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1142
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1254
            Key             =   "imgIncident"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":16A8
            Key             =   "imgProjet"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1808
            Key             =   "imgEtape"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1968
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1A7C
            Key             =   "imgWeb"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1BD8
            Key             =   "imgAperçu"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1D34
            Key             =   "imgCopie"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1E48
            Key             =   "imgImpr"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":1F68
            Key             =   "imgCol"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":20C4
            Key             =   "imgDoc"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":2518
            Key             =   "imgJeu"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":2674
            Key             =   "imgTab"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIProjets.frx":27D0
            Key             =   "imgPaKaL"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuTable 
      Caption         =   "&Tables"
      Begin VB.Menu cmdProjets 
         Caption         =   "&Projets…"
      End
      Begin VB.Menu cmdEtapes 
         Caption         =   "&Étapes…"
      End
      Begin VB.Menu sep9b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdGestIncidents 
         Caption         =   "&Incidents…"
      End
      Begin VB.Menu sep9 
         Caption         =   "-"
      End
      Begin VB.Menu cmdDocJeux 
         Caption         =   "&Jeux de données"
      End
      Begin VB.Menu cmdDocTables 
         Caption         =   "&Tables"
      End
      Begin VB.Menu cmdDocColonnes 
         Caption         =   "&Colonnes"
      End
      Begin VB.Menu sep10 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConfiguration 
         Caption         =   "&Source de données…"
      End
      Begin VB.Menu cmdUtilisateur 
         Caption         =   "&Utilisateur…"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options…"
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFermer 
         Caption         =   "&Fermer"
         Visible         =   0   'False
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuEnregistrement 
      Caption         =   "&Enregistrement"
      Begin VB.Menu cmdQuery 
         Caption         =   "&Rechercher"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFirst 
         Caption         =   "&Premier"
      End
      Begin VB.Menu cmdPrevious 
         Caption         =   "P&récédent"
      End
      Begin VB.Menu cmdNext 
         Caption         =   "&Suivant"
      End
      Begin VB.Menu cmdLast 
         Caption         =   "&Dernier"
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAdd 
         Caption         =   "&Ajouter"
      End
      Begin VB.Menu cmdChange 
         Caption         =   "&Changer"
      End
      Begin VB.Menu cmdDelete 
         Caption         =   "&Supprimer"
      End
      Begin VB.Menu sep3b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCopie 
         Caption         =   "C&opie"
         Shortcut        =   ^C
      End
      Begin VB.Menu sep3c 
         Caption         =   "-"
      End
      Begin VB.Menu cmdImpr 
         Caption         =   "&Imprimer"
      End
      Begin VB.Menu cmdAperçu 
         Caption         =   "Aperçu a&vant impression…"
      End
   End
   Begin VB.Menu mnuCommandes 
      Caption         =   "&Commandes"
      Begin VB.Menu cmdAjouteColonnes 
         Caption         =   "Ajouter les colonnes d'une table..."
      End
   End
   Begin VB.Menu mnuFenêtre 
      Caption         =   "Fe&nêtre"
      WindowList      =   -1  'True
      Begin VB.Menu cmdWeb 
         Caption         =   "&Web"
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCascade 
         Caption         =   "&Cascade"
      End
      Begin VB.Menu cmdMosaïque 
         Caption         =   "&Mosaïque"
      End
      Begin VB.Menu cmdRéorganiser 
         Caption         =   "&Réorganiser les icônes"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A Propos de…"
      End
   End
   Begin VB.Menu mnuBarreBoutons 
      Caption         =   "(PopUp BdB)"
      Visible         =   0   'False
      Begin VB.Menu cmdBdBEtiquettes 
         Caption         =   "&EtiquettesTexte"
      End
   End
End
Attribute VB_Name = "MDIProjets"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDIProjets
' Feuille MDI principale de la gestion des projets informatiques
' 12/07/1998 PV
'  4/08/1998 PV NoPreviousInstance
'  4/01/1999 PV Gestion des incidents; feuilles multiples
'  1/04/1999 PV 1.1 Impressions
' 16/04/1999 PV Rattrappage d'erreurs lors d'une suppression
'  7/07/1999 PV sSourceODBCDéfaut
' 22/11/2001 PC option ligne de commande -F:NomForm pour ouvrir directement un formulaire au chargement de l'appli
'               option -c:NomCtrl=ValCtrl

Option Explicit
Public bOptFrm As Boolean  ' vrai si option formulaire
Public bOptCtl As Boolean  ' vrai si option controle
Public sNomFrm As String   ' nom du formulaire en option
Public sNomCtrl As String  ' nom d'un contrôle à activer au chargement de l'appli
Public vValCtrl As Variant ' valeur d'un controle

Private Sub ChargementInitial(bDemandeSource As Boolean)
  ChargementInitialCommun Me, bDemandeSource, frmBDODBCLogon.GetSourceODBCDéfaut
  ' Pas de chargement des données
End Sub

Private Sub cmdAjouteColonnes_Click()

  Dim sTable As String
  sTable = InputBox("Nom de table ?")
  If sTable = "" Then Exit Sub
  
  Dim iTabID
  iTabID = BDCurseurExpress("select tabid from systables where tabname='" & sTable & "'")
  If IsEmpty(iTabID) Then
    MsgBox "Table " & sTable & " non trouvée dans le dictionnaire de la base.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim dBDTime As Date
  dBDTime = BDTime
  
  Dim cCol As New BDCurseur, cAjout As New BDCurseur
  cCol.OpenCurseur "select colname from syscolumns where tabid=" & iTabID
  cAjout.OpenCurseur "select * from doccolonnes"
  While Not cCol.EOF
    cAjout.AddNew
    cAjout!dc_table = sTable
    cAjout!dc_colonne = cCol!colname
    cAjout!dc_idmodif = "Ajout colonnes"
    cAjout!timestamp = dBDTime
    cAjout!dc_langue = cSystèmeLang
    On Error Resume Next        ' Si la colonne existe déjà
    cAjout.Update
    If Err Then cAjout.CancelUpdate
    On Error GoTo 0
    cCol.MoveNext
  Wend
  cCol.CloseCurseur
  
  MsgBox "Les colonnes de la table " & sTable & " ont été ajoutées.", vbInformation, App.Title
End Sub

Private Sub cmdOptions_Click()
  frmOptions.Show
End Sub

Private Sub cmdUtilisateur_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDIProjets Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer d'utilisateur !"
    Exit Sub
  End If
  
  If frmBDLogin.iInitUtilisateur(False, True) = 0 Then
    sbStatus.Panels("Utilisateur") = sNomOpérateur & " (" & iNumOpérateur & ")"
  End If
End Sub

Private Sub cmdConfiguration_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDIProjets Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer la source de données !"
    Exit Sub
  End If
  
  ChargementInitial True
End Sub

Private Sub cmdCopie_Click()
  If Not ActiveForm Is Nothing Then ActiveForm.Copie
End Sub

Private Sub cmdImpr_Click()
  On Error Resume Next
  If Left(TypeName(ActiveForm), 2) = "dr" Then    ' DataReport
    ActiveForm.PrintReport
  Else
    ActiveForm.Imprime
  End If
End Sub

Private Sub cmdAperçu_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Aperçu
End Sub

Private Sub cmdProjets_click()
  Dim F
  If bShiftPressed Then
    Set F = New frmProjet
  Else
    Set F = frmProjet
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0
End Sub

Private Sub cmdEtapes_click()
  Dim F
  If bShiftPressed Then
    Set F = New frmEtape
  Else
    Set F = frmEtape
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0
End Sub

Private Sub cmdIncidents_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmMiniProjet
  Else
    Set F = frmMiniProjet
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0
End Sub

Private Sub cmdGestIncidents_Click()
' correction PC 10/10/2001
' miniprojets ==> incidents
  
  Dim F
  If bShiftPressed Then
    Set F = New frmGestIncidents
  Else
    Set F = frmGestIncidents
  End If
  F.Show
  F.ZOrder 0
' prise en compte des options de la ligne de commande
  If bOptFrm And bOptCtl Then
    bOptFrm = False: bOptCtl = False  ' pour ne pas remttre les valeurs en cas de nouvelle ouverture
    Dim c As Control
    For Each c In F.Controls
      If UCase$(c.Name) = sNomCtrl Or UCase$(c.DataField) = sNomCtrl Then
        SendKeys "?", True ' passe en mode recherche
        'frmGestIncidents Form_KeyPress(Chr("?"))
        DoEvents
        c.SetFocus
        c = vValCtrl
        SendKeys "{ENTER}", True
        DoEvents
        Exit For
      End If
    Next c
  End If
  AjusteMenus 0
End Sub

Private Sub cmdDocJeux_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmDocJeu
  Else
    Set F = frmDocJeu
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0
End Sub

Private Sub cmdDocTables_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmDocTable
  Else
    Set F = frmDocTable
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0
End Sub

Private Sub cmdDocColonnes_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmDocColonne
  Else
    Set F = frmDocColonne
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0
End Sub

Private Sub MDIForm_Load()

  Dim sLigCmd As String         ' ligne de commande
  Dim sArgOpt As String         ' argument en option
  Dim sOption As String
  Dim sOptVal As String         ' valeur de l'option
  Dim lPosEga As Long           ' position du signe égal dans l'option
  Dim iCpt As Integer           ' compteur de boucle
  Const cMaxOpt As Integer = 20 ' nombre maxi d'options
  
  ' Internationalisation
  IntlInit

  Caption = App.Title & " - " & App.FileDescription
  NoPreviousInstance Me
  sVersionApp = App.Major & "." & App.Minor & "." & App.Revision
  
  ' Retouche des raccourcis menus (raccourcis que l'on ne peut pas définir dans l'éditeur de menus)
  cmdQuery.Caption = cmdQuery.Caption & Chr(9) & "?"
  cmdFermer.Caption = cmdFermer.Caption & Chr(9) & "Ctrl+F4"
  cmdQuitter.Caption = cmdQuitter.Caption & Chr(9) & "Alt+F4"
  cmdFirst.Caption = cmdFirst.Caption & Chr(9) & "Début"
  cmdPrevious.Caption = cmdPrevious.Caption & Chr(9) & "-"
  cmdNext.Caption = cmdNext.Caption & Chr(9) & "+"
  cmdLast.Caption = cmdLast.Caption & Chr(9) & "Fin"
  cmdAdd.Caption = cmdAdd.Caption & Chr(9) & "A"
  cmdChange.Caption = cmdChange.Caption & Chr(9) & "C"
  cmdDelete.Caption = cmdDelete.Caption & Chr(9) & "Suppr"
  
  AjusteMenus 0
  AjusteEtiquettesBoutons tbBoutons

  Show
  ChargementInitial bShiftPressed
  
' PC 22/11/2001
' analyse de la ligne de commande
  bOptFrm = False: bOptCtl = False
  sLigCmd = UCase$(Command)
  If sLigCmd <> "" Then ' arguments en ligne de commande
    sNomFrm = ""
    On Error Resume Next
    For iCpt = 0 To cMaxOpt
      ' extraction des arguments en option
      sArgOpt = Split(sLigCmd, " ", cMaxOpt, vbTextCompare)(iCpt)
      If Err.Number = 9 Then ' indice en dehors des bornes
        Exit For
      Else
        sOption = Left(sArgOpt, 3)
        Select Case sOption
        Case "-F:"  ' formulaire
          sOptVal = Mid(sArgOpt, 4)
          ' doit être de la forme : "FRMNOM" et si on n'a pas déjà mis cette option
          If Len(sOptVal) >= 6 And Not bOptFrm Then
            bOptFrm = True
            sNomFrm = sOptVal
          End If
        Case "-C:"  ' contrôle
          sOptVal = Mid(sArgOpt, 4): lPosEga = InStr(sOptVal, "=")
' doit être de la forme "-c:NomCtrl=ValCtrl"
          If lPosEga > 4 And Not bOptCtl Then
            sNomCtrl = Left(sOptVal, lPosEga - 1) ' extraction du nom du contrôle
            vValCtrl = Mid(sOptVal, lPosEga + 1)  ' extraction de la valeur du contrôle
            If Len(sNomCtrl) >= 4 And Len(vValCtrl) >= 1 Then bOptCtl = True
          End If
        End Select
      End If
    Next iCpt
    
    If bOptFrm Then   ' option formulaire
      Select Case sNomFrm
        Case "FRMPROJET":         cmdProjets_click
        Case "FRMETAPE":          cmdEtapes_click
        
        Case "FRMMINIPROJET":     cmdIncidents_Click
        Case "FRMGESTINCIDENTS":  cmdGestIncidents_Click
        
        Case "FRMDOCJEU":         cmdDocJeux_Click
        Case "FRMDOCTABLE":       cmdDocTables_Click
        Case "FRMDOCCOLONNE":     cmdDocColonnes_Click
      End Select
    End If
  End If  ' sLigCmd <> ""
End Sub


Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Sub cmdCascade_Click()
  MDIProjets.Arrange vbCascade
End Sub

Private Sub cmdRéorganiser_Click()
  MDIProjets.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosaïque_Click()
  MDIProjets.Arrange vbTileHorizontal
End Sub


Private Sub cmdAPropos_Click()
  frmAbout.APropos Me.Icon
End Sub


' Synchronisation des menus
Private Sub mnuEnregistrement_Click()
  Dim F As Form
  
  Set F = ActiveForm
  cmdQuery.Enabled = F.bdSél.ButtonEnabled("Query")

  cmdFirst.Enabled = F.bdSél.ButtonEnabled("First")
  cmdPrevious.Enabled = F.bdSél.ButtonEnabled("Previous")
  cmdNext.Enabled = F.bdSél.ButtonEnabled("Next")
  cmdLast.Enabled = F.bdSél.ButtonEnabled("Last")

  cmdAdd.Enabled = F.bdSél.ButtonEnabled("Add")
  cmdChange.Enabled = F.bdSél.ButtonEnabled("Change")
  cmdDelete.Enabled = F.bdSél.ButtonEnabled("Delete")
End Sub


Public Sub AjusteMenus(ByVal iOffset As Integer)
  Dim iNbFeuillesChargées As Integer, F As Form
  iNbFeuillesChargées = iOffset
  For Each F In Forms
    If F.Tag = "Données" Then iNbFeuillesChargées = iNbFeuillesChargées + 1
  Next
  
  Dim bFeuilleChargée As Boolean
  bFeuilleChargée = iNbFeuillesChargées > 0
  
  cmdFermer.Visible = bFeuilleChargée
  sep1.Visible = bFeuilleChargée
  mnuEnregistrement.Visible = bFeuilleChargée
  mnuFenêtre.Visible = bFeuilleChargée
  
  tbBoutons.Buttons("Copie").Enabled = bFeuilleChargée
  tbBoutons.Buttons("Impr").Enabled = bFeuilleChargée
  tbBoutons.Buttons("Aperçu").Enabled = bFeuilleChargée
  tbBoutons.Buttons("Web").Enabled = bFeuilleChargée
End Sub



' ===============================================================================
' Menus sous-traités aux feuilles de données

Private Sub cmdQuery_Click()
  ActiveForm.ActionQuery
End Sub

Private Sub cmdFirst_Click()
  ActiveForm.ActionFirst
End Sub

Private Sub cmdPrevious_Click()
  ActiveForm.ActionFirst
End Sub

Private Sub cmdNext_Click()
  ActiveForm.ActionNext
End Sub

Private Sub cmdLast_Click()
  ActiveForm.ActionLast
End Sub

Private Sub cmdAdd_Click()
  ActiveForm.ActionAdd
End Sub

Private Sub cmdChange_Click()
  ActiveForm.ActionChange
End Sub

Private Sub cmdDelete_Click()
  ActiveForm.ActionDelete
End Sub

Private Sub cmdWeb_Click()
  If Not ActiveForm Is Nothing Then ActiveForm.FenêtreWeb
End Sub

Private Sub sbStatus_PanelDblClick(ByVal Panel As MSComctlLib.Panel)
  Select Case Panel.Key
    Case "Utilisateur": cmdUtilisateur_Click
    Case "DataSource":  cmdConfiguration_Click
  End Select
End Sub

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  tbBoutons.Refresh
  Select Case Button.Key
    Case "Projet":        cmdProjets_click
    Case "Etape":         cmdEtapes_click
    
    Case "Incident":      cmdIncidents_Click
    Case "GestIncidents": cmdGestIncidents_Click
    
    Case "Jeux":          cmdDocJeux_Click
    Case "Tables":        cmdDocTables_Click
    Case "Colonnes":      cmdDocColonnes_Click
    
    Case "Web":           cmdWeb_Click
    Case "Impr":          cmdImpr_Click
    Case "Aperçu":        cmdAperçu_Click
    Case "Copie":         cmdCopie_Click
    
    Case Else:        Stop
  End Select
End Sub

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then PopupMenu mnuBarreBoutons
End Sub

Private Sub mnuBarreBoutons_Click()
  cmdBdBEtiquettes.Checked = tbBoutons.Buttons(2).Caption <> ""
End Sub

Private Sub cmdBdBEtiquettes_Click()
  cmdBdBEtiquettes.Checked = Not cmdBdBEtiquettes.Checked
  SaveSetting App.EXEName, "Affichage", "Etiquettes", IIf(cmdBdBEtiquettes.Checked, 1, 0)
  AjusteEtiquettesBoutons tbBoutons
End Sub
