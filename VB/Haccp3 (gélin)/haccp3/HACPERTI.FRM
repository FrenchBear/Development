VERSION 4.00
Begin VB.Form FormAjoutDanger 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Pertinence danger"
   ClientHeight    =   2310
   ClientLeft      =   345
   ClientTop       =   1470
   ClientWidth     =   6570
   Height          =   2715
   HelpContextID   =   60
   Left            =   285
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2310
   ScaleWidth      =   6570
   ShowInTaskbar   =   0   'False
   Top             =   1125
   Width           =   6690
   Begin VB.CommandButton btnDocuments 
      Caption         =   "Documents associés..."
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   1800
      Width           =   3075
   End
   Begin VB.CommandButton btnQuestionnaire 
      Caption         =   "&Aide à l'évaluation de la pertinence..."
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   1380
      Width           =   3075
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   5160
      TabIndex        =   11
      Top             =   1440
      Width           =   1275
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   5160
      TabIndex        =   10
      Top             =   960
      Width           =   1275
   End
   Begin VB.CommandButton btnAjouter 
      Caption         =   "Ajo&uter"
      Height          =   375
      Left            =   5160
      TabIndex        =   9
      Top             =   540
      Width           =   1275
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   5160
      TabIndex        =   8
      Top             =   120
      Width           =   1275
   End
   Begin VB.ComboBox ComboPertinence 
      Height          =   315
      ItemData        =   "HACPERTI.frx":0000
      Left            =   1080
      List            =   "HACPERTI.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   840
      Width           =   3855
   End
   Begin VB.ComboBox ComboSpécificités 
      Height          =   315
      Left            =   1080
      TabIndex        =   3
      Top             =   480
      Width           =   3855
   End
   Begin VB.ComboBox comboNatures 
      Height          =   315
      Left            =   1080
      TabIndex        =   1
      Top             =   120
      Width           =   3855
   End
   Begin VB.Label Label1 
      Caption         =   "&Pertinence :"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   4
      Top             =   900
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "&Spécificité :"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   540
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "&Nature :"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   810
   End
End
Attribute VB_Name = "FormAjoutDanger"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'projet courant
Dim Projet As Projet

'danger ajouté ou modifié
Dim Danger As Danger

'clé du danger qui suit celui qui est ajouté
Dim KeyBefore As String

'spread des dangers dans la fenêtre à onglet courante
Dim SpreadCtl As Control

'danger ajouté
Dim bNouveauDanger As Integer

'mémorise les index dans les listes pour rémanence avant transfert en global sur le OK
Dim ListIndexNature As Integer
Dim ListIndexSpécificité As Integer

'l'éta des boutons dépend du contexte
Private Sub RefreshBoutons()

    'boutons Documents
    If Danger.DocumentsCount = 0 Then
        btnDocuments.Caption = "Aucun document associé..."
    Else
        If Danger.DocumentsCount = 1 Then
            btnDocuments.Caption = Danger.DocumentsCount & " document associé..."
        Else
            btnDocuments.Caption = Danger.DocumentsCount & " documents associés..."
        End If
    End If
    'boutons OK et Ajouter
    btnOk.Enabled = Trim$(ComboNatures.Text) <> "" And Trim$(ComboSpécificités.Text) <> "" And btnOk.Tag = ""
    btnAjouter.Enabled = Trim$(ComboNatures.Text) <> "" And Trim$(ComboSpécificités.Text) <> ""
    btnQuestionnaire.Enabled = Trim$(ComboNatures.Text) <> "" And Trim$(ComboSpécificités.Text) <> ""

End Sub


Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub

Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


'ajout d'un danger sans fermer la fenêtre
Private Sub btnAjouter_Click()

