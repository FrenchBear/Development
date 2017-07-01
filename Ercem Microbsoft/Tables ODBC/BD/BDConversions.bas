Attribute VB_Name = "BDMain"
' BDMain
' Utilitaires pour faciliter les �changes avec Informix
' Module principal
' 19/01/1998 PV
' 29/04/1998 PV RunSQL
' 12/06/1998 PV Nom de la source param�trable dans BDInit
'  7/07/1998 PV QueryTimeout � 120 pour la table �tablissement
' 30/07/1998 PV Driver={SCO Vision ODBC} dans la connexion et non pas {Informix}
' 20/08/1998 PV BDTypeSMALLINT
' 23/11/1998 PV Gestion de la locale de la base de donn�es (cLocaleBD)
' 30/03/1999 PV BDEtat
' 10/05/1999 PV Lecture des titres de colonnes de doccolonnes dans BDD�critTable
' 19/05/1999 PV Fin de la gestion OEM-ANSI
'  7/07/1999 PV Source ODBC dans la registry
' 12/08/1999 PV dMaxUtilisateur lu depuis sysinfo.si_mtu pour optimiser le d�marrage
' 16/08/1999 PV dc_langue � la cl� dans doccolonnes
' 17/08/1999 PV Compensation du bug du driver Informix IDS (inversion du booleen bRequired)
' 25/08/1999 PV bExisteTable
' 16/09/2000 PV Prise en compte du type Varchar (IDS)
'  4/11/2000 PV BDD�critTable lit la description dans la base serveur si la description �choue dans la base courante (pb des synonymes externes)
'  1/12/2000 PV OffsetNow pour g�rer le d�calage d'horloge entre Windows et Unix
' 20/04/2001 PV BDTime
' 18/05/2001 PV BDGetLastSerial, BDGetLastCount, BDGetSessionID, bOp�rationG�n�rale
' 21/05/2001 PV select count(*) avant une op�ration g�n�rale; Op�ration privil�gi�e si + de 200 enregistrements modifi�s
' 21/05/2001 PV bExisteTable implant� avec un select count(*) plut�t que recherche dans la collection rdoTables (mieux pour les synonymes...)
'  6/08/2001 PV OpG�n�rale privil�gi�e au-del� de 300 enreg modifi�s


Option Explicit


Public BDcn As rdoConnection
Attribute BDcn.VB_VarDescription = "Connecteur RDO � la base de donn�es, priv� aux modules BDxxx (ne doit pas �tre utilis� par l'application)"
'Public tOffsetNow As Single


Private sSourceActuelle As String

' Pas de diff�rence varchar/char dans la biblio BD, en VB tout est varchar
Public Enum BDColType
  BDTypeCHAR = 1
  BDTypeINTEGER = 2
  BDTypeDATE = 3
  BDTypeTIMESTAMP = 4
  BDTypeDECIMAL = 5
  BDTYPESMALLINT = 6
End Enum


' =================================================================================
' Ouverture de la base
' sNomSource ByRef pour retourner la source choisie

Public Sub BDInit(ByRef sNomSource As String)
Attribute BDInit.VB_Description = "Initialisation de l'acc�s � la source de donn�es"
  Dim BDcn2 As rdoConnection
  
  If sNomSource = "?" Then
    Dim sSD As String
    Dim sODBCD�faut As String
    
    sODBCD�faut = frmBDODBCLogon.GetSourceODBCD�faut
    If sSourceActuelle = "" Then
      sSD = sODBCD�faut
    Else
      sSD = sSourceActuelle
    End If
    If sSD = "?" Then sSD = sSourceODBCD�fautD�faut
    sNomSource = frmBDODBCLogon.sChoixSource(sSD)
    If sNomSource = "" Then
      Err.Raise 100, "BDInit", "Abandon lors du choix de la source ODBC"
    End If
  End If
  
  ' Pb du bug timeout sous 2000: la 2�me tentative passe...
  Dim iPasse As Integer
  iPasse = 0
  
