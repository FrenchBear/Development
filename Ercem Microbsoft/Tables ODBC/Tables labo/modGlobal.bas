Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables labo
' 13/02/1998 PV
' 16/07/1998 PV Identification de l'op�rateur et du syst�me Unix
' 11/08/1998 PV Fin de App.ExeName (--> App.ExeName)
'  7/07/1999 PV sSourceODBCD�faut
' 11/08/1999 PV sbMessage int�gr� � bdS�l
' 28/07/2001 PV InitTra�abilit� pour les param�tres


Option Explicit

Public Const sSourceODBCD�fautD�faut = "labo"


' M�morisation des champs (m�canisme F5)
Public colM�moireGerme As New Collection


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



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDILabo.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDILabo.ActiveForm.bdS�l.Message = sMessage
  MDILabo.ActiveForm.bdS�l.RefreshMessage
End Sub

