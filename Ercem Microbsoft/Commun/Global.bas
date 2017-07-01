Attribute VB_Name = "Global"
Attribute VB_Description = "D�clarations globales communes � plannings et � scraw, et fonctions utilitaires"
' module Global
' D�clarations globales communes � plannings, scraw et � gdocw, et fonctions utilitaires
'  3/11/1996 PV
' 26/02/1997 PV Contr�le d'environnement
' 17/11/1997 PV Contr�leDerni�reVersion
' 26/12/1997 PV Conversions OEM - ANSI
' 31/03/1998 PV D�tail de derni�re version
' 10/04/1998 PV Fonction s()
'  1/06/1998 PV HMsgHtml
' 29/07/1998 PV EffaceMarqueDeTri
' 25/08/1998 PV ListViewFullRowSelect
' 22/10/1998 PV frmVersionR�cente; ListViewFullRowSelect propre
' 20/01/1999 PV Internationalisation MsgBox2i; sprintf; fin de ListViewFullRowSelect
' 01/02/1999 PV gdocw
' 10/02/1999 PV bToMaj
' 12/01/2000 PV D�but du WorkGroup commence par SILLIKER (et non plus strictement SILLIKER)
' 21/02/2000 PV Contr�le du disque Z: s'il est d�fini dans le NetInfo.ini
' 28/04/2000 PV Contr�le des variables TMP et TEMP
' 30/09/2000 PV Fonction Nouveau, RemplitBDC
' 12/10/2000 PV sSysDisk, X: ou Z:
' 25/10/2000 PV bToMin r�cup�r� de globalxxx
' 16/11/2000 PV Deux imprimantes laser dans la config --> Globalxxx
'  5/12/2000 PV bIsEtbFimebio et bIsEtbErcem
' 20/01/2001 PV MsgBox2iYesNo
' 15/02/2001 PV bOkAcc�sPrivil�gi�
' 15/05/2001 PV iCalculCl�OpPrivil�gi�e
' 21/05/2001 PV R�gle de d�coupage i; Trace de la r�f�rence dans le journal pour les op privil�gi�es
' 19/11/2001 PV iSyst�mePays


Option Explicit

Public sNomApp As String                ' Nom de l'application

Public frmBase As Form                  ' Forme principale

Public tcps As New TCPSynchrone         ' Objet encapsulant les communication TCP/IP
Public bBlocageEnCours As Boolean       ' Programme non r�-entrant

Public sVersionD�mon As String          ' Version du d�mon Unix

' Options m�moris�es dans la registry
Public sSyst�meDistant As String        ' Syst�me qui ex�cute le d�mon

' Options g�n�rales
Public sPr�fixeAide As String

' Identification de l'utilisateur
Public sNomOp�rateur As String
Public iNumOp�rateur As Integer

' Identification du syst�me (tag des n� de s�rie des plannings)
Public cSyst�meCA As String
Public iSyst�mePays As Integer            ' Lu dans sysinfo

' Identification du protocole
Public iNumProto As Integer               ' N� majeur du protocole (1 actuellement)
Public iRelProto As Integer               ' N� mineur du protocole

' Infos pour la bo�te A Propos
Public sInfosRab As String

' Fonctions de Win32
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Declare Function GetKeyState% Lib "user32" (ByVal nVirtKey%)
Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Public Const WM_USER = &H400
Public Const LB_SETTABSTOPS = WM_USER + 19
Public Const VK_TAB = 9
Public Const VK_MENU = 12     ' Alt
Public Const VK_LSHIFT = &HA0


' ListView
'Private Const LVM_FIRST As Long = &H1000
'Private Const LVM_SETEXTENDEDLISTVIEWSTYLE As Long = LVM_FIRST + 54
'Private Const LVM_GETEXTENDEDLISTVIEWSTYLE As Long = LVM_FIRST + 55
'Private Const LVS_EX_FULLROWSELECT As Long = &H20

Private pVerrou As Picture                      ' Image du verrou dans la barre de status



