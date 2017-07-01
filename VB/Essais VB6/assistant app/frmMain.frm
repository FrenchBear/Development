VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "Projet1"
   ClientHeight    =   2910
   ClientLeft      =   165
   ClientTop       =   1020
   ClientWidth     =   4680
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.Toolbar tbToolBar 
      Align           =   1  'Align Top
      Height          =   1080
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   1905
      ButtonWidth     =   609
      Appearance      =   1
      ImageList       =   "imlToolbarIcons"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   17
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Nouveau"
            Object.ToolTipText     =   "Nouveau"
            ImageKey        =   "New"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Ouvrir"
            Object.ToolTipText     =   "Ouvrir"
            ImageKey        =   "Open"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Enregistrer"
            Object.ToolTipText     =   "Enregistrer"
            ImageKey        =   "Save"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Imprimer"
            Object.ToolTipText     =   "Imprimer"
            ImageKey        =   "Print"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Couper"
            Object.ToolTipText     =   "Couper"
            ImageKey        =   "Cut"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copier"
            Object.ToolTipText     =   "Copier"
            ImageKey        =   "Copy"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Coller"
            Object.ToolTipText     =   "Coller"
            ImageKey        =   "Paste"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Gras"
            Object.ToolTipText     =   "Gras"
            ImageKey        =   "Bold"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Italique"
            Object.ToolTipText     =   "Italique"
            ImageKey        =   "Italic"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Souligné"
            Object.ToolTipText     =   "Souligné"
            ImageKey        =   "Underline"
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Aligner à gauche"
            Object.ToolTipText     =   "Aligner à gauche"
            ImageKey        =   "Align Left"
            Style           =   2
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Centrer"
            Object.ToolTipText     =   "Centrer"
            ImageKey        =   "Center"
            Style           =   2
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Aligner à droite"
            Object.ToolTipText     =   "Aligner à droite"
            ImageKey        =   "Align Right"
            Style           =   2
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatusBar 
      Align           =   2  'Align Bottom
      Height          =   270
      Left            =   0
      TabIndex        =   0
      Top             =   2640
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   476
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   2619
            Text            =   "État"
            TextSave        =   "État"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            AutoSize        =   2
            TextSave        =   "26/03/99"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            AutoSize        =   2
            TextSave        =   "00:28"
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog dlgCommonDialog 
      Left            =   1740
      Top             =   1215
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Left            =   1740
      Top             =   1215
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   13
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0000
            Key             =   "New"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0112
            Key             =   "Open"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0224
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0336
            Key             =   "Print"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0448
            Key             =   "Cut"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":055A
            Key             =   "Copy"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":066C
            Key             =   "Paste"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":077E
            Key             =   "Bold"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0890
            Key             =   "Italic"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":09A2
            Key             =   "Underline"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0AB4
            Key             =   "Align Left"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0BC6
            Key             =   "Center"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0CD8
            Key             =   "Align Right"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&Fichier"
      Begin VB.Menu mnuFileNew 
         Caption         =   "&Nouveau"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuFileOpen 
         Caption         =   "&Ouvrir"
         Shortcut        =   ^O
      End
      Begin VB.Menu mnuFileClose 
         Caption         =   "&Fermer"
      End
      Begin VB.Menu mnuFileBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileSave 
         Caption         =   "&Enregistrer"
      End
      Begin VB.Menu mnuFileSaveAs 
         Caption         =   "Enregistrer &sous..."
      End
      Begin VB.Menu mnuFileSaveAll 
         Caption         =   "Enregistrer &tout"
      End
      Begin VB.Menu mnuFileBar1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileProperties 
         Caption         =   "&Propriétés"
      End
      Begin VB.Menu mnuFileBar2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFilePageSetup 
         Caption         =   "&Mise en page..."
      End
      Begin VB.Menu mnuFilePrintPreview 
         Caption         =   "&Aperçu avant impression"
      End
      Begin VB.Menu mnuFilePrint 
         Caption         =   "&Imprimer..."
      End
      Begin VB.Menu mnuFileBar3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileSend 
         Caption         =   "En&voyer..."
      End
      Begin VB.Menu mnuFileBar4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileMRU 
         Caption         =   ""
         Index           =   1
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileMRU 
         Caption         =   ""
         Index           =   2
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileMRU 
         Caption         =   ""
         Index           =   3
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileBar5 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edition"
      Begin VB.Menu mnuEditUndo 
         Caption         =   "&Annuler"
      End
      Begin VB.Menu mnuEditBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditCut 
         Caption         =   "&Couper"
         Shortcut        =   ^X
      End
      Begin VB.Menu mnuEditCopy 
         Caption         =   "C&opier"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuEditPaste 
         Caption         =   "Co&ller"
         Shortcut        =   ^V
      End
      Begin VB.Menu mnuEditPasteSpecial 
         Caption         =   "Colla&ge spécial..."
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "Affic&hage"
      Begin VB.Menu mnuViewToolbar 
         Caption         =   "&Barre d'outils"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuViewStatusBar 
         Caption         =   "B&arre d'état"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuViewBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuViewRefresh 
         Caption         =   "Actualise&r"
      End
      Begin VB.Menu mnuViewOptions 
         Caption         =   "&Options..."
      End
      Begin VB.Menu mnuViewWebBrowser 
         Caption         =   "Navigateur &Web"
      End
   End
   Begin VB.Menu mnuData 
      Caption         =   "&Données"
      Begin VB.Menu mnuDatafrmessais 
         Caption         =   "frmessais"
      End
   End
   Begin VB.Menu mnuTools 
      Caption         =   "&Outils"
      Begin VB.Menu mnuToolsOptions 
         Caption         =   "&Options..."
      End
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "Fe&nêtre"
      WindowList      =   -1  'True
      Begin VB.Menu mnuWindowNewWindow 
         Caption         =   "&Nouvelle fenêtre"
      End
      Begin VB.Menu mnuWindowBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWindowCascade 
         Caption         =   "&En cascade"
      End
      Begin VB.Menu mnuWindowTileHorizontal 
         Caption         =   "Mosaïque &horizontale"
      End
      Begin VB.Menu mnuWindowTileVertical 
         Caption         =   "Mosaïque &verticale"
      End
      Begin VB.Menu mnuWindowArrangeIcons 
         Caption         =   "&Réorganiser les icônes"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&?"
      Begin VB.Menu mnuHelpContents 
         Caption         =   "&Sommaire"
      End
      Begin VB.Menu mnuHelpSearchForHelpOn 
         Caption         =   "A&ide sur..."
      End
      Begin VB.Menu mnuHelpBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "À &propos de "
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Any) As Long
Const EM_UNDO = &HC7
Private Declare Function OSWinHelp% Lib "user32" Alias "WinHelpA" (ByVal hwnd&, ByVal HelpFile$, ByVal wCommand%, dwData As Any)

