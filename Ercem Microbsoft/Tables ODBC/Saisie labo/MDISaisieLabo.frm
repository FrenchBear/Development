VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MDISaisieLabo 
   BackColor       =   &H8000000C&
   Caption         =   "Saisie labo: Événements - Lots de milieux - Anomalies"
   ClientHeight    =   7515
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9495
   Icon            =   "MDISaisieLabo.frx":0000
   LinkTopic       =   "MDIForm1"
   WindowState     =   2  'Maximized
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   390
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9495
      _ExtentX        =   16748
      _ExtentY        =   688
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Wrappable       =   0   'False
      ImageList       =   "ilAdmin"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Anomalie"
            Object.ToolTipText     =   "Gestion des anomalies"
            Object.Tag             =   "Ano"
            ImageKey        =   "imgAnomalie"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Lot"
            Object.ToolTipText     =   "Préparation des milieux"
            Object.Tag             =   "Lot"
            ImageKey        =   "imgGélose"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Evt"
            Object.ToolTipText     =   "Saisie des événements par série"
            Object.Tag             =   "Evt"
            ImageKey        =   "imgEvénement"
            Style           =   5
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SEvt"
            Object.ToolTipText     =   "Saisie des événements par supersérie"
            Object.Tag             =   "SEvt"
            ImageKey        =   "imgSuperEvénement"
            Style           =   5
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SuperSérie"
            Object.ToolTipText     =   "Séries du jour"
            Object.Tag             =   "SSér"
            ImageKey        =   "imgSuperSérie"
         EndProperty
      EndProperty
   End
   Begin VB.Timer timMédor 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   8460
      Top             =   1740
   End
   Begin MSComctlLib.ImageList ilAdmin 
      Left            =   8460
      Top             =   780
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   29
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":0442
            Key             =   "imgIExplorer"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":075C
            Key             =   "imgEvénementLabo"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":0A76
            Key             =   "imgAnomalie"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":0D90
            Key             =   "imgGélose"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":10AA
            Key             =   "imgMilieu"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":13C4
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":16DE
            Key             =   "imgMéthode"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":19F8
            Key             =   "imgGerme16"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":1D12
            Key             =   "imgMétaméthode"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":202C
            Key             =   "imgEvénement"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":2346
            Key             =   "H1"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":2660
            Key             =   "H2"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":297A
            Key             =   "H'2"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":2C94
            Key             =   "DataSource"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":31E6
            Key             =   "DataSource2"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":3538
            Key             =   "imgTraitementAnomalie"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":3852
            Key             =   "imgRépartitionMilieu"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":3B6C
            Key             =   "H4"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":3E86
            Key             =   "H3"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":4060
            Key             =   "H'3"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":423A
            Key             =   "imgSuperSérie"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":4414
            Key             =   "imgNégatif"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":472E
            Key             =   "SH3"
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":4908
            Key             =   "SH'3"
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":4AE2
            Key             =   "SH4"
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":4CBC
            Key             =   "imgDébutRM"
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":4E96
            Key             =   "imgFinRM"
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":5070
            Key             =   "SH5"
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":51CC
            Key             =   "imgSuperEvénement"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   1
      Top             =   7200
      Width           =   9495
      _ExtentX        =   16748
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   8255
            Picture         =   "MDISaisieLabo.frx":5328
            Key             =   "Message"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
            Picture         =   "MDISaisieLabo.frx":577A
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connecté"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDISaisieLabo.frx":5CCC
            Key             =   "DataSource"
            Object.ToolTipText     =   "Source de données"
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
   Begin VB.Menu mnuAnomalie 
      Caption         =   "S&aisie labo"
      Begin VB.Menu cmdAnomalies 
         Caption         =   "Saisie &anomalies…"
      End
      Begin VB.Menu cmdSaisieLot 
         Caption         =   "Saisie &milieux…"
      End
      Begin VB.Menu cmdConstitutionSS 
         Caption         =   "Séries du &jour…"
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConfiguration 
         Caption         =   "&Source de données…"
      End
      Begin VB.Menu cmdUtilisateur 
         Caption         =   "&Utilisateur…"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options…"
      End
      Begin VB.Menu sep1b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuEvénement 
      Caption         =   "&Evénement"
      Begin VB.Menu cmdEvénement 
         Caption         =   "Evénement"
         Index           =   0
      End
   End
   Begin VB.Menu mnuSuperEvénement 
      Caption         =   "&SuperEvénement"
      Begin VB.Menu cmdSuperEvénement 
         Caption         =   "SuperEvénement"
         Index           =   0
      End
   End
   Begin VB.Menu mnuEdition 
      Caption         =   "E&dition"
      Begin VB.Menu cmdCopFrm 
         Caption         =   "&Copier Formulaire"
         Shortcut        =   ^{F5}
      End
      Begin VB.Menu sepEdition 
         Caption         =   "-"
      End
      Begin VB.Menu cmdColChp 
         Caption         =   "Coller c&hamp"
         Shortcut        =   {F5}
      End
      Begin VB.Menu cmdColFrm 
         Caption         =   "Coller &formulaire"
         Shortcut        =   +{F5}
      End
   End
   Begin VB.Menu mnuFenêtre 
      Caption         =   "Fe&nêtre"
      WindowList      =   -1  'True
      Begin VB.Menu cmdWeb 
         Caption         =   "&Web"
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
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
      Caption         =   "&?"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A Propos de…"
      End
   End
   Begin VB.Menu mnuBarreBoutons 
      Caption         =   "(PopUp BdB)"
      Visible         =   0   'False
      Begin VB.Menu cmdBdBEtiquettes 
         Caption         =   "&Etiquettes texte"
      End
   End
