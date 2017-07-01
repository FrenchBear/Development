VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmImprimePlan 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Impression d'un plan"
   ClientHeight    =   2025
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   3960
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmImprimePlan.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   135
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   264
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   3960
      _ExtentX        =   6985
      _ExtentY        =   741
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   2
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "btnImprimer"
            Object.ToolTipText     =   "Imprime le plan et la visite sélectionnés (Ctrl+I)"
            Object.Tag             =   ""
            ImageKey        =   "imgImprimePlan"
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtGrille 
      Height          =   315
      Left            =   1680
      MaxLength       =   9
      TabIndex        =   6
      Text            =   "810"
      Top             =   1260
      Width           =   1215
   End
   Begin VB.CommandButton btnOuvrePlan 
      Height          =   315
      Left            =   2940
      Picture         =   "frmImprimePlan.frx":014A
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   540
      Width           =   315
   End
   Begin VB.TextBox txtRéférence 
      Height          =   315
      Left            =   1680
      MaxLength       =   9
      TabIndex        =   4
      Text            =   "ZZ101"
      Top             =   900
      Width           =   1215
   End
   Begin VB.TextBox txtPlan 
      Height          =   315
      Left            =   1680
      MaxLength       =   4
      TabIndex        =   1
      Text            =   "RT"
      Top             =   540
      Width           =   1215
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   7
      Top             =   1710
      Width           =   3960
      _ExtentX        =   6985
      _ExtentY        =   556
      Style           =   1
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
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
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   3240
      Top             =   960
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   1
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmImprimePlan.frx":024C
            Key             =   "imgImprimePlan"
         EndProperty
      EndProperty
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "&Grille :"
      Height          =   210
      Left            =   120
      TabIndex        =   5
      Top             =   1320
      Width           =   600
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&Référence :"
      Height          =   210
      Left            =   120
      TabIndex        =   3
      Top             =   960
      Width           =   1080
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Plan :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   540
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdImprimer 
         Caption         =   "&Imprimer"
         Shortcut        =   ^I
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&?"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de…"
      End
   End
End
Attribute VB_Name = "frmImprimePlan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmImprimePlan
' Module d'impression des plans
' 24/04/1998 PV

Option Explicit



' ============================================================================
' Actions

Private Sub doImprimer2(ByVal sNomPlan As String, ByVal sRef As String, ByVal iGrille As Integer)

  ' 1ère partie, accès au plan
  SetStatus "Accès au plan…"
  Dim pPlan As New Plan   ' Plan à imprimer
  If Not bOuvreBase Then Exit Sub
  Dim rs As Recordset
  Set rs = db.OpenRecordset("select * from plan where pla_plan='" & sNomPlan & "'")
  If rs.EOF Then
    txtPlan = "Plan " & sNomPlan & " inexistant !"
    rs.Close
    FermeBase
    Exit Sub
  End If
  pPlan.pla_plan = rs!pla_plan
  pPlan.pla_titre = rs!pla_titre
  pPlan.pla_comment = rs!pla_comment
  pPlan.pla_fichier = rs!pla_fichier
  pPlan.pla_portrait = rs!pla_portrait
  rs.Close
  
  Dim colCases As New Collection
  Dim c As CaseItem
  
  Set rs = db.OpenRecordset("select * from champ where cha_plan='" & sNomPlan & "'")
  Do Until rs.EOF
    Set c = New CaseItem
    c.X = rs!cha_x
    c.Y = rs!cha_y
    c.sValeur = ""
    colCases.Add c, "L" & UCase(rs!cha_numloc)
    rs.MoveNext
  Loop

  rs.Close
  FermeBase
  
  
  ' 2ème partie, accès à la visite
  SetStatus "Accès à la visite…"
  On Error Resume Next
  BDInit False
  If Err Then
    MsgBox "Échec lors de la connexion à la base de données Unix." & vbCrLf & vbCrLf & "Erreur " & Err.Number & ": " & Err.Source & ": " & Err.Description, vbExclamation, sNomApp
    Exit Sub
  End If
  On Error GoTo 0

  Dim cEHT As New BDCurseur
  cEHT.OpenCurseur "select * from ehtete where eht_ref='" & sRef & "' and eht_numgri=" & iGrille
  If cEHT.EOF Then
    cEHT.CloseCurseur
    BDFin
    MsgBox "Combinaison référence/grille inexistante dans la base", vbExclamation, sNomApp
    Exit Sub
  End If
  
  Dim cEC As New BDCurseur
  cEC.OpenCurseur "select ec_valeur,cg_numloc from ehcorps,corgri where ec_ref='" & sRef & "' and ec_numgri=" & iGrille & " and cg_serie=ec_serie"
  While Not cEC.EOF
    Dim sValeur As String
    sValeur = "  o"
    Select Case cEC!ec_valeur
      Case 0: sValeur = ""
      Case 1: sValeur = "  o"
      Case 2: sValeur = "  X"
      Case 3: sValeur = "XXX"
      Case Else: sValeur = "  ?"
    End Select
    On Error Resume Next
    colCases("L" & UCase(cEC!cg_numloc)).sValeur = sValeur
    On Error GoTo 0
    
    cEC.MoveNext
  Wend
  cEC.CloseCurseur

  ' 3ème partie, impression
  SetStatus "Impression du plan…"
  frmImpressionPlan.doImpression pPlan, colCases
  
  
  ' 4ème partie, on ajoute le cartouche
  SetStatus "Cartouche final…"
  Printer.CurrentX = 0
  Printer.CurrentY = 0
  On Error Resume Next
  Printer.Font = "Verdana"
  On Error GoTo 0
  Printer.FontSize = 8
  
  Printer.Print "Référence: " & cEHT!eht_ref
  Printer.Print "Établissement: " & cEHT!eht_etb; ": " & cEHT!eht_prefixe & " " & cEHT!eht_nometb
  Printer.Print "Grille: " & cEHT!eht_numgri
  Printer.Print "Visite du: " & cEHT!eht_datevis
  Printer.Print "Plan: " & sNomPlan
  Printer.Print "Impression du: " & Now
  cEHT.CloseCurseur
  BDFin
  
  SetStatus "Envoi des données au spooler…"
  Printer.EndDoc
  
