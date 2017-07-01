VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.MDIForm mdiEditeur 
   BackColor       =   &H8000000C&
   Caption         =   "Editeur Multiple"
   ClientHeight    =   5940
   ClientLeft      =   2505
   ClientTop       =   2025
   ClientWidth     =   6660
   Icon            =   "frmEditeur.frx":0000
   LinkTopic       =   "MDIForm1"
   OLEDropMode     =   1  'Manual
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6660
      _ExtentX        =   11748
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "imlImages"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   11
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnNouveau"
            Object.ToolTipText     =   "Nouveau (Ctrl+N)"
            ImageKey        =   "imgNouveau"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnOuvrir"
            Object.ToolTipText     =   "Ouvrir (Ctrl+O)"
            ImageKey        =   "imgOuvrir"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnEnregistrer"
            Object.ToolTipText     =   "Enregistrer (Ctrl+S)"
            ImageKey        =   "imgEnregistrer"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnCouper"
            Object.ToolTipText     =   "Couper (Ctrl+X)"
            ImageKey        =   "imgCouper"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnCopier"
            Object.ToolTipText     =   "Copier (Ctrl+C)"
            ImageKey        =   "imgCopier"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnColler"
            Object.ToolTipText     =   "Coller (Ctrl+V)"
            ImageKey        =   "imgColler"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnRechercher"
            Object.ToolTipText     =   "Rechercher (Ctrl+F)"
            ImageKey        =   "imgRechercher"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnRechercherSuivant"
            Object.ToolTipText     =   "Rechercher suivant (F3)"
            ImageKey        =   "imgRechercherSuivant"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnRemplacer"
            Object.ToolTipText     =   "Remplacer (Ctrl+H)"
            ImageKey        =   "imgRemplacer"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatusBar 
      Align           =   2  'Align Bottom
      Height          =   300
      Left            =   0
      TabIndex        =   1
      Top             =   5640
      Width           =   6660
      _ExtentX        =   11748
      _ExtentY        =   529
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   8652
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Text            =   "0 document"
            TextSave        =   "0 document"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   120
      Top             =   540
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList imlImages 
      Left            =   720
      Top             =   600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   10
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":030A
            Key             =   "imgNouveau"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":041C
            Key             =   "imgOuvrir"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":052E
            Key             =   "imgEnregistrer"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":0640
            Key             =   "imgCouper"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":0752
            Key             =   "imgCopier"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":0864
            Key             =   "imgColler"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":0976
            Key             =   "imgRechercher"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":0A88
            Key             =   "imgRechercherSuivant2"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":0B9A
            Key             =   "imgRemplacer"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEditeur.frx":0CAC
            Key             =   "imgRechercherSuivant"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdNouveau 
         Caption         =   "&Nouveau"
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
      Begin VB.Menu cmdEnregistrerTout 
         Caption         =   "Enregistrer &tout"
      End
      Begin VB.Menu cmdFermer 
         Caption         =   "&Fermer"
      End
      Begin VB.Menu cmdFermerTout 
         Caption         =   "Fer&mer tout"
      End
      Begin VB.Menu sepFichier1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuEdition 
      Caption         =   "&Edition"
      Begin VB.Menu cmdAnnuler 
         Caption         =   "&Annuler"
         Shortcut        =   ^Z
      End
      Begin VB.Menu sepEdition1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCouper 
         Caption         =   "&Couper"
         Shortcut        =   ^X
      End
      Begin VB.Menu cmdCopier 
         Caption         =   "Co&pier"
         Shortcut        =   ^P
      End
      Begin VB.Menu cmdColler 
         Caption         =   "C&oller"
         Shortcut        =   ^V
      End
      Begin VB.Menu cmdSupprimer 
         Caption         =   "&Supprimer"
      End
      Begin VB.Menu sepEdition2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSélectionnerTout 
         Caption         =   "Sélectionner &tout"
         Shortcut        =   ^A
      End
   End
   Begin VB.Menu mnuRecherche 
      Caption         =   "&Recherche"
      Begin VB.Menu cmdRechercher 
         Caption         =   "&Rechercher…"
         Shortcut        =   ^F
      End
      Begin VB.Menu cmdRechercherSuivant 
         Caption         =   "Rechercher le &suivant"
         Shortcut        =   {F3}
      End
      Begin VB.Menu sepRechercher1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdRemplacer 
         Caption         =   "Re&mplacer…"
         Shortcut        =   ^H
      End
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "&Options"
      Begin VB.Menu cmdWrap 
         Caption         =   "&Retour à la ligne automatique"
      End
      Begin VB.Menu cmdGénérerBak 
         Caption         =   "&Générer fichier .bak"
         Checked         =   -1  'True
      End
      Begin VB.Menu cmdPolice 
         Caption         =   "&Police…"
      End
   End
   Begin VB.Menu mnuFenêtre 
      Caption         =   "Fe&nêtre"
      WindowList      =   -1  'True
      Begin VB.Menu cmdCascade 
         Caption         =   "&Cascade"
      End
      Begin VB.Menu cmdMosaïque 
         Caption         =   "&Mosaïque"
      End
      Begin VB.Menu cmdRéorganiser 
         Caption         =   "&Réorganiser les icônes"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de l'éditeur multiple…"
      End
   End
