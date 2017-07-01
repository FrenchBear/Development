Attribute VB_Name = "MODMNU"
Option Explicit

Public Sub MnuFichierConfigurationImprimanteClick()

    On Error Resume Next
    FormMain.CMDialog1.CancelError = False
    FormMain.CMDialog1.Flags = cdlPDPrintSetup
    FormMain.CMDialog1.Action = 5
    On Error GoTo 0

End Sub


Public Sub MnuAideContextuelleClick()

    If Forms.Count > 1 Then
        AideProgramme 9 + FormMain.ActiveForm.SSTAB1.Tab
    Else
        AideProgramme 25
    End If

End Sub
Sub MnuFenetreReorganiserClick()

    FormMain.Arrange vbTileHorizontal

End Sub

Public Sub MnuFichierImprimerClick()

    formImprimer.Show MODAL
    
End Sub

Sub MnuFichierModuleClick(ByVal IndexDerniersFichiers As Integer)

Dim p As Variant
Dim i As Integer
Dim cr As Integer

    HourGlass "show"
    p = IndexDerniersFichiers
    MRUListe.GetFilename p
    
    'recherche si ce module est déjà chargé
    For i = 1 To Forms.Count - 1
        If Forms(1).MDIChild And Forms(i).Module.Répertoire = p Then
            If Not Forms(i).Module.Modifié Then
                'rechargement du même module non modifié
                HourGlass "hide"
                Exit Sub
            Else
                cr = MsgBox("Ce module est déjà chargé et a été modifié. Voulez-vous recharger recharger la version du disque ?", MB_ICONQUESTION Or MB_YESNO, NomApplication)
                If cr = IDYES Then
                    'décharge le module modifié sans sauvegarder
                    Forms(i).IgnorerModification = True
                    Unload Forms(i)
                    Exit For
                Else
                    'annulation
                    HourGlass "hide"
                    Exit Sub
                End If
            End If
        End If
    Next
    'chargement du module
    If OuvrirModule(p) Then
        'mise à jour de la liste des derniers fichiers utilisés
        MRUListe.PutFirst p
    End If
    MetAJourMenus
    HourGlass "hide"

End Sub

Sub MnuFichierNouveauClick()

    HourGlass "show"
    If OuvrirModule("") Then
        MetAJourMenus
    End If
    HourGlass "hide"
    
End Sub

Sub MnuFichierOuvrirClick()

Dim chRepertoireChoisi As String
Dim cr As Integer

    Do
        chRepertoireChoisi = ChoixRepertoireExistant("Choisissez le répertoire du module à charger.", "Ouvrir un module", RepertoireApplication)
        If chRepertoireChoisi <> "" Then
            cr = OuvrirModule(chRepertoireChoisi)
            If cr Then
                'place le module ouvert en première position de la liste des derniers fichiers ouverts
                MRUListe.PutFirst chRepertoireChoisi
            End If
        End If
    Loop While cr = False And chRepertoireChoisi <> ""
    'reconstruit la liste des derniers fichiers pour tenir compte du répertoire courant qui a peut-être changé
    MRUListe.Refresh

End Sub

