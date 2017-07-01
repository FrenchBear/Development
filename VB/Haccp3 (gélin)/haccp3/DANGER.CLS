VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Danger"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet danger

'un danger est
'- une clé
'- une nature
'- une spécificité
'- un indicateur de pertinence
'- une collection de documents associés

'propriétés
Private chId As String
Private chNature As String
Private chSpécificité As String
Private chPertinence As String
Public colDocuments As New Documents


Function MiniCopy() As Danger

Dim Copie As New Danger

    'l'id reste vide
    Copie.Nature = chNature
    Copie.Spécificité = chSpécificité
    Copie.Pertinence = chPertinence
    Set Copie.Documents = colDocuments.Copy
    
    Set MiniCopy = Copie

End Function




Public Property Get Documents() As Documents

    Set Documents = colDocuments

End Property



Public Property Set Documents(Documents As Documents)

    Set colDocuments = Documents

End Property




Sub MiniPaste(ByVal Danger As Danger)

    'l'id reste vide
    chNature = Danger.Nature
    chSpécificité = Danger.Spécificité
    chPertinence = Danger.Pertinence
    Set colDocuments = Danger.Documents
    
End Sub




Private Function SVariantGet(ByVal stream As Object) As Variant

Dim vInfo As Variant

    stream.VariantGet STG_SEEK_DONTMOVE, vInfo
    If vInfo = "~#" Then
        SVariantGet = ""
    Else
        SVariantGet = vInfo
    End If

End Function



Private Sub SVariantPut(ByVal stream As Object, ByVal Info As Variant)

Dim vInfo As Variant

    If Info = "" Then
        vInfo = "~#"
    Else
        vInfo = Info
    End If
    stream.VariantPut STG_SEEK_DONTMOVE, vInfo

End Sub


Public Sub Save(ByVal stream As Object)

Dim chInfo As String

    chInfo = chId
    stream.PutString chInfo, VarType(chInfo), False
    
    SVariantPut stream, chNature
    
    SVariantPut stream, chSpécificité
    
    chInfo = chPertinence
    stream.PutString chInfo, VarType(chInfo), False
    
    'documents
    colDocuments.Save stream
        
    stream.Flush STG_DEFAULT

End Sub





Public Sub Load(ByVal stream As Object)

Dim chInfo As String
Dim i As Integer
Dim n As Integer

    stream.GetString chId
    chNature = SVariantGet(stream)
    chSpécificité = SVariantGet(stream)
    stream.GetString chPertinence
    
    'documents
    stream.GetString chInfo
    n = Val(chInfo)
    Dim NewDocument As Document
    colDocuments.clear
    For i = 1 To n
        Set NewDocument = New Document
        NewDocument.Load stream
        Me.AddDocument NewDocument.Fichier, NewDocument.Titre
    Next
        
End Sub


Public Property Get id() As String
    
    id = chId

End Property




Public Property Let id(ByVal id As String)

    chId = id

End Property



Public Property Let Pertinence(ByVal Pertinence As String)

    chPertinence = Pertinence

End Property




Public Property Get Nature() As String
    
    Nature = chNature

End Property



Public Property Let Spécificité(ByVal Spécificité As String)

    chSpécificité = Spécificité

End Property



Public Property Get Pertinence() As String
    
    Pertinence = chPertinence

End Property



Public Property Get Spécificité() As String
    
    Spécificité = chSpécificité

End Property



Public Property Let Nature(ByVal Nature As String)

    chNature = Nature

End Property


Public Sub DocumentsClear()

    If Not colDocuments Is Nothing Then
        While colDocuments.Count
             colDocuments.Delete 1
        Wend
    End If

End Sub

Public Property Get DocumentsCount()

    If colDocuments Is Nothing Then
        DocumentsCount = 0
    Else
        DocumentsCount = colDocuments.Count
    End If
    
End Property

Public Function DocumentFichier(ByVal i As Integer)
    DocumentFichier = colDocuments.Item(i).Fichier
End Function

Public Function DocumentTitre(ByVal i As Integer)
    DocumentTitre = colDocuments.Item(i).Titre
End Function

Public Function AddDocument(ByVal Fichier As String, ByVal Titre As String) As Document
 
    Set AddDocument = colDocuments.Add(Fichier, Titre)
    
End Function

