VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Bo�te"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Mod�lise une bo�te de p�tri"
' Classe bo�te
' Mod�lise une bo�te de p�tri
' Fusion des infos de la table dilution et la tablie serieboite
'  6/09/1997 PV
' 05/02/2000 PV  SetBo�teVide


Option Explicit

Public boi_milieu As Integer       ' N� de la g�lose
Public boi_dilution As Integer     ' Puissance de 10 de la dilution
Public boi_quantite                ' Quatit� � d�poser en 1/10� de ml
Public boi_facteur As Long         ' Facteur multiplicateur pour exprimer le r�sultat
Public boi_numboite As Integer     ' Permet d'avoir plusieurs bo�tes pour une m�me dilution pour une g�lose donn�e
Public boi_typemarquage As Integer ' Type de marquage de l'�tiquette (0:sur bte vide, 1:sur bte pr�remplie en BP, 4:pas marqu�e)
Public boi_typeboite As Integer    ' Type de remplissage de la g�lose
Public boi_legende As String       ' L�gende de la bo�te
Public boi_etatboite As String     ' ? char(1)
Public boi_idboite As String       ' ? char(1)
Public boi_tslecture               ' Timestamp de lecture
Public boi_operlecture             ' Code de la technicienne ayant effectu� la lecture
Public boi_denombrement            ' R�sultat du d�nombrement


' Efface une bo�te qui serait m�moris�e d'une analyse pr�c�dente puis copi�e
' avec le m�canisme "F5 analyse"
Public Sub SetBo�teVide()
  boi_tslecture = Null
  boi_operlecture = Null
  boi_denombrement = Null
End Sub