End
Attribute VB_Name = "MDISaisieLabo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDISaisieLabo
' Feuille MDI principale de la saisie des FSE
' 12/02/1998 PV
'  4/08/1998 PV NoPreviousInstance
' 15/08/1998 PV VBLibODBC, frmMsgBoxTimer
'  2/09/1998 PV Enregistrement n°SS avec H2; fin du bouton Web
'  5/09/1998 PV Nom de la source dans le message d'erreur en cas d'échec à la connexion
' 14/04/1999 PV 1.3 Nouvelle gestion générique des événements
'  7/07/1999 PV sSourceODBCDéfaut
' 24/11/2000 PV set lock mode to wait
' 20/11/2001 PC ajout utilisateur dans barre d'état
' 22/11/2001 PC option ligne de commande -c:NomCtrl=ValCtr pour initialiser un contrôle à l'ouverture de l'appli
'                                        -f:NomForm        pour ouvrir un sous formulaire à l'ouverture de l'appli
' 26/11/2001 PC Traitmt F5 (coller chp), Ctrl+F5 (copier form), Maj+F5 (coller form)

Option Explicit
' variables utilisées dans le traitement de la ligne de commande
Public bOptFrm As Boolean           ' vrai si option formulaire
Public bOptCtl As Boolean           ' vrai si option controle
Public sNomFrm As String            ' nom du formulaire en option
Public sNomCtrl As String           ' nom d'un contrôle à activer au chargement de l'appli
Public vValCtrl As Variant          ' valeur d'un controle
' utilisé dans les traitement de la touche F5
Public colCtrlFrm As New Collection ' collection des contrôles d'un formulaire

Const giCopFrm As Integer = 0 ' copier formulaire
Const giColFrm As Integer = 1 ' coller formulaire
Const giColChp As Integer = 2 ' coller champ

Private Sub ChargementInitial(bDemandeSource As Boolean)
' PC 20/11/2001 : traitement par ChargementInitialCommun

