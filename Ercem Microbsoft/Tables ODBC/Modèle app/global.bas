Attribute VB_Name = "modGlobal"
Option Explicit

Public Const sSourceODBCD�fautD�faut = "serveur"

'Global sVersionApp As String
'
'Public iNumOp�rateur As Integer         ' N� de l'utilisateur courant
'Public uOp�rateur As Utilisateur        ' Utilisateur courant
'Public sNomOp�rateur As String          ' Nom de l'utilisateur
'
'Public cSyst�meCA As String             ' Lettre du syst�me Unix qui h�berge la base de donn�es
'Public cSyst�meLang As String           ' Langue du syst�me (d�faut)
'Public cSyst�meProprio As String        ' Code proprio du syst�me (d�faut)
'Public iSyst�mePays As Integer          ' Code pays du syst�me (d�faut)
'
'Public dMaxUtilisateur As Date          ' Max du timestamp utilisateur (sysinfo.si_mtu)
'
'Public bLectureSeule As Boolean         ' M�canisme lectuere seule (facultatif)
'
'
'' Infos syst�me
'Public g_SysInfo As SysInfo



Public Sub SetStatus(Optional ByVal sMessage As String = "")
'  MDIServeur.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
'  MDIServeur.ActiveForm.bdS�l.Message = sMessage
'  MDIServeur.ActiveForm.bdS�l.RefreshMessage
End Sub