Restart:
  Set BDcn2 = New rdoConnection
  
  If Right(sNomSource, 1) = "*" Then
    Dim sHost As String
    sHost = Left(sNomSource, Len(sNomSource) - 1)
    BDcn2.Connect = "Driver={SCO Vision ODBC};UID=sce;Hostname=" & sHost & ";ServerID=Informix;DBname=ercem;TimeOut=1000;QueryTimeout=1000"
  Else
    BDcn2.Connect = "DSN=" & sNomSource & ";Driver={SCO Vision ODBC}"
  End If

  BDcn2.CursorDriver = rdUseOdbc
  BDcn2.LoginTimeout = 30         ' Pour les connexions � l'�tranger, plus longues
  BDcn2.EstablishConnection rdDriverNoPrompt
  BDcn2.QueryTimeout = 300
  
  If Not BDcn Is Nothing Then BDcn.Close
  Set BDcn = BDcn2
  sSourceActuelle = sNomSource
  
  Dim c As New BDCurseur
  If iPasse = 0 Then On Error Resume Next
  c.OpenCurseur "select si_systeme,si_lang,si_proprio,si_pays,si_mtu,current year to second as now from sysinfo"
  Dim iErr As Long, sErr As String
  iErr = Err.Number
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    If iPasse = 0 Then
      iPasse = 1
      GoTo Restart
    End If
    MsgBox "�chec lors de l'acc�s � la table sysinfo." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    EmergencyExit
  End If
  
  cSyst�meCA = c!si_systeme
  cSyst�meLang = c!si_lang
  cSyst�meProprio = c!si_proprio
  iSyst�mePays = c!si_pays
  dMaxUtilisateur = c!si_mtu
  'tOffsetNow = c!Now - Now
  c.CloseCurseur
  
  ' Si c'est la premi�re connexion, on m�morise
  If sODBCD�faut = "?" Then frmBDODBCLogon.SetSourceODBCD�faut sNomSource
  If cLangage = "" Then IntlChangelangue cSyst�meLang
End Sub


Public Function BDTime() As Date
  BDTime = BDCurseurExpress("select current year to second from sysinfo")
End Function

Public Function BDGetLastSerial() As Long
  BDGetLastSerial = BDCurseurExpress("select dbinfo('sqlca.sqlerrd1') from sysinfo")
End Function

Public Function BDGetLastCount() As Long
  BDGetLastCount = BDCurseurExpress("select dbinfo('sqlca.sqlerrd2') from sysinfo")
End Function

Public Function BDGetSessionID() As Long
  BDGetSessionID = BDCurseurExpress("select dbinfo('sessionid') from sysinfo")
End Function


Public Sub BDFin()
Attribute BDFin.VB_Description = "Fermeture de la source de donn�es"
  BDcn.Close
  Set BDcn = Nothing
End Sub

Public Function BDSource() As String
Attribute BDSource.VB_Description = "Retourne le nom de la source de donn�es actuelle"
  BDSource = sSourceActuelle
End Function


' =================================================================================
' Acc�s au dictionnaire

Public Sub BDD�critTable(ByVal sNomTable As String, colColonnes As Collection)
Attribute BDD�critTable.VB_Description = "Acc�s au dictionnaire, remplit une collection de colonnes pour une table"
  Dim tmpBDcn As rdoConnection
  Dim t As rdoTable
  Dim iPasse As Integer
  
  iPasse = 0
  On Error Resume Next
  Set t = BDcn.rdoTables(sNomTable)
  ' Si on ne trouve pas la description de la table dans la base courante, on cherche
  ' dans la base serveur, on cr�e une connexion temporaire pour �a.
  If Err Then
