VERSION 4.00
Begin VB.Form formAjoutDonn�e 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   6240
   ClientLeft      =   1740
   ClientTop       =   675
   ClientWidth     =   6405
   Height          =   6645
   Left            =   1680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6240
   ScaleWidth      =   6405
   ShowInTaskbar   =   0   'False
   Top             =   330
   Width           =   6525
   Begin VB.CommandButton btnChoisirSuggestion 
      Caption         =   "&Choisir"
      Height          =   375
      Left            =   1200
      TabIndex        =   13
      Top             =   5820
      Width           =   975
   End
   Begin VB.CommandButton btnCriticit� 
      Caption         =   "Criti&que ?"
      Height          =   375
      Left            =   3420
      TabIndex        =   5
      Top             =   1920
      Width           =   2115
   End
   Begin VB.CommandButton btnRestaurerSuggestion 
      Caption         =   "R&estaurer le module"
      Height          =   375
      Left            =   4260
      TabIndex        =   15
      Top             =   5820
      Width           =   1995
   End
   Begin VB.CommandButton btnSupprimerSuggestion 
      Caption         =   "&Supprimer"
      Height          =   375
      Left            =   2220
      TabIndex        =   14
      Top             =   5820
      Width           =   975
   End
   Begin VB.CommandButton btnAjouterSuggestion 
      Caption         =   "&Ajouter au module"
      Height          =   375
      Left            =   1200
      TabIndex        =   6
      Top             =   2340
      Width           =   2175
   End
   Begin VB.CommandButton btnRemplacerSuggestion 
      Caption         =   "&Remplacer dans le module"
      Height          =   375
      Left            =   3420
      TabIndex        =   7
      Top             =   2340
      Width           =   2115
   End
   Begin VB.ListBox lstSuggestions 
      Height          =   2790
      Left            =   1200
      TabIndex        =   12
      Top             =   2940
      Width           =   5055
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   5160
      TabIndex        =   10
      Top             =   1020
      Width           =   1095
   End
   Begin VB.CommandButton btnDocuments 
      Caption         =   "D&ocuments associ�s..."
      Height          =   375
      Left            =   1200
      TabIndex        =   4
      Top             =   1920
      Width           =   2175
   End
   Begin VB.CommandButton btnAnnuler 
      Caption         =   "Annuler"
      Height          =   375
      Left            =   5160
      TabIndex        =   9
      Top             =   540
      Width           =   1095
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   5160
      TabIndex        =   8
      Top             =   120
      Width           =   1095
   End
   Begin VB.TextBox txtCommentaire 
      Height          =   1335
      Left            =   1200
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Top             =   480
      Width           =   3735
   End
   Begin VB.TextBox txtTitre 
      Height          =   285
      Left            =   1200
      TabIndex        =   1
      Top             =   120
      Width           =   3735
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
      Height          =   255
      Left            =   5580
      TabIndex        =   16
      Top             =   1980
      Width           =   675
   End
   Begin VB.Label Label1 
      Caption         =   "Suggestio&ns:"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   11
      Top             =   2940
      Width           =   975
   End
   Begin VB.Line Line1 
      Index           =   0
      X1              =   120
      X2              =   6240
      Y1              =   2820
      Y2              =   2820
   End
   Begin VB.Label Label1 
      Caption         =   "&Description d�taill�e:"
      Height          =   735
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "&Titre:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   855
   End
End
Attribute VB_Name = "formAjoutDonn�e"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'variable indiquant pendant le fonctionnement de la fen�tre si on est en
'modification ou en ajout
Private Action As Integer
Private Const ACTION_AJOUTER = 0
Private Const ACTION_MODIFIER = 1

'donn�e � modifier
Private Donn�e As Donnee

'param�tres pass� � AjouterDonn�e stock�s au niveau du module pour pouvoir
'y acc�der dans toute la gestion de la fen�tre
Private iNiveau As Integer
Private iAffichage As Integer
Private iAssistance As Integer
Private iSujetAide As Integer
Private bEvaluerCriticit� As Integer
Private objParentDansExistant As Donnee

