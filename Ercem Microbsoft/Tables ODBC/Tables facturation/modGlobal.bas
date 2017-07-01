Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables facturation
' 10/05/1999 PV
' 15/06/1999 PV Valeurs par d�faut (constantes)
' 22/06/1999 PV Valeurs par d�faut (variables lues � partir de la base de donn�es)
'  7/07/1999 PV sSourceODBCD�faut; collections m�moire publiques
' 11/08/1999 PV sbMessage int�gr� � bdS�l
' 23/08/1999 PV sNormaliseNom
'  5/09/2000 PV Colonnes de gestion des prix
' 18/12/2001 PV iGetSerial retourne 10 au minimum


Option Explicit

Public Const sSourceODBCD�fautD�faut = ""
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



' M�morisation des champs (m�canisme F5)
Public colM�moireRubfac As New Collection


' Gestion du nombre d'exemplaires, inutile en facturation
Public Const bTableNbEx = False



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIFacturation.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIFacturation.ActiveForm.bdS�l.Message = sMessage
  MDIFacturation.ActiveForm.bdS�l.RefreshMessage
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
  s1 = "����������������������������"
  s2 = "AAAAAACE�EEIIIIDNOOOOOUUUUY�"
  Dim c As String, i As Integer
  For i = 1 To Len(s1)
    sNom = Subst(sNom, Mid(s1, i, 1), Mid(s2, i, 1))
  Next
  
  sNormaliseNom = sNom
End Function
