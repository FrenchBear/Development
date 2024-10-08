Attribute VB_Name = "GENBGLOB"
Option Explicit


'-------------------------------------------------------------------------
'                           Constantes de l'application
'-------------------------------------------------------------------------
Global Const NOM_MODULE_EXE = "GENBASE.EXE"
Global Const NOM_COURT_APPLICATION = "GENBASE"
Global Const VERSION_APPLICATION = "0.0516"
Global Const FICHIER_CONFIG = "Genbase.ini"
Global Const FICHIER_LST = "genbase.lst"
Global Const EXTENSION_PROJET = "HAC"
Global Const EXTENSION_BACKUP = "BAK"

'-------------------------------------------------------------------------
'                           Types de donn�es
'-------------------------------------------------------------------------


'-------------------------------------------------------------------------
'                           Variables globales � l'application
'-------------------------------------------------------------------------
Global CrLf As String   'chr$(13) + chr$(10)
Global CrLf2 As String   'chr$(13) + chr$(10) + chr$(13) + chr$(10)

'r�pertoires de l'applications
Global RepertoireWindows As String
Global RepertoireApplication  As String

'fichier de config
Global FichierConfig As String

'entr�es du fichier de config
Global Const SECTION_CONFIG_PARAMETRES = "Param�tres"
Global Const KEY_CONFIG_REPERTOIRE_HACCP = "RepertHACCP"
Global Const KEY_CONFIG_REPERTOIRE_MODULE = "Module"
Global Const KEY_CONFIG_INSTALLER_MODULE = "InstModule"
Global Const KEY_CONFIG_DESTINATION = "Destination"
Global Const KEY_CONFIG_REPERTOIRE_DESTINATION = "RepertDestination"

'nom de l'application
Global NomApplication As String

'gap inter-controles
Global gap As Integer
Global gap2 As Integer


's�parateur de champ dans le texte du clipboard pour le copier/coller
Global Sep As String



Public Sub AideProgramme(ByVal Sujet As Integer)

    WinHelpVB FormMain.CmDialog1, RepertoireApplication & "\genbase.hlp", HELP_CONTEXT, Sujet
    
End Sub