Dim NewDanger As New Danger
        
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
        
    If bNouveauDanger Then
        'danger à ajouter
        NewDanger.id = "D" & Projet.NewId
    Else
        'danger à modifier
        Set NewDanger = Danger
        'mémorise le danger modifié
        ProgAnnulationModifDanger FormMain.ActiveForm.Tag, NewDanger, Module.Niveau(NIVEAU_SUJET_DANGER)
    End If
    NewDanger.Nature = ComboNatures
    NewDanger.Spécificité = ComboSpécificités
    NewDanger.Pertinence = comboPertinence
    'modifie le spread dans la fenêtre à onglets courante
    With SpreadCtl
        If bNouveauDanger Then
            'se positionne sur ligne vierge
            .Row = .ActiveRow '.MaxRows
        End If
        .Col = 1
        .Text = NewDanger.id
        .Col = 2
        .Text = NewDanger.Nature
        .Col = 3
        .Text = NewDanger.Spécificité
        .Col = 4
        .Text = NewDanger.Pertinence
        .Col = 5
        .Lock = NewDanger.DocumentsCount = 0
        If .Lock Then
            .TypeButtonPicture = LoadPicture("")
            .TypeButtonPictureDown = LoadPicture("")
        Else
            .TypeButtonPicture = FormMain.ActiveForm.picFleche.Picture
            .TypeButtonPictureDown = FormMain.ActiveForm.picFleche.Picture
        End If
        If bNouveauDanger Then
            'près pour un nouveau danger
            .Row = .ActiveRow + 1
            .Col = .ActiveCol
            .Action = SS_ACTION_ACTIVE_CELL
            'un danger de plus
            FormMain.ActiveForm.btnInsérerDanger_Click
        End If
    End With
    ComboNatures.Text = ""
    ComboSpécificités.Text = ""
    
    'ajout du danger au projet
    If bNouveauDanger Then
        'mémorise le danger ajouté
        ProgAnnulationAjoutDanger FormMain.ActiveForm.Tag, NewDanger, Module.Niveau(NIVEAU_SUJET_DANGER)
        'ajout du danger au projet
        If KeyBefore = "" Then
            'à la fin de la liste
            Projet.AddDanger NewDanger
        Else
            'inséré
            Projet.AddDanger NewDanger, KeyBefore
        End If
    End If
    
    'marque que le bouton Ajouter a été utilisé
    btnAjouter.Tag = "1"
    btnAjouter.Caption = "&Ajouter"
    'passe en ajout de danger après une modification ou un premier ajout
    bNouveauDanger = True
    btnAnnuler.Caption = "&Fermer"
    ComboNatures.SetFocus
    btnOk.Tag = "1" 'pour qu'il ne soit plus actif selonRefreshBoutons
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub btnAjouter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If bNouveauDanger Then
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

    AfficherDocuments Danger
    RefreshBoutons

End Sub

Private Sub btnDocuments_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour associer des documents au " & Module.Niveau(NIVEAU_SUJET_DANGER)
End Sub


'sortie avec validation
Private Sub btnOk_Click()

    Tag = "1"
    gNatureRémanente = ComboNatures.Text
    gSpécificitéRémanente = ComboSpécificités.Text
    LigneEtat ""
    Hide

End Sub

Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour valider les informations saisies et fermer la fenêtre"
End Sub


'gestion du questionnaire d'évaluation de la pertinence du danger
Private Sub btnQuestionnaire_Click()

Dim Pertinence As String
Dim Questions As QuestPertinences
Dim UneQuestion As New QuestPertinences
Dim cr As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'question unique s'il n'y a pas de questionnaire ou que la nature ou la spécificité ont été saisies manuellement
    UneQuestion.Add "1", "Le Danger de spécificité '" & ComboSpécificités & "' et de nature '" & ComboNatures & "' est-il pertinent ?", MODULE_TYPE_REPONSE_DANGER_PERTINENT, MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT
    
    If PositionDansListe(ComboNatures, ComboNatures.Text) <> -1 And PositionDansListe(ComboSpécificités, ComboSpécificités.Text) <> -1 Then
        'les natures et spécificités proviennent du module
        Set Questions = Module.Natures.Item(ComboNatures).Spécificités.Item(ComboSpécificités).QuestPertinences
        If Questions Is Nothing Or Questions.Count = 0 Then
            'questionnaire vide ou pas de questionnaire
            cr = ExécuterQuestionnairePertinence(UneQuestion, Pertinence)
        Else
            cr = ExécuterQuestionnairePertinence(Questions, Pertinence)
        End If
    Else
        'la nature ou la spécificité ont été saisies librement par l'opérateur et ne sont pas dans le module
        cr = ExécuterQuestionnairePertinence(UneQuestion, Pertinence)
    End If
    If cr Then
        'nouvelle pertinence pour le danger
        Danger.Pertinence = Pertinence
        'marquée dans la liste des pertinences
        comboPertinence.ListIndex = PositionDansListe(comboPertinence, Danger.Pertinence)
    End If
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnQuestionnaire_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour évaluer facilement la pertinence du " & Module.Niveau(NIVEAU_SUJET_DANGER)
End Sub