'valeur maximale de itemdata pour les suggestions issues du module
'les suggestions ajout�es par l'op�rateur ont un num�ro sup�rieur
Private MaxItemData As Integer

'donn�e temporaire pour la modification des documents
Private TempDonn�e As Donnee
Private TempDocuments As Documents

'm�morise position dans la liste des suggestions juqu'au Ok qui la transf�re en variable globale gListIndexSuggestion
Private ListIndexSuggestion As Integer

'fonction d'ajout d'une donn�e, appel�e depuis la fen�tre de projet
'entr�e:
'   �l�ment � modifier (l'�l�ment ajout� est cr�e avant et est modifi� par la fonction)
'   titre de la fen�tre
'   niveau de la donn�e
'   affichage en cours
'   Assistance: � vrai pour ajouter aux suggestions les dispositions actuelles (valable
'               seulement pour l'affichage arbre HACCP)
'   EvaluerCriticit�: � vrai quand l'op�rateur peut �valuer la criticit�
'   ParentDansExistant: donn�e de niveau sup�rieur dans les dispositions actuelles (va avec Assistance � vrai)
'   SujetAide: contextID pour l'aide en ligne
'sortie:
'   �l�ment modifi�
'retour:
'   true si un �l�ment a �t� ajout�, false sinon
Public Function AjouterDonn�e(Element As Object, ByVal chCaption As String, ByVal Niveau As Integer, ByVal Affichage As Integer, ByVal Assistance As Integer, ByVal EvaluerCriticit� As Integer, ByVal ParentDansExistant As Donnee, ByVal SujetAide As Integer)

    'mode de gestion de la fen�tre
    Action = ACTION_AJOUTER
    
    'objet � modifier et param�tres accessibles dans tout le module
    Set Donn�e = Element
    iNiveau = Niveau
    iAffichage = Affichage
    iAssistance = Assistance
    iSujetAide = SujetAide
    HelpContextID = iSujetAide
    bEvaluerCriticit� = EvaluerCriticit�
    Set objParentDansExistant = ParentDansExistant
    'objets temporaires tant que l'ajout n'est pas valid� par OK
    Set TempDonn�e = Nothing
    Set TempDocuments = Donn�e.Documents
    
    'charge et initialise la fen�tre
    Load formAjoutDonn�e
    Caption = chCaption
    btnCriticit�.Enabled = bEvaluerCriticit�
    lblCriticit�.Visible = bEvaluerCriticit�
    'suggestions
    RemplitListeSuggestions iNiveau, iAffichage, iAssistance, objParentDansExistant
    RefreshBoutons
    
    'affiche la fen�tre
    formAjoutDonn�e.Show MODAL
        
    'si appui sur OK
    If formAjoutDonn�e.Tag <> "" Then
        'r�cup�re les donn�es saisies
        Element.Titre = formAjoutDonn�e.txtTitre.Text
        Element.Commentaire = formAjoutDonn�e.txtCommentaire.Text
        If Not TempDonn�e Is Nothing Then
            'change de collection de documents seulement si elle a �t� modifi�e
            Set Element.Documents = TempDonn�e.Documents
        End If
        'marque projet modifi�
        FormMain.ActiveForm.Projet.EstModifi�
    End If
    
    'code de retour (appui sur Ok ou Annuler)
    AjouterDonn�e = formAjoutDonn�e.Tag <> ""
    
    'd�charge la fen�tre
    Unload formAjoutDonn�e
    
End Function


