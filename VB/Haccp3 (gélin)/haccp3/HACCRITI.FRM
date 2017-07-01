VERSION 4.00
Begin VB.Form FormAjoutSujetDanger 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Criticité étape / sujet en regard d'un danger identifié"
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
      Caption         =   "Documents associés..."
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
      Caption         =   "&Description détaillée :"
      Height          =   495
      Index           =   0
      Left            =   120
      TabIndex        =   7
      Top             =   1620
      Width           =   1395
   End
   Begin VB.Label lblCriticité 
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
      Caption         =   "Nature/Spécificité :"
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

'sujetdanger ajouté ou modifié
Dim SujetDanger As SujetDanger

'clé du SujetDanger qui suit le SujetDanger à insérer
Dim KeyBefore As String

'spread où ajouter les sujets/dangers
Dim SpreadCtl As Control

'à vrai pour l'ajout d'un sujet/danger
Dim bNouveauSujetDanger As Integer

'mémorise position dans la liste des étapes et sujets juqu'au Ok qui la transfère en variable globale gListIndexEtape et gListIndexSujet
Private ListIndexEtape As Integer
Private ListIndexSujet As Integer

'l'état des boutons dépend du contexte
Private Sub RefreshBoutons()

    'boutons Documents
    If SujetDanger.DocumentsCount = 0 Then
        btnDocuments.Caption = "Aucun document associé..."
    Else
        If SujetDanger.DocumentsCount = 1 Then
            btnDocuments.Caption = SujetDanger.DocumentsCount & " document associé..."
        Else
            btnDocuments.Caption = SujetDanger.DocumentsCount & " documents associés..."
        End If
    End If
    'boutons OK et Ajouter
    btnOk.Enabled = ComboEtapes.Text <> "" And ComboSujets.Text <> "" And Trim$(txtNom.Text) <> "" And btnOk.Tag = "" 'And lblCriticité.Caption <> ""
    btnAjouter.Enabled = ComboEtapes.Text <> "" And ComboSujets.Text <> "" And Trim$(txtNom.Text) <> "" 'And lblCriticité.Caption <> ""
    btnQuestionnaire.Enabled = ComboEtapes.Text <> "" And ComboSujets.Text <> "" And Trim$(txtNom.Text) <> "" And Projet.Danger(SujetDanger.Danger).Pertinence <> ""

End Sub


'remplit la list-box des dangers
Private Sub RemplitListeDangers(ctl As Control)

Dim i As Integer
Dim n As Integer

    'vidage puis remplissage
    ComboDangers.clear
    For i = 1 To Projet.DangersCount
        ComboDangers.AddItem Projet.Danger(i).Nature & " / " & Projet.Danger(i).Spécificité
        ComboDangers.ItemData(ComboDangers.NewIndex) = suppfirstchar(Projet.Danger(i).id, 1)
    Next

    If ComboDangers.ListCount <> 0 Then
        'sélectionne le premièr danger: ca l'affiche dans le label lblDanger car la
        'list-box lstDangers n'est plus utilisée mais invisible
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

