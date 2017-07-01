VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.MDIForm MDITraitementDonn�es 
   BackColor       =   &H8000000C&
   Caption         =   "Traitement des donn�es"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10605
   Icon            =   "MDITraitementDonn�es.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComDlg.CommonDialog cdPrinter 
      Left            =   9060
      Top             =   1620
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   1111
      ButtonWidth     =   1032
      ButtonHeight    =   953
      AllowCustomize  =   0   'False
      Appearance      =   1
      ImageList       =   "ilAdmin"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   8
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "N�jeu"
            Key             =   "NJeu"
            Object.ToolTipText     =   "N� Jeu"
            Object.Tag             =   "N� Jeu"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Cat"
            Key             =   "Cat"
            Object.ToolTipText     =   "Cat�gorie"
            Object.Tag             =   "Cat"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copie"
            Object.ToolTipText     =   "Copie les donn�es dans le presse-papiers"
            Object.Tag             =   "Cop"
            ImageKey        =   "imgCopie"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Impr"
            Object.ToolTipText     =   "Impression"
            Object.Tag             =   "Imp"
            ImageKey        =   "imgImpr"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Aper�u"
            Object.ToolTipText     =   "Aper�u avant impression"
            Object.Tag             =   "Aper"
            ImageKey        =   "imgAper�u"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Web"
            Object.ToolTipText     =   "Affiche les informations sur le Web"
            Object.Tag             =   "Web"
            ImageKey        =   "imgExplorer"
         EndProperty
      EndProperty
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
            Object.Width           =   10213
            Key             =   "Message"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
            Picture         =   "MDITraitementDonn�es.frx":0442
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connect�"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDITraitementDonn�es.frx":0994
            Key             =   "DataSource"
            Object.ToolTipText     =   "Source de donn�es"
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
   Begin MSComctlLib.ImageList ilAdmin 
      Left            =   9000
      Top             =   900
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
            Picture         =   "MDITraitementDonn�es.frx":0D16
            Key             =   "imgCopie"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":0E28
            Key             =   "imgExplorer"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":0F8C
            Key             =   "imgAper�u"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":10F0
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":1548
            Key             =   "imgEtb"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":16A4
            Key             =   "imgSec"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":1800
            Key             =   "imgDrg"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":195C
            Key             =   "imgDna"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":1AB8
            Key             =   "imgGrp"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":1C14
            Key             =   "imgPro"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":2068
            Key             =   "imgFab"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":2384
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":23E2
            Key             =   "imgConcl"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":2836
            Key             =   "imgImpr"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":294A
            Key             =   "imgDis"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDITraitementDonn�es.frx":2C66
            Key             =   "imgType"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuTable 
      Caption         =   "&Table"
      Begin VB.Menu cmdNjeu 
         Caption         =   "&N� Jeu de cat�gorie"
      End
      Begin VB.Menu cmdCat�gorie 
         Caption         =   "&Cat�gorie"
      End
      Begin VB.Menu sep10 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConfiguration 
         Caption         =   "&Source de donn�es�"
      End
      Begin VB.Menu cmdUtilisateur 
         Caption         =   "&Utilisateur�"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options�"
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
         Caption         =   "P&r�c�dent"
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
         Caption         =   "C&opier"
         Shortcut        =   ^C
      End
      Begin VB.Menu sep3c 
         Caption         =   "-"
      End
      Begin VB.Menu cmdImpr 
         Caption         =   "&Imprimer"
      End
      Begin VB.Menu cmdAper�u 
         Caption         =   "Aper�u a&vant impression�"
      End
   End
   Begin VB.Menu mnuCommandes 
      Caption         =   "&Commandes"
      Begin VB.Menu cmdAjouteWeb 
         Caption         =   "&Ajoute Web�"
      End
      Begin VB.Menu cmdR�cup�re 
         Caption         =   "&R�cup�re un enregistrement supprim�"
      End
      Begin VB.Menu cmdM�morise 
         Caption         =   "&M�morise l'enregistrement"
      End
   End
   Begin VB.Menu mnuFen�tre 
      Caption         =   "Fe&n�tre"
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
      Begin VB.Menu cmdMosa�que 
         Caption         =   "&Mosa�que"
      End
      Begin VB.Menu cmdR�organiser 
         Caption         =   "&R�organiser les ic�nes"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A Propos de�"
      End
   End
   Begin VB.Menu mnuBarreBoutons 
      Caption         =   "(PopUp BdB)"
      Visible         =   0   'False
      Begin VB.Menu cmdBdBEtiquettes 
         Caption         =   "&Etiquettes texte"
      End
   End
End
Attribute VB_Name = "MDITraitementDonn�es"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDITraitementDonn�es
' Feuille MDI principale du traitement des donn�es
' 14/10/1999 NC

Option Explicit


' Appel� � la connexion initiale, et apr�s un changement d'identit� d'utilisateur
' Autoris� � la DI et au bit 6 des droits d'acc�s
Private Sub D�termineModeLectureSeule()
  ' Seule la DI peut modifier les tables Serveur !
  bLectureSeule = colUtilisateur("U" & iNumOp�rateur).uti_unite <> 902 And (colUtilisateur("U" & iNumOp�rateur).uti_niveau And 64) = 0
End Sub


Private Sub ChargementInitial(ByVal bDemandeSource As Boolean)
  ChargementInitialCommun Me, bDemandeSource, frmOptions.GetSourceODBCD�faut
  D�termineModeLectureSeule
End Sub


Private Sub cmdOptions_Click()
  frmOptions.Show
End Sub

