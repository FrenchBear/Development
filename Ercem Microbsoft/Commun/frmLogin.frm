VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Identification de l'utilisateur"
   ClientHeight    =   3105
   ClientLeft      =   1215
   ClientTop       =   4125
   ClientWidth     =   6630
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmLogin.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   207
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   442
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtUtilisateur 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   60
      TabIndex        =   1
      Tag             =   "Saisissez le n°, l'identifiant ou le nom de l'utilisateur"
      Top             =   300
      Width           =   5055
   End
   Begin VB.CommandButton btnUnix 
      Caption         =   "&Unix…"
      Height          =   330
      Left            =   5220
      TabIndex        =   8
      Tag             =   "Permet de changer de système Unix."
      Top             =   1620
      Width           =   1350
   End
   Begin VB.CommandButton btnChangerMdP 
      Caption         =   "&Changer…"
      Height          =   330
      Left            =   5220
      TabIndex        =   9
      Tag             =   "Définir ou modifier le mot de passe."
      ToolTipText     =   "Définir ou modifier le mot de passe"
      Top             =   2100
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   5220
      TabIndex        =   7
      Top             =   1140
      Width           =   1350
   End
   Begin VB.TextBox txtMotDePasse 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   60
      PasswordChar    =   "*"
      TabIndex        =   3
      Tag             =   "Entrez votre mot de passe."
      Top             =   2400
      Width           =   5055
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   5220
      TabIndex        =   6
      Top             =   705
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   5220
      TabIndex        =   5
      Top             =   300
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   10
      Top             =   2790
      Width           =   6630
      _ExtentX        =   11695
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.ListView lvUtilisateurs 
      Height          =   1515
      Left            =   45
      TabIndex        =   4
      Tag             =   "Sélectionnez un utilisateur dans la liste"
      Top             =   600
      Width           =   5085
      _ExtentX        =   8969
      _ExtentY        =   2672
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      HideColumnHeaders=   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
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
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "N°"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Id"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Nom"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label lblMotDePasse 
      AutoSize        =   -1  'True
      Caption         =   "&Mot de passe :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   2160
      Width           =   1410
   End
   Begin VB.Label lblUtilisateur 
      AutoSize        =   -1  'True
      Caption         =   "&Utilisateur :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   1095
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de saisie de l'identification et du mot de passe de l'utilisateur"
' frmLogin
' Feuille de saisie de l'identification et du mot de passe de l'utilisateur
' 17/11/1997 PV Identification systématique; mots de passe
' 18/11/1997 PV Bug d'effacement de mot de passe réglé
' 21/01/1999 PV Internationalisation
' 20/12/1999 PV Décor de Noël
' 30/03/2000 PV Listview, Gestion du code BAL
' 12/04/2000 PV Login automatique si identité validée dans le domaine SILLIKERNT
' 19/04/2000 PV ValideIdentité mémorise le nom dans la registry
' 28/07/2000 PV Ok pour login automatique dans les domaines SILLIKER*
' 17/01/2001 PV Mécanisme bNoCascade
' 20/04/2001 PV Appel à DémonTraceSession dans ValideIdentité
'  8/08/2001 PV Contrôle du domaine SILLIKER case insensitive


Option Explicit

Private colUtiOk As New Collection
Private iCancel As Integer

Private sCaption As String

Private bNoCascade As Boolean



Public Sub EffaceCacheMotsDePasse()
  EffaceCollection colUtiOk
End Sub

Private Sub ValideIdentité()
  SaveSetting sApplicationGlobale, "Utilisateur", "Nom", sNomOpérateur
  SaveSetting sApplicationGlobale, "Utilisateur", "Num", iNumOpérateur
  frmBase.Caption = sNomApp & " [" & sNomOpérateur & "]"
  DémonUtilisateur sNomOpérateur, iNumOpérateur
  DémonTraceSession iNumOpérateur, sIdModif

