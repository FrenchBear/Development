VERSION 4.00
Begin VB.Form FormAjoutSujetDanger 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Criticit� �tape / sujet en regard d'un danger identifi�"
   ClientHeight    =   3480
   ClientLeft      =   1230
   ClientTop       =   1725
   ClientWidth     =   7080
   Height          =   3885
   HelpContextID   =   61
   Left            =   1170
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3480
   ScaleWidth      =   7080
   ShowInTaskbar   =   0   'False
   Top             =   1380
   Width           =   7200
   Begin VB.ComboBox txtNom 
      Height          =   315
      ItemData        =   "HACCRITI.frx":0000
      Left            =   1560
      List            =   "HACCRITI.frx":0002
      TabIndex        =   17
      Text            =   "txtNom"
      Top             =   1200
      Width           =   3855
   End
   Begin VB.TextBox txtCommentaire 
      Height          =   915
      Left            =   1560
      MultiLine       =   -1  'True
      TabIndex        =   8
      Top             =   1560
      Width           =   3855
   End
   Begin VB.ComboBox comboEtapes 
      Height          =   315
      Left            =   1560
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   120
      Width           =   3855
   End
   Begin VB.ComboBox ComboSujets 
      Height          =   315
      Left            =   1560
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   480
      Width           =   3855
   End
   Begin VB.CommandButton btnDocuments 
      Caption         =   "Documents associ�s..."
      Height          =   375
      Left            =   195
      TabIndex        =   10
      Top             =   3000
      Width           =   3075
   End
   Begin VB.CommandButton btnQuestionnaire 
      Caption         =   "&Critique ?"
      Height          =   375
      Left            =   195
      TabIndex        =   9
      Top             =   2580
      Width           =   3075
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   5640
      TabIndex        =   14
      Top             =   1440
      Width           =   1275
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   5640
      TabIndex        =   13
      Top             =   960
      Width           =   1275
   End
   Begin VB.CommandButton btnAjouter 
      Caption         =   "Ajo&uter"
      Height          =   375
      Left            =   5640
      TabIndex        =   12
      Top             =   540
      Width           =   1275
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   5640
      TabIndex        =   11
      Top             =   120
      Width           =   1275
   End
   Begin VB.ComboBox ComboDangers 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Height          =   315
      Left            =   2640
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   840
      Visible         =   0   'False
      Width           =   1875
   End
   Begin VB.Label lblDanger 
      Height          =   255
      Left            =   1620
      TabIndex        =   16
      Top             =   900
      Width           =   3795
   End
   Begin VB.Label Label1 
      Caption         =   "&Description d�taill�e :"
      Height          =   495
      Index           =   0
      Left            =   120
      TabIndex        =   7
      Top             =   1620
      Width           =   1395
   End
   Begin VB.Label lblCriticit� 
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3840
      TabIndex        =   15
      Top             =   2700
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "&Type :"
      Height          =   255
      Index           =   5
      Left            =   120
      TabIndex        =   6
      Top             =   1260
      Width           =   975
   End
   Begin VB.Label lblNiveau 
      Caption         =   "etape:"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   810
   End
   Begin VB.Label lblNiveau 
      Caption         =   "sujet"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   2
      Top             =   540
      Width           =   915
   End
   Begin VB.Label lblNiveau 
      Caption         =   "Nature/Sp�cificit� :"
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   4
      Top             =   900
      Width           =   1455
   End
End
Attribute VB_Name = "FormAjoutSujetDanger"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'projet courant
Dim Projet As Projet

'sujetdanger ajout� ou modifi�
Dim SujetDanger As SujetDanger

'cl� du SujetDanger qui suit le SujetDanger � ins�rer
Dim KeyBefore As String

'spread o� ajouter les sujets/dangers
Dim SpreadCtl As Control

'� vrai pour l'ajout d'un sujet/danger
Dim bNouveauSujetDanger As Integer

'm�morise position dans la liste des �tapes et sujets juqu'au Ok qui la transf�re en variable globale gListIndexEtape et gListIndexSujet
Private ListIndexEtape As Integer
Private ListIndexSujet As Integer

