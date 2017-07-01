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
   Begin MSComctlLib.ListView lwRésultat 
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
         Text            =   "Système"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.CommandButton btnExécuter 
      Caption         =   "Exécuter"
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
   Begin VB.TextBox txtSélection 
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
            Key             =   "Unité"
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
      Caption         =   "Sélection :"
      Height          =   210
      Left            =   2880
      TabIndex        =   2
      Top             =   120
      Width           =   990
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Sites et systèmes"
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
      Begin VB.Menu cmdPrédéfini 
         Caption         =   "(prédéfini)"
         Index           =   0
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de Admin6000…"
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
Dim iUnitéCourante As Integer
Dim sSiteCourant As String


' Suivi des connexions TCP simultanées
Private Type Connexion
  TCP As New TCPSynchrone     ' Connexion, buffer…
  sSystème As String          ' Clé du système auquel on est connecté
  bConnexion As Boolean       ' Vrai si la connexion est établie
  sBuffer As String           ' Buffer caractère de réception
  bCommandeEnCours As Boolean ' Vrai si le programme est en train de traiter une commande précédente
End Type

Const MAXCONNEXION = 10       ' Nb maxi de connexions TCP simultanées
Dim t(1 To MAXCONNEXION) As Connexion


' Commandes prédéfinies
Dim colPrédéfini As New Collection


' Mémorisation du résultat d'exécution des commandes
Dim colRes As New Collection


' Présentation graphique des résultats
Dim xl As Excel.Application


' =========================================================
' Menus

Private Sub cmdQuitter_Click()
  Unload Me
End Sub

Private Sub cmdAPropos_Click()
  MsgBox "Administration de micros exécutant Serveur6000" & vbCrLf & _
    "Version " & App.Major & "." & App.Minor & "." & App.Revision & vbCrLf & vbCrLf & _
    "(c) ERCEM/P.VIOLENT 1997", vbInformation, sNomApp
End Sub

Private Sub cmdCourante_Click()
  btnExécuter_Click
End Sub

Private Sub cmdPrédéfini_Click(Index As Integer)
  cboCommande.Text = colPrédéfini(Index)
  cboCommande.SelStart = 0
  cboCommande.SelLength = 999
  btnExécuter_Click
End Sub

' =========================================================
' Initialisation

Private Sub AjouteSite(ByVal sNomSite As String)
  Dim n As Node
  Set n = twSS.Nodes.Add(, tvwNext, "S" & sNomSite, sNomSite, "Site")
  sSiteCourant = sNomSite
  iSiteCourant = n.Index
  iUnitéCourante = n.Index
End Sub

Private Sub AjouteUnité(ByVal sNomUnité As String)
  Dim n As Node
  Set n = twSS.Nodes.Add(iSiteCourant, tvwChild, "U" & sSiteCourant & sNomUnité, sNomUnité, "Unité")
  iUnitéCourante = n.Index
End Sub

Private Sub AjouteSystème(ByVal sNomSystème As String)
  twSS.Nodes.Add iUnitéCourante, tvwChild, "M" & sNomSystème, sNomSystème, "Micro"
End Sub


