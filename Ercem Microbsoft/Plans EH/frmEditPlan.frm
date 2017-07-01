VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmEditeur 
   Caption         =   "Editeur de plans"
   ClientHeight    =   6795
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7335
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmEditPlan.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   453
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   489
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   741
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   6
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "btnNouveau"
            Object.ToolTipText     =   "Nouveau plan (Ctrl+N)"
            Object.Tag             =   ""
            ImageKey        =   "imgNouveau"
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "btnOuvrir"
            Object.ToolTipText     =   "Ouvre un plan existant (Ctrl+O)"
            Object.Tag             =   ""
            ImageKey        =   "imgOuvrir"
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "btnEnregistrer"
            Object.ToolTipText     =   "Enregistre les modifications du plan courant (Ctrl+S)"
            Object.Tag             =   ""
            ImageKey        =   "imgEnregistrer"
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button6 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "btnImprimer"
            Object.ToolTipText     =   "Imprime le plan (Ctrl+I)"
            Object.Tag             =   ""
            ImageKey        =   "imgImprimer"
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtIndice 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   5940
      Locked          =   -1  'True
      TabIndex        =   15
      Top             =   540
      Width           =   735
   End
   Begin VB.TextBox txtItem 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   5940
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   900
      Width           =   735
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   12
      Top             =   6480
      Width           =   7335
      _ExtentX        =   12938
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
   Begin VB.HScrollBar HScroll 
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   6000
      Width           =   5715
   End
   Begin VB.VScrollBar VScroll 
      Height          =   3975
      Left            =   6900
      TabIndex        =   8
      Top             =   1680
      Width           =   255
   End
   Begin VB.PictureBox picOutilCase 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   5220
      ScaleHeight     =   18
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   33
      TabIndex        =   7
      Top             =   1260
      Width           =   525
   End
   Begin VB.TextBox txtFichier 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   960
      Locked          =   -1  'True
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   1260
      Width           =   4155
   End
   Begin VB.TextBox txtTitre 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   960
      Locked          =   -1  'True
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   900
      Width           =   4155
   End
   Begin VB.TextBox txtPlan 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   960
      Locked          =   -1  'True
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   540
      Width           =   735
   End
   Begin VB.PictureBox picCadre 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H8000000C&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4215
      Left            =   60
      ScaleHeight     =   279
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   443
      TabIndex        =   0
      Top             =   1680
      Width           =   6675
      Begin VB.PictureBox picPlan 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   3375
         Left            =   360
         ScaleHeight     =   225
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   389
         TabIndex        =   10
         Top             =   480
         Width           =   5835
         Begin VB.PictureBox picCase 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            ForeColor       =   &H80000008&
            Height          =   300
            Index           =   0
            Left            =   0
            ScaleHeight     =   18
            ScaleMode       =   3  'Pixel
            ScaleWidth      =   33
            TabIndex        =   11
            Top             =   0
            Visible         =   0   'False
            Width           =   525
         End
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   3360
      Top             =   480
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   4
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmEditPlan.frx":0442
            Key             =   "imgNouveau"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmEditPlan.frx":0554
            Key             =   "imgOuvrir"
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmEditPlan.frx":0666
            Key             =   "imgEnregistrer"
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmEditPlan.frx":0778
            Key             =   "imgImprimer"
         EndProperty
      EndProperty
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Indice :"
      Height          =   210
      Left            =   5160
      TabIndex        =   16
      Top             =   600
      Width           =   705
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Item :"
      Height          =   210
      Left            =   5160
      TabIndex        =   14
      Top             =   960
      Width           =   570
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Fichier :"
      Height          =   210
      Left            =   60
      TabIndex        =   5
      Top             =   1320
      Width           =   735
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Left            =   60
      TabIndex        =   3
      Top             =   960
      Width           =   555
   End
   Begin VB.Label Label1 
      Caption         =   "Plan :"
      Height          =   210
      Left            =   60
      TabIndex        =   1
      Top             =   600
      Width           =   540
   End
   Begin VB.Menu mnuPlan 
      Caption         =   "&Plan"
      Begin VB.Menu cmdNouveau 
         Caption         =   "&Nouveau…"
         Shortcut        =   ^N
      End
      Begin VB.Menu cmdOuvrir 
         Caption         =   "&Ouvrir…"
         Shortcut        =   ^O
      End
      Begin VB.Menu cmdEnregistrer 
         Caption         =   "&Enregistrer"
         Shortcut        =   ^S
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdModifierPlan 
         Caption         =   "&Modifier…"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdImprimer 
         Caption         =   "&Imprimer"
         Shortcut        =   ^I
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuCase 
      Caption         =   "&Case"
      Begin VB.Menu cmdModifierCase 
         Caption         =   "&Modifier…"
      End
      Begin VB.Menu cmdSupprimerCase 
         Caption         =   "&Supprimer"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&?"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de…"
      End
   End
