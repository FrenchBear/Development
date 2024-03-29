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
    'onglet g�n�ral
    Private chNom As String
    Private chTitre As String
    Private chR�pertoire As String
    Private chFichierModule As String
    Private chFichierLogo As String
    Private chFichierAide As String
    'libell�s des niveaux de donn�es pour les suggestions
    Private tNiveaux(1 To MODULE_NB_MAX_NIVEAUX) As String
    'version des niveaux de donn�es pour les arbres (un blanc permet de couper le mot en deux)
    Private tNiveauxAvecBlanc(1 To MODULE_NB_MAX_NIVEAUX) As String
    'onglet textes
    Private tAffichage(1 To MODULE_NB_MAX_AFFICHAGES) As AffichageType
    'collection de suggestions pour chaque niveau et pour les deux affichages 'Dispositions en place' et 'Arbre HACCP'
    Private tNiveauSuggestions(1 To MODULE_NB_MAX_NIVEAUX, 0 To 1) As New Suggestions
    'collection de natures
    Public Natures As New Natures
    'Questions de criticit� pour les niveaux de donn�es de criticit�
    Private tQuestionsCriticit�(1 To MODULE_NB_MAX_NIVEAUX_CRITICITE, 1 To MODULE_NB_MAX_QUESTIONS_CRITICITE) As String
    'flag Module Modifi�
    Private iModifi� As Integer
    'tableau de sujets de documentation
    Private iNbDocSujets As Integer
    Private tDocSujets(1 To MODULE_NB_MAX_DOC_SUJETS) As DocSujetType
    'erreur dans le module
    Private iErr As Long

'sections et cl�s du fichier INI de description d'un module
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
Const KEY_MODULE_SUGGESTION_AJOUTEE = "Ajout�e"
Const KEY_MODULE_SUGGESTION_EFFACEE = "Effac�e"
Const KEY_MODULE_SUGGESTION_REMPLACEE = "Remplac�e"
Const KEY_MODULE_SUGGESTION_OLD_LIBELLE = "OldLibell�"
Const KEY_MODULE_SUGGESTION_OLD_DESCRIPTION = "OldDescription"

Const SECTION_MODULE_NATURES = "Natures"
Const KEY_MODULE_NB_NATURES = "NbNatures"
Const KEY_MODULE_NATURE = "Nature"
Const KEY_MODULE_CODE_NATURE = "CodeNature"

Const SECTION_MODULE_SPECIFICITES = "Sp�cificit�s"
Const KEY_MODULE_NB_SPECIFICITES = "NbSp�cificit�s"
Const KEY_MODULE_CODE_SPECIFICITE = "CodeSp�cificit�"
Const KEY_MODULE_SPECIFICITE = "Sp�cificit�"

Const SECTION_MODULE_QUESTIONS_PERTINENCE = "QuestionsPertinence"
Const KEY_MODULE_NB_QUESTIONS_PERTINENCE = "NbQuestionsPertinence"
Const KEY_MODULE_QUESTION_PERTINENCE_ID = "IDQuestionPertinence"
Const KEY_MODULE_QUESTION_PERTINENCE = "QuestionPertinence"
Const KEY_MODULE_QUESTION_PERTINENCE_REPONSE_OUI = "QuestionPertinenceReponseOui"
Const KEY_MODULE_QUESTION_PERTINENCE_REPONSE_NON = "QuestionPertinenceReponseNon"

Const SECTION_MODULE_QUESTIONS_CRITICITE = "QuestionsCriticit�"
Const KEY_MODULE_NB_NIVEAUX_CRITICITE = "NbNiveauxCriticit�"
Const KEY_MODULE_NB_QUESTIONS_CRITICITE = "NbQuestionsCriticit�"
Const KEY_MODULE_QUESTION_CRITICITE = "QuestionCriticit�"




'changement du libell� d'un nature
'entr�e:
'   ancien libell�
'   nouveau libell�
'retour:
'   nouvelle narure
Public Function RenommerNature(ByVal OldNature As String, ByVal NewNature As String) As Nature