Private Sub Form_Load()
  ' A charger à partir d'un fichier de config (.INI)
  
  AjouteSite "Ercem Grenoble"
  AjouteUnité "DI/EC"
  AjouteSystème "Uranus"
  AjouteSystème "Athos"
  AjouteSystème "Nadine"
  AjouteSystème "Hermes"
  AjouteSystème "Ec1"
  
  AjouteUnité "Divers"
  AjouteSystème "Jupiter"
  AjouteSystème "Uop1"
  AjouteSystème "Reunion"
  AjouteSystème "Kafka"
  
  AjouteUnité "SCG"
  AjouteSystème "Mad"
  AjouteSystème "Amedee"
  AjouteSystème "Pavot"
  AjouteSystème "Tresor"
  AjouteSystème "Rapetou"
  
  AjouteUnité "DAF"
  AjouteSystème "Chepiok"
  AjouteSystème "Pomme"
  
  AjouteUnité "SFC"
  AjouteSystème "Goofy"
  AjouteSystème "Souris"
  AjouteSystème "Mulot"
  AjouteSystème "Dragon"
  AjouteSystème "Kim"
  
  AjouteUnité "STFS"
  AjouteSystème "Eliane"
  AjouteSystème "Severine"
  AjouteSystème "Farida"
  AjouteSystème "Fraise"
  AjouteSystème "Mathieu"
  AjouteSystème "Bacterie"
  
  AjouteSite "Ercem Massy"
  AjouteUnité "DOP"
  AjouteSystème "Dodo"
  AjouteSystème "Dop"
  AjouteUnité "DG"
  AjouteSystème "Daffy"
  AjouteSystème "Flop"
  AjouteUnité "DQ"
  AjouteSystème "Didier"
  AjouteUnité "DF/EC"
  AjouteSystème "Bijou"
  AjouteSystème "Bill"
  AjouteUnité "DCD"
  AjouteSystème "Vizir"
  AjouteSystème "Tulipe"
  AjouteSystème "Rose"
  AjouteSystème "Lilas"
  AjouteUnité "STFN"
  AjouteSystème "Fleur"
  AjouteSystème "Phoque"
  AjouteSystème "Otarie"
  AjouteSystème "Dauphin"
  AjouteSystème "Meduse"
  AjouteSystème "Morse"
  AjouteSystème "Merou"
  AjouteSystème "Bigorneau"
  AjouteUnité "UOP6"
  AjouteSystème "Castor"
  AjouteUnité "Divers"
  AjouteSystème "Zeus2"
  
  AjouteSite "LBF Massy"
  AjouteSystème "Aigle"
  AjouteSystème "Albatros"
  AjouteSystème "Flairsou"
  AjouteSystème "Dtdq"
  AjouteSystème "Stat"
  AjouteSystème "Secrdg"
  AjouteSystème "Commercial"
  AjouteSystème "Mars"
  AjouteSystème "Chef"
  
  AjouteSite "LBF Salies"
  AjouteSystème "Lbf1"
  AjouteSystème "Lbf3"
  AjouteSystème "Lbf4"
  AjouteSystème "Lbf5"
  AjouteSystème "Lbf6"
  AjouteSystème "Lbf7"
  AjouteSystème "Mvw"
  
  AjouteSite "LBF Roanne"
  AjouteSystème "Lbf2"
  AjouteSystème "Poste1"
  AjouteSystème "Poste3"
  AjouteSystème "Poste4"
  AjouteSystème "Poste5"
  AjouteSystème "Poste6"
  
  AjouteSite "Ercem Fontaine"
  AjouteSystème "Odile"
  AjouteSystème "Mireille"
  AjouteSystème "Mbf"
  AjouteSystème "Valda"
  AjouteSystème "Gamma"
  AjouteSystème "Reception"
  AjouteUnité "SL"
  AjouteSystème "Hercule"
  AjouteSystème "Mauve"
  AjouteSystème "Muguet"
  AjouteSystème "Begonia"
  AjouteSystème "Fuchsia"
  AjouteSystème "Azalee"

  AjouteSite "Ercem Lyon"
  AjouteSystème "Frank"
  AjouteSystème "Uop3"
  AjouteSystème "Ec5"
  
  twSS.Nodes("SErcem Grenoble").Expanded = True
  Set twSS.SelectedItem = twSS.Nodes("UErcem GrenobleDI/EC")
  twSS.SelectedItem.Expanded = True
  twSS_Click
  
  ' Commandes de base
  CommandePrédéfinie "Date et heure", "Date"
  CommandePrédéfinie "Versions serveur6000 et Windows", "Ver"
  CommandePrédéfinie "Place disque disponible", "Dfree"
  CommandePrédéfinie "Mémoire disponible", "Mem"
  CommandePrédéfinie "Environnement", "Env"
  CommandePrédéfinie "Mes documents", "GetReg ""HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"" Personal"
  cmdPrédéfini(0).Visible = False
  
  Show
  cboCommande.SetFocus
  cboCommande.Text = "Mem"
  cboCommande.SelStart = 0
  cboCommande.SelLength = 999