End
Attribute VB_Name = "frmEditeur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmEditPlan
' Editeur interactif de plans
' 24/04/1998 PV

Option Explicit

Private XOff As Single, YOff As Single
Private iCaseActive As Integer

Dim bDirtyPlan As Boolean
Dim bDirtyCases As Boolean

Dim pPlanCourant As Plan   ' Plan courant


' ============================================================================
' Actions

Private Sub doNouveau()
  Set picPlan.Picture = LoadPicture()
  EffaceCases
  iCaseActive = 0
  txtIndice = ""
  txtItem = ""
  
  txtPlan = ""
  txtTitre = ""
  txtFichier = ""
  
  Set pPlanCourant = New Plan

  bDirtyPlan = False
  bDirtyCases = False
End Sub


Private Sub doOuvrir()
  Dim sNomPlan As String
  
  sNomPlan = frmOuvrir.sPlanAOuvrir()
  If sNomPlan = "" Then Exit Sub
  
  doNouveau
  If Not bOuvreBase Then Exit Sub
  
  Dim rs As Recordset
  Set rs = db.OpenRecordset("select * from plan where pla_plan='" & sNomPlan & "'")
  If rs.EOF Then
    txtPlan = "Plan " & sNomPlan & " inexistant !"
    txtTitre = ""
    txtFichier = ""
    GoTo sortie
  End If
  
  pPlanCourant.pla_plan = rs!pla_plan
  pPlanCourant.pla_titre = rs!pla_titre
  pPlanCourant.pla_comment = NV(rs!pla_comment)
  pPlanCourant.pla_fichier = rs!pla_fichier
  pPlanCourant.pla_portrait = NV(rs!pla_portrait)
  
  txtPlan = rs!pla_plan
  txtTitre = rs!pla_titre
  txtFichier = rs!pla_fichier
  rs.Close
  
  picPlan.Visible = False   ' Evite deux affichages de suite
  Set picPlan.Picture = LoadPicture(txtFichier)
  picPlan.Visible = True
  AjusteAscenseurs
  
  Set rs = db.OpenRecordset("select * from champ where cha_plan='" & sNomPlan & "'")
  Do Until rs.EOF
    CréeCase rs!cha_numloc, rs!cha_x / PixToCmEcranX, rs!cha_y / PixToCmEcranX
    rs.MoveNext
  Loop
  
sortie:
  rs.Close
  FermeBase
End Sub


Private Sub doEnregistrer()
  If Not bOuvreBase Then Exit Sub
  
  Dim rs As Recordset
  If bDirtyPlan Then
    Set rs = db.OpenRecordset("select * from plan where pla_plan='" & txtPlan & "'")
    If rs.EOF Then
      rs.AddNew
    Else
      rs.Edit
    End If
    rs!pla_plan = pPlanCourant.pla_plan
    rs!pla_titre = pPlanCourant.pla_titre
    rs!pla_comment = pPlanCourant.pla_comment
    rs!pla_fichier = rs!pla_fichier
    rs!pla_portrait = pPlanCourant.pla_portrait
    rs.Update
    rs.Close
    
    bDirtyPlan = False
  End If
  
  If bDirtyCases Then
    db.Execute "delete from champ where cha_plan='" & txtPlan & "'"
    Set rs = db.OpenRecordset("select * from champ where cha_plan='" & txtPlan & "'")
    Dim c As PictureBox
    For Each c In picCase
      If c.Index > 0 Then
        rs.AddNew
        rs!cha_plan = txtPlan
        rs!cha_indice = c.Index
        rs!cha_numloc = VN(c.Tag)
        rs!cha_x = c.Left * PixToCmEcranX
        rs!cha_y = c.Top * PixToCmEcranY
        rs.Update
      End If
    Next
    rs.Close
    
    bDirtyCases = False
  End If
  
  db.Close
