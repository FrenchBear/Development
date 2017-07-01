Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des r�f�rences documentaires
' 18/06/1999 NC
'  7/07/1999 PV sSourceODBCD�faut
' 11/08/1999 PV sbMessage int�gr� � bdS�l
' 21/01/2001 PV colm�moirerefDoc


Option Explicit

Public Const sSourceODBCD�fautD�faut = ""


' M�morisation des champs (m�canisme F5)
Public colM�moireRefDoc As New Collection


Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIRefDoc.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIRefDoc.ActiveForm.bdS�l.Message = sMessage
  MDIRefDoc.ActiveForm.bdS�l.RefreshMessage
End Sub



Public Sub InitTra�abilit�(colChamps As Collection, sPr�fixe As String, bCr�ation As Boolean)
  ' Tra�abilit� ancien style
  If bCr�ation Then
    colChamps(sPr�fixe & "_datecreat") = Today
    colChamps(sPr�fixe & "_heurecreat") = 100 * Hour(Now) + Minute(Now)
    colChamps(sPr�fixe & "_opercreat") = iNumOp�rateur
  End If

  colChamps(sPr�fixe & "_datemodif") = Today
  colChamps(sPr�fixe & "_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps(sPr�fixe & "_opermodif") = iNumOp�rateur
End Sub



' Lit un serial dans une table g�n�ratrice serialxxx
Public Function iGetSerial(sCodeTable As String) As Long
  RunSQL "insert into serial" & sCodeTable & " values(0)"
  Dim iSerial As Long
  iSerial = BDCurseurExpress("select max(serial" & sCodeTable & ") from serial" & sCodeTable)
  RunSQL "delete from serial" & sCodeTable & " where serial" & sCodeTable & "<" & iSerial
  iGetSerial = iSerial
End Function