End Sub

Private Sub CommandePrédéfinie(ByVal sTitre As String, ByVal sCommande As String)
  cboCommande.AddItem sCommande
  
  Load cmdPrédéfini(cboCommande.ListCount)
  cmdPrédéfini(cboCommande.ListCount).Caption = sTitre
  cmdPrédéfini(cboCommande.ListCount).Visible = True
  colPrédéfini.Add sCommande
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
' Sélection site / machine

Private Sub twSS_Click()
  If twSS.SelectedItem.Children = 0 Then
    txtSélection = "Micro " & twSS.SelectedItem.Text
  ElseIf Left(twSS.SelectedItem.Key, 1) = "S" Then
    txtSélection = "Tous les systèmes du site " & twSS.SelectedItem.Text
  Else
    txtSélection = "Tous les systèmes de l'unité " & twSS.SelectedItem.Text
  End If
End Sub

Private Sub twSS_DblClick()
  btnExécuter_Click
End Sub

Private Sub twSS_KeyPress(KeyAscii As Integer)
  If KeyAscii = 13 Then
    btnExécuter_Click
    KeyAscii = 0
  End If
End Sub


' =========================================================
' Exécution des commandes

Private Sub btnExécuter_Click()
  If cboCommande.Text <> "" Then
    btnExécuter.Enabled = False
    
    ' On efface les résultats précédents
    lwRésultat.ListItems.Clear
    While colRes.Count > 0
      colRes.Remove 1
    Wend
    
    ' On part d'en-tête de colonnes vierge
    lwRésultat.ColumnHeaders.Clear
    lwRésultat.ColumnHeaders.Add , "", "Système", 80

    If twSS.SelectedItem.Children = 0 Then
      ' Micro sélectionné
      ExécuteCommande twSS.SelectedItem.Text
    Else
      ' Sélection dans la hiérarchie
      Dim i As Integer
      For i = twSS.SelectedItem.Child.FirstSibling.Index To twSS.SelectedItem.Child.LastSibling.Index
        If twSS.Nodes(i).Children = 0 Then
          ExécuteCommande twSS.Nodes(i).Text
        End If
      Next
    End If
  End If
  
  sbStatus.SimpleText = ""
  btnExécuter.Enabled = True
End Sub

Private Function Connexion6000(ByVal sSystème As String) As Integer
  ' On recherche une connexion libre
  Do
    Dim i As Integer
    For i = 1 To MAXCONNEXION
      If Not t(i).bConnexion Then
        t(i).bConnexion = True
        t(i).sSystème = sSystème
        If Not t(i).TCP.bConnexion(sSystème, 6000) Then
          t(i).bConnexion = False
          Connexion6000 = -1
          Exit Function
        End If
        Dim sLigne As String
        sLigne = t(i).TCP.Reçoit
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
    sLigne = t(iConn).TCP.Reçoit
  Loop Until sLigne = "%"
End Sub

