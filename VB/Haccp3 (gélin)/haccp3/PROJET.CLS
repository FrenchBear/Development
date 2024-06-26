VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Projet"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'propri�t�s system de l'objet projet
Private chNom As String             '8.3
Private chR�pertoire As String      'unite:r�pertoire
Private chFichierProjet As String   'nom de fichier avec chemin d'acc�s complet
Private iModifi� As Integer         'projet modifi�
Private iNbFenetres As Integer      'nombre de fen�tres ouvertes sur le projet
'propri�t�s sauvegard�s dans le fichier de projet
Private iNewId As Long              'prochain idId � donner aux donn�es
Private iNiveauMaxiCopie As Integer 'niveau maxi de copie d'arborescence
Private chR�pertoireDocuments As String 'r�pertoire des documents en relatifs
Private chNomModule As String       'nom du module du projet
Private chTitreModule As String     'titre du module du projet
Private iIndexAffichage As Integer  'dernier onglet affich�
Private iVerrouill� As Integer
Private iLectureSeule As Integer    'lecture seule
Private iErr As Long                'erreur dans le projet

'propri�t�s donn�es de l'objet projet
Private chTitre As String
Private chAuteur As String
Private chR�f�rence As String
Private dDateCr�ation As Variant
Private dDateModification As Variant
Private chCommentaire As String
Private colPersonnes As New Personnes
Private colDocuments As New Documents
Public colEtapes As New Collection 'collection de classe Donn�es
Public colDangers As New Collection 'collection de classe Dangers
Public colSujetsDangers As New Collection 'collection de classe SujetsDangers

Public Function AddEtape(ByVal Etape As Donnee, Optional AfterKey As Variant, Optional BeforeKey As Variant)
 
    If IsMissing(AfterKey) Then
        If IsMissing(BeforeKey) Then
            colEtapes.Add Etape, Etape.id
        Else
            'ajout avant un �l�ment donn�
            colEtapes.Add Etape, Etape.id, Before:=BeforeKey
        End If
    Else
        'ajout apr�s un �l�ment donn�
        colEtapes.Add Etape, Etape.id, After:=AfterKey
    End If
    iModifi� = True
    
End Function

Public Function AddSujet(ByVal Etape As Donnee, ByVal Sujet As Donnee, Optional AfterKey As Variant)
 
    If IsMissing(AfterKey) Then
        'ajout en fin de liste
        Etape.colEnfants.Add Sujet, Sujet.id
    Else
        'ajout avant un �l�ment donn�
        Etape.colEnfants.Add Sujet, Sujet.id, After:=AfterKey
    End If
    iModifi� = True
    
End Function



Public Function AddDispositionEnPlace(ByVal Parent As Donnee, ByVal Enfant As Donnee, Optional AfterKey As Variant)
 
    If IsMissing(AfterKey) Then
        Parent.colEnfants.Add Enfant, Enfant.id
    Else
        Parent.colEnfants.Add Enfant, Enfant.id, After:=AfterKey
    End If
    iModifi� = True
    
End Function




Public Function AddArbreHACCP(ByVal Parent As Object, ByVal Enfant As Donnee, Optional AfterKey As Variant)
 
    If IsMissing(AfterKey) Then
        Parent.colEnfants.Add Enfant, Enfant.id
    Else
        Parent.colEnfants.Add Enfant, Enfant.id, After:=AfterKey
    End If
    iModifi� = True
    
End Function

Public Function Danger(ByVal id As Variant) As Danger

    Set Danger = colDangers.Item(id)

End Function

Public Property Get Documentation() As Documents
    Set Documentation = colDocuments
End Property

Public Property Set Documentation(Documents As Documents)
    Set colDocuments = Documents
End Property


Public Function Etape(ByVal id As Variant) As Donnee

    On Error Resume Next
    Set Etape = colEtapes.Item(id)
    On Error GoTo 0

End Function


Public Function Document(ByVal id As Variant) As Document

    Set Document = colDocuments.Item(id)

End Function


Public Property Get Modifiable() As Integer

    Modifiable = Not Me.NonModifiable

End Property

Public Property Get NonModifiable() As Integer
    
    NonModifiable = iVerrouill� Or iLectureSeule

End Property

