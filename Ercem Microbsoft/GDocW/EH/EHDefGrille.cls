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
' Impl�mente une grille d'EH
' 05/02/1999 PV

Option Explicit

Public iNumGrille As Integer            ' n� de la grille
Public iNumSc�nario As Integer      ' n� du sc�nario
Public sTitre1 As String            ' 1�re ligne de titre
Public sTitre2 As String            ' 2�me ligne de titre

Public sTitreSc�nario As String     ' Titre du sc�nario
Public sOptionsSc�nario As String   ' Options par d�faut
Public iFormatSc�nario As Integer   ' Format par d�faut (jamais � NULL)

Public colItems As New Collection   ' Collection des items

