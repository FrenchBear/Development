VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GermeRecherch�"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Mod�lise un germe recherch� lors d'une analyse, et la liste des bo�tes associ�e"
' classe GermeRecherch�
' Mod�lise un germe recherch� lors d'une analyse, et la liste des bo�tes associ�e
' Fusion des infos de la biblio libcra et de serieboite
'  4/09/97 PV
' 12/11/97 PV Dans sAbr�g�Labo, cas o� LireGerme retourne nothing (provoque une erreur 91)
' 23/12/97 PV M�thode SetR�sultatD�faut centralis�e ici
' 22/06/99 PV R�sultats par d�faut uniquement sur Fontaine
' 29/11/00 PV cStatusModif
'  5/12/00 PV Prix et devise
' 12/11/01 FG Fin des r�sultats par d�faut ASR sur Fontaine
' 11/12/01 FG R�sultat "EN COURS" non traduit dans la BD - traduction uniquement � l'affichage


Option Explicit

' Germe
Public iGerme As Integer
Public sUnit� As String
Public m                          ' Peut contenir ABSENCE
Public s
Public sM�thode As String

' R�sultat - interpr�tation
Public sR�sultat As String
Public iCPar                      ' Interpr�tation partielle, null si pas interpr�t�
Public cSp�cifCli As String       ' Interpr�tation sp�cifique client
Public dDateFinAn                 ' Date de fin d'analyse. Utilis� pour la bact�rio ?
Public cEtatLabo                  ' cEtatLabo. Valeurs � pr�ciser
Public iOperSais                  ' R�le � pr�ciser
Public dDateSais
Public iOperVal
Public dDateVal
Public sSensibilit� As String     ' Codage abstrait

' Facturation
Public dPrix
Public cDevise As String

' Rab pour la biblioth�que
Public hLigne

' Timestamp interne
Public timestamp

' Flag pour rep�rer les germes issus d'un crit�re, � ne pas modifier
Public bOrigineCrit�re As Boolean
Public bGermeModifi� As Boolean   ' Modification quelconque du germe

' Bo�tes
Public cBo�tes As New Bo�tes      ' Collection de bo�tes associ�e


Public Function Add(boi_milieu As Integer, boi_dilution As Integer, boi_quantite As Variant, boi_facteur As Long, boi_numboite As Integer, boi_typemarquage As Integer, boi_typeboite As Integer, boi_legende As String) As Bo�te
  Set Add = cBo�tes.Add(boi_milieu, boi_dilution, boi_quantite, boi_facteur, boi_numboite, boi_typemarquage, boi_typeboite, boi_legende)
End Function

Public Function AddBo�te(b As Bo�te) As Bo�te
  Set AddBo�te = cBo�tes.AddBo�te(b)
End Function


' Simplifie l'affichage de l'abr�g� labo
Public Property Get sAbr�g�Labo() As String
  Dim g As Germe
  Set g = LireGerme(iGerme)
  If g Is Nothing Then
    MsgBox "GermeRecherch�::sAbr�g�Labo  LireGerme(" & iGerme & ") -> nothing !" & vbCrLf & "Pr�venez la DI (cache incomplet)", vbExclamation, sNomApp
    sAbr�g�Labo = ""
  Else
    sAbr�g�Labo = g.ger_abregelabo
  End If
End Property


' Status du germe: vide=germe issu du crit�re, + germe ajout�, M germe modifi�
Public Property Get cStatus() As String
  If bOrigineCrit�re Then
    If bGermeModifi� Then
      cStatus = "M"
    Else
      cStatus = " "
    End If
  Else
    cStatus = "+"
  End If
End Property


' Initialise les r�sultats par d�faut
Public Sub SetR�sultatD�faut()
  'sR�sultat = sGetIntlLib("CO098", "EN COURS")
  sR�sultat = "EN COURS"
  cEtatLabo = ""
  ' Attention, l'exception suivante ne s'applique qu'� Fontaine (R=microbe)
  'If cSyst�meCA = "R" And ((iGerme = 6 Or iGerme = 69 Or iGerme = 23) And IsNumeric(s)) Then
    'sR�sultat = sFormateR�sultat("<" & s)
    'cEtatLabo = "0"
  'End If
  If iGerme >= 900 And iGerme < 1000 Then
    sR�sultat = "-"
  End If
End Sub
