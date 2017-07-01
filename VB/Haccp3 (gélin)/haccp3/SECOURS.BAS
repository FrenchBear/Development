Attribute VB_Name = "modSecours"
Option Explicit

Sub GestionErreurInattendue()

Dim i As Integer

    MsgBox "Erreur grave: " & vbCrLf & vbCrLf & "Les projets ouverts et modifiés vont être sauvegardés dans des fichiers de nom Fxxxx." & EXTENSION_PROJET & " dans le répertoire " & RepertoireApplication & " puis le programme va s'arrêter." & vbCrLf & vbCrLf & "Relancez le programme et rechargez les fichiers Fxxxx.HAC pour retrouver vos données.", MB_ICONSTOP, NomApplication
    HourGlass "show"
    For i = 1 To Projets.Count
        Projets(i).Save FormMain.DwStorage1, RepertoireApplication & "\F" & i & "." & EXTENSION_PROJET
    Next
    HourGlass "hide"
    'termine le programme
    End
    
End Sub


