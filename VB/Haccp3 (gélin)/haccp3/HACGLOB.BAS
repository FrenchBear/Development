Attribute VB_Name = "HACGLOB"
Option Explicit


'-------------------------------------------------------------------------
'                           Constantes de l'application
'-------------------------------------------------------------------------
Global Const NOM_REPERTOIRE_APPLI = "HACCP"
Global Const NOM_MODULE_EXE = "HACCP.EXE"
Global Const NOM_COURT_APPLICATION = "HACCP"
Global Const VERSION_APPLICATION = "3.0"
Global Const FICHIER_CONFIG = "haccp.ini"
Global Const FICHIER_TEXTES = "textes.ini"
Global Const FICHIER_HLP_HACPP = "haccp.hlp"
Global Const FICHIER_HLP_HACPPPGM = "haccppgm.hlp"

'cl�s du fichier de configuration HACCP.INI
Global Const SECTION_CONFIG_PARAMETRES = "Param�tres"
Global Const KEY_CONFIG_ACCUEIL = "Acceuil"
Global Const KEY_CONFIG_ONGLETS = "Onglets"
Global Const KEY_CONFIG_BARRE_ICONES = "BarreIcones"
Global Const KEY_CONFIG_BARRE_ETAT = "BarreEtat"
Global Const KEY_CONFIG_BULLES = "Bulles"

Global Const KEY_CONFIG_LASTMODULE = "DernierModule"

Global Const KEY_CONFIG_FORMAT_IMPRESSION = "FormatImpression"

Global Const SECTION_CONFIG_LICENCE = "Licence"
Global Const KEY_CONFIG_NUM_SERIE = "NumS�rie"
Global Const KEY_CONFIG_UTILISATEUR = "Utilisateur"
Global Const KEY_CONFIG_CLE = "Cl�"


'niveaux de donn�es
Global Const NIVEAU_ETAPE = 1
Global Const NIVEAU_SUJET = 2
Global Const NIVEAU_SUJET_DANGER = 3
Global Const NIVEAU_POINT_A_MAITRISER = 4
Global Const NIVEAU_MESURE_PREVENTIVE = 5
Global Const NIVEAU_VALEUR_CIBLE = 6
Global Const NIVEAU_ELEMENT_SURVEILLANCE = 7
Global Const NIVEAU_ACTION_CORRECTIVE = 8
Global Const NIVEAU_VERIFICATION = 9
Global Const NIVEAU_ENREGISTREMENT = 10
       
'constantes de type d'assistance dans l'ajout d'une donn�e (utilis�es avec Or)
Global Const ASSISTANCE_SUGGESTIONS = 1
Global Const ASSISTANCE_EXISTANT = 2


'-------------------------------------------------------------------------
'                           Types de donn�es
'-------------------------------------------------------------------------


'-------------------------------------------------------------------------
'                           Variables globales � l'application
'-------------------------------------------------------------------------
Global CrLf2 As String   'vbCrLf & vbCrLF

'r�pertoires de l'applications
Global RepertoireWindows As String
Global RepertoireApplication  As String

'fichiers de l'application avec chemin d'acc�s complet
Global FichierConfig As String
Global FichierTextes As String
Global FichierAideProgramme As String
Global FichierAideHACCP As String
Global FichierAideModule As String

'nom de l'application
Global NomApplication As String

'module
Global Module As Module

'collection de projets
Global Projets As New Collection

'flag utilis� pour �viter les actions en chaine
Global ActionLimit�e As Integer