'fonction d'ajout d'une donn�e, appel�e depuis la fen�tre de projet
'entr�e:
'   �l�ment � modifier
'   titre de la fen�tre
'   niveau de la donn�e
'   affichage en cours
'   Assistance: � vrai pour ajouter aux suggestions les dispositions actuelles (valable
'               seulement pour l'affichage arbre HACCP)
'   EvaluerCriticit�: � vrai quand l'op�rateur peut �valuer la criticit�
'   ParentDansExistant: donn�e de niveau sup�rieur dans les dispositions actuelles (va avec Assistance � vrai)
'   SujetAide: contextID pour l'aide en ligne
'sortie:
'   �l�ment modifi�
'retour:
'   true si un �l�ment a �t� ajout�, false sinon
Public Function ModifierDonn�e(Element As Object, ByVal chCaption As String, ByVal Niveau As Integer, ByVal Affichage As Integer, ByVal Assistance As Integer, ByVal EvaluerCriticit� As Integer, ByVal ParentDansExistant As Donnee, ByVal SujetAide As Integer)

    'mode de gestion de la fen�tre
    Action = ACTION_MODIFIER
        
    'objet � modifier r�f�renc� accessible dans tout le module
    Set Donn�e = Element
    iNiveau = Niveau
    iAffichage = Affichage
    iAssistance = Assistance
    iSujetAide = SujetAide
    HelpContextID = iSujetAide
    bEvaluerCriticit� = EvaluerCriticit�
    Set objParentDansExistant = ParentDansExistant
    'collection temporaire de documents tant que la modification n'est pas valid� par OK
    Set TempDocuments = Donn�e.Documents
    
    'charge et initialise la fen�tre
    Load formAjoutDonn�e
    formAjoutDonn�e.Caption = chCaption
    txtTitre = Element.Titre
    txtCommentaire = Element.Commentaire
    btnCriticit�.Enabled = bEvaluerCriticit�
    lblCriticit�.Caption = Element.Criticit�
    lblCriticit�.Visible = bEvaluerCriticit�
    'suggestions
    RemplitListeSuggestions iNiveau, Affichage, iAssistance, objParentDansExistant
    RefreshBoutons
    
    'affiche la fen�tre
    Set TempDonn�e = Nothing
    formAjoutDonn�e.Show MODAL
    
    If formAjoutDonn�e.Tag <> "" Then
        'sauvegarde pour annulation �ventuelle
        ProgAnnulationModifDonn�e FormMain.ActiveForm.Tag, Element, Module.Niveau(Niveau), Affichage
        'met � jour la donn�e avec les donn�es saisies
        Element.Titre = formAjoutDonn�e.txtTitre.Text
        Element.Commentaire = formAjoutDonn�e.txtCommentaire.Text
        If Not TempDonn�e Is Nothing Then
            'change de collection de documents seulement si elle a �t� modifi�e
            Set Element.Documents = TempDonn�e.Documents
        End If
        'marque projet modifi�
        FormMain.ActiveForm.Projet.EstModifi�
    End If
    
    'appui sur Ok ou Annuler
    ModifierDonn�e = formAjoutDonn�e.Tag <> ""
      
    'd�charge la fen�tre
    Unload formAjoutDonn�e
    
End Function



'mise � jour des boutons en fonction du contexte
Private Sub RefreshBoutons()

    'boutons Documents et Ok
    If TempDocuments.Count = 0 Then
        btnDocuments.Caption = "Aucun d&ocument associ�..."
    Else
        If TempDocuments.Count = 1 Then
            btnDocuments.Caption = TempDocuments.Count & " document associ�..."
        Else
            btnDocuments.Caption = TempDocuments.Count & " documents associ�s..."
        End If
    End If
    'le titre ne doit pas �tre vide pour valider
    btnOk.Enabled = Trim$(txtTitre.Text) <> ""
    
    'boutons des suggestions
    Dim SuggestionExistePasD�j� As Integer
    SuggestionExistePasD�j� = (PositionDansListeHorsItemDataN�gatif(lstSuggestions, Trim$(txtTitre.Text)) = -1)
    'les suggestions en issues des dispositions en place (itemdata < 0) ne peuvent
    'pas �tre "supprim�es"
    If lstSuggestions.ListIndex <> -1 Then
        'un seul And ne fonctionne pas car VB �volue tout les membres d'un AND m�me si le premier est faux !!!
        btnSupprimerSuggestion.Enabled = lstSuggestions.ItemData(lstSuggestions.ListIndex) > 0
    Else
        btnSupprimerSuggestion.Enabled = False
    End If
    'l'ajout est possible si la suggestion n'est pas d�j� dans la liste (sans tenir
    'compte des suggestions issues des dispositions en place)
    btnAjouterSuggestion.Enabled = btnOk.Enabled And SuggestionExistePasD�j�
    'le remplacement est possible si la suggestion n'est pas d�j� dans la liste
    '(sans tenir compte des suggestions issues des dispositions en place) et que
    'la suggestion remplac�e est issue du module et pas des dispositions en place
    btnRemplacerSuggestion.Enabled = btnOk.Enabled And SuggestionExistePasD�j� And lstSuggestions.ListIndex <> -1
    If btnRemplacerSuggestion.Enabled Then
        'un seul And ne fonctionne pas car VB �volue tout les membres d'un AND m�me si le premier est faux !!!
        btnRemplacerSuggestion.Enabled = lstSuggestions.ItemData(lstSuggestions.ListIndex) > 0
    End If
    btnChoisirSuggestion.Enabled = lstSuggestions.ListIndex <> -1
    
