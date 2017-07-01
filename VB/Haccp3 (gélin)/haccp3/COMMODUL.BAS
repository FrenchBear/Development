Attribute VB_Name = "COMMODUL"
Option Explicit

Type AffichageType
    Titre As String
    Commentaire As String
End Type

Type NatureType
    CodeNature As Integer
    Nature As String
End Type

Type SpécificitéType
    CodeSpécificité As Integer
    CodeNature As Integer
    Spécificité As String
End Type

Type QuestionsPertinenceType
    Id As String
    CodeNature As Integer
    CodeSpécificité As Integer
    Question As String
    RéponseOui As Integer
    RéponseNon As Integer
End Type

Type ModuleType
    Titre As String
    Répertoire As String
    FichierIni As String
    Nom As String
    FichierLogo As String
    FichierAide As String
    Modifié As Integer
    'Affichage(1 To MODULE_NB_MAX_AFFICHAGES) As AffichageType
    'Suggestions(1 To MODULE_NB_MAX_NIVEAUX, 0 To MODULE_NB_MAX_SUGGESTIONS) As String
End Type


