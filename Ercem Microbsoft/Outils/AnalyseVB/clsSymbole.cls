VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Symbole"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe Symbole
' Gestion d'une table des symboles en VB
' 18/02/1998 PV

Option Explicit

Public sNom As String
Public tsTypeSymbole As eTypeSymbole
Public sTypeBasic As String     ' Type de variable/proc�dure ou classe
Public poPort�e As ePort�e
Public sDefFichier As String    ' Module de d�finition
Public iDefLigne As Long        ' Ligne de d�finition
Public bUtilis� As Boolean      ' Symbole utilis� ?
