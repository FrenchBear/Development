VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Module"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit

'constantes dimensionnant les tableaux du module
Const MODULE_NB_MAX_AFFICHAGES = 7
Const MODULE_NB_MAX_NIVEAUX = 10
Const MODULE_NB_MAX_NIVEAUX_CRITICITE = 3
Const MODULE_NB_MAX_QUESTIONS_CRITICITE = 8
Const MODULE_NB_MAX_DOC_SUJETS = 20

'qu'est-ce qu'un affichage ?
Private Type AffichageType
    Titre As String
    Commentaire As String
End Type

'qu'est-ce qu'un sujet de documentation
Private Type DocSujetType
    Sujet As String
    Topic As Integer
End Type

'attributs d'un module
'---------------------
    'onglet général
    Private chNom As String
    Private chTitre As String
    Private chRépertoire As String
    Private chFichierModule As String
    Private chFichierLogo As String
    Private chFichierAide As String
    'libellés des niveaux de données pour les suggestions
    Private tNiveaux(1 To MODULE_NB_MAX_NIVEAUX) As String
    'version des niveaux de données pour les arbres (un blanc permet de couper le mot en deux)
    Private tNiveauxAvecBlanc(1 To MODULE_NB_MAX_NIVEAUX) As String
    'onglet textes
    Private tAffichage(1 To MODULE_NB_MAX_AFFICHAGES) As AffichageType
    'collection de suggestions pour chaque niveau et pour les deux affichages 'Dispositions en place' et 'Arbre HACCP'
    Private tNiveauSuggestions(1 To MODULE_NB_MAX_NIVEAUX, 0 To 1) As New Suggestions
    'collection de natures
    Public Natures As New Natures
    'Questions de criticité pour les niveaux de données de criticité
    Private tQuestionsCriticité(1 To MODULE_NB_MAX_NIVEAUX_CRITICITE, 1 To MODULE_NB_MAX_QUESTIONS_CRITICITE) As String
    'flag Module Modifié
    Private iModifié As Integer
    'tableau de sujets de documentation
    Private iNbDocSujets As Integer
    Private tDocSujets(1 To MODULE_NB_MAX_DOC_SUJETS) As DocSujetType
    'erreur dans le module
    Private iErr As Long

'sections et clés du fichier INI de description d'un module
Const SECTION_MODULE_DIVERS = "Divers"
Const KEY_MODULE_LOGO = "logo"
Const KEY_MODULE_TITRE = "Titre"
Const KEY_MODULE_AIDE = "Aide"

Const MODULE_SECTION_NIVEAUX = "Niveaux"
Const KEY_MODULE_NIVEAU = "Niveau"

Const SECTION_MODULE_DOCUMENTATION_BAS = "Menu Documentation Bas"
Const KEY_MODULE_NB_SUJETS_DOC = "NbSujets"
Const KEY_MODULE_SUJET_DOC = "Sujet"
Const KEY_MODULE_SUJET_DOC_TOPIC = "Topic"
Const KEY_MODULE_FICHIER_HLP = "FichierHLP"

Const SECTION_MODULE_AFFICHAGES = "Affichages"
Const KEY_MODULE_COMMENTAIRE = "Commentaire"
Const KEY_MODULE_AFFICHAGE_TITRE = "Titre"

Const SECTION_MODULE_SUGGESTIONS = "Suggestions"
Const KEY_MODULE_SUGGESTION = "Suggestion"
Const KEY_MODULE_SUGGESTION_DESCRIPTION = "Description"
Const KEY_MODULE_NB_SUGGESTIONS = "NbSuggestions"
Const KEY_MODULE_SUGGESTION_AJOUTEE = "Ajoutée"
Const KEY_MODULE_SUGGESTION_EFFACEE = "Effacée"
Const KEY_MODULE_SUGGESTION_REMPLACEE = "Remplacée"
Const KEY_MODULE_SUGGESTION_OLD_LIBELLE = "OldLibellé"
Const KEY_MODULE_SUGGESTION_OLD_DESCRIPTION = "OldDescription"

Const SECTION_MODULE_NATURES = "Natures"
Const KEY_MODULE_NB_NATURES = "NbNatures"
Const KEY_MODULE_NATURE = "Nature"
Const KEY_MODULE_CODE_NATURE = "CodeNature"

Const SECTION_MODULE_SPECIFICITES = "Spécificités"
Const KEY_MODULE_NB_SPECIFICITES = "NbSpécificités"
Const KEY_MODULE_CODE_SPECIFICITE = "CodeSpécificité"
Const KEY_MODULE_SPECIFICITE = "Spécificité"

