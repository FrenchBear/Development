VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "MRUFilesClass"
Attribute VB_Creatable = False
Attribute VB_Exposed = True
Option Explicit

Const SECTION_DERNIERS_FICHIERS = "DerniersFichiers"
Const KEY_NB_FICHIERS = "Nombre"
Const KEY_FICHIER = "Fichier"

Const NB_MAX_DERNIERS_FICHIERS = 4


Public Sub Add(p1 As Variant)

Dim n As Integer

    'nombre de fichiers dans la liste
    n = Val(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS))

    Dim p As Variant
    p = p1
    Me.FileExists p
    If p Then
        'fichier  présent
        Me.PutFirst p1
        Exit Sub
    End If
    If n = NB_MAX_DERNIERS_FICHIERS Then
        'efface le premier
        Me.Delete GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & 0)
        n = n - 1
    End If
    'ajoute le nouveau
    SetConfig SECTION_DERNIERS_FICHIERS, KEY_FICHIER & n, p1
    'un de plus
    SetConfig SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS, Format$(n + 1)
    Me.Load

End Sub

Sub Delete(p1 As Variant)

Dim n As Integer
Dim i As Integer

    'nombre de fichiers dans la liste
    n = Val(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS))

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
    Me.Load

End Sub


Public Sub FileExists(p1 As Variant)

Dim n As Integer
Dim i As Integer
Dim ch As String

    'nombre de fichiers dans la liste
    n = Val(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS))
    For i = 0 To n - 1
        ch = GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & i)
        If ch = p1 Then
            p1 = True
            Exit Sub
        End If
    Next
    p1 = False

End Sub


Public Sub Load()

Dim i As Integer
Dim NomFichier As String
Dim n As Integer

    'nombre de fichiers dans la liste
    n = Val(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS))

    For i = 1 To NB_MAX_DERNIERS_FICHIERS - 1
        FormMain.MnuDerniersFichiers(i).Visible = False
    Next
    For i = 0 To n - 1
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

End Sub


Public Property Get MaxCount()

    MaxCount = NB_MAX_DERNIERS_FICHIERS

End Property

Public Sub Refresh()

    Load
    
End Sub


Public Sub PutFirst(p1 As Variant)

    Me.Delete p1
    Me.Add p1
    Me.Load
    
End Sub
Public Sub GetFilename(p1 As Variant)

Dim n As Integer
Dim i As Integer

    'nombre de fichiers dans la liste
    n = Val(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS))

    i = Val(p1)
    If i >= 0 And i < n Then
        p1 = GetConfig(SECTION_DERNIERS_FICHIERS, KEY_FICHIER & n - Val(p1) - 1)
    End If

End Sub
Public Sub SetCurrent(p1 As Variant)

Dim n As Integer
Dim i As Integer

    'nombre de fichiers dans la liste
    n = Val(GetConfig(SECTION_DERNIERS_FICHIERS, KEY_NB_FICHIERS))

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

End Sub


