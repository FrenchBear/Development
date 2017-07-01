VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmWPrint 
   Caption         =   "Serveur d'impression Microb'Soft"
   ClientHeight    =   4065
   ClientLeft      =   1185
   ClientTop       =   1830
   ClientWidth     =   9180
   Icon            =   "frmWPrint.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   271
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   612
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin WPrint.cSysTray stTray 
      Left            =   3600
      Top             =   60
      _ExtentX        =   900
      _ExtentY        =   900
      InTray          =   0   'False
      TrayIcon        =   "frmWPrint.frx":014A
      TrayTip         =   "Serveur d'impression WPrint"
   End
   Begin InetCtlsObjects.Inet FTP 
      Index           =   0
      Left            =   4320
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   327681
      Protocol        =   2
      RemotePort      =   21
      URL             =   "ftp://"
   End
   Begin MSWinsockLib.Winsock TCP 
      Index           =   0
      Left            =   5280
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   327681
   End
   Begin VB.TextBox txtTrace 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   60
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   1680
      Width           =   9015
   End
   Begin VB.Timer timMédor 
      Interval        =   1000
      Left            =   6720
      Top             =   0
   End
   Begin VB.ListBox lstTrace 
      Height          =   1230
      Left            =   60
      TabIndex        =   1
      Top             =   360
      Width           =   9015
   End
   Begin MSComctlLib.ListView lwFile 
      Height          =   1695
      Left            =   60
      TabIndex        =   3
      Top             =   2280
      Width           =   9015
      _ExtentX        =   15901
      _ExtentY        =   2990
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   0   'False
      HideSelection   =   0   'False
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   6
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Réf"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(2) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   1
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Formateur"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(3) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   2
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Titre"
         Object.Width           =   1323
      EndProperty
      BeginProperty ColumnHeader(4) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   3
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Lancé par"
         Object.Width           =   1587
      EndProperty
      BeginProperty ColumnHeader(5) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   4
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Le"
         Object.Width           =   3043
      EndProperty
      BeginProperty ColumnHeader(6) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   5
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Imprimante"
         Object.Width           =   2117
      EndProperty
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "&Traitements en cours :"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   2040
      Width           =   1575
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&Evénements TCP :"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdVisibleFichier 
         Caption         =   "&Visible"
      End
      Begin VB.Menu cmdSysTrayFichier 
         Caption         =   "&Icône SysTray"
      End
      Begin VB.Menu sep6 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFormateurs 
         Caption         =   "&Formateurs…"
      End
      Begin VB.Menu cmdSynonymes 
         Caption         =   "&Synonymes d'imprimantes…"
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdEffaceEvénements 
         Caption         =   "&Vider la liste d'événements"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de…"
      End
   End
   Begin VB.Menu mnuTray 
      Caption         =   "(SysTray)"
      Visible         =   0   'False
      Begin VB.Menu cmdVisible 
         Caption         =   "&Visible"
      End
      Begin VB.Menu cmdSysTray 
         Caption         =   "&Icône SysTray"
      End
      Begin VB.Menu sep5 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAProposTray 
         Caption         =   "&A propos de…"
      End
      Begin VB.Menu cmdQuitterTray 
         Caption         =   "&Quitter"
      End
   End
End
Attribute VB_Name = "frmWPrint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Serveur WPrint port 6318
' 18/03/1997 PV
' 14/04/1997 PV Traces FTP
' 18/04/1997 PV Transfert FTP Microsoft, contrôle Winsock Microsoft
'  1/12/1997 PV 1.2.x Icône dans le SystemTray
' 12/12/1997 PV ToolTip de l'icône systray; menu (systray) invisible et dupliqué

Option Explicit

Const MAXCONNEXION = 2        ' Nb maxi de connexions simultanées

Private Type Connexion
  bConnexion As Boolean       ' Vrai si la connexion est établie
  sBuffer As String           ' Buffer caractère de réception
  bOkFormateur As Boolean     ' Vrai s'il faut lancer le formateur en fin
  sFormateur As String        ' Nom du formateur
  itmX As ListItem            ' Accès à la ligne de description dans la file d'attente affichée
  sNomficDistant As String    ' Fichier de données sur le client
  sNomficLocal As String      ' Fichier local
  iNbLignes As Integer        ' Nb de lignes reçues
  sLigne1 As String
  FTPState As InetCtlsObjects.StateConstants  ' Etat de la connexion FTP