'sujet/danger effectivement ajouté
Dim NewSujetDanger As New SujetDanger
    
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
    
    If bNouveauSujetDanger Then
        'sujet/danger à ajouter
        NewSujetDanger.id = "D" & Projet.NewId
    Else
        'sujet/danger à modifier
        Set NewSujetDanger = SujetDanger
        'mémorise le sujet/danger modifié
        ProgAnnulationModifSujetDanger FormMain.ActiveForm.Tag, NewSujetDanger, "étape de danger"
    End If
    NewSujetDanger.Etape = "E" & ComboEtapes.ItemData(ComboEtapes.ListIndex)
    NewSujetDanger.Sujet = "E" & ComboSujets.ItemData(ComboSujets.ListIndex)
    NewSujetDanger.Danger = "D" & ComboDangers.ItemData(ComboDangers.ListIndex)
    NewSujetDanger.Nom = txtNom.Text
    NewSujetDanger.Commentaire = txtCommentaire.Text
    NewSujetDanger.Criticité = lblCriticité.Caption
    Set NewSujetDanger.QuestCriticité = SujetDanger.QuestCriticité
    'remplissage de la ligne dans le spread (certaines colonnes ne sont plus utilisées et donc invisibles)
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
        .Text = Projet.Danger(NewSujetDanger.Danger).Spécificité
        .Col = 6
        .Text = NewSujetDanger.Nom
        .Col = 7
        .Text = NewSujetDanger.Criticité
        .Col = 8
        .Text = NewSujetDanger.Commentaire
        .Col = 9
        .Lock = NewSujetDanger.DocumentsCount = 0
        'bouton avec image flèche
        If .Lock Then
            .TypeButtonPicture = LoadPicture("")
            .TypeButtonPictureDown = LoadPicture("")
        Else
            .TypeButtonPicture = FormMain.ActiveForm.picFleche.Picture
            .TypeButtonPictureDown = FormMain.ActiveForm.picFleche.Picture
        End If
        If bNouveauSujetDanger Then
            'près pour un nouvel ajout
            .Row = .ActiveRow + 1
            .Col = .ActiveCol
            .Action = SS_ACTION_ACTIVE_CELL
            'une ligne de plus en cas d'ajout d'un sujet/danger
            FormMain.ActiveForm.btnInsérerSujetDanger_Click
        End If
    End With
    txtNom.Text = ""
    txtCommentaire.Text = ""
        
    If bNouveauSujetDanger Then
        'mémorise le sujet/danger ajouté
        ProgAnnulationAjoutSujetDanger FormMain.ActiveForm.Tag, NewSujetDanger, "étape de danger"
        'ajout du sujet/danger au projet
        If KeyBefore = "" Then
            'à la fin de la liste
            Projet.AddSujetDanger NewSujetDanger
        Else
            'inséré
            Projet.AddSujetDanger NewSujetDanger, KeyBefore
        End If
    End If
        
    btnAjouter.Tag = "1"            'marque que le bouton Ajouter a été utilisé
    btnAjouter.Caption = "&Ajouter" 'ajout maintenant
    bNouveauSujetDanger = True      'nouveau sujet après modification ou ajour
    btnAnnuler.Caption = "&Fermer"  'l'annulation n'est plus possible
    txtNom.SetFocus                 'pour faciliter la saisie
    btnOk.Tag = "1"                 'pour qu'il ne soit plus actif selon RefreshBoutons
    lblCriticité.Caption = ""       'pour obliger l'évaluation de la criticité du sujet/danger suivant
    Set SujetDanger.QuestCriticité = Nothing
    
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnAjouter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If bNouveauSujetDanger Then
        LigneEtat "Cliquez ici pour ajouter le " & Module.Niveau(NIVEAU_SUJET_DANGER) & " sans fermer la fenêtre"
    Else
        LigneEtat "Cliquez ici pour modifier le " & Module.Niveau(NIVEAU_SUJET_DANGER) & " sans fermer la fenêtre"
    End If
End Sub


'sortie sans validation
Private Sub btnAnnuler_Click()
    Tag = ""
    LigneEtat ""
    Hide
End Sub

Private Sub btnAnnuler_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour fermer la fenêtre sans valider les informations saisies"
End Sub


'gestion des documents associés
Private Sub btnDocuments_Click()

    AfficherDocuments SujetDanger
    RefreshBoutons

End Sub

Private Sub btnDocuments_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour ajouter des documents associés au " & Module.Niveau(NIVEAU_SUJET_DANGER)
End Sub


'sortie avec validation
Private Sub btnOk_Click()

    Tag = "1"
    gListIndexEtape = ListIndexEtape
    gListIndexSujet = ListIndexSujet
    gTypeDangerRémanent = txtNom.Text
    LigneEtat ""
    Hide

End Sub




Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour valider les informations saisies et fermer la fenêtre"
End Sub


'gestion du questionnaire d'évaluation de criticité
Private Sub btnQuestionnaire_Click()

Dim Criticité As String
Dim chTitre As String
Dim TempQuestCriticité As QuestCriticite
   
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
   
    'titre de la fenêtre de questionnaire
    chTitre = Module.Niveau(NIVEAU_ETAPE) & " " & ComboEtapes.Text & ", " & _
              Module.Niveau(NIVEAU_SUJET) & " " & ComboSujets.Text & _
              ", Nature " & GetItemDansChaineSep(ComboDangers.Text, 1, "/") & _
              ", Spécificité " & GetItemDansChaineSep(ComboDangers.Text, 2, "/") & _
              ", Type " & txtNom.Text
    'on travaille sur une copie du questionnaire
    Set TempQuestCriticité = SujetDanger.QuestCriticité.Copy
    Criticité = lblCriticité.Caption
    If FormQuestCriticité.ExécuterQuestionnaireCriticité(1, chTitre, "Evaluation de la criticité du " & Module.Niveau(NIVEAU_SUJET_DANGER), TempQuestCriticité, Criticité) Then
        'SujetDanger à modifier
        SujetDanger.Criticité = Criticité
        Set SujetDanger.QuestCriticité = TempQuestCriticité
        'projet modifié
        Projet.EstModifié
        'criticité évaluée
        lblCriticité.Caption = Criticité
    End If
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub btnQuestionnaire_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour évaluer la criticité du " & Module.Niveau(NIVEAU_SUJET_DANGER)
End Sub


'affiche la nature et spécificité du danger parent du sujet/danger
Private Sub ComboDangers_Change()
    lblDanger.Caption = ComboDangers.List(ComboDangers.ListIndex)
End Sub

Private Sub ComboDangers_Click()
    lblDanger.Caption = ComboDangers.List(ComboDangers.ListIndex)
End Sub


'choix de l'étape
Private Sub ComboEtapes_Click()

