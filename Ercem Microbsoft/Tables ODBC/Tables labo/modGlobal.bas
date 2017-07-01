Attribute VB_Name = "modGlobal"
' modGlobal
' Gestion des tables labo
' 13/02/1998 PV
' 16/07/1998 PV Identification de l'opérateur et du système Unix
' 11/08/1998 PV Fin de App.ExeName (--> App.ExeName)
'  7/07/1999 PV sSourceODBCDéfaut
' 11/08/1999 PV sbMessage intégré à bdSél
' 28/07/2001 PV InitTraçabilité pour les paramètres


Option Explicit

Public Const sSourceODBCDéfautDéfaut = "labo"


' Mémorisation des champs (mécanisme F5)
Public colMémoireGerme As New Collection


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



Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDILabo.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDILabo.ActiveForm.bdSél.Message = sMessage
  MDILabo.ActiveForm.bdSél.RefreshMessage
End Sub

