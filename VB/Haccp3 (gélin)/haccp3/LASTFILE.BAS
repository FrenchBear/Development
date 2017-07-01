Attribute VB_Name = "LASTFILE"
Option Explicit

Const SECTION_DERNIERS_FICHIERS = "DerniersFichiers"
Const KEY_NB_FICHIERS = "Nombre"
Const KEY_FICHIER = "Fichier"

Const NB_MAX_DERNIERS_FICHIERS = 4

Sub DerniersFichiers1(ByVal method As String, p1 As Variant)

Dim n As Integer
Dim i As Integer

    'nombre de fichiers dans la liste
    n = Val(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS))

    'application de chaque méthode
    Select Case LCase$(method)

        'chargement de la liste
        Case "load", "refresh"

            Dim NomFichier As String
            On Error Resume Next
            For i = 1 To NB_MAX_DERNIERS_FICHIERS - 1
                Unload FormMain.MnuDerniersFichiers(i)
            Next
            On Error GoTo 0
            For i = 0 To n - 1
                If i > 0 Then
                    Load FormMain.MnuDerniersFichiers(i)
                End If
                FormMain.MnuDerniersFichiers(i).Visible = True
                'n'affiche pas le chemin quand le module est dans le répertoire d'application
                NomFichier = GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & (n - i - 1))
                If UCase$(GetCheminSansFichier(NomFichier)) = UCase$(CurDir) Then
                    NomFichier = GetFichierSansChemin(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & (n - i - 1)))
                    'NomFichier = GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & (n - i - 1))
                    'NomFichier = suppfirstchar(NomFichier, Len(GetDebutCommunDeChaines(NomFichier, UCase$(CurDir))))
                End If
                FormMain.MnuDerniersFichiers(i).Caption = "&" & (i + 1) & " " & NomFichier
            Next
            FormMain.MnuFichierTiret3.Visible = (n <> 0)

        'check élément courant
        Case "setcurrent"
            i = Val(p1)
            If i > 0 And i < n Then
                Dim k As Integer
                'demarque tous les fichiers
                For k = 0 To n - 1
                    FormMain.MnuDerniersFichiers(k).Checked = False
                Next
                'marque le fichier désigné
                FormMain.MnuDerniersFichiers(Val(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & Format$(i)))).Checked = True
            End If

        'ajoute un element
        Case "add"
            Dim p As Variant
            p = p1
            DerniersFichiers1 "FileExists", p
            If p Then
                'fichier  présent
                DerniersFichiers1 "putfirst", p1
                Exit Sub
            End If
            If n = NB_MAX_DERNIERS_FICHIERS Then
                'efface le premier
                DerniersFichiers1 "Delete", GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & 0)
                n = n - 1
            End If
            'ajoute le nouveau
            SetConfig SECTION_DERNIERS_FICHIERS, KEY_FICHIER & n, p1
            'un de plus
            SetConfig SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS, Format$(n + 1)
            DerniersFichiers1 "load", 0

        'soustrait un élément
        Case "delete"
            Dim j As Integer
            Dim ch As String
            j = 0
            For i = 0 To n - 1
                ch = GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & i) 'GetItemDansChaineSep(formMain.MnuDerniersFichiers(i).Caption, 2, " ")
                If ch <> p1 Then
                    SetConfig SECTION_DERNIERS_FICHIERS, KEY_FICHIER & j, ch
                    j = j + 1
                End If
            Next
            SetConfig SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS, Format$(j)
            DerniersFichiers1 "load", 0

        'met un élément en première place
        Case "putfirst"
            DerniersFichiers1 "delete", p1
            DerniersFichiers1 "add", p1
            DerniersFichiers1 "load", 0

        'tests l'existence d'un fichier dans la liste
        Case "fileexists"
            For i = 0 To n - 1
                ch = GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & i)
                If ch = p1 Then
                    p1 = True
                    Exit Sub
                End If
            Next
            p1 = False
            
        'récupère le nom d'un fichier à partir de son index
        Case "getfilename"
            i = Val(p1)
            If i >= 0 And i < n Then
                p1 = GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & n - Val(p1) - 1)
            End If

        'récupère le répertoire d'un fichier à partir de son index
        Case "getdirectory"
            If n > 0 Then
                i = Val(p1)
                If i >= 0 And i < n Then
                    DerniersFichiers1 "getfilename", p1
                    p1 = GetCheminSansFichier(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & n - Val(p1) - 1))
                End If
            Else
                p1 = ""
            End If

    End Select

    

End Sub