' Windows
Public sWinDir As String                        ' R�pertoire Windows
Public sSysDir As String                        ' R�pertoire Windows\System(32)


Const sInfosR�seau As String = "NetInfo.ini"

Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long



' Ddates
Public sShortDate As String                     ' d�finition du format "short date"
Public bDateFormatUS As Boolean                 ' Vrai si dates M/J/A



' Impression
Public sImprimanteWindowsD�faut As String       ' Imprimante Windows par d�faut au lancement de l'appli
Public Const sNoPrinter = "Pas d'imprimante"
Public Const sDefaultPrinter = "Imprimante Windows courante"



' Fonction de blocage d'interface
' L'interface ne doit pas �tre r�-entrante
Public Sub Bloquer()
  If bBlocageEnCours Then
    MsgBox2i "CO068"
    'MsgBox "Tentative de r�-entrance dans une section critique." & vbCrLf & vbCrLf & "Pr�venez le service informatique.", vbCritical, sNomApp
    Stop
  End If
  bBlocageEnCours = True
  If Not bMasquerBloqu� Then
    HourGlass "show"
    frmBase.cmdRel�cher.Enabled = True
    If pVerrou Is Nothing Then
      Set pVerrou = frmBase.sbStatus.Panels("EInt").Picture
    End If
    Set frmBase.sbStatus.Panels("EInt").Picture = pVerrou
  End If
End Sub


Public Sub Rel�cher()
  If Not bBlocageEnCours Then
    MsgBox2i "CO069"
    'MsgBox "Tentative de sortie ill�gale d'une section critique." & vbCrLf & vbCrLf & "Pr�venez le service informatique.", vbCritical, sNomApp
    Stop
  End If
  If Not bMasquerBloqu� Then
    HourGlass "hide"
    frmBase.sbStatus.Panels("EInt").Picture = Nothing
    frmBase.cmdRel�cher.Enabled = False
  End If
  bBlocageEnCours = False
  TraiteActionSuivante
End Sub


Sub HourGlass(ByVal Method As String)
  Static HourglassCount As Integer ' Set to 0 when initialized
  Static HourGlassOldPointer As Integer
    
  ' Perform Method
  Select Case UCase$(Method)
    Case "SHOW"
      HourglassCount = HourglassCount + 1
      ' If this is the first call then save pointer before changing
      If HourglassCount = 1 Then HourGlassOldPointer = Screen.MousePointer
      ' Change cursor if not already an hourglass
      If Screen.MousePointer <> vbHourglass Then Screen.MousePointer = vbHourglass

    Case "HIDE"
      HourglassCount = HourglassCount - 1
      ' If no more requests to Show hourglass then set back to old
      If HourglassCount < 1 Then Screen.MousePointer = HourGlassOldPointer: HourglassCount = 0

    Case Else
      ' (put your error handling here)
  End Select
End Sub


' Affiche un messge d'aide ou un compl�ment d'explications
' Sous-trait� pour l'instant � un client Web
Sub Aide(sPage As String)
  FileShellExecute frmBase.hWnd, sPr�fixeAide & LCase(sPage) & ".htm"
End Sub


' =================================================================================
' Bo�tes de messages

' Contr�le de l'utilisation de tous les arguments de MsgBox
'Public Sub zMsgBox(ByVal sMsg As String, ByVal Buttons As VbMsgBoxStyle, ByVal sTitre As String)
'  MsgBox sMsg, Buttons, sTitre
'End Sub

'' Relais HMsgBox
'Public Function HMsgBox(sMsg As String, Optional Buttons As VbMsgBoxStyle = vbOKOnly, Optional ByVal Title As String) As String
'  If Title = "" Then Title = sNomApp
'  HMsgBox = frmMsgHtml.HMsgBox(sMsg, Buttons, Title)
'End Function


