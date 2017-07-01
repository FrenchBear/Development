VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.MDIForm MDILabo 
   BackColor       =   &H8000000C&
   Caption         =   "Gestion des tables labo"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10605
   Icon            =   "MDILabo.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComDlg.CommonDialog cdPrinter 
      Left            =   9060
      Top             =   1620
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "ilAdmin"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   23
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Paramètre"
            Object.ToolTipText     =   "Gestion des paramètres"
            Object.Tag             =   "Par"
            ImageKey        =   "imgGerme16"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Méthode"
            Object.ToolTipText     =   "Gestion des méthodes d'analyse"
            Object.Tag             =   "Mét"
            ImageKey        =   "imgMéthode"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Capacités"
            Object.ToolTipText     =   "Gestion des capacités d'analyse des laboratoires"
            Object.Tag             =   "Cap"
            ImageKey        =   "imgCapacité"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Métaméthode"
            Object.ToolTipText     =   "Gestion des métaméthodes d'analyse"
            Object.Tag             =   "MM"
            ImageKey        =   "imgMétaméthode"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Milieu"
            Object.ToolTipText     =   "Gestion des milieux"
            Object.Tag             =   "Mil"
            ImageKey        =   "imgMilieu"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Etuve"
            Object.ToolTipText     =   "Gestion des étuves"
            Object.Tag             =   "Étu"
            ImageKey        =   "imgEtuve"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "CatEvénement"
            Object.ToolTipText     =   "Gestion du catalogue des événements labo"
            Object.Tag             =   "Evt"
            ImageKey        =   "imgEvénementLabo"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "TypeAnomalie"
            Object.ToolTipText     =   "Gestion des types d'anomalies prédéfinis"
            Object.Tag             =   "TAn"
            ImageKey        =   "imgTypeAnomalie"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Critère"
            Object.ToolTipText     =   "Gestion des critères"
            Object.Tag             =   "Cri"
            ImageKey        =   "imgCritère"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Anomalie"
            Object.ToolTipText     =   "Gestion des anomalies"
            Object.Tag             =   "Ano"
            ImageKey        =   "imgAnomalie"
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "LotMilieu"
            Object.ToolTipText     =   "Préparation des milieux"
            Object.Tag             =   "Lot"
            ImageKey        =   "imgGélose"
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "JournalEvénement"
            Object.ToolTipText     =   "Journal des evénements labo"
            Object.Tag             =   "Evt"
            ImageKey        =   "imgJournalEvénement"
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Séries"
            Object.ToolTipText     =   "Gestion des séries"
            Object.Tag             =   "Sér"
            ImageKey        =   "imgSéries"
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PurgeCache"
            Object.ToolTipText     =   "Suppression et mise à jour des caches disques locaux"
            Object.Tag             =   "MajC"
            ImageKey        =   "imgMajCache"
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copie"
            Object.ToolTipText     =   "Copie les données dans le presse-papiers"
            Object.Tag             =   "Cop"
            ImageKey        =   "imgCopie"
         EndProperty
         BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Impr"
            Object.ToolTipText     =   "Impression"
            Object.Tag             =   "Imp"
            ImageKey        =   "imgImpr"
         EndProperty
         BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Aperçu"
            Object.ToolTipText     =   "Aperçu avant impression"
            Object.Tag             =   "Aper"
            ImageKey        =   "imgAperçu"
         EndProperty
         BeginProperty Button23 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Web"
            Object.ToolTipText     =   "Affiche les informations sur le Web"
            Object.Tag             =   "Web"
            ImageKey        =   "imgIExplorer"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   1
      Top             =   6900
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   10213
            Key             =   "Message"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
            Picture         =   "MDILabo.frx":0442
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connecté"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDILabo.frx":0994
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
   Begin MSComctlLib.ImageList ilAdmin 
      Left            =   9000
      Top             =   900
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   23
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":0D16
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":1030
            Key             =   "imgEvénementLabo"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":134A
            Key             =   "imgAnomalie"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":1664
            Key             =   "imgGélose"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":197E
            Key             =   "imgMilieu"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":1C98
            Key             =   "imgGerme"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":1FB2
            Key             =   "imgMéthode"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":22CC
            Key             =   "imgGerme16"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":25E6
            Key             =   "imgMétaméthode"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":2900
            Key             =   "imgJournalEvénement"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":2C1A
            Key             =   "imgTypeAnomalie"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":2F34
            Key             =   "imgCopie"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":3046
            Key             =   "imgIExplorer"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":31AA
            Key             =   "imgAperçu"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":330E
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":3472
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":38CA
            Key             =   "imgSéries"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":3A26
            Key             =   "imgEtuve"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":3E86
            Key             =   "imgCritère"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":42DA
            Key             =   "imgImpr"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":43EE
            Key             =   "imgCapacité"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":4840
            Key             =   "imgPurgCache"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":516A
            Key             =   "imgMajCache"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuTable 
      Caption         =   "&Table"
      Begin VB.Menu cmdParamètres 
         Caption         =   "&Paramètres…"
      End
      Begin VB.Menu cmdMéthodes 
         Caption         =   "Méth&odes d'analyse…"
      End
      Begin VB.Menu cmdCapacitées 
         Caption         =   "Capac&itées"
      End
      Begin VB.Menu cmdMétaméthodes 
         Caption         =   "Métamét&hodes…"
      End
      Begin VB.Menu sepb 
         Caption         =   "-"
      End
      Begin VB.Menu cmdMilieux 
         Caption         =   "&Milieux…"
      End
      Begin VB.Menu cmdEtuves 
         Caption         =   "Étu&ves…"
      End
      Begin VB.Menu cmdCodesEvénements 
         Caption         =   "&Codes des événements…"
      End
      Begin VB.Menu cmdTypesAnomalies 
         Caption         =   "&Types d'anomalies prédéfinis…"
      End
      Begin VB.Menu cmdCritères 
         Caption         =   "Critères…"
      End
      Begin VB.Menu sepa 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAnomalies 
         Caption         =   "Enregistrement des &anomalies…"
      End
      Begin VB.Menu cmdLotsMilieux 
         Caption         =   "&Préparation des milieux…"
      End
      Begin VB.Menu cmdJournalEvénements 
         Caption         =   "&Journal des événements…"
      End
      Begin VB.Menu sep9a 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSéries 
         Caption         =   "&Séries…"
      End
      Begin VB.Menu cmdPurgCache 
         Caption         =   "Mise à jour caches disque"
      End
      Begin VB.Menu sep9 
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
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFermer 
         Caption         =   "&Fermer"
         Visible         =   0   'False
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuEnregistrement 
      Caption         =   "&Enregistrement"
      Begin VB.Menu cmdQuery 
         Caption         =   "&Rechercher"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFirst 
         Caption         =   "&Premier"
      End
      Begin VB.Menu cmdPrevious 
         Caption         =   "P&récédent"
      End
      Begin VB.Menu cmdNext 
         Caption         =   "&Suivant"
      End
      Begin VB.Menu cmdLast 
         Caption         =   "&Dernier"
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAdd 
         Caption         =   "&Ajouter"
      End
      Begin VB.Menu cmdChange 
         Caption         =   "&Changer"
      End
      Begin VB.Menu cmdDelete 
         Caption         =   "&Supprimer"
      End
      Begin VB.Menu sep3b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCopie 
         Caption         =   "C&opier"
         Shortcut        =   ^C
      End
      Begin VB.Menu sep3c 
         Caption         =   "-"
      End
      Begin VB.Menu cmdImpr 
         Caption         =   "&Imprimer"
      End
      Begin VB.Menu cmdAperçu 
         Caption         =   "Aperçu a&vant impression…"
      End
   End
   Begin VB.Menu mnuCommandes 
      Caption         =   "&Commandes"
      Begin VB.Menu cmdrécupère 
         Caption         =   "&Récupérer un enregistrement supprimé"
         Shortcut        =   ^R
      End
      Begin VB.Menu sep3f 
         Caption         =   "-"
      End
      Begin VB.Menu cmdHistorique 
         Caption         =   "&Historique des modifications"
         Shortcut        =   ^H
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
      Caption         =   "&Aide"
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
Attribute VB_Name = "MDILabo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDILabo
' Feuille MDI principale de la gestion des tables du labo
' 12/02/1998 PV
' 11/06/1998 PV Source de données
'  7/07/1998 PV Copie de données dans le presse-papiers
' 16/07/1998 PV 1.1 Identification de l'utilisateur
'  4/08/1998 PV NoPreviousInstance
' 15/08/1998 PV 1.2 ChargementInitialCommun, VBLibODBC, frmMsgBoxTimer, sAjusteMessageODBC, BDActiveChamp
' 30/03/1999 PV 1.3 Impression
' 13/04/1999 PV Gestion des étuves
' 19/04/1999 PV Mode lecture seule
' 11/05/1999 PV Gestion des codes langue de façon propre
'  7/07/1999 PV sSourceODBCDéfaut
' 12/08/1999 PV Chargement différé des collections générales
' 18/10/2001 PC Ajout formulaire gestion des capacitées des laboratoires
' 31/11/2001 FF Ajout de l'Historique des modifications
' 05/12/2001 FF Ajout de la commande de récupération des enregistrements supprimés

