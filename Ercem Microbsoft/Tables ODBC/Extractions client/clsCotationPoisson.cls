VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CotationPoisson"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe CotationPoisson
' Modélise un enregistrement de type 'cotation poisson' pour Carrefour 2002
' 02/01/02 PC

Option Explicit

Public FR  As String              ' indice moindre fraicheur
Public Espèces As String          ' nom de l'espèce
Public Fournisseur As String      ' nom du fournisseur
Public Livr As String             ' date de livraison/réception
Public Pigm As Integer            ' note pigmentation
Public Muc As Integer             ' note mucus peau
Public Corn As Integer            ' note cornée
Public Pupi As Integer            ' note pupille
Public Couleur As Integer         ' note couleur branchie
Public Rig As Integer             ' note rigidité chair


