VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MDISaisieLabo 
   BackColor       =   &H8000000C&
   Caption         =   "Saisie labo: �v�nements - Lots de milieux - Anomalies"
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
            Object.ToolTipText     =   "Pr�paration des milieux"
            Object.Tag             =   "Lot"
            ImageKey        =   "imgG�lose"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Evt"
            Object.ToolTipText     =   "Saisie des �v�nements par s�rie"
            Object.Tag             =   "Evt"
            ImageKey        =   "imgEv�nement"
            Style           =   5
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SEvt"
            Object.ToolTipText     =   "Saisie des �v�nements par supers�rie"
            Object.Tag             =   "SEvt"
            ImageKey        =   "imgSuperEv�nement"
            Style           =   5
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SuperS�rie"
            Object.ToolTipText     =   "S�ries du jour"
            Object.Tag             =   "SS�r"
            ImageKey        =   "imgSuperS�rie"
         EndProperty
      EndProperty
   End
   Begin VB.Timer timM�dor 
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
            Key             =   "imgEv�nementLabo"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":0A76
            Key             =   "imgAnomalie"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":0D90
            Key             =   "imgG�lose"
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
            Key             =   "imgM�thode"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":19F8
            Key             =   "imgGerme16"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":1D12
            Key             =   "imgM�tam�thode"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":202C
            Key             =   "imgEv�nement"
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
            Key             =   "imgR�partitionMilieu"
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
            Key             =   "imgSuperS�rie"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDISaisieLabo.frx":4414
            Key             =   "imgN�gatif"
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
            Key             =   "imgD�butRM"
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
            Key             =   "imgSuperEv�nement"
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
            Object.ToolTipText     =   "Utilisateur connect�"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDISaisieLabo.frx":5CCC
            Key             =   "DataSource"
            Object.ToolTipText     =   "Source de donn�es"
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
         Caption         =   "Saisie &anomalies�"
      End
      Begin VB.Menu cmdSaisieLot 
         Caption         =   "Saisie &milieux�"
      End
      Begin VB.Menu cmdConstitutionSS 
         Caption         =   "S�ries du &jour�"
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConfiguration 
         Caption         =   "&Source de donn�es�"
      End
      Begin VB.Menu cmdUtilisateur 
         Caption         =   "&Utilisateur�"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options�"
      End
      Begin VB.Menu sep1b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuEv�nement 
      Caption         =   "&Ev�nement"
      Begin VB.Menu cmdEv�nement 
         Caption         =   "Ev�nement"
         Index           =   0
      End
   End
   Begin VB.Menu mnuSuperEv�nement 
      Caption         =   "&SuperEv�nement"
      Begin VB.Menu cmdSuperEv�nement 
         Caption         =   "SuperEv�nement"
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
   Begin VB.Menu mnuFen�tre 
      Caption         =   "Fe&n�tre"
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
      Begin VB.Menu cmdMosa�que 
         Caption         =   "&Mosa�que"
      End
      Begin VB.Menu cmdR�organiser 
         Caption         =   "&R�organiser les ic�nes"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&?"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A Propos de�"
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
'  2/09/1998 PV Enregistrement n�SS avec H2; fin du bouton Web
'  5/09/1998 PV Nom de la source dans le message d'erreur en cas d'�chec � la connexion
' 14/04/1999 PV 1.3 Nouvelle gestion g�n�rique des �v�nements
'  7/07/1999 PV sSourceODBCD�faut
' 24/11/2000 PV set lock mode to wait
' 20/11/2001 PC ajout utilisateur dans barre d'�tat
' 22/11/2001 PC option ligne de commande -c:NomCtrl=ValCtr pour initialiser un contr�le � l'ouverture de l'appli
'                                        -f:NomForm        pour ouvrir un sous formulaire � l'ouverture de l'appli
' 26/11/2001 PC Traitmt F5 (coller chp), Ctrl+F5 (copier form), Maj+F5 (coller form)