End
Attribute VB_Name = "mdiEditeur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Editeur multiple
' Editeur implantant le rechercher/remplacer sur plusieurs
' fichiers à la fois
' 25/01/1997 P.Violent
'  3/08/1999 PV OLE Drag'n'drop
'  1/09/2008 PV Compatibilité styles XP


Option Explicit

Const sNomApp As String = "Éditeur multiple"

Public iNbDoc As Integer

' Variables pour le rechercher/remplacer
Dim sCherché As String, sRemplacé As String
Dim iSelStart As Integer, iSelLength As Integer
Dim iPositionRecherche As Long
Dim iTypeRecherche As Integer
Const typSélection = 1
Const typFichierEncours = 2
Const typTousLeFichiers = 3
Dim bRechercheFin As Boolean        ' Recherche fichier: indique qu'on cherche après iSelStart (1ère partie)
Dim fFormeRecherche As frmDocument
Dim fFormeRechercheDépart As frmDocument

' To support XP style
Private Declare Function InitCommonControls Lib "Comctl32.dll" () As Long


Private Sub cmdAnnuler_Click()
  SendKeys "^Z"
End Sub

Private Sub cmdAPropos_Click()
  MsgBox sNomApp & " " & App.Major & "." & App.Minor & "." & App.Revision & vbCrLf & "Editeur implantant le rechercher/remplacer sur plusieurs fichiers à la fois" & vbCrLf & vbCrLf & "(c) P.VIOLENT 1997-2005"
End Sub

Private Sub cmdCascade_Click()
  mdiEditeur.Arrange vbCascade
End Sub

Private Sub cmdColler_Click()
  SendKeys "^V"
End Sub

Private Sub cmdCopier_Click()
  SendKeys "^C"
End Sub

Private Sub cmdCouper_Click()
  SendKeys "^X"
End Sub

Private Sub cmdEnregistrer_Click()
  If ActiveForm Is Nothing Then Exit Sub
  If TypeOf ActiveForm Is frmDocument Then
    Dim b As Boolean
    b = bDoEnregistrer(ActiveForm)
  End If
End Sub

Private Sub cmdEnregistrerTout_Click()
  Dim f As Form
  For Each f In Forms
    If TypeOf f Is frmDocument Then
      If Not bDoEnregistrer(f) Then Exit For
    End If
  Next
End Sub

Private Sub cmdFermer_Click()
  If ActiveForm Is Nothing Then Exit Sub
  If TypeOf ActiveForm Is frmDocument Then
    Unload ActiveForm
    MajNbDoc
  End If
End Sub

Private Sub cmdFermerTout_Click()
  Dim f As Form
  For Each f In Forms
    If TypeOf f Is frmDocument Then
      Dim f1 As Integer
      f1 = Forms.Count
      Unload f
      If Forms.Count = f1 Then Exit For ' Abandon !
    End If
  Next
  MajNbDoc
End Sub

Private Sub cmdGénérerBak_Click()
  cmdGénérerBak.Checked = Not cmdGénérerBak.Checked
End Sub

Private Sub cmdMosaïque_Click()
  mdiEditeur.Arrange vbTileHorizontal
End Sub

Private Sub cmdNouveau_Click()
  Dim f As New frmDocument
  Load f
  f.txtDocument.Visible = True

  iNbDoc = iNbDoc + 1
  f.Caption = "Document" & iNbDoc
  f.sFullPath = "Document" & iNbDoc
  f.bDirty = False
  f.bFichier = False
  MajNbDoc
End Sub

Private Sub cmdOuvrir_Click()
  CommonDialog.Flags = cdlOFNAllowMultiselect Or cdlOFNFileMustExist Or cdlOFNExplorer Or cdlOFNHideReadOnly