Restart:
    Err.Clear
    Set tmpBDcn = New rdoConnection
    
    Dim sHost As String
    If Right(sHost, 1) = "*" Then
      sHost = Left(sSourceActuelle, Len(sSourceActuelle) - 1)
    Else
      sHost = sSourceActuelle
    End If
    tmpBDcn.Connect = "Driver={SCO Vision ODBC};UID=sce;Hostname=" & sHost & ";ServerID=Informix;DBname=serveur;"
    tmpBDcn.CursorDriver = rdUseOdbc
    tmpBDcn.LoginTimeout = 30         ' Pour les connexions � l'�tranger, plus longues
    tmpBDcn.EstablishConnection rdDriverNoPrompt
    tmpBDcn.QueryTimeout = 300
    Set t = tmpBDcn.rdoTables(sNomTable)
    If Err.Number Then
      If iPasse = 0 Then
        iPasse = 1
        GoTo Restart
      End If
      MsgBox "�chec lors de la description de la table " & sNomTable & " sur la source " & sSourceActuelle & "." & vbCrLf & "(Probl�me ODBC/Windows 2000)" & vbCrLf & vbCrLf & "Erreur " & Err.Number & " (" & Err.Source & "): " & Err.Description, vbCritical, App.Title
      EmergencyExit
    End If
  End If
  On Error GoTo 0
  
  ' Analyse des champs de la table (longueur, not null, �)
  Dim rc As rdoColumn
  Dim c As BDColonne
  For Each rc In t.rdoColumns
    Set c = New BDColonne
    c.sNom = rc.Name
    Select Case rc.Type
      Case rdTypeCHAR, rdTypeVARCHAR: c.iType = BDTypeCHAR
      Case rdTypeINTEGER:             c.iType = BDTypeINTEGER
      Case rdTypeSMALLINT:            c.iType = BDTYPESMALLINT
      Case rdTypeDATE:                c.iType = BDTypeDATE
      Case rdTypeTIMESTAMP:           c.iType = BDTypeTIMESTAMP
      Case rdTypeDECIMAL:             c.iType = BDTypeDECIMAL
      Case Else: Stop
    End Select
    c.iSize = rc.Size
    colColonnes.Add c, rc.Name
    Set c = Nothing
  Next
  
  If Not tmpBDcn Is Nothing Then
    tmpBDcn.Close
  End If
  
  ' Lecture des descriptions
  ' Pour l'instant on lit la description en fran�ais; internationalisation ult�rieure
  Dim cDesc As New BDCurseur
  On Error GoTo SansDoc
  cDesc.OpenCurseur "select dc_colonne,dc_titre from doccolonnes where dc_table='" & sNomTable & "' and dc_langue='F'"
  On Error Resume Next  ' Cas des colonnes en trop dans doccolonnes
  Do Until cDesc.EOF
    colColonnes(cDesc!dc_colonne).sDescription = cDesc!dc_titre
    cDesc.MoveNext
  Loop
  cDesc.CloseCurseur
SansDoc:
  Exit Sub
  
GrosPB:
  MsgBox "GrosPB"
  
End Sub


Public Function bExisteTable(ByVal sNomTable As String) As Boolean
  'Dim nt As String
  Dim nr As Long
  On Error Resume Next
  'nt = BDcn.rdoTables(sNomTable).Name
  nr = BDCurseurExpress("select count(*) from " & sNomTable)
  If Err = 0 Then
    bExisteTable = True
  Else
    bExisteTable = False
  End If
End Function


' =================================================================================
' Ex�cution de SQL directe
' A charge de l'appelant de r�cup�rer les erreurs�

Public Sub RunSQL(sSQL As String)
Attribute RunSQL.VB_Description = "Ex�cute une requ�te SQL directe"
  BDcn.Execute sSQL, rdExecDirect
End Sub


' =================================================================================
' Curseur express
' Retourne un seul r�sultat (1er champ de la premi�re ligne)

Public Function BDCurseurExpress(sSQL As String) As Variant
Attribute BDCurseurExpress.VB_Description = "Retourne un seul r�sultat (1er champ de la premi�re ligne d'une requ�te)"
  Dim c As New BDCurseur
  c.OpenCurseur sSQL
  If c.EOF Then
    BDCurseurExpress = Empty
  Else
    BDCurseurExpress = c(0)
  End If
  c.CloseCurseur