Option Explicit
' variables utilis�es dans le traitement de la ligne de commande
Public bOptFrm As Boolean           ' vrai si option formulaire
Public bOptCtl As Boolean           ' vrai si option controle
Public sNomFrm As String            ' nom du formulaire en option
Public sNomCtrl As String           ' nom d'un contr�le � activer au chargement de l'appli
Public vValCtrl As Variant          ' valeur d'un controle
' utilis� dans les traitement de la touche F5
Public colCtrlFrm As New Collection ' collection des contr�les d'un formulaire

Const giCopFrm As Integer = 0 ' copier formulaire
Const giColFrm As Integer = 1 ' coller formulaire
Const giColChp As Integer = 2 ' coller champ

Private Sub ChargementInitial(bDemandeSource As Boolean)
' PC 20/11/2001 : traitement par ChargementInitialCommun

'  Dim bConnexionInitiale As Boolean
'
'  If sbStatus.Panels("DataSource") = "" Then
'    sbStatus.Panels("DataSource") = "En cours�"
'    bConnexionInitiale = True
'  End If
'
'  SetStatus "Ouverture de la base de donn�es, patientez�"
'  Screen.MousePointer = vbHourglass
'  On Error Resume Next
'
'  Dim sSource As String
'  sSource = frmBDODBCLogon.GetSourceODBCD�faut
'  BDInit IIf(bDemandeSource, "?", sSource)
'  If Err Then
'    MsgBox "�chec lors de la connexion � la base de donn�es (source: " & sSource & ")." & vbCrLf & vbCrLf & "Erreur " & Err.Number & ": " & Err.Source & ": " & sAjusteMessageODBC(Err.Description), vbExclamation, App.Title
'    If bConnexionInitiale Then
'      End
'    Else
'      GoTo fin
'    End If
'  End If
'  On Error GoTo 0
'  sbStatus.Panels("DataSource") = BDSource & " (" & cSyst�meCA & ")"
'
'  SetStatus "Chargement des donn�es, patientez�"
' ChargeUtilisateurs
  
  ChargementInitialCommun Me, bDemandeSource, frmBDODBCLogon.GetSourceODBCD�faut
  ChargeCatEv�nements
  ChargeMilieux
  
  ' Pr�caution 24/11/00 PV
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
    MsgBox "Fermez les fen�tres document avant de changer la source de donn�es !"
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
' PC 22/11/2001 : �volution ligne de commande pour faire passer aussi une r�f�rence d'�chantillon en anomalie
  
  Dim bSaisAno As Boolean
  Dim sLigCmd As String         ' ligne de commande
  Dim sArgOpt As String         ' argument en option
  Dim sOption As String
  Dim sOptVal As String         ' valeur de l'option
  Dim lPosEga As Long           ' position du signe �gal dans l'option
  Dim iCpt As Integer           ' compteur de boucle
  Dim c As Control
  Dim sCtrlNomDtF As String     ' nom ou DaTaField du contr�le lu
  Const cMaxOpt As Integer = 20 ' nombre maxi d'options
 
  ' Internationalisation
  IntlInit

  Caption = App.Title & " - " & App.FileDescription
  NoPreviousInstance Me
  sVersionApp = App.Major & "." & App.Minor & "." & App.Revision
  
  ' Retouche des raccourcis menus (raccourcis que l'on ne peut pas d�finir dans l'�diteur de menus)
  cmdQuitter.Caption = cmdQuitter.Caption & Chr(9) & "Alt+F4"
  
  AjusteMenus 0
  AjusteEtiquettesBoutons tbBoutons

' PC 22/11/2001
' analyse de la ligne de commande
  bOptFrm = False: bOptCtl = False
  sLigCmd = UCase$(Command)
  If sLigCmd <> "" Then ' arguments en ligne de commande
' lignes de code conserv�es pour compatibilit�
' devront �tre supprim�es apr�s �volution Scraw avec passage arguments
' lorsque clique sur bouton Anomalie dans Scraw, la ligne de commande doit ressembler �
' "-f:frmanomalie -c:txtRefEch=RefEch" o� RefEch doit �tre une r�f�rence �chantillon valide
    
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
          ' doit �tre de la forme : "FRMNOM" et si on n'a pas d�j� mis cette option
          If Len(sOptVal) >= 6 And Not bOptFrm Then
            bOptFrm = True
            sNomFrm = sOptVal
          End If
        Case "-C:"  ' contr�le
          sOptVal = Mid(sArgOpt, 4): lPosEga = InStr(sOptVal, "=")
