Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables Serveur
' 10/05/1999 PV
' 15/06/1999 PV Valeurs par d�faut (constantes)
' 22/06/1999 PV Valeurs par d�faut (variables lues � partir de la base de donn�es)
'  7/07/1999 PV sSourceODBCD�faut; collections m�moire publiques
' 11/08/1999 PV sbMessage int�gr� � bdS�l
' 23/08/1999 PV sNormaliseNom
' 21/10/1999 PV bTableNbex
' 19/11/1999 PV bAdminServeur
' 29/09/2000 PV Fin de bTableNbex
'  8/08/2001 PV Chien de garde


Option Explicit

Public Const sSourceODBCD�fautD�faut = ""

Public bDebug As Boolean

' M�morisation des champs (m�canisme F5)
Public colM�moireEtablissement As New Collection
Public colM�moireSecteur As New Collection
Public colM�moireDirReg As New Collection
Public colM�moireDirNat As New Collection
Public colM�moireProduit As New Collection


' Chien de garde
Public tM�dor As Single


' Droits d'acc�s
Public bAdminServeur As Boolean        ' Vrai pour di et droits&64


' Colonnes de gestion des tarifs
Public Const colSerial = 0
Public Const ColIndex = 1
Public Const colNiveau = 2
Public Const colOption = 3
Public Const colOptionClair = 4
Public Const colPrix = 5
Public Const colDevise = 6
Public Const colRemise = 7
Public Const colComment = 8
Public Const colIdModif = 9
Public Const colTimestamp = 10



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDIServeur.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDIServeur.ActiveForm.bdS�l.Message = sMessage
  MDIServeur.ActiveForm.bdS�l.RefreshMessage
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
  If iSerial < 10 Then  ' S�curit� nouveaux syst�mes
    RunSQL "insert into serial" & sCodeTable & " values(10)"
    iSerial = 10
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


' =================================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  MDIServeur.ResetChienDeGarde
End Sub