'  Dim bConnexionInitiale As Boolean
'
'  If sbStatus.Panels("DataSource") = "" Then
'    sbStatus.Panels("DataSource") = "En cours…"
'    bConnexionInitiale = True
'  End If
'
'  SetStatus "Ouverture de la base de données, patientez…"
'  Screen.MousePointer = vbHourglass
'  On Error Resume Next
'
'  Dim sSource As String
'  sSource = frmBDODBCLogon.GetSourceODBCDéfaut
'  BDInit IIf(bDemandeSource, "?", sSource)
'  If Err Then
'    MsgBox "Échec lors de la connexion à la base de données (source: " & sSource & ")." & vbCrLf & vbCrLf & "Erreur " & Err.Number & ": " & Err.Source & ": " & sAjusteMessageODBC(Err.Description), vbExclamation, App.Title
'    If bConnexionInitiale Then
'      End
'    Else
'      GoTo fin
'    End If
'  End If
'  On Error GoTo 0
'  sbStatus.Panels("DataSource") = BDSource & " (" & cSystèmeCA & ")"
'
'  SetStatus "Chargement des données, patientez…"
' ChargeUtilisateurs
  
  ChargementInitialCommun Me, bDemandeSource, frmBDODBCLogon.GetSourceODBCDéfaut
  ChargeCatEvénements
  ChargeMilieux
  
  ' Précaution 24/11/00 PV
  RunSQL "set lock mode to wait"

fin:
  Screen.MousePointer = vbDefault
  SetStatus
End Sub

Private Sub DoConfiguration()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDISaisieLabo Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer la source de données !"
    Exit Sub
  End If
  
  ChargementInitial True
End Sub

Private Sub cmdColChp_Click()
' Coller un champ : F5

  TraitF5 (giColChp)

End Sub

Private Sub cmdColFrm_Click()
' Coller formulaire : Maj + F5

  TraitF5 (giColFrm)

End Sub

Private Sub cmdCopFrm_Click()
' Copie du formulaire : Ctrl + F5

  TraitF5 (giCopFrm)

End Sub

Private Sub cmdOptions_Click()
  frmOptions.Show
End Sub

Private Sub MDIForm_Load()
' PC 22/11/2001 : évolution ligne de commande pour faire passer aussi une référence d'échantillon en anomalie
  
  Dim bSaisAno As Boolean
  Dim sLigCmd As String         ' ligne de commande
  Dim sArgOpt As String         ' argument en option
  Dim sOption As String
  Dim sOptVal As String         ' valeur de l'option
  Dim lPosEga As Long           ' position du signe égal dans l'option
  Dim iCpt As Integer           ' compteur de boucle
  Dim c As Control
  Dim sCtrlNomDtF As String     ' nom ou DaTaField du contrôle lu
  Const cMaxOpt As Integer = 20 ' nombre maxi d'options
 
  ' Internationalisation
  IntlInit

  Caption = App.Title & " - " & App.FileDescription
  NoPreviousInstance Me
  sVersionApp = App.Major & "." & App.Minor & "." & App.Revision
  
  ' Retouche des raccourcis menus (raccourcis que l'on ne peut pas définir dans l'éditeur de menus)
  cmdQuitter.Caption = cmdQuitter.Caption & Chr(9) & "Alt+F4"
  
  AjusteMenus 0
  AjusteEtiquettesBoutons tbBoutons

' PC 22/11/2001
' analyse de la ligne de commande
  bOptFrm = False: bOptCtl = False
  sLigCmd = UCase$(Command)
  If sLigCmd <> "" Then ' arguments en ligne de commande
