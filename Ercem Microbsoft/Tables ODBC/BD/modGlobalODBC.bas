Attribute VB_Name = "modGlobalODBC"
' modGlobalODBC
' D�finitions globales aux applications ODBC Ercem
' 22/06/1999 PV
' 12/08/1999 PV dMaxUtilisateur depuis sysinfo.si_mtu pour optimiser le d�marrage
' 18/10/1999 PV IsServeur
'  5/11/1999 PV Options d'impression; IsServeur via la lettre et plus le nom de la source
' 16/06/2000 PV g_SysInfo
' 13/02/2001 PV JournalUnix (trace des op�rations g�n�rales)
' 21/05/2001 PV Op�rations privil�gi�es
' 29/11/2001 PV DataFieldEx et ValeurContr�le (pour les traces)


Option Explicit

Global sVersionApp As String

Public iNumOp�rateur As Integer         ' N� de l'utilisateur courant
Public uOp�rateur As Utilisateur        ' Utilisateur courant
Public sNomOp�rateur As String          ' Nom de l'utilisateur

Public cSyst�meCA As String             ' Lettre du syst�me Unix qui h�berge la base de donn�es
Public cSyst�meLang As String           ' Langue du syst�me (d�faut)
Public cSyst�meProprio As String        ' Code proprio du syst�me (d�faut)
Public iSyst�mePays As Integer          ' Code pays du syst�me (d�faut)

Public dMaxUtilisateur As Date          ' Max du timestamp utilisateur (sysinfo.si_mtu)

Public bLectureSeule As Boolean         ' M�canisme lecture seule (facultatif)


' Infos syst�me
Public g_SysInfo As SysInfo


' Options d'impression
Public bOptionRectoVerso As Boolean     ' Impression RV chaque fois que possible
Public bOptionSansGris�s As Boolean     ' Ne pas utiliser de tram�s

Public sImprimanteWindowsD�faut As String   ' Inutilis�, pour


Private Declare Function SQLDataSources Lib "ODBC32.DLL" (ByVal henv&, ByVal fDirection%, ByVal szDSN$, ByVal cbDSNMax%, pcbDSN%, ByVal szDescription$, ByVal cbDescriptionMax%, pcbDescription%) As Integer
Private Declare Function SQLAllocEnv% Lib "ODBC32.DLL" (env&)
Const SQL_SUCCESS As Long = 0
Const SQL_FETCH_NEXT As Long = 1



Public Const BCChampIndex� = &HFFFF&      ' Couleur de fond d'un champ index�



Private Sub AjouteSourceSoft(cboDSNList As ComboBox, sNom As String)
'  cboDSNList.AddItem sNom & "*"
End Sub


Public Sub RemplitListeSourcesODBC(cboDSNList As ComboBox, Optional sSourceD�faut As String = "")
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
  
  ' S�lection de la source par d�faut
  If sSourceD�faut <> "" Then
    For i = 0 To cboDSNList.ListCount - 1
      If StrComp(cboDSNList.List(i), sSourceD�faut, vbTextCompare) = 0 Then
        cboDSNList.ListIndex = i
        Exit For
      End If
    Next
    
    If cboDSNList.ListIndex < 0 Then
      cboDSNList.AddItem sSourceD�faut, 0
      cboDSNList.ListIndex = 0
    End If
  End If
  
End Sub


Public Function IsServeur() As Boolean
  'Quantum (Q) en serveur pour les essais
  IsServeur = cSyst�meCA Like "[WBYXKHQV]"
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

Public Sub JournalUnix(sDomaine As String, sOp�ration As String, ByVal sDescription As String)
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
  cj!jou_pers = iNumOp�rateur
  cj!jou_tty = g_SysInfo.ComputerName
  cj!jou_application = App.Title
  cj!jou_domaine = sDomaine
  cj!jou_operation = sOp�ration
  cj!jou_description = Left(sDescription, 500)
  cj.Update
  cj.CloseCurseur
End Sub


' =================================================================================
' Retourne vrai ou faux si on a acc�s � une op�ration privil�gi�e.
' Soit l'utilisateur a le r�le de s�curit� correspondant (� d�finir)
' Soit on affiche la bo�te de contr�le de cl� d'op�ration privil�gi�e.
' sCode sert � la table journal (colonne op�ration...)

Public Function bOkAcc�sPrivil�gi�(sRef As String, sCode As String, sOp�ration As String) As Boolean
  If iNumOp�rateur = 46 Then  ' or if <r�le ad�quat> then return true
    Dim iRep As VbMsgBoxResult
    Dim iCl� As Long
    iCl� = iCalculCl�OpPrivil�gi�e(sRef)
    iRep = MsgBox("Attention - Op�ration privil�gi�e (" & sOp�ration & "), contr�le d�sactiv� pour Pierre VIOLENT." & vbCrLf & "Cl�: " & iCl� & vbCrLf & vbCrLf & "OK pour continuer ?", vbYesNo + vbQuestion, App.Title)
    bOkAcc�sPrivil�gi� = (iRep = vbYes)
  Else
    bOkAcc�sPrivil�gi� = frmContr�leCl�Privil�gi�e.bOkCtrlCl�Ref(sRef, sOp�ration)
  End If
  
  JournalUnix "Op privil�gi�e", sCode, sOp�ration & "|Ref=" & sRef & "|bOkAcc�s=" & bOkAcc�sPrivil�gi�
End Function


Public Function iCalculCl�OpPrivil�gi�e(sRef As String) As Long
  Dim i As Integer, t As Long, s As String
  s = Replace(UCase(sRef), " ", "")
  For i = 1 To Len(s)
    t = t + Asc(Mid(s, i, 1)) * i
  Next
  iCalculCl�OpPrivil�gi�e = t
End Function



' =================================================================================

' Retourne la propri�t� .datafield du contr�le
' Retourne une cha�ne vide si le contr�le n'a pas de propri�t� .datafield
Public Function DataFieldEx(c As Control) As String
  On Error GoTo Probl�me
  DataFieldEx = c.DataField
  Exit Function
  
Probl�me:
  DataFieldEx = ""
End Function


' Retourne la valeur d'un contr�le sous forme de texte, quelle que soit
' la propri�t� qui stocke cette valeur
Public Function ValeurContr�le(c As Control) As String
  If TypeOf c Is TextBox Then
    ValeurContr�le = c.Text
  ElseIf TypeOf c Is WLText Then
    ValeurContr�le = c.Text
  ElseIf TypeOf c Is BDCombo Then
    ValeurContr�le = c.Text
  ElseIf TypeName(c) = "BDCheck" Then   ' Evite d'avoir � inclure le contr�le dans tous les projets
    ValeurContr�le = c.Text
  Else
    MsgBox "Type de contr�le non pris en change.", vbCritical, "ValeurContr�le"
    Stop
  End If
End Function