Public Function SujetDanger(ByVal id As Variant) As SujetDanger

    Set SujetDanger = colSujetsDangers.Item(id)

End Function


Public Sub DeleteEtape(id As Variant)

    colEtapes.Remove id
    iModifi� = True

End Sub

Public Sub DeleteDanger(id As Variant)

    colDangers.Remove id
    iModifi� = True

End Sub


Public Sub DeleteSujetDanger(id As Variant)

    colSujetsDangers.Remove id
    iModifi� = True

End Sub

Public Property Set Equipe(Equipe As Object)

    If TypeOf Equipe Is Personnes Then
        Set colPersonnes = Equipe
    End If

End Property


Public Property Get Equipe() As Personnes

    Set Equipe = colPersonnes

End Property



Public Property Get FichierProjet() As String
    
    FichierProjet = chFichierProjet

End Property

Public Property Let FichierProjet(ByVal Fichier As String)
    
    chFichierProjet = Fichier

End Property





Public Property Get Modifi�() As Integer
    
    Modifi� = iModifi�

End Property

Public Sub EstModifi�()
    
    iModifi� = True

End Sub


Public Property Get NbFen�tres()

    NbFen�tres = iNbFenetres

End Property


Property Get NewId()

    iNewId = iNewId + 1
    NewId = iNewId

End Property

Public Property Get Nom() As String
    
    Nom = chNom

End Property
Public Property Let Nom(ByVal Nom As String)
    
    If chNom <> Nom Then
        chNom = Nom
        iModifi� = True
    End If

End Property
Public Sub NonModifi�()

    iModifi� = False
    
End Sub
Public Property Get R�pertoire() As String
    
    R�pertoire = chR�pertoire

End Property
Public Property Let R�pertoire(ByVal R�pertoire As String)
    
    If chR�pertoire <> R�pertoire Then
        chR�pertoire = R�pertoire
        iModifi� = True
    End If

End Property
Public Sub SaveEtape(ByVal stream As Object, ByVal IndexEtape As Integer)

    colEtapes.Item(IndexEtape).Save stream

End Sub

Public Property Get SujetDangerSujet(ByVal i As Variant)
    SujetDangerSujet = colSujetsDangers.Item(i).Sujet
End Property

Public Property Get SujetsDangersCount()

    SujetsDangersCount = colSujetsDangers.Count
    
End Property

Public Function NombreSujetsDangersDunDanger(ByVal idDanger As Variant) As Integer

Dim i As Integer
Dim n As Integer

    n = 0
    For i = 1 To colSujetsDangers.Count
        If colSujetsDangers.Danger = idDanger Then
            n = n + 1
        End If
    Next
    NombreSujetsDangersDunDanger = n

End Function
Public Function NombreSujetsDangersDunSujet(ByVal idSujet As Variant) As Integer

Dim i As Integer
Dim n As Integer

    n = 0
    For i = 1 To colSujetsDangers.Count
        If colSujetsDangers.Sujet = idSujet Then
            n = n + 1
        End If
    Next
    NombreSujetsDangersDunSujet = n

End Function

'compte le nombre de sujets/dangers non effac�s
Public Property Get SujetsDangersNonEffac�sCount()

Dim n As Integer
Dim SujetDanger As SujetDanger

    n = 0
    For Each SujetDanger In colSujetsDangers
        If Not SujetDanger.Effac� Then
            n = n + 1
        End If
    Next
    SujetsDangersNonEffac�sCount = n
    
End Property

Private Function SVariantGet(ByVal stream As Object) As Variant

Dim vInfo As Variant

    stream.VariantGet STG_SEEK_DONTMOVE, vInfo
    If vInfo = "~#" Then
        SVariantGet = ""
    Else
        SVariantGet = vInfo
    End If

End Function

Public Property Get Titre() As String
    
    Titre = chTitre

End Property

Public Property Get Auteur() As String
    
    Auteur = chAuteur

End Property


Public Property Get NomModule() As String
    
    NomModule = chNomModule

End Property



Public Property Get R�pertoireDocuments() As String
    
    R�pertoireDocuments = chR�pertoireDocuments

End Property




Public Property Let Titre(ByVal Titre As String)
    
    If chTitre <> Titre Then
        chTitre = Titre
        iModifi� = True
    End If