' lignes de code conservées pour compatibilité
' devront être supprimées après évolution Scraw avec passage arguments
' lorsque clique sur bouton Anomalie dans Scraw, la ligne de commande doit ressembler à
' "-f:frmanomalie -c:txtRefEch=RefEch" où RefEch doit être une référence échantillon valide
    
    If sLigCmd = "-A" Then
      bSaisAno = True   ' saisie des anomalies
    Else
      bSaisAno = False
    End If

    sNomFrm = ""
    On Error Resume Next
    For iCpt = 0 To cMaxOpt
      ' extraction des arguments en option
      sArgOpt = Split(sLigCmd, " ", cMaxOpt, vbTextCompare)(iCpt)
      If Err.Number = 9 Then ' indice en dehors des bornes
        Exit For
      Else
        sOption = Left(sArgOpt, 3)
        Select Case sOption
        Case "-F:"  ' formulaire
          sOptVal = Mid(sArgOpt, 4)
          ' doit être de la forme : "FRMNOM" et si on n'a pas déjà mis cette option
          If Len(sOptVal) >= 6 And Not bOptFrm Then
            bOptFrm = True
            sNomFrm = sOptVal
          End If
        Case "-C:"  ' contrôle
          sOptVal = Mid(sArgOpt, 4): lPosEga = InStr(sOptVal, "=")
' doit être de la forme "NomCtrl=ValCtrl"
' l'option ne doit pas avoir déjà été mise
' l'option formulaire doit être mise
          If lPosEga > 4 And Not bOptCtl And bOptFrm Then
            sNomCtrl = Left(sOptVal, lPosEga - 1) ' extraction du nom du contrôle
            vValCtrl = Mid(sOptVal, lPosEga + 1)  ' extraction de la valeur du contrôle
            If Len(sNomCtrl) >= 4 And Len(vValCtrl) >= 1 Then bOptCtl = True
          End If
        End Select
      End If
    Next iCpt
    On Error GoTo 0
  End If  ' sLigCmd <> ""
    
  If bSaisAno Or (bOptFrm And sNomFrm = "FRMANOMALIE") Then ' traitement spécifique anomalies
    Caption = "Saisie des anomalies"
    mnuAnomalie.Caption = "&Anomalies"
    cmdSaisieLot.Visible = False
    cmdConstitutionSS.Visible = False
    mnuEvénement.Visible = False
    mnuSuperEvénement.Visible = False
    For iCpt = tbBoutons.Buttons("Lot").Index To tbBoutons.Buttons.Count
      tbBoutons.Buttons(iCpt).Visible = False
    Next iCpt
  End If
  
  ' Réinitialisation du chien de garde d'inactivité
  RAZTimerInactif
  timMédor.Enabled = True
  
  Show
  ChargementInitial bShiftPressed
  InitialiseMenus
  
  If bSaisAno Then cmdAnomalies_Click
  If bOptFrm Then ' ouverture formulaire en paramètre
    bOptFrm = False
    Select Case sNomFrm
      Case "FRMANOMALIE":       cmdAnomalies_Click
      Case "FRMEVÉNEMENT":      cmdEvénement_Click (0)
      Case "FRMLOT":            cmdSaisieLot_Click
      Case "FRMSUPEREVÉNEMENT": cmdSuperEvénement_Click (0)
    End Select
    
    If bOptCtl Then ' valeur par défaut d'un contrôle en paramètre
      bOptCtl = False  ' pour ne pas remettre les valeurs en cas de nouvelle ouverture
      For Each c In Screen.ActiveForm.Controls  ' pour tous les contrôles de la feuille active
        On Error Resume Next
        sCtrlNomDtF = UCase$(c.DataField)   ' on va d'abord comparer la propriété DataField
        If Err.Number = 0 Then ' propriété DataField gérée par l'objet
          On Error GoTo 0
          If sCtrlNomDtF = sNomCtrl Then
            c = vValCtrl
            Exit For
          Else
            sCtrlNomDtF = UCase$(c.Name)   ' on va ensuite comparer le nom du contrôle
            If sCtrlNomDtF = sNomCtrl Then
              c = vValCtrl
              Exit For
            End If
          End If
        Else    ' propriété DataField non gérée par l'objet
          On Error GoTo 0
          sCtrlNomDtF = UCase$(c.Name)   ' on va alors comparer le nom du contrôle
          If sCtrlNomDtF = sNomCtrl Then
            c = vValCtrl
            Exit For
          End If
        End If
      Next c
    End If    ' bOptCtl
  End If    ' bOptFrm
  