Private Sub ExécuteCommande(ByVal sSystème As String)
  Dim iConn As Integer
  Dim res As ClésValeurs
  Set res = New ClésValeurs
  
  sbStatus.SimpleText = "Connexion au système " & sSystème
  iConn = Connexion6000(sSystème)
  If iConn < 0 Then
    res.Add "Problème", "Échec à la connexion"
  Else
    AttendPrompt iConn
    sbStatus.SimpleText = "Exécution de la commande sur le système " & sSystème
    RécupèreRésultat iConn, cboCommande.Text, res
    t(iConn).TCP.Ferme
    t(iConn).bConnexion = False
  End If
  
  sbStatus.SimpleText = "Mise en forme des résultats du système " & sSystème
  ' On ajoute les headers manquants
  Dim k As CléValeur
  Dim ch As ColumnHeader
  Dim iLarg As Integer
  On Error Resume Next
  For Each k In res
    Set ch = lwRésultat.ColumnHeaders(k.sClé)
    If Err Then
      iLarg = TextWidth(k.sClé)
      lwRésultat.ColumnHeaders.Add , k.sClé, k.sClé, iLarg
    End If
  Next
  On Error GoTo 0
  
  ' On place les valeurs
  Dim n As ListItem
  Set n = lwRésultat.ListItems.Add(, sSystème, sSystème, , "Micro")
  Dim iK As Integer
  For Each k In res
    iK = lwRésultat.ColumnHeaders(k.sClé).Index - 1
    n.SubItems(iK) = k.sValeur
    iLarg = TextWidth(k.sValeur)
    If iLarg > lwRésultat.ColumnHeaders(iK + 1).Width Then
      lwRésultat.ColumnHeaders(iK + 1).Width = iLarg
    End If
  Next
  
  ' On mémorise le résultat de la commande
  colRes.Add res, sSystème
End Sub


Private Sub RécupèreRésultat(ByVal iConn As Integer, ByVal sCommande As String, ByRef res As ClésValeurs)
  t(iConn).TCP.Envoie sCommande & vbCrLf
  Dim sLigne As String
  Dim iPosEgal As Integer
  Dim iIndiceRéponse As Integer
  Dim sClé As String
  Dim sValeur As String
  Do
    sLigne = t(iConn).TCP.Reçoit
    iIndiceRéponse = iIndiceRéponse + 1
    If sLigne = "%" Then Exit Sub
    iPosEgal = InStr(sLigne, "=")
    If iPosEgal = 0 Then
      sClé = "Ligne " & iIndiceRéponse
      sValeur = sLigne
    Else
      sClé = Left(sLigne, iPosEgal - 1)
      sValeur = Mid(sLigne, iPosEgal + 1)
    End If
    res.Add sClé, sValeur, sClé
  Loop
End Sub

' ================================================================================
' Opérations sur le tableau des valeurs

Private Sub lwRésultat_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
  If ColumnHeader.Index = 1 Or btnExécuter.Enabled = False Or sbStatus.SimpleText <> "" Then
    Beep
    Exit Sub
  End If
  
  sbStatus.SimpleText = "Préparation du graphique"
  
  Dim f As Excel.Worksheet
  Dim sClé As String
  Dim res As ClésValeurs
  
  Set xl = Nothing
  Set xl = New Excel.Application
  xl.Visible = True
  xl.Workbooks.Add
  Set f = xl.Worksheets(1)
  
  sClé = ColumnHeader.Text
  f.Cells(1, 1) = "Système"
  f.Cells(1, 2) = sClé
  
  Dim iLigne As Integer
  For iLigne = 1 To lwRésultat.ListItems.Count
    Set res = colRes(iLigne)
    
    f.Cells(iLigne + 1, 1) = lwRésultat.ListItems(iLigne).Text
    On Error Resume Next
    f.Cells(iLigne + 1, 2) = res(sClé).sValeur
    On Error GoTo 0
  Next
  
  Dim r As Excel.Range
  Set r = f.Range(f.Cells(1, 1), f.Cells(iLigne, 2))
  xl.Charts.Add
  xl.ActiveChart.SetSourceData Source:=r
  xl.ActiveChart.Location Where:=xlLocationAsNewSheet
  
  sbStatus.SimpleText = ""
End Sub

Private Sub lwRésultat_DblClick()
  Dim sMessage As String
  
  sMessage = "Système " & lwRésultat.SelectedItem.Text & vbCrLf
  Dim res As ClésValeurs
  Set res = colRes(lwRésultat.SelectedItem.Text)
  Dim k As CléValeur
  For Each k In res
    sMessage = sMessage & vbCrLf & k.sClé & "=" & k.sValeur
  Next
  MsgBox sMessage, vbInformation, sNomApp
End Sub