Private Sub MDIForm_Load()
  Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
  Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
  Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
  Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)
  LoadNewDoc
End Sub

Private Sub LoadNewDoc()
  Static lDocumentCount As Long
  Dim frmD As frmDocument
  lDocumentCount = lDocumentCount + 1
  Set frmD = New frmDocument
  frmD.Caption = "Document " & lDocumentCount
  frmD.Show
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
  If Me.WindowState <> vbMinimized Then
    SaveSetting App.Title, "Settings", "MainLeft", Me.Left
    SaveSetting App.Title, "Settings", "MainTop", Me.Top
    SaveSetting App.Title, "Settings", "MainWidth", Me.Width
    SaveSetting App.Title, "Settings", "MainHeight", Me.Height
  End If
End Sub

Private Sub mnuDatafrmessais_Click()
  Dim f As New frmessais
  f.Show
End Sub

Private Sub tbToolBar_ButtonClick(ByVal Button As MSComCtlLib.Button)
  On Error Resume Next
  Select Case Button.Key
    Case "Nouveau"
      LoadNewDoc
    Case "Ouvrir"
      mnuFileOpen_Click
    Case "Enregistrer"
      mnuFileSave_Click
    Case "Imprimer"
      mnuFilePrint_Click
    Case "Couper"
      mnuEditCut_Click
    Case "Copier"
      mnuEditCopy_Click
    Case "Coller"
      mnuEditPaste_Click
    Case "Gras"
      ActiveForm.rtfText.SelBold = Not ActiveForm.rtfText.SelBold
      Button.Value = IIf(ActiveForm.rtfText.SelBold, tbrPressed, tbrUnpressed)
    Case "Italique"
      ActiveForm.rtfText.SelItalic = Not ActiveForm.rtfText.SelItalic
      Button.Value = IIf(ActiveForm.rtfText.SelItalic, tbrPressed, tbrUnpressed)
    Case "Souligné"
      ActiveForm.rtfText.SelUnderline = Not ActiveForm.rtfText.SelUnderline
      Button.Value = IIf(ActiveForm.rtfText.SelUnderline, tbrPressed, tbrUnpressed)
    Case "Aligner à gauche"
      ActiveForm.rtfText.SelAlignment = rtfLeft
    Case "Centrer"
      ActiveForm.rtfText.SelAlignment = rtfCenter
    Case "Aligner à droite"
      ActiveForm.rtfText.SelAlignment = rtfRight
  End Select