End Sub


Private Sub AjusteAscenseurs()
  HScroll.Max = picPlan.Width - picCadre.Width + 1
  VScroll.Max = picPlan.Height - picCadre.Height + 1
  HScroll.Visible = picPlan.Width >= picCadre.Width
  If HScroll.Visible Then
    HScroll.LargeChange = Max(HScroll.Max \ 10, 1)
    HScroll.SmallChange = Max(HScroll.Max \ 100, 1)
  End If
  
  VScroll.Visible = picPlan.Height >= picCadre.Height
  If VScroll.Visible Then
    VScroll.LargeChange = Max(VScroll.Max \ 10, 1)
    VScroll.SmallChange = Max(VScroll.Max \ 100, 1)
  End If
End Sub


Private Sub doImprimer()
  Screen.MousePointer = vbHourglass
  
  Dim CmToTwip As Single, offX As Single, offY As Single
  CmToTwip = 1440 / 2.54
  offX = 0.05 * CmToTwip
  offY = 0.05 * CmToTwip
 
  Dim colCases As New Collection
  Dim ci As CaseItem
 
  Dim c As PictureBox
  For Each c In picCase
    If c.Index > 0 Then
      Set ci = New CaseItem
      ci.X = c.Left * PixToCmEcranX
      ci.Y = c.Top * PixToCmEcranY
      ci.sValeur = c.Tag
      colCases.Add ci
    End If
  Next
  
  frmImpressionPlan.doImpression pPlanCourant, colCases
  Printer.EndDoc
  Screen.MousePointer = vbDefault
End Sub


Private Sub doModifierCase()
  If iCaseActive = 0 Then Exit Sub
  
  Dim sNumLoc As String
  sNumLoc = InputBox("Numéro local de l'item ?", sNomApp, txtItem)
  If sNumLoc = "" Or sNumLoc = txtItem Then Exit Sub
  SetNumLoc iCaseActive, sNumLoc
  bDirtyCases = True
End Sub

Private Sub doSupprimerCase()
  If iCaseActive = 0 Then Exit Sub
  
  SupprimeCase iCaseActive
  iCaseActive = 0
  bDirtyCases = True
End Sub


' ============================================================================
' Menus / Boutons

Private Function bOkNouveau() As Boolean
  If bDirtyPlan Or bDirtyCases Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Le plan a été modifié mais pas sauvegardé. Ok pour continuer sans enregistrer ?", vbQuestion + vbOKCancel + vbDefaultButton2, sNomApp)
    If iRep = vbCancel Then
      bOkNouveau = False
      Exit Function
    End If
  End If
  bOkNouveau = True
End Function

Private Sub cmdModifierPlan_Click()
  If frmAttributsPlan.bModifierPlan(pPlanCourant) Then
    txtTitre = pPlanCourant.pla_titre
    bDirtyPlan = True
  End If
End Sub

Private Sub cmdNouveau_Click()
  If Not bOkNouveau Then Exit Sub
  doNouveau
  If frmAttributsPlan.bModifierPlan(pPlanCourant) Then
    txtPlan = pPlanCourant.pla_plan
    txtTitre = pPlanCourant.pla_titre
    txtFichier = pPlanCourant.pla_fichier
    bDirtyPlan = True
    
    picPlan.Visible = False   ' Evite deux affichages de suite
    Set picPlan.Picture = LoadPicture(txtFichier)
    picPlan.Visible = True
    AjusteAscenseurs
  End If
End Sub

Private Sub cmdOuvrir_Click()
  If Not bOkNouveau Then Exit Sub
  doOuvrir
End Sub

Private Sub cmdEnregistrer_Click()
  doEnregistrer
End Sub

Private Sub cmdImprimer_Click()
  doImprimer
End Sub

