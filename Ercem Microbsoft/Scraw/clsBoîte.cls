VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Boîte"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise une boîte de pétri"
' Classe boîte
' Modélise une boîte de pétri
' Fusion des infos de la table dilution et la tablie serieboite
'  6/09/1997 PV
' 05/02/2000 PV  SetBoîteVide


Option Explicit

Public boi_milieu As Integer       ' N° de la gélose
Public boi_dilution As Integer     ' Puissance de 10 de la dilution
Public boi_quantite                ' Quatité à déposer en 1/10è de ml
Public boi_facteur As Long         ' Facteur multiplicateur pour exprimer le résultat
Public boi_numboite As Integer     ' Permet d'avoir plusieurs boîtes pour une même dilution pour une gélose donnée
Public boi_typemarquage As Integer ' Type de marquage de l'étiquette (0:sur bte vide, 1:sur bte préremplie en BP, 4:pas marquée)
Public boi_typeboite As Integer    ' Type de remplissage de la gélose
Public boi_legende As String       ' Légende de la boîte
Public boi_etatboite As String     ' ? char(1)
Public boi_idboite As String       ' ? char(1)
Public boi_tslecture               ' Timestamp de lecture
Public boi_operlecture             ' Code de la technicienne ayant effectué la lecture
Public boi_denombrement            ' Résultat du dénombrement


' Efface une boîte qui serait mémorisée d'une analyse précédente puis copiée
' avec le mécanisme "F5 analyse"
Public Sub SetBoîteVide()
  boi_tslecture = Null
  boi_operlecture = Null
  boi_denombrement = Null
End Sub
