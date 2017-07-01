VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Document"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet document

'un document est
'- un nom de fichier
'- un titre

'propriétés
Private chFichier As String
Private chTitre As String




Public Sub Save(ByVal stream As Object)

    SVariantPut stream, chFichier
    SVariantPut stream, chTitre
    stream.Flush STG_DEFAULT

End Sub



Private Sub SVariantPut(ByVal stream As Object, ByVal Info As Variant)

Dim vInfo As Variant

    If Info = "" Then
        vInfo = "~#"
    Else
        vInfo = Info
    End If
    stream.VariantPut STG_SEEK_DONTMOVE, vInfo

End Sub



Public Sub Load(ByVal stream As Object)

    chFichier = SVariantGet(stream)
    chTitre = SVariantGet(stream)

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





Public Property Get Fichier() As String
    
    Fichier = chFichier

End Property



Public Property Let Titre(ByVal Titre As String)

    chTitre = Titre

End Property



Public Property Get Titre() As String
    
    Titre = chTitre

End Property



Public Property Let Fichier(ByVal Fichier As String)

    chFichier = Fichier

End Property


