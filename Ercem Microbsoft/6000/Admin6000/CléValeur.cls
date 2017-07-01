VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "CléValeur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise une ligne de résultat d'une commande, sous la forme clé+valeur"
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"ClésValeurs"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
' Classe CléValeur
' Modélise une ligne de résultat d'une commande, sous la forme clé+valeur
' Très simple, sert de base à ClésValeurs
' 28/11/1997 PV

Option Explicit

Public sClé As String
Public sValeur As Variant

