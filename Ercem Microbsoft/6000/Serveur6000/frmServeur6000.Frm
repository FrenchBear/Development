VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmServeur6000 
   Caption         =   "Serveur 6000"
   ClientHeight    =   3990
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   6210
   Icon            =   "frmServeur6000.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   266
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   414
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin MSWinsockLib.Winsock udpNetTime 
      Left            =   1380
      Top             =   60
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin MSWinsockLib.Winsock UDP2 
      Left            =   3720
      Top             =   60
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin VB.Timer timMAJ 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   5220
      Top             =   0
   End
   Begin MSWinsockLib.Winsock TCP 
      Index           =   0
      Left            =   2640
      Top             =   60
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin Serveur6000.cSysTray stTray 
      Left            =   5700
      Top             =   0
      _ExtentX        =   900
      _ExtentY        =   900
      InTray          =   0   'False
      TrayIcon        =   "frmServeur6000.frx":0442
      TrayTip         =   "Serveur6000 (actif)"
   End
   Begin MSWinsockLib.Winsock UDP 
      Left            =   3240
      Top             =   60
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin VB.ListBox lstTrace 
      Height          =   3570
      Left            =   60
      TabIndex        =   1
      Top             =   300
      Width           =   6135
   End
   Begin VB.Image imgIc�ne 
      DragIcon        =   "frmServeur6000.frx":059C
      Height          =   255
      Index           =   4
      Left            =   4740
      Tag             =   "Jaune"
      Top             =   60
      Width           =   255
   End
   Begin VB.Image imgIc�ne 
      DragIcon        =   "frmServeur6000.frx":06E6
      Height          =   255
      Index           =   3
      Left            =   4380
      Tag             =   "Vert"
      Top             =   60
      Width           =   255
   End
   Begin VB.Image imgIc�ne 
      DragIcon        =   "frmServeur6000.frx":0830
      Height          =   255
      Index           =   2
      Left            =   4860
      Tag             =   "Bleu"
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgIc�ne 
      DragIcon        =   "frmServeur6000.frx":097A
      Height          =   255
      Index           =   1
      Left            =   4560
      Tag             =   "Noir"
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgIc�ne 
      DragIcon        =   "frmServeur6000.frx":0AC4
      Height          =   255
      Index           =   0
      Left            =   4260
      Tag             =   "Rouge"
      Top             =   0
      Width           =   255
   End
   Begin VB.Label Label2 
      Caption         =   "&Ev�nements:"
      Height          =   255
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   975
   End
   Begin VB.Menu mnuTray 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdVisible 
         Caption         =   "&Visible"
      End
      Begin VB.Menu cmdSysTray 
         Caption         =   "&Ic�ne SysTray"
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdEx�cuter 
         Caption         =   "&Ex�cuter�"
         Shortcut        =   ^X
      End
      Begin VB.Menu cmdMAJ 
         Caption         =   "&Mise � jour"
      End
      Begin VB.Menu sep1a 
         Caption         =   "-"
      End
      Begin VB.Menu cmdInitialisation 
         Caption         =   "I&nitialisation"
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de�"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
End
Attribute VB_Name = "frmServeur6000"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Serveur port 6000
' Relais lanceur de programmes
' Est � l'�coute sur le port 6000, et ex�cute les commandes re�ues via ShellExecute
' et g�re lui-m�me quelques commandes d'administration
'  2/11/1996 PV Premi�re version avec le contr�le UDP NetManage
' 16/04/1997 PV v 1.2 Utilisation du contr�le UDP VB5 Microsoft
' 20/11/1997 PV v 1.3 Ic�ne dans le systray
' 21/11/1997 PV v 2.0 Serveur TCP et UDP, langage de commandes
' 25/11/1997 PV v 2.1 Informations m�moire, DFREE d�taill�, mise � jour automatique MAJ6000
' 29/11/1997 PV v 2.2 DFREE sur les volumes FAT32; Connexion r�seau associ�e � une unit�; Enum�ration de cl�s de la registry
' 19/04/1998 PV v 2.3 Commande version; test de version pour la mise � jour
' 26/05/1998 PV v 2.4 Infos r�seau, mise � l'heure automatique, messages HTML
' 15/07/1998 PV v 2.5 Contr�le correct de la connexion au disque Z
' 28/08/1998 PV v 2.6 Mise � l'heure forc�e du micro d'Olivia. Reboot et Haltsys
' 14/10/1998 PV v 2.7 VB6; tcpNetTime --> udpNetTime; fin du micro olivia
' 19/10/1998 PV v 2.8 Mise � jour des infos de fuseau horaire
' 23/10/1998 PV v 2.9 Commande WallPaper
' 30/11/1998 PV v 2.10 Chien de garde � 10s pour GetNetworkDateTime;commande PS (liste des fen�tres); More
' 27/07/1999 PV v 2.11 Workgroup dans netinfo
'  3/10/1999 PV v 2.12 Fin du contr�le du fuseau horaire; Ercem --> Silliker
' 22/04/2000 PV v 2.13 MAJZ automatique
' 28/04/2000 PV v 3.0  Simplification, plus de transferts FTP, ...
' 12/10/2000 PV v 3.1  Disque syst�me X:
' 26/10/2000 PV v 3.2  Mise � jour automatique des raccourcis Z: -> X: au d�marrage; tempo de d�marrage
' 12/12/2001 PC v 3.3.1 fonction mise � jour symbole mon�taire pour le passage � l'�uro
' 21/12/2001 PC v 3.3.2 gestion plus fine des stations win9x pour m�j symb mon�taire

