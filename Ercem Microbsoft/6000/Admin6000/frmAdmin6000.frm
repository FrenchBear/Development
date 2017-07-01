VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAdmin6000 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Administration 6000"
   ClientHeight    =   5130
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   9975
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAdmin6000.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   342
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   665
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   8
      Top             =   4815
      Width           =   9975
      _ExtentX        =   17595
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
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.ListView lwR�sultat 
      Height          =   2655
      Left            =   2880
      TabIndex        =   7
      Top             =   2040
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   4683
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   393217
      SmallIcons      =   "ilImages"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Syst�me"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.CommandButton btnEx�cuter 
      Caption         =   "Ex�cuter"
      Default         =   -1  'True
      Height          =   375
      Left            =   2880
      TabIndex        =   6
      Top             =   1560
      Width           =   1215
   End
   Begin VB.ComboBox cboCommande 
      Height          =   330
      Left            =   2880
      TabIndex        =   5
      Top             =   1080
      Width           =   3855
   End
   Begin VB.TextBox txtS�lection 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2880
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   360
      Width           =   3855
   End
   Begin MSComctlLib.TreeView twSS 
      Height          =   4335
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   7646
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   529
      LabelEdit       =   1
      LineStyle       =   1
      Sorted          =   -1  'True
      Style           =   7
      ImageList       =   "ilImages"
      Appearance      =   1
   End
   Begin MSComctlLib.ImageList ilImages 
      Left            =   9240
      Top             =   240
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAdmin6000.frx":0442
            Key             =   "Site"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAdmin6000.frx":075C
            Key             =   "Unit�"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAdmin6000.frx":0A76
            Key             =   "Micro"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAdmin6000.frx":0D90
            Key             =   "Tout"
         EndProperty
      EndProperty
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Commande :"
      Height          =   210
      Left            =   2880
      TabIndex        =   4
      Top             =   840
      Width           =   1200
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "S�lection :"
      Height          =   210
      Left            =   2880
      TabIndex        =   2
      Top             =   120
      Width           =   990
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Sites et syst�mes"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1680
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuCommandes 
      Caption         =   "&Commandes"
      Begin VB.Menu cmdPr�d�fini 
         Caption         =   "(pr�d�fini)"
         Index           =   0
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de Admin6000�"
      End
   End
End
Attribute VB_Name = "frmAdmin6000"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille principale de l'administrateur client serveur6000"
' Feuille frmAdmin6000
' Feuille principale de l'administrateur client serveur6000
' 28/11/97 PV

Option Explicit

' Pour le remplissage du TreeView, contient l'index du site courant
Dim iSiteCourant As Integer
Dim iUnit�Courante As Integer
Dim sSiteCourant As String


' Suivi des connexions TCP simultan�es
Private Type Connexion
  TCP As New TCPSynchrone     ' Connexion, buffer�
  sSyst�me As String          ' Cl� du syst�me auquel on est connect�
  bConnexion As Boolean       ' Vrai si la connexion est �tablie
  sBuffer As String           ' Buffer caract�re de r�ception
  bCommandeEnCours As Boolean ' Vrai si le programme est en train de traiter une commande pr�c�dente
End Type

Const MAXCONNEXION = 10       ' Nb maxi de connexions TCP simultan�es
Dim t(1 To MAXCONNEXION) As Connexion


' Commandes pr�d�finies
Dim colPr�d�fini As New Collection


' M�morisation du r�sultat d'ex�cution des commandes
Dim colRes As New Collection


' Pr�sentation graphique des r�sultats
Dim xl As Excel.Application


' =========================================================
' Menus

Private Sub cmdQuitter_Click()
  Unload Me
End Sub

Private Sub cmdAPropos_Click()
  MsgBox "Administration de micros ex�cutant Serveur6000" & vbCrLf & _
    "Version " & App.Major & "." & App.Minor & "." & App.Revision & vbCrLf & vbCrLf & _
    "(c) ERCEM/P.VIOLENT 1997", vbInformation, sNomApp
