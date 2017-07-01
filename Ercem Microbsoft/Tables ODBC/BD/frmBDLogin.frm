VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmBDLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Identification"
   ClientHeight    =   3105
   ClientLeft      =   45
   ClientTop       =   330
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
   Icon            =   "frmBDLogin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   207
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   442
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin MSComctlLib.ListView lvUtilisateurs 
      Height          =   1515
      Left            =   45
      TabIndex        =   9
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
   Begin VB.TextBox txtUtilisateur 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   60
      TabIndex        =   1
      Tag             =   "Saisissez le n°, l'identifiant ou le nom de l'utilisateur"
      Top             =   300
      Width           =   5055
   End
   Begin VB.CommandButton btnSource 
      Caption         =   "&Unix..."
      Height          =   330
      Left            =   5220
      TabIndex        =   6
      Tag             =   "Choisir une source de données."
      Top             =   1200
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   5220
      TabIndex        =   4
      Top             =   300
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   5220
      TabIndex        =   5
      Top             =   720
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
   Begin VB.CommandButton btnChangerMdP 
      Caption         =   "&Changer…"
      Height          =   330
      Left            =   5220
      TabIndex        =   7
      Tag             =   "Définir ou modifier le mot de passe."
      Top             =   1680
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   8
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
   Begin VB.Label lblUtilisateur 
      AutoSize        =   -1  'True
      Caption         =   "&Utilisateur :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   1095
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
End
Attribute VB_Name = "frmBDLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmBDLogin
' Feuille d'identification ODBC
' 15/07/1998 PV
' 29/07/1998 PV Accès autorisé correctement aux utilisateurs avec système="Y*"
' 30/09/1999 PV Centrage automatique, correct sur 2 écrans
' 20/12/1999 PV Décor de Noël
' 21/02/2000 PV Paramètre -uti:nnn de la ligne de commande
' 27/03/2000 PV Combo --> ListView
' 30/03/2000 PV Validité du mot de passe BAL
' 10/04/2000 PV Login automatique sous NT
' 11/07/2000 PV Internationalisation; contrôle que le domaine commence par SILLIKER. Synchro liste->nom via ItemClick (Click ignore les déplacements clavier)
'  1/12/2000 PV + tOffsetNow dans le timestamp du mot de passe
' 12/01/2001 PV On vérifie que les utilisateurs ont le droit de se connecter...
' 20/04/2001 PV Appel à tracesession dans iInitUtilisateur
'  8/08/2001 PV Test du domaine SILLIKERNT case insensitive


Option Explicit

Private iCancel As Integer

Private Sub btnOK_Click()
  Dim iUt As Integer
  Dim u As Utilisateur
    
  If lvUtilisateurs.SelectedItem Is Nothing Then
    MsgBox sIntlLib("F:Choisissez un utilisateur de la liste avant de valider.%%A:Choose user in the list first."), vbExclamation, App.Title
    Exit Sub
  End If
  
  iUt = Val(lvUtilisateurs.SelectedItem.Text)
  If Not bOkMdP(iUt, txtMotDePasse, False) Then
    txtMotDePasse.SetFocus
    AutoSelect txtMotDePasse, True
    Exit Sub
  End If
  
  ' On mémorise le changement
  Set uOpérateur = colUtilisateur("U" & iUt)
  iNumOpérateur = iUt
  sNomOpérateur = uOpérateur.uti_nom
  
  SaveSetting App.EXEName, "Utilisateur", "Nom", sNomOpérateur
  SaveSetting App.EXEName, "Utilisateur", "Num", iNumOpérateur
  
  iCancel = 0     ' Tout s'est bien passé !
  Unload Me
End Sub

Private Sub btnAnnuler_Click()
  iCancel = 1
  Unload Me
End Sub

Private Sub btnSource_Click()
  iCancel = 2
  Unload Me
End Sub

Private Sub btnChangerMdP_Click()
  Dim iUt As Integer
  Dim sNMdP As String   ' Nouveau mot de passe
  
  If lvUtilisateurs.SelectedItem Is Nothing Then
    MsgBox sIntlLib("F:Choisissez un utilisateur de la liste avant de changer de mot de passe.%%A:Choose user in the list before changing password."), vbExclamation, App.Title
    Exit Sub
  End If

  iUt = Val(lvUtilisateurs.SelectedItem.Text)
  If Not bOkMdP(iUt, txtMotDePasse, True) Then
    txtMotDePasse.SetFocus
    AutoSelect txtMotDePasse, True
    Exit Sub
  End If

  sNMdP = frmBDChangeMdP.Change(lvUtilisateurs.SelectedItem.Text)
  If sNMdP <> "ANNULÉ" Then
    SetMdP iUt, sNMdP
    txtMotDePasse = sNMdP
    AutoSelect txtMotDePasse, True
  End If
End Sub