End Property

Public Property Let Auteur(ByVal Auteur As String)
    
    If chAuteur <> Auteur Then
        chAuteur = Auteur
        iModifi� = True
    End If

End Property


Public Property Let NomModule(ByVal NomModule As String)
    
    If chNomModule <> NomModule Then
        chNomModule = NomModule
        iModifi� = True
    End If

End Property

Public Property Let R�pertoireDocuments(ByVal R�pertoireDocuments As String)
    
    If chR�pertoireDocuments <> R�pertoireDocuments Then
        chR�pertoireDocuments = R�pertoireDocuments
        iModifi� = True
    End If

End Property





Public Sub Load(ctl As Control, ByVal FileName As String)

Dim RootStorage As Object
Dim stream As Object
Dim chInfo1 As String
Dim chInfo2 As String
Dim i As Integer
Dim n As Integer
    
    On Error GoTo err_load
    Set RootStorage = ctl.OpenStorageFile(FileName, STG_DIRECT Or STG_READ Or STG_SHARE_EXCLUSIVE)
    
    'r�sum�
    If RootStorage.siOpenSummaryInfo() = True Then
        Me.Titre = RootStorage.siGetTitle
        Me.Auteur = RootStorage.siGetAuthor
        Me.R�f�rence = RootStorage.siGetSubject
        'dDateCr�ation = RootStorage.siGetCreateDate
        'dDateModification = RootStorage.siGetLastSaveDate
        Me.Verrouill� = (RootStorage.siGetSecurity = 3)
    End If
    
    'dates
    Set stream = RootStorage.OpenStream("Dates", STG_DIRECT Or STG_READ Or STG_SHARE_EXCLUSIVE)
    dDateCr�ation = SVariantGet(stream)
    dDateModification = SVariantGet(stream)
    
    'commentaire
    Set stream = RootStorage.OpenStream("Commentaire", STG_DIRECT Or STG_READ Or STG_SHARE_EXCLUSIVE)
    Me.Commentaire = SVariantGet(stream)
    
    '�quipe HACCP
    Dim NewPersonne As Personne
    Set stream = RootStorage.OpenStream("Equipe", STG_DIRECT Or STG_READ Or STG_SHARE_EXCLUSIVE)
    colPersonnes.Load stream
        
    'documentation du projet
    Set stream = RootStorage.OpenStream("Documentation", STG_DIRECT Or STG_READ Or STG_SHARE_EXCLUSIVE)
    colDocuments.Load stream
    
    '�tapes, sujets et dispositions en place
    Dim NewEtape As Donnee
    Set stream = RootStorage.OpenStream("Etapes", STG_DIRECT Or STG_READ Or STG_SHARE_EXCLUSIVE)
    While Me.colEtapes.Count
        Me.colEtapes.Remove 1
    Wend
    stream.GetString chInfo1
    n = Val(chInfo1)
    For i = 1 To n
        Set NewEtape = New Donnee
        NewEtape.Load stream
        Me.AddEtape NewEtape
    Next
    
    'dangers
    Dim NewDanger As Danger
    Set stream = RootStorage.OpenStream("Dangers", STG_DIRECT Or STG_READ Or STG_SHARE_EXCLUSIVE)
    While Me.colDangers.Count
        Me.colDangers.Remove 1
    Wend
    stream.GetString chInfo1
    n = Val(chInfo1)
    For i = 1 To n
        Set NewDanger = New Danger
        NewDanger.Load stream
        Me.AddDanger NewDanger
    Next
    
    'sujets/dangers
    Dim NewSujetDanger As SujetDanger
    Set stream = RootStorage.OpenStream("SujetsDangers", STG_DIRECT Or STG_READ Or STG_SHARE_EXCLUSIVE)
    While Me.colSujetsDangers.Count
        Me.colSujetsDangers.Remove 1
    Wend
    stream.GetString chInfo1
    n = Val(chInfo1)
    For i = 1 To n
        Set NewSujetDanger = New SujetDanger
        NewSujetDanger.Load stream
        Me.AddSujetDanger NewSujetDanger
    Next
        
    'options
    Set stream = RootStorage.OpenStream("Options", STG_DIRECT Or STG_READ Or STG_SHARE_EXCLUSIVE)
    stream.GetString chInfo1
    iNewId = Val(chInfo1)
    
    stream.GetString chInfo1
    iLectureSeule = Val(chInfo1) <> 0
    
    stream.GetString chInfo1
    iNiveauMaxiCopie = Val(chInfo1)
    chR�pertoireDocuments = SVariantGet(stream)
    stream.GetString chNomModule
    chTitreModule = SVariantGet(stream)
    
    stream.GetString chInfo1
    iIndexAffichage = Val(chInfo1)
    
    'fin
    Set stream = Nothing
    Set RootStorage = Nothing
    Me.FichierProjet = FileName
    Me.Nom = GetFichierSansChemin(FileName)
    Me.R�pertoire = GetCheminSansFichier(FileName)
    iModifi� = False