Private Sub cmdUtilisateur_Click()
  Dim f As Form
  For Each f In Forms
    If Not f Is MDITraitementDonn�es Then Unload f
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fen�tres document avant de changer d'utilisateur !"
    Exit Sub
  End If
  
  If frmBDLogin.iInitUtilisateur(False, True) = 0 Then
    sbStatus.Panels("Utilisateur") = sNomOp�rateur & " (" & iNumOp�rateur & ")"
    D�termineModeLectureSeule
  End If
End Sub


Private Sub cmdConfiguration_Click()
  Dim f As Form
  For Each f In Forms
    If Not f Is MDITraitementDonn�es Then Unload f
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fen�tres document avant de changer la source de donn�es !"
    Exit Sub
  End If
  
  ChargementInitial True
End Sub


Private Sub cmdCopie_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Copie
End Sub

Private Sub cmdImpr_Click()
  On Error Resume Next
  If Left(TypeName(ActiveForm), 2) = "dr" Then          ' DataReport
    ActiveForm.PrintReport
  ElseIf TypeName(ActiveForm) = "frmImprimante" Then    ' Ape�u artisanal
    ActiveForm.PrintReport
  Else
    ActiveForm.Imprime
  End If
End Sub

Private Sub cmdAper�u_Click()
'  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Aper�u
End Sub

Private Sub cmdAjouteWeb_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.AjouteWeb
End Sub

Private Sub cmdR�cup�re_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.R�cup�re
End Sub

Private Sub cmdM�morise_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.M�morise
End Sub



Private Sub MDIForm_Load()
  Caption = App.Title & " - " & App.FileDescription
  NoPreviousInstance Me
  sVersionApp = App.Major & "." & App.Minor & "." & App.Revision
  
  ' Retouche des raccourcis menus (raccourcis que l'on ne peut pas d�finir dans l'�diteur de menus)
  cmdQuery.Caption = cmdQuery.Caption & Chr(9) & "?"
  cmdFermer.Caption = cmdFermer.Caption & Chr(9) & "Ctrl+F4"
  cmdQuitter.Caption = cmdQuitter.Caption & Chr(9) & "Alt+F4"
  cmdFirst.Caption = cmdFirst.Caption & Chr(9) & "D�but"
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
End Sub

Private Sub cmdCat�gorie_Click()
  Dim f
  If bShiftPressed Then
    Set f = New frmCat�gorie
  Else
    Set f = frmCat�gorie
  End If

  On Error GoTo fin
  f.Show
  f.ZOrder 0
fin:
  AjusteMenus 0
End Sub
Private Sub cmdNjeu_Click()
  Dim f
  If bShiftPressed Then
    Set f = New frmTitreJeuCat�gorie
  Else
    Set f = frmTitreJeuCat�gorie
  End If

  On Error GoTo fin
  f.Show
  f.ZOrder 0
fin:
  AjusteMenus 0
End Sub

Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Sub cmdCascade_Click()
  MDITraitementDonn�es.Arrange vbCascade
End Sub

Private Sub cmdR�organiser_Click()
  MDITraitementDonn�es.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosa�que_Click()
  MDITraitementDonn�es.Arrange vbTileHorizontal
End Sub


Private Sub cmdAPropos_Click()
  frmAbout.APropos Me.Icon
End Sub


Private Sub mnuEnregistrement_Click()
  Dim f As Form
  
  Set f = ActiveForm
  cmdQuery.Enabled = f.bdS�l.ButtonEnabled("Query")

  cmdFirst.Enabled = f.bdS�l.ButtonEnabled("First")
  cmdPrevious.Enabled = f.bdS�l.ButtonEnabled("Previous")
  cmdNext.Enabled = f.bdS�l.ButtonEnabled("Next")
  cmdLast.Enabled = f.bdS�l.ButtonEnabled("Last")

  cmdAdd.Enabled = f.bdS�l.ButtonEnabled("Add")
  cmdChange.Enabled = f.bdS�l.ButtonEnabled("Change")
  cmdDelete.Enabled = f.bdS�l.ButtonEnabled("Delete")
End Sub


Public Sub AjusteMenus(ByVal iOffset As Integer)
  Dim iNbFeuillesCharg�es As Integer, f As Form
  iNbFeuillesCharg�es = iOffset
  For Each f In Forms
    If f.Tag = "Donn�es" Then iNbFeuillesCharg�es = iNbFeuillesCharg�es + 1
  Next
  
  Dim bFeuilleCharg�e As Boolean
  bFeuilleCharg�e = iNbFeuillesCharg�es > 0
  
  cmdFermer.Visible = bFeuilleCharg�e
  sep1.Visible = bFeuilleCharg�e
  mnuEnregistrement.Visible = bFeuilleCharg�e
  mnuCommandes.Visible = bFeuilleCharg�e
  mnuFen�tre.Visible = bFeuilleCharg�e
  
  tbBoutons.Buttons("Copie").Enabled = bFeuilleCharg�e
  tbBoutons.Buttons("Impr").Enabled = bFeuilleCharg�e
  tbBoutons.Buttons("Aper�u").Enabled = bFeuilleCharg�e
  tbBoutons.Buttons("Web").Enabled = bFeuilleCharg�e
End Sub



' ===============================================================================
' Menus sous-trait�s aux feuilles de donn�es

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
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Fen�treWeb
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
    Case "NJeu":    cmdNjeu_Click
    Case "Cat":     cmdCat�gorie_Click
           
    Case "Web":     cmdWeb_Click
    Case "Impr":    cmdImpr_Click
    Case "Aper�u":  cmdAper�u_Click
    Case "Copie":   cmdCopie_Click
    
    Case Else:      Stop
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