Dim Spec As Specificites
Dim SrcNature As Nature
Dim DstNature As Nature
    
    Set DstNature = Natures.Add(NewNature, Before:=OldNature)
    If Not DstNature Is Nothing Then
        Set DstNature.Sp�cificit�s = Natures.Item(OldNature).Sp�cificit�s
        Set Natures.Item(OldNature).Sp�cificit�s = Nothing
        Natures.Delete OldNature
        Set RenommerNature = Natures.Item(NewNature)
    Else
        Set RenommerNature = Nothing
    End If
    
End Function

'change le libell� d'une sp�cificit�
'entr�e:
'   nature
'   ancienne libell� de sp�cificit�
'   nouvelle libell� de sp�cificit�
'retour:
'   nouvelle sp�cificit�
Public Function RenommerSp�cificit�(ByVal lblNature As String, ByVal OldSp�cificit� As String, ByVal NewSp�cificit� As String) As Specificite

Dim SrcNature As Nature
Dim Spec As Specificites
Dim DstSp�cificit� As Specificite
    
    Set SrcNature = Natures.Item(lblNature)
    Set DstSp�cificit� = SrcNature.Sp�cificit�s.Add(NewSp�cificit�, KeyBefore:=OldSp�cificit�)
    If Not DstSp�cificit� Is Nothing Then
        Set DstSp�cificit�.QuestPertinences = SrcNature.Sp�cificit�s.Item(OldSp�cificit�).QuestPertinences
        Set SrcNature.Sp�cificit�s.Item(OldSp�cificit�).QuestPertinences = Nothing
        SrcNature.Sp�cificit�s.Delete OldSp�cificit�
        Set RenommerSp�cificit� = SrcNature.Sp�cificit�s.Item(NewSp�cificit�)
    Else
        Set RenommerSp�cificit� = Nothing
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
        iModifi� = True
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
        iModifi� = True
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


'lib�re les objets contenus dans le module
Public Sub Free()
Attribute Free.VB_Description = "Lib�re les objets contenus dans l'objet module"

Dim i As Integer

    'suggestions
    For i = 1 To MODULE_NB_MAX_NIVEAUX
        Set tNiveauSuggestions(i, 0) = Nothing
        Set tNiveauSuggestions(i, 1) = Nothing
    Next
    'natures
    Set Natures = Nothing

End Sub
'dit si le module a �t� modifi�
Public Property Get Modifi�() As Integer
Attribute Modifi�.VB_Description = "Indique si le module a �t� modifi�"

    Modifi� = iModifi�

End Property

'restaure les suggestions du module
'entr�e:
'   niveau et affichage � restaurer
Public Sub RestaureSuggestions(ByVal Niveau As Integer, ByVal Affichage As Integer)

Dim i As Integer
Dim n As Integer
Dim colSuggestions As Suggestions

    'suggestions du niveau et de l'affichage d�sign� en param�tre
    Set colSuggestions = tNiveauSuggestions(Niveau, Affichage)
    n = colSuggestions.Count
    For i = n To 1 Step -1
        If colSuggestions.Item(i).Effac�e Then
            'chaque suggestion marqu�e effac�e ne l'est plus
            colSuggestions.Item(i).Effac�e = False
        Else
            If colSuggestions.Item(i).Ajout�e Then
                'chaque suggestion ajout�e est effac� physiquement
                colSuggestions.Delete i, True
            Else
                If colSuggestions.Item(i).Remplac�e Then
                    'chaque suggestion remplac�e est restaur�e
                    colSuggestions.Item(i).Libell� = colSuggestions.Item(i).OldLibell�
                    colSuggestions.Item(i).Description = colSuggestions.Item(i).OldDescription
                    colSuggestions.Item(i).Remplac�e = False
                End If
            End If
        End If
    Next

End Sub

'renvoit l'�tat effac� d'une suggestion
'entr�e:
'   niveau, affichage et index de la suggestion
Public Function SuggestionEffac�e(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer)
    
    SuggestionEffac�e = tNiveauSuggestions(Niveau, Affichage).Item(Index).Effac�e

End Function


