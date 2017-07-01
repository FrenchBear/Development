Attribute VB_Name = "modGlobalODBC"
' modGlobalODBC
' Définitions globales aux applications ODBC Ercem
' 22/06/1999 PV
' 12/08/1999 PV dMaxUtilisateur depuis sysinfo.si_mtu pour optimiser le démarrage
' 18/10/1999 PV IsServeur
'  5/11/1999 PV Options d'impression; IsServeur via la lettre et plus le nom de la source
' 16/06/2000 PV g_SysInfo
' 13/02/2001 PV JournalUnix (trace des opérations générales)
' 21/05/2001 PV Opérations privilégiées
' 29/11/2001 PV DataFieldEx et ValeurContrôle (pour les traces)


Option Explicit

Global sVersionApp As String

Public iNumOpérateur As Integer         ' N° de l'utilisateur courant
Public uOpérateur As Utilisateur        ' Utilisateur courant
Public sNomOpérateur As String          ' Nom de l'utilisateur

Public cSystèmeCA As String             ' Lettre du système Unix qui héberge la base de données
Public cSystèmeLang As String           ' Langue du système (défaut)
Public cSystèmeProprio As String        ' Code proprio du système (défaut)
Public iSystèmePays As Integer          ' Code pays du système (défaut)

Public dMaxUtilisateur As Date          ' Max du timestamp utilisateur (sysinfo.si_mtu)

Public bLectureSeule As Boolean         ' Mécanisme lecture seule (facultatif)


' Infos système
Public g_SysInfo As SysInfo


' Options d'impression
Public bOptionRectoVerso As Boolean     ' Impression RV chaque fois que possible
Public bOptionSansGrisés As Boolean     ' Ne pas utiliser de tramés

Public sImprimanteWindowsDéfaut As String   ' Inutilisé, pour


Private Declare Function SQLDataSources Lib "ODBC32.DLL" (ByVal henv&, ByVal fDirection%, ByVal szDSN$, ByVal cbDSNMax%, pcbDSN%, ByVal szDescription$, ByVal cbDescriptionMax%, pcbDescription%) As Integer
Private Declare Function SQLAllocEnv% Lib "ODBC32.DLL" (env&)
Const SQL_SUCCESS As Long = 0
Const SQL_FETCH_NEXT As Long = 1



Public Const BCChampIndexé = &HFFFF&      ' Couleur de fond d'un champ indexé



Private Sub AjouteSourceSoft(cboDSNList As ComboBox, sNom As String)
'  cboDSNList.AddItem sNom & "*"
End Sub


Public Sub RemplitListeSourcesODBC(cboDSNList As ComboBox, Optional sSourceDéfaut As String = "")
  Dim i As Integer
  Dim sDSNItem As String * 1024
  Dim sDRVItem As String * 1024
  Dim sDSN As String
  Dim sDRV As String
  Dim iDSNLen As Integer
  Dim iDRVLen As Integer
  Dim lHenv As Long         ' Descripteur de l'environnement.

  On Error Resume Next
'  cboDSNList.AddItem "(Aucun)"

  ' Obtient les DSN.
  If SQLAllocEnv(lHenv) <> -1 Then
    Do Until i <> SQL_SUCCESS
      sDSNItem = Space$(1024)
      sDRVItem = Space$(1024)
      i = SQLDataSources(lHenv, SQL_FETCH_NEXT, sDSNItem, 1024, iDSNLen, sDRVItem, 1024, iDRVLen)
      sDSN = Left$(sDSNItem, iDSNLen)
      sDRV = Left$(sDRVItem, iDRVLen)
          
      If sDSN <> Space(iDSNLen) And (InStr(1, sDRV, "Vision", vbTextCompare) <> 0 Or InStr(1, sDRV, "Informix", vbTextCompare) <> 0) Then
        cboDSNList.AddItem sDSN
        'cboDrivers.AddItem sDRV
      End If
    Loop
  End If
  
'  ' Supprime les doublons.
'  If cboDSNList.ListCount > 0 Then
'      With cboDrivers
'          If .ListCount > 1 Then
'              i = 0
'              While i < .ListCount
'                  If .List(i) = .List(i + 1) Then
'                      .RemoveItem (i)
'                  Else
'                      i = i + 1
'                  End If
'              Wend
'          End If
'      End With
'  End If

  ' On ajoute les sources "Soft"
  AjouteSourceSoft cboDSNList, "serveur"
  AjouteSourceSoft cboDSNList, "grenoble"
  AjouteSourceSoft cboDSNList, "massy1"
  AjouteSourceSoft cboDSNList, "hagar"
  AjouteSourceSoft cboDSNList, "microbe"
  AjouteSourceSoft cboDSNList, "tripoli"
  AjouteSourceSoft cboDSNList, "lyon"
  AjouteSourceSoft cboDSNList, "quantum"
  AjouteSourceSoft cboDSNList, "spip"
  AjouteSourceSoft cboDSNList, "vienne"
  AjouteSourceSoft cboDSNList, "co2"
  AjouteSourceSoft cboDSNList, "osny"
  AjouteSourceSoft cboDSNList, "cergy"
  AjouteSourceSoft cboDSNList, "brux"
  AjouteSourceSoft cboDSNList, "kilt"
  AjouteSourceSoft cboDSNList, "bergamo"
  
  
  
  cboDSNList.ListIndex = -1
  
  ' Sélection de la source par défaut
  If sSourceDéfaut <> "" Then
    For i = 0 To cboDSNList.ListCount - 1
      If StrComp(cboDSNList.List(i), sSourceDéfaut, vbTextCompare) = 0 Then
        cboDSNList.ListIndex = i
        Exit For
      End If
    Next
    
    If cboDSNList.ListIndex < 0 Then
      cboDSNList.AddItem sSourceDéfaut, 0
      cboDSNList.ListIndex = 0
    End If
  End If
  