Const SECTION_MODULE_QUESTIONS_PERTINENCE = "QuestionsPertinence"
Const KEY_MODULE_NB_QUESTIONS_PERTINENCE = "NbQuestionsPertinence"
Const KEY_MODULE_QUESTION_PERTINENCE_ID = "IDQuestionPertinence"
Const KEY_MODULE_QUESTION_PERTINENCE = "QuestionPertinence"
Const KEY_MODULE_QUESTION_PERTINENCE_REPONSE_OUI = "QuestionPertinenceReponseOui"
Const KEY_MODULE_QUESTION_PERTINENCE_REPONSE_NON = "QuestionPertinenceReponseNon"

Const SECTION_MODULE_QUESTIONS_CRITICITE = "QuestionsCriticité"
Const KEY_MODULE_NB_NIVEAUX_CRITICITE = "NbNiveauxCriticité"
Const KEY_MODULE_NB_QUESTIONS_CRITICITE = "NbQuestionsCriticité"
Const KEY_MODULE_QUESTION_CRITICITE = "QuestionCriticité"




'changement du libellé d'un nature
'entrée:
'   ancien libellé
'   nouveau libellé
'retour:
'   nouvelle narure
Public Function RenommerNature(ByVal OldNature As String, ByVal NewNature As String) As Nature

Dim Spec As Specificites
Dim SrcNature As Nature
Dim DstNature As Nature
    
    Set DstNature = Natures.Add(NewNature, Before:=OldNature)
    If Not DstNature Is Nothing Then
        Set DstNature.Spécificités = Natures.Item(OldNature).Spécificités
        Set Natures.Item(OldNature).Spécificités = Nothing
        Natures.Delete OldNature
        Set RenommerNature = Natures.Item(NewNature)
    Else
        Set RenommerNature = Nothing
    End If
    
End Function

'change le libellé d'une spécificité
'entrée:
'   nature
'   ancienne libellé de spécificité
'   nouvelle libellé de spécificité
'retour:
'   nouvelle spécificité
Public Function RenommerSpécificité(ByVal lblNature As String, ByVal OldSpécificité As String, ByVal NewSpécificité As String) As Specificite

Dim SrcNature As Nature
Dim Spec As Specificites
Dim DstSpécificité As Specificite
    
    Set SrcNature = Natures.Item(lblNature)
    Set DstSpécificité = SrcNature.Spécificités.Add(NewSpécificité, KeyBefore:=OldSpécificité)
    If Not DstSpécificité Is Nothing Then
        Set DstSpécificité.QuestPertinences = SrcNature.Spécificités.Item(OldSpécificité).QuestPertinences
        Set SrcNature.Spécificités.Item(OldSpécificité).QuestPertinences = Nothing
        SrcNature.Spécificités.Delete OldSpécificité
        Set RenommerSpécificité = SrcNature.Spécificités.Item(NewSpécificité)
    Else
        Set RenommerSpécificité = Nothing
    End If
    
    
End Function




'renvoit le titre d'un sujet de documentation
Public Property Get DocSujetTitre(ByVal i As Integer) As String

    DocSujetTitre = tDocSujets(i).Sujet

End Property


'modifie le titre d'un sujet de documentation
Public Property Let DocSujetTitre(ByVal i As Integer, ByVal Titre As String)

    If tDocSujets(i).Sujet <> Titre Then
        tDocSujets(i).Sujet = Titre
        iModifié = True
    End If
    
End Property



'obtient le topic d'un sujet de documentation
Public Property Get DocSujetTopic(ByVal i As Integer) As Integer

    DocSujetTopic = tDocSujets(i).Topic

End Property


'modifie le topic d'un sujet de documentation
Public Property Let DocSujetTopic(ByVal i As Integer, ByVal Topic As Integer)

    If tDocSujets(i).Topic <> Topic Then
        tDocSujets(i).Topic = Topic
        iModifié = True
    End If
    
End Property



'modifie le code d'erreur
Public Property Let Erreur(ByVal Erreur As Long)

    iErr = Erreur
    
End Property

'obtient le code d'erreur
Public Property Get Erreur() As Long

    Erreur = iErr
    
End Property


'libère les objets contenus dans le module
Public Sub Free()
Attribute Free.VB_Description = "Libère les objets contenus dans l'objet module"

Dim i As Integer

    'suggestions
    For i = 1 To MODULE_NB_MAX_NIVEAUX
        Set tNiveauSuggestions(i, 0) = Nothing
        Set tNiveauSuggestions(i, 1) = Nothing
    Next
    'natures
    Set Natures = Nothing

End Sub
'dit si le module a été modifié
Public Property Get Modifié() As Integer
Attribute Modifié.VB_Description = "Indique si le module a été modifié"

    Modifié = iModifié

End Property

'restaure les suggestions du module
'entrée:
'   niveau et affichage à restaurer
Public Sub RestaureSuggestions(ByVal Niveau As Integer, ByVal Affichage As Integer)