End Sub

Private Sub cmdCourante_Click()
  btnEx�cuter_Click
End Sub

Private Sub cmdPr�d�fini_Click(Index As Integer)
  cboCommande.Text = colPr�d�fini(Index)
  cboCommande.SelStart = 0
  cboCommande.SelLength = 999
  btnEx�cuter_Click
End Sub

' =========================================================
' Initialisation

Private Sub AjouteSite(ByVal sNomSite As String)
  Dim n As Node
  Set n = twSS.Nodes.Add(, tvwNext, "S" & sNomSite, sNomSite, "Site")
  sSiteCourant = sNomSite
  iSiteCourant = n.Index
  iUnit�Courante = n.Index
End Sub

Private Sub AjouteUnit�(ByVal sNomUnit� As String)
  Dim n As Node
  Set n = twSS.Nodes.Add(iSiteCourant, tvwChild, "U" & sSiteCourant & sNomUnit�, sNomUnit�, "Unit�")
  iUnit�Courante = n.Index
End Sub

Private Sub AjouteSyst�me(ByVal sNomSyst�me As String)
  twSS.Nodes.Add iUnit�Courante, tvwChild, "M" & sNomSyst�me, sNomSyst�me, "Micro"
End Sub


Private Sub Form_Load()
  ' A charger � partir d'un fichier de config (.INI)
  
  AjouteSite "Ercem Grenoble"
  AjouteUnit� "DI/EC"
  AjouteSyst�me "Uranus"
  AjouteSyst�me "Athos"
  AjouteSyst�me "Nadine"
  AjouteSyst�me "Hermes"
  AjouteSyst�me "Ec1"
  
  AjouteUnit� "Divers"
  AjouteSyst�me "Jupiter"
  AjouteSyst�me "Uop1"
  AjouteSyst�me "Reunion"
  AjouteSyst�me "Kafka"
  
  AjouteUnit� "SCG"
  AjouteSyst�me "Mad"
  AjouteSyst�me "Amedee"
  AjouteSyst�me "Pavot"
  AjouteSyst�me "Tresor"
  AjouteSyst�me "Rapetou"
  
  AjouteUnit� "DAF"
  AjouteSyst�me "Chepiok"
  AjouteSyst�me "Pomme"
  
  AjouteUnit� "SFC"
  AjouteSyst�me "Goofy"
  AjouteSyst�me "Souris"
  AjouteSyst�me "Mulot"
  AjouteSyst�me "Dragon"
  AjouteSyst�me "Kim"
  
  AjouteUnit� "STFS"
  AjouteSyst�me "Eliane"
  AjouteSyst�me "Severine"
  AjouteSyst�me "Farida"
  AjouteSyst�me "Fraise"
  AjouteSyst�me "Mathieu"
  AjouteSyst�me "Bacterie"
  
  AjouteSite "Ercem Massy"
  AjouteUnit� "DOP"
  AjouteSyst�me "Dodo"
  AjouteSyst�me "Dop"
  AjouteUnit� "DG"
  AjouteSyst�me "Daffy"
  AjouteSyst�me "Flop"
  AjouteUnit� "DQ"
  AjouteSyst�me "Didier"
  AjouteUnit� "DF/EC"
  AjouteSyst�me "Bijou"
  AjouteSyst�me "Bill"
  AjouteUnit� "DCD"
  AjouteSyst�me "Vizir"
  AjouteSyst�me "Tulipe"
  AjouteSyst�me "Rose"
  AjouteSyst�me "Lilas"
  AjouteUnit� "STFN"
  AjouteSyst�me "Fleur"
  AjouteSyst�me "Phoque"
  AjouteSyst�me "Otarie"
  AjouteSyst�me "Dauphin"
  AjouteSyst�me "Meduse"
  AjouteSyst�me "Morse"
  AjouteSyst�me "Merou"
  AjouteSyst�me "Bigorneau"
  AjouteUnit� "UOP6"
  AjouteSyst�me "Castor"
  AjouteUnit� "Divers"
  AjouteSyst�me "Zeus2"
  
  AjouteSite "LBF Massy"
  AjouteSyst�me "Aigle"
  AjouteSyst�me "Albatros"
  AjouteSyst�me "Flairsou"
  AjouteSyst�me "Dtdq"
  AjouteSyst�me "Stat"
  AjouteSyst�me "Secrdg"
  AjouteSyst�me "Commercial"
  AjouteSyst�me "Mars"
  AjouteSyst�me "Chef"
  
  AjouteSite "LBF Salies"
  AjouteSyst�me "Lbf1"
  AjouteSyst�me "Lbf3"
  AjouteSyst�me "Lbf4"
  AjouteSyst�me "Lbf5"
  AjouteSyst�me "Lbf6"
  AjouteSyst�me "Lbf7"
  AjouteSyst�me "Mvw"
  
  AjouteSite "LBF Roanne"
  AjouteSyst�me "Lbf2"
  AjouteSyst�me "Poste1"
  AjouteSyst�me "Poste3"
  AjouteSyst�me "Poste4"
  AjouteSyst�me "Poste5"
  AjouteSyst�me "Poste6"
  
  AjouteSite "Ercem Fontaine"
  AjouteSyst�me "Odile"
  AjouteSyst�me "Mireille"
  AjouteSyst�me "Mbf"
  AjouteSyst�me "Valda"
  AjouteSyst�me "Gamma"
  AjouteSyst�me "Reception"
  AjouteUnit� "SL"
  AjouteSyst�me "Hercule"
  AjouteSyst�me "Mauve"
  AjouteSyst�me "Muguet"
  AjouteSyst�me "Begonia"
  AjouteSyst�me "Fuchsia"
  AjouteSyst�me "Azalee"

  AjouteSite "Ercem Lyon"
  AjouteSyst�me "Frank"
  AjouteSyst�me "Uop3"
  AjouteSyst�me "Ec5"
  
  twSS.Nodes("SErcem Grenoble").Expanded = True
  Set twSS.SelectedItem = twSS.Nodes("UErcem GrenobleDI/EC")
  twSS.SelectedItem.Expanded = True
  twSS_Click
  
  ' Commandes de base
  CommandePr�d�finie "Date et heure", "Date"
  CommandePr�d�finie "Versions serveur6000 et Windows", "Ver"
  CommandePr�d�finie "Place disque disponible", "Dfree"
  CommandePr�d�finie "M�moire disponible", "Mem"
  CommandePr�d�finie "Environnement", "Env"
  CommandePr�d�finie "Mes documents", "GetReg ""HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"" Personal"
  cmdPr�d�fini(0).Visible = False
  
  Show
  cboCommande.SetFocus
  cboCommande.Text = "Mem"
  cboCommande.SelStart = 0
  cboCommande.SelLength = 999