Public Function iInitUtilisateur(ByVal bOkChangeSource As Boolean, ByVal bLoginForcé As Boolean) As Integer
' Retour:
' 0: Changement de n° d'utilisateur
' 1: Pas de changement (annuler)
' 2: Changement de source de données requis (si le paramètre bOkChangeSource est vrai)
  
  Dim bNoLogin As Boolean
  bNoLogin = False
  
  iNumOpérateur = GetSetting(App.EXEName, "Utilisateur", "Num", 0)
  sNomOpérateur = GetSetting(App.EXEName, "Utilisateur", "Nom", "")
  
  If Not bLoginForcé Then
    If InStr(1, Command, "-nologin", vbTextCompare) > 0 Then
      bNoLogin = True
      If iNumOpérateur = 0 Then GoTo suite       ' Horrible, mais...
    Else
suite:
      Dim s As New SysInfo
      If s.LMLogon And StrComp(Left(s.Domain, 8), "SILLIKER", vbTextCompare) = 0 Then   ' 2000 ou login 95/98 authentifié
        Dim sNom As String
        sNom = s.UserName
        Dim u As Utilisateur
        iNumOpérateur = 0
        Dim bTrouvé As Boolean
        bTrouvé = False
        For Each u In colUtilisateur
          If StrComp(sNom, u.uti_bal, vbTextCompare) = 0 And (InStr(u.uti_systemes, "*") <> 0 Or InStr(u.uti_systemes, cSystèmeCA) <> 0) Then
            sNomOpérateur = u.uti_nom
            iNumOpérateur = u.uti_numuti
            bNoLogin = True
            bTrouvé = True
            Exit For
          End If
        Next
        If Not bTrouvé Then
          txtUtilisateur = "(Tapez votre nom ou sélectionnez-le dans la liste)"
          AutoSelect txtUtilisateur, True
        End If
      End If
    End If
    
    Dim p As Integer
    p = InStr(1, Command, "-uti:", vbTextCompare)
    If p > 0 Then
      bNoLogin = True
      iNumOpérateur = Val(Mid(Command, p + 5))
      sNomOpérateur = ""
    End If
  End If
  
  Do
    If bNoLogin = False Or iNumOpérateur = 0 Then
      ' Si lidentification n'est pas définie, on passe par la boîte de login
      iCancel = 1     ' Pour la fermeture avec la croix
      btnSource.Visible = bOkChangeSource
      Show vbModal
      iInitUtilisateur = iCancel
      GoTo fin
    Else
      ' Sinon on valide l'identification de l'utilisateur
      On Error Resume Next
      Set uOpérateur = colUtilisateur("U" & iNumOpérateur)
      sNomOpérateur = uOpérateur.uti_nom
      If Err = 0 Then
        iInitUtilisateur = 0
        GoTo fin
      End If
      On Error GoTo 0
      bNoLogin = False
    End If
  Loop
  
fin:
  On Error Resume Next
  RunSQL "execute procedure tracesession(" & iNumOpérateur & ",'" & sBDIdModif & "')"
End Function

Private Sub cboUtilisateur_Click()
  btnChangerMdP.Enabled = True
End Sub

Private Sub cboUtilisateur_Change()
  btnChangerMdP.Enabled = True
End Sub

Private Sub Form_Activate()
  If Left(txtUtilisateur, 1) <> "(" Then txtMotDePasse.SetFocus
  'txtMotDePasse.SetFocus
End Sub

Private Sub Form_Load()
  Internationalisation
  
  Dim u As Utilisateur
  For Each u In colUtilisateur
    If InStr(1, u.uti_systemes, "*") <> 0 Or InStr(1, u.uti_systemes, cSystèmeCA) > 0 Then
      If Left(u.uti_nom, 1) <> "!" Then
        Dim x As ListItem
        'cboUtilisateur.AddItem u.uti_nom
        'cboUtilisateur.ItemData(cboUtilisateur.NewIndex) = u.uti_numuti
        Set x = lvUtilisateurs.ListItems.Add(, , u.uti_numuti)
        x.SubItems(1) = LCase(u.uti_bal)
        x.SubItems(2) = u.uti_nom
      End If
    End If
  Next
  AjusteListView Me, lvUtilisateurs
  
  txtUtilisateur = sNomOpérateur
End Sub


Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Or TypeOf ActiveControl Is ComboBox Then AutoSelect ActiveControl
End Sub

Private Sub txtUtilisateur_Change()
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

Private Sub lvUtilisateurs_ItemClick(ByVal Item As MSComctlLib.ListItem)
  If Not lvUtilisateurs.SelectedItem Is Nothing Then
    txtUtilisateur = lvUtilisateurs.SelectedItem.SubItems(2)
  End If
End Sub


Private Sub lvUtilisateurs_DblClick()
  btnOK_Click
End Sub