'  On Error Resume Next
'  Kill App.Path & "\Identité " & sDémon & ".dat"
'  Exit Sub
  
  On Error GoTo Fin
  Open App.Path & "\Identité " & sDémon & ".dat" For Output As #1
  Print #1, "Utilisateur " & iNumOpérateur & ": " & sNomOpérateur
  Print #1, "Application " & sApplicationGlobale & " " & App.Major & "." & App.Minor & "." & App.Revision
  Print #1, "Démon " & sVersionDémon & " sur le système Unix " & cSystèmeCA
  Print #1, "Protocole " & iNumProto & "/" & iRelProto

  Dim s As New SysInfo
  Print #1, "Session ouverte pour l'utilisateur " & s.UserName
  Print #1, "Domaine " & s.Domain & IIf(s.LMLogon, " (Val)", "")
  Print #1, "Micro " & s.ComputerName
  Print #1, "OS Platform " & s.OSPlatform
  Print #1, "OS M.m " & s.OSMajorVersion & "." & s.OSMinorVersion
  Print #1, "OSVersion " & s.OSVersion
Fin:
  On Error Resume Next
  Close #1
End Sub


Private Sub btnAide_Click()
  Aide "frmlogin"
End Sub

Private Sub btnAnnuler_Click()
  iCancel = 1
  Unload Me
End Sub

Private Sub btnUnix_Click()
  iCancel = 2
  Unload Me
End Sub


Private Sub btnChangerMdP_Click()
  If lvUtilisateurs.SelectedItem Is Nothing Then
    MsgBox2i "CO063"
    'MsgBox "Selectionnez un utilisateur dans la liste avant de changer de mot de passe !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  Dim u As Utilisateur
  Set u = colUtiOk("U" & Val(lvUtilisateurs.SelectedItem.Text))

  ' On contrôle le MdP actuel
  If Not bOkMdP(txtMotDePasse, u.uti_passwdlogin) Then
    MsgBox2i "CO064"
    'MsgBox "Mot de passe incorrect, changement refusé." & vbCrLf & "Vous devez saisir le mot de passe actuel pour pouvoir changer de mot de passe.", vbExclamation, sNomApp
    txtMotDePasse.SetFocus
    Exit Sub
  End If
  
  Dim sNewPasswd As String
  sNewPasswd = frmChangeMdP.Change(u.uti_nom)
  If sNewPasswd <> "ANNULÉ" Then
    Bloquer
      Dim br As New Rev
      br.AddField u.uti_numuti
      br.AddField sNewPasswd
      
      tcps.Envoie "PASS " & br.Buffer
      AttendSynchro
    Relâcher
    
    ' Au cas où on change deux fois de MdP de suite !
    ' On encode le mot de passe
    sNewPasswd = Left(sNewPasswd, 14)
    u.uti_passwdlogin = "A"
    Dim i As Integer
    For i = 1 To Len(sNewPasswd)
      u.uti_passwdlogin = u.uti_passwdlogin & Right(Hex(256 + Asc(Mid(sNewPasswd, i, 1))), 2)
    Next

    ' On préremplit le champ avec le nouveau mot de passe
    txtMotDePasse = sNewPasswd
    AutoSelect txtMotDePasse, True
    btnOK.SetFocus
  End If
End Sub


' Teste un mot de passe saisi par rapport au MdP crypté
Private Function bOkMdP(ByVal sMdPSaisi As String, sMdPCodé As String) As Boolean
  Dim sMdPDécodé As String
  
  ' Back door…
  If StrComp(sMdPSaisi, "FLENDERG", vbTextCompare) = 0 Then
    bOkMdP = True
    Exit Function
  End If
  
  ' Cas particulier du MdP vide
  If sMdPSaisi = "" And sMdPCodé = "" Then
    bOkMdP = True
    Exit Function
  End If
  
  If Left(sMdPCodé, 1) <> "A" Then
    MsgBox2i "CO065", Left(sMdPCodé, 1)
    'MsgBox "Codage de mot de passe " & Left(sMdPCodé, 1) & " non pris en charge par cette version du programme, prévenez le service informatique.", vbCritical, sNomApp
    bOkMdP = False
    Exit Function
  End If
  
  Dim i As Integer
  For i = 2 To Len(sMdPCodé) Step 2
    sMdPDécodé = sMdPDécodé & Chr(Val("&H" & Mid(sMdPCodé, i, 2)))
  Next
  
  bOkMdP = StrComp(sMdPSaisi, sMdPDécodé, vbTextCompare) = 0