End Sub

Private Sub mnuHelpAbout_Click()
  MsgBox "Version " & App.Major & "." & App.Minor & "." & App.Revision
End Sub

Private Sub mnuHelpSearchForHelpOn_Click()
  Dim nRet As Integer

  'S'il n'y a pas de fichier d'aide pour le projet, afficher un message à l'utilisateur
  'afin de définir le fichier d'aide de votre application dans le
  'dialogue des propriétés du projet
  If Len(App.HelpFile) = 0 Then
    MsgBox "Impossible d'afficher le sommaire de l'Aide. Aucune Aide n'est associée à ce projet.", vbInformation, Me.Caption
  Else
    On Error Resume Next
    nRet = OSWinHelp(Me.hwnd, App.HelpFile, 261, 0)
    If Err Then
      MsgBox Err.Description
    End If
  End If

End Sub

Private Sub mnuHelpContents_Click()
  Dim nRet As Integer

  'S'il n'y a pas de fichier d'aide pour le projet, afficher un message à l'utilisateur
  'afin de définir le fichier d'aide de votre application dans le
  'dialogue des propriétés du projet
  If Len(App.HelpFile) = 0 Then
    MsgBox "Impossible d'afficher le sommaire de l'Aide. Aucune Aide n'est associée à ce projet.", vbInformation, Me.Caption
  Else
    On Error Resume Next
    nRet = OSWinHelp(Me.hwnd, App.HelpFile, 3, 0)
    If Err Then
      MsgBox Err.Description
    End If
  End If

End Sub


Private Sub mnuWindowArrangeIcons_Click()
  Me.Arrange vbArrangeIcons
End Sub

Private Sub mnuWindowTileVertical_Click()
  Me.Arrange vbTileVertical
End Sub

Private Sub mnuWindowTileHorizontal_Click()
  Me.Arrange vbTileHorizontal
End Sub

Private Sub mnuWindowCascade_Click()
  Me.Arrange vbCascade
End Sub

Private Sub mnuWindowNewWindow_Click()
  LoadNewDoc
End Sub

Private Sub mnuToolsOptions_Click()
  'À faire: Ajouter le code de 'mnuToolsOptions_Click'.
  MsgBox "Ajouter le code de 'mnuToolsOptions_Click'."
End Sub

Private Sub mnuViewWebBrowser_Click()
  'À faire: Ajouter le code de 'mnuViewWebBrowser_Click'.
  MsgBox "Ajouter le code de 'mnuViewWebBrowser_Click'."
End Sub

Private Sub mnuViewOptions_Click()
  'À faire: Ajouter le code de 'mnuViewOptions_Click'.
  MsgBox "Ajouter le code de 'mnuViewOptions_Click'."
End Sub

Private Sub mnuViewRefresh_Click()
  'À faire: Ajouter le code de 'mnuViewRefresh_Click'.
  MsgBox "Ajouter le code de 'mnuViewRefresh_Click'."
End Sub

Private Sub mnuViewStatusBar_Click()
  mnuViewStatusBar.Checked = Not mnuViewStatusBar.Checked
  sbStatusBar.Visible = mnuViewStatusBar.Checked
End Sub

Private Sub mnuViewToolbar_Click()
  mnuViewToolbar.Checked = Not mnuViewToolbar.Checked
  tbToolBar.Visible = mnuViewToolbar.Checked
End Sub

Private Sub mnuEditPasteSpecial_Click()
  'À faire: Ajouter le code de 'mnuEditPasteSpecial_Click'.
  MsgBox "Ajouter le code de 'mnuEditPasteSpecial_Click'."
End Sub

Private Sub mnuEditPaste_Click()
  On Error Resume Next
  ActiveForm.rtfText.SelRTF = Clipboard.GetText

End Sub

Private Sub mnuEditCopy_Click()
  On Error Resume Next
  Clipboard.SetText ActiveForm.rtfText.SelRTF

End Sub