Dim i As Integer
Dim n As Integer
Dim colSuggestions As Suggestions

    'suggestions du niveau et de l'affichage désigné en paramètre
    Set colSuggestions = tNiveauSuggestions(Niveau, Affichage)
    n = colSuggestions.Count
    For i = n To 1 Step -1
        If colSuggestions.Item(i).Effacée Then
            'chaque suggestion marquée effacée ne l'est plus
            colSuggestions.Item(i).Effacée = False
        Else
            If colSuggestions.Item(i).Ajoutée Then
                'chaque suggestion ajoutée est effacé physiquement
                colSuggestions.Delete i, True
            Else
                If colSuggestions.Item(i).Remplacée Then
                    'chaque suggestion remplacée est restaurée
                    colSuggestions.Item(i).Libellé = colSuggestions.Item(i).OldLibellé
                    colSuggestions.Item(i).Description = colSuggestions.Item(i).OldDescription
                    colSuggestions.Item(i).Remplacée = False
                End If
            End If
        End If
    Next

End Sub

'renvoit l'état effacé d'une suggestion
'entrée:
'   niveau, affichage et index de la suggestion
Public Function SuggestionEffacée(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer)
    
    SuggestionEffacée = tNiveauSuggestions(Niveau, Affichage).Item(Index).Effacée

End Function


'renvoit l'état remplacée d'une suggestion
'entrée:
'   niveau, index et affichage de la suggestion
Public Function SuggestionRemplacée(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer)
    
    SuggestionRemplacée = tNiveauSuggestions(Niveau, Affichage).Item(Index).Remplacée

End Function



'renvoit l'état ajoutée d'une suggestion
'entrée:
'   niveau, index et affichage de la suggestion
Public Function SuggestionAjoutée(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer)
    
    SuggestionAjoutée = tNiveauSuggestions(Niveau, Affichage).Item(Index).Ajoutée

End Function




'renvoit le nombre de suggestions d'un niveau et affichage
'entrée:
'   niveau et affichage
Public Function SuggestionsCount(ByVal Niveau As Integer, ByVal Affichage As Integer)
Attribute SuggestionsCount.VB_Description = "Fournit le nombre de suggestions d'un niveau de données du module"
    
    SuggestionsCount = tNiveauSuggestions(Niveau, Affichage).Count

End Function


'renvoit le nombre de niveaux de données du module
Public Property Get NiveauxCount() As Integer

    NiveauxCount = MODULE_NB_MAX_NIVEAUX
    
End Property

'renvoit le nombre maximum de questions dans un questionnaire de criticité
Public Property Get QuestionsCriticitéCount() As Integer

    QuestionsCriticitéCount = MODULE_NB_MAX_QUESTIONS_CRITICITE

End Property


'renvoit le nombre maximum de niveaux pour les questionnaires de criticité
Public Property Get NiveauxCriticitéCount() As Integer

    NiveauxCriticitéCount = MODULE_NB_MAX_NIVEAUX_CRITICITE

End Property


'sauvegarde un module
'entrée:
'   attribut chFichierModule ok
Public Sub Save()
Attribute Save.VB_Description = "Sauve le module sur disque"