'renvoit l'�tat remplac�e d'une suggestion
'entr�e:
'   niveau, index et affichage de la suggestion
Public Function SuggestionRemplac�e(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer)
    
    SuggestionRemplac�e = tNiveauSuggestions(Niveau, Affichage).Item(Index).Remplac�e

End Function



'renvoit l'�tat ajout�e d'une suggestion
'entr�e:
'   niveau, index et affichage de la suggestion
Public Function SuggestionAjout�e(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer)
    
    SuggestionAjout�e = tNiveauSuggestions(Niveau, Affichage).Item(Index).Ajout�e

End Function




'renvoit le nombre de suggestions d'un niveau et affichage
'entr�e:
'   niveau et affichage
Public Function SuggestionsCount(ByVal Niveau As Integer, ByVal Affichage As Integer)
Attribute SuggestionsCount.VB_Description = "Fournit le nombre de suggestions d'un niveau de donn�es du module"
    
    SuggestionsCount = tNiveauSuggestions(Niveau, Affichage).Count

End Function


'renvoit le nombre de niveaux de donn�es du module
Public Property Get NiveauxCount() As Integer

    NiveauxCount = MODULE_NB_MAX_NIVEAUX
    
End Property

'renvoit le nombre maximum de questions dans un questionnaire de criticit�
Public Property Get QuestionsCriticit�Count() As Integer

    QuestionsCriticit�Count = MODULE_NB_MAX_QUESTIONS_CRITICITE

End Property


'renvoit le nombre maximum de niveaux pour les questionnaires de criticit�
Public Property Get NiveauxCriticit�Count() As Integer

    NiveauxCriticit�Count = MODULE_NB_MAX_NIVEAUX_CRITICITE

End Property


'sauvegarde un module
'entr�e:
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

    'Niveaux de donn�es
    For i = 1 To MODULE_NB_MAX_NIVEAUX
        SetModule MODULE_SECTION_NIVEAUX, KEY_MODULE_NIVEAU & i, tNiveaux(i)
    Next

    'textes abr�g�s
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
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).Libell�, FichierSuggestions
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_DESCRIPTION & i & "," & j & "," & k, CodeChaineCrLF(tNiveauSuggestions(i, k).Item(j).Description), FichierSuggestions
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_AJOUTEE & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).Ajout�e, FichierSuggestions
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_EFFACEE & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).Effac�e, FichierSuggestions
                SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_REMPLACEE & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).Remplac�e, FichierSuggestions
                If tNiveauSuggestions(i, k).Item(j).Remplac�e Then
                    SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_OLD_DESCRIPTION & i & "," & j & "," & k, tNiveauSuggestions(i, k).Item(j).OldLibell�, FichierSuggestions
                    SetFichierIni SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_OLD_DESCRIPTION & i & "," & j & "," & k, CodeChaineCrLF(tNiveauSuggestions(i, k).Item(j).OldDescription), FichierSuggestions
                End If
            Next
        Next
    Next
   
    'fichier contenant les natures, sp�cificit�s et questions pertinence et criticit�
    FichierQuestions = InsereChaineSep(UCase$(chFichierModule), "." & EXTENSION_MODULE, "." & EXTENSION_QUESTIONS)

    'Natures, sp�cificit�s et questions de pertinence des dangers
    For i = 1 To Natures.Count
        Dim Nature As Nature
        Set Nature = Natures.Item(i)
        SetFichierIni SECTION_MODULE_NATURES, KEY_MODULE_NATURE & i, Nature.Libell�, FichierQuestions
        For j = 1 To Natures.Item(i).Sp�cificit�s.Count
            Dim Sp�cificit� As Specificite
            Set Sp�cificit� = Natures.Item(i).Sp�cificit�s.Item(j)
            SetFichierIni SECTION_MODULE_SPECIFICITES, KEY_MODULE_SPECIFICITE & i & "," & j, Sp�cificit�.Libell�, FichierQuestions
            n = Sp�cificit�.QuestPertinences.Count
            For k = 1 To n
                SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_ID & i & "," & j & "," & k, Sp�cificit�.QuestPertinences.Item(k).id, FichierQuestions
                SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE & i & "," & j & "," & k, Sp�cificit�.QuestPertinences.Item(k).Question, FichierQuestions
                SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_REPONSE_OUI & i & "," & j & "," & k, Sp�cificit�.QuestPertinences.Item(k).R�ponseOui, FichierQuestions
                SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_REPONSE_NON & i & "," & j & "," & k, Sp�cificit�.QuestPertinences.Item(k).R�ponseNon, FichierQuestions
            Next
            SetFichierIni SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_NB_QUESTIONS_PERTINENCE & i & "," & j, n, FichierQuestions
        Next
        SetFichierIni SECTION_MODULE_SPECIFICITES, KEY_MODULE_NB_SPECIFICITES & i, Natures.Item(i).Sp�cificit�s.Count, FichierQuestions
    Next
    SetFichierIni SECTION_MODULE_NATURES, KEY_MODULE_NB_NATURES, Natures.Count, FichierQuestions
    
    'Questions de criticit�
    SetFichierIni SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_NB_NIVEAUX_CRITICITE, MODULE_NB_MAX_NIVEAUX_CRITICITE, FichierQuestions
    SetFichierIni SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_NB_QUESTIONS_CRITICITE, MODULE_NB_MAX_QUESTIONS_CRITICITE, FichierQuestions
    For i = 1 To MODULE_NB_MAX_NIVEAUX_CRITICITE
        For j = 1 To MODULE_NB_MAX_QUESTIONS_CRITICITE
            SetFichierIni SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_QUESTION_CRITICITE & i & "," & j, tQuestionsCriticit�(i, j), FichierQuestions
        Next
    Next
    
    'lecture des sujets de documentation
    SetModule SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_NB_SUJETS_DOC, iNbDocSujets
    n = iNbDocSujets
    For i = 1 To n
        SetModule SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_SUJET_DOC & i, tDocSujets(i).Sujet
        SetModule SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_SUJET_DOC_TOPIC & i, tDocSujets(i).Topic
    Next
    
    iModifi� = False
   
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
'entr�e:
'   r�pertoire et nom du module
Public Sub Load(ByVal R�pertoireModule As String, ByVal Nom As String)
Attribute Load.VB_Description = "Charge un module depuis le disque"