'l'�tat des boutons d�pend du contexte
Private Sub RefreshBoutons()

    'boutons Documents
    If SujetDanger.DocumentsCount = 0 Then
        btnDocuments.Caption = "Aucun document associ�..."
    Else
        If SujetDanger.DocumentsCount = 1 Then
            btnDocuments.Caption = SujetDanger.DocumentsCount & " document associ�..."
        Else
            btnDocuments.Caption = SujetDanger.DocumentsCount & " documents associ�s..."
        End If
    End If
    'boutons OK et Ajouter
    btnOk.Enabled = ComboEtapes.Text <> "" And ComboSujets.Text <> "" And Trim$(txtNom.Text) <> "" And btnOk.Tag = "" 'And lblCriticit�.Caption <> ""
    btnAjouter.Enabled = ComboEtapes.Text <> "" And ComboSujets.Text <> "" And Trim$(txtNom.Text) <> "" 'And lblCriticit�.Caption <> ""
    btnQuestionnaire.Enabled = ComboEtapes.Text <> "" And ComboSujets.Text <> "" And Trim$(txtNom.Text) <> "" And Projet.Danger(SujetDanger.Danger).Pertinence <> ""

End Sub


'remplit la list-box des dangers
Private Sub RemplitListeDangers(ctl As Control)

Dim i As Integer
Dim n As Integer

    'vidage puis remplissage
    ComboDangers.clear
    For i = 1 To Projet.DangersCount
        ComboDangers.AddItem Projet.Danger(i).Nature & " / " & Projet.Danger(i).Sp�cificit�
        ComboDangers.ItemData(ComboDangers.NewIndex) = suppfirstchar(Projet.Danger(i).id, 1)
    Next

    If ComboDangers.ListCount <> 0 Then
        's�lectionne le premi�r danger: ca l'affiche dans le label lblDanger car la
        'list-box lstDangers n'est plus utilis�e mais invisible
        ComboDangers.ListIndex = 0
    End If

End Sub

Sub RemplitListeTypes(ctl As Control)

Dim n As Integer
Dim i As Integer

    n = GetChaineCrLf("NbTypesDangers")
    For i = 1 To n
        ctl.AddItem GetChaineCrLf("TypeDanger" & i)
    Next
    
End Sub

Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub

Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


'ajout d'un sujet/danger dans le spread
Private Sub btnAjouter_Click()

