VERSION 4.00
Begin VB.Form FormOptionsProjet 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "- Options"
   ClientHeight    =   2205
   ClientLeft      =   1275
   ClientTop       =   2325
   ClientWidth     =   6945
   Height          =   2610
   HelpContextID   =   84
   Left            =   1215
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2205
   ScaleWidth      =   6945
   ShowInTaskbar   =   0   'False
   Top             =   1980
   Width           =   7065
   Begin VB.DirListBox Dir1 
      Appearance      =   0  'Flat
      Height          =   705
      Left            =   5280
      TabIndex        =   12
      Top             =   1695
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.FileListBox File1 
      Appearance      =   0  'Flat
      Height          =   420
      Left            =   6720
      TabIndex        =   11
      Top             =   1680
      Visible         =   0   'False
      Width           =   1005
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   5400
      TabIndex        =   10
      Top             =   1080
      Width           =   1395
   End
   Begin VB.TextBox txtRépertoire 
      Height          =   315
      Left            =   2520
      TabIndex        =   7
      Top             =   1680
      Width           =   2655
   End
   Begin VB.ComboBox lstModules 
      Height          =   315
      ItemData        =   "HACOPTIO.frx":0000
      Left            =   2520
      List            =   "HACOPTIO.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1320
      Width           =   2655
   End
   Begin VB.ComboBox lstNiveaux 
      Height          =   315
      ItemData        =   "HACOPTIO.frx":0004
      Left            =   2520
      List            =   "HACOPTIO.frx":0006
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   960
      Width           =   2655
   End
   Begin VB.CheckBox chkVerrouillé 
      Caption         =   "Projet &verrouillé"
      Enabled         =   0   'False
      Height          =   255
      Left            =   300
      TabIndex        =   1
      Top             =   540
      Width           =   3855
   End
   Begin VB.CheckBox chkLectureSeule 
      Caption         =   "Projet en &lecture seule"
      Height          =   255
      Left            =   300
      TabIndex        =   0
      Top             =   240
      Width           =   3855
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   5400
      TabIndex        =   9
      Top             =   600
      Width           =   1395
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   5400
      TabIndex        =   8
      Top             =   180
      Width           =   1395
   End
   Begin VB.Label Label1 
      Caption         =   "&Répertoire du projet :"
      Height          =   255
      Index           =   2
      Left            =   300
      TabIndex        =   6
      Top             =   1740
      Width           =   2115
   End
   Begin VB.Label Label1 
      Caption         =   "Mo&dule :"
      Height          =   255
      Index           =   1
      Left            =   300
      TabIndex        =   4
      Top             =   1380
      Width           =   2115
   End
   Begin VB.Label Label1 
      Caption         =   "Niveau maximum de copie :"
      Height          =   255
      Index           =   0
      Left            =   300
      TabIndex        =   2
      Top             =   1020
      Width           =   2115
   End
End
Attribute VB_Name = "FormOptionsProjet"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'projet courant
Dim Projet As Projet
'état des boutons dépend du contexte
Private Sub RefreshBoutons()

Dim Modifiable As Integer

    Modifiable = Not (-chkLectureSeule.Value) And Not (-chkVerrouillé.Value)
    btnOk.Enabled = Trim$(txtRépertoire.Text) <> ""
    txtRépertoire.Enabled = Modifiable
    lstModules.Enabled = Modifiable
    lstNiveaux.Enabled = Modifiable
    
End Sub

'niveau de donnée pour le copier/coller d'une donnée avec ses niveaux inférieurs
Private Sub RemplitListeNiveaux()

Dim i As Integer
Dim n As Integer

    'vidage puis remplissage
    lstNiveaux.clear
    For i = 4 To Module.NiveauxCount
        lstNiveaux.AddItem Module.Niveau(i)
        lstNiveaux.ItemData(lstNiveaux.NewIndex) = i
    Next
    
    'sélectionne le premier niveau
    lstNiveaux.ListIndex = maxi(0, Projet.NiveauMaxiCopie - 4)

End Sub


