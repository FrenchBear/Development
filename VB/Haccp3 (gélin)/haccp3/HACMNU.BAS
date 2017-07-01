Attribute VB_Name = "HACMNU"
Option Explicit

Public Sub MnuAideContextuelleClick()

    If FormMain.ActiveForm Is formAccueil Then
        AideProgramme 2
    Else
        If FormMain.ActiveForm Is FormChildModel Then
            AideProgramme 10 + FormMain.ActiveForm.SSTab1.Tab
        Else
            If Forms.Count = 2 And Forms(1) Is frmHelp Then
                AideProgramme 1
            Else
                AideProgramme 10 + FormMain.ActiveForm.SSTab1.Tab
            End If
        End If
    End If

End Sub

Public Sub MnuDocSujetClick(ByVal Index As Integer)
        
    AideModule Module.DocSujetTopic(Index + 1)
    
End Sub


Public Sub MnuDocHACCPClick(ByVal Index As Integer, ByVal Topic As Integer)

    AideHACCP Topic
    
End Sub



Public Sub MnuEditionDétailClick()

    AideHACCP 10 + FormMain.ActiveForm.SSTab1.Tab
    
End Sub

Sub MnuEditionContrôlerCohérenceClick()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    FormMain.ActiveForm.ContrôlerCohérence

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub


Public Sub MnuEditionCopierClick()

    FormMain.ActiveForm.SetFocus
    'pour ne pas avoir une sélection complète de la zone de texte
    'avec le va et vient du focus entre la zone de texte et le
    'bouton de la barre d'outils
    bNePasSélectionnerZoneTexte = True
    SendKeys STRING_SENDKEYS_COPY
    'pour laisser exécuter le sendkeys
    DoEvents
    bNePasSélectionnerZoneTexte = False
    
End Sub

Public Sub MnuEditionCollerClick()

    FormMain.ActiveForm.SetFocus
    bNePasSélectionnerZoneTexte = True
    SendKeys STRING_SENDKEYS_PASTE
    DoEvents
    bNePasSélectionnerZoneTexte = False
    
End Sub

Public Sub MnuEditionCouperClick()

    FormMain.ActiveForm.SetFocus
    'pour ne pas avoir une sélection complète de la zone de texte
    'avec le va et vient du focus entre la zone de texte et le
    'bouton de la barre d'outils
    bNePasSélectionnerZoneTexte = True
    SendKeys STRING_SENDKEYS_CUT
    'pour laisser exécuter le sendkeys
    DoEvents
    bNePasSélectionnerZoneTexte = False
    
End Sub


Public Sub MnuEditionEffacerClick()

    FormMain.ActiveForm.SetFocus
    'pour ne pas avoir une sélection complète de la zone de texte
    'avec le va et vient du focus entre la zone de texte et le
    'bouton de la barre d'outils
    bNePasSélectionnerZoneTexte = True
    SendKeys STRING_SENDKEYS_DELETE
    'pour laisser exécuter le sendkeys
    DoEvents
    bNePasSélectionnerZoneTexte = False
    
End Sub


Public Sub MnuEditionOptionsClick()

    FormOptionsProjet.Show MODAL
    If FormOptionsProjet.Tag <> "" Then
        RefreshTousBoutonsProjet FormMain.ActiveForm.Tag
        MetAJourMenus
    End If
    Unload FormOptionsProjet

End Sub

Sub MnuFenetreMosaiqueVerticaleClick()

    HourGlass "show"
    FormMain.Arrange vbTileVertical
    HourGlass "hide"

End Sub

Sub MnuFenetreMosaiqueHorizontaleClick()

    HourGlass "show"
    FormMain.Arrange vbTileHorizontal
    HourGlass "hide"

End Sub


Sub MnuFenetreNouvelleClick()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    NouvelleFenetrePourProjet FormMain.ActiveForm.Tag
    NumeroteFenetresProjet FormMain.ActiveForm.Tag
    HourGlass "hide"
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Sub MnuFenetreReorganiserClick()

    HourGlass "show"
    FormMain.Arrange vbArrangeIcons
    HourGlass "hide"
    
End Sub

Public Sub MnuFichierConfigurationImprimanteClick()

    On Error Resume Next
    FormMain.CMDialog1.CancelError = False
    FormMain.CMDialog1.Flags = cdlPDPrintSetup
    FormMain.CMDialog1.Action = 5
    On Error GoTo 0

End Sub

Public Sub MnuFichierConfigurerClick()
    FormConfiguration.Show MODAL
End Sub

Sub MnuFichierFermerClick()

    FermerProjet FormMain.ActiveForm.Tag
    AnnulerAnnulation
    
End Sub

Public Sub MnuFichierImprimerClick()

    formImprimer.Show MODAL
    
End Sub

Sub MnuFichierNouveauClick()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    DechargerFenetreAccueil

    HourGlass "show"
    If OuvrirProjet("") Then
        MetAJourMenus
    End If
    AnnulerAnnulation
    HourGlass "hide"
        
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Sub MnuFichierOuvrirClick()

Dim FichierLong As String
Dim p As Variant

    FormMain.CMDialog1.InitDir = CurDir$
    FormMain.CMDialog1.DefaultExt = EXTENSION_PROJET
    FormMain.CMDialog1.DialogTitle = "Ouvrir un projet HACCP"
    FormMain.CMDialog1.Filter = "Projets HACCP (*." & EXTENSION_PROJET & ")|*." & EXTENSION_PROJET & "|Backups (*." & EXTENSION_BACKUP & ")|*." & EXTENSION_BACKUP
    FormMain.CMDialog1.Flags = OFN_FILEMUSTEXIST Or OFN_HIDEREADONLY Or OFN_PATHMUSTEXIST Or cdlOFNHelpButton 'Or &H200000
    FormMain.CMDialog1.FileName = ""
    FormMain.CMDialog1.HelpFile = FichierAideProgramme
    FormMain.CMDialog1.HelpContext = 3
    FormMain.CMDialog1.HelpCommand = cdlHelpContext
    On Error Resume Next
    Err = 0
    FormMain.CMDialog1.CancelError = True
    FormMain.CMDialog1.ShowOpen
    If Err <> CDERR_CANCEL Then
        'fixe le module
        DechargerFenetreAccueil
        'l'opérateur n'a pas annulé
        FichierLong = FormMain.CMDialog1.FileName
        If OuvrirProjet(FichierLong) Then
            'place le projet ouvert en première position de la liste des derniers fichiers ouverts
            MRUListe.PutFirst FichierLong
            AnnulerAnnulation
        End If
    End If
    'reconstruit la liste des derniers fichiers pour tenir compte du répertoire courant qui a peut-être changé
    MRUListe.Refresh

End Sub

Sub MnuFichierProjetClick(ByVal IndexDerniersFichiers As Integer)

Dim p As Variant

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    DechargerFenetreAccueil
    p = IndexDerniersFichiers
    MRUListe.GetFilename p
    If OuvrirProjet(p) Then
        MRUListe.PutFirst p
        AnnulerAnnulation
    End If
    HourGlass "hide"

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