'sujet/danger effectivement ajout�
Dim NewSujetDanger As New SujetDanger
    
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
    
    If bNouveauSujetDanger Then
        'sujet/danger � ajouter
        NewSujetDanger.id = "D" & Projet.NewId
    Else
        'sujet/danger � modifier
        Set NewSujetDanger = SujetDanger
        'm�morise le sujet/danger modifi�
        ProgAnnulationModifSujetDanger FormMain.ActiveForm.Tag, NewSujetDanger, "�tape de danger"
    End If
    NewSujetDanger.Etape = "E" & ComboEtapes.ItemData(ComboEtapes.ListIndex)
    NewSujetDanger.Sujet = "E" & ComboSujets.ItemData(ComboSujets.ListIndex)
    NewSujetDanger.Danger = "D" & ComboDangers.ItemData(ComboDangers.ListIndex)
    NewSujetDanger.Nom = txtNom.Text
    NewSujetDanger.Commentaire = txtCommentaire.Text
    NewSujetDanger.Criticit� = lblCriticit�.Caption
    Set NewSujetDanger.QuestCriticit� = SujetDanger.QuestCriticit�
    'remplissage de la ligne dans le spread (certaines colonnes ne sont plus utilis�es et donc invisibles)
    With SpreadCtl
        If bNouveauSujetDanger Then
            'se positionne sur ligne vierge
            .Row = .ActiveRow 'MaxRows
        End If
        .Col = 1
        .Text = NewSujetDanger.id
        .Col = 2
        .Text = ComboEtapes
        .Col = 3
        .Text = ComboSujets
        .Col = 4
        .Text = Projet.Danger(NewSujetDanger.Danger).Nature
        .Col = 5
        .Text = Projet.Danger(NewSujetDanger.Danger).Sp�cificit�
        .Col = 6
        .Text = NewSujetDanger.Nom
        .Col = 7
        .Text = NewSujetDanger.Criticit�
        .Col = 8
        .Text = NewSujetDanger.Commentaire
        .Col = 9
        .Lock = NewSujetDanger.DocumentsCount = 0
        'bouton avec image fl�che
        If .Lock Then
            .TypeButtonPicture = LoadPicture("")
            .TypeButtonPictureDown = LoadPicture("")
        Else
            .TypeButtonPicture = FormMain.ActiveForm.picFleche.Picture
            .TypeButtonPictureDown = FormMain.ActiveForm.picFleche.Picture
        End If
        If bNouveauSujetDanger Then
            'pr�s pour un nouvel ajout
            .Row = .ActiveRow + 1
            .Col = .ActiveCol
            .Action = SS_ACTION_ACTIVE_CELL
            'une ligne de plus en cas d'ajout d'un sujet/danger
            FormMain.ActiveForm.btnIns�rerSujetDanger_Click
        End If
    End With
    txtNom.Text = ""
    txtCommentaire.Text = ""
        
    If bNouveauSujetDanger Then
        'm�morise le sujet/danger ajout�
        ProgAnnulationAjoutSujetDanger FormMain.ActiveForm.Tag, NewSujetDanger, "�tape de danger"
        'ajout du sujet/danger au projet
        If KeyBefore = "" Then
            '� la fin de la liste
            Projet.AddSujetDanger NewSujetDanger
        Else
            'ins�r�
            Projet.AddSujetDanger NewSujetDanger, KeyBefore
        End If
    End If
        
    btnAjouter.Tag = "1"            'marque que le bouton Ajouter a �t� utilis�
    btnAjouter.Caption = "&Ajouter" 'ajout maintenant
    bNouveauSujetDanger = True      'nouveau sujet apr�s modification ou ajour
    btnAnnuler.Caption = "&Fermer"  'l'annulation n'est plus possible
    txtNom.SetFocus                 'pour faciliter la saisie
    btnOk.Tag = "1"                 'pour qu'il ne soit plus actif selon RefreshBoutons
    lblCriticit�.Caption = ""       'pour obliger l'�valuation de la criticit� du sujet/danger suivant
    Set SujetDanger.QuestCriticit� = Nothing
    
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnAjouter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If bNouveauSujetDanger Then
        LigneEtat "Cliquez ici pour ajouter le " & Module.Niveau(NIVEAU_SUJET_DANGER) & " sans fermer la fen�tre"
    Else
        LigneEtat "Cliquez ici pour modifier le " & Module.Niveau(NIVEAU_SUJET_DANGER) & " sans fermer la fen�tre"
    End If
End Sub


'sortie sans validation
Private Sub btnAnnuler_Click()
    Tag = ""
    LigneEtat ""
    Hide
End Sub

Private Sub btnAnnuler_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour fermer la fen�tre sans valider les informations saisies"
End Sub


'gestion des documents associ�s
Private Sub btnDocuments_Click()

    AfficherDocuments SujetDanger
    RefreshBoutons

End Sub

Private Sub btnDocuments_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour ajouter des documents associ�s au " & Module.Niveau(NIVEAU_SUJET_DANGER)
End Sub


'sortie avec validation
Private Sub btnOk_Click()

    Tag = "1"
    gListIndexEtape = ListIndexEtape
    gListIndexSujet = ListIndexSujet
    gTypeDangerR�manent = txtNom.Text
    LigneEtat ""
    Hide

End Sub




Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour valider les informations saisies et fermer la fen�tre"
End Sub


'gestion du questionnaire d'�valuation de criticit�
Private Sub btnQuestionnaire_Click()

Dim Criticit� As String
Dim chTitre As String
Dim TempQuestCriticit� As QuestCriticite
   
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
   
    'titre de la fen�tre de questionnaire
    chTitre = Module.Niveau(NIVEAU_ETAPE) & " " & ComboEtapes.Text & ", " & _
              Module.Niveau(NIVEAU_SUJET) & " " & ComboSujets.Text & _
              ", Nature " & GetItemDansChaineSep(ComboDangers.Text, 1, "/") & _
              ", Sp�cificit� " & GetItemDansChaineSep(ComboDangers.Text, 2, "/") & _
              ", Type " & txtNom.Text
    'on travaille sur une copie du questionnaire
    Set TempQuestCriticit� = SujetDanger.QuestCriticit�.Copy
    Criticit� = lblCriticit�.Caption
    If FormQuestCriticit�.Ex�cuterQuestionnaireCriticit�(1, chTitre, "Evaluation de la criticit� du " & Module.Niveau(NIVEAU_SUJET_DANGER), TempQuestCriticit�, Criticit�) Then
        'SujetDanger � modifier
        SujetDanger.Criticit� = Criticit�
        Set SujetDanger.QuestCriticit� = TempQuestCriticit�
        'projet modifi�
        Projet.EstModifi�
        'criticit� �valu�e
        lblCriticit�.Caption = Criticit�
    End If
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub btnQuestionnaire_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour �valuer la criticit� du " & Module.Niveau(NIVEAU_SUJET_DANGER)
End Sub


