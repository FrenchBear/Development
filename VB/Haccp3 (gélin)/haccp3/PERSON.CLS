VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Personne"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet personne

'une personne est
'- un nom
'- une fonction

'propriétés
Private chNom As String
Private chFonction As String







Public Property Get Nom() As String
    
    Nom = chNom

End Property



Public Property Let Fonction(ByVal Fonction As String)

    chFonction = Fonction

End Property



Public Property Get Fonction() As String
    
    Fonction = chFonction

End Property



Public Property Let Nom(ByVal Nom As String)

    chNom = Nom

End Property


Public Sub Save(ByVal Stream As Object)

    SVariantPut Stream, chNom
    SVariantPut Stream, chFonction
    Stream.Flush STG_DEFAULT

End Sub


Private Sub SVariantPut(ByVal Stream As Object, ByVal Info As Variant)

Dim vInfo As Variant

    If Info = "" Then
        vInfo = "~#"
    Else
        vInfo = Info
    End If
    Stream.VariantPut STG_SEEK_DONTMOVE, vInfo

End Sub


Public Sub Load(ByVal Stream As Object)
    
    chNom = SVariantGet(Stream)
    chFonction = SVariantGet(Stream)

End Sub



Private Function SVariantGet(ByVal Stream As Object) As Variant

Dim vInfo As Variant

    Stream.VariantGet STG_SEEK_DONTMOVE, vInfo
    If vInfo = "~#" Then
        SVariantGet = ""
    Else
        SVariantGet = vInfo
    End If

End Function