' Reste � faire:
' Editeur de ligne de commande (fl�ches�)
' Historique des commandes
' Gestion compl�te des chemins UNC
'
' Au fait, g�rer de multiples connexions TCP simultan�es, est-ce utile ?

Option Explicit

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

' Niveau de trace
' 0: Pas de trace
' 1: Connexion et commandes
' 2: 1+initialisations
Dim iNivTraceActuel As Integer

Private Enum eCouleur
  coNoir
  coRouge
  coBleu
  coJaune
  coVert
End Enum


Private bQuitter As Boolean   ' Pour que la case de fermeture soit trait�e comme un passage en mode invisible

Private iDiviseurTimer As Integer ' Pour une mise � jour auto toutes les heures
  
' Structure m�morisant les informations d'une connexion TCP en cours
Private Type Connexion
  bEcho As Boolean            ' Vrai s'il faut assurer l'�cho des commandes
  bConnexion As Boolean       ' Vrai si la connexion est �tablie
  sBuffer As String           ' Buffer caract�re de r�ception
  sPrompt As String           ' Probl�me de le g�rer en environnement commun
  bCommandeEnCours As Boolean ' Vrai si le programme est en train de traiter une commande pr�c�dente
End Type

Const MAXCONNEXION = 2        ' Nb maxi de connexions TCP simultan�es
Dim t(1 To MAXCONNEXION) As Connexion

' acc�s au Win.ini, MonApp.ini
Private Declare Function GetProfileString Lib "kernel32" Alias "GetProfileStringA" _
  (ByVal lpAppName As String, ByVal lpKeyName As String, ByVal lpDefault As String, _
   ByVal lpReturnedString As String, ByVal nSize As Long) As Long