'affiche la nature et sp�cificit� du danger parent du sujet/danger
Private Sub ComboDangers_Change()
    lblDanger.Caption = ComboDangers.List(ComboDangers.ListIndex)
End Sub

Private Sub ComboDangers_Click()
    lblDanger.Caption = ComboDangers.List(ComboDangers.ListIndex)
End Sub


'choix de l'�tape
Private Sub ComboEtapes_Click()

Dim idEtape As Long
Dim Etape As Donnee

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    '�tape choisie
    ListIndexEtape = ComboEtapes.ListIndex
    idEtape = ComboEtapes.ItemData(ComboEtapes.ListIndex)
    Set Etape = Projet.Etape("E" & idEtape)
    'remplit la liste des sujets
    FormMain.ActiveForm.RefreshListeSujets ComboSujets, Etape
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub ComboSujets_Click()
    ListIndexSujet = ComboSujets.ListIndex
End Sub


'fen�tre d'ajout et modification d'un sujet/danger (danger � une �tape et un sujet donn�s)
Private Sub Form_Load()

Dim idEtape As Long
Dim Etape As Donnee

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    Tag = ""
    CenterInScreen Me
    
    'titre de la fen�tre
    Caption = "Criticit� " & Module.Niveau(NIVEAU_ETAPE) & " / " & Module.Niveau(NIVEAU_SUJET) & " pour un " & Module.Niveau(NIVEAU_SUJET_DANGER) & " identifi�"
    
    '�tiquettes d�pendantes du module
    Dim i As Integer
    For i = 1 To 2
        lblNiveau(i).Caption = "&" & UCase$(Left$(Module.Niveau(i), 1)) & suppfirstchar(Module.Niveau(i), 1) & " :"
    Next
    
    'remplit la liste des �tapes et sujets
    If Projet.EtapesCount > 0 Then
        FormMain.ActiveForm.RefreshListeEtapes ComboEtapes
        ComboEtapes.ListIndex = maxi(0, mini(gListIndexEtape, ComboEtapes.ListCount - 1))
        idEtape = ComboEtapes.ItemData(ComboEtapes.ListIndex)
        Set Etape = Projet.Etape("E" & idEtape)
        If Etape.EnfantsCount > 0 Then
            FormMain.ActiveForm.RefreshListeSujets ComboSujets, Etape
            ComboSujets.ListIndex = maxi(0, mini(gListIndexSujet, ComboSujets.ListCount - 1))
        End If
    End If

    'remplit la liste des dangers
    RemplitListeDangers ComboDangers
    
    'liste des types
    RemplitListeTypes txtNom
    
    HourGlass "hide"
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