'changement de nature par saisie manuelle
Private Sub ComboNatures_Change()
    
Dim pos As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    pos = PositionDansListe(ComboNatures, ComboNatures)
    If pos <> -1 Then
        'spécificités de la nature choisie
        RemplitListeSpécificités pos
    Else
        If PositionDansListe(ComboSpécificités, ComboSpécificités) <> -1 Then
            'spécificités définies dans le module si la spécificité
            'saisie est dans le module
            RemplitListeSpécificités ComboNatures.ListIndex
        End If
    End If
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

'choix d'une nature dans la liste
Private Sub ComboNatures_Click()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'change les spécificités
    RemplitListeSpécificités ComboNatures.ListIndex
    'mémorise nature cliquée pour rémanence
    ListIndexNature = ComboNatures.ListIndex
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub


Private Sub ComboNatures_GotFocus()
    SelectionneZoneTexte ComboNatures, 4 * 16 + 14
End Sub


Private Sub comboPertinence_Click()
    RefreshBoutons
End Sub


Private Sub ComboSpécificités_Change()
    RefreshBoutons
End Sub

Private Sub ComboSpécificités_Click()
    'mémorise spécificité cliquée pour rémanence
    ListIndexSpécificité = ComboSpécificités.ListIndex
    RefreshBoutons
End Sub

Private Sub ComboSpécificités_GotFocus()
    SelectionneZoneTexte ComboSpécificités, 5 * 16 + 3
End Sub



'fenêtre d'ajout d'un danger
Private Sub Form_Load()

    Tag = ""
    CenterInScreen Me
    'remplit la liste des natures et des spécificités
    RemplitListeNatures
    HourGlass "hide"
    
End Sub

Public Function AjouterDanger(Projet1 As Projet, Element As Danger, ctl As Control, ByVal chCaption As String, ByVal NouveauDanger As Integer, ByVal KeyBefore1 As String, bAjoutsEffectués As Integer)
    
    'projet, danger et spread à modifier
    'références accessibles dans tout le module
    Set Projet = Projet1
    Set Danger = Element
    Set SpreadCtl = ctl
    bNouveauDanger = NouveauDanger
    KeyBefore = KeyBefore1
    
    'charge et initialise la fenêtre
    Load FormAjoutDanger
    FormAjoutDanger.Caption = chCaption
    If NouveauDanger Then
        ComboNatures.Text = gNatureRémanente
        ComboSpécificités.Text = gSpécificitéRémanente
    Else
        ComboNatures.Text = Danger.Nature
        ComboSpécificités.Text = Danger.Spécificité
    End If
    comboPertinence.ListIndex = PositionDansListe(comboPertinence, Danger.Pertinence)
    If Not bNouveauDanger Then
        btnAjouter.Caption = "&Modifier"
    End If
    RefreshBoutons
    
    'affiche la fenêtre
    FormAjoutDanger.Show MODAL
    
    'récupère les données saisies
    If FormAjoutDanger.Tag <> "" Then
        If Not bNouveauDanger Then
            'mémorise le danger modifié
            ProgAnnulationModifDanger FormMain.ActiveForm.Tag, Element, Module.Niveau(NIVEAU_SUJET_DANGER)
        End If
        Element.Nature = FormAjoutDanger.ComboNatures.Text
        Element.Spécificité = FormAjoutDanger.ComboSpécificités.Text
        Element.Pertinence = FormAjoutDanger.comboPertinence.Text
        'marque projet modifié
        FormMain.ActiveForm.Projet.EstModifié
    End If
    
    'code de retour (appui sur Ok ou Annuler)
    AjouterDanger = FormAjoutDanger.Tag <> ""
    bAjoutsEffectués = btnAjouter.Tag <> ""
    
    'décharge la fenêtre
    Unload FormAjoutDanger