'indique que la fen�tre d'acceuil est affich�e (pour l'oter automatiquement)
Global bFenetreAccueilChargee As Integer

'donn�es de configuration
Global bAfficherAcceuil As Integer
Global bAfficherOnglets As Integer
Global bAfficherBarreIcones As Integer
Global bAfficherBarreEtat As Integer
Global bAfficherBulles As Integer

'donn�e de licence
Global bLicenceOk As Integer

'liste des derniers projets ouverts
Global MRUListe As New MRUFilesClass

'flag indiquant qu'on est en train de quitter l'application
Global bQuitterApplicationEnCours As Integer

'gap inter-controles
Global gap As Integer
Global gap2 As Integer

'touches utilis�es pour le couper/copier/coller
Global Const KEY_CUT = 125
Global Const KEY_COPY = 126
Global Const KEY_PASTE = 127
'et chaines de SendKeys correspondantes
Global Const STRING_SENDKEYS_CUT = "^{F14}"
Global Const STRING_SENDKEYS_COPY = "^{F15}"
Global Const STRING_SENDKEYS_PASTE = "^{F16}"
Global Const STRING_SENDKEYS_DELETE = "{DELETE}"

'index de la ligne cliqu�e dans le menu popup de documents
Global IndexMenuPopupDocument As Integer

's�parateur de champ dans le texte du clipboard pour le copier/coller
Global Sep As String

'index d'affichage utilis�s dans:
'- les suggestions
'- les index de listes d'�tapes et de sujets
Global Const INDEX_AFF_ETAPES_ET_SUJETS = -1
Global Const INDEX_AFF_DISPOSITIONS = 0
Global Const INDEX_AFF_ARBRE = 1


'nombre maximum d'�tapes en mode �valuation
Global Const NB_MAX_ETAPES_EVALUATION = 5

'application word utilis�e pour la g�n�ration de documents
Global AppWord As Object

'index des listes � r�manance
Global gListIndexSuggestion As Integer
Global gNatureR�manente As String
Global gSp�cificit�R�manente As String
Global gListIndexEtape As Integer
Global gListIndexSujet As Integer
Global gTypeDangerR�manent As String


Public Sub LigneEtat(ByVal ch As String)

    FormMain.lblLigneEtat.Caption = ch

End Sub

'ins�re une ligne blache dans un spread (n'ajoute pas une ligne au spread)
'traite les cellules de type button pour les spreads de documents:
'   copie le texte du bouton
'   met une fleche dans le bouton si son texte n'est pas vide
Sub SpreadInsereLigneBlanche(ctl As Control, ctlPictureFleche As Control)

Dim i As Integer
Dim j As Integer
Dim t As String
Dim l As Integer
Dim bt As String

    HourGlass "show"
    With ctl
        .Col = 1
        For i = .MaxRows To .ActiveRow + 1 Step -1
            For j = 1 To .MaxCols
                .Col = j
                .Row = i - 1
                t = .Text
                l = .Lock
                If .CellType = SS_CELL_TYPE_BUTTON Then
                    bt = .Text <> ""
                End If
                .Row = i
                .Text = t
                .Lock = l
                If .CellType = SS_CELL_TYPE_BUTTON Then
                    If bt Then
                        .TypeButtonPicture = ctlPictureFleche.Picture
                    Else
                        .TypeButtonPicture = LoadPicture("")
                    End If
                End If
            Next
        Next
        .Row = .ActiveRow
        For j = 1 To .MaxCols
            .Col = j
            .Text = ""
            If .CellType = SS_CELL_TYPE_BUTTON Then
                .Lock = True
                .TypeButtonText = ""
                .TypeButtonPicture = LoadPicture("")
            End If
        Next
    End With
    HourGlass "hide"

End Sub


