VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GermeRecherché"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Modélise un germe recherché lors d'une analyse, et la liste des boîtes associée"
' classe GermeRecherché
' Modélise un germe recherché lors d'une analyse, et la liste des boîtes associée
' Fusion des infos de la biblio libcra et de serieboite
'  4/09/97 PV
' 12/11/97 PV Dans sAbrégéLabo, cas où LireGerme retourne nothing (provoque une erreur 91)
' 23/12/97 PV Méthode SetRésultatDéfaut centralisée ici
' 22/06/99 PV Résultats par défaut uniquement sur Fontaine
' 29/11/00 PV cStatusModif
'  5/12/00 PV Prix et devise
' 12/11/01 FG Fin des résultats par défaut ASR sur Fontaine
' 11/12/01 FG Résultat "EN COURS" non traduit dans la BD - traduction uniquement à l'affichage


Option Explicit

' Germe
Public iGerme As Integer
Public sUnité As String
Public m                          ' Peut contenir ABSENCE
Public s
Public sMéthode As String

' Résultat - interprétation
Public sRésultat As String
Public iCPar                      ' Interprétation partielle, null si pas interprété
Public cSpécifCli As String       ' Interprétation spécifique client
Public dDateFinAn                 ' Date de fin d'analyse. Utilisé pour la bactério ?
Public cEtatLabo                  ' cEtatLabo. Valeurs à préciser
Public iOperSais                  ' Rôle à préciser
Public dDateSais
Public iOperVal
Public dDateVal
Public sSensibilité As String     ' Codage abstrait

' Facturation
Public dPrix
Public cDevise As String

' Rab pour la bibliothèque
Public hLigne

' Timestamp interne
Public timestamp

' Flag pour repérer les germes issus d'un critère, à ne pas modifier
Public bOrigineCritère As Boolean
Public bGermeModifié As Boolean   ' Modification quelconque du germe

' Boîtes
Public cBoîtes As New Boîtes      ' Collection de boîtes associée


Public Function Add(boi_milieu As Integer, boi_dilution As Integer, boi_quantite As Variant, boi_facteur As Long, boi_numboite As Integer, boi_typemarquage As Integer, boi_typeboite As Integer, boi_legende As String) As Boîte
  Set Add = cBoîtes.Add(boi_milieu, boi_dilution, boi_quantite, boi_facteur, boi_numboite, boi_typemarquage, boi_typeboite, boi_legende)
End Function

Public Function AddBoîte(b As Boîte) As Boîte
  Set AddBoîte = cBoîtes.AddBoîte(b)
End Function


' Simplifie l'affichage de l'abrégé labo
Public Property Get sAbrégéLabo() As String
  Dim g As Germe
  Set g = LireGerme(iGerme)
  If g Is Nothing Then
    MsgBox "GermeRecherché::sAbrégéLabo  LireGerme(" & iGerme & ") -> nothing !" & vbCrLf & "Prévenez la DI (cache incomplet)", vbExclamation, sNomApp
    sAbrégéLabo = ""
  Else
    sAbrégéLabo = g.ger_abregelabo
  End If
End Property


' Status du germe: vide=germe issu du critère, + germe ajouté, M germe modifié
Public Property Get cStatus() As String
  If bOrigineCritère Then
    If bGermeModifié Then
      cStatus = "M"
    Else
      cStatus = " "
    End If
  Else
    cStatus = "+"
  End If
End Property


' Initialise les résultats par défaut
Public Sub SetRésultatDéfaut()
  'sRésultat = sGetIntlLib("CO098", "EN COURS")
  sRésultat = "EN COURS"
  cEtatLabo = ""
  ' Attention, l'exception suivante ne s'applique qu'à Fontaine (R=microbe)
  'If cSystèmeCA = "R" And ((iGerme = 6 Or iGerme = 69 Or iGerme = 23) And IsNumeric(s)) Then
    'sRésultat = sFormateRésultat("<" & s)
    'cEtatLabo = "0"
  'End If
  If iGerme >= 900 And iGerme < 1000 Then
    sRésultat = "-"
  End If
End Sub