' doit �tre de la forme "NomCtrl=ValCtrl"
' l'option ne doit pas avoir d�j� �t� mise
' l'option formulaire doit �tre mise
          If lPosEga > 4 And Not bOptCtl And bOptFrm Then
            sNomCtrl = Left(sOptVal, lPosEga - 1) ' extraction du nom du contr�le
            vValCtrl = Mid(sOptVal, lPosEga + 1)  ' extraction de la valeur du contr�le
            If Len(sNomCtrl) >= 4 And Len(vValCtrl) >= 1 Then bOptCtl = True
          End If
        End Select
      End If
    Next iCpt
    On Error GoTo 0
  End If  ' sLigCmd <> ""
    
  If bSaisAno Or (bOptFrm And sNomFrm = "FRMANOMALIE") Then ' traitement sp�cifique anomalies
    Caption = "Saisie des anomalies"
    mnuAnomalie.Caption = "&Anomalies"
    cmdSaisieLot.Visible = False
    cmdConstitutionSS.Visible = False
    mnuEv�nement.Visible = False
    mnuSuperEv�nement.Visible = False
    For iCpt = tbBoutons.Buttons("Lot").Index To tbBoutons.Buttons.Count
      tbBoutons.Buttons(iCpt).Visible = False
    Next iCpt
  End If
  
  ' R�initialisation du chien de garde d'inactivit�
  RAZTimerInactif
  timM�dor.Enabled = True
  
  Show
  ChargementInitial bShiftPressed
  InitialiseMenus
  
  If bSaisAno Then cmdAnomalies_Click
  If bOptFrm Then ' ouverture formulaire en param�tre
    bOptFrm = False
    Select Case sNomFrm
      Case "FRMANOMALIE":       cmdAnomalies_Click
      Case "FRMEV�NEMENT":      cmdEv�nement_Click (0)
      Case "FRMLOT":            cmdSaisieLot_Click
      Case "FRMSUPEREV�NEMENT": cmdSuperEv�nement_Click (0)
    End Select
    
    If bOptCtl Then ' valeur par d�faut d'un contr�le en param�tre
      bOptCtl = False  ' pour ne pas remettre les valeurs en cas de nouvelle ouverture
      For Each c In Screen.ActiveForm.Controls  ' pour tous les contr�les de la feuille active
        On Error Resume Next
        sCtrlNomDtF = UCase$(c.DataField)   ' on va d'abord comparer la propri�t� DataField
        If Err.Number = 0 Then ' propri�t� DataField g�r�e par l'objet
          On Error GoTo 0
          If sCtrlNomDtF = sNomCtrl Then
            c = vValCtrl
            Exit For
          Else
            sCtrlNomDtF = UCase$(c.Name)   ' on va ensuite comparer le nom du contr�le
            If sCtrlNomDtF = sNomCtrl Then
              c = vValCtrl
              Exit For
            End If
          End If
        Else    ' propri�t� DataField non g�r�e par l'objet
          On Error GoTo 0
          sCtrlNomDtF = UCase$(c.Name)   ' on va alors comparer le nom du contr�le
          If sCtrlNomDtF = sNomCtrl Then
            c = vValCtrl
            Exit For
          End If
        End If
      Next c
    End If    ' bOptCtl
  End If    ' bOptFrm
  
End Sub

Private Sub AjouteEv�nement(ByVal sCode As String)
  Static i As Integer
  i = i + 1
  Load cmdEv�nement(i)
  cmdEv�nement(i).Caption = sCode & Chr(9) & colCatEv�nements(sCode).cev_libelle & "�"
  cmdEv�nement(i).Tag = sCode
  cmdEv�nement(i).Visible = True
  If i = 1 Then cmdEv�nement(0).Visible = False
  
  Dim b As MSComctlLib.ButtonMenu
  Set b = tbBoutons.Buttons("Evt").ButtonMenus.Add(, , cmdEv�nement(i).Caption)
  b.Tag = sCode
