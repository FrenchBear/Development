Attribute VB_Name = "GlobalGDoc"
Attribute VB_Description = "Déclarations globales du programme de saisie des CRA"
' module GlobalGDoc
' Déclarations globales du programme de saisie des CRA
'  1/02/1999 PV
'  9/02/1999 PV RTrimCrLf

Option Explicit

Public Const sApplicationGlobale = "Microb'Soft GDOCW"            ' Sommet de la registry

Public Const sDémon = "gdocd"
Public Const sPréfixeAideDéfaut As String = "http://www.silliker/microbsoft/labo/gdocw/"

' Options globales
Public bAfficherMenuSystème As Boolean          ' Affichage du menu spécial
Public bAfficherBarreDeBoutons As Boolean       ' Affichage de la barre de boutons
Public bAfficherEtiquettesDeBoutons As Boolean  ' Affichage de la dégende des boutons
Public bMasquerBloqué                           ' Masque le cadenas sur les machines les plus lentes

' Identification du protocole
Public Const iPortDémon = 6325                  ' Démon gdocd
Public Const iMinRelease = 0                    ' Niveau minimum de protocole demandé au démon

Public Const dAbsence As Date = #1/1/1980#      ' ABSENCE dans un champ date



'=================================================================================
' Supprime les CrLf en fin de chaîne

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