Private Sub mnuEditCut_Click()
  On Error Resume Next
  Clipboard.SetText ActiveForm.rtfText.SelRTF
  ActiveForm.rtfText.SelText = vbNullString

End Sub

Private Sub mnuEditUndo_Click()
  'À faire: Ajouter le code de 'mnuEditUndo_Click'.
  MsgBox "Ajouter le code de 'mnuEditUndo_Click'."
End Sub


Private Sub mnuFileExit_Click()
  'décharge la feuille
  Unload Me

End Sub

Private Sub mnuFileSend_Click()
  'À faire: Ajouter le code de 'mnuFileSend_Click'.
  MsgBox "Ajouter le code de 'mnuFileSend_Click'."
End Sub

Private Sub mnuFilePrint_Click()
  On Error Resume Next
  If ActiveForm Is Nothing Then Exit Sub
  
  With dlgCommonDialog
    .DialogTitle = "Imprimer"
    .CancelError = True
    .Flags = cdlPDReturnDC + cdlPDNoPageNums
    If ActiveForm.rtfText.SelLength = 0 Then
      .Flags = .Flags + cdlPDAllPages
    Else
      .Flags = .Flags + cdlPDSelection
    End If
    .ShowPrinter
    If Err <> MSComDlg.cdlCancel Then
      ActiveForm.rtfText.SelPrint .hDC
    End If
  End With

End Sub

Private Sub mnuFilePrintPreview_Click()
  'À faire: Ajouter le code de 'mnuFilePrintPreview_Click'.
  MsgBox "Ajouter le code de 'mnuFilePrintPreview_Click'."
End Sub

Private Sub mnuFilePageSetup_Click()
  On Error Resume Next
  With dlgCommonDialog
    .DialogTitle = "Mise en page"
    .CancelError = True
    .ShowPrinter
  End With

End Sub

Private Sub mnuFileProperties_Click()
  'À faire: Ajouter le code de 'mnuFileProperties_Click'.
  MsgBox "Ajouter le code de 'mnuFileProperties_Click'."
End Sub

Private Sub mnuFileSaveAll_Click()
  'À faire: Ajouter le code de 'mnuFileSaveAll_Click'.
  MsgBox "Ajouter le code de 'mnuFileSaveAll_Click'."
End Sub

Private Sub mnuFileSaveAs_Click()
  Dim sFile As String
  
  If ActiveForm Is Nothing Then Exit Sub
  
  With dlgCommonDialog
    .DialogTitle = "Enregistrer sous"
    .CancelError = False
    'À faire : Définir les indicateurs et les attributs du contrôle des dialogues communs
    .Filter = "Tous les fichiers (*.*)|*.*"
    .ShowSave
    If Len(.FileName) = 0 Then
      Exit Sub
    End If
    sFile = .FileName
  End With
  ActiveForm.Caption = sFile
  ActiveForm.rtfText.SaveFile sFile

End Sub

Private Sub mnuFileSave_Click()
  Dim sFile As String
  If Left$(ActiveForm.Caption, 8) = "Document" Then
    With dlgCommonDialog
      .DialogTitle = "Enregistrer"
      .CancelError = False
      'À faire : Définir les indicateurs et les attributs du contrôle des dialogues communs
      .Filter = "Tous les fichiers (*.*)|*.*"
      .ShowSave
      If Len(.FileName) = 0 Then
        Exit Sub
      End If
      sFile = .FileName
    End With
    ActiveForm.rtfText.SaveFile sFile
  Else
    sFile = ActiveForm.Caption
    ActiveForm.rtfText.SaveFile sFile
  End If

End Sub

Private Sub mnuFileClose_Click()
  'À faire: Ajouter le code de 'mnuFileClose_Click'.
  MsgBox "Ajouter le code de 'mnuFileClose_Click'."
End Sub

Private Sub mnuFileOpen_Click()
  Dim sFile As String

  If ActiveForm Is Nothing Then LoadNewDoc
  
  With dlgCommonDialog
    .DialogTitle = "Ouvrir"
    .CancelError = False
    'À faire : Définir les indicateurs et les attributs du contrôle des dialogues communs
    .Filter = "Tous les fichiers (*.*)|*.*"
    .ShowOpen
    If Len(.FileName) = 0 Then
      Exit Sub
    End If
    sFile = .FileName
  End With
  ActiveForm.rtfText.LoadFile sFile
  ActiveForm.Caption = sFile

End Sub


Private Sub mnuFileNew_Click()
  LoadNewDoc
End Sub