Option Explicit


' Appelé à la connexion initiale, et après un changement d'identité d'utilisateur
Private Sub DétermineModeLectureSeule()
  If iNumOpérateur = 46 Or iNumOpérateur = 152 Or iNumOpérateur = 256 Or iNumOpérateur = 52 Then
    ' La DI peut modifier les tables labo !
    bLectureSeule = False
  Else
    bLectureSeule = (colUtilisateur("U" & iNumOpérateur).uti_niveau And 32) = 0
  End If
  
  ' Sur autre chose qu'on serveur ou microbe, lecture seule
  If Not IsServeur And cSystèmeCA <> "R" Then bLectureSeule = False
End Sub


Private Sub ChargementInitial(ByVal bDemandeSource As Boolean)
  ChargementInitialCommun Me, bDemandeSource, frmBDODBCLogon.GetSourceODBCDéfaut
  DétermineModeLectureSeule
End Sub


Private Sub cmdCapacitées_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmCapacité
  Else
    Set F = frmCapacité
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub

Private Sub cmdHistorique_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Historique
End Sub

Private Sub cmdOptions_Click()
  frmOptions.Show
End Sub

Private Sub cmdPurgCache_Click()
' PC 23/10/2001
' Rafraîchissement de la table des méthodes avec gestion d'un cache
  
  Dim iMbRep As Integer, sMbMsg As String   ' réponse et message d'un MsgBox
  Dim sReqSql  As String, sTypTrait As String * 1
  Dim sNomCacheDisque As String
  Dim curBD As New BDCurseur
  
  sMbMsg = "Rafraîchissement des fichiers cache-disque locaux"
  iMbRep = MsgBox(sMbMsg, vbDefaultButton1 + vbOKCancel + vbQuestion, App.EXEName)
  If iMbRep = vbOK Then
    sTypTrait = "P" ' Paramètres
    sNomCacheDisque = "paramètres"
    sReqSql = "select ger_indice,ger_libelle,ger_abrege from germe where ger_langue='F' order by ger_indice"
    GoSub TraitFic
    
    sTypTrait = "M" ' Méthodes
    sNomCacheDisque = "Methodes"
    sReqSql = "select met_germe,met_methode,met_libelle from methode order by met_germe,met_methode,met_libelle"
    GoSub TraitFic
    
    SetStatus
    sMbMsg = "Fichiers cache-disque locaux rafaîchis avec succès !"
    MsgBox sMbMsg, vbOKOnly + vbInformation, App.EXEName
  End If
  Exit Sub