Dim i As Integer
Dim n As Integer
Dim j As Integer
Dim m As Integer
Dim k As Integer
Dim FichierSuggestions As String
Dim FichierQuestions As String

    'initialisation du module
    chFichierModule = R�pertoireModule & "\" & FICHIER_MODULE_INI
    chTitre = GetModule(SECTION_MODULE_DIVERS, KEY_MODULE_TITRE)
    chNom = Nom
    chFichierLogo = GetModule(SECTION_MODULE_DIVERS, KEY_MODULE_LOGO)
    chFichierAide = GetModule(SECTION_MODULE_DIVERS, KEY_MODULE_AIDE)
    chR�pertoire = R�pertoireModule

    'lecture des niveaux de donn�es
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
                Dim Effac�e As Integer
                Dim Ajout�e As Integer
                Dim Remplac�e As Integer
                Dim chDescription As String
                Ajout�e = Val(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_AJOUTEE & i & "," & j & "," & k, FichierSuggestions))
                Effac�e = Val(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_EFFACEE & i & "," & j & "," & k, FichierSuggestions))
                Remplac�e = Val(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_REMPLACEE & i & "," & j & "," & k, FichierSuggestions))
                chDescription = RestoreChaineCrLF(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_DESCRIPTION & i & "," & j & "," & k, FichierSuggestions))
                tNiveauSuggestions(i, k).Add GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION & i & "," & j & "," & k, FichierSuggestions), chDescription, j, Ajout�e, Effac�e, Remplac�e
                If Remplac�e Then
                    tNiveauSuggestions(i, k).Item(j).OldLibell� = GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_OLD_LIBELLE & i & "," & j & "," & k, FichierSuggestions)
                    tNiveauSuggestions(i, k).Item(j).OldDescription = RestoreChaineCrLF(GetFichierIni(SECTION_MODULE_SUGGESTIONS, KEY_MODULE_SUGGESTION_OLD_DESCRIPTION & i & "," & j & "," & k, FichierSuggestions))
                End If
            Next
        Next
    Next
    
    'fichier contenant les natures, sp�cificit�s et questions pertinence et criticit�
    FichierQuestions = InsereChaineSep(UCase$(chFichierModule), "." & EXTENSION_MODULE, "." & EXTENSION_QUESTIONS)
    
    'lecture des natures, sp�cificit� et questionnaire pertinence de danger
    n = Val(GetFichierIni(SECTION_MODULE_NATURES, KEY_MODULE_NB_NATURES, FichierQuestions))
    For i = 1 To n
        'ajoute la nature
        Dim Libell�Nature As String
        Dim Nature As Nature
        Libell�Nature = GetFichierIni(SECTION_MODULE_NATURES, KEY_MODULE_NATURE & i, FichierQuestions)
        Natures.Add Libell�Nature
        Set Nature = Natures.Item(Libell�Nature)
        'lecture des sp�cificit�s
        m = Val(GetFichierIni(SECTION_MODULE_SPECIFICITES, KEY_MODULE_NB_SPECIFICITES & i, FichierQuestions))
        For j = 1 To m
            'ajoute une sp�cificit� � un nature
            Dim Libell�Sp�cificit� As String
            Dim Sp�cificit� As Specificite
            Libell�Sp�cificit� = GetFichierIni(SECTION_MODULE_SPECIFICITES, KEY_MODULE_SPECIFICITE & i & "," & j, FichierQuestions)
            Nature.Sp�cificit�s.Add Libell�Sp�cificit�
            Set Sp�cificit� = Nature.Sp�cificit�s.Item(Libell�Sp�cificit�)
            'lecture des questions de pertinence
            Dim p As Integer
            p = Val(GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_NB_QUESTIONS_PERTINENCE & i & "," & j, FichierQuestions))
            For k = 1 To p
                'Ajoute une question pertinence � la sp�cificit�
                Dim id As String
                Dim Question As String
                Dim R�ponseOui As String
                Dim R�ponseNon As String
                id = GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_ID & i & "," & j & "," & k, FichierQuestions)
                Question = GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE & i & "," & j & "," & k, FichierQuestions)
                R�ponseOui = GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_REPONSE_OUI & i & "," & j & "," & k, FichierQuestions)
                R�ponseNon = GetFichierIni(SECTION_MODULE_QUESTIONS_PERTINENCE, KEY_MODULE_QUESTION_PERTINENCE_REPONSE_NON & i & "," & j & "," & k, FichierQuestions)
                Sp�cificit�.QuestPertinences.Add id, Question, R�ponseOui, R�ponseNon
            Next
        Next
    Next
        
    'lecture des questions de criticit�
    n = Val(GetFichierIni(SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_NB_NIVEAUX_CRITICITE, FichierQuestions))
    m = Val(GetFichierIni(SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_NB_QUESTIONS_CRITICITE, FichierQuestions))
    For i = 1 To n
        For j = 1 To m
            tQuestionsCriticit�(i, j) = GetFichierIni(SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_QUESTION_CRITICITE & i & "," & j, FichierQuestions)
        Next
    Next
        
    'lecture des sujets de documentation
    n = Val(GetModule(SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_NB_SUJETS_DOC))
    iNbDocSujets = n
    For i = 1 To n
        tDocSujets(i).Sujet = GetModule(SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_SUJET_DOC & i)
        tDocSujets(i).Topic = Val(GetModule(SECTION_MODULE_DOCUMENTATION_BAS, KEY_MODULE_SUJET_DOC_TOPIC & i))
    Next
    
    iModifi� = False
    