End Sub


'Retourne la position de la chaine de caract�re "chaine"
'   dans la liste "ctl" sans tenir compte des chaines de la liste
'   dont l'item data est < 0
'sinon retourne -1
Private Function PositionDansListeHorsItemDataN�gatif(ctl As Control, ByVal chaine As String) As Integer
Dim NumListe As Integer

    'Si la chaine est vide : pas de s�lection
    'Par d�faut : pas de s�lection
    PositionDansListeHorsItemDataN�gatif = -1
    If chaine <> "" Then
        'Tag non vide : recherche de l'�l�ment dans la liste
        For NumListe = 0 To ctl.ListCount - 1
            If (UCase$(ctl.List(NumListe)) = UCase$(chaine)) And ctl.ItemData(NumListe) > 0 Then
                'S�lection de l'item
                PositionDansListeHorsItemDataN�gatif = NumListe
            End If
        Next
    End If

End Function


Private Sub btnAide_Click()
    AideProgramme iSujetAide
End Sub

Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


'ajout d'une suggestion dans le module
Private Sub btnAjouterSuggestion_Click()

Dim IndexSuggestion As Integer
Dim MonErreur As Long

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'l'index de la suggestion est le dernier plus 1
    If lstSuggestions.ListCount = 0 Then
        IndexSuggestion = 1
    Else
        IndexSuggestion = lstSuggestions.ItemData(lstSuggestions.ListCount - 1) + 1
    End If
    'ajoute la suggestion
    Module.AddSuggestion iNiveau, txtTitre, txtCommentaire, IndexSuggestion, IIf(iAffichage = INDEX_AFF_ETAPES_ET_SUJETS, INDEX_AFF_DISPOSITIONS, iAffichage), True, False, False
    'et enregistre le module
    On Error Resume Next
    Module.Erreur = 0
    Module.Save
    If Module.Erreur Then
        'erreur � l'enregistrement du module
        MonErreur = Module.Erreur - vbObjectError
        If MonErreur > 0 And MonErreur < 65535 Then
            ErreurUserBox GetChaineCrLf("M21"), MB_ICONEXCLAMATION
        Else
            'erreur Visual Basic.
            ErreurSystemeBox Error$, MB_ICONEXCLAMATION, NomApplication
        End If
    Else
        'ajoute la suggestion � la liste
        lstSuggestions.AddItem txtTitre
        lstSuggestions.ListIndex = lstSuggestions.NewIndex
        lstSuggestions.ItemData(lstSuggestions.ListIndex) = IndexSuggestion
        btnAjouterSuggestion.Enabled = False
        btnAnnuler.Caption = "&Fermer"
    End If
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub


Private Sub btnAjouterSuggestion_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour ajouter l'�l�ment du haut au module '" & Module.Titre & "'"
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


