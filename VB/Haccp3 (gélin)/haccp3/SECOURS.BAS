Attribute VB_Name = "modSecours"
Option Explicit

Sub GestionErreurInattendue()

Dim i As Integer

    MsgBox "Erreur grave: " & vbCrLf & vbCrLf & "Les projets ouverts et modifi�s vont �tre sauvegard�s dans des fichiers de nom Fxxxx." & EXTENSION_PROJET & " dans le r�pertoire " & RepertoireApplication & " puis le programme va s'arr�ter." & vbCrLf & vbCrLf & "Relancez le programme et rechargez les fichiers Fxxxx.HAC pour retrouver vos donn�es.", MB_ICONSTOP, NomApplication
    HourGlass "show"
    For i = 1 To Projets.Count
        Projets(i).Save FormMain.DwStorage1, RepertoireApplication & "\F" & i & "." & EXTENSION_PROJET
    Next
    HourGlass "hide"
    'termine le programme
    End
    
End Sub


