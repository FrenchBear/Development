Attribute VB_Name = "modGlobal"
Option Explicit

Public Const sSourceODBCDéfautDéfaut = "serveur"

'Global sVersionApp As String
'
'Public iNumOpérateur As Integer         ' N° de l'utilisateur courant
'Public uOpérateur As Utilisateur        ' Utilisateur courant
'Public sNomOpérateur As String          ' Nom de l'utilisateur
'
'Public cSystèmeCA As String             ' Lettre du système Unix qui héberge la base de données
'Public cSystèmeLang As String           ' Langue du système (défaut)
'Public cSystèmeProprio As String        ' Code proprio du système (défaut)
'Public iSystèmePays As Integer          ' Code pays du système (défaut)
'
'Public dMaxUtilisateur As Date          ' Max du timestamp utilisateur (sysinfo.si_mtu)
'
'Public bLectureSeule As Boolean         ' Mécanisme lectuere seule (facultatif)
'
'
'' Infos système
'Public g_SysInfo As SysInfo



Public Sub SetStatus(Optional ByVal sMessage As String = "")
'  MDIServeur.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
'  MDIServeur.ActiveForm.bdSél.Message = sMessage
'  MDIServeur.ActiveForm.bdSél.RefreshMessage
End Sub

