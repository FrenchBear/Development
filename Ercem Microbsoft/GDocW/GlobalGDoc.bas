Attribute VB_Name = "GlobalGDoc"
Attribute VB_Description = "D�clarations globales du programme de saisie des CRA"
' module GlobalGDoc
' D�clarations globales du programme de saisie des CRA
'  1/02/1999 PV
'  9/02/1999 PV RTrimCrLf

Option Explicit

Public Const sApplicationGlobale = "Microb'Soft GDOCW"            ' Sommet de la registry

Public Const sD�mon = "gdocd"
Public Const sPr�fixeAideD�faut As String = "http://www.silliker/microbsoft/labo/gdocw/"

' Options globales
Public bAfficherMenuSyst�me As Boolean          ' Affichage du menu sp�cial
Public bAfficherBarreDeBoutons As Boolean       ' Affichage de la barre de boutons
Public bAfficherEtiquettesDeBoutons As Boolean  ' Affichage de la d�gende des boutons
Public bMasquerBloqu�                           ' Masque le cadenas sur les machines les plus lentes

' Identification du protocole
Public Const iPortD�mon = 6325                  ' D�mon gdocd
Public Const iMinRelease = 0                    ' Niveau minimum de protocole demand� au d�mon

Public Const dAbsence As Date = #1/1/1980#      ' ABSENCE dans un champ date



'=================================================================================
' Supprime les CrLf en fin de cha�ne

Function RTrimCrLf(ByVal c As String) As String
  Do
    If Right(c, 1) = " " Then
      c = RTrim(c)
    ElseIf Right(c, 2) = vbCrLf Then
      c = Left(c, Len(c) - 2)
    Else
      Exit Do
    End If
  Loop
  RTrimCrLf = c
End Function