End Sub

Private Sub AjouteSuperEv�nement(ByVal sCode As String)
  Static i As Integer
  i = i + 1
  Load cmdSuperEv�nement(i)
  cmdSuperEv�nement(i).Caption = sCode & Chr(9) & colCatEv�nements(sCode).cev_libelle & "�"
  cmdSuperEv�nement(i).Tag = sCode
  cmdSuperEv�nement(i).Visible = True
  If i = 1 Then cmdSuperEv�nement(0).Visible = False
  
  Dim b As MSComctlLib.ButtonMenu
  Set b = tbBoutons.Buttons("SEvt").ButtonMenus.Add(, , cmdSuperEv�nement(i).Caption)
  b.Tag = sCode
End Sub

Private Sub InitialiseMenus()
  AjouteEv�nement "H1"
  AjouteEv�nement "H2"
  AjouteEv�nement "H'2"
  AjouteEv�nement "H3"
  AjouteEv�nement "H'3"
  AjouteEv�nement "H4"
  AjouteEv�nement "H5"
  AjouteEv�nement "H11"
  AjouteEv�nement "H12"
  AjouteEv�nement "H13"
  AjouteEv�nement "H14"
  AjouteEv�nement "H15"
  
  AjouteSuperEv�nement "H3"
  AjouteSuperEv�nement "H'3"
  AjouteSuperEv�nement "H4"
  AjouteSuperEv�nement "H5"
End Sub

Private Sub mnuEnregistrement_Click()
  cmdConfiguration.Enabled = Forms.Count = 1
End Sub


'========================================================================
' Menus

' Synchronisation des menus
' Rend visible ou non le menu fen�tre
Public Sub AjusteMenus(ByVal iOffset As Integer)
  Dim iNbFeuillesCharg�es As Integer, F As Form
  iNbFeuillesCharg�es = iOffset
  For Each F In Forms
    If Not F Is MDISaisieLabo Then iNbFeuillesCharg�es = iNbFeuillesCharg�es + 1
  Next
  
  Dim bFeuilleCharg�e As Boolean
  bFeuilleCharg�e = iNbFeuillesCharg�es > 0
  
  mnuFen�tre.Visible = bFeuilleCharg�e
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
  On Error GoTo Probl�me
  frmAnomalie.Show
  frmAnomalie.ZOrder 0
  AjusteMenus 0
Probl�me:
End Sub


'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu Lot

Private Sub cmdSaisieLot_Click()
  On Error GoTo Probl�me
  frmLot.Show
  frmLot.ZOrder 0
  AjusteMenus 0
Probl�me:
End Sub

'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu Ev�nement

Private Sub SaisieEv�nement(sEv�nement As String)
  frmEv�nement.SetMode sEv�nement
  frmEv�nement.Show
  frmEv�nement.ZOrder 0
  AjusteMenus 0
  
  On Error Resume Next
  tbBoutons.Buttons("Evt").Image = sEv�nement
  If Err Then tbBoutons.Buttons("Evt").Image = "imgEv�nement"
End Sub

Public Sub SaisieSuperEv�nement(sEv�nement As String)
  If sEv�nement = "H5" Then
    frmSaisieH5.Show
    frmSaisieH5.ZOrder 0
  Else
    frmSuperEv�nement.SetMode sEv�nement
    frmSuperEv�nement.Show
    frmSuperEv�nement.ZOrder 0
  End If
  
  AjusteMenus 0
  
  On Error Resume Next
  tbBoutons.Buttons("SEvt").Image = "S" & sEv�nement
  If Err Then tbBoutons.Buttons("SEvt").Image = "imgSuperEv�nement"
End Sub

Private Sub cmdEv�nement_Click(Index As Integer)
  SaisieEv�nement cmdEv�nement(Index).Tag
End Sub

Private Sub cmdSuperEv�nement_Click(Index As Integer)
  SaisieSuperEv�nement cmdSuperEv�nement(Index).Tag