Dim i As Integer
Dim n As Integer
Dim j As Integer
Dim k As Integer
Dim FichierSuggestions As String
Dim FichierQuestions As String

    On Error GoTo errSave
    If ExisteFichier(chFichierModule) Then
        'Kill chFichierModule
    End If

    'section divers
    SetModule SECTION_MODULE_DIVERS, KEY_MODULE_TITRE, chTitre
    SetModule SECTION_MODULE_DIVERS, KEY_MODULE_LOGO, chFichierLogo
    SetModule SECTION_MODULE_DIVERS, KEY_MODULE_AIDE, chFichierAide

    'Niveaux de données
    For i = 1 To MODULE_NB_MAX_NIVEAUX
        SetModule MODULE_SECTION_NIVEAUX, KEY_MODULE_NIVEAU & i, tNiveaux(i)
    Next

    'textes abrégés
    For i = 1 To MODULE_NB_MAX_AFFICHAGES
        SetModule SECTION_MODULE_AFFICHAGES, KEY_MODULE_AFFICHAGE_TITRE & i, tAffichage(i).Titre
        SetModule SECTION_MODULE_AFFICHAGES, KEY_MODULE_COMMENTAIRE & i, tAffichage(i).Commentaire
    Next

    'suggestions
    FichierSuggestions = InsereChaineSep(UCase$(chFichierModule), "." & EXTENSION_MODULE, "." & EXTENSION_SUGGESTIONS)
    For i = 1 To MODULE_NB_MAX_NIVEAUX
        For k = 0 To 1
            SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_NB_SUGGESTIONS & i & "," & k, tNiveauSuggestions(i, k).Count, FichierSuggestions
            For j = 1 To tNiveauSuggestions(i, k).Count
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).Libellé, FichierSuggestions
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_DESCRIPTION & i & "," & j & "," & k, CodeChaineCrLF(tNiveauSuggestions(i, k).Item(j).Description), FichierSuggestions
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_AJOUTEE & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).Ajoutée, FichierSuggestions
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_EFFACEE & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).Effacée, FichierSuggestions
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_REMPLACEE & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).Remplacée, FichierSuggestions
                If tNiveauSuggestions(i, k).Item(j).Remplacée Then
                    SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_OLD_DESCRIPTION & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).OldLibellé, FichierSuggestions
                    SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_OLD_DESCRIPTION & i & "," & j & "," & k, CodeChaineCrLF(tNiveauSuggestions(i, k).Item(j).OldDescription), FichierSuggestions
                End If
            Next
        Next
    Next
   
    'fichier contenant les natures, spécificités et questions pertinence et criticité
    FichierQuestions = InsereChaineSep(UCase$(chFichierModule), "." & EXTENSION_MODULE, "." & EXTENSION_QUESTIONS)

    'Natures, spécificités et questions de pertinence des dangers
    For i = 1 To Natures.Count
        Dim Nature As Nature
        Set Nature = Natures.Item(i)
        SetFichierIni SECTION_MODULE_NATURES, KEY_MODULE_NATURE & i, Nature.Libellé, FichierQuestions
        For j = 1 To Natures.Item(i).Spécificités.Count
            Dim Spécificité As Specificite
            Set Spécificité = Natures.Item(i).Spécificités.Item(j)
            SetFichierIni SECTION_MODULE_SPECIFICITES, KEY_MODULE_SPECIFICITE & i & "," & j, Spécificité.Libellé, FichierQuestions
            n = Spécificité.QuestPertinences.Count
            For k = 1 To n
                SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_ID & i & "," & j & "," & k, Spécificité.QuestPertinences.Item(k).id, FichierQuestions
                SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE & i & "," & j & "," & k, Spécificité.QuestPertinences.Item(k).Question, FichierQuestions
                SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_REPONSE_OUI & i & "," & j & "," & k, Spécificité.QuestPertinences.Item(k).RéponseOui, FichierQuestions
                SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_REPONSE_NON & i & "," & j & "," & k, Spécificité.QuestPertinences.Item(k).RéponseNon, FichierQuestions
            Next
            SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_NB_QUESTIONS_PERTINENCE & i & "," & j, n, FichierQuestions
        Next
        SetFichierIni SECTION_MODULE_SPECIFICITES, KEY_MODULE_NB_SPECIFICITES & i, Natures.Item(i).Spécificités.Count, FichierQuestions
    Next
    SetFichierIni SECTION_MODULE_NATURES, KEY_MODULE_NB_NATURES, Natures.Count, FichierQuestions
    
    'Questions de criticité
    SetFichierIni SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_NB_NIVEAUX_CRITICITE, MODULE_NB_MAX_NIVEAUX_CRITICITE, FichierQuestions
    SetFichierIni SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_NB_QUESTIONS_CRITICITE, MODULE_NB_MAX_QUESTIONS_CRITICITE, FichierQuestions
    For i = 1 To MODULE_NB_MAX_NIVEAUX_CRITICITE
        For j = 1 To MODULE_NB_MAX_QUESTIONS_CRITICITE
            SetFichierIni SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_QUESTION_CRITICITE & i & "," & j, tQuestionsCriticité(i, j), FichierQuestions
        Next
    Next
    
    'lecture des sujets de documentation
    SetModule SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_NB_SUJETS_DOC, iNbDocSujets
    n = iNbDocSujets
    For i = 1 To n
        SetModule SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_SUJET_DOC & i, tDocSujets(i).Sujet
        SetModule SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_SUJET_DOC_TOPIC & i, tDocSujets(i).Topic
    Next
    
    iModifié = False
   
finSave:

    Exit Sub
    
errSave:
    iErr = vbObjectError + 32001
    Resume finSave
       
End Sub

'renvoit le nombre maximum d'affichages HACCP
Public Property Get AffichagesCount() As Integer
Attribute AffichagesCount.VB_Description = "Fournit le nombre d'affichages du module"

    AffichagesCount = MODULE_NB_MAX_AFFICHAGES

End Property

'charge un module
'entrée:
'   répertoire et nom du module
Public Sub Load(ByVal RépertoireModule As String, ByVal Nom As String)
Attribute Load.VB_Description = "Charge un module depuis le disque"

