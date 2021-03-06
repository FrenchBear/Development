VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "EtapeDanger"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet donn�e

'une donn�e est
'- une cl� (utilis�e uniquement pour les sujets)
'- un Titre
'- un commentaire
'- une collection de donn�es enfants
'- un �tat de criticit� (utilis� seulement pour les donn�es de niveau Points � maitriser et mesures pr�ventives)

'propri�t�s
Private iId As Integer
Private chTitre As String
Private chCommentaire As String
Private colEnfants As New Collection
Private bCritique As Integer

Public Function AddEnfant(ByVal Titre As String, ByVal Commentaire As String) As Donnee

    AddEnfant = colEnfants.Add(Titre, Commentaire)
    
End Function



Public Sub EnfantsClear()

   While colEnfants.Count
         colEnfants.Delete 1
   Wend

End Sub





Public Property Get Titre() As String
    
    Titre = chTitre

End Property



Public Property Let Commentaire(ByVal Commentaire As String)

    chCommentaire = Commentaire

End Property



Public Property Get Commentaire() As String
    
    Commentaire = chCommentaire

End Property



Public Property Let Titre(ByVal Titre As String)

    chTitre = Titre

End Property


