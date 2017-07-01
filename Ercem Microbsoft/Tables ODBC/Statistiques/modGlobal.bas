Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables Serveur
' 10/05/1999 PV
' 15/06/1999 PV Valeurs par défaut (constantes)
' 22/06/1999 PV Valeurs par défaut (variables lues à partir de la base de données)
'  7/07/1999 PV sSourceODBCDéfaut; collections mémoire publiques
' 11/08/1999 PV sbMessage intégré à bdSél
' 23/08/1999 PV sNormaliseNom


Option Explicit

Public Const sSourceODBCDéfautDéfaut = ""
Public bDebug As Boolean


' Mémorisation des champs (mécanisme F5)
Public colMémoireEtablissement As New Collection
Public colMémoireSecteur As New Collection



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIStatistiques.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIStatistiques.ActiveForm.bdSél.Message = sMessage
  MDIStatistiques.ActiveForm.bdSél.RefreshMessage
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
Public Function iGetSerial(sCodeTable As String) As Long
  RunSQL "insert into serial" & sCodeTable & " values(0)"
  Dim iSerial As Long
  iSerial = BDCurseurExpress("select max(serial" & sCodeTable & ") from serial" & sCodeTable)
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