End Sub


Public Function IsServeur() As Boolean
  'Quantum (Q) en serveur pour les essais
  IsServeur = cSystèmeCA Like "[WBYXKHQV]"
End Function


'Public Sub Neige(F As Form)
'  F.Cls
'
'  Dim g As Long
'  g = 12632256
'
'  Dim i As Integer, l As Integer, c As Integer
'  For i = 1 To 1000
'restart:
'    c = Int(F.ScaleWidth * Rnd)
'    If Rnd > 0.5 Then
'      l = Int(F.ScaleHeight * Rnd)
'    Else
'      l = F.ScaleHeight - 1
'    End If
'    While F.POINT(c, l) <> g
'      l = l - 1
'      If l < 0 Then GoTo restart
'    Wend
'
'    F.Line (c, l)-Step(1, -1), RGB(255, 255, 255), BF
'  Next
'End Sub
'

Public Sub JournalUnix(sDomaine As String, sOpération As String, ByVal sDescription As String)
  If g_SysInfo Is Nothing Then Set g_SysInfo = New SysInfo
  
  sDescription = Trim(sDescription)
  sDescription = Replace(sDescription, vbCrLf, "|")
  sDescription = Replace(sDescription, vbCr, "|")
  sDescription = Replace(sDescription, vbLf, "|")
  sDescription = Replace(sDescription, vbTab, " ")
  
  Dim cj As New BDCurseur
  cj.OpenCurseur "select * from journal where rowid=0"
  cj.AddNew
  cj!jou_date = Today
  cj!jou_timestamp = BDTime
  cj!jou_pers = iNumOpérateur
  cj!jou_tty = g_SysInfo.ComputerName
  cj!jou_application = App.Title
  cj!jou_domaine = sDomaine
  cj!jou_operation = sOpération
  cj!jou_description = Left(sDescription, 500)
  cj.Update
  cj.CloseCurseur
End Sub


' =================================================================================
' Retourne vrai ou faux si on a accès à une opération privilégiée.
' Soit l'utilisateur a le rôle de sécurité correspondant (à définir)
' Soit on affiche la boîte de contrôle de clé d'opération privilégiée.
' sCode sert à la table journal (colonne opération...)

Public Function bOkAccèsPrivilégié(sRef As String, sCode As String, sOpération As String) As Boolean
  If iNumOpérateur = 46 Then  ' or if <rôle adéquat> then return true
    Dim iRep As VbMsgBoxResult
    Dim iClé As Long
    iClé = iCalculCléOpPrivilégiée(sRef)
    iRep = MsgBox("Attention - Opération privilégiée (" & sOpération & "), contrôle désactivé pour Pierre VIOLENT." & vbCrLf & "Clé: " & iClé & vbCrLf & vbCrLf & "OK pour continuer ?", vbYesNo + vbQuestion, App.Title)
    bOkAccèsPrivilégié = (iRep = vbYes)
  Else
    bOkAccèsPrivilégié = frmContrôleCléPrivilégiée.bOkCtrlCléRef(sRef, sOpération)
  End If
  
  JournalUnix "Op privilégiée", sCode, sOpération & "|Ref=" & sRef & "|bOkAccès=" & bOkAccèsPrivilégié
End Function


Public Function iCalculCléOpPrivilégiée(sRef As String) As Long
  Dim i As Integer, t As Long, s As String
  s = Replace(UCase(sRef), " ", "")
  For i = 1 To Len(s)
    t = t + Asc(Mid(s, i, 1)) * i
  Next
  iCalculCléOpPrivilégiée = t
End Function



' =================================================================================

' Retourne la propriété .datafield du contrôle
' Retourne une chaîne vide si le contrôle n'a pas de propriété .datafield
Public Function DataFieldEx(c As Control) As String
  On Error GoTo Problème
  DataFieldEx = c.DataField
  Exit Function
  
Problème:
  DataFieldEx = ""
End Function


' Retourne la valeur d'un contrôle sous forme de texte, quelle que soit
' la propriété qui stocke cette valeur
Public Function ValeurContrôle(c As Control) As String
  If TypeOf c Is TextBox Then
    ValeurContrôle = c.Text
  ElseIf TypeOf c Is WLText Then
    ValeurContrôle = c.Text
  ElseIf TypeOf c Is BDCombo Then
    ValeurContrôle = c.Text
  ElseIf TypeName(c) = "BDCheck" Then   ' Evite d'avoir à inclure le contrôle dans tous les projets
    ValeurContrôle = c.Text
  Else
    MsgBox "Type de contrôle non pris en change.", vbCritical, "ValeurContrôle"
    Stop
  End If
End Function



