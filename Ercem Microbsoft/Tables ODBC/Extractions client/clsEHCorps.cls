VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "EHCorps"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe EHCorps
' Corps+Scénario+visite des EH Silliker
' 17/12/01 PV

Option Explicit

Public cg_numloc As String    ' N° local = n° Carrefour (+/- pour des items quantité)
Public cg_serie As Long       ' Identifiant universel unique d'item

Public cot_decote             ' Décote prévue au scénario
Public cot_options            ' Options prévues au scénario
Public cot_format             ' Format de saisie prévu au scénario

Public ec_valeur              ' Valeur saisie dans la cellule
Public ec_decote              ' Décote réellement obtenue en 1/10è de points
Public ec_format              ' Format utilisé lors de la saisie
Public ec_options             ' Options utilisées lors de la saisie

Public ec_systeme             ' Clé-Système des observations
Public ec_obs                 ' N° (interne) des obs

Public ec_texteobs            ' Texte des observations, LS et renvois résolus