'  CommonDialog.InitDir = "d:\frontpage webs\content\microbsoft\secretariat"  'App.Path
  CommonDialog.FileName = ""
  CommonDialog.MaxFileSize = 32767
  CommonDialog.Filter = "Fichiers texte (*.txt)|*.txt|Tous les fichiers (*.*)|*.*"
  CommonDialog.ShowOpen
  
  Dim s As String, p As Integer
  s = CommonDialog.FileName
  If s = "" Then Exit Sub
  
  p = InStr(s, Chr(0))
  If p = 0 Then
    DoOpen s
    MajNbDoc
  Else
    Dim sPath As String
    sPath = Left(s, p - 1) & "\"
    s = Mid(s, p + 1)
    Do
      p = InStr(s, Chr(0))
      If p = 0 Then p = Len(s) + 1
      DoOpen sPath & Left(s, p - 1)
      MajNbDoc
      If p = Len(s) + 1 Then Exit Do
      s = Mid(s, p + 1)
    Loop
  End If
  
  sbStatusBar.Panels(1).Text = "Prêt"
End Sub

Private Sub cmdPolice_Click()
  CommonDialog.Flags = cdlCFBoth
  CommonDialog.ShowFont
  'Text1.Font.Name = CommonDialog.FontName
  'Text1.Font.Size = CommonDialog.FontSize
  'Text1.Font.Bold = CommonDialog.FontBold
End Sub

Private Sub cmdQuitter_Click()
  Unload Me
End Sub

Private Sub Form_Resize()
  Dim t As Control
  For Each t In Controls
    If TypeOf t Is TextBox Then
      t.Move 0, 0, ScaleWidth, ScaleHeight
    End If
  Next
End Sub

Private Sub cmdRechercher_Click()
  If ActiveForm Is Nothing Then Exit Sub
  frmRecherche.optTexteSélectionné.Enabled = ActiveForm.txtDocument.SelLength <> 0
  If frmRecherche.optTexteSélectionné And Not frmRecherche.optTexteSélectionné.Enabled Then
    frmRecherche.optFichierEnCours = True
  End If
  frmRecherche.Rechercher
End Sub

Private Sub cmdRechercherSuivant_Click()
  If Not bDoRechercheSuivant Then MsgBox "Non trouvé !"
End Sub

Private Sub cmdRemplacer_Click()
  If ActiveForm Is Nothing Then Exit Sub
  frmRecherche.optTexteSélectionné.Enabled = ActiveForm.txtDocument.SelLength <> 0
  If frmRecherche.optTexteSélectionné And Not frmRecherche.optTexteSélectionné.Enabled Then
    frmRecherche.optFichierEnCours = True
  End If
  frmRecherche.Remplacer
End Sub

Private Sub cmdRéorganiser_Click()
  mdiEditeur.Arrange vbArrangeIcons
End Sub

Private Sub cmdSélectionnerTout_Click()
  If ActiveForm Is Nothing Then Exit Sub
  ActiveForm.txtDocument.SelStart = 0
  ActiveForm.txtDocument.SelLength = 32767
End Sub

Private Sub cmdSupprimer_Click()
  SendKeys "{del}"
End Sub

Private Sub cmdWrap_Click()
  cmdWrap.Checked = Not cmdWrap.Checked
  If ActiveForm Is Nothing Then Exit Sub
  
  Dim f As Form, s As String
  For Each f In Forms
    If TypeOf f Is frmDocument Then f.ChangeType
  Next
End Sub

Private Sub MDIForm_Initialize()
    InitCommonControls          ' Support XP Style
End Sub

Private Sub MDIForm_Load()
  sbStatusBar.Panels(1).Text = "Prêt"
  MajNbDoc
  
'  cmdNouveau_Click
'  ActiveForm.txtDocument = "Il était un petit navire"
'  ActiveForm.txtDocument.SelStart = 99
End Sub

Private Sub MDIForm_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Data.GetFormat(vbCFFiles) Then
    Dim s As Variant
    For Each s In Data.Files
      DoOpen CStr(s)
    Next
  End If
End Sub

Private Sub MDIForm_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  If State = vbOver Then
    If Data.GetFormat(vbCFFiles) Then
      Effect = vbDropEffectCopy
    Else
      Effect = vbDropEffectNone
    End If
  End If
End Sub