'liste des modules installés
Sub RemplitListeModules(ctl As Control)
    
Dim chRepert As String
Dim i As Integer

    Dir1.path = RepertoireApplication
    'parcours des sous-répertoires du répertoire de l'application
    For i = 0 To Dir1.ListCount - 1
        chRepert = Dir1.List(i)
        File1.path = chRepert
        'il s'agit d'un sous-répertoire de module si le fichier de
        'description de module est présent
        File1.Pattern = FICHIER_MODULE_INI
        If File1.ListCount = 1 Then
            'ajout à la liste des modules le titre et plus loin donc non visible le nom du module
            'pour le retrouver ensuite
            Dim ModuleTemp As New Module
            lstModules.AddItem ModuleTemp.LoadTitre(chRepert & "\" & FICHIER_MODULE_INI) & Space$(50) & ";" & GetFichierSansChemin(chRepert)
        End If
    Next
    ctl.ListIndex = PositionDansListe(ctl, Projet.TitreModule & Space$(50) & ";" & Projet.NomModule)
    
End Sub

Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub

Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


'sortie sans validation
Private Sub btnAnnuler_Click()
    Tag = ""
    Hide
End Sub

Private Sub btnAnnuler_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour fermer la fenêtre sans valider les informations modifiées"
End Sub


'sortie avec validation
Private Sub btnOk_Click()

Dim cr As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'nouvelles options du projet
    Projet.LectureSeule = -chkLectureSeule.Value
    Projet.NomModule = GetItemDansChaineSep(lstModules, 2, ";")
    Projet.TitreModule = Trim$(GetItemDansChaineSep(lstModules, 1, ";"))
    Projet.NiveauMaxiCopie = lstNiveaux.ItemData(lstNiveaux.ListIndex)
    
    'cas où le répertoire de documents du projet n'existe pas
    If Not ExisteRépertoire(txtRépertoire.Text) Then
        cr = MsgBox(InsereChaine(GetChaineCrLf("M23"), txtRépertoire.Text), MB_ICONEXCLAMATION Or MB_YESNO, NomApplication)
        If cr = IDNO Then
            Exit Sub
        End If
    End If
    Projet.RépertoireDocuments = txtRépertoire.Text
    
    Tag = "1"
    Hide
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour valider les informations saisies et fermer la fenêtre"
End Sub


Private Sub chkLectureSeule_Click()
    RefreshBoutons
End Sub

Private Sub chkLectureSeule_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Un projet en lecture seule ne peut pas être modifié"
End Sub


Private Sub chkVerrouillé_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Un projet verrouillé ne peut pas être modifié ni déverrouillé"
End Sub


'fenêtre d'options du projet HACCP courant
Private Sub Form_Load()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    CenterInScreen Me
    Tag = ""
    Set Projet = FormMain.ActiveForm.Projet
    'titre de la fenêtre
    If Projet.Nom = "" Then
        'cas d'un projet sans nom
        Caption = FormMain.ActiveForm.Tag & " " & Caption
    Else
        'cas d'un projet avec nom
        Caption = Projet.Nom & " " & Caption
    End If
    
    'options du projet affichées dans la fenêtre
    chkVerrouillé.Value = Abs(Projet.Verrouillé)
    chkLectureSeule.Enabled = Not chkVerrouillé.Value
    chkLectureSeule.Value = -(Projet.LectureSeule <> False)
    'remplissage des listes de modules et niveaux de données pour copier/coller d'arbres
    RemplitListeModules lstModules
    RemplitListeNiveaux
    txtRépertoire.Text = Projet.RépertoireDocuments
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub



Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub Form_Unload(Cancel As Integer)
    Set Projet = Nothing
End Sub


Private Sub Label1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub txtRépertoire_Change()
    RefreshBoutons
End Sub


Private Sub txtRépertoire_GotFocus()
    SelectionneZoneTexte txtRépertoire, 16 * 5 + 2
End Sub

Private Sub txtRépertoire_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Répertoire où se trouve le fichier du projet HACCP et les documents associés sans chemin d'accès"
End Sub