Dim i As Integer
Dim n As Integer
Dim j As Integer
Dim m As Integer
Dim k As Integer
Dim FichierSuggestions As String
Dim FichierQuestions As String

    'initialisation du module
    chFichierModule = RépertoireModule & "\" & FICHIER_MODULE_INI
    chTitre = GetModule(SECTION_MODULE_DIVERS, KEY_MODULE_TITRE)
    chNom = Nom
    chFichierLogo = GetModule(SECTION_MODULE_DIVERS, KEY_MODULE_LOGO)
    chFichierAide = GetModule(SECTION_MODULE_DIVERS, KEY_MODULE_AIDE)
    chRépertoire = RépertoireModule

    'lecture des niveaux de données
    For i = 1 To MODULE_NB_MAX_NIVEAUX
        tNiveaux(i) = InsereChaineSep(GetModule(MODULE_SECTION_NIVEAUX, KEY_MODULE_NIVEAU & i), "~", "")
        tNiveauxAvecBlanc(i) = InsereChaineSep(GetModule(MODULE_SECTION_NIVEAUX, KEY_MODULE_NIVEAU & i), "~", " ")
    Next

    'lecture des textes
    For i = 1 To MODULE_NB_MAX_AFFICHAGES
        tAffichage(i).Titre = GetModule(SECTION_MODULE_AFFICHAGES, KEY_MODULE_AFFICHAGE_TITRE & i)
        tAffichage(i).Commentaire = GetModule(SECTION_MODULE_AFFICHAGES, KEY_MODULE_COMMENTAIRE & i)
    Next

    'lecture des suggestions
    FichierSuggestions = InsereChaineSep(UCase$(chFichierModule), "." & EXTENSION_MODULE, "." & EXTENSION_SUGGESTIONS)
    For i = 1 To MODULE_NB_MAX_NIVEAUX
        For k = 0 To 1
            n = Val(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_NB_SUGGESTIONS & i & "," & k, FichierSuggestions))
            For j = 1 To n
                Dim Effacée As Integer
                Dim Ajoutée As Integer
                Dim Remplacée As Integer
                Dim chDescription As String
                Ajoutée = Val(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_AJOUTEE & i & "," & j & "," & k, FichierSuggestions))
                Effacée = Val(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_EFFACEE & i & "," & j & "," & k, FichierSuggestions))
                Remplacée = Val(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_REMPLACEE & i & "," & j & "," & k, FichierSuggestions))
                chDescription = RestoreChaineCrLF(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_DESCRIPTION & i & "," & j & "," & k, FichierSuggestions))
                tNiveauSuggestions(i, k).Add GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION & i & "," & j & "," & k, FichierSuggestions), chDescription, j, Ajoutée, Effacée, Remplacée
                If Remplacée Then
                    tNiveauSuggestions(i, k).Item(j).OldLibellé = GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_OLD_LIBELLE & i & "," & j & "," & k, FichierSuggestions)
                    tNiveauSuggestions(i, k).Item(j).OldDescription = RestoreChaineCrLF(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_OLD_DESCRIPTION & i & "," & j & "," & k, FichierSuggestions))
                End If
            Next
        Next
    Next
    
    'fichier contenant les natures, spécificités et questions pertinence et criticité
    FichierQuestions = InsereChaineSep(UCase$(chFichierModule), "." & EXTENSION_MODULE, "." & EXTENSION_QUESTIONS)
    
    'lecture des natures, spécificité et questionnaire pertinence de danger
    n = Val(GetFichierIni(SECTION_MODULE_NATURES, KEY_MODULE_NB_NATURES, FichierQuestions))
    For i = 1 To n
        'ajoute la nature
        Dim LibelléNature As String
        Dim Nature As Nature
        LibelléNature = GetFichierIni(SECTION_MODULE_NATURES, KEY_MODULE_NATURE & i, FichierQuestions)
        Natures.Add LibelléNature
        Set Nature = Natures.Item(LibelléNature)
        'lecture des spécificités
        m = Val(GetFichierIni(SECTION_MODULE_SPECIFICITES, KEY_MODULE_NB_SPECIFICITES & i, FichierQuestions))
        For j = 1 To m
            'ajoute une spécificité à un nature
            Dim LibelléSpécificité As String
            Dim Spécificité As Specificite
            LibelléSpécificité = GetFichierIni(SECTION_MODULE_SPECIFICITES, KEY_MODULE_SPECIFICITE & i & "," & j, FichierQuestions)
            Nature.Spécificités.Add LibelléSpécificité
            Set Spécificité = Nature.Spécificités.Item(LibelléSpécificité)
            'lecture des questions de pertinence
            Dim p As Integer
            p = Val(GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_NB_QUESTIONS_PERTINENCE & i & "," & j, FichierQuestions))
            For k = 1 To p
                'Ajoute une question pertinence à la spécificité
                Dim id As String
                Dim Question As String
                Dim RéponseOui As String
                Dim RéponseNon As String
                id = GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_ID & i & "," & j & "," & k, FichierQuestions)
                Question = GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE & i & "," & j & "," & k, FichierQuestions)
                RéponseOui = GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_REPONSE_OUI & i & "," & j & "," & k, FichierQuestions)
                RéponseNon = GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_REPONSE_NON & i & "," & j & "," & k, FichierQuestions)
                Spécificité.QuestPertinences.Add id, Question, RéponseOui, RéponseNon
            Next
        Next
    Next
        
    'lecture des questions de criticité
    n = Val(GetFichierIni(SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_NB_NIVEAUX_CRITICITE, FichierQuestions))
    m = Val(GetFichierIni(SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_NB_QUESTIONS_CRITICITE, FichierQuestions))
    For i = 1 To n
        For j = 1 To m
            tQuestionsCriticité(i, j) = GetFichierIni(SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_QUESTION_CRITICITE & i & "," & j, FichierQuestions)
        Next
    Next
        
    'lecture des sujets de documentation
    n = Val(GetModule(SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_NB_SUJETS_DOC))
    iNbDocSujets = n
    For i = 1 To n
        tDocSujets(i).Sujet = GetModule(SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_SUJET_DOC & i)
        tDocSujets(i).Topic = Val(GetModule(SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_SUJET_DOC_TOPIC & i))
    Next
    
    iModifié = False
    