End Sub


'insertion d'une chaine dans une autre
'entr�e:
'   chaine � modifier
'   chaine ins�r�e
'   chaine marquant l'emplacement
'retour:
'   chaine modifi�e
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
'entr�e:
'   chaine � modifier
Private Function RestoreChaineCrLF(ch As String)

    While InStr(ch, "|")
        ch = InsereChaineSep(ch, "|", vbCrLf)
    Wend
    
    RestoreChaineCrLF = ch
    
End Function





'remplace dans une chaine tous les CrLF par |
'entr�e:
'   chaine � modifier
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
        iModifi� = True
    End If

End Property

'renvoit le nombre maximum de sujets de documentation
Public Function DocSujetMax() As Integer

    DocSujetMax = MODULE_NB_MAX_DOC_SUJETS

End Function

'renvoit le titre d'un module � partir de son fichier de description
Public Function LoadTitre(ByVal FichierModule As String) As String

    LoadTitre = GetFichierIni(SECTION_MODULE_DIVERS, KEY_MODULE_TITRE, FichierModule)

End Function
'renvoit le nom du fichier logo d'un module � partir de son fichier de description
Public Function LoadLogo(ByVal FichierModule As String) As String

    LoadLogo = GetFichierIni(SECTION_MODULE_DIVERS, KEY_MODULE_LOGO, FichierModule)

