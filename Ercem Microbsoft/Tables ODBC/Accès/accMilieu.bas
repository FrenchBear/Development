Attribute VB_Name = "accMilieu"
' accMilieu
' Accès aux milieux
' Suppose que les codes de milieux sont uniques Maj/min indifférent, ce qui
' n'est pas contrôlé dans le programme de saisie
' 20/08/1998 PV

Option Explicit

Public colMilieu As New Collection

Sub ChargeMilieux()
  EffaceCollection colMilieu
  
  Dim cMil As New BDCurseur
  Dim m As New Milieu
  
  cMil.OpenCurseur "select mil_indice,mil_abrege,mil_libelle from milieu order by mil_abrege"
  While Not cMil.EOF
    m.mil_indice = cMil!mil_indice
    m.mil_abrege = cMil!mil_abrege
    m.mil_libelle = cMil!mil_libelle
    colMilieu.Add m.Copie, UCase(m.mil_abrege)
    cMil.MoveNext
  Wend
  cMil.CloseCurseur
End Sub


' Retourne un n° de milieu à partir de son code.
' Retourne 0 si le milieu n'existe pas
Function iIndiceMilieu(ByVal sAbrégé As String) As Integer
  Dim iIndice As Integer
  On Error Resume Next
  iIndice = colMilieu(UCase(sAbrégé)).mil_indice
  If Err Then iIndice = 0
  On Error GoTo 0
  iIndiceMilieu = iIndice
End Function

' Retourne l'abrégé d'un milieu à partir de son indice
' Si l'indice est incorrect, retourne une chaîne vide
Function sAbrégéMilieu(ByVal iIndice As Integer) As String
  Dim m As Milieu
  For Each m In colMilieu
    If m.mil_indice = iIndice Then
      sAbrégéMilieu = m.mil_abrege
      Exit For
    End If
  Next
End Function