Private Sub txtUtilisateur_GotFocus(): GotFocus: End Sub
Private Sub lvUtilisateurs_GotFocus(): GotFocus: End Sub
Private Sub txtMotDePasse_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnSource_GotFocus(): GotFocus: End Sub
Private Sub btnChangerMdP_GotFocus(): GotFocus: End Sub


'================================================================================
' Contrôle et définition des mots de passe

Private Function bOkMdP(ByVal iUt As Integer, ByVal sMdPSaisi As String, bModeChange As Boolean)
  Dim sMdP As String        ' Mot de passe codé dans la base de données
  Dim sMdPDécodé As String  ' Mot de passe en clair

  ' Back door…
  sMdP = "/%,'-,;."
  Dim i As Integer
  For i = 1 To Len(sMdP)
    sMdPDécodé = sMdPDécodé & Chr(73 Xor Asc(Mid(sMdP, i, 1)))
  Next
  If StrComp(sMdPSaisi, sMdPDécodé, vbTextCompare) = 0 Then
    bOkMdP = True
    Exit Function
  End If
  
  ' Le mot de passe BAL convient aussi...
  ' Mais pas idéal de le lire en premier au niveau performances !
  sMdP = NV(BDCurseurExpress("select uti_passwd from utilisateur where uti_numuti=" & iUt))
  If StrComp(sMdPSaisi, sMdP, vbTextCompare) = 0 Then
    bOkMdP = True
    Exit Function
  End If
  
  sMdP = BDCurseurExpress("select pwd_passwd from passwd where pwd_numuti=" & iUt)
  
  ' Mot de passe vide
  If sMdP = "" Then
    If bModeChange Then
      bOkMdP = True
      Exit Function
    End If
    If vbYes = MsgBox("Utilisateur sans mot de passe, accès refusé." & vbCrLf & vbCrLf & "Vous devez définir un mot de passe avant de pouvoir utiliser ce programme, en cliquant sur le bouton Changer. Voulez-vous définir un mot de passe maintenant ?", vbQuestion + vbYesNo, App.Title) Then
      txtMotDePasse = ""
      btnChangerMdP_Click
    End If
    bOkMdP = False
    Exit Function
  End If

  If sMdP <> "" Then
    If Left(sMdP, 1) <> "A" Then
      MsgBox "Codage de mot de passe " & Left(sMdP, 1) & " non pris en charge par cette version du programme, prévenez le Service Informatique.", vbCritical, App.Title
      bOkMdP = False
      Exit Function
    End If
  End If
  
  sMdPDécodé = ""
  For i = 2 To Len(sMdP) Step 2
    sMdPDécodé = sMdPDécodé & Chr(Val("&H" & Mid(sMdP, i, 2)))
  Next
  
  If StrComp(sMdPSaisi, sMdPDécodé, vbTextCompare) <> 0 Then
    bOkMdP = False
    If Not bModeChange Then
      MsgBox sIntlLib("F:Mot de passe incorrect.%%A:Incorrect password."), vbCritical, App.Title
    Else
      MsgBox sIntlLib("F:Mot de passe incorrect.||Vous devez saisir le mot de passe actuel pour pouvoir changer de mot de passe.%%A:Incorrect password.||You must type current password before changing it."), vbCritical, App.Title
    End If
    Exit Function
  End If
  
  bOkMdP = True
End Function


Private Sub SetMdP(ByVal iUt As Integer, ByVal sMdP As String)
  Dim sMdPEncodé As String
  
  sMdP = Left(sMdP, 14)
  sMdPEncodé = "A"
  Dim i As Integer
  For i = 1 To Len(sMdP)
    sMdPEncodé = sMdPEncodé & Right(Hex(256 + Asc(Mid(sMdP, i, 1))), 2)
  Next
  
  Dim cNMdP As New BDCurseur
  cNMdP.OpenCurseur "select * from passwd where pwd_numuti=" & iUt
  If cNMdP.EOF Then
    cNMdP.AddNew
    cNMdP!pwd_numuti = iUt
  Else
    cNMdP.Edit
  End If
  cNMdP!pwd_passwd = sMdPEncodé
  cNMdP!timestamp = BDTime
  cNMdP.Update
End Sub




'========================================================
' Internationalisation

Public Sub Internationalisation()
  Caption = "Identification [" & cSystèmeCA & "]"

  SetLib lblUtilisateur, "Caption", "A:&User :"
  SetLib lblMotDePasse, "Caption", "A:&Password :"
  
  SetLib txtMotDePasse, "Tag", "A:Enter your password."
  SetLib lvUtilisateurs, "Tag", "A:Select user from the list."
  SetLib txtUtilisateur, "Tag", "A:Enter user number or user name."
  
  SetLib btnAnnuler, "Caption", "A:Cancel"
  SetLib btnChangerMdP, "Caption", "A:&Change…"
  SetLib btnChangerMdP, "Tag", "A:Change password or define new password."
  SetLib btnSource, "Tag", "A:Choose data source."
End Sub