End Function



' =================================================================================
' �tat de base
' Cr�e une source ADO bas�e sur une requ�te SQL
' Accepte aussi bien un ordre SQL qu'un ordre SHAPE, s�lectionne le provider en cons�quence

Public Sub BDEtat(ByVal sSQL As String, ByRef dr As DataReport, ByVal bImpression As Boolean, Optional sTitre As String)
  If sSQL = "" Then
    Unload dr
    MsgBox "S�lectionnez des enregistrements au pr�alable.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iOldMousePointer As Integer
  iOldMousePointer = Screen.MousePointer
  Screen.MousePointer = vbHourglass
  
  Dim connex As ADODB.Connection
  Dim rs As ADODB.Recordset
  Dim sSource As String
  
  Set connex = New ADODB.Connection
  If StrComp(Left(sSQL, 5), "SHAPE", vbTextCompare) = 0 Then
    sSource = "Provider=MSDataShape;Persist Security Info=True;Connect Timeout=30;Mode=Read|Write;Data Source=" & sSourceActuelle & ";User ID=sce;Password="""";Data Provider=MSDASQL"
  Else
    sSource = "Provider=MSDASQL;DSN=" & sSourceActuelle & ";Driver={Informix}"
  End If
  connex.CommandTimeout = 150
  connex.Open sSource
  connex.CursorLocation = adUseClient   ' Le serveur n'implante que des curseurs forward-only
 
  Set rs = New ADODB.Recordset
  On Error Resume Next
  rs.Open sSQL, connex
  If Err <> 0 Then
    Unload dr
    'MsgBox "Erreur lors de l'ouverture de la requ�te." & vbCrLf & vbCrLf & "Erreur " & Err.Number & " (" & Err.Source & "): " & Err.Description & vbCrLf & vbCrLf & "connex.source: " & sSource & vbCrLf & "SQL: " & sSQL, vbExclamation, App.Title
    MessageErreurStandard "Erreur lors de l'ouverture de la requ�te." & vbCrLf & "connex.source: " & sSource & vbCrLf & "SQL: " & sSQL
    Exit Sub
  End If
  On Error GoTo 0
  
  Set dr.DataSource = rs
  
  With dr.Sections("secReportHeader").Controls
    If sTitre <> "" Then !lblTitre.Caption = sTitre
    !lblApplication.Caption = !lblApplication.Caption & " " & App.Major & "." & App.Minor & "." & App.Revision & " sur le syst�me " & Environ("SYSTEMID")
    !lblDate.Caption = "�dit� le %D � %t par " & sNomOp�rateur & " connect� � " & BDSource & " (" & cSyst�meCA & ")"
  End With
  
  On Error Resume Next    ' Si pas d'imprimante configur�e
  If bImpression Then
    dr.PrintReport
    Unload dr
  End If
  
  Screen.MousePointer = iOldMousePointer
End Sub



Public Function BDGetADORS(c As BDCurseur, colChamps As Collection, colColonnes As Collection) As ADODB.Recordset
  If c Is Nothing Then
    Set BDGetADORS = Nothing
    Exit Function
  End If
  
  Dim t As Control
  Dim rsR As ADODB.Recordset
  
  Set rsR = New ADODB.Recordset
  
  ' Noms de colonnes
  Dim attrib As FieldAttributeEnum
  Dim co As BDColonne
  For Each t In colChamps
    Set co = colColonnes(t.DataField)
    Dim bReq As Boolean
    bReq = co.bRequired
    ' Compensation du bug du driver Informix IDS !
    If InStr(1, BDcn.Connect, "service", vbTextCompare) <> 0 Then bReq = Not bReq
    If bReq Then
      attrib = 0
    Else
      attrib = adFldIsNullable
    End If
    rsR.Fields.Append t.DataField, adBSTR, , attrib
  Next
  
  rsR.Open
  c.MoveFirst
  Do Until c.EOF
    rsR.AddNew
    For Each t In colChamps
      rsR(t.DataField) = c.Fields(t.DataField)
    Next
    c.MoveNext
  Loop
  c.MoveFirst
  
  Set BDGetADORS = rsR
End Function


' =================================================================================
' Transactions

Public Sub BDBeginTrans()
  If BDcn.Transactions Then BDcn.BeginTrans
End Sub

' Attention, ferme les curseurs ouverts !
Public Sub BDCommitTrans()
  If BDcn.Transactions Then BDcn.CommitTrans
End Sub

Public Sub BDRollbackTrans()
  If BDcn.Transactions Then BDcn.RollbackTrans
End Sub


' =================================================================================
' Op�rations g�n�rales

Public Function bOp�rationG�n�rale(sTable As String, sSQL As String, sWP As String) As Boolean
  bOp�rationG�n�rale = False
  Dim iNb As Long
  Dim sSQLCount As String
  sSQLCount = "select count(*) from " & sTable & " where " & sWP
  Screen.MousePointer = vbHourglass
  iNb = BDCurseurExpress(sSQLCount)
  Screen.MousePointer = vbDefault
  If iNb = 0 Then
    MsgBox "L'op�ration g�n�rale ne porte sur aucun enregistrement.", vbInformation, App.Title
    JournalUnix sTable, "Op�ration g�n�rale", sSQLCount & " --> 0 enregistrement � modifier, abandon."
    Exit Function
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("L'op�ration g�n�rale sur la table " & sTable & " va modifier " & iNb & " enregistrement(s)." & vbCrLf & vbCrLf & "Voulez-vous continuer ?", vbQuestion + vbYesNo + vbDefaultButton2, App.Title)
  JournalUnix sTable, "Op�ration g�n�rale", sSQLCount & " --> " & iNb & " enregistrement(s) � modifier --> " & IIf(iRep = vbYes, "Oui", "Non")
  If iRep = vbNo Then Exit Function
  
  If iNb > 300 Then
    If Not bOkAcc�sPrivil�gi�(Int(10000 * Rnd), "Op g�n�rale>300 enreg", "Op�ration g�n�rale portant sur plus de 300 enregistrements") Then Exit Function
  End If
  
  SetMessage "Ex�cution de l'op�ration g�n�rale en cours, patientez�"
  On Error Resume Next
  Screen.MousePointer = vbHourglass
  RunSQL sSQL
  If Err Then
    Dim sMsgErr As String
    sMsgErr = Error
    On Error GoTo 0
    Screen.MousePointer = vbDefault
    SetMessage
    MsgBox "�chec lors de l'op�ration g�n�rale" & vbCrLf & vbCrLf & sSQL & vbCrLf & vbCrLf & "Erreur " & Err & ": " & sAjusteMessageODBC(sMsgErr), vbExclamation, App.Title
    JournalUnix sTable, "Op�ration g�n�rale", sSQL & " --> " & sMsgErr
    Exit Function
  End If
  On Error GoTo 0
  Screen.MousePointer = vbDefault
  Dim iNbRec As Long
  iNbRec = BDGetLastCount
  JournalUnix sTable, "Op�ration g�n�rale", sSQL & " --> " & iNbRec & " enregistrement(s) modifi�(s)"
  MsgBox iNbRec & " enregistrement(s) modifi�(s) dans la table " & sTable & ".", vbInformation, App.Title
  bOp�rationG�n�rale = True
End Function



' =================================================================================
' Tra�abilit�

' Retourne une cha�ne d'identification pour les champs xxx_idmodif
Public Function sBDIdModif() As String
  If g_SysInfo Is Nothing Then Set g_SysInfo = New SysInfo
  sBDIdModif = LCase(App.EXEName & " " & sVersionApp & " " & g_SysInfo.ComputerName & ", " & iNumOp�rateur)
End Function

