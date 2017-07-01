VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "EHDefGrille"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' EHGrille
' Implémente une grille d'EH
' 05/02/1999 PV

Option Explicit

Public iNumGrille As Integer            ' n° de la grille
Public iNumScénario As Integer      ' n° du scénario
Public sTitre1 As String            ' 1ère ligne de titre
Public sTitre2 As String            ' 2ème ligne de titre

Public sTitreScénario As String     ' Titre du scénario
Public sOptionsScénario As String   ' Options par défaut
Public iFormatScénario As Integer   ' Format par défaut (jamais à NULL)

Public colItems As New Collection   ' Collection des items

