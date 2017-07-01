VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "InfoAnalyse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe InfoAnalyse
' Modélise le corps d'une analyse (partie labo)
' 4/09/97 PV

Option Explicit

' Propriétés
Public sCritère As String           ' Critère utilisé
Public iVerCrit As Integer
Public sTitreCritère As String
Public iNbGerCritère As Integer     ' Attention, pas forcément égal à cGermes.count !

Public iIndiceEch As Long           ' Sérial dans la table seriedetail
Public iNumSérie                    ' N° de la série de rattachement
Public iNumEch                      ' N° d'échantillon dans la série
Public sCodeBarre                   ' Code barre scanné
Public sCritèreInfo                 ' Critère du fichier produit
Public sEtatEch                     ' Etat de l'échantillon (codes ?)
Public tsValEch                     ' timestamp de validation
Public iTraitéPar                   ' ?
Public sMMéthode                    ' MétaMéthode appliquée
Public sOptionsLabo                 ' Options labo
Public bIE                          ' Vaut "O" (lettre o majuscule) si IE
Public bFax                         ' Vaut "O" (lettre o majuscule) si les résultats doivent être transmis par fax
Public sRemarques                   ' Remarques labo, le texte après un ! s'imprime sur le CRA client

Public cGermes As GermesRecherchés    ' Liste des germes recherchés