End Function

'raz du flag module modifi�
Public Sub ModifieNon()

    iModifi� = False
    
End Sub

'lit une entr�e dans le fichier .MUL
'entr�e:
'   section et cl� � lire
Private Function GetModule(Section As String, Cle As String) As String
Attribute GetModule.VB_Description = "Lit une entr�e du fichier de description du module"

    GetModule = GetFichierIni(Section, Cle, chFichierModule)

End Function

'lit une entr�e dans un .INI
'entr�e:
'   section, cl� et fichier � lire
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



'�crit une entr�e dans un fichier .INI
Private Sub SetFichierIni(ByVal Section As String, ByVal key As String, ByVal valeur As String, ByVal chFichier As String)

Dim cr As Integer

    cr = WritePrivateProfileString(Section, key, valeur, chFichier)

End Sub


'�crit une entr�e dans un fichier INI
'entr�e:
'   section, cl� et valeur
Private Sub SetModule(ByVal Section As String, ByVal key As String, ByVal valeur As String)
Attribute SetModule.VB_Description = "Modifie une entr�e du fichier de description du module"

Dim cr As Integer

    cr = WritePrivateProfileString(Section, key, valeur, chFichierModule)
    If cr = 0 Then
        Err.Raise Number:=vbObjectError + 32000, Description:="Impossible d'�crire dans le module"
    End If

End Sub


'efface une suggestion
'entr�e:
'   niveau, index et affichage de la suggestion
Public Sub DeleteSuggestion(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer, ByVal Ajout�e As Integer)
    
    tNiveauSuggestions(Niveau, Affichage).Delete Index, Ajout�e
    iModifi� = True
    
End Sub


'ajoute une suggestion
'entr�e:
'   niveau, libell�, description, index, affichage et flags ajout�e, modifi�e, effac�e de la suggestion
Public Sub AddSuggestion(ByVal Niveau As Integer, ByVal Libell� As String, ByVal Description As String, ByVal Index As Integer, ByVal Affichage As Integer, ByVal Ajout�e As Integer, ByVal Effac�e As Integer, ByVal Remplac�e As Integer)
Attribute AddSuggestion.VB_Description = "Ajoute une suggestion au module pour un niveau de donn�es"
    
    tNiveauSuggestions(Niveau, Affichage).Add Libell�, Description, Index, Ajout�e, Effac�e, Remplac�e
    iModifi� = True
    
End Sub


'modifie une suggestion
'entr�e:
'   niveau, libell�, description, index, affichage et flags ajout�e, modifi�e, effac�e de la suggestion
Public Sub RemplacerSuggestion(ByVal Niveau As Integer, ByVal Libell� As String, ByVal Description As String, ByVal Index As Integer, ByVal Affichage As Integer, ByVal Ajout�e As Integer, ByVal Effac�e As Integer, ByVal Remplac�e As Integer)
    
    tNiveauSuggestions(Niveau, Affichage).Replace Libell�, Description, Index, Ajout�e, Effac�e, Remplac�e
    iModifi� = True

End Sub

'modifie le fichier d'aide du module
'entr�e:
'   nom du fichier d'aide
Public Property Let FichierAide(ByVal Fichier As String)
Attribute FichierAide.VB_Description = "Fichier d'aide sp�cifique du module"
    
    If chFichierAide <> Fichier Then
        chFichierAide = Fichier
        iModifi� = True
    End If
    