Private Declare Function WriteProfileString Lib "kernel32" Alias "WriteProfileStringA" _
  (ByVal lpszSection As String, ByVal lpszKeyName As String, ByVal lpszString As String) As Long
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" _
  (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, _
   ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" _
  (ByVal lpApplicationName As String, ByVal lpKeyName As Any, _
   ByVal lpString As Any, ByVal lpFileName As String) As Long
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" _
  (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" _
  (ByVal lpBuffer As String, ByVal nSize As Long) As Long

' Infos r�seau, heure r�seau
Private sNetworkTime_Result As String
Const sInfosR�seau As String = "NetInfo.ini"

Public sLocalHostName As String, sLocalIP As String
Public sR�seau As String, sTimeServer As String, sZ As String
Public sWorkgroup As String


Dim colIc�nes As New Collection     ' Collection d'imgIc�nes (DragIcon en couleur)


' ==================================================================
' Commandes des menus

Public Sub mnuTray_Click()
  cmdMAJ.Enabled = bVersionPlusR�centeSurSysDisk
End Sub

Public Sub cmdVisible_Click()
  cmdVisible.Checked = Not cmdVisible.Checked
  Visible = cmdVisible.Checked
End Sub

Public Sub cmdSysTray_Click()
  cmdSysTray.Checked = Not cmdSysTray.Checked
  If cmdSysTray.Checked Then
    stTray.InTray = True
  Else
    stTray.InTray = False
  End If
End Sub

Private Sub cmdEx�cuter_Click()
  Static sCmd As String
  sCmd = InputBox("Commande � ex�cuter ?", sNomApp, sCmd)
  If sCmd <> "" Then CommandeTCP6000 0, sCmd
End Sub

Public Sub FinServeur6000()
  bQuitter = True
  PostMessage Me.hwnd, WM_CLOSE, 0&, 0&           ' Close window(Unload Me will GPF)
End Sub

Private Sub cmdQuitter_Click()
  FinServeur6000
End Sub


Private Sub cmdInitialisation_Click()
  Ic�ne coRouge
  InitR�seau
  Ic�ne coNoir
End Sub



Private Sub cmdAPropos_Click()
  MsgBox "Serveur 6000 V" & App.Major & "." & App.Minor & "." & App.Revision & vbCrLf & "Serveur TCP/UDP de commandes sur le port 6000" & vbCrLf & vbCrLf & "(c) SILLIKER/P.VIOLENT 1996-2000", vbInformation, sNomApp
End Sub


Private Sub cmdMAJ_Click()
  On Error GoTo Probl�meMAJ
  
  MiseAJour True    ' Mise � jour avec message
  Exit Sub
  
Probl�meMAJ:
  MsgBox "�chec � la mise � jour (" & Err.Source & "), Err=" & Err.Number & ": " & Err.Description, vbExclamation, sNomApp
End Sub


' ==================================================================
' Helpers

' Retourne le disque syst�me, X: ou Z:
Function sSysDisk() As String
  If Dir("X:\", vbDirectory) <> "" Then
    sSysDisk = "X:"
  ElseIf Dir("Z:\", vbDirectory) <> "" Then
    sSysDisk = "Z:"
  Else
    sSysDisk = ""
  End If
End Function


' Teste s'il existe un fichier de m�me nom plus r�cent sur $SysDisk\microbsoft\
' Public: appel� par la commande MAJ6000
' Pour aller plus vite, on compare les dates
' On ne teste la version r�elle que si les dates diff�rent, ce qui peut
' �tre provoqu� par un changement de fuseau horaire
Public Function bVersionPlusR�centeSurSysDisk() As Boolean
Attribute bVersionPlusR�centeSurSysDisk.VB_Description = "Mise � jour du symbole mon�taire dans le panneau de configuration"
  If App.LogMode = 0 Then GoTo SkipExeSizeControl   ' Empirique, pour �viter le message de MAJ pendant le d�veloppement
  On Error GoTo SkipExeSizeControl
  
  Dim sSys As String
  sSys = sSysDisk
  If sSys = "" Then GoTo SkipExeSizeControl
  
  Dim DateProg As Date, DateProgZ As Date
  DateProg = FileDateTime(App.Path & "\" & App.EXEName & ".exe")
  DateProgZ = FileDateTime(sSys & "\microbsoft\" & App.EXEName & ".exe")
  If DateProg = DateProgZ + 1 Then
    bVersionPlusR�centeSurSysDisk = False
  Else
    Dim VerInfo As VS_FIXEDFILEINFO
    If Not GetVersion(sSys & "\microbsoft\" & App.EXEName & ".exe", VerInfo) Then
      bVersionPlusR�centeSurSysDisk = True
    Else
      Dim sProg As String, sZ As String
      sProg = Format(App.Major, "00") & Format(App.Minor, "000") & Format(App.Revision, "000")
      sZ = Format(VerInfo.dwFileVersionMSh, "00") & Format(VerInfo.dwFileVersionMSl, "000") & Format(VerInfo.dwFileVersionLSl, "000")
      bVersionPlusR�centeSurSysDisk = sZ > sProg
    End If
  End If
  Exit Function
  
SkipExeSizeControl:
  bVersionPlusR�centeSurSysDisk = False
End Function


Public Sub Trace(iNiveau As Integer, sMessage As String)
  If iNiveau <= iNivTraceActuel Then
    lstTrace.AddItem Date & " " & Time & " " & sMessage
  End If
End Sub


Private Sub Ic�ne(cCouleur As eCouleur)
  Select Case cCouleur
    Case coNoir:  Set stTray.TrayIcon = colIc�nes("Noir").DragIcon
    Case coRouge: Set stTray.TrayIcon = colIc�nes("Rouge").DragIcon
    Case coBleu:  Set stTray.TrayIcon = colIc�nes("Bleu").DragIcon
    Case coVert:  Set stTray.TrayIcon = colIc�nes("Vert").DragIcon
    Case coJaune: Set stTray.TrayIcon = colIc�nes("Jaune").DragIcon
  End Select
End Sub


' ==================================================================
' Ev�nements de la feuille

Private Sub Form_Load()
  If App.PrevInstance Then
    MsgBox "Serveur6000 est d�ja charg� !", vbExclamation, sNomApp
    End
  End If
  
  
  ' Tempo 6s pour laisser au script d'ouverture le temps de connecter les disques...
  ' et au syst�me de souffler un peu au chargement !
  If App.LogMode <> 0 Then  ' Empirique, mode .exe
    Sleep 6000
  End If
  

  
  Dim p As Integer
  p = InStr(1, Command, "-d", vbTextCompare)
  If p > 0 Then iNivTraceActuel = Val(p + 2)
  
  Dim img As Image
  For Each img In imgIc�ne
    colIc�nes.Add img, img.Tag
  Next
  
'  ' Contr�le du fuseau horaire
'  Trace 2, "0: Fuseau horaire"
'  Dim StdStart
'  StdStart = R�cup�reValeurRegistry("HKEY_LOCAL_MACHINE\System\CurrentControlSet\control\TimeZoneInformation", "StandardStart", "REG_DWORD")
'  Trace 2, "0.1: StandardStart: " & StdStart
'  If StdStart <> "00 00 0A 00 00 00 05 00 03 00 00 00 00 00 00 00 " Then
'    Trace 2, "0.2: Chargement de $SysDisk\MicrobSoft\TimeZone.reg"
'    On Error Resume Next
'    FileShellExecute hwnd, sSysDisk & "\MicrobSoft\TimeZone.reg"
'    On Error GoTo 0
'  Else
'    Trace 2, "0.2: Ok !"
'  End If

  ' Mise � jour Ercem --> Silliker
  MiseAJourErcemToSilliker
  
  
  ' Mise � jour des raccourcis du menu microbsoft, X: -> Z:
  ' La mise � jour n'est tent�e que si X: est connect�, sinon un bug de WSHShell.CreateShortcut
  ' cr�e un raccourci avec chaque �l�ment du path tronqu� � 8 caract�res, donc invalide...
  If Dir("X:\", vbDirectory) <> "" Then MiseAJourRaccourcis

  MajSymboleMon�taire "�"
  
  ' En mode ex�cutable, la fen�tre est invisible par d�faut
  ' et on affiche un ic�ne dans le SystemTray.
  ' En mode d�veloppement, la fen�tre est rendue visible
  ' et il n'y a pas d'ic�ne dans le SystemTray
  Trace 2, "1: Affichage fen�tre / ic�ne SystemTray"
  If App.LogMode = 0 Then  ' Empirique, mode environnement de d�veloppement
    cmdVisible_Click
  Else
    cmdSysTray_Click
  End If
  
  ' On r�cup�re l'environnemement
  Trace 2, "2: Initialisation environnement"
  InitEnv
  
  ' Mise � l'heure, connexions r�seau�
  Trace 2, "3: Initialisation r�seau"
  InitR�seau
  
  
  On Error GoTo Probl�me�coute
  ' �coute UDP
  Trace 2, "4: Mise � l'�coute UDP"
  UDP.LocalPort = 6000
  UDP.Bind
  
  ' �coute TCP
  Trace 2, "5: Mise � l'�coute TCP"
  TCP(0).LocalPort = 6000
  TCP(0).Listen
  On Error GoTo 0
  
  ' On affiche le num�ro de version apr�s une mise � jour
  If UCase(Command) = "-V" Then cmdAPropos_Click
  
  ' D�marrage du timer de MAJ automatique
  iDiviseurTimer = 55     ' Premi�re mise � jour dans 5 minutes
  timMAJ.Enabled = True
  Trace 2, "6: Fin de l'initialisation de Serveur6000"
  
  Ic�ne coNoir
  Exit Sub
  
Probl�me�coute:
  Trace 2, "$: Probl�me�coute !"
  MsgBox "Probl�me lors de l'initialisation de l'�coute sur le port 6000. V�rifiez que le r�seau fonctionne bien, et que serveur6000 ne s'ex�cute pas d�j� sur cette machine." & vbCrLf & vbCrLf & "Err: " & Err & ": " & Error, vbExclamation, sNomApp
  FinServeur6000
End Sub


' M�canisme pas tr�s standard, une tentative de fermeture de la
' fen�tre par la croix de fermeture ou le menu syst�me ou Alt+F4
' rend la fen�tre invisible en mode bSysTrayIcon.
' C'est comme �a que fonctionne la fen�tre de l'agent syst�me.
' On ne fait �a que si UnloadMode vaut vbFormControlMenu  (fermeture menu syst�me)
' pour ne pas emp�cher Windows de se terminer !
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If UnloadMode = vbFormControlMenu And cmdSysTray.Checked And Not bQuitter And cmdVisible.Checked Then
    cmdVisible_Click
    Cancel = 1
  End If
End Sub

Private Sub Form_Resize()
  Line (0, 0)-(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-(ScaleWidth, 1), vb3DHighlight
  If ScaleWidth > 100 Then lstTrace.Width = ScaleWidth - lstTrace.Left * 2
  If ScaleHeight > 50 Then lstTrace.Height = ScaleHeight - 30
End Sub

Private Sub Form_Paint()
  Line (0, 0)-(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-(ScaleWidth, 1), vb3DHighlight
End Sub


' ==================================================================
' Ev�nements en provenance du SystemTray

Private Sub stTray_MouseUp(Button As Integer, Id As Long)
  ' SetForegroundWindow and PostMessage (WM_USER) must wrap all popup menu's _
    in order to work correctely with the Notification Icons� _
    (* see KB article Q1357888 for more info *)
  SetForegroundWindow Me.hwnd                     ' Set current window as ForegroundWindow
  
  Select Case Button                              ' Track mouse clicks�
    Case vbRightButton
      Me.PopupMenu mnuTray, vbPopupMenuRightButton  ' Popup memu�
  End Select
  
  PostMessage Me.hwnd, WM_USER, 0&, 0&            ' Update form�
End Sub

Private Sub stTray_MouseDblClick(Button As Integer, Id As Long)
  cmdVisible_Click
End Sub


' =============================================================================
' Ev�nements UDP, cas simple

Private Sub UDP_DataArrival(ByVal bytesTotal As Long)
  Dim strData As String
  UDP.GetData strData
  
  UDP2.RemoteHost = UDP.RemoteHostIP
  UDP2.RemotePort = UDP.RemotePort

  Trace 1, "UDP DataArrival IP=" & UDP.RemoteHostIP & " Port=" & UDP.RemotePort & " Data=" & strData
  Dim i As Integer
  For i = Len(strData) To 1 Step -1
    If Mid(strData, i, 1) <> vbCr And Mid(strData, i, 1) <> vbLf Then Exit For
  Next
  If i <> Len(strData) Then strData = Left(strData, i)
'  MsgBox "Commande UDP: " & strData & vbCrLf & "R�ponse � retourner � " & UDP.RemoteHost & " [" & UDP.RemoteHostIP & "] " & UDP.RemotePort
  If Len(strData) > 0 Then CommandeTCP6000 -1, strData
End Sub

Private Sub UDP_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
  Trace 1, "UDP Error Number:" & Number & " Description:" & Description & " Scode:" & Scode & " Source:" & Source & " HelpFile:" & HelpFile & " HelpContext:" & HelpContext & " CancelDisplay:" & CancelDisplay
End Sub


' =============================================================================
' Ev�nements TCP

Private Sub TCP_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
  Trace 1, "TCP[" & Index & "]_Error  Error Number:" & Number & " Description:" & Description & " Scode:" & Scode & " Source:" & Source & " HelpFile:" & HelpFile & " HelpContext:" & HelpContext & " CancelDisplay:" & CancelDisplay
End Sub


Private Sub TCP_ConnectionRequest(Index As Integer, ByVal requestID As Long)
  Dim sKey As String, iNumConnexion As Integer
  
  For iNumConnexion = 1 To MAXCONNEXION
    If Not t(iNumConnexion).bConnexion Then Exit For
  Next
  If iNumConnexion > MAXCONNEXION Then
    MsgBox "Nombre maxi de connexions simultant�es (" & MAXCONNEXION & ") atteint !"
    Exit Sub
  End If
  
  Ic�ne coVert
  t(iNumConnexion).bConnexion = True
  t(iNumConnexion).sBuffer = ""
  t(iNumConnexion).bEcho = True
  t(iNumConnexion).sPrompt = GetEnv(0, "PROMPT")    ' On r�cup�re le prompt de base
  Load TCP(iNumConnexion)
  TCP(iNumConnexion).Accept requestID
  Trace 1, "TCP[" & iNumConnexion & "]: Connexion"
  
  TCP(iNumConnexion).SendData "Serveur 6000 V" & App.Major & "." & App.Minor & "." & App.Revision & vbCrLf & "Serveur TCP/UDP de commandes sur le port 6000" & vbCrLf & "(c) SILLIKER/P.VIOLENT 1996-2000" & vbCrLf & vbCrLf
  modCommande6000.RetourPrompt iNumConnexion
End Sub


' Re�oit les donn�es, les d�coupe en lignes (termin�es par combinaison de \r ou \n)
Private Sub TCP_DataArrival(Index As Integer, ByVal bytesTotal As Long)
  Dim vtData As String
  Dim p As Integer, p1 As Integer, p2 As Integer
  Dim sLigne As String
  
  TCP(Index).GetData vtData
  
  If bModeMore Then
    sBufferMore = sBufferMore & vtData
    Exit Sub
  End If
  
  t(Index).sBuffer = t(Index).sBuffer & vtData
  
  ' Pas de r�-entrance pour le traitement des commandes !!!
  ' Mais on ex�cutera la commande � la fin de la commande actuelle
  If t(Index).bCommandeEnCours Then Exit Sub
  
  ' Traitement �l�mentaire du backspace, en attendant un �diteur de ligne de commande
  Do
    p1 = InStr(t(Index).sBuffer, Chr(8))
    If p1 = 0 Then Exit Do
    If p1 = 1 Then
      t(Index).sBuffer = Mid(t(Index).sBuffer, 2)
    Else
      t(Index).sBuffer = Left(t(Index).sBuffer, p1 - 2) & Mid(t(Index).sBuffer, p1 + 1)
    End If
  Loop
  
  ' Echo fourni si n�cessaire par serveur6000
  ' Reste � comprendre pourquoi Telnet sous Unix assure l'�cho, et pas VTerm.
  ' Une subtilit� du protocole telnet � comprendre�
  If t(Index).bEcho Then
    TCP(Index).SendData vtData
  End If
  
  Do
    If Left(t(Index).sBuffer, 1) = Chr(4) Then
      p = 2
    Else
      p1 = InStr(t(Index).sBuffer, Chr(10))
      p2 = InStr(t(Index).sBuffer, Chr(13))
      If p1 = 0 Then p1 = 1000
      If p2 = 0 Then p2 = 1000
      p = p1
      If p2 < p Then p = p2
      If p = 1000 Then Exit Do
    End If
    sLigne = Left(t(Index).sBuffer, p - 1)
    Trace 1, "TCP[" & Index & "], IP=" & TCP(Index).RemoteHostIP & ": R " & sLigne
    
    ' Echo du LF en fin de commande
    If t(Index).bEcho Then TCP(Index).SendData Chr(10)
    
    Ic�ne coJaune
    t(Index).bCommandeEnCours = True
    CommandeTCP6000 Index, sLigne
    t(Index).bCommandeEnCours = False
    If t(Index).bConnexion Then Ic�ne coVert
    
    Do
      p = p + 1
      If p > Len(t(Index).sBuffer) Then Exit Do
      If Mid(t(Index).sBuffer, p, 1) <> Chr(13) And Mid(t(Index).sBuffer, p, 1) <> Chr(10) Then Exit Do
    Loop
    t(Index).sBuffer = Mid(t(Index).sBuffer, p)
  Loop
End Sub


Public Sub TCP_Close(Index As Integer)
  Trace 1, "TCP[" & Index & "]: Close"
  Unload TCP(Index)
  t(Index).bConnexion = False
  
  Dim iNumConnexion As Integer, bConnect� As Boolean
  bConnect� = False
  For iNumConnexion = 1 To MAXCONNEXION
    If t(iNumConnexion).bConnexion Then
      bConnect� = True
      Exit For
    End If
  Next
  If Not bConnect� Then
    Ic�ne coNoir   ' Le derniere connexion TCP ferm�e ram�ne l'ic�ne en noir
  Else
    Ic�ne coVert
  End If
End Sub


' =============================================================================
' Acc�s � l'�cho

Public Sub SetEcho(Index As Integer, bNouveauMode As Boolean)
  If Index > 0 Then
    t(Index).bEcho = bNouveauMode
  End If
End Sub

Public Function GetEcho(Index As Integer) As Boolean
  If Index <= 0 Then
    GetEcho = False
  Else
    GetEcho = t(Index).bEcho
  End If
End Function


' =============================================================================
' Acc�s au prompt

Public Sub SetPrompt(Index As Integer, ByVal sNouveauPrompt As String)
  If Index > 0 Then
    t(Index).sPrompt = sNouveauPrompt
  End If
End Sub

Public Function GetPrompt(Index As Integer) As String
  If Index <= 0 Then
    GetPrompt = ""
  Else
    GetPrompt = t(Index).sPrompt
  End If
End Function


' =============================================================================
' Infos sur une connexion

Public Function InfoConnexion(Index As Integer) As String
  If Index = 0 Then
    InfoConnexion = "Commande interactive"
  ElseIf Index < 0 Then
    InfoConnexion = "Connexion UDP"
  Else
    InfoConnexion = "Connexion TCP de " & TCP(Index).RemoteHostIP
  End If
End Function


  
' =============================================================================
' Mise � jour

Public Sub MiseAJour(bAvecMessage As Boolean)
  Dim bIc�neAffich� As Boolean
  
  ' On arr�te le timer par s�curit�
  timMAJ.Enabled = False
  
  ' Mise � jour
  ' On enl�ve l'ic�ne dy systray pour �viter les probl�mes�
  If frmServeur6000.cmdSysTray.Checked Then
    frmServeur6000.cmdSysTray_Click
    bIc�neAffich� = True
  End If
  
  On Error GoTo Probl�meShell
  Shell App.Path & "\maj6000.exe """ & frmServeur6000.Caption & """ " & sSysDisk & "\microbsoft\serveur6000.exe """ & App.Path & "\" & App.EXEName & ".exe"" " & IIf(bAvecMessage, "-V", ""), vbNormalFocus
  frmServeur6000.FinServeur6000     ' On se termine sans autre forme de proc�s !!!
  Exit Sub
  
Probl�meShell:
  ' En cas de probl�me lors du shell, on restaure l'ic�ne SystemTray et le timer
  If bIc�neAffich� Then frmServeur6000.cmdSysTray_Click
  timMAJ.Enabled = True
  
  Err.Raise 6015, "CmdMaj6000", "Echec au shell maj6000, Err=" & Err & ": " & Error
End Sub


' Suivi de la mise � jour
' Un �v�nement timer par minute, on divise par 60 pour faire une mise � jour automatique par heure
Private Sub timMAJ_Timer()
  iDiviseurTimer = iDiviseurTimer + 1
  If iDiviseurTimer < 60 Then Exit Sub
  
  iDiviseurTimer = 0
  If bVersionPlusR�centeSurSysDisk Then MiseAJour False
End Sub



' ==================================================================
' Heure r�seau

Public Function sGetProfile(ByVal sFichier As String, ByVal sSection As String, ByVal sCl� As String, ByVal sD�faut As String) As String
  Dim sRes As String, l As Long
  sRes = Space(500)
  l = GetPrivateProfileString(sSection, sCl�, sD�faut, sRes, 500, sFichier)
  sGetProfile = Left(sRes, l)
End Function

Public Function sReadWinIni(ByVal sSection As String, ByVal sCl� As String, Optional ByVal sD�faut As String = "") As String
' PC 21/12/2001
' lecture de la valeur d'une cl� d'une section du fichier Win.Ini

  Const iLongBuf As Integer = 512 ' taille du buffer de r�ception
  Dim sRes As String  ' chaine retourn�e par la fonction API
  Dim l As Long         ' taille de la chaine
  
  sRes = String(iLongBuf, vbNullChar)  ' terminaison par un caract�re null, chaine type C
  sSection = sSection & vbNullChar: sCl� = sCl� & vbNullChar: sD�faut = sD�faut & vbNullChar
  l = GetProfileString(sSection, sCl�, sD�faut, sRes, iLongBuf)
  sReadWinIni = Left(sRes, l)

End Function

Public Function bWriteWinIni(ByVal sSection As String, ByVal sCl� As String, ByVal sValeur As String) As Boolean
' PC 21/12/2001
' �criture de la valeur d'une cl� d'une section du fichier Win.Ini
' retourne vrai si l'�criture s'est bien d�roul�e

  Dim l As Long         ' retour de la fonction API
  
  sSection = sSection & vbNullChar: sCl� = sCl� & vbNullChar: sValeur = sValeur & vbNullChar
  l = WriteProfileString(sSection, sCl�, sValeur)
  bWriteWinIni = l <> 0

End Function

Private Function GetNetworkDateTime(ByVal sTimeServer As String, ByRef sDate As String, ByRef sTime As String)
  Dim tM�dor As Single      ' Chien de garde !
  
  tM�dor = Timer
  Trace 2, "3.3.1: D�but GetNetworkDateTime"
  udpNetTime.Connect sTimeServer, 13
  Do
    DoEvents
    If Timer - tM�dor > 10 Then GoTo TimeOut
  Loop Until udpNetTime.State = sckOpen Or udpNetTime.State = sckError
  Trace 2, "3.3.2: GetNetworkDateTime connect�"
  Do
    DoEvents
    If Timer - tM�dor > 10 Then GoTo TimeOut
  Loop Until udpNetTime.State = sckClosed Or udpNetTime.State = sckError
  Trace 2, "3.3.3: GetNetworkDateTime d�connect�"
  
  If udpNetTime.State = sckError Then
    sDate = ""
    sTime = ""
  Else
    Dim iMois As Integer
    Select Case Mid(sNetworkTime_Result, 5, 3)
      Case "Jan": iMois = 1
      Case "Feb": iMois = 2
      Case "Mar": iMois = 3
      Case "Apr": iMois = 4
      Case "May": iMois = 5
      Case "Jun": iMois = 6
      Case "Jul": iMois = 7
      Case "Aug": iMois = 8
      Case "Sep": iMois = 9
      Case "Oct": iMois = 10
      Case "Nov": iMois = 11
      Case "Dec": iMois = 12
      Case Else: Stop
    End Select
    sDate = Mid(sNetworkTime_Result, 9, 2) & "/" & iMois & "/" & Mid(sNetworkTime_Result, 21, 4)
    sTime = Mid(sNetworkTime_Result, 12, 8)
  End If
  Trace 2, "3.3.4: Fin GetNetworkDateTime"
  Exit Function
  
TimeOut:
  Trace 0, "3.3.5: TimeOut GetNetworkDateTime"
  sDate = ""
  sTime = ""
End Function

Private Sub udpNetTime_DataArrival(ByVal bytesTotal As Long)
  udpNetTime.GetData sNetworkTime_Result, vbString
  udpNetTime.Close
End Sub


Private Sub InitR�seau()
  Trace 2, "3.1: R�cup infos"
  sLocalHostName = udpNetTime.LocalHostName
  sLocalIP = udpNetTime.LocalIP
  
  'R�cup�ration du WorkGroup
  If iGetOSPlatform = 2 Then
    sWorkgroup = "SILLIKERNT"
  Else
    sWorkgroup = R�cup�reValeurRegistry("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP", "Workgroup", "REG_SZ")
  End If
  
  Dim sSection As String
  sSection = Left(udpNetTime.LocalIP, 11)   ' Pas bon dans l'absolu, � arr�ter au 3�me point
  
  Trace 2, "3.2: Acc�s au profile"
  sR�seau = sGetProfile(sInfosR�seau, sSection, "R�seau", "")
  sTimeServer = sGetProfile(sInfosR�seau, sSection, "TimeServer", "")
  sZ = sGetProfile(sInfosR�seau, sSection, "Z", "")
  
  If sTimeServer <> "" Then
    Trace 2, "3.3: Network time"
    On Error GoTo Probl�me
    Dim sNetDate As String, sNetTime As String
    GetNetworkDateTime sTimeServer, sNetDate, sNetTime
    If sNetTime <> "" Then
      If CDate(sNetDate) = Date And Abs(CDate(sNetTime) - Time) < 2 / 24 Then
        Date = sNetDate
        Time = sNetTime
      Else
        HMsgBox "�chec de la mise � l'heure automatique" & vbCrLf & "Il y a plus de deux heures d'�cart entre l'heure du micro et l'heure r�seau. Mettez imp�rativement � l'heure le micro, ou pr�venez le service informatique en cas de probl�me." & vbCrLf & vbCrLf & "Heure micro: " & Date & " " & Time & vbCrLf & "Heure r�seau (" & sTimeServer & "): " & sNetDate & " " & sNetTime
      End If
    End If
  End If
  
'  Dim sSys As String
'  sSys = sSysDisk
'  Trace 2, "3.4: Acc�s " & sSys
'  If sZ <> "" And sSys = "" Then
'    HMsgBox "�chec lors de l'acc�s au disque X:" & vbCrLf & "Impossible d'acc�der au disque r�seau X:, cela emp�che le fonctionnement correct du syst�me." & vbCrLf & "Consultez la documentation du guide SOS http://www.silliker/sos 'connexion d'un disque r�seau' pour r�tablir l'unit� X:, et pr�venez le service informatique en cas de probl�me." & vbCrLf & "R�seau: " & sR�seau & vbCrLf & "Unit� X: " & sZ
'    On Error GoTo 0
'  End If
  
  Trace 2, "3.5: Fin init r�seau"
  Exit Sub
  
Probl�me:
  Trace 0, "3.$: Probl�me"
End Sub

Public Sub MajSymboleMon�taire(sSymboleMon�taire As String)
' PC 12/12/2001
' mise � jour du symbole mon�taire dans la base de registre
' en entr�e : sSymboleMon�taire : nouveau symbole mon�taire � affecter au syst�me
' code insuffisant : n'est pas pris en compte dans Excel avec des cellules au format mon�taire avec le symbole par d�faut
' pourtant est bien vu par le panneau de conf
' PC 21/12/2001 : prise en compte correcte plateformes 9x

  Const sChemin As String = "HKEY_CURRENT_USER\Control Panel\International"
  Const sTypeCl� As String = "REG_SZ"
  Const sSection As String = "intl"
  Const sNomCl� As String = "sCurrency"
  
  Dim sAncSymbMon As String       ' ancien symbole mon�taire
  Dim bOkEcritWinIni As Boolean     ' test �criture win.ini
  Dim iVerWin As Integer              ' version de windows (1:9x - 2:nt)
  
  iVerWin = iGetOSPlatform
  If iVerWin = 1 Then ' sous Win 9x, ME
    sAncSymbMon = sReadWinIni(sSection, sNomCl�)
  Else
    On Error Resume Next
    sAncSymbMon = R�cup�reValeurRegistry(sChemin, sNomCl�, sTypeCl�)
    On Error GoTo 0
  End If
    
  If sAncSymbMon <> sSymboleMon�taire Then
    If iVerWin = 1 Then bOkEcritWinIni = bWriteWinIni(sSection, sNomCl�, sSymboleMon�taire)
    D�finitValeurRegistry sTypeCl�, sChemin, sNomCl�, sSymboleMon�taire
    MsgBox "Le symbole mon�taire du syst�me a �t� bascul� sur " & sSymboleMon�taire
  End If

End Sub