TraitFic:
    SetStatus "Traitement des " & sNomCacheDisque & ". Patientez . . ."
    sNomCacheDisque = App.Path & "\Cache " & sNomCacheDisque & ".csv"
    On Error Resume Next
    Kill sNomCacheDisque  'cache disque invalide, on l'efface
    On Error GoTo 0
    
    Open sNomCacheDisque For Output Access Write Lock Read Write As #1
    curBD.OpenCurseur sReqSql
    
    While Not curBD.EOF
      If sTypTrait = "P" Then   ' traitement des paramètres
        Write #1, curBD!ger_indice, curBD!ger_libelle, NV(curBD!ger_abrege) ' écriture disque
      Else
        Write #1, curBD!met_germe, curBD!met_methode, NV(curBD!met_libelle) ' écriture disque
      End If
      curBD.MoveNext
    Wend
    curBD.CloseCurseur
    Close #1
  Return

End Sub

Private Sub cmdrécupère_Click()
On Error Resume Next
  If Not ActiveForm Is Nothing Then Screen.ActiveForm.Récupère
End Sub

Private Sub cmdUtilisateur_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDILabo Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer d'utilisateur !"
    Exit Sub
  End If
  
  If frmBDLogin.iInitUtilisateur(False, True) = 0 Then
    sbStatus.Panels("Utilisateur") = sNomOpérateur & " (" & iNumOpérateur & ")"
    DétermineModeLectureSeule
  End If
