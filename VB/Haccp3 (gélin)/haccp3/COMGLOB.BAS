Attribute VB_Name = "COMGLOB"
Option Explicit

'extensions des fichiers du module au format .INI
Global Const EXTENSION_MODULE = "MUL"
Global Const EXTENSION_SUGGESTIONS = "SUG"
Global Const EXTENSION_QUESTIONS = "QST"

'autres extensions
Global Const EXTENSION_PROJET = "HAC"
Global Const EXTENSION_BACKUP = "BAK"

Global Const EXTENSION_HIN = "HIN"
Global Const FICHIER_LOGO_DEFAULT = "logo.bmp"

Global Const SECTION_NIVEAUX_DONNEES = "Niveaux Données"
Global Const KEY_NIVEAU_DONNEE = "Niveau"

Global Const SECTION_AFFICHAGES = "Affichages"
Global Const KEY_AFFICHAGE = "Affichage"

Global Const SECTION_MODULE_QUESTIONS_CRITICITE = "QuestionsCriticité"
Global Const KEY_MODULE_NB_NIVEAUX_CRITICITE = "NbNiveauxCriticité"
Global Const KEY_MODULE_NB_QUESTIONS_CRITICITE = "NbQuestionsCriticité"
Global Const KEY_MODULE_QUESTION_CRITICITE = "QuestionCriticité"

'fichier de description d'un module
Global Const FICHIER_MODULE_INI = "module.mul"

'types de réponse aux questions du questionnaire d'évaluation de la pertinence du danger
'Const MODULE_TYPE_REPONSE_QUESTION_SUIVANTE = ""
Global Const MODULE_TYPE_REPONSE_DANGER_PERTINENT = "OUI"
Global Const MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT = "NON"
Global Const MODULE_REPONSE_DANGER_PERTINENT = "Pertinent"
Global Const MODULE_REPONSE_DANGER_NON_PERTINENT = "Non Pertinent"


