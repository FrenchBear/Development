Attribute VB_Name = "CLEGLOB"
Option Explicit


'-------------------------------------------------------------------------
'                           Constantes de l'application
'-------------------------------------------------------------------------
Global Const NOM_REPERTOIRE_APPLI = "HACCP"
Global Const NOM_MODULE_EXE = "CLEFS.EXE"
Global Const NOM_COURT_APPLICATION = "CLEFS"
Global Const VERSION_APPLICATION = "1.0"
Global Const FICHIER_CLEFS = "clefs.dat"
Global Const FICHIER_AIDE = "cles.hlp"

'-------------------------------------------------------------------------
'                           Types de données
'-------------------------------------------------------------------------


'-------------------------------------------------------------------------
'                           Variables globales à l'application
'-------------------------------------------------------------------------
Global CrLf2 As String   'vbCrLf & vbCrLf

'répertoires de l'applications
Global RepertoireWindows As String
Global RepertoireApplication  As String

Global FichierConfig As String
Global FichierAide As String

'nom de l'application
Global NomApplication As String

'gap inter-controles
Global gap As Integer
Global gap2 As Integer


'séparateur de champ dans le texte du clipboard pour le copier/coller
Global Sep As String

'fichier des clefs
Global FichierClefs As String



Public Sub AideProgramme(ByVal Sujet As Integer)

    WinHelpVB FormMain.cmdialog1, FichierAide, HELP_CONTEXT, Sujet
    
End Sub