End Sub

Private Sub AjouteEvénement(ByVal sCode As String)
  Static i As Integer
  i = i + 1
  Load cmdEvénement(i)
  cmdEvénement(i).Caption = sCode & Chr(9) & colCatEvénements(sCode).cev_libelle & "…"
  cmdEvénement(i).Tag = sCode
  cmdEvénement(i).Visible = True
  If i = 1 Then cmdEvénement(0).Visible = False
  
  Dim b As MSComctlLib.ButtonMenu
  Set b = tbBoutons.Buttons("Evt").ButtonMenus.Add(, , cmdEvénement(i).Caption)
  b.Tag = sCode
End Sub

Private Sub AjouteSuperEvénement(ByVal sCode As String)
  Static i As Integer
  i = i + 1
  Load cmdSuperEvénement(i)
  cmdSuperEvénement(i).Caption = sCode & Chr(9) & colCatEvénements(sCode).cev_libelle & "…"
  cmdSuperEvénement(i).Tag = sCode
  cmdSuperEvénement(i).Visible = True
  If i = 1 Then cmdSuperEvénement(0).Visible = False
  
  Dim b As MSComctlLib.ButtonMenu
  Set b = tbBoutons.Buttons("SEvt").ButtonMenus.Add(, , cmdSuperEvénement(i).Caption)
  b.Tag = sCode
End Sub

Private Sub InitialiseMenus()
  AjouteEvénement "H1"
  AjouteEvénement "H2"
  AjouteEvénement "H'2"
  AjouteEvénement "H3"
  AjouteEvénement "H'3"
  AjouteEvénement "H4"
  AjouteEvénement "H5"
  AjouteEvénement "H11"
  AjouteEvénement "H12"
  AjouteEvénement "H13"
  AjouteEvénement "H14"
  AjouteEvénement "H15"
  
  AjouteSuperEvénement "H3"
  AjouteSuperEvénement "H'3"
  AjouteSuperEvénement "H4"
  AjouteSuperEvénement "H5"
End Sub

Private Sub mnuEnregistrement_Click()
  cmdConfiguration.Enabled = Forms.Count = 1
End Sub


'========================================================================
' Menus

' Synchronisation des menus
' Rend visible ou non le menu fenêtre
Public Sub AjusteMenus(ByVal iOffset As Integer)
  Dim iNbFeuillesChargées As Integer, F As Form
  iNbFeuillesChargées = iOffset
  For Each F In Forms
    If Not F Is MDISaisieLabo Then iNbFeuillesChargées = iNbFeuillesChargées + 1
  Next
  
  Dim bFeuilleChargée As Boolean
  bFeuilleChargée = iNbFeuillesChargées > 0
  
  mnuFenêtre.Visible = bFeuilleChargée
End Sub

Private Sub cmdConfiguration_Click()
  DoConfiguration
End Sub

Private Sub cmdQuitter_Click()
  Unload Me
End Sub


'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu Anomalie

Private Sub cmdAnomalies_Click()
  On Error GoTo Problème
  frmAnomalie.Show
  frmAnomalie.ZOrder 0
  AjusteMenus 0
Problème:
End Sub


'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu Lot

Private Sub cmdSaisieLot_Click()
  On Error GoTo Problème
  frmLot.Show
  frmLot.ZOrder 0
  AjusteMenus 0
Problème:
End Sub

'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu Evénement

Private Sub SaisieEvénement(sEvénement As String)
  frmEvénement.SetMode sEvénement
  frmEvénement.Show
  frmEvénement.ZOrder 0
  AjusteMenus 0
  
  On Error Resume Next
  tbBoutons.Buttons("Evt").Image = sEvénement
  If Err Then tbBoutons.Buttons("Evt").Image = "imgEvénement"