End Type

Dim T(1 To MAXCONNEXION) As Connexion

Private bQuitter As Boolean   ' Pour que la case de fermeture soit traitée comme un passage en mode invisible


' ==================================================================
' Commandes des menus

Public Sub cmdVisible_Click()
  cmdVisible.Checked = Not cmdVisible.Checked
  cmdVisibleFichier.Checked = cmdVisible.Checked
  Visible = cmdVisible.Checked
End Sub

Private Sub cmdVisibleFichier_Click()
  cmdVisible_Click
End Sub


Public Sub cmdSysTray_Click()
  cmdSysTray.Checked = Not cmdSysTray.Checked
  cmdSysTrayFichier.Checked = cmdSysTray.Checked
  If cmdSysTray.Checked Then
    stTray.InTray = True
  Else
    stTray.InTray = False
  End If
End Sub

Private Sub cmdSysTrayFichier_Click()
  cmdSysTray_Click
End Sub


Private Sub cmdAPropos_Click()
  MsgBox sVersion & " " & sTitreApp & vbCrLf & "Serveur de requêtes d'impression sur le port 6318" & vbCrLf & vbCrLf & "(c) P.Violent / ERCEM mars 97", vbInformation
End Sub

Private Sub cmdAProposTray_Click()
  cmdAPropos_Click
End Sub


Private Sub cmdEffaceEvénements_Click()
  lstTrace.Clear
  txtTrace = ""
End Sub

Private Sub cmdFormateurs_Click()
  frmFormateurs.Show 1
End Sub

Private Sub cmdQuitter_Click()
  FinWPrint
End Sub

Private Sub cmdSynonymes_Click()
  frmSynonymes.Show 1
End Sub

Private Sub cmdQuitterTray_Click()
  FinWPrint
End Sub

' ==================================================================

Private Sub FinWPrint()
  bQuitter = True
  PostMessage Me.hwnd, WM_CLOSE, 0&, 0&           ' Close window(Unload Me will GPF)
End Sub

' ==================================================================
' Evénements de service

Private Sub Form_Load()
  sVersion = "WPrint " & App.Major & "." & App.Minor & "." & App.Revision
  Caption = sVersion & " " & Caption
  
  If App.PrevInstance Then
    MsgBox "Déja chargé !" & vbCrLf & "Une seule instance de WPrint peut fonctionner à un instant donné.", vbCritical, sVersion
    End
  End If
  
  ' En mode exécutable, la fenêtre est invisible par défaut
  ' et on affiche un icône dans le SystemTray.
  ' En mode développement, la fenêtre est rendue visible
  ' et il n'y a pas d'icône dans le SystemTray
  If App.LogMode = 0 Then  ' Empirique, mode environnement de développement
    cmdVisible_Click
  Else
    cmdSysTray_Click
  End If

  
  ' On charge en mémoire les formateurs enregistrés dans le profil
  ' et les synonymes d'imprimantes
  LitFormateurs
  LitSynonymes
  
  ' Et on se met à l'écoute
  TCP(0).LocalPort = 6318
  TCP(0).Listen
End Sub

' Mécanisme pas très standard, une tentative de fermeture de la
' fenêtre par la croir de fermeture ou le menu système ou Alt+F4
' rend la fenêtre invisible en mode bSysTrayIcon.
' C'est comme ça que fonctionne la fenêtre de l'agent système.
' On ne fait ça que si UnloadMode vaut vbFormControlMenu  (fermeture menu système)
' pour ne pas empêcher Windows de se terminer !
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If UnloadMode = vbFormControlMenu And cmdSysTray.Checked And Not bQuitter And cmdVisible.Checked Then
    cmdVisible_Click
    Cancel = 1
  End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Dim i As Integer
  For i = 1 To MAXCONNEXION
    If T(i).bConnexion Then
      TCP(i).Close
      Unload TCP(i)
    End If
  Next
  
  TCP(0).Close
  
  ' On termine une éventuelle session FTP, pour éviter de bloquer pendant le timeout
  'Inet.Cancel