Private Sub MDIForm_Unload(Cancel As Integer)
  Dim f As Form
  For Each f In Forms
    If Not f Is Me Then Unload f
  Next
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As Button)
  Select Case Button.Key
    Case "btnNouveau": cmdNouveau_Click
    Case "btnOuvrir":  cmdOuvrir_Click
    Case "btnEnregistrer": cmdEnregistrer_Click
    Case "btnCouper": cmdCouper_Click
    Case "btnCopier": cmdCopier_Click
    Case "btnColler": cmdColler_Click
    Case "btnRechercher": cmdRechercher_Click
    Case "btnRechercherSuivant": cmdRechercherSuivant_Click
    Case "btnRemplacer": cmdRemplacer_Click
  End Select
End Sub

Sub DoOpen(sNomFic As String)
  Dim f0 As Form
  For Each f0 In Forms
    If TypeOf f0 Is frmDocument Then
      If UCase(sNomFic) = UCase(f0.sFullPath) Then
        f0.SetFocus
        MsgBox "Attention - Le fichier '" & sNomFic & "' est déjà chargé !", vbExclamation
        Exit Sub
      End If
    End If
  Next
  
  Dim l As Long
  l = FileLen(sNomFic)
  If l > 65000 Then
    MsgBox "Attention - Le fichier '" & sNomFic & "' est trop grand (" & l & " octets)." & vbCrLf & "L'éditeur multiple ne sait pas traiter les fichiers de plus de 65000 caractères !", vbExclamation
    Exit Sub
  End If
  
  Dim sBase As String
  sBase = sFilePart(sNomFic)
  
  sbStatusBar.Panels(1).Text = "Ouverture de " & sBase
  sbStatusBar.Refresh
  
  Open sNomFic For Binary As #1
  Dim sContenu As String
  sContenu = Input(l, #1)
  Close #1
  
  If Len(sContenu) <> l Then
    MsgBox "Attention - Le fichier '" & sNomFic & "' contient des données binaires." & vbCrLf & "L'éditeur multiple ne sait traiter que les fichiers texte !", vbExclamation
    Exit Sub
  End If
  
  Dim f As New frmDocument
  Load f
  f.txtDocument = sContenu
  f.txtDocument.Visible = True
  f.sFullPath = sNomFic
  f.Caption = sBase
  f.bDirty = False
  f.bFichier = True

  iNbDoc = iNbDoc + 1
End Sub

' Retour faux en cas d'abandon
Function bDoEnregistrer(f As frmDocument) As Boolean

  If Not f.bFichier Then
    CommonDialog.Filter = "Fichiers texte (*.txt)|*.txt|Tous les fichiers (*.*)|*.*"
    CommonDialog.FileName = f.sFullPath
    CommonDialog.Flags = cdlOFNExplorer Or cdlOFNHideReadOnly Or cdlOFNOverwritePrompt Or cdlOFNPathMustExist
    CommonDialog.ShowSave
    If CommonDialog.FileName = "" Then bDoEnregistrer = False: Exit Function

    f.sFullPath = CommonDialog.FileName
    f.bFichier = True
  End If
  
  If cmdGénérerBak.Checked Then
    On Error Resume Next
    Kill f.sFullPath & ".bak"
    Name f.sFullPath As f.sFullPath & ".bak"
    On Error GoTo 0
  End If
  
  Open f.sFullPath For Output As #1
  Print #1, f.txtDocument;
  Close #1
  
  f.Caption = sFilePart(f.sFullPath)
  f.bDirty = False

  bDoEnregistrer = True
End Function

Sub MajNbDoc()
  Dim sNb As String
  If iNbDoc = 0 Then
    sNb = "Aucun document"
  ElseIf iNbDoc = 1 Then
    sNb = "1 document"
  Else
    sNb = iNbDoc & " documents"
  End If
  sbStatusBar.Panels(2).Text = sNb
End Sub

Function sFilePart(ByVal sFullPath As String) As String
  Dim p As Integer, lp As Integer
  p = 0
  Do
    lp = p
    p = InStr(lp + 1, sFullPath, "\")
  Loop Until p = 0
  sFilePart = Mid(sFullPath, lp + 1)
End Function

Private Sub InitRecherche()
  If frmRecherche.optTexteSélectionné Then
    iTypeRecherche = typSélection
  ElseIf frmRecherche.optFichierEnCours Then
    iTypeRecherche = typFichierEncours
  Else
    iTypeRecherche = typTousLeFichiers
  End If
  
  sCherché = frmRecherche.cboRechercher
  iSelStart = ActiveForm.txtDocument.SelStart
  iSelLength = ActiveForm.txtDocument.SelLength
  iPositionRecherche = iSelStart
  bRechercheFin = True
  Set fFormeRecherche = ActiveForm
  Set fFormeRechercheDépart = ActiveForm

End Sub

Sub DoRechercher()
  InitRecherche
  cmdRechercherSuivant_Click
End Sub


Function bDoRechercheSuivant() As Boolean
  Dim t As TextBox
  Dim p As Long, i As Integer
  
  If fFormeRecherche Is Nothing Then Exit Function      ' No current search
  
  bDoRechercheSuivant = True
  
recommence:   ' Pour la recherche multi-fichiers
  Set t = fFormeRecherche.txtDocument
  
  Select Case iTypeRecherche
    Case typSélection:
      p = InStr(iPositionRecherche + 1, IIf(frmRecherche.chkRespecterCasse, t.Text, UCase(t.Text)), IIf(frmRecherche.chkRespecterCasse, sCherché, UCase(sCherché)))
      If p = 0 Or p - 1 + Len(sCherché) > iSelStart + iSelLength Then
        iPositionRecherche = iSelStart
        bDoRechercheSuivant = False
      Else
        t.SelStart = p - 1
        t.SelLength = Len(sCherché)
        iPositionRecherche = p    ' -1+1
      End If
      
    Case typFichierEncours, typTousLeFichiers:
      If bRechercheFin Then
        p = InStr(iPositionRecherche + 1, IIf(frmRecherche.chkRespecterCasse, t.Text, UCase(t.Text)), IIf(frmRecherche.chkRespecterCasse, sCherché, UCase(sCherché)))
        If p > 0 Then
          t.SelStart = p - 1
          t.SelLength = Len(sCherché)
          iPositionRecherche = p    ' -1+1
          If Not fFormeRecherche Is ActiveForm Then fFormeRecherche.SetFocus
          Exit Function
        End If
        bRechercheFin = False
        iPositionRecherche = 0
      End If
      
      p = InStr(iPositionRecherche + 1, IIf(frmRecherche.chkRespecterCasse, t.Text, UCase(t.Text)), IIf(frmRecherche.chkRespecterCasse, sCherché, UCase(sCherché)))
      If p > 0 And p - 1 < iSelStart Then
        t.SelStart = p - 1
        t.SelLength = Len(sCherché)
        iPositionRecherche = p    ' -1+1
        If Not fFormeRecherche Is ActiveForm Then fFormeRecherche.SetFocus
        Exit Function
      End If
      
      ' Pas trouvé dans le fichier courant !
      If iTypeRecherche = typFichierEncours Then
        iPositionRecherche = iSelStart
        bRechercheFin = True
        bDoRechercheSuivant = False
        Exit Function
      End If
      
      ' Recherche dans tous les fichiers: on passe au suivant
      ' On cherche l'indice du document courant
      Dim iForm As Integer
      For iForm = 0 To Forms.Count - 1
        If Forms(iForm) Is fFormeRecherche Then Exit For
      Next
      ' Puis le suivant
      For i = 1 To Forms.Count
        iForm = (iForm + 1) Mod Forms.Count
        If TypeOf Forms(iForm) Is frmDocument Then Exit For
      Next
      
      ' Si on retrouve la feuille de départ c'est qu'on a fini le tour
      If Forms(iForm) Is fFormeRechercheDépart Then
        bDoRechercheSuivant = False
        Set fFormeRecherche = fFormeRechercheDépart
        bRechercheFin = False
        iPositionRecherche = 0
        iSelStart = 32767
        Exit Function
      End If
        
      Set fFormeRecherche = Forms(iForm)
      ' On recherche uniquement à partir du début
      bRechercheFin = False
      iPositionRecherche = 0
      iSelStart = 32767
      GoTo recommence
          
  End Select
End Function


Sub DoRemplacer(bTout As Boolean)
  Dim iNbRemplacements As Integer
  Dim b As Boolean
  
  InitRecherche
  sRemplacé = frmRecherche.cboRemplacer
  
  Do
    b = bDoRechercheSuivant()
    If Not b Then
      If iNbRemplacements = 0 Then
        MsgBox "Non trouvé !"
      Else
        MsgBox iNbRemplacements & " remplacement(s)."
      End If
      Exit Sub
    End If
    
    ' Remplacement
    fFormeRecherche.txtDocument.SelText = sRemplacé
    
    ' Sécurité pour éviter une bouche récursive
    iPositionRecherche = iPositionRecherche + Len(sRemplacé)
    
    iNbRemplacements = iNbRemplacements + 1
    If iNbRemplacements = 1 And Not bTout Then Exit Do
  Loop
End Sub