End Sub

Public Sub SaisieSuperEvénement(sEvénement As String)
  If sEvénement = "H5" Then
    frmSaisieH5.Show
    frmSaisieH5.ZOrder 0
  Else
    frmSuperEvénement.SetMode sEvénement
    frmSuperEvénement.Show
    frmSuperEvénement.ZOrder 0
  End If
  
  AjusteMenus 0
  
  On Error Resume Next
  tbBoutons.Buttons("SEvt").Image = "S" & sEvénement
  If Err Then tbBoutons.Buttons("SEvt").Image = "imgSuperEvénement"
End Sub

Private Sub cmdEvénement_Click(Index As Integer)
  SaisieEvénement cmdEvénement(Index).Tag
End Sub

Private Sub cmdSuperEvénement_Click(Index As Integer)
  SaisieSuperEvénement cmdSuperEvénement(Index).Tag
End Sub

Private Sub cmdUtilisateur_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDISaisieLabo Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer d'utilisateur !"
    Exit Sub
  End If
  
  If frmBDLogin.iInitUtilisateur(False, True) = 0 Then
    sbStatus.Panels("Utilisateur") = sNomOpérateur & " (" & iNumOpérateur & ")"
  End If
End Sub

'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu SuperSérie

Private Sub cmdConstitutionSS_Click()
  frmSuperSérie.Show                ' Pas de feuilles multiples
  AjusteMenus 0
End Sub


'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu Fenêtre

Private Sub cmdCascade_Click()
  MDISaisieLabo.Arrange vbCascade
End Sub

Private Sub cmdRéorganiser_Click()
  MDISaisieLabo.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosaïque_Click()
  MDISaisieLabo.Arrange vbTileHorizontal
End Sub



'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu Aide

Private Sub cmdAPropos_Click()
  frmAbout.APropos Me.Icon
End Sub

' ===============================================================================
' Barre de boutons

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  tbBoutons.Refresh
  Select Case Button.Key
    Case "Anomalie":    cmdAnomalies_Click
    
    Case "Lot":         cmdSaisieLot_Click
    
    Case "Evt":         cmdEvénement_Click 1
    Case "SEvt":        cmdSuperEvénement_Click 1
    
    Case "SuperSérie":  cmdConstitutionSS_Click
    
    Case Else:          Stop
  End Select
End Sub

Private Sub tbBoutons_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
  Select Case ButtonMenu.Parent.Key
    Case "Evt":         SaisieEvénement ButtonMenu.Tag
    Case "SEvt":        SaisieSuperEvénement ButtonMenu.Tag
    Case Else:          Stop
  End Select
End Sub


'%%%%%%%%%%%%%%%%%%%%
' Menu contextuel de la barre de boutons

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then PopupMenu mnuBarreBoutons
End Sub

' Ajustement de la coche juste avant l'affichage du menu contextuel de la barre de boutons
Private Sub mnuBarreBoutons_Click()
  cmdBdBEtiquettes.Checked = tbBoutons.Buttons(2).Caption <> ""
End Sub

Private Sub cmdBdBEtiquettes_Click()
  cmdBdBEtiquettes.Checked = Not cmdBdBEtiquettes.Checked
  SaveSetting App.EXEName, "Affichage", "Etiquettes", IIf(cmdBdBEtiquettes.Checked, 1, 0)
  AjusteEtiquettesBoutons tbBoutons
End Sub


' ===============================================================================
' Barre d'état

Private Sub sbStatus_PanelDblClick(ByVal Panel As MSComctlLib.Panel)
' PC 20/11/2001
' ajout dans le panneau de l'utilisateur
'  If Panel.Key = "DataSource" Then cmdConfiguration_Click
  Select Case Panel.Key
    Case "Utilisateur": cmdUtilisateur_Click
    Case "DataSource":  cmdConfiguration_Click
  End Select