'choix d'une suggestion dans la liste
Private Sub btnChoisirSuggestion_Click()
    'titre de la suggestion
    txtTitre.Text = lstSuggestions
    'et commentaire
    If lstSuggestions.ItemData(lstSuggestions.ListIndex) > 0 Then
        txtCommentaire.Text = Module.SuggestionDescription(iNiveau, lstSuggestions.ItemData(lstSuggestions.ListIndex), IIf(iAffichage = INDEX_AFF_ETAPES_ET_SUJETS, INDEX_AFF_DISPOSITIONS, iAffichage))
    Else
        txtCommentaire.Text = objParentDansExistant.Enfant(-lstSuggestions.ItemData(lstSuggestions.ListIndex)).Commentaire
    End If
    RefreshBoutons
End Sub

'�valuation de la criticit� (bouton activ� pour deux niveaux de donn�es de l'arbre HACCP)
Private Sub btnCriticit�_Click()

Dim Criticit� As String
Dim chTitre As String
Dim TempQuestCriticit� As QuestCriticite
   
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
   
    'titre de la fen�tre du questionnaire d'�valuation de la criticit�
    chTitre = Module.Niveau(iNiveau) & " '" & txtTitre.Text & "'"
              
    If Donn�e.QuestCriticit� Is Nothing Then
        'nouveau questionnaire
        Set TempQuestCriticit� = New QuestCriticite
    Else
        'ou copie du questionnaire de la donn�e
        Set TempQuestCriticit� = Donn�e.QuestCriticit�.Copy
    End If
    Criticit� = lblCriticit�.Caption
    'gestion du questionnaire
    If FormQuestCriticit�.Ex�cuterQuestionnaireCriticit�(iNiveau - 2, chTitre, "Evaluation de la criticit�: ", TempQuestCriticit�, Criticit�) Then
        'sortie par OK
        'Donn�e � modifier
        Donn�e.Criticit� = Criticit�
        Set Donn�e.QuestCriticit� = TempQuestCriticit�
        lblCriticit�.Caption = Criticit�
        'marque projet modifi�
        FormMain.ActiveForm.Projet.EstModifi�
    End If
    RefreshBoutons

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnCriticit�_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour �valuer la criticit� de l'�l�ment"
End Sub


Private Sub btnDocuments_Click()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'on travaille sur une copie de la collection de documents
    If TempDonn�e Is Nothing Then
        Set TempDonn�e = Donn�e.MiniCopy
        Set TempDocuments = TempDonn�e.Documents
    End If
    'gestion de la liste des documents
    AfficherDocuments TempDonn�e
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub btnDocuments_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour associer des documents � l'�l�ment"
End Sub


'sortie avec validation de l'ajout ou de la modification de la donn�e
Private Sub btnOk_Click()
    
    Tag = "1"
    LigneEtat ""
    gListIndexSuggestion = ListIndexSuggestion
    Hide
    
End Sub

Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Action = ACTION_AJOUTER Then
        LigneEtat "Cliquez ici pour ajouter l'�l�ment au projet HACCP"
    Else
        LigneEtat "Cliquez ici pour valider la modification de l'�l�ment"
    End If
End Sub


'remplace une suggestion
'si la suggestion en cours est une diposition en place, le bouton Remplacer est
'd�sactiv� donc ce code ne peut pas �tre ex�cut�)
Private Sub btnRemplacerSuggestion_Click()

Dim IndexSuggestion As Integer
Dim MonErreur As Long
Dim cr As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
    
    HourGlass "show"
    IndexSuggestion = lstSuggestions.ItemData(lstSuggestions.ListIndex)
    'remplace la suggestion
    Module.RemplacerSuggestion iNiveau, txtTitre, txtCommentaire, IndexSuggestion, IIf(iAffichage = INDEX_AFF_ETAPES_ET_SUJETS, INDEX_AFF_DISPOSITIONS, iAffichage), False, False, True
    'et enregistre le module
    On Error Resume Next
    Module.Save
    HourGlass "hide"
    If Err Then
        'erreur � l'enregistrement
        MonErreur = Err.Number - vbObjectError
        If MonErreur > 0 And MonErreur < 65535 Then
            ErreurUserBox "Le module ne peut pas �tre enregistr�. La suggestion n'a pas �t� remplac�e dans le module.", MB_ICONEXCLAMATION
        Else
            'erreur Visual Basic.
            ErreurSystemeBox Error$, MB_ICONEXCLAMATION, NomApplication
        End If
    Else
        lstSuggestions.List(lstSuggestions.ListIndex) = txtTitre
        btnAnnuler.Caption = "&Fermer"
    End If
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnRemplacerSuggestion_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour remplacer dans le module '" & Module.Titre & "' l'�l�ment s�lectionn� dans la liste par celui du haut"
End Sub