fin_load:
    Exit Sub
    
err_load:
    iErr = vbObjectError + 32000
    Resume fin_load
           
End Sub

Public Sub AjouterFen�tre()

    iNbFenetres = iNbFenetres + 1

End Sub

Public Sub OterFen�tre()

    If iNbFenetres = 0 Then
        MsgBox "Erreur dans Projet.OteFenetre"
    End If
    iNbFenetres = iNbFenetres - 1
    
End Sub


Public Property Let Erreur(ByVal Erreur As Long)

    iErr = Erreur
    
End Property
Public Property Get Erreur() As Long

    Erreur = iErr
    
End Property





Public Sub Save(ctl As Control, ByVal FileName As String)

Dim RootStorage As Object
Dim stream As Object
Dim chInfo As String
Dim i As Integer
Dim n As Integer

    On Error GoTo err_save
    Set RootStorage = ctl.CreateStorageFile(FileName, STG_CREATE Or STG_DIRECT Or STG_WRITE Or STG_SHARE_EXCLUSIVE)
    
    'r�sum�
    RootStorage.siSetTitle Me.Titre
    RootStorage.siSetAuthor Me.Auteur
    RootStorage.siSetSubject Me.R�f�rence
    RootStorage.siSetComments Left$(Me.Commentaire, 100)    'd�but du commentaire du projet
    RootStorage.siSetSecurity -3 * Me.Verrouill�
    'RootStorage.siRecordCreateDate
    'RootStorage.siRecordSaveDate
    'commit
    RootStorage.siSaveSummaryInfo
    RootStorage.Commit STG_DEFAULT
        
    'date de modification
    dDateModification = Now
        
    'dates de cr�ation et de modification
    Set stream = RootStorage.CreateStream("Dates", STG_CREATE Or STG_DIRECT Or STG_WRITE Or STG_SHARE_EXCLUSIVE)
    SVariantPut stream, dDateCr�ation
    SVariantPut stream, dDateModification
    stream.Flush STG_DEFAULT
        
    'Commentaire du projet au complet
    Set stream = RootStorage.CreateStream("Commentaire", STG_CREATE Or STG_DIRECT Or STG_WRITE Or STG_SHARE_EXCLUSIVE)
    'chInfo = Me.Commentaire
    'stream.PutString chInfo, VarType(chInfo), False
    SVariantPut stream, Me.Commentaire
    stream.Flush STG_DEFAULT
    
    '�quipe HACCP
    Set stream = RootStorage.CreateStream("Equipe", STG_CREATE Or STG_DIRECT Or STG_WRITE Or STG_SHARE_EXCLUSIVE)
    colPersonnes.Save stream
    
    'documentation du projet
    Set stream = RootStorage.CreateStream("Documentation", STG_CREATE Or STG_DIRECT Or STG_WRITE Or STG_SHARE_EXCLUSIVE)
    colDocuments.Save stream
        
    'etapes, sujets et dispositions en place
    Set stream = RootStorage.CreateStream("Etapes", STG_CREATE Or STG_DIRECT Or STG_WRITE Or STG_SHARE_EXCLUSIVE)
    chInfo = Me.EtapesCount
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 1 To n
        Me.Etape(i).Save stream
    Next
    stream.Flush STG_DEFAULT
    
    'dangers
    Set stream = RootStorage.CreateStream("Dangers", STG_CREATE Or STG_DIRECT Or STG_WRITE Or STG_SHARE_EXCLUSIVE)
    chInfo = Me.DangersCount
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 1 To n
        Me.Danger(i).Save stream
    Next
    stream.Flush STG_DEFAULT
    
    
    'sujets/dangers
    Set stream = RootStorage.CreateStream("SujetsDangers", STG_CREATE Or STG_DIRECT Or STG_WRITE Or STG_SHARE_EXCLUSIVE)
    chInfo = Me.SujetsDangersNonEffac�sCount
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 1 To n
        If Not Me.SujetDanger(i).Effac� Then
            'seulement ceux non effac�s
            Me.SujetDanger(i).Save stream
        End If
    Next
    stream.Flush STG_DEFAULT
    
    'options
    Set stream = RootStorage.CreateStream("Options", STG_CREATE Or STG_DIRECT Or STG_WRITE Or STG_SHARE_EXCLUSIVE)
    chInfo = iNewId
    stream.PutString chInfo, VarType(chInfo), False
    
    chInfo = iLectureSeule
    stream.PutString chInfo, VarType(chInfo), False
    
    chInfo = iNiveauMaxiCopie
    stream.PutString chInfo, VarType(chInfo), False
    
    SVariantPut stream, chR�pertoireDocuments
    
    chInfo = chNomModule
    stream.PutString chInfo, VarType(chInfo), False
    
    SVariantPut stream, chTitreModule
    
    chInfo = iIndexAffichage
    stream.PutString chInfo, VarType(chInfo), False
            
    RootStorage.Commit STG_DEFAULT
    
    Set stream = Nothing
    Set RootStorage = Nothing
    Me.FichierProjet = FileName
    iModifi� = False
    