End Sub


Private Sub cmdConfiguration_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDILabo Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer la source de données !"
    Exit Sub
  End If
  
  ChargementInitial True
End Sub


Private Sub cmdCopie_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Copie
End Sub

Private Sub cmdImpr_Click()
  On Error Resume Next
  If Left(TypeName(ActiveForm), 2) = "dr" Then    ' DataReport
    ActiveForm.PrintReport
  Else
    ActiveForm.Imprime
  End If
End Sub

Private Sub cmdAperçu_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Aperçu
End Sub


Private Sub MDIForm_Load()
  ' Internationalisation
  IntlInit

  Caption = App.Title & " - " & App.FileDescription
  NoPreviousInstance Me
  sVersionApp = App.Major & "." & App.Minor & "." & App.Revision
  
  ' Retouche des raccourcis menus (raccourcis que l'on ne peut pas définir dans l'éditeur de menus)
  cmdQuery.Caption = cmdQuery.Caption & Chr(9) & "?"
  cmdFermer.Caption = cmdFermer.Caption & Chr(9) & "Ctrl+F4"
  cmdQuitter.Caption = cmdQuitter.Caption & Chr(9) & "Alt+F4"
  cmdFirst.Caption = cmdFirst.Caption & Chr(9) & "Début"
  cmdPrevious.Caption = cmdPrevious.Caption & Chr(9) & "-"
  cmdNext.Caption = cmdNext.Caption & Chr(9) & "+"
  cmdLast.Caption = cmdLast.Caption & Chr(9) & "Fin"
  cmdAdd.Caption = cmdAdd.Caption & Chr(9) & "A"
  cmdChange.Caption = cmdChange.Caption & Chr(9) & "C"
  cmdDelete.Caption = cmdDelete.Caption & Chr(9) & "Suppr"
  
  AjusteMenus 0
  AjusteEtiquettesBoutons tbBoutons
  
  Show
  ChargementInitial bShiftPressed
End Sub


Private Sub cmdParamètres_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmParamètre
  Else
    Set F = frmParamètre
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdMilieux_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmMilieu
  Else
    Set F = frmMilieu
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdEtuves_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmEtuve
  Else
    Set F = frmEtuve
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdCodesEvénements_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmCatEvénement
  Else
    Set F = frmCatEvénement
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdMéthodes_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmMéthode
  Else
    Set F = frmMéthode
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdMétaméthodes_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmRecherche
  Else
    Set F = frmRecherche
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdTypesAnomalies_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmTypeAnomalie
  Else
    Set F = frmTypeAnomalie
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdCritères_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmCritère
  Else
    Set F = frmCritère
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdAnomalies_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmAnomalie
  Else
    Set F = frmAnomalie
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdLotsMilieux_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmLotMilieu
  Else
    Set F = frmLotMilieu
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdJournalEvénements_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmJournalEvénement
  Else
    Set F = frmJournalEvénement
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdSéries_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmSérie
  Else
    Set F = frmSérie
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Sub cmdCascade_Click()
  MDILabo.Arrange vbCascade
End Sub

Private Sub cmdRéorganiser_Click()
  MDILabo.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosaïque_Click()
  MDILabo.Arrange vbTileHorizontal
End Sub


Private Sub cmdAPropos_Click()
  frmAbout.APropos Me.Icon
End Sub


Private Sub mnuEnregistrement_Click()
  Dim F As Form
  
  Set F = ActiveForm
  cmdQuery.Enabled = F.BDSél.ButtonEnabled("Query")

  cmdFirst.Enabled = F.BDSél.ButtonEnabled("First")
  cmdPrevious.Enabled = F.BDSél.ButtonEnabled("Previous")
  cmdNext.Enabled = F.BDSél.ButtonEnabled("Next")
  cmdLast.Enabled = F.BDSél.ButtonEnabled("Last")

  cmdAdd.Enabled = F.BDSél.ButtonEnabled("Add")
  cmdChange.Enabled = F.BDSél.ButtonEnabled("Change")
  cmdDelete.Enabled = F.BDSél.ButtonEnabled("Delete")
