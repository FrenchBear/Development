VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ActionSuivante"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Mécanisme générique de protection contre les problèmes de ré-entrance, stocke la prochaîne action à exécuter"
' classe ActionSuivante
' Implante un mécanisme générique de protection contre les problèmes de ré-entrance
' consécutifs à l'utilisation du DoEvents dans la bibliothèque TCPSynchrone…
' Cette classe mémorise les informations pour une fonction à rappeller
' voir modActionSuivante pour les commentaires
' 27/10/97 PV

Option Explicit

Public f As Form            ' Feuille contenant le code
Public sProc As String      ' Nom de la fonction à exécuter