End Function


Private Sub btnOK_Click()
  Dim u As Utilisateur
  
  If lvUtilisateurs.SelectedItem Is Nothing Then
    MsgBox2i "CO006"
    Exit Sub
  End If
  
  
  Set u = colUtiOk("U" & Val(lvUtilisateurs.SelectedItem.Text))
  If u.uti_passwdlogin = "" Then
    Dim sMsg As String
    sMsg = sGetIntlLib("CO066", "Question CO066" & vbCrLf & "Pas de mot de passse")
    If vbYes = MsgBox(sMsg, vbQuestion + vbYesNo, sNomApp) Then
      'MsgBox("Utilisateur sans mot de passe, accès refusé." & vbCrLf & vbCrLf & "Vous devez définir un mot de passe avant de pouvoir utiliser ce programme, en cliquant sur le bouton Changer. Voulez-vous définir un mot de passe maintenant ?", vbQuestion + vbYesNo, sNomApp) Then
      btnChangerMdP_Click
    End If
    Exit Sub
  End If
  
  If Not bOkMdP(txtMotDePasse, u.uti_passwdlogin) Then
    MsgBox2i "CO067"
    'MsgBox "Mot de passe incorrect, accès refusé.", vbExclamation, sNomApp
    txtMotDePasse.SetFocus
    AutoSelect txtMotDePasse, True
    Exit Sub
  End If
  
  sNomOpérateur = u.uti_nom
  iNumOpérateur = u.uti_numuti
  ValideIdentité
  iCancel = 0
  Unload Me
End Sub

Private Sub lvUtilisateurs_Click()
  bNoCascade = True
  txtUtilisateur = lvUtilisateurs.SelectedItem.SubItems(2)
  bNoCascade = False
End Sub

Private Sub txtUtilisateur_Change()
  If bNoCascade Then Exit Sub
  
  Dim x As ListItem
  For Each x In lvUtilisateurs.ListItems
    If txtUtilisateur = x.Text Or StrComp(txtUtilisateur, x.SubItems(1), vbTextCompare) = 0 Or StrComp(txtUtilisateur, x.SubItems(2), vbTextCompare) = 0 Then Exit For
  Next
  If x Is Nothing Then
    For Each x In lvUtilisateurs.ListItems
      x.Selected = False
    Next
    Set lvUtilisateurs.SelectedItem = Nothing
  Else
    Set lvUtilisateurs.SelectedItem = x
    x.EnsureVisible
  End If
End Sub

Private Sub txtUtilisateur_DblClick()
  btnOK_Click
End Sub

Private Sub Form_Activate()
  If txtUtilisateur = "" Then
    txtUtilisateur.SetFocus
  Else
    txtMotDePasse.SetFocus
  End If
  
  'Caption = "Identification de l'utilisateur, système " & sSystèmeDistant
  Caption = sCaption & " - " & sSystèmeDistant
End Sub

Private Sub Form_Load()
  Internationalisation
  