End Sub


'insertion d'une chaine dans une autre
'entrée:
'   chaine à modifier
'   chaine insérée
'   chaine marquant l'emplacement
'retour:
'   chaine modifiée
Private Function InsereChaineSep(chaine1 As String, ByVal Sep As String, chaine2 As String) As String

Dim pos1 As Integer

    pos1 = InStr(chaine1, Sep)
    If pos1 Then
        InsereChaineSep = Left$(chaine1, pos1 - 1) + chaine2 + right$(chaine1, Len(chaine1) - pos1 - Len(Sep) + 1)
    Else
        InsereChaineSep = chaine1
    End If

End Function


'remplace dans une chaine tous les | par CrLF
'entrée:
'   chaine à modifier
Private Function RestoreChaineCrLF(ch As String)

    While InStr(ch, "|")
        ch = InsereChaineSep(ch, "|", vbCrLf)
    Wend
    
    RestoreChaineCrLF = ch
    
End Function





'remplace dans une chaine tous les CrLF par |
'entrée:
'   chaine à modifier
Private Function CodeChaineCrLF(ch As String)

    While InStr(ch, vbCrLf)
        ch = InsereChaineSep(ch, vbCrLf, "|")
    Wend
    
    CodeChaineCrLF = ch
    
End Function



'renvoit le nombre de sujets de documentation
Public Property Get DocSujetCount() As Integer

    DocSujetCount = iNbDocSujets

End Property
'modifie le nombre de sujets de documentation
Public Property Let DocSujetCount(ByVal n As Integer)

    If iNbDocSujets <> n Then
        iNbDocSujets = n
        iModifié = True
    End If

End Property

'renvoit le nombre maximum de sujets de documentation
Public Function DocSujetMax() As Integer

    DocSujetMax = MODULE_NB_MAX_DOC_SUJETS

End Function

'renvoit le titre d'un module à partir de son fichier de description
Public Function LoadTitre(ByVal FichierModule As String) As String

    LoadTitre = GetFichierIni(SECTION_MODULE_DIVERS, KEY_MODULE_TITRE, FichierModule)

End Function
'renvoit le nom du fichier logo d'un module à partir de son fichier de description
Public Function LoadLogo(ByVal FichierModule As String) As String

    LoadLogo = GetFichierIni(SECTION_MODULE_DIVERS, KEY_MODULE_LOGO, FichierModule)

End Function

'raz du flag module modifié
Public Sub ModifieNon()

    iModifié = False
    
End Sub

'lit une entrée dans le fichier .MUL
'entrée:
'   section et clé à lire
Private Function GetModule(Section As String, Cle As String) As String
Attribute GetModule.VB_Description = "Lit une entrée du fichier de description du module"

    GetModule = GetFichierIni(Section, Cle, chFichierModule)

End Function

'lit une entrée dans un .INI
'entrée:
'   section, clé et fichier à lire
Private Function GetFichierIni(ByVal Section As String, ByVal Cle As String, ByVal Fichier As String) As String

Dim chaine As String * 500
Dim cr As Integer

    cr = GetPrivateProfileString(Section, Cle, "", chaine, 500, Fichier)
    If cr = 0 Then
        GetFichierIni = ""
    Else
        GetFichierIni = Left$(chaine, cr)
    End If

End Function



'écrit une entrée dans un fichier .INI
Private Sub SetFichierIni(ByVal Section As String, ByVal key As String, ByVal valeur As String, ByVal chFichier As String)

Dim cr As Integer

    cr = WritePrivateProfileString(Section, key, valeur, chFichier)

End Sub


'écrit une entrée dans un fichier INI
'entrée:
'   section, clé et valeur
Private Sub SetModule(ByVal Section As String, ByVal key As String, ByVal valeur As String)
Attribute SetModule.VB_Description = "Modifie une entrée du fichier de description du module"

Dim cr As Integer

    cr = WritePrivateProfileString(Section, key, valeur, chFichierModule)
    If cr = 0 Then
        Err.Raise Number:=vbObjectError + 32000, Description:="Impossible d'écrire dans le module"
    End If

End Sub