fin_save:
    Exit Sub
    
err_save:
    iErr = vbObjectError + 32001
    Resume fin_save
    
End Sub


Public Sub SaveBack(ctl As Control, ByVal FileName As String)

Dim BackFileName As String

    On Error Resume Next
    BackFileName = InsereChaineSep(FileName, "." & EXTENSION_PROJET, "." & EXTENSION_BACKUP)
    Kill BackFileName
    Name FileName As BackFileName
    Me.Erreur = 0
    Save ctl, FileName

End Sub
Public Property Get R�f�rence() As String
    
    R�f�rence = chR�f�rence

End Property

Public Property Let R�f�rence(ByVal R�f�rence As String)
    
    If chR�f�rence <> R�f�rence Then
        chR�f�rence = R�f�rence
        iModifi� = True
    End If

End Property


Public Property Get DateCr�ation() As Variant
    
    DateCr�ation = dDateCr�ation

End Property

Public Property Let DateCr�ation(ByVal DateCr�ation As Variant)
    
    dDateCr�ation = DateCr�ation
    iModifi� = True

End Property

Public Property Get DateModification() As Variant
    
    DateModification = dDateModification

End Property

Public Property Let DateModification(ByVal DateModification As Variant)
    
    dDateModification = DateModification
    iModifi� = True

End Property


Public Property Get Commentaire() As String
    
    Commentaire = chCommentaire

End Property

Public Property Let Commentaire(ByVal Commentaire As String)
    
    If chCommentaire <> Commentaire Then
        chCommentaire = Commentaire
        iModifi� = True
    End If

End Property

Public Property Let TitreModule(ByVal TitreModule As String)
    If chTitreModule <> TitreModule Then
        chTitreModule = TitreModule
        iModifi� = True
    End If

End Property

Public Property Get TitreModule() As String
   TitreModule = chTitreModule
End Property

Private Sub Class_Initialize()

    dDateCr�ation = Now
    iNewId = 0
    
End Sub
Public Function AddPersonne(ByVal Nom As String, ByVal Fonction As String) As Personne
 
    colPersonnes.Add Nom, Fonction
    iModifi� = True
    
End Function

Public Property Get PersonnesCount()

    PersonnesCount = colPersonnes.Count
    
End Property
Public Property Get EtapesCount()

    EtapesCount = colEtapes.Count
    
End Property

Public Function PersonneNom(ByVal i As Integer)
    PersonneNom = colPersonnes.Item(i).Nom
