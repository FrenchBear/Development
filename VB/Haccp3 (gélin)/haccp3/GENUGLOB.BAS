Attribute VB_Name = "GENMGLOB"
Option Explicit


'-------------------------------------------------------------------------
'                           Constantes de l'application
'-------------------------------------------------------------------------
Global Const NOM_MODULE_EXE = "GENMUL.EXE"
Global Const NOM_COURT_APPLICATION = "GENMUL"
Global Const VERSION_APPLICATION = "1.0"
Global Const FICHIER_CONFIG = "Genmul.ini"
Global Const FICHIER_LST = "genmul.lst"

'-------------------------------------------------------------------------
'                           Types de donn�es
'-------------------------------------------------------------------------


'-------------------------------------------------------------------------
'                           Variables globales � l'application
'-------------------------------------------------------------------------
Global CrLf As String   'chr$(13) + chr$(10)
Global CrLf2 As String   'chr$(13) + chr$(10) + chr$(13) + chr$(10)

'r�pertoires de l'application
Global RepertoireWindows As String
Global RepertoireApplication  As String
'r�pertoire o� est g�n�rer le master avant copie sur disquettes
Global RepertoireMaster As String

'fichier de config
Global FichierConfig As String

'entr�es du fichier de config
Global Const SECTION_CONFIG_PARAMETRES = "Param�tres"
Global Const KEY_CONFIG_REPERTOIRE_MODULE = "Module"
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

    WinHelpVB FormMain.CMDialog1, RepertoireApplication & "\genmul.hlp", HELP_CONTEXT, Sujet
    
End Sub