'efface une suggestion
'entrée:
'   niveau, index et affichage de la suggestion
Public Sub DeleteSuggestion(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer, ByVal Ajoutée As Integer)
    
    tNiveauSuggestions(Niveau, Affichage).Delete Index, Ajoutée
    iModifié = True
    
End Sub


'ajoute une suggestion
'entrée:
'   niveau, libellé, description, index, affichage et flags ajoutée, modifiée, effacée de la suggestion
Public Sub AddSuggestion(ByVal Niveau As Integer, ByVal Libellé As String, ByVal Description As String, ByVal Index As Integer, ByVal Affichage As Integer, ByVal Ajoutée As Integer, ByVal Effacée As Integer, ByVal Remplacée As Integer)
Attribute AddSuggestion.VB_Description = "Ajoute une suggestion au module pour un niveau de données"
    
    tNiveauSuggestions(Niveau, Affichage).Add Libellé, Description, Index, Ajoutée, Effacée, Remplacée
    iModifié = True
    
End Sub


'modifie une suggestion
'entrée:
'   niveau, libellé, description, index, affichage et flags ajoutée, modifiée, effacée de la suggestion
Public Sub RemplacerSuggestion(ByVal Niveau As Integer, ByVal Libellé As String, ByVal Description As String, ByVal Index As Integer, ByVal Affichage As Integer, ByVal Ajoutée As Integer, ByVal Effacée As Integer, ByVal Remplacée As Integer)
    
    tNiveauSuggestions(Niveau, Affichage).Replace Libellé, Description, Index, Ajoutée, Effacée, Remplacée
    iModifié = True

End Sub

'modifie le fichier d'aide du module
'entrée:
'   nom du fichier d'aide
Public Property Let FichierAide(ByVal Fichier As String)
Attribute FichierAide.VB_Description = "Fichier d'aide spécifique du module"
    
    If chFichierAide <> Fichier Then
        chFichierAide = Fichier
        iModifié = True
    End If
    
End Property


'renvoit le fichier d'aide du module
Public Property Get FichierAide() As String
    
    FichierAide = chFichierAide

End Property



'renvoit le fichier de logo du module
'entrée:
'   nom du fichier logo
Public Property Let FichierLogo(ByVal Fichier As String)
    
    If chFichierLogo <> Fichier Then
        chFichierLogo = Fichier
        iModifié = True
    End If
    
End Property


'modifie le fichier de logo du module
Public Property Get FichierLogo() As String
    
    FichierLogo = chFichierLogo

End Property


'modifie le nom du module
'entrée:
'   nom
Public Property Let Nom(ByVal Nom As String)
Attribute Nom.VB_Description = "Nom du module (8 caractères)"
    
    If chNom <> Nom Then
        chNom = Nom
        iModifié = True
    End If

End Property


'renvoit le nom du module
Public Property Get Nom() As String
    
    Nom = chNom

End Property





'modifie une question de criticité du module
'entrée:
'   niveau, numéro de question et question à modifié
Public Sub SetQuestionCriticité(ByVal Niveau As Integer, ByVal NuméroQuestion As Integer, ByVal Question As String)

    If Niveau >= 1 And Niveau <= MODULE_NB_MAX_NIVEAUX_CRITICITE And NuméroQuestion >= 1 And NuméroQuestion <= MODULE_NB_MAX_QUESTIONS_CRITICITE Then
        tQuestionsCriticité(Niveau, NuméroQuestion) = Question
        iModifié = True
    Else
        MsgBox "erreur dans setQuestionCriticité"
    End If
    
End Sub


'modifie un affichage
'entrée:
'   numéro, titre et commentaire de l'affichage
Public Sub SetAffichage(ByVal Affichage As Integer, ByVal Titre As String, ByVal Commentaire As String)
Attribute SetAffichage.VB_Description = "Modifie les éléments d'un type d'affichage du module"

    If Affichage >= 1 And Affichage <= MODULE_NB_MAX_AFFICHAGES Then
        tAffichage(Affichage).Titre = Titre
        tAffichage(Affichage).Commentaire = Commentaire
        iModifié = True
    Else
        MsgBox "erreur dans setaffichage"
    End If
    
End Sub


'change le libellé d'un niveau de donnée
'entrée:
'   numéro de niveau et libellé
Public Sub SetNiveau(ByVal NuméroNiveau As Integer, ByVal Libellé As String)

    If NuméroNiveau >= 1 And NuméroNiveau <= MODULE_NB_MAX_NIVEAUX Then
        tNiveaux(NuméroNiveau) = Libellé
        iModifié = True
    Else
        MsgBox "erreur dans SetNiveau"
    End If
    
End Sub



'renvoit le titre d'un affichage
'entrée:
'   affichage
Public Function AffichageTitre(ByVal Affichage As Integer) As String
Attribute AffichageTitre.VB_Description = "Fournit le titre d'un type d'affichage"

    AffichageTitre = tAffichage(Affichage).Titre