End Sub


Public Sub AjusteMenus(ByVal iOffset As Integer)
  Dim iNbFeuillesChargées As Integer, F As Form
  iNbFeuillesChargées = iOffset
  For Each F In Forms
    If F.Tag = "Données" Then iNbFeuillesChargées = iNbFeuillesChargées + 1
  Next
  
  Dim bFeuilleChargée As Boolean
  bFeuilleChargée = iNbFeuillesChargées > 0
  
  cmdFermer.Visible = bFeuilleChargée
  sep1.Visible = bFeuilleChargée
  mnuEnregistrement.Visible = bFeuilleChargée
  mnuFenêtre.Visible = bFeuilleChargée
  
  tbBoutons.Buttons("Copie").Enabled = bFeuilleChargée
  tbBoutons.Buttons("Impr").Enabled = bFeuilleChargée
  tbBoutons.Buttons("Aperçu").Enabled = bFeuilleChargée
  tbBoutons.Buttons("Web").Enabled = bFeuilleChargée
End Sub


' ===============================================================================
' Menus sous-traités aux feuilles de données

Private Sub cmdQuery_Click()
  ActiveForm.ActionQuery
End Sub

Private Sub cmdFirst_Click()
  ActiveForm.ActionFirst
End Sub

Private Sub cmdPrevious_Click()
  ActiveForm.ActionFirst
End Sub

Private Sub cmdNext_Click()
  ActiveForm.ActionNext
End Sub

Private Sub cmdLast_Click()
  ActiveForm.ActionLast
End Sub

Private Sub cmdAdd_Click()
  ActiveForm.ActionAdd
End Sub

Private Sub cmdChange_Click()
  ActiveForm.ActionChange
End Sub

Private Sub cmdDelete_Click()
  ActiveForm.ActionDelete
End Sub

Private Sub cmdWeb_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.FenêtreWeb
End Sub

Private Sub sbStatus_PanelDblClick(ByVal Panel As MSComctlLib.Panel)
  Select Case Panel.Key
    Case "Utilisateur": cmdUtilisateur_Click
    Case "DataSource":  cmdConfiguration_Click
  End Select
End Sub

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  tbBoutons.Refresh
  Select Case Button.Key
    Case "Paramètre":         cmdParamètres_Click
    Case "Milieu":            cmdMilieux_Click
    Case "Etuve":             cmdEtuves_Click
    Case "CatEvénement":      cmdCodesEvénements_Click
    Case "Méthode":           cmdMéthodes_Click
    Case "Métaméthode":       cmdMétaméthodes_Click
    Case "TypeAnomalie":      cmdTypesAnomalies_Click
    Case "Critère":           cmdCritères_Click
    
    Case "Anomalie":          cmdAnomalies_Click
    Case "LotMilieu":         cmdLotsMilieux_Click
    Case "JournalEvénement":  cmdJournalEvénements_Click
    
    Case "Séries":            cmdSéries_Click
    Case "Capacités":        cmdCapacitées_Click    ' ajout PC 22/10/2001
    Case "PurgeCache":      cmdPurgCache_Click   ' ajout PC 23/10/2001
    
    Case "Web":               cmdWeb_Click
    Case "Impr":              cmdImpr_Click
    Case "Aperçu":            cmdAperçu_Click
    Case "Copie":             cmdCopie_Click
    
    Case Else:                Stop
  End Select
End Sub

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then PopupMenu mnuBarreBoutons
End Sub

Private Sub mnuBarreBoutons_Click()
  cmdBdBEtiquettes.Checked = tbBoutons.Buttons(2).Caption <> ""
End Sub

Private Sub cmdBdBEtiquettes_Click()
  cmdBdBEtiquettes.Checked = Not cmdBdBEtiquettes.Checked
  SaveSetting App.EXEName, "Affichage", "Etiquettes", IIf(cmdBdBEtiquettes.Checked, 1, 0)
  AjusteEtiquettesBoutons tbBoutons
End Sub