'fonction d'ajout ET DE MODIFICATION d'un sujet/danger (appel�e depuis la fen�tre � onglet)
'entr�e:
'   projet1: projet concern�
'   sujetdanger1: sujetdanger � modifi� (le sujetdanger ajout� est cr�� avant et modifi� par cette fonction)
'   ctl: spread des sujets dangers dans la fen�tre de projet
'   caption: titre de la fen�tre
'   NuveauSujetDanger: � vrai en cas d'ajout, faux en cas de modification de sujet/danger
'sortie:
'   sujetdanger1: sujet/danger modifi�
'   projet1: projet modifi�
'   bAjoutsEffectu�s: � vrai si des sujets/dangers ont �t� ajout�s par le buton ajouter
Public Function AjouterSujetDanger(Projet1 As Projet, SujetDanger1 As SujetDanger, ctl As Control, ByVal chCaption As String, ByVal NouveauSujetDanger As Integer, ByVal KeyBefore1 As String, bAjoutsEffectu�s As Integer)
    
    'projet, sujetDanger, danger et spread � modifier
    'r�f�rences accessibles dans tout le module
    Set Projet = Projet1
    Set SujetDanger = SujetDanger1
    Set SpreadCtl = ctl
    bNouveauSujetDanger = NouveauSujetDanger
    KeyBefore = KeyBefore1
    
    'charge et initialise la fen�tre
    Load FormAjoutSujetDanger
    FormAjoutSujetDanger.Caption = chCaption
    If bNouveauSujetDanger Then
        If ComboEtapes.ListCount > 0 Then
            ComboEtapes.ListIndex = maxi(0, mini(gListIndexEtape, ComboEtapes.ListCount - 1))
        End If
        If ComboSujets.ListCount > 0 Then
            ComboSujets.ListIndex = maxi(0, mini(gListIndexSujet, ComboSujets.ListCount - 1))
        End If
        If ComboDangers.ListCount > 0 Then
            ComboDangers.ListIndex = PositionDansListe(ComboDangers, Projet.Danger(SujetDanger.Danger).Nature & " / " & Projet.Danger(SujetDanger.Danger).Sp�cificit�)
        End If
        txtNom = gTypeDangerR�manent
    Else
        ComboEtapes.ListIndex = PositionDansListe(ComboEtapes, Projet.Etape(SujetDanger.Etape).Titre)
        ComboSujets.ListIndex = PositionDansListe(ComboSujets, Projet.Etape(SujetDanger.Etape).Enfant(SujetDanger.Sujet).Titre)
        ComboDangers.ListIndex = PositionDansListe(ComboDangers, Projet.Danger(SujetDanger.Danger).Nature & " / " & Projet.Danger(SujetDanger.Danger).Sp�cificit�)
        txtNom = SujetDanger.Nom
    End If
    
    txtCommentaire = SujetDanger.Commentaire
    lblCriticit�.Caption = SujetDanger.Criticit�
    If Not NouveauSujetDanger Then
        'le bouton ajouter sert pour modifier
        btnAjouter.Caption = "&Modifier"
    End If
    RefreshBoutons
    
    'affiche la fen�tre
    FormAjoutSujetDanger.Show MODAL
    
    'r�cup�re les donn�es saisies
    If FormAjoutSujetDanger.Tag <> "" Then
        If Not NouveauSujetDanger Then
            'm�morise le sujet/danger modifi�
            ProgAnnulationModifSujetDanger FormMain.ActiveForm.Tag, SujetDanger, "�tape de danger"
        End If
        SujetDanger.Etape = "E" & ComboEtapes.ItemData(ComboEtapes.ListIndex)
        SujetDanger.Sujet = "E" & ComboSujets.ItemData(ComboSujets.ListIndex)
        SujetDanger.Danger = "D" & ComboDangers.ItemData(ComboDangers.ListIndex)
        SujetDanger.Nom = txtNom.Text
        SujetDanger.Commentaire = txtCommentaire.Text
        SujetDanger.Criticit� = lblCriticit�.Caption
        'marque projet modifi�
        FormMain.ActiveForm.Projet.EstModifi�
    End If
    
    'code de retour (appui sur Ok ou Annuler)
    AjouterSujetDanger = FormAjoutSujetDanger.Tag <> ""
    bAjoutsEffectu�s = btnAjouter.Tag <> ""
    
    'd�charge la fen�tre
    Unload FormAjoutSujetDanger

End Function



Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub lblNiveau_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub txtCommentaire_GotFocus()
    btnOk.DEFAULT = False
    SelectionneZoneTexte txtCommentaire, 4 * 16 + 4
End Sub


Private Sub txtCommentaire_LostFocus()
    btnOk.DEFAULT = True
End Sub


Private Sub txtCommentaire_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtCommentaire.Text = "" Then
        LigneEtat "Entrez ici une br�ve description du " & Module.Niveau(NIVEAU_SUJET_DANGER)
    Else
        LigneEtat "Br�ve description concernant le " & Module.Niveau(NIVEAU_SUJET_DANGER)
    End If
End Sub

Private Sub txtNom_Change()
    RefreshBoutons
End Sub


Private Sub txtNom_Click()
     RefreshBoutons
End Sub

Private Sub txtNom_GotFocus()
    SelectionneZoneTexte txtNom, 16 * 5 + 4
End Sub


Private Sub txtNom_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtNom.Text = "" Then
        LigneEtat "Entrez ici le type de " & Module.Niveau(NIVEAU_SUJET_DANGER)
    Else
        LigneEtat "Type de " & Module.Niveau(NIVEAU_SUJET_DANGER)
    End If
End Sub