' Msgbox2 avec le code international du message et liste (optionnelle) d'arguments
' Les arguments remplacent les %1, %2, %3�, %9, %a, %b� dans la cha�ne
Public Sub MsgBox2i(sCode As String, ParamArray tChamps())
  If UBound(tChamps) < LBound(tChamps) Then
    MsgBox2 sGetIntlLib(sCode, "Message " & sCode), sCode
  Else
    MsgBox2 sprintf(sGetIntlLib(sCode, "Message " & sCode), tChamps), sCode
  End If
End Sub


Sub MsgBox2(ByVal sMessage As String, sCode As String, Optional oJournal)
  Dim sAvertissement As String
  sAvertissement = sGetIntlLib("lblAvertissement", "Avertissement")

  frmMsgBox2.lblAvertissement = sAvertissement & " " & sCode & ":"
  frmMsgBox2.txtMessage = sMessage
  frmMsgBox2.lblCode = sCode
  
'  If sCode <> "" Then
'    sMessage = Subst(sMessage, vbCrLf, "<BR>")
'    sMessage = sMessage & "</P><a href=""" & sPr�fixeAide & LCase(sCode) & ".htm" & """>Plus d'informations</a>"
'  End If
  
  Dim bJournal As Boolean
  If IsMissing(oJournal) Then
    bJournal = True
  Else
    bJournal = CBool(oJournal)
  End If
  If frmTCP.GetState = 0 Then bJournal = False
  
  ' On m�morise les messages si on n'est pas en section critique
  If bJournal And Not bBlocageEnCours Then D�monJournalUnix "Avertissement", sCode, sMessage
  
  Dim iOldPointeur As Integer
'  iOldPointeur = Screen.MousePointer
'  Screen.MousePointer = vbHourglass
  
  frmMsgBox2.Show vbModal
  'HMsgBox sMessage, vbOKOnly + vbExclamation, "Avertissement " & sCode
  
'  Screen.MousePointer = iOldPointeur
End Sub


Function MsgBox2iYesNo(sCode As String) As VbMsgBoxResult
  Dim sMsg As String
  Dim iRep As VbMsgBoxResult
  sMsg = sCode & ": " & sGetIntlLib(sCode, "Question " & sCode)
  iRep = MsgBox(sMsg, vbQuestion + vbYesNo + vbDefaultButton2, sNomApp)
  If Not bBlocageEnCours Then D�monJournalUnix "Question", "PL011b", sMsg & "|Rep: " & IIf(iRep = vbYes, "Oui", "Non")
  MsgBox2iYesNo = iRep
End Function


Function bD�connect�() As Boolean
  If tcps.Etat() = 7 Then
    bD�connect� = False
  Else
    MsgBox2i "CO023", sSyst�meDistant
    bD�connect� = True
  End If
End Function