End Sub

Private Sub CommandePr�d�finie(ByVal sTitre As String, ByVal sCommande As String)
  cboCommande.AddItem sCommande
  
  Load cmdPr�d�fini(cboCommande.ListCount)
  cmdPr�d�fini(cboCommande.ListCount).Caption = sTitre
  cmdPr�d�fini(cboCommande.ListCount).Visible = True
  colPr�d�fini.Add sCommande
End Sub

Private Sub Form_Paint()
  Line (0, 0)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-Step(ScaleWidth, 0), vb3DHighlight
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Dim f As Form
  For Each f In Forms
    If Not f Is Me Then Unload f
  Next
End Sub

' =========================================================
' S�lection site / machine

Private Sub twSS_Click()
  If twSS.SelectedItem.Children = 0 Then
    txtS�lection = "Micro " & twSS.SelectedItem.Text
  ElseIf Left(twSS.SelectedItem.Key, 1) = "S" Then
    txtS�lection = "Tous les syst�mes du site " & twSS.SelectedItem.Text
  Else
    txtS�lection = "Tous les syst�mes de l'unit� " & twSS.SelectedItem.Text
  End If
End Sub

Private Sub twSS_DblClick()
  btnEx�cuter_Click
End Sub

Private Sub twSS_KeyPress(KeyAscii As Integer)
  If KeyAscii = 13 Then
    btnEx�cuter_Click
    KeyAscii = 0
  End If