End Sub

Private Sub cmdUtilisateur_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDISaisieLabo Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fen�tres document avant de changer d'utilisateur !"
    Exit Sub
  End If
  
  If frmBDLogin.iInitUtilisateur(False, True) = 0 Then
    sbStatus.Panels("Utilisateur") = sNomOp�rateur & " (" & iNumOp�rateur & ")"
  End If
End Sub

'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu SuperS�rie

Private Sub cmdConstitutionSS_Click()
  frmSuperS�rie.Show                ' Pas de feuilles multiples
  AjusteMenus 0
End Sub


'%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Menu Fen�tre

Private Sub cmdCascade_Click()
  MDISaisieLabo.Arrange vbCascade
End Sub

Private Sub cmdR�organiser_Click()
  MDISaisieLabo.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosa�que_Click()
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
    
    Case "Evt":         cmdEv�nement_Click 1
    Case "SEvt":        cmdSuperEv�nement_Click 1
    
    Case "SuperS�rie":  cmdConstitutionSS_Click
    
    Case Else:          Stop
  End Select
End Sub

Private Sub tbBoutons_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
  Select Case ButtonMenu.Parent.Key
    Case "Evt":         SaisieEv�nement ButtonMenu.Tag
    Case "SEvt":        SaisieSuperEv�nement ButtonMenu.Tag
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
' Barre d'�tat

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
' Chien de garde, 30 min d'inactivit� maximum !

Private Sub timM�dor_Timer()
  Dim t As Single
  t = Timer - tLastAction
  If t < 0 Then t = t + 24& * 60 * 60
  
  If t > 30 * 60 Then Unload Me
End Sub

Private Sub TraitF5(iTypeAction As Integer)
' PC 26/11/2001
' Traitement de la touche F5, Ctrl+F5, Maj+F5
' proc�dure qui peut typiquement �tre mise dans un module !
' Param�tre iTypeAction : type d'action demand�
' - 0 (constante giCopFrm) : copier le formulaire
' - 1 (constante giColFrm) : coller le formulaire
' - 2 (constante giColChp) : coller le champ

  Dim c As Control              ' controle de l'�cran
  Dim sNomFrm As String         ' nom du formulaire actif
  Dim sNomCtl As String         ' nom du controle actif
  Dim sTxtCtl As String         ' texte du contr�le actif
  Dim iIdxCtl As Integer        ' index du contr�le actif
  Dim sValItemCol As String     ' valeur de l'item de la collection
  Dim bFeuilleFille As Boolean  ' valeur de la propri�t� MDIChild
  
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
    If iTypeAction = giCopFrm Then MsgBox "Formulaire copi�", vbInformation, App.Title
  End If
Exit Sub

TraitCtrl: ' Traitement du contr�le
  ' si le contr�le est de type texte ou liste d�roulante
  If ((TypeOf c Is TextBox) Or (TypeOf c Is BDCombo) Or (TypeOf c Is ComboBox)) Then
    ' contr�le actif et modifiable
    If c.Enabled = True And c.Locked = False Then ' propri�t� valide pour ces contr�les
      If iTypeAction = giCopFrm Then
        sTxtCtl = c.Text
      Else
        sTxtCtl = ""
      End If
      sNomCtl = c.Name
      On Error Resume Next  ' traitement du cas ou le contr�le fait parti d'un groupe
      iIdxCtl = c.Index
      ' si le contr�le fait parti d'un groupe, on concat�ne son index � son nom
      If Err.Number = 0 Then sNomCtl = sNomCtl & "(" & CStr(iIdxCtl) & ")"
      On Error GoTo 0
      
      ' on stocke dans la collection le texte du contr�le,
      ' index� par son nom et le formulaire dont il d�pend, s�par�s par l'arrobase
      sValItemCol = sNomCtl & "@" & sNomFrm
      On Error Resume Next
      If iTypeAction = giCopFrm Then
        colCtrlFrm.Add sTxtCtl, sValItemCol
        If Err.Number <> 0 Then                 ' l'item existe d�j� dans la collection
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