End Function
Public Property Get EtapeCommentaire(ByVal i As Variant)
    EtapeCommentaire = colEtapes.Item(i).Commentaire
End Property

Public Property Get EtapeTitre(ByVal i As Variant)
    EtapeTitre = colEtapes.Item(i).Titre
End Property


Public Property Get SujetDangerEtape(ByVal i As Variant)
    SujetDangerEtape = colSujetsDangers.Item(i).Etape
End Property



Public Property Get EtapeId(ByVal i As Variant)
    EtapeId = colEtapes.Item(i).id
End Property


Public Function PersonneFonction(ByVal i As Integer)
    PersonneFonction = colPersonnes.Item(i).Fonction
End Function

Public Property Get DocumentsCount()

    DocumentsCount = colDocuments.Count
    
End Property

Public Property Get DangersCount()

    DangersCount = colDangers.Count
    
End Property


Public Function AddDocument(ByVal Fichier As String, ByVal Titre As String) As Document
 
    Set AddDocument = colDocuments.Add(Fichier, Titre)
    iModifi� = True
    
End Function


Public Function AddDanger(ByVal Danger As Danger, Optional IndexDanger As Variant)
 
    If IsMissing(IndexDanger) Then
        colDangers.Add Danger, Danger.id
    Else
        On Error Resume Next
        colDangers.Add Danger, Danger.id, Before:=IndexDanger
        If Err Then
            colDangers.Add Danger, Danger.id
        End If
        On Error GoTo 0
    End If
    iModifi� = True
    
End Function



Public Function AddSujetDanger(ByVal SujetDanger As SujetDanger, Optional IndexDanger As Variant)
 
    If IsMissing(IndexDanger) Then
        colSujetsDangers.Add SujetDanger, SujetDanger.id
    Else
        On Error Resume Next
        colSujetsDangers.Add SujetDanger, SujetDanger.id, Before:=IndexDanger
        If Err Then
            colSujetsDangers.Add SujetDanger, SujetDanger.id
        End If
        On Error GoTo 0
    End If
    iModifi� = True
    
End Function




Public Function DocumentFichier(ByVal i As Integer)
    DocumentFichier = colDocuments.Item(i).Fichier
End Function
Public Function DocumentTitre(ByVal i As Integer)
    DocumentTitre = colDocuments.Item(i).Titre
End Function

Public Sub PersonnesClear()

    While colPersonnes.Count
         colPersonnes.Delete 1
    Wend
    iModifi� = True

End Sub

Public Sub DocumentsClear()

    While colDocuments.Count
         colDocuments.Delete 1
    Wend
    iModifi� = True

End Sub

Public Property Get LectureSeule() As Integer
    LectureSeule = iLectureSeule
End Property
Public Property Get IndexAffichage() As Integer
    IndexAffichage = iIndexAffichage
End Property

Public Property Let LectureSeule(ByVal LectureSeule As Integer)
    If LectureSeule <> False Then
        LectureSeule = True
    End If
    If iLectureSeule <> LectureSeule Then
        iLectureSeule = LectureSeule
        iModifi� = True
    End If
End Property
Public Property Let IndexAffichage(ByVal IndexAffichage As Integer)
    iIndexAffichage = IndexAffichage
End Property

Public Property Get NiveauMaxiCopie() As Integer
    NiveauMaxiCopie = iNiveauMaxiCopie
End Property
Public Property Get Verrouill�() As Integer
    Verrouill� = iVerrouill�
End Property

Public Property Let NiveauMaxiCopie(ByVal Niveau As Integer)
    If iNiveauMaxiCopie <> Niveau Then
        iNiveauMaxiCopie = Niveau
        iModifi� = True
    End If
End Property

Public Property Let Verrouill�(ByVal Verrouill� As Integer)
    If Verrouill� <> False Then
        Verrouill� = True
    End If
    If iVerrouill� <> Verrouill� Then
        iVerrouill� = Verrouill�
        iModifi� = True
    End If
End Property



Private Sub SVariantPut(ByVal stream As Object, ByVal Info As Variant)

Dim vInfo As Variant

    If Info = "" Then
        vInfo = "~#"
    Else
        vInfo = Info
    End If
    stream.VariantPut STG_SEEK_DONTMOVE, vInfo

End Sub