'restaure le module
Private Sub btnRestaurerSuggestion_Click()

Dim cr As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'apr�s confirmation
    cr = MsgBox(GetChaineCrLf("M5"), MB_ICONEXCLAMATION Or MB_YESNO, NomApplication)
    If cr = IDYES Then
        'efface toutes les suggestions ajout�es et d�-�fface les
        'suggestions d'origine qui sont marqu�es effac�es
        HourGlass "show"
        Module.RestaureSuggestions iNiveau, IIf(iAffichage = INDEX_AFF_ETAPES_ET_SUJETS, INDEX_AFF_DISPOSITIONS, iAffichage)
        Module.Erreur = 0
        Module.Save
        HourGlass "hide"
        If Module.Erreur Then
            Dim MonErreur As Long
            MonErreur = Module.Erreur - vbObjectError
            If MonErreur > 0 And MonErreur < 65535 Then
                ErreurUserBox GetChaineCrLf("M17"), MB_ICONEXCLAMATION
            Else
                'erreur Visual Basic.
                ErreurSystemeBox Error$, MB_ICONEXCLAMATION, NomApplication
            End If
        Else
            btnAnnuler.Caption = "&Fermer"
        End If
        'refresh liste suggestions
        RemplitListeSuggestions iNiveau, iAffichage, iAssistance, objParentDansExistant
    End If
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub btnRestaurerSuggestion_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour restaurer le module '" & Module.Titre & "' dans son �tat d'origine"
End Sub


'suppression d'une suggestion: la suggestion n'est pas supprim�e mais marqu�e Effac�e
Private Sub btnSupprimerSuggestion_Click()