End Property


'renvoit le fichier d'aide du module
Public Property Get FichierAide() As String
    
    FichierAide = chFichierAide

End Property



'renvoit le fichier de logo du module
'entr�e:
'   nom du fichier logo
Public Property Let FichierLogo(ByVal Fichier As String)
    
    If chFichierLogo <> Fichier Then
        chFichierLogo = Fichier
        iModifi� = True
    End If
    
End Property


'modifie le fichier de logo du module
Public Property Get FichierLogo() As String
    
    FichierLogo = chFichierLogo

End Property


'modifie le nom du module
'entr�e:
'   nom
Public Property Let Nom(ByVal Nom As String)
Attribute Nom.VB_Description = "Nom du module (8 caract�res)"
    
    If chNom <> Nom Then
        chNom = Nom
        iModifi� = True
    End If

End Property


'renvoit le nom du module
Public Property Get Nom() As String
    
    Nom = chNom

End Property





'modifie une question de criticit� du module
'entr�e:
'   niveau, num�ro de question et question � modifi�
Public Sub SetQuestionCriticit�(ByVal Niveau As Integer, ByVal Num�roQuestion As Integer, ByVal Question As String)

    If Niveau >= 1 And Niveau <= MODULE_NB_MAX_NIVEAUX_CRITICITE And Num�roQuestion >= 1 And Num�roQuestion <= MODULE_NB_MAX_QUESTIONS_CRITICITE Then
        tQuestionsCriticit�(Niveau, Num�roQuestion) = Question
        iModifi� = True
    Else
        MsgBox "erreur dans setQuestionCriticit�"
    End If
    
End Sub


'modifie un affichage
'entr�e:
'   num�ro, titre et commentaire de l'affichage
Public Sub SetAffichage(ByVal Affichage As Integer, ByVal Titre As String, ByVal Commentaire As String)
Attribute SetAffichage.VB_Description = "Modifie les �l�ments d'un type d'affichage du module"

    If Affichage >= 1 And Affichage <= MODULE_NB_MAX_AFFICHAGES Then
        tAffichage(Affichage).Titre = Titre
        tAffichage(Affichage).Commentaire = Commentaire
        iModifi� = True
    Else
        MsgBox "erreur dans setaffichage"
    End If
    
End Sub


'change le libell� d'un niveau de donn�e
'entr�e:
'   num�ro de niveau et libell�
Public Sub SetNiveau(ByVal Num�roNiveau As Integer, ByVal Libell� As String)

    If Num�roNiveau >= 1 And Num�roNiveau <= MODULE_NB_MAX_NIVEAUX Then
        tNiveaux(Num�roNiveau) = Libell�
        iModifi� = True
    Else
        MsgBox "erreur dans SetNiveau"
    End If
    
End Sub



'renvoit le titre d'un affichage
'entr�e:
'   affichage
Public Function AffichageTitre(ByVal Affichage As Integer) As String
Attribute AffichageTitre.VB_Description = "Fournit le titre d'un type d'affichage"

    AffichageTitre = tAffichage(Affichage).Titre

End Function
'renvoit le commentaire d'un affichage
'entr�e:
'   affichage
Public Function AffichageCommentaire(ByVal Affichage As Integer) As String
Attribute AffichageCommentaire.VB_Description = "Fournit le commentaire associ� � un type d'affichage"

    AffichageCommentaire = tAffichage(Affichage).Commentaire

End Function

'renvoit une question de criticit�
'entr�e:
'   niveau et num�ro de question
Public Function QuestionCriticit�(ByVal Niveau As Integer, ByVal Num�roQuestion As Integer) As String

    If Niveau >= 1 And Niveau <= MODULE_NB_MAX_NIVEAUX_CRITICITE And Num�roQuestion >= 1 And Num�roQuestion <= MODULE_NB_MAX_QUESTIONS_CRITICITE Then
        QuestionCriticit� = tQuestionsCriticit�(Niveau, Num�roQuestion)
    Else
        MsgBox "erreur dans QuestionCriticit�()"
        QuestionCriticit� = ""
    End If
    
