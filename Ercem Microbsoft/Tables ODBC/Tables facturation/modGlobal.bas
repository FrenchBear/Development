Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables facturation
' 10/05/1999 PV
' 15/06/1999 PV Valeurs par défaut (constantes)
' 22/06/1999 PV Valeurs par défaut (variables lues à partir de la base de données)
'  7/07/1999 PV sSourceODBCDéfaut; collections mémoire publiques
' 11/08/1999 PV sbMessage intégré à bdSél
' 23/08/1999 PV sNormaliseNom
'  5/09/2000 PV Colonnes de gestion des prix
' 18/12/2001 PV iGetSerial retourne 10 au minimum


Option Explicit

Public Const sSourceODBCDéfautDéfaut = ""
Public bDebug As Boolean


' Colonnes de gestion des tarifs
Public Const ColIndex = 0
Public Const colNiveau = 1
Public Const colOption = 2
Public Const colPrix = 3
Public Const colDevise = 4
Public Const colRemise = 5
Public Const colComment = 6
Public Const colIdModif = 7
Public Const colTimestamp = 8



' Mémorisation des champs (mécanisme F5)
Public colMémoireRubfac As New Collection


' Gestion du nombre d'exemplaires, inutile en facturation
Public Const bTableNbEx = False



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIFacturation.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIFacturation.ActiveForm.bdSél.Message = sMessage
  MDIFacturation.ActiveForm.bdSél.RefreshMessage
End Sub



Public Sub InitTraçabilité(colChamps As Collection, sPréfixe As String, bCréation As Boolean)
  ' Traçabilité ancien style
  If bCréation Then
    colChamps(sPréfixe & "_datecreat") = Today
    colChamps(sPréfixe & "_heurecreat") = 100 * Hour(Now) + Minute(Now)
    colChamps(sPréfixe & "_opercreat") = iNumOpérateur
  End If
  
  colChamps(sPréfixe & "_datemodif") = Today
  colChamps(sPréfixe & "_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps(sPréfixe & "_opermodif") = iNumOpérateur
End Sub



' Lit un serial dans une table génératrice serialxxx
' Valeur 10 minimum
Public Function iGetSerial(sCodeTable As String) As Long
  RunSQL "insert into serial" & sCodeTable & " values(0)"
  Dim iSerial As Long
restart:
  iSerial = BDCurseurExpress("select max(serial" & sCodeTable & ") from serial" & sCodeTable)
  If iSerial < 10 Then
    RunSQL "insert into serial" & sCodeTable & " values(10)"
    GoTo restart
  End If
  RunSQL "delete from serial" & sCodeTable & " where serial" & sCodeTable & "<" & iSerial
  iGetSerial = iSerial
End Function



Public Function sNormaliseNom(ByVal sNom As String) As String
  sNom = UCase(Trim(sNom))
  While InStr(sNom, "  ") <> 0: sNom = Subst(sNom, "  ", " "): Wend
  While InStr(sNom, "( ") <> 0: sNom = Subst(sNom, "( ", "("): Wend
  While InStr(sNom, " )") <> 0: sNom = Subst(sNom, " )", ")"): Wend
  
  Dim s1 As String, s2 As String
  s1 = "ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖÙÚÛÜÝß"
  s2 = "AAAAAACEÉEEIIIIDNOOOOOUUUUYß"
  Dim c As String, i As Integer
  For i = 1 To Len(s1)
    sNom = Subst(sNom, Mid(s1, i, 1), Mid(s2, i, 1))
  Next
  
  sNormaliseNom = sNom
End Function
