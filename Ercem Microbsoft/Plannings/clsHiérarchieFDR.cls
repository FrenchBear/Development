VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Hi�rarchieFDR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe hi�rarchieFDR
' Utilis� pour construire la hi�rarchie des feuilles de route lors de l'impression du planning
' 29/10/00 PV

Option Explicit

Public sTitre As String             ' Secteur nn: xxx   ou   Direction r�gionale nn: xx  ou  ...
Public sEtbsConcern�s As String     ' Liste des �tablissements rattach�s
Public sFDR As String               ' Texte de la feuille de route
Public iParent As Long              ' N� de structure client sup�rieur