Dim IndexSuggestion As Integer
Dim MonErreur As Long
Dim cr As Integer
    
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
    
    'apr�s confirmation seulement
    cr = MsgBox(InsereChaine(GetChaineCrLf("M6"), lstSuggestions), MB_ICONQUESTION Or MB_YESNO, NomApplication)
    If cr = IDYES Then
        IndexSuggestion = lstSuggestions.ItemData(lstSuggestions.ListIndex)
        'Supprime la suggestion
        Module.DeleteSuggestion iNiveau, IndexSuggestion, IIf(iAffichage = INDEX_AFF_ETAPES_ET_SUJETS, INDEX_AFF_DISPOSITIONS, iAffichage), False
        'et enregistre le module
        On Error Resume Next
        Module.Save
        If Err Then
            'erreur � l'enregistrement du module (le module peut �tre sur CD-ROM (read-only)
            MonErreur = Err.Number - vbObjectError
            If MonErreur > 0 And MonErreur < 65535 Then
                ErreurUserBox GetChaineCrLf("M18"), MB_ICONEXCLAMATION
            Else
                'erreur Visual Basic.
                ErreurSystemeBox Error$, MB_ICONEXCLAMATION, NomApplication
            End If
        Else
            'refresh de la liste de suggestions
            Dim l As Integer
            l = lstSuggestions.ListIndex
            RemplitListeSuggestions iNiveau, iAffichage, iAssistance, objParentDansExistant
            lstSuggestions.ListIndex = maxi(0, l - 1)
            btnAnnuler.Caption = "&Fermer"
        End If
    End If
    RefreshBoutons
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
            
End Sub

Private Sub btnSupprimerSuggestion_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour supprimer du module '" & Module.Titre & "' l'�l�ment s�lectionn� dans la liste"
End Sub


'fen�tre d'ajout et modification d'une donn�e
Private Sub Form_Load()
    Tag = ""
    CenterInScreen Me
    btnOk.DEFAULT = True
    btnAnnuler.Cancel = True
    ListIndexSuggestion = gListIndexSuggestion
    HourGlass "hide"
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub Label1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub lstSuggestions_Click()
    ListIndexSuggestion = lstSuggestions.ListIndex
    RefreshBoutons
End Sub

'raccourci pour choisir une suggestion
Private Sub lstSuggestions_DblClick()
    btnChoisirSuggestion_Click
End Sub

Private Sub lstSuggestions_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Choisissez ici un �l�ment pr�d�finis en cliquant deux fois dessus"
End Sub

Private Sub txtCommentaire_GotFocus()
    SelectionneZoneTexte ActiveControl, 16 * 4 + 4
    btnOk.DEFAULT = False
End Sub

Private Sub txtCommentaire_LostFocus()
    btnOk.DEFAULT = True
End Sub


Private Sub txtCommentaire_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtCommentaire.Text = "" Then
        LigneEtat "Entrez ici une br�ve description de l'�l�ment"
    Else
        LigneEtat "Description de l'�l�ment"
    End If
End Sub

Private Sub txtTitre_Change()
    'met � jour l'�tat des boutons
    RefreshBoutons
End Sub


'les suggestions d�pendent du niveau de donn�e et de l'affichage
'pour l'arbre HACCP, elles incluent les dispositions en place si Assistance = true, dans
'ce cas, le param�tre ParentDansExistant est la donn�e parente des donn�es des dispositions
'en place � ajouter aux suggestions
Private Sub RemplitListeSuggestions(ByVal Niveau As Integer, ByVal Affichage As Integer, ByVal Assistance As Integer, ByVal ParentDansExistant As Donnee)

Dim i As Integer
Dim n As Integer

    If Assistance And ASSISTANCE_SUGGESTIONS Then
        If Affichage = INDEX_AFF_ETAPES_ET_SUJETS Then
            'les suggestions des �tapes et sujets sont recherch�s dans celles des dispositions en place
            Affichage = INDEX_AFF_DISPOSITIONS
        End If
        'vide la liste avant de la remplir
        lstSuggestions.clear
        'parcours des suggestions du niveau et de l'affichage donn�s
        n = Module.SuggestionsCount(Niveau, Affichage)
        For i = 1 To n
            'n'affiche pas les suggestions effac�e temporairement
            If Not Module.SuggestionEffac�e(Niveau, i, Affichage) Then
                lstSuggestions.AddItem Module.Suggestion(Niveau, i, Affichage)
                'itemdata contient le num�ro d'ordre de la suggestion dans le module
                lstSuggestions.ItemData(lstSuggestions.NewIndex) = i
                MaxItemData = i
            End If
        Next
    End If
    If Assistance And ASSISTANCE_EXISTANT And (Not objParentDansExistant Is Nothing) Then
        'ajoute les dispositions en place (donn�es filles de objParentDansExistant)
        n = objParentDansExistant.EnfantsCount
        For i = 1 To n
            lstSuggestions.AddItem objParentDansExistant.EnfantTitre(i)
            'itemdata n�gatif pour les suggestions provenant des dispositions
            'actuelles (num�ro d'ordre dans la collection)
            lstSuggestions.ItemData(lstSuggestions.NewIndex) = -i
        Next
    End If
    If lstSuggestions.ListCount > 0 Then
        'premi�re suggestion s�lectionn�e s'il y en a une
        lstSuggestions.ListIndex = maxi(0, mini(gListIndexSuggestion, lstSuggestions.ListCount - 1))
    End If
    RefreshBoutons

End Sub

Private Sub txtTitre_GotFocus()
    SelectionneZoneTexte ActiveControl, 16 * 5 + 4
End Sub

Private Sub txtTitre_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtTitre.Text = "" Then
        LigneEtat "Entrez ici le titre de l'�l�ment � ajouter au projet HACCP"
    Else
        LigneEtat "Titre de l'�l�ment"
    End If
End Sub


