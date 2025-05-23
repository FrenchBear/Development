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
   Begin VB.TextBox txtR�pertoire 
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
   Begin VB.CheckBox chkVerrouill� 
      Caption         =   "Projet &verrouill�"
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
      Caption         =   "&R�pertoire du projet :"
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
'�tat des boutons d�pend du contexte
Private Sub RefreshBoutons()

Dim Modifiable As Integer

    Modifiable = Not (-chkLectureSeule.Value) And Not (-chkVerrouill�.Value)
    btnOk.Enabled = Trim$(txtR�pertoire.Text) <> ""
    txtR�pertoire.Enabled = Modifiable
    lstModules.Enabled = Modifiable
    lstNiveaux.Enabled = Modifiable
    
End Sub

'niveau de donn�e pour le copier/coller d'une donn�e avec ses niveaux inf�rieurs
Private Sub RemplitListeNiveaux()

Dim i As Integer
Dim n As Integer

    'vidage puis remplissage
    lstNiveaux.clear
    For i = 4 To Module.NiveauxCount
        lstNiveaux.AddItem Module.Niveau(i)
        lstNiveaux.ItemData(lstNiveaux.NewIndex) = i
    Next
    
    's�lectionne le premier niveau
    lstNiveaux.ListIndex = maxi(0, Projet.NiveauMaxiCopie - 4)

End Sub


'liste des modules install�s
Sub RemplitListeModules(ctl As Control)
    
Dim chRepert As String
Dim i As Integer

    Dir1.path = RepertoireApplication
    'parcours des sous-r�pertoires du r�pertoire de l'application
    For i = 0 To Dir1.ListCount - 1
        chRepert = Dir1.List(i)
        File1.path = chRepert
        'il s'agit d'un sous-r�pertoire de module si le fichier de
        'description de module est pr�sent
        File1.Pattern = FICHIER_MODULE_INI
        If File1.ListCount = 1 Then
            'ajout � la liste des modules le titre et plus loin donc non visible le nom du module
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
    LigneEtat "Cliquez ici pour fermer la fen�tre sans valider les informations modifi�es"
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
    
    'cas o� le r�pertoire de documents du projet n'existe pas
    If Not ExisteR�pertoire(txtR�pertoire.Text) Then
        cr = MsgBox(InsereChaine(GetChaineCrLf("M23"), txtR�pertoire.Text), MB_ICONEXCLAMATION Or MB_YESNO, NomApplication)
        If cr = IDNO Then
            Exit Sub
        End If
    End If
    Projet.R�pertoireDocuments = txtR�pertoire.Text
    
    Tag = "1"
    Hide
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour valider les informations saisies et fermer la fen�tre"
End Sub


Private Sub chkLectureSeule_Click()
    RefreshBoutons
End Sub

Private Sub chkLectureSeule_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Un projet en lecture seule ne peut pas �tre modifi�"
End Sub


Private Sub chkVerrouill�_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Un projet verrouill� ne peut pas �tre modifi� ni d�verrouill�"
End Sub


'fen�tre d'options du projet HACCP courant
Private Sub Form_Load()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    CenterInScreen Me
    Tag = ""
    Set Projet = FormMain.ActiveForm.Projet
    'titre de la fen�tre
    If Projet.Nom = "" Then
        'cas d'un projet sans nom
        Caption = FormMain.ActiveForm.Tag & " " & Caption
    Else
        'cas d'un projet avec nom
        Caption = Projet.Nom & " " & Caption
    End If
    
    'options du projet affich�es dans la fen�tre
    chkVerrouill�.Value = Abs(Projet.Verrouill�)
    chkLectureSeule.Enabled = Not chkVerrouill�.Value
    chkLectureSeule.Value = -(Projet.LectureSeule <> False)
    'remplissage des listes de modules et niveaux de donn�es pour copier/coller d'arbres
    RemplitListeModules lstModules
    RemplitListeNiveaux
    txtR�pertoire.Text = Projet.R�pertoireDocuments
    
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


Private Sub txtR�pertoire_Change()
    RefreshBoutons
End Sub


Private Sub txtR�pertoire_GotFocus()
    SelectionneZoneTexte txtR�pertoire, 16 * 5 + 2
End Sub

Private Sub txtR�pertoire_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "R�pertoire o� se trouve le fichier du projet HACCP et les documents associ�s sans chemin d'acc�s"
End Sub


