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
' Mod�lise le corps d'une analyse (partie labo)
' 4/09/97 PV

Option Explicit

' Propri�t�s
Public sCrit�re As String           ' Crit�re utilis�
Public iVerCrit As Integer
Public sTitreCrit�re As String
Public iNbGerCrit�re As Integer     ' Attention, pas forc�ment �gal � cGermes.count !

Public iIndiceEch As Long           ' S�rial dans la table seriedetail
Public iNumS�rie                    ' N� de la s�rie de rattachement
Public iNumEch                      ' N� d'�chantillon dans la s�rie
Public sCodeBarre                   ' Code barre scann�
Public sCrit�reInfo                 ' Crit�re du fichier produit
Public sEtatEch                     ' Etat de l'�chantillon (codes ?)
Public tsValEch                     ' timestamp de validation
Public iTrait�Par                   ' ?
Public sMM�thode                    ' M�taM�thode appliqu�e
Public sOptionsLabo                 ' Options labo
Public bIE                          ' Vaut "O" (lettre o majuscule) si IE
Public bFax                         ' Vaut "O" (lettre o majuscule) si les r�sultats doivent �tre transmis par fax
Public sRemarques                   ' Remarques labo, le texte apr�s un ! s'imprime sur le CRA client

Public cGermes As GermesRecherch�s    ' Liste des germes recherch�s