End Sub

Private Sub doImprimer(ByVal sNomPlan As String, ByVal sRef As String, ByVal iGrille As Integer)
  Screen.MousePointer = vbHourglass
  doImprimer2 sNomPlan, sRef, iGrille
  SetStatus ""
  Screen.MousePointer = vbDefault
End Sub


' ============================================================================
' Menus / Boutons

Private Sub cmdImprimer_Click()
  doImprimer txtPlan, txtRéférence, Val(txtGrille)
End Sub

Private Sub cmdQuitter_Click()
  Unload Me
End Sub

Private Sub cmdAPropos_Click()
  MsgBox "Impression de plans EH" & vbCrLf & _
    "Version " & App.Major & "." & App.Minor & "." & App.Revision & vbCrLf & vbCrLf & _
    "(c) DI ERCEM / P.VIOLENT 1998", vbInformation, sNomApp
End Sub


Private Sub tbBoutons_ButtonClick(ByVal Button As Button)
  Select Case Button.Key
    Case "btnImprimer": cmdImprimer_Click

    Case Else:
      MsgBox "Bouton " & Button.Key & " de la barre de boutons non traité !", vbCritical, sNomApp
      Stop
  End Select
End Sub



' ============================================================================
' Gestion de la feuille

Private Sub Form_Load()
  InitConstantes
  cmdQuitter.Caption = "&Quitter" & vbTab & "Alt+F4"
  AutoSelect txtPlan, True
End Sub

Private Sub Form_Paint()
  Line (0, tbBoutons.Height)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, tbBoutons.Height + 1)-Step(ScaleWidth, 0), vb3DHighlight
End Sub

Private Sub SetStatus(ByVal sMessage As String)
  sbStatus.SimpleText = sMessage
  sbStatus.Refresh
End Sub


' ============================================================================
' Contrôles

Private Sub btnOuvrePlan_Click()
  Dim sPlan As String
  sPlan = frmOuvrir.sPlanAOuvrir
  If sPlan <> "" Then
    txtPlan = sPlan
    AutoSelect txtPlan, True
  End If
End Sub


Private Sub txtPlan_GotFocus()
  AutoSelect txtPlan
  SetStatus "Entrez le code du plan"
End Sub

Private Sub btnOuvrePlan_GotFocus()
  SetStatus "Affiche les plans disponibles"
End Sub

Private Sub txtRéférence_GotFocus()
  AutoSelect txtRéférence
  SetStatus "Entrez la référence d'intervention"
End Sub

Private Sub txtGrille_GotFocus()
  AutoSelect txtGrille
  SetStatus "Entrez le code de la grille"
End Sub