Dim idEtape As Long
Dim Etape As Donnee

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'étape choisie
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


'fenêtre d'ajout et modification d'un sujet/danger (danger à une étape et un sujet donnés)
Private Sub Form_Load()

Dim idEtape As Long
Dim Etape As Donnee

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    Tag = ""
    CenterInScreen Me
    
    'titre de la fenêtre
    Caption = "Criticité " & Module.Niveau(NIVEAU_ETAPE) & " / " & Module.Niveau(NIVEAU_SUJET) & " pour un " & Module.Niveau(NIVEAU_SUJET_DANGER) & " identifié"
    
    'étiquettes dépendantes du module
    Dim i As Integer
    For i = 1 To 2
        lblNiveau(i).Caption = "&" & UCase$(Left$(Module.Niveau(i), 1)) & suppfirstchar(Module.Niveau(i), 1) & " :"
    Next
    
    'remplit la liste des étapes et sujets
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

'fonction d'ajout ET DE MODIFICATION d'un sujet/danger (appelée depuis la fenêtre à onglet)
'entrée:
'   projet1: projet concerné
'   sujetdanger1: sujetdanger à modifié (le sujetdanger ajouté est créé avant et modifié par cette fonction)
'   ctl: spread des sujets dangers dans la fenêtre de projet
'   caption: titre de la fenêtre
'   NuveauSujetDanger: à vrai en cas d'ajout, faux en cas de modification de sujet/danger
'sortie:
'   sujetdanger1: sujet/danger modifié
'   projet1: projet modifié
'   bAjoutsEffectués: à vrai si des sujets/dangers ont été ajoutés par le buton ajouter
Public Function AjouterSujetDanger(Projet1 As Projet, SujetDanger1 As SujetDanger, ctl As Control, ByVal chCaption As String, ByVal NouveauSujetDanger As Integer, ByVal KeyBefore1 As String, bAjoutsEffectués As Integer)
    
    'projet, sujetDanger, danger et spread à modifier
    'références accessibles dans tout le module
    Set Projet = Projet1
    Set SujetDanger = SujetDanger1
    Set SpreadCtl = ctl
    bNouveauSujetDanger = NouveauSujetDanger
    KeyBefore = KeyBefore1
    
    'charge et initialise la fenêtre
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
            ComboDangers.ListIndex = PositionDansListe(ComboDangers, Projet.Danger(SujetDanger.Danger).Nature & " / " & Projet.Danger(SujetDanger.Danger).Spécificité)
        End If
        txtNom = gTypeDangerRémanent
    Else
        ComboEtapes.ListIndex = PositionDansListe(ComboEtapes, Projet.Etape(SujetDanger.Etape).Titre)
        ComboSujets.ListIndex = PositionDansListe(ComboSujets, Projet.Etape(SujetDanger.Etape).Enfant(SujetDanger.Sujet).Titre)
        ComboDangers.ListIndex = PositionDansListe(ComboDangers, Projet.Danger(SujetDanger.Danger).Nature & " / " & Projet.Danger(SujetDanger.Danger).Spécificité)
        txtNom = SujetDanger.Nom
    End If
    
    txtCommentaire = SujetDanger.Commentaire
    lblCriticité.Caption = SujetDanger.Criticité
    If Not NouveauSujetDanger Then
        'le bouton ajouter sert pour modifier
        btnAjouter.Caption = "&Modifier"
    End If
    RefreshBoutons
    
    'affiche la fenêtre
    FormAjoutSujetDanger.Show MODAL
    
    'récupère les données saisies
    If FormAjoutSujetDanger.Tag <> "" Then
        If Not NouveauSujetDanger Then
            'mémorise le sujet/danger modifié
            ProgAnnulationModifSujetDanger FormMain.ActiveForm.Tag, SujetDanger, "étape de danger"
        End If
        SujetDanger.Etape = "E" & ComboEtapes.ItemData(ComboEtapes.ListIndex)
        SujetDanger.Sujet = "E" & ComboSujets.ItemData(ComboSujets.ListIndex)
        SujetDanger.Danger = "D" & ComboDangers.ItemData(ComboDangers.ListIndex)
        SujetDanger.Nom = txtNom.Text
        SujetDanger.Commentaire = txtCommentaire.Text
        SujetDanger.Criticité = lblCriticité.Caption
        'marque projet modifié
        FormMain.ActiveForm.Projet.EstModifié
    End If
    
    'code de retour (appui sur Ok ou Annuler)
    AjouterSujetDanger = FormAjoutSujetDanger.Tag <> ""
    bAjoutsEffectués = btnAjouter.Tag <> ""
    
    'décharge la fenêtre
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
        LigneEtat "Entrez ici une brève description du " & Module.Niveau(NIVEAU_SUJET_DANGER)
    Else
        LigneEtat "Brève description concernant le " & Module.Niveau(NIVEAU_SUJET_DANGER)
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