End Sub


' =========================================================
' Ex�cution des commandes

Private Sub btnEx�cuter_Click()
  If cboCommande.Text <> "" Then
    btnEx�cuter.Enabled = False
    
    ' On efface les r�sultats pr�c�dents
    lwR�sultat.ListItems.Clear
    While colRes.Count > 0
      colRes.Remove 1
    Wend
    
    ' On part d'en-t�te de colonnes vierge
    lwR�sultat.ColumnHeaders.Clear
    lwR�sultat.ColumnHeaders.Add , "", "Syst�me", 80

    If twSS.SelectedItem.Children = 0 Then
      ' Micro s�lectionn�
      Ex�cuteCommande twSS.SelectedItem.Text
    Else
      ' S�lection dans la hi�rarchie
      Dim i As Integer
      For i = twSS.SelectedItem.Child.FirstSibling.Index To twSS.SelectedItem.Child.LastSibling.Index
        If twSS.Nodes(i).Children = 0 Then
          Ex�cuteCommande twSS.Nodes(i).Text
        End If
      Next
    End If
  End If
  
  sbStatus.SimpleText = ""
  btnEx�cuter.Enabled = True
End Sub

Private Function Connexion6000(ByVal sSyst�me As String) As Integer
  ' On recherche une connexion libre
  Do
    Dim i As Integer
    For i = 1 To MAXCONNEXION
      If Not t(i).bConnexion Then
        t(i).bConnexion = True
        t(i).sSyst�me = sSyst�me
        If Not t(i).TCP.bConnexion(sSyst�me, 6000) Then
          t(i).bConnexion = False
          Connexion6000 = -1
          Exit Function
        End If
        Dim sLigne As String
        sLigne = t(i).TCP.Re�oit
        t(i).TCP.Envoie "SET ADMIN ON" & vbCr
        Connexion6000 = i
        Exit Function
      End If
    Next
    DoEvents
  Loop
End Function

Private Sub AttendPrompt(ByVal iConn As Integer)
  Dim sLigne As String
  Do
    sLigne = t(iConn).TCP.Re�oit
  Loop Until sLigne = "%"
End Sub

Private Sub Ex�cuteCommande(ByVal sSyst�me As String)
  Dim iConn As Integer
  Dim res As Cl�sValeurs
  Set res = New Cl�sValeurs
  
  sbStatus.SimpleText = "Connexion au syst�me " & sSyst�me
  iConn = Connexion6000(sSyst�me)
  If iConn < 0 Then
    res.Add "Probl�me", "�chec � la connexion"
  Else
    AttendPrompt iConn
    sbStatus.SimpleText = "Ex�cution de la commande sur le syst�me " & sSyst�me
    R�cup�reR�sultat iConn, cboCommande.Text, res
    t(iConn).TCP.Ferme
    t(iConn).bConnexion = False
  End If
  
  sbStatus.SimpleText = "Mise en forme des r�sultats du syst�me " & sSyst�me
  ' On ajoute les headers manquants
  Dim k As Cl�Valeur
  Dim ch As ColumnHeader
  Dim iLarg As Integer
  On Error Resume Next
  For Each k In res
    Set ch = lwR�sultat.ColumnHeaders(k.sCl�)
    If Err Then
      iLarg = TextWidth(k.sCl�)
      lwR�sultat.ColumnHeaders.Add , k.sCl�, k.sCl�, iLarg
    End If
  Next
  On Error GoTo 0
  
  ' On place les valeurs
  Dim n As ListItem
  Set n = lwR�sultat.ListItems.Add(, sSyst�me, sSyst�me, , "Micro")
  Dim iK As Integer
  For Each k In res
    iK = lwR�sultat.ColumnHeaders(k.sCl�).Index - 1
    n.SubItems(iK) = k.sValeur
    iLarg = TextWidth(k.sValeur)
    If iLarg > lwR�sultat.ColumnHeaders(iK + 1).Width Then
      lwR�sultat.ColumnHeaders(iK + 1).Width = iLarg
    End If
  Next
  
  ' On m�morise le r�sultat de la commande
  colRes.Add res, sSyst�me
