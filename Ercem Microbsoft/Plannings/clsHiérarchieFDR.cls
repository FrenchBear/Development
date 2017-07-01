VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "HiérarchieFDR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe hiérarchieFDR
' Utilisé pour construire la hiérarchie des feuilles de route lors de l'impression du planning
' 29/10/00 PV

Option Explicit

Public sTitre As String             ' Secteur nn: xxx   ou   Direction régionale nn: xx  ou  ...
Public sEtbsConcernés As String     ' Liste des établissements rattachés
Public sFDR As String               ' Texte de la feuille de route
Public iParent As Long              ' N° de structure client supérieur