End Sub

Public Sub Trace(iNum As Integer, sMessage As String)
  While lstTrace.ListCount > 5
    lstTrace.RemoveItem 0
  Wend
  lstTrace.AddItem "[" & iNum & "] " & Date & " " & Time & " " & sMessage
  lstTrace.ListIndex = lstTrace.ListCount - 1
End Sub

Private Sub Form_Resize()
  Line (0, 0)-(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-(ScaleWidth, 1), vb3DHighlight
End Sub

Private Sub Form_Paint()
  Line (0, 0)-(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-(ScaleWidth, 1), vb3DHighlight
End Sub

Private Sub lstTrace_Click()
  txtTrace = lstTrace.Text
End Sub

Private Sub TCP_ConnectionRequest(Index As Integer, ByVal requestID As Long)
  Dim sKey As String, iNumConnexion As Integer
  
  For iNumConnexion = 1 To MAXCONNEXION
    If Not T(iNumConnexion).bConnexion Then Exit For
  Next
  If iNumConnexion > MAXCONNEXION Then
    MsgBox "Nombre maxi de connexions simultantées (" & MAXCONNEXION & ") atteint !"
    Exit Sub
  End If
  
  T(iNumConnexion).bConnexion = True
  sKey = "T" & iNumConnexion
  T(iNumConnexion).sBuffer = ""
  T(iNumConnexion).bOkFormateur = False
  T(iNumConnexion).iNbLignes = 0
  Load TCP(iNumConnexion)
  TCP(iNumConnexion).Accept requestID
  Trace iNumConnexion, "Connexion"
End Sub

' Reçoit les données
' Les découpe en lignes (terminées par combinaison de \r ou \n)
' Les ranges dans la file FileRéception
Private Sub TCP_DataArrival(Index As Integer, ByVal bytesTotal As Long)
  Dim vtData As String
  Dim p As Integer, p1 As Integer, p2 As Integer
  Dim sLigne As String
  
  TCP(Index).GetData vtData
  T(Index).sBuffer = T(Index).sBuffer & vtData
  Do
    p1 = InStr(T(Index).sBuffer, Chr(10))
    p2 = InStr(T(Index).sBuffer, Chr(13))
    If p1 = 0 Then p1 = 1000
    If p2 = 0 Then p2 = 1000
    p = p1
    If p2 < p Then p = p2
    If p = 1000 Then Exit Do
    sLigne = Left(T(Index).sBuffer, p - 1)
    T(Index).iNbLignes = T(Index).iNbLignes + 1
    Trace Index, "R " & sLigne
    
    ' Sur la 1ère ligne, on décode les informations
    ' et on contrôle que tout est Ok
    If T(Index).iNbLignes = 1 Then
      T(Index).sLigne1 = sLigne
      
      Dim br As New Rev
      br.Buffer = sLigne
      
      Dim sProtocole As String, sFormateur As String, sTitre As String, sUtilisateur As String, sDate As Date, sImprimante As String
      Dim iStatus As Integer
      iStatus = br.iGetField(sProtocole, sFormateur, sTitre, sUtilisateur, sDate, sImprimante)
      
      If iStatus <= 0 Then
        ErrClose Index, sVersion & ": Erreur " & iStatus & " au décodage des arguments"
        Exit Sub
      End If
      
      If sProtocole <> "WP1" Then
        ErrClose Index, "Protocole '" & sProtocole & "' non reconnu !"
        Exit Sub
      End If
      
      If Not IsFormateur(sFormateur) Then
        ErrClose Index, "Formateur '" & sFormateur & "' non reconnu !"
        Exit Sub
      End If
      
      If Not IsImprimante(sImprimante) Then
        ErrClose Index, "Imprimante '" & sImprimante & "' non reconnue !"
        Exit Sub
      End If
      
      ' Si tout est Ok, on envoie le message d'acceptation
      br.Clear
      br.AddField 0     ' Ok
      br.AddField ""
      Trace Index, "E " & br.Buffer
      TCP(Index).SendData br.Buffer & Chr(10)
      
      ' On attend le nom de fichier
      ' En attendant, mise à jour de la liste d'affichage
      Set T(Index).itmX = lwFile.ListItems.Add(Key:="K" & Index)
      T(Index).itmX.Text = "Préparation"
      T(Index).itmX.SubItems(1) = sFormateur
      T(Index).itmX.SubItems(2) = sTitre
      T(Index).itmX.SubItems(3) = sUtilisateur
      T(Index).itmX.SubItems(4) = sDate
      T(Index).itmX.SubItems(5) = sImprimante
      
      T(Index).sFormateur = sFormateur
    End If
    
    If T(Index).iNbLignes = 2 Then   ' Nom de fichier à récupérer
      T(Index).itmX.Text = "Transfert"
      
      ' Nom de fichier local temporaire pour récupérer le fichier de données
      T(Index).sNomficLocal = Environ("TEMP")
      If T(Index).sNomficLocal = "" Then T(Index).sNomficLocal = "c:"
      If Right(T(Index).sNomficLocal, 1) <> "\" Then T(Index).sNomficLocal = T(Index).sNomficLocal + "\"
      T(Index).sNomficLocal = T(Index).sNomficLocal & "WPrint." & Int(100 * Timer)
      
      ' Décodage du nom de fichier distant sous la forme host:fichier
      Dim sHostDistant As String
      Dim pDeuxP As Integer
      pDeuxP = InStr(sLigne, ":")
      sHostDistant = Left(sLigne, pDeuxP - 1)
      T(Index).sNomficDistant = Mid(sLigne, pDeuxP + 1)
      
      ' On récupère les données distantes
      Trace Index, "F Get " & "ftp://" & sHostDistant & T(Index).sNomficDistant
      'Inet.URL = "ftp://" & sHostDistant & T(Index).sNomficDistant
      Dim sDonnées As String
      'sDonnées = Inet.OpenURL
      
      Load FTP(Index)
      FTP(Index).URL = "ftp://" & sHostDistant
      FTP(Index).UserName = "msdosp"
      FTP(Index).Password = "msdosp"
      FTP(Index).Execute FTP(Index).URL, "GET " & T(Index).sNomficDistant & " " & T(Index).sNomficLocal
      ' Manque un chien de garde
      Do
        DoEvents
        If T(Index).FTPState = icError Then
          MsgBox "Erreur FTP " & FTP(Index).ResponseCode & ":" & FTP(Index).ResponseInfo
          Stop
        End If
      Loop Until T(Index).FTPState = icResponseCompleted
      Unload FTP(Index)
      
      Open T(Index).sNomficLocal For Input As #1
      sDonnées = Input(FileLen(T(Index).sNomficLocal), #1)
      Close #1
      UnixToDos sDonnées
      
      Trace Index, "F Save " & T(Index).sNomficLocal
      Open T(Index).sNomficLocal For Output As #1
      Print #1, sDonnées
      Close #1
      T(Index).bOkFormateur = True    ' Les données sont là et le transfert est terminé
  
      br.Clear
      br.AddField 0     ' Ok, fin de connexion
      Trace Index, "E " & br.Buffer
      TCP(Index).SendData br.Buffer & Chr(10)
    End If
    
    Do
      p = p + 1
      If p > Len(T(Index).sBuffer) Then Exit Do
      If Mid(T(Index).sBuffer, p, 1) <> Chr(13) And Mid(T(Index).sBuffer, p, 1) <> Chr(10) Then Exit Do
    Loop
    T(Index).sBuffer = Mid(T(Index).sBuffer, p)
  Loop
End Sub


Private Sub TCP_Close(Index As Integer)
  Trace Index, "TCP_Close"
  Unload TCP(Index)
  
  If T(Index).bOkFormateur Then
    On Error Resume Next
    Shell GetFormateurPath(T(Index).sFormateur) & " " & T(Index).sNomficLocal, vbNormalFocus
    If Err Then
      MsgBox "Échec au lancement du formateur " & GetFormateurPath(T(Index).sFormateur) & vbCrLf & vbCrLf & "Erreur : " & Error, vbError, sVersion
    End If
    On Error GoTo 0
  End If
  
  ' Le code qui suit plante en cas de coupure sur refus de traitement (imprimante inconnue)
  On Error Resume Next
  lwFile.ListItems.Remove "K" & Index
  Set T(Index).itmX = Nothing
  On Error GoTo 0
  
  T(Index).bConnexion = False
End Sub

Private Sub TCP_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
  Trace Index, "TCP_Error Number:" & Number & " Description:" & Description & " Scode:" & Scode & " Source:" & Source & " HelpFile:" & HelpFile & " HelpContext:" & HelpContext & " CancelDisplay:" & CancelDisplay
End Sub


' Termine une communication suite à un problème de protocole,
' et met le flag coorespondant dans tbOkFormateur à faux
' pour ne pas lancer le formateur
Private Function ErrClose(Index As Integer, sMessage As String)
  T(Index).bOkFormateur = False
  
  ' On envoie le message de problème
  Dim br As New Rev
  br.AddField 1
  br.AddField sMessage
  Trace Index, "E " & br.Buffer
  TCP(Index).SendData br.Buffer & Chr(10)
  
  ' Tempo d'une seconde pour transmettre avant de fermer
  Dim Tempo As Single
  Tempo = Timer
  While Timer - Tempo < 1
    DoEvents
  Wend
  
  TCP(Index).Close
End Function


' Charge en mémoire la liste des formateurs enregistrés dans la registry
Sub LitFormateurs()
  tFormateurs = GetAllSettings("WPrint", "Formateurs")
  If IsEmpty(tFormateurs) Then
    MsgBox "Aucun formateur n'est enregistré dans la registry, exécution impossible !"
    End
  End If
End Sub


' Détermine si le formateur passé en paramètre est connu de WPrint ou non
Private Function IsFormateur(sFormateur As String) As Boolean
  Dim i As Integer
  
  For i = 0 To UBound(tFormateurs, 1)
    If UCase(tFormateurs(i, 0)) = UCase(sFormateur) Then
      IsFormateur = True
      Exit Function
    End If
  Next
  IsFormateur = False
End Function


' Retourne le programme d'un formateur
Private Function GetFormateurPath(sFormateur As String) As String
  Dim i As Integer
  
  For i = 0 To UBound(tFormateurs, 1)
    If UCase(tFormateurs(i, 0)) = UCase(sFormateur) Then
      GetFormateurPath = tFormateurs(i, 1)
      Exit Function
    End If
  Next
  GetFormateurPath = ""
End Function


Private Sub timMédor_Timer()
  ' On surveille les coupures de communications par timer puisqu'on ne reçoit
  ' pas d'événement Close !!!
  
  Dim iNumConnexion As Integer
  
  For iNumConnexion = 1 To MAXCONNEXION
    If T(iNumConnexion).bConnexion Then
      If TCP(iNumConnexion).State = 0 Then TCP_Close iNumConnexion
    End If
  Next
End Sub


' ==================================================================
' Evénements en provenance du SystemTray

Private Sub stTray_MouseUp(Button As Integer, Id As Long)
  ' SetForegroundWindow and PostMessage (WM_USER) must wrap all popup menu's _
    in order to work correctely with the Notification Icons… _
    (* see KB article Q1357888 for more info *)
  SetForegroundWindow Me.hwnd                     ' Set current window as ForegroundWindow
  
  Select Case Button                              ' Track mouse clicks…
    Case vbRightButton
      Me.PopupMenu mnuTray, vbPopupMenuRightButton  ' Popup memu…
  End Select
  
  PostMessage Me.hwnd, WM_USER, 0&, 0&            ' Update form…
End Sub

Private Sub stTray_MouseDblClick(Button As Integer, Id As Long)
  cmdVisible_Click
End Sub


' ==================================================================
' Evénements en provenance du contrôle FTP

Private Sub FTP_StateChanged(Index As Integer, ByVal State As Integer)
  T(Index).FTPState = State
End Sub