'  ' Décor de Noël/2000
'  If Now >= DateSerial(1999, 12, 20) And Now < DateSerial(2000, 1, 1) Then
'    imgNoël.Visible = True
'  ElseIf Now >= DateSerial(2000, 1, 1) And Now <= DateSerial(2000, 1, 10) Then
'    img2K.Visible = True
'  End If


  Dim u As Utilisateur
  Dim x As ListItem
  
  ' Plus de cache, on force la relecture, au cas où un mot de passe aurait changé
  EffaceCollection colUtiOk

  ' On remplit la liste avec les utilisateurs autorisés sur le système au 1er passage
  If colUtiOk.count = 0 Then
    Bloquer
      Dim br As New Rev
      br.AddField cSystèmeCA
      tcps.Envoie "UTOK2 " & br.Buffer
      
      Dim sLigne As String, iPers As Integer, sPasswd As String, sBal As String
      Do
        sLigne = tcps.Reçoit
        If sLigne = "->" Then Exit Do
        br.Buffer = sLigne
        br.GetField iPers
        br.GetField sPasswd
        br.GetField sBal
        
        Dim sNom As String
        sNom = sNomUtilisateur(iPers)
        Set u = New Utilisateur
        u.uti_numuti = iPers
        u.uti_nom = sNom
        u.uti_passwdlogin = sPasswd
        u.uti_bal = sBal
        colUtiOk.Add u, "U" & u.uti_numuti
        
        Set x = lvUtilisateurs.ListItems.Add(, , u.uti_numuti)
        x.SubItems(1) = LCase(u.uti_bal)
        x.SubItems(2) = u.uti_nom
        
        Set u = Nothing
      Loop
    Relâcher
  Else
    For Each u In colUtiOk
      Set x = lvUtilisateurs.ListItems.Add(, , u.uti_numuti)
      x.SubItems(1) = LCase(u.uti_bal)
      x.SubItems(2) = u.uti_nom
    Next
  End If
  LVSetAllColWidths lvUtilisateurs, LVSCW_AUTOSIZE_USEHEADER
'  txtUtilisateur = sNomOpérateur
End Sub


' Retour:
' 0: Changement de n° d'utilisateur
' 1: Pas de changement (annuler)
' 2: Changement de système Unix requis
Public Function iInitUtilisateur(Optional ByVal bIdentificationForcée As Boolean = False) As Integer
  Load Me
  
  ' Par défaut, on prend l'identité système courante si le login est validé...
  Dim s As New SysInfo
  If s.LMLogon And StrComp(Left(s.Domain, 8), "SILLIKER", vbTextCompare) = 0 Then ' 2000 ou login 95/98 authentifié
    Dim sNom As String
    sNom = s.UserName
    Dim u As Utilisateur
    iNumOpérateur = 0
    For Each u In colUtiOk
      If StrComp(sNom, u.uti_bal, vbTextCompare) = 0 Then
        sNomOpérateur = u.uti_nom
        iNumOpérateur = u.uti_numuti
        Exit For
      End If
    Next
    If iNumOpérateur = 0 Then bIdentificationForcée = True
  Else
    bIdentificationForcée = True
  End If

  ' ... ou on prend le dernier connecté
  If iNumOpérateur = 0 Then
    sNomOpérateur = GetSetting(sApplicationGlobale, "Utilisateur", "Nom", "")
    iNumOpérateur = GetSetting(sApplicationGlobale, "Utilisateur", "Num", 0)
  End If
  
  If bIdentificationForcée Or iNumOpérateur = 0 Then
    ' On passe par la boîte de login
    txtUtilisateur = sNomOpérateur
    Show vbModal
    iInitUtilisateur = iCancel
  Else
    ' Sinon on informe le démon de l'identification de l'utilisateur
    ValideIdentité
    iInitUtilisateur = 0
    Unload Me
  End If
End Function



Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub



Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Or TypeOf ActiveControl Is ComboBox Then AutoSelect ActiveControl
End Sub

Private Sub txtUtilisateur_GotFocus(): GotFocus: End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If UnloadMode = vbFormControlMenu Then
    iCancel = 1
  End If
End Sub

Private Sub txtMotDePasse_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub
Private Sub btnChangerMdP_GotFocus(): GotFocus: End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  sCaption = sGetIntlLib("LOCaption", "Login")
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnUnix, "Caption", "btnUnix"
  SetLib btnUnix, "Tag", "btnUnix.tag"
  SetLib btnChangerMdP, "Caption", "LObtnChangerMdP"
  SetLib btnChangerMdP, "Tag", "LObtnChangerMdP.tag"
  
  SetLib lblUtilisateur, "Caption", "LOlblUtilisateur"
  SetLib txtUtilisateur, "Tag", "LOcboUtilisateur.tag"
  
  SetLib lblMotDePasse, "Caption", "LOlblMotDePasse"
  SetLib txtMotDePasse, "Tag", "LOtxtMotDePasse"
End Sub