'ote la ligne courante d'un spread (ne diminue pas le spread d'une ligne, la derni�re ligne est blanche)
Sub SpreadOteLigne(ctl As Control, ctlPictureFleche As Control)

Dim i As Integer
Dim j As Integer
Dim t As String
Dim bt As Long

    HourGlass "show"
    With ctl
        .Col = 1
        For i = .ActiveRow + 1 To .MaxRows
            For j = 1 To .MaxCols
                .Col = j
                .Row = i
                bt = 0
                If .CellType = SS_CELL_TYPE_BUTTON Then
                    bt = .Text <> ""
                End If
                t = .Text
                .Row = i - 1
                .Text = t
                If .CellType = SS_CELL_TYPE_BUTTON Then
                    If bt Then
                        .TypeButtonPicture = ctlPictureFleche.Picture
                    Else
                        .TypeButtonPicture = LoadPicture("")
                    End If
                End If
            Next
        Next
        .Row = .MaxRows
        For j = 1 To .MaxCols
            .Col = j
            .Text = ""
        Next
    End With
    HourGlass "hide"


End Sub





Function GetFilename(ctl As Control, FileName As Variant)

    'Affiche le dialogue Enregistrer sous et retourne un nom de fichier
    'ou une cha�ne vide si l'utilisateur annule
    ctl.FileName = FileName
    ctl.InitDir = CurDir$
    ctl.DefaultExt = EXTENSION_PROJET
    ctl.DialogTitle = "Enregistrer un projet HACCP"
    ctl.Filter = "Projets HACCP (*." & EXTENSION_PROJET & ")|*." & EXTENSION_PROJET
    If bLicenceOk Then
        ctl.Flags = OFN_OVERWRITEPROMPT
    End If
    ctl.Flags = ctl.Flags Or OFN_HIDEREADONLY Or OFN_PATHMUSTEXIST Or cdlOFNHelpButton 'Or &H200000
    ctl.HelpFile = FichierAideProgramme
    ctl.HelpCommand = cdlHelpContext
    ctl.HelpContext = 3
    On Error Resume Next
    Err = 0
    ctl.CancelError = True
    ctl.ShowSave
    If Err <> CDERR_CANCEL Then    ' Annule le dialogue
        GetFilename = ctl.FileName
    Else
        GetFilename = ""
    End If
    
End Function



'obtention d'une chaine dans le fichier des textes
Public Function GetChaine(Cle As String) As String

Dim chaine As String * 500
Dim cr As Integer

    cr = GetPrivateProfileString("Textes", Cle, "", chaine, 500, FichierTextes)
    If cr = 0 Then
        GetChaine = ""
    Else
        GetChaine = Left$(chaine, cr)
    End If

End Function





'arme le timer action pour qu'il ouvre un document post�rieurement � l'ex�cution de
'la proc�dure-�v�nement
Public Sub OuvrirDocument(ByVal Fichier As String, ByVal R�pertoireDocuments As String)

    If Fichier <> "" Then
        'le nom du fichier est pass� dans le tag de la fen�tre principale
        If GetCheminSansFichier(Fichier) = "" Then
            FormMain.Tag = R�pertoireDocuments & "\" & Fichier
        Else
            FormMain.Tag = Fichier
        End If
        'arme l'action et le timer
        FormMain.TimerAction.Tag = "OuvreDocument"
        FormMain.TimerAction.Enabled = True
    End If
    
End Sub




'lancement d'un programme avec attente qu'il se termine

Function FileShellExecute(ByVal hWnd As Integer, FichierComplet As String) As Integer

Dim hWndShelledWindow As Integer
Dim TimeOutPeriod As Integer
Dim r As Integer
Dim fTimeOut As Integer
Dim s As Single

    TimeOutPeriod = 15  'augmentez cette valeur si le lancement
                        'du programme dure plus de 15 secondes
    r = ShellExecute(hWnd, "open", FichierComplet, "", "", 1)
    If r = 2 Or r = 31 Then
        FileShellExecute = r
        Exit Function
    End If
    fTimeOut = False: s! = Timer
    'tant que la fen�tre active est la fen�tre m�re
    Do
        r = DoEvents(): hWndShelledWindow = GetActiveWindow()
        If Timer - s! > TimeOutPeriod Then fTimeOut = True
    Loop While hWndShelledWindow = hWnd And Not fTimeOut

    'si le programme ne s'est pas lanc�
    If fTimeOut Then
        FileShellExecute = 1
        Exit Function
    End If

    'active le programme lanc�
    r = ShowWindow(hWndShelledWindow, 5)
    
    'ok
    FileShellExecute = 0

End Function


Public Function GetChaineCrLf(Cle As String) As String

    GetChaineCrLf = RestoreChaineCrLF(GetChaine(Cle))

End Function




Public Function RestoreChaineCrLF(ch As String)

    While InStr(ch, "|")
        ch = InsereChaineSep(ch, "|", vbCrLf)
    Wend
    
    RestoreChaineCrLF = ch
    
End Function




Sub CouperCopierCollerEffacer(ByVal ProjetModifiable As Integer, ByVal bCut As Integer, ByVal bCopy As Integer, ByVal bPaste As Integer, ByVal bDelete As Integer)

    'menu Edition
    FormMain.MnuEditionCouper.Enabled = ProjetModifiable
    FormMain.MnuEditionCopier.Enabled = True
    FormMain.MnuEditionColler.Enabled = ProjetModifiable
    FormMain.MnuEditionEffacer.Enabled = ProjetModifiable
    
    'boutons de la barre d'ic�nes
    FormMain.btnEditionCouper.Enabled = ProjetModifiable
    FormMain.btnEditionCouper.Visible = True
    FormMain.btnEditionCopier.Visible = True
    FormMain.btnEditionColler.Enabled = ProjetModifiable
    FormMain.btnEditionColler.Visible = True

End Sub



Public Sub AideProgramme(ByVal Sujet As Integer)

    WinHelpVB FormMain.CMDialog1, FichierAideProgramme, HELP_CONTEXT, Sujet
    
End Sub

Public Sub AideHACCP(ByVal Sujet As Integer)

    WinHelpVB FormMain.CMDialog1, FichierAideHACCP, HELP_CONTEXT, Sujet
    
End Sub


Public Sub AideModule(ByVal Sujet As Integer)

    WinHelpVB FormMain.CMDialog1, FichierAideModule, HELP_CONTEXT, Sujet
    
End Sub



Public Sub AfficherMenuDocuments(frm As Form, ByVal Element As Object, ByVal R�pertoireDocuments As String)

Dim i As Integer
Static imax As Integer

    If Element.DocumentsCount = 0 Then
        Exit Sub
    End If
    For i = 0 To Element.DocumentsCount - 1
        If i > imax Then
            Load FormMain.MnuPopupDocument(i)
            imax = i
        End If
        FormMain.MnuPopupDocument(i).Visible = True
        FormMain.MnuPopupDocument(i).Caption = "&" & i + 1 & " " & Element.DocumentTitre(i + 1)
    Next
    While i <= imax
        FormMain.MnuPopupDocument(i).Visible = False
        i = i + 1
    Wend
    IndexMenuPopupDocument = -1
    frm.PopupMenu FormMain.MnuPopupDocuments
    If IndexMenuPopupDocument <> -1 Then
        OuvrirDocument Element.DocumentFichier(IndexMenuPopupDocument + 1), R�pertoireDocuments
    End If

End Sub


'd�charge la fen�tre accueil si elle est charg�e
Sub DechargerFenetreAccueil()

    If bFenetreAccueilChargee Then
        'passe le flag bFenetreAccueilCharg�e � false
        Unload formAccueil
    End If

End Sub

'initialisations de chargement d'application
Sub Initialisations()

Dim i As Integer

    CrLf2 = vbCrLf & vbCrLf
    Sep = Chr$(9)
    
    'taille des gap
    gap2 = 1 * Screen.TwipsPerPixelX
    gap = 5 * Screen.TwipsPerPixelX
    
    'cr�ation du menu des anciens projets
    For i = 1 To MRUListe.MaxCount - 1
        Load FormMain.MnuDerniersFichiers(i)
    Next
    MRUListe.Load
    
    'aide contextuelle (peut �tre remplac�e par une version modifi�e qui se trouve dans le module)
    FichierAideProgramme = RepertoireApplication & "\" & FICHIER_HLP_HACPPPGM
    App.HelpFile = FichierAideProgramme

    'lecture du fichier de configuration du programme
    bAfficherAcceuil = IIf(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_ACCUEIL) = "", True, Val(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_ACCUEIL)) <> 0)
    bAfficherOnglets = IIf(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_ONGLETS) = "", True, Val(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_ONGLETS)) <> 0)
    bAfficherBarreIcones = IIf(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_BARRE_ICONES) = "", True, Val(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_BARRE_ICONES)) <> 0)
    bAfficherBarreEtat = IIf(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_BARRE_ETAT) = "", True, Val(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_BARRE_ETAT)) <> 0)
    bAfficherBulles = IIf(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_BULLES) = "", True, Val(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_BULLES)) <> 0)
    