End Sub

' ===============================================================================
' Chien de garde, 30 min d'inactivité maximum !

Private Sub timMédor_Timer()
  Dim t As Single
  t = Timer - tLastAction
  If t < 0 Then t = t + 24& * 60 * 60
  
  If t > 30 * 60 Then Unload Me
End Sub

Private Sub TraitF5(iTypeAction As Integer)
' PC 26/11/2001
' Traitement de la touche F5, Ctrl+F5, Maj+F5
' procédure qui peut typiquement être mise dans un module !
' Paramètre iTypeAction : type d'action demandé
' - 0 (constante giCopFrm) : copier le formulaire
' - 1 (constante giColFrm) : coller le formulaire
' - 2 (constante giColChp) : coller le champ

  Dim c As Control              ' controle de l'écran
  Dim sNomFrm As String         ' nom du formulaire actif
  Dim sNomCtl As String         ' nom du controle actif
  Dim sTxtCtl As String         ' texte du contrôle actif
  Dim iIdxCtl As Integer        ' index du contrôle actif
  Dim sValItemCol As String     ' valeur de l'item de la collection
  Dim bFeuilleFille As Boolean  ' valeur de la propriété MDIChild
  
  bFeuilleFille = False ' initialisation
  On Error Resume Next
  bFeuilleFille = Screen.ActiveForm.MDIChild
  If Err.Number <> 0 Or Not bFeuilleFille Then Exit Sub ' que pour les feuilles filles
  On Error GoTo 0

  sNomFrm = Screen.ActiveForm.Name
  If iTypeAction = giColChp Then
    Set c = Screen.ActiveControl
    GoSub TraitCtrl
  Else
    For Each c In Screen.ActiveForm
      GoSub TraitCtrl
    Next c
    If iTypeAction = giCopFrm Then MsgBox "Formulaire copié", vbInformation, App.Title
  End If
Exit Sub

TraitCtrl: ' Traitement du contrôle
  ' si le contrôle est de type texte ou liste déroulante
  If ((TypeOf c Is TextBox) Or (TypeOf c Is BDCombo) Or (TypeOf c Is ComboBox)) Then
    ' contrôle actif et modifiable
    If c.Enabled = True And c.Locked = False Then ' propriété valide pour ces contrôles
      If iTypeAction = giCopFrm Then
        sTxtCtl = c.Text
      Else
        sTxtCtl = ""
      End If
      sNomCtl = c.Name
      On Error Resume Next  ' traitement du cas ou le contrôle fait parti d'un groupe
      iIdxCtl = c.Index
      ' si le contrôle fait parti d'un groupe, on concatène son index à son nom
      If Err.Number = 0 Then sNomCtl = sNomCtl & "(" & CStr(iIdxCtl) & ")"
      On Error GoTo 0
      
      ' on stocke dans la collection le texte du contrôle,
      ' indexé par son nom et le formulaire dont il dépend, séparés par l'arrobase
      sValItemCol = sNomCtl & "@" & sNomFrm
      On Error Resume Next
      If iTypeAction = giCopFrm Then
        colCtrlFrm.Add sTxtCtl, sValItemCol
        If Err.Number <> 0 Then                 ' l'item existe déjà dans la collection
          colCtrlFrm.Remove sValItemCol         ' on le supprime
          colCtrlFrm.Add sTxtCtl, sValItemCol   ' et on l'ajoute de nouveau
        End If
      Else
        sTxtCtl = colCtrlFrm.Item(sValItemCol)
        If Err.Number = 0 Then c.Text = sTxtCtl
      End If
      On Error GoTo 0
    End If    ' c.Enabled = True And c.Locked = False
  End If      ' ((TypeOf c Is TextBox) Or (TypeOf c Is BDCombo) Or (TypeOf c Is ComboBox))
Return

End Sub