End Function


'renvoit le libell� d'un niveau de donn�e
'entr�e:
'   num�ro de niveau
Public Function Niveau(ByVal Num�roNiveau As Integer) As String

    Niveau = tNiveaux(Num�roNiveau)

End Function


'renvoit le libell� avec blanc d'un niveau de donn�e
'entr�e:
'   num�ro de niveau
Public Function NiveauAvecBlanc(ByVal Num�roNiveau As Integer) As String

    NiveauAvecBlanc = tNiveauxAvecBlanc(Num�roNiveau)

End Function



'renvoit le libell� d'une suggestion
'entr�e:
'   niveau, index et affichage de la suggestion
Public Property Get Suggestion(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer) As String
Attribute Suggestion.VB_Description = "Suggestions d'un niveau de donn�es du module"
    
    Suggestion = tNiveauSuggestions(Niveau, Affichage).Item(Index).Libell�

End Property

'renvoit la description d'une suggestion
'entr�e:
'   niveau, index et affichage de la suggestion
Public Property Get SuggestionDescription(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer) As String
    
    SuggestionDescription = tNiveauSuggestions(Niveau, Affichage).Item(Index).Description

End Property

'modifie le libell� d'une suggestion
'entr�e:
'   niveau, index, affichage et libell� de la suggestion
Public Property Let Suggestion(ByVal Niveau As Integer, ByVal Index As Integer, ByVal Affichage As Integer, ByVal Libell� As String)
    
    If tNiveauSuggestions(Niveau, Affichage).Item(Index).Libell� <> Libell� Then
        tNiveauSuggestions(Niveau, Affichage).Item(Index).Libell� = Libell�
        iModifi� = True
    End If

End Property


'efface toutes les suggestions d'un niveau/affichage donn�
'entr�e:
'   niveau, affichage
'   flag AppelDepuisHacMod indiquant l'utilisation depuis HACMOD (l'effacement n'est pas
'   le m�me depuis HACMOD ou HACCP)
Public Sub SuggestionsClear(ByVal Niveau As Integer, ByVal Affichage As Integer, ByVal AppelDepuisHacMod As Integer)
Attribute SuggestionsClear.VB_Description = "Efface les suggestions d'un niveau de donn�es"

    While tNiveauSuggestions(Niveau, Affichage).Count
         tNiveauSuggestions(Niveau, Affichage).Delete 1, AppelDepuisHacMod
    Wend
    iModifi� = True

End Sub

'modifie le titre du module
'entr�e:
'   titre
Public Property Let Titre(ByVal Titre As String)
Attribute Titre.VB_Description = "Titre long du module"
    
    If chTitre <> Titre Then
        chTitre = Titre
        iModifi� = True
    End If

End Property


'modifie le r�pertoire du module
'entr�e:
'   r�pertoire
Public Property Let R�pertoire(ByVal R�pertoire As String)
Attribute R�pertoire.VB_Description = "Chemin d'acc�s au r�pertoire du module"
    
    If chR�pertoire <> R�pertoire Then
        chR�pertoire = R�pertoire
        iModifi� = True
    End If

End Property



'modifie le nom de fichier du module
'entr�e:
'   fichier
Public Property Let FichierModule(ByVal Fichier As String)
Attribute FichierModule.VB_Description = "Nom complet du fichier de description du module (format INI)"
    
    If chFichierModule <> Fichier Then
        chFichierModule = Fichier
        iModifi� = True
    End If

End Property




'marque le module modifi�
Public Sub Salit()
Attribute Salit.VB_Description = "Marque le module comme modifi�"
    
    iModifi� = True

End Sub





'renvoit le titre du module
Public Property Get Titre() As String
    
    Titre = chTitre

End Property




'renvoit le nom du fichier du module
Public Property Get FichierModule() As String
    
    FichierModule = chFichierModule

End Property




'renvoit le r�pertoire du module
Public Property Get R�pertoire() As String
    
    R�pertoire = chR�pertoire

End Property







'lib�re tous les objets contenus dans le module
Private Sub Class_Terminate()
    
    Free

End Sub


