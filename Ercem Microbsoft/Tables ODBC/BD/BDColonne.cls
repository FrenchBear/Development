VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BDColonne"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' BDColonne
' Type interne au module BD pour représenter les infos d'une colonne
' 20/01/1998 PV
' 10/05/1999 PV   + sDescription (issue de doccolonnes)
' 18/05/1999 PV   + bUpShift, iMaxLength
' 24/08/1999 PV   bUpShift --> bForceUpShift
' 20/03/2000 PV   bBoolean


Option Explicit

Public sNom As String             ' Nom de la colonne
Public sDescription As String     ' Dommentaire de doccolonnes
Public bRequired As Boolean       ' Vrai si le champ refuse les NULLs
Public iType As BDColType         ' Code du type de la colonne
Public iSize As Integer           ' Nb d'octets dans la base
Public bForceUpShift As Boolean   ' Force une saisie en majuscules
Public iMaxLength As Integer      ' MaxLength d'origine
Public bBoolean As Boolean        ' Repère les colonnes O/N