End Function
'renvoit le commentaire d'un affichage
'entrée:
'   affichage
Public Function AffichageCommentaire(ByVal Affichage As Integer) As String
Attribute AffichageCommentaire.VB_Description = "Fournit le commentaire associé à un type d'affichage"

    AffichageCommentaire = tAffichage(Affichage).Commentaire

End Function

'renvoit une question de criticité
'entrée:
'   niveau et numéro de question
Public Function QuestionCriticité(ByVal Niveau As Integer, ByVal NuméroQuestion As Integer) As String

    If Niveau >= 1 And Niveau <= MODULE_NB_MAX_NIVEAUX_CRITICITE And NuméroQuestion >= 1 And NuméroQuestion <= MODULE_NB_MAX_QUESTIONS_CRITICITE Then
        QuestionCriticité = tQuestionsCriticité(Niveau, NuméroQuestion)
    Else
        MsgBox "erreur dans QuestionCriticité()"
        QuestionCriticité = ""
    End If
    
End Function


'renvoit le libellé d'un niveau de donnée
'entrée:
'   numéro de niveau
Public Function Niveau(ByVal NuméroNiveau As Integer) As String

    Niveau = tNiveaux(NuméroNiveau)

End Function


'renvoit le libellé avec blanc d'un niveau de donnée
'entrée:
'   numéro de niveau
Public Function NiveauAvecBlanc(ByVal NuméroNiveau As Integer) As String

    NiveauAvecBlanc = tNiveauxAvecBlanc(NuméroNiveau)

End Function



'renvoit le libellé d'une suggestion
'entrée:
'   niveau, index et affichage de la suggestion
Public Property Get Suggestion(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer) As String
Attribute Suggestion.VB_Description = "Suggestions d'un niveau de données du module"
    
    Suggestion = tNiveauSuggestions(Niveau, Affichage).Item(Index).Libellé

End Property

'renvoit la description d'une suggestion
'entrée:
'   niveau, index et affichage de la suggestion
Public Property Get SuggestionDescription(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer) As String
    
    SuggestionDescription = tNiveauSuggestions(Niveau, Affichage).Item(Index).Description

End Property

'modifie le libellé d'une suggestion
'entrée:
'   niveau, index, affichage et libellé de la suggestion
Public Property Let Suggestion(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer, ByVal Libellé As String)
    
    If tNiveauSuggestions(Niveau, Affichage).Item(Index).Libellé <> Libellé Then
        tNiveauSuggestions(Niveau, Affichage).Item(Index).Libellé = Libellé
        iModifié = True
    End If

End Property


'efface toutes les suggestions d'un niveau/affichage donné
'entrée:
'   niveau, affichage
'   flag AppelDepuisHacMod indiquant l'utilisation depuis HACMOD (l'effacement n'est pas
'   le même depuis HACMOD ou HACCP)
Public Sub SuggestionsClear(ByVal Niveau As Integer, ByVal Affichage As Integer, ByVal AppelDepuisHacMod As Integer)
Attribute SuggestionsClear.VB_Description = "Efface les suggestions d'un niveau de données"

    While tNiveauSuggestions(Niveau, Affichage).Count
         tNiveauSuggestions(Niveau, Affichage).Delete 1, AppelDepuisHacMod
    Wend
    iModifié = True

End Sub

'modifie le titre du module
'entrée:
'   titre
Public Property Let Titre(ByVal Titre As String)
Attribute Titre.VB_Description = "Titre long du module"
    
    If chTitre <> Titre Then
        chTitre = Titre
        iModifié = True
    End If

End Property


'modifie le répertoire du module
'entrée:
'   répertoire
Public Property Let Répertoire(ByVal Répertoire As String)
Attribute Répertoire.VB_Description = "Chemin d'accès au répertoire du module"
    
    If chRépertoire <> Répertoire Then
        chRépertoire = Répertoire
        iModifié = True
    End If

End Property



'modifie le nom de fichier du module
'entrée:
'   fichier
Public Property Let FichierModule(ByVal Fichier As String)
Attribute FichierModule.VB_Description = "Nom complet du fichier de description du module (format INI)"
    
    If chFichierModule <> Fichier Then
        chFichierModule = Fichier
        iModifié = True
    End If

End Property




'marque le module modifié
Public Sub Salit()
Attribute Salit.VB_Description = "Marque le module comme modifié"
    
    iModifié = True

End Sub





'renvoit le titre du module
Public Property Get Titre() As String
    
    Titre = chTitre

End Property




'renvoit le nom du fichier du module
Public Property Get FichierModule() As String
    
    FichierModule = chFichierModule

End Property




'renvoit le répertoire du module
Public Property Get Répertoire() As String
    
    Répertoire = chRépertoire

End Property







'libère tous les objets contenus dans le module
Private Sub Class_Terminate()
    
    Free

End Sub