Sub Contr�leEnvironnement()
  Dim sDate As String
  sDate = Format(#12/25/1990#, "short date")
' Le mieux serait de fabriquer sShortDate � partir de la d�finition du syst�me
  Select Case sDate
    Case "25/12/90":    bDateFormatUS = False: sShortDate = "dd/mm/yy"
    Case "25/12/1990":  bDateFormatUS = False: sShortDate = "dd/mm/yyyy"
    Case "12/25/90":    bDateFormatUS = True:  sShortDate = "mm/dd/yy"
    Case "12/25/1990":  bDateFormatUS = True:  sShortDate = "mm/dd/yyyy"
    Case "25-12-1990":  bDateFormatUS = False: sShortDate = "dd/mm/yyyy"
    Case Else:
      MsgBox2i "CO047"
'    ' Attention - Format de date dans les param�tres r�gionaux du passeau de configuration de Windows non pris en charge par ce programme !
'    ' Choisissez les param�tres r�gionaux 'Fran�ais (standard)' avant de relancer ce programme.
      If Not bShiftPressed Then Stop
  End Select
  
  If bDateFormatUS Then
    ' Message � traduire $$
    MsgBox "Attention - Les param�tres r�gionaux de ce syst�me d�finissent les dates au format am�ricain mm/jj/aa." & vbCrLf & "Nous sommes le " & Today & "." & vbCrLf & vbCrLf & "Toutes les saisies et tous les affichages de ce programme se feront selon ce format.", vbInformation, App.Title
  End If

  ' On v�rifie si la variable d'environnement tmp est d�finie
  If Environ("TMP") = "" Then
    MsgBox2i "CO047b", "TMP"
  Else
    If Not bDirExists(Environ("TMP")) Then MsgBox2i "CO047c", "TMP", Environ("TMP")
  End If
  
  If Environ("TEMP") = "" Then
    MsgBox2i "CO047b", "TEMP"
  Else
    If Not bDirExists(Environ("TEMP")) Then MsgBox2i "CO047c", "TEMP", Environ("TEMP")
  End If
End Sub


' Retourne le disque syst�me, X: ou Z:
Public Function sSysDisk() As String
  If Dir("X:\", vbDirectory) <> "" Then
    sSysDisk = "X:"
  ElseIf Dir("Z:\", vbDirectory) <> "" Then
    sSysDisk = "Z:"
  Else
    sSysDisk = ""
  End If
End Function



' On commence par date+heure
' Si <>, on regarde le n� de version
Sub Contr�leDerni�reVersion()
  If App.LogMode = 0 Then GoTo SkipExeSizeControl   ' Empirique, pour �viter le message de MAJ pendant le d�veloppement
  On Error GoTo SkipExeSizeControl
  
  Dim sSys As String
  sSys = sSysDisk
  If sSys = "" Then GoTo SkipExeSizeControl
  
  Dim TailleProg As Long, TailleProgSysDisk As Long
  Dim DateProg As Date, DateProgSysDisk As Date
  TailleProg = FileLen(App.Path & "\" & App.EXEName & ".exe")
  TailleProgSysDisk = FileLen(sSys & "\microbsoft\" & App.EXEName & ".exe")
  DateProg = FileDateTime(App.Path & "\" & App.EXEName & ".exe")
  DateProgSysDisk = FileDateTime(sSys & "\microbsoft\" & App.EXEName & ".exe")
  If TailleProg <> TailleProgSysDisk Or DateProg <> DateProgSysDisk Then
    Dim VerInfo As VS_FIXEDFILEINFO
    Dim bVersionPlusR�centeSurSysDisk As Boolean
    
    If Not GetVersion(sSys & "\microbsoft\" & App.EXEName & ".exe", VerInfo) Then
      bVersionPlusR�centeSurSysDisk = True
    Else
      bVersionPlusR�centeSurSysDisk = App.Major > VerInfo.dwFileVersionMSh Or App.Major = VerInfo.dwFileVersionMSh And (App.Minor > VerInfo.dwFileVersionMSl Or App.Minor = VerInfo.dwFileVersionMSl And App.Revision > VerInfo.dwFileVersionLSl)
    End If

    If bVersionPlusR�centeSurSysDisk Then
      frmVersionR�cente.lblSurZ = "Sur " & sSys
      frmVersionR�cente.lblDateLocale = Format(DateProg, "general date")
      frmVersionR�cente.lblDateZ = Format(DateProgSysDisk, "general date")
      frmVersionR�cente.lblTailleLocale = Trim(Format(TailleProg, "# ### ##0"))
      frmVersionR�cente.lblTailleZ = Trim(Format(TailleProgSysDisk, "# ### ##0"))
      frmVersionR�cente.lblVersionLocale = App.Major & "." & App.Minor & "." & App.Revision
      frmVersionR�cente.lblVersionZ = VerInfo.dwFileVersionMSh & "." & VerInfo.dwFileVersionMSl & "." & VerInfo.dwFileVersionLSl
      
      frmVersionR�cente.Show vbModal
    End If
  End If
  Exit Sub
  
SkipExeSizeControl:
  On Error GoTo 0

End Sub


' =================================================================================
' Gestion des marques de tri dans les listes de recherche

Public Sub EffaceMarqueDeTri(lv As ListView)
  With lv
    If .Sorted Then
      If Right(.ColumnHeaders(.SortKey + 1).Text, 2) Like " ?" Then
        .ColumnHeaders(.SortKey + 1).Text = Left(.ColumnHeaders(.SortKey + 1).Text, Len(.ColumnHeaders(.SortKey + 1).Text) - 2)
      End If
    End If
  End With
End Sub

Public Sub TrieListView(lv As ListView, ByVal IndexCH As Integer)
  EffaceMarqueDeTri lv
  If lv.SortKey = IndexCH - 1 And lv.Sorted Then
    lv.SortOrder = 1 - lv.SortOrder
  Else
    lv.SortKey = IndexCH - 1
    lv.SortOrder = 0
  End If
  lv.ColumnHeaders(lv.SortKey + 1).Text = lv.ColumnHeaders(lv.SortKey + 1).Text & IIf(lv.SortOrder, " �", " �")
  lv.Sorted = True
End Sub


' =================================================================================
' Passe un champ en majuscules
' Retour vrai si le champ a �t� modifi�

Public Function bToMaj(txtControl As Control) As Boolean
  bToMaj = False
  If txtControl <> UCase(txtControl) Then
    Dim sStart As Integer, sLength As Integer
    sStart = txtControl.SelStart
    sLength = txtControl.SelLength
    txtControl = UCase(txtControl)
    txtControl.SelStart = sStart
    txtControl.SelLength = sLength
    bToMaj = True
  End If
End Function


' Passe un champ en minuscules
' Retour vrai si le champ a �t� modifi�
Public Function bToMin(txtControl As Control) As Boolean
  bToMin = False
  If txtControl <> LCase(txtControl) Then
    Dim sStart As Integer, sLength As Integer
    sStart = txtControl.SelStart
    sLength = txtControl.SelLength
    txtControl = LCase(txtControl)
    txtControl.SelStart = sStart
    txtControl.SelLength = sLength
    bToMin = True
  End If
End Function


' =================================================================================
' Gestion de l'environnement

Private Function sGetProfile(ByVal sFichier As String, ByVal sSection As String, ByVal sCl� As String, ByVal sD�faut As String) As String
  Dim sRes As String, l As Long
  sRes = Space(500)
  l = GetPrivateProfileString(sSection, sCl�, sD�faut, sRes, 500, sFichier)
  sGetProfile = Left(sRes, l)
End Function

Private Sub ToBak(sNomfic As String)
  On Error Resume Next
  Name sSysDir & "\" & sNomfic As sSysDir & "\" & sNomfic & ".bak"
  On Error GoTo 0
End Sub

Private Sub Efface(sNomfic As String)
  On Error Resume Next
  Kill sNomfic
  On Error GoTo 0
End Sub

Private Sub RenameMenu(ByVal sMenu1 As String, ByVal sOldNom As String, ByVal sNouvNom As String)
  On Error Resume Next
  Name sWinDir & "\Menu d�marrer\Programmes\" & sMenu1 & "\" & sOldNom & ".lnk" As sWinDir & "\Menu d�marrer\Programmes\" & sMenu1 & "\" & sNouvNom & ".lnk"
End Sub


' Ex�cut� au d�but de Form_Load
Public Sub CommandesInitiales()
  ' On m�morise le nom de l'imprimante Windows par d�faut au lancement du programme
  sImprimanteWindowsD�faut = Printer.DeviceName

  Dim sWinDir100 As String * 100, iLen As Integer
  iLen = GetWindowsDirectory(sWinDir100, 100)
  sWinDir = Left(sWinDir100, iLen)
  iLen = GetSystemDirectory(sWinDir100, 100)
  sSysDir = Left(sWinDir100, iLen)
  
' Purge des anciens caches
  Efface App.Path & "\Cache utilisateurs 2.dat"

' Purge d'un programme obsol�te
'  Efface App.Path & "\TablesDoc.exe"
'  Efface sWinDir & "\Menu d�marrer\Programmes\Microb'Soft\Documentation BD.lnk"
  
'  ' Noms plus sympathiques pour les menus
'  RenameMenu "D�marrage", "Serveur6000.exe", "Serveur 6000"

  On Error GoTo fin

  ' Adresse IP
  Dim sLocalIP As String, sR�seau As String, sZ As String
  sLocalIP = frmTCP.TCP.LocalIP
  sR�seau = Left(sLocalIP, InStr(InStr(InStr(sLocalIP, ".") + 1, sLocalIP, ".") + 1, sLocalIP, ".") - 1)
  sZ = sGetProfile(sInfosR�seau, sR�seau, "Z", "")
  
  
  ' Contr�le du VB6 SP4
  If sR�seau <> "200.200.230" And sR�seau <> "172.16.140" Then       ' Pas pour l'Italie ni l'Angleterre
    Dim VerInfo As VS_FIXEDFILEINFO
    If GetVersion(sSysDir & "\msvbvm60.dll", VerInfo) Then
      If VerInfo.dwFileVersionMSh = 6 And VerInfo.dwFileVersionMSl = 0 Then
        If VerInfo.dwFileVersionLSh < 88 Or (VerInfo.dwFileVersionLSh = 88 And VerInfo.dwFileVersionLSl < 77) Then
          MsgBox "Version des fichiers syst�me p�rim�e !" & vbCrLf & vbCrLf & "La derni�re version des composants Visual Basic 6 est indispensable au bon fonctionnement de ce programme. " & _
            "Installez la derni�re version des composants VB6." & vbCrLf & vbCrLf & _
            "Si vous avez besoin d'aide, voyez avec les personnes du site qui connaissent la proc�dure, sinon consultez le service informatique.", vbCritical, sNomApp
          If Not bShiftPressed Then EmergencyExit
        End If
      End If
    End If
  End If


  ' On v�rifie que le WorkGroup commence par SILLIKER
  Dim sWorkgroup As String
  sWorkgroup = R�cup�reValeurRegistry("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP", "Workgroup", "REG_SZ")
  If StrComp(Left(sWorkgroup, 8), "SILLIKER", vbTextCompare) <> 0 Then
    MsgBox "Groupe de travail incorrect !" & vbCrLf & vbCrLf & "Le groupe de travail est mal d�fini sur ce micro. Il doit imp�rativement �tre SILLIKER et non " & sWorkgroup & " pour que les programmes fonctionnent correctement." & vbCrLf & vbCrLf & _
      "Modifiez le groupe de travail imm�diatement (propri�t�s du voisinage r�seau, onglet identification). Si vous avez besoin d'aide, voyez avec les personnes du site qui ont d�j� fait la modification.", vbCritical, sNomApp
    If Not bShiftPressed Then EmergencyExit
  End If
  
  ' Contr�le de l'acc�s au disque Z, s'il est d�fini dans le NetInfo.ini
  Dim sSys As String
  sSys = sSysDisk
  If sZ <> "" And sSys = "" Then
    MsgBox "�chec lors de l'acc�s au disque X: !" & vbCrLf & vbCrLf & "L'acc�s au disque X: est indispensable au bon fonctionnement de ce programme. " & _
      "Connectez le disque X: � la ressource systeme du serveur de fichiers du site dans le voisinage r�seau." & vbCrLf & vbCrLf & _
      "Si vous avez besoin d'aide, voyez avec les personnes du site qui connaissent la proc�dure, sinon consultez le guide SOS (Internet Explorer, Guide SOS, Disparition des disques W: ou X: dans l'explorateur).", vbCritical, sNomApp
    If Not bShiftPressed Then EmergencyExit
  End If

fin:
End Sub


' =================================================================================
' Affiche un message pour les nouveaut�s Microb'Soft II

Public Sub Nouveau(ByVal sMsg As String)
  MsgBox Replace(sMsg, "|", vbCrLf), vbInformation, App.Title & " - Nouveaut�s Microb'Soft II"
End Sub


' =================================================================================
' Replissage des combos qui ne sont pas aliment�es � partir de la base
' (mais qui devraient l'�tre !!!)

Public Sub RemplitBDC(bdc As BDCombo, sListe As String)
  Select Case sListe
    Case "secret":
      bdc.AddItem "G", "Grenoble (grenoble)"
      bdc.AddItem "P", "Massy (massy1)"
      bdc.AddItem "H", "Roanne (hagar)"
      bdc.AddItem "C", "Cergy (cergy)"
      bdc.AddItem "T", "La Rochelle (tripoli)"
      bdc.AddItem "R", "Fontaine (microbe)"
      bdc.AddItem "O", "Osny (osny)"
      bdc.AddItem "B", "Bergamo (bergamo)"
      bdc.AddItem "X", "Bruxelles (brux)"
      bdc.AddItem "K", "Birmingham (kilt)"
      bdc.AddItem "W", "Serveur (INF)"
  
    Case "labo":
      bdc.AddItem "R", "Fontaine (microbe)"
      bdc.AddItem "H", "Roanne (hagar)"
      bdc.AddItem "C", "Cergy (cergy)"
      bdc.AddItem "T", "La Rochelle (tripoli)"
      bdc.AddItem "O", "Osny (osny)"
      bdc.AddItem "B", "Bergamo (bergamo)"
      bdc.AddItem "X", "St-Niklaas (brux)"
      bdc.AddItem "K", "Birmingham (kilt)"
      bdc.AddItem "W", "Serveur (INF)"
  
    Case "decoupage":       ' D�coupage de l'intervention
      bdc.AddItem "a", "Impression en 1 tranche  A=AB+BS+Li+FS+EH+CH"
      bdc.AddItem "b", "Impression en 2 tranches A=AB+BS+Li+FS+EH  C=CH"
      bdc.AddItem "c", "Impression en 3 tranches A=AB+BS+Li+FS  B=EH  C=CH"
      bdc.AddItem "i", "Impression en 2 tranches B=EH  I(Imm�diate)=AB+BS+Li+FS+CH"
  
    Case "fact":            ' Types de facture
      bdc.AddItem "V", "Visite, une facture sp�cifique pour cette intervention"
      bdc.AddItem "I", "Individuelle, group�e en fin de mois pour l'�tablissement"
      bdc.AddItem "G", "Group�e, group�e en fin de mois pour le groupement"
  
    Case "facncp":          ' Niveau de calcul des prix
      bdc.AddItem "1", "Pr�paration automatique forfait et document"
      bdc.AddItem "2", "Pr�paration automatique forfait, document et param�tre"
      bdc.AddItem "3", "Pr�paration automatique forfait et param�tre"
      bdc.AddItem "4", "Pr�paration � valider forfait et document"
  
    Case "facndp":          ' Niveau de pr�sentation des prix
      bdc.AddItem "0", "Total prestation uniquement"
      bdc.AddItem "1", "Total par famille (3 AB pour 450 F, 1 EH � 350 F)"
      bdc.AddItem "2", "D�tail par famille (1 AB � 130 F, 1 AB � 180 F, 1 AB � 140 F, 1 EH � 350 F)"
      bdc.AddItem "3", "D�tail par param�tre ou par germe, chaque analyse pr�sent�e s�par�ment"
      bdc.AddItem "4", "D�tail par param�tre ou par germe, r�capitulatif total regroup� par germe"
      
    Case "langue":
      bdc.AddItem "F", "Fran�ais"
      bdc.AddItem "A", "Anglais"
      bdc.AddItem "D", "Allemand"
      bdc.AddItem "E", "Espagnol"
      bdc.AddItem "I", "Italien"
      bdc.AddItem "H", "Hollandais"
      bdc.AddItem "P", "Portuguais"
      
    Case "niveauinterv":
      bdc.AddItem "1", "Assistant Pr�leveur (AP)"
      bdc.AddItem "2", "Assistant Conseil (AC)"
      bdc.AddItem "3", "Conseil Hygi�ne Qualit� (CHQ)"
      bdc.AddItem "4", "Consultants (C)"
  
    Case Else:  MsgBox "STOP.8": Stop
  End Select
End Sub


Public Function sNomSyst�meUnix(sLettre As String) As String
  Select Case sLettre
    Case "A": sNomSyst�meUnix = "aix"
    Case "B": sNomSyst�meUnix = "bergamo"
    Case "C": sNomSyst�meUnix = "co2"
    Case "D": sNomSyst�meUnix = "hal"
    Case "E": sNomSyst�meUnix = "cergy"
    Case "F": sNomSyst�meUnix = "flandre"
    Case "G": sNomSyst�meUnix = "grenoble"
    Case "H": sNomSyst�meUnix = "hagar"
    Case "K": sNomSyst�meUnix = "kilt"
    Case "N": sNomSyst�meUnix = "sun"
    Case "O": sNomSyst�meUnix = "osny"
    Case "P": sNomSyst�meUnix = "massy1"
    Case "Q": sNomSyst�meUnix = "quantum"
    Case "R": sNomSyst�meUnix = "microbe"
    Case "S": sNomSyst�meUnix = "spip"
    Case "T": sNomSyst�meUnix = "tripoli"
    Case "U": sNomSyst�meUnix = "roc"
    Case "V": sNomSyst�meUnix = "vienne"
    Case "W": sNomSyst�meUnix = "serveur"
    Case "X": sNomSyst�meUnix = "brux"
    Case "Y": sNomSyst�meUnix = "lyon"
    Case Else: sNomSyst�meUnix = sLettre
  End Select
End Function


' =================================================================================
' Info sur etb

Public Function bIsEtbFimebio(sNumEtb As String) As Boolean
  bIsEtbFimebio = sNumEtb Like "*[A-Z]"
End Function

Public Function bIsEtbErcem(sNumEtb As String) As Boolean
  bIsEtbErcem = Not (sNumEtb Like "*[A-Z]")
End Function


' =================================================================================
' Retourne vrai ou faux si on a acc�s � une op�ration privil�gi�e.
' Soit l'utilisateur a le r�le de s�curit� correspondant (� d�finir)
' Soit on affiche la bo�te de contr�le de cl� d'op�ration privil�gi�e.

Public Function bOkAcc�sPrivil�gi�(sRef As String, sCodeOp�ration As String) As Boolean
  Dim sOp�ration As String
  sOp�ration = sGetIntlLib(sCodeOp�ration, "Op�ration privil�gi�e " & sCodeOp�ration)

  If iNumOp�rateur = 46 Then  ' or if <r�le ad�quat> then return true
    Dim iRep As VbMsgBoxResult
    Dim iCl� As Long
    iCl� = iCalculCl�OpPrivil�gi�e(sRef)
    iRep = MsgBox("Attention - Op�ration privil�gi�e (" & sOp�ration & "), contr�le d�sactiv� pour Pierre VIOLENT." & vbCrLf & "Cl�: " & iCl� & vbCrLf & vbCrLf & "OK pour continuer ?", vbYesNo + vbQuestion, App.Title)
    bOkAcc�sPrivil�gi� = (iRep = vbYes)
  Else
    bOkAcc�sPrivil�gi� = frmContr�leCl�Privil�gi�e.bOkCtrlCl�Ref(sRef, sOp�ration)
  End If
  
  D�monJournalUnix "Op privil�gi�e", sCodeOp�ration, sOp�ration & "|Ref=" & sRef & "|bOkAcc�s=" & bOkAcc�sPrivil�gi�
End Function


Public Function iCalculCl�OpPrivil�gi�e(sRef As String) As Long
  Dim i As Integer, t As Long, s As String
  s = Replace(UCase(sRef), " ", "")
  For i = 1 To Len(s)
    t = t + Asc(Mid(s, i, 1)) * i
  Next
  iCalculCl�OpPrivil�gi�e = t
End Function