End Function

Private Sub RemplitListeNatures()

Dim i As Integer
Dim n As Integer

    'remplissage de la liste de natures
    ComboNatures.clear
    For i = 1 To Module.Natures.Count
        ComboNatures.AddItem Module.Natures.Item(i).Libellé
    Next

    'sélectionne la dernière nature choisie
    If ComboNatures.ListCount <> 0 Then
        If ComboNatures.ListIndex = 0 Then
            RemplitListeSpécificités ComboNatures.ListIndex
        Else
            ComboNatures.ListIndex = 0
        End If
    Else
        'pour effacer la liste de spécificités quand il n'y a pas de nature
        RemplitListeSpécificités -1
    End If

End Sub
Sub RemplitListeSpécificités(ByVal IndexListeNatures As Integer)

Dim i As Integer
Dim Nature As Nature

    ComboSpécificités.clear
    If IndexListeNatures < 0 Then
        Exit Sub
    End If
    Set Nature = Module.Natures.Item(ComboNatures)
    
    For i = 1 To Nature.Spécificités.Count
        ComboSpécificités.AddItem Nature.Spécificités.Item(i).Libellé
    Next
    If ComboSpécificités.ListCount <> 0 Then
        ComboSpécificités.ListIndex = 0
    End If

End Sub






Private Function ExécuterQuestionnairePertinence(ByVal Questions As QuestPertinences, Pertinence As String)

Dim id As String
Dim Rep As String
Dim cr As Integer

    On Error Resume Next
    Rep = Questions.Item(1).id
    Do
        id = Rep
        cr = MsgBox(Questions.Item(id).Question, MB_YESNOCANCEL, NomApplication)
        Select Case cr
            Case IDYES
                Rep = Questions.Item(id).RéponseOui
            Case IDNO
                Rep = Questions.Item(id).RéponseNon
            Case Else
                ExécuterQuestionnairePertinence = False
                On Error GoTo 0
                Exit Function
        End Select
        If Rep = MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT Or Rep = MODULE_TYPE_REPONSE_DANGER_PERTINENT Then
            If Rep = MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT Then
                cr = MsgBox("Ce " & LCase$(Module.Niveau(NIVEAU_SUJET_DANGER)) & " est considéré comme non pertinent." & vbCrLf & "Voulez-vous le maintenir tel quel ?", MB_YESNOCANCEL, NomApplication)
            End If
            If Rep = MODULE_TYPE_REPONSE_DANGER_PERTINENT Then
                cr = MsgBox("Ce " & LCase$(Module.Niveau(NIVEAU_SUJET_DANGER)) & " est considéré comme pertinent." & vbCrLf & "Voulez-vous le maintenir tel quel ?", MB_YESNOCANCEL, NomApplication)
            End If
            Select Case cr
                Case IDYES
                    ExécuterQuestionnairePertinence = True
                    Pertinence = Rep
                    On Error GoTo 0
                    Exit Function
                Case IDNO
                    Rep = IIf(Rep = MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT, MODULE_TYPE_REPONSE_DANGER_PERTINENT, MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT)
                    ExécuterQuestionnairePertinence = True
                    Pertinence = Rep
                    On Error GoTo 0
                    Exit Function
                Case IDCANCEL
                    ExécuterQuestionnairePertinence = False
                    On Error GoTo 0
                    Exit Function
            End Select
        End If
        
    Loop While True


End Function

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub Label1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