End Sub


Private Sub R�cup�reR�sultat(ByVal iConn As Integer, ByVal sCommande As String, ByRef res As Cl�sValeurs)
  t(iConn).TCP.Envoie sCommande & vbCrLf
  Dim sLigne As String
  Dim iPosEgal As Integer
  Dim iIndiceR�ponse As Integer
  Dim sCl� As String
  Dim sValeur As String
  Do
    sLigne = t(iConn).TCP.Re�oit
    iIndiceR�ponse = iIndiceR�ponse + 1
    If sLigne = "%" Then Exit Sub
    iPosEgal = InStr(sLigne, "=")
    If iPosEgal = 0 Then
      sCl� = "Ligne " & iIndiceR�ponse
      sValeur = sLigne
    Else
      sCl� = Left(sLigne, iPosEgal - 1)
      sValeur = Mid(sLigne, iPosEgal + 1)
    End If
    res.Add sCl�, sValeur, sCl�
  Loop
End Sub

' ================================================================================
' Op�rations sur le tableau des valeurs

Private Sub lwR�sultat_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
  If ColumnHeader.Index = 1 Or btnEx�cuter.Enabled = False Or sbStatus.SimpleText <> "" Then
    Beep
    Exit Sub
  End If
  
  sbStatus.SimpleText = "Pr�paration du graphique"
  
  Dim f As Excel.Worksheet
  Dim sCl� As String
  Dim res As Cl�sValeurs
  
  Set xl = Nothing
  Set xl = New Excel.Application
  xl.Visible = True
  xl.Workbooks.Add
  Set f = xl.Worksheets(1)
  
  sCl� = ColumnHeader.Text
  f.Cells(1, 1) = "Syst�me"
  f.Cells(1, 2) = sCl�
  
  Dim iLigne As Integer
  For iLigne = 1 To lwR�sultat.ListItems.Count
    Set res = colRes(iLigne)
    
    f.Cells(iLigne + 1, 1) = lwR�sultat.ListItems(iLigne).Text
    On Error Resume Next
    f.Cells(iLigne + 1, 2) = res(sCl�).sValeur
    On Error GoTo 0
  Next
  
  Dim r As Excel.Range
  Set r = f.Range(f.Cells(1, 1), f.Cells(iLigne, 2))
  xl.Charts.Add
  xl.ActiveChart.SetSourceData Source:=r
  xl.ActiveChart.Location Where:=xlLocationAsNewSheet
  
  sbStatus.SimpleText = ""
End Sub

Private Sub lwR�sultat_DblClick()
  Dim sMessage As String
  
  sMessage = "Syst�me " & lwR�sultat.SelectedItem.Text & vbCrLf
  Dim res As Cl�sValeurs
  Set res = colRes(lwR�sultat.SelectedItem.Text)
  Dim k As Cl�Valeur
  For Each k In res
    sMessage = sMessage & vbCrLf & k.sCl� & "=" & k.sValeur
  Next
  MsgBox sMessage, vbInformation, sNomApp
End Sub

