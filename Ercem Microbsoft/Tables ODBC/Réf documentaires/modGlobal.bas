Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des références documentaires
' 18/06/1999 NC
'  7/07/1999 PV sSourceODBCDéfaut
' 11/08/1999 PV sbMessage intégré à bdSél
' 21/01/2001 PV colmémoirerefDoc


Option Explicit

Public Const sSourceODBCDéfautDéfaut = ""


' Mémorisation des champs (mécanisme F5)
Public colMémoireRefDoc As New Collection


Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIRefDoc.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIRefDoc.ActiveForm.bdSél.Message = sMessage
  MDIRefDoc.ActiveForm.bdSél.RefreshMessage
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