Private Sub cmdQuitter_Click()
  If Not bOkNouveau Then Exit Sub
  Unload Me
End Sub


Private Sub mnuCase_click()
  cmdModifierCase.Enabled = iCaseActive > 0
  cmdSupprimerCase.Enabled = iCaseActive > 0
End Sub

Private Sub cmdModifierCase_Click()
  doModifierCase
End Sub

Private Sub cmdSupprimerCase_Click()
  doSupprimerCase
End Sub



Private Sub cmdAPropos_Click()
  MsgBox "Éditeur interactif de plans EH" & vbCrLf & _
    "Version " & App.Major & "." & App.Minor & "." & App.Revision & vbCrLf & vbCrLf & _
    "(c) DI ERCEM / P.VIOLENT 1998", vbInformation, sNomApp
End Sub


Private Sub tbBoutons_ButtonClick(ByVal Button As Button)
  Select Case Button.Key
    Case "btnNouveau": cmdNouveau_Click
    Case "btnOuvrir": cmdOuvrir_Click
    Case "btnEnregistrer": cmdEnregistrer_Click
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
  doNouveau
End Sub

Private Sub Form_Paint()
  Line (0, tbBoutons.Height)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, tbBoutons.Height + 1)-Step(ScaleWidth, 0), vb3DHighlight
End Sub

Private Sub Form_Resize()
  On Error GoTo suite
  picCadre.Width = frmEditeur.ScaleWidth - VScroll.Width - 10
  picCadre.Height = frmEditeur.ScaleHeight - picCadre.Top - HScroll.Height - sbStatus.Height - 5
suite:
  VScroll.Move picCadre.Left + picCadre.Width, picCadre.Top, VScroll.Width, picCadre.Height
  HScroll.Move picCadre.Left, picCadre.Top + picCadre.Height, picCadre.Width, HScroll.Height
  
  picPlan.Move 0, 0
  AjusteAscenseurs
End Sub


' ============================================================================
' Contrôles

Private Sub HScroll_Change()
  picPlan.Left = -HScroll.Value
  AjusteAscenseurs
End Sub

Private Sub txtItem_DblClick()
  doModifierCase
End Sub

Private Sub VScroll_Change()
  picPlan.Top = -VScroll.Value
  AjusteAscenseurs
End Sub

Private Sub picCase_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  If iCaseActive <> Index Then
    If iCaseActive > 0 Then Désactive iCaseActive
    iCaseActive = Index
    Active iCaseActive
  End If
  
  Select Case Button
    Case vbLeftButton:
      XOff = X
      YOff = Y
      picCase(Index).Drag
    
    Case vbRightButton:
      PopupMenu mnuCase
  End Select
End Sub

Private Sub picCase_DblClick(Index As Integer)
  cmdModifierCase_Click
End Sub


Private Sub picOutilCase_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If iCaseActive > 0 Then Désactive iCaseActive: iCaseActive = 0
  XOff = X
  YOff = Y
  picOutilCase.Drag
End Sub

Private Sub doDragDrop(Source As Control, ByVal X As Single, ByVal Y As Single)
  X = X - XOff
  Y = Y - YOff
  If X < 0 Then X = 0
  If Y < 0 Then Y = 0
  'If X > picPlan.Width - picOutilCase.Width Then X = picPlan.Width - picOutilCase.Width
  'If Y > picPlan.Height - picOutilCase.Height Then Y = picPlan.Height - picOutilCase.Height
  
  If Source Is picOutilCase Then
    Dim sNumLoc As String
    sNumLoc = InputBox("Création d'une case" & vbCrLf & vbCrLf & "Numéro local de l'item ?", sNomApp, "?")
    If sNumLoc = "" Then Exit Sub
    iCaseActive = CréeCase(sNumLoc, X, Y)
  Else
    iCaseActive = Source.Index
    DéplaceCase iCaseActive, X, Y
  End If
  
  Active iCaseActive
  bDirtyCases = True
End Sub

Private Sub picPlan_DragDrop(Source As Control, X As Single, Y As Single)
  doDragDrop Source, X, Y
End Sub

Private Sub picCase_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
  doDragDrop Source, X + picCase(Index).Left, Y + picCase(Index).Top
End Sub