End Sub

'raffraichit les menus et la barre de boutons en fonction du contexte
Sub MetAJourMenus(Optional bMenusR�duits As Variant)

Dim i As Integer
Dim bProjetOuvert As Integer
Dim bModuleChoisi As Integer
Dim bProjetModifi� As Integer
Dim bFormAccueil As Integer

    If IsMissing(bMenusR�duits) Then
        bMenusR�duits = False
    End If

    'feuille active est la fen�tre d'accueil -> certains menus sont d�sactiv�s
    bFormAccueil = FormMain.ActiveForm Is formAccueil

    bProjetOuvert = Projets.Count > 0
    If bProjetOuvert Then
        If Not FormMain.ActiveForm Is Nothing Then
            If bFormAccueil Then
                bProjetModifi� = False
            Else
                bProjetModifi� = Not bMenusR�duits And FormMain.ActiveForm.Projet.Modifi�
            End If
        Else
            bProjetOuvert = False
        End If
    End If
    
    If Module Is Nothing Then
        bModuleChoisi = False
    Else
        bModuleChoisi = True
    End If
        
    'menus
    FormMain.MnuFichier.Visible = True
    FormMain.MnuEdition.Visible = bProjetOuvert
    FormMain.MnuAffichages.Visible = bProjetOuvert
    FormMain.MnuFenetres.Visible = bProjetOuvert
    'FormMain.MnuDocumentations.Visible = bModuleChoisi
    FormMain.MnuAides.Visible = True 'bProjetOuvert
    
    'menu fichier
    FormMain.MnuFichierFermer.Enabled = bProjetOuvert And Not bFormAccueil
    FormMain.MnuFichierEnregistrer.Enabled = Not bFormAccueil And bProjetOuvert
    FormMain.btnFichierEnregistrer.Visible = Not bFormAccueil And bProjetOuvert
    FormMain.MnuFichierEnregistrerSous.Enabled = bProjetOuvert And Not bFormAccueil
    FormMain.MnuFichierImprimer.Enabled = bProjetOuvert And Not bFormAccueil
    FormMain.MnuEditionContr�lerCoh�rence.Enabled = bProjetOuvert And Not bFormAccueil
    FormMain.MnuEditionD�tail.Enabled = bProjetOuvert And Not bFormAccueil
        
    'menu edition
    FormMain.MnuEditionOptions.Visible = bProjetOuvert And Not bFormAccueil
    If Not FormMain.MnuEdition.Visible Then
        FormMain.btnEditionCouper.Visible = False
        FormMain.btnEditionCopier.Visible = False
        FormMain.btnEditionColler.Visible = False
    End If
    'autres options du menu �dition affect�e dans la fonction CouperCopierCollerDelete
    
        
    'boutons de choix d'affichage
    If bModuleChoisi Then
        For i = 0 To Module.AffichagesCount - 1
            FormMain.btnFenetre(i).Visible = bProjetOuvert
        Next
    End If
    
    'titre de la fen�tre fille courante
    If Forms.Count > 1 And Not bFormAccueil Then
        'FormMain.ActiveForm.Caption = FormMain.ActiveForm.SSTab1.TabCaption(FormMain.ActiveForm.SSTab1.Tab) & " - " & FormMain.ActiveForm.Projet.NomCourt
    End If
    
    'barre d'icones et ligne d'�tat
    FormMain.btnCoh�rence.Visible = bProjetOuvert And Not bFormAccueil
    FormMain.btnD�tail.Visible = bProjetOuvert And Not bFormAccueil
    FormMain.picToolbar.Visible = bAfficherBarreIcones
    FormMain.picBarreEtat.Visible = bAfficherBarreEtat
    FormMain.TimerTips.Enabled = bAfficherBulles
        
End Sub


