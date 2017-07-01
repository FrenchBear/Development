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
            Key             =   "Param�tre"
            Object.ToolTipText     =   "Gestion des param�tres"
            Object.Tag             =   "Par"
            ImageKey        =   "imgGerme16"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "M�thode"
            Object.ToolTipText     =   "Gestion des m�thodes d'analyse"
            Object.Tag             =   "M�t"
            ImageKey        =   "imgM�thode"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Capacit�s"
            Object.ToolTipText     =   "Gestion des capacit�s d'analyse des laboratoires"
            Object.Tag             =   "Cap"
            ImageKey        =   "imgCapacit�"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "M�tam�thode"
            Object.ToolTipText     =   "Gestion des m�tam�thodes d'analyse"
            Object.Tag             =   "MM"
            ImageKey        =   "imgM�tam�thode"
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
            Object.ToolTipText     =   "Gestion des �tuves"
            Object.Tag             =   "�tu"
            ImageKey        =   "imgEtuve"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "CatEv�nement"
            Object.ToolTipText     =   "Gestion du catalogue des �v�nements labo"
            Object.Tag             =   "Evt"
            ImageKey        =   "imgEv�nementLabo"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "TypeAnomalie"
            Object.ToolTipText     =   "Gestion des types d'anomalies pr�d�finis"
            Object.Tag             =   "TAn"
            ImageKey        =   "imgTypeAnomalie"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Crit�re"
            Object.ToolTipText     =   "Gestion des crit�res"
            Object.Tag             =   "Cri"
            ImageKey        =   "imgCrit�re"
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
            Object.ToolTipText     =   "Pr�paration des milieux"
            Object.Tag             =   "Lot"
            ImageKey        =   "imgG�lose"
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "JournalEv�nement"
            Object.ToolTipText     =   "Journal des ev�nements labo"
            Object.Tag             =   "Evt"
            ImageKey        =   "imgJournalEv�nement"
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "S�ries"
            Object.ToolTipText     =   "Gestion des s�ries"
            Object.Tag             =   "S�r"
            ImageKey        =   "imgS�ries"
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PurgeCache"
            Object.ToolTipText     =   "Suppression et mise � jour des caches disques locaux"
            Object.Tag             =   "MajC"
            ImageKey        =   "imgMajCache"
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copie"
            Object.ToolTipText     =   "Copie les donn�es dans le presse-papiers"
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
            Key             =   "Aper�u"
            Object.ToolTipText     =   "Aper�u avant impression"
            Object.Tag             =   "Aper"
            ImageKey        =   "imgAper�u"
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
            Object.ToolTipText     =   "Utilisateur connect�"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDILabo.frx":0994
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
            Key             =   "imgEv�nementLabo"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":134A
            Key             =   "imgAnomalie"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":1664
            Key             =   "imgG�lose"
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
            Key             =   "imgM�thode"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":22CC
            Key             =   "imgGerme16"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":25E6
            Key             =   "imgM�tam�thode"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":2900
            Key             =   "imgJournalEv�nement"
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
            Key             =   "imgAper�u"
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
            Key             =   "imgS�ries"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":3A26
            Key             =   "imgEtuve"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":3E86
            Key             =   "imgCrit�re"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":42DA
            Key             =   "imgImpr"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDILabo.frx":43EE
            Key             =   "imgCapacit�"
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
      Begin VB.Menu cmdParam�tres 
         Caption         =   "&Param�tres�"
      End
      Begin VB.Menu cmdM�thodes 
         Caption         =   "M�th&odes d'analyse�"
      End
      Begin VB.Menu cmdCapacit�es 
         Caption         =   "Capac&it�es"
      End
      Begin VB.Menu cmdM�tam�thodes 
         Caption         =   "M�tam�t&hodes�"
      End
      Begin VB.Menu sepb 
         Caption         =   "-"
      End
      Begin VB.Menu cmdMilieux 
         Caption         =   "&Milieux�"
      End
      Begin VB.Menu cmdEtuves 
         Caption         =   "�tu&ves�"
      End
      Begin VB.Menu cmdCodesEv�nements 
         Caption         =   "&Codes des �v�nements�"
      End
      Begin VB.Menu cmdTypesAnomalies 
         Caption         =   "&Types d'anomalies pr�d�finis�"
      End
      Begin VB.Menu cmdCrit�res 
         Caption         =   "Crit�res�"
      End
      Begin VB.Menu sepa 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAnomalies 
         Caption         =   "Enregistrement des &anomalies�"
      End
      Begin VB.Menu cmdLotsMilieux 
         Caption         =   "&Pr�paration des milieux�"
      End
      Begin VB.Menu cmdJournalEv�nements 
         Caption         =   "&Journal des �v�nements�"
      End
      Begin VB.Menu sep9a 
         Caption         =   "-"
      End
      Begin VB.Menu cmdS�ries 
         Caption         =   "&S�ries�"
      End
      Begin VB.Menu cmdPurgCache 
         Caption         =   "Mise � jour caches disque"
      End
      Begin VB.Menu sep9 
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
         Caption         =   "P&r�c�dent"
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
      Begin VB.Menu cmdAper�u 
         Caption         =   "Aper�u a&vant impression�"
      End
   End
   Begin VB.Menu mnuCommandes 
      Caption         =   "&Commandes"
      Begin VB.Menu cmdr�cup�re 
         Caption         =   "&R�cup�rer un enregistrement supprim�"
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
      Caption         =   "&Aide"
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
Attribute VB_Name = "MDILabo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDILabo
' Feuille MDI principale de la gestion des tables du labo
' 12/02/1998 PV
' 11/06/1998 PV Source de donn�es
'  7/07/1998 PV Copie de donn�es dans le presse-papiers
' 16/07/1998 PV 1.1 Identification de l'utilisateur
'  4/08/1998 PV NoPreviousInstance
' 15/08/1998 PV 1.2 ChargementInitialCommun, VBLibODBC, frmMsgBoxTimer, sAjusteMessageODBC, BDActiveChamp
' 30/03/1999 PV 1.3 Impression
' 13/04/1999 PV Gestion des �tuves
' 19/04/1999 PV Mode lecture seule
' 11/05/1999 PV Gestion des codes langue de fa�on propre
'  7/07/1999 PV sSourceODBCD�faut
' 12/08/1999 PV Chargement diff�r� des collections g�n�rales
' 18/10/2001 PC Ajout formulaire gestion des capacit�es des laboratoires
' 31/11/2001 FF Ajout de l'Historique des modifications
' 05/12/2001 FF Ajout de la commande de r�cup�ration des enregistrements supprim�s

Option Explicit


' Appel� � la connexion initiale, et apr�s un changement d'identit� d'utilisateur
Private Sub D�termineModeLectureSeule()
  If iNumOp�rateur = 46 Or iNumOp�rateur = 152 Or iNumOp�rateur = 256 Or iNumOp�rateur = 52 Then
    ' La DI peut modifier les tables labo !
    bLectureSeule = False
  Else
    bLectureSeule = (colUtilisateur("U" & iNumOp�rateur).uti_niveau And 32) = 0
  End If
  
  ' Sur autre chose qu'on serveur ou microbe, lecture seule
  If Not IsServeur And cSyst�meCA <> "R" Then bLectureSeule = False
End Sub


Private Sub ChargementInitial(ByVal bDemandeSource As Boolean)
  ChargementInitialCommun Me, bDemandeSource, frmBDODBCLogon.GetSourceODBCD�faut
  D�termineModeLectureSeule
End Sub


Private Sub cmdCapacit�es_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmCapacit�
  Else
    Set F = frmCapacit�
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
' Rafra�chissement de la table des m�thodes avec gestion d'un cache
  
  Dim iMbRep As Integer, sMbMsg As String   ' r�ponse et message d'un MsgBox
  Dim sReqSql  As String, sTypTrait As String * 1
  Dim sNomCacheDisque As String
  Dim curBD As New BDCurseur
  
  sMbMsg = "Rafra�chissement des fichiers cache-disque locaux"
  iMbRep = MsgBox(sMbMsg, vbDefaultButton1 + vbOKCancel + vbQuestion, App.EXEName)
  If iMbRep = vbOK Then
    sTypTrait = "P" ' Param�tres
    sNomCacheDisque = "param�tres"
    sReqSql = "select ger_indice,ger_libelle,ger_abrege from germe where ger_langue='F' order by ger_indice"
    GoSub TraitFic
    
    sTypTrait = "M" ' M�thodes
    sNomCacheDisque = "Methodes"
    sReqSql = "select met_germe,met_methode,met_libelle from methode order by met_germe,met_methode,met_libelle"
    GoSub TraitFic
    
    SetStatus
    sMbMsg = "Fichiers cache-disque locaux rafa�chis avec succ�s !"
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
      If sTypTrait = "P" Then   ' traitement des param�tres
        Write #1, curBD!ger_indice, curBD!ger_libelle, NV(curBD!ger_abrege) ' �criture disque
      Else
        Write #1, curBD!met_germe, curBD!met_methode, NV(curBD!met_libelle) ' �criture disque
      End If
      curBD.MoveNext
    Wend
    curBD.CloseCurseur
    Close #1
  Return

End Sub

Private Sub cmdr�cup�re_Click()
On Error Resume Next
  If Not ActiveForm Is Nothing Then Screen.ActiveForm.R�cup�re
End Sub

Private Sub cmdUtilisateur_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDILabo Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fen�tres document avant de changer d'utilisateur !"
    Exit Sub
  End If
  
  If frmBDLogin.iInitUtilisateur(False, True) = 0 Then
    sbStatus.Panels("Utilisateur") = sNomOp�rateur & " (" & iNumOp�rateur & ")"
    D�termineModeLectureSeule
  End If
End Sub


Private Sub cmdConfiguration_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDILabo Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fen�tres document avant de changer la source de donn�es !"
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

Private Sub cmdAper�u_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Aper�u
End Sub


Private Sub MDIForm_Load()
  ' Internationalisation
  IntlInit

  Caption = App.Title & " - " & App.FileDescription
  NoPreviousInstance Me
  sVersionApp = App.Major & "." & App.Minor & "." & App.Revision
  
  ' Retouche des raccourcis menus (raccourcis que l'on ne peut pas d�finir dans l'�diteur de menus)
  cmdQuery.Caption = cmdQuery.Caption & Chr(9) & "?"
  cmdFermer.Caption = cmdFermer.Caption & Chr(9) & "Ctrl+F4"
  cmdQuitter.Caption = cmdQuitter.Caption & Chr(9) & "Alt+F4"
  cmdFirst.Caption = cmdFirst.Caption & Chr(9) & "D�but"
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


Private Sub cmdParam�tres_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmParam�tre
  Else
    Set F = frmParam�tre
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


Private Sub cmdCodesEv�nements_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmCatEv�nement
  Else
    Set F = frmCatEv�nement
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdM�thodes_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmM�thode
  Else
    Set F = frmM�thode
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdM�tam�thodes_Click()
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


Private Sub cmdCrit�res_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmCrit�re
  Else
    Set F = frmCrit�re
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


Private Sub cmdJournalEv�nements_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmJournalEv�nement
  Else
    Set F = frmJournalEv�nement
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdS�ries_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmS�rie
  Else
    Set F = frmS�rie
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

Private Sub cmdR�organiser_Click()
  MDILabo.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosa�que_Click()
  MDILabo.Arrange vbTileHorizontal
End Sub


Private Sub cmdAPropos_Click()
  frmAbout.APropos Me.Icon
End Sub


Private Sub mnuEnregistrement_Click()
  Dim F As Form
  
  Set F = ActiveForm
  cmdQuery.Enabled = F.BDS�l.ButtonEnabled("Query")

  cmdFirst.Enabled = F.BDS�l.ButtonEnabled("First")
  cmdPrevious.Enabled = F.BDS�l.ButtonEnabled("Previous")
  cmdNext.Enabled = F.BDS�l.ButtonEnabled("Next")
  cmdLast.Enabled = F.BDS�l.ButtonEnabled("Last")

  cmdAdd.Enabled = F.BDS�l.ButtonEnabled("Add")
  cmdChange.Enabled = F.BDS�l.ButtonEnabled("Change")
  cmdDelete.Enabled = F.BDS�l.ButtonEnabled("Delete")
End Sub


Public Sub AjusteMenus(ByVal iOffset As Integer)
  Dim iNbFeuillesCharg�es As Integer, F As Form
  iNbFeuillesCharg�es = iOffset
  For Each F In Forms
    If F.Tag = "Donn�es" Then iNbFeuillesCharg�es = iNbFeuillesCharg�es + 1
  Next
  
  Dim bFeuilleCharg�e As Boolean
  bFeuilleCharg�e = iNbFeuillesCharg�es > 0
  
  cmdFermer.Visible = bFeuilleCharg�e
  sep1.Visible = bFeuilleCharg�e
  mnuEnregistrement.Visible = bFeuilleCharg�e
  mnuFen�tre.Visible = bFeuilleCharg�e
  
  tbBoutons.Buttons("Copie").Enabled = bFeuilleCharg�e
  tbBoutons.Buttons("Impr").Enabled = bFeuilleCharg�e
  tbBoutons.Buttons("Aper�u").Enabled = bFeuilleCharg�e
  tbBoutons.Buttons("Web").Enabled = bFeuilleCharg�e
End Sub


' ===============================================================================
' Menus sous-trait�s aux feuilles de donn�es

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
  If Not ActiveForm Is Nothing Then ActiveForm.Fen�treWeb
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
    Case "Param�tre":         cmdParam�tres_Click
    Case "Milieu":            cmdMilieux_Click
    Case "Etuve":             cmdEtuves_Click
    Case "CatEv�nement":      cmdCodesEv�nements_Click
    Case "M�thode":           cmdM�thodes_Click
    Case "M�tam�thode":       cmdM�tam�thodes_Click
    Case "TypeAnomalie":      cmdTypesAnomalies_Click
    Case "Crit�re":           cmdCrit�res_Click
    
    Case "Anomalie":          cmdAnomalies_Click
    Case "LotMilieu":         cmdLotsMilieux_Click
    Case "JournalEv�nement":  cmdJournalEv�nements_Click
    
    Case "S�ries":            cmdS�ries_Click
    Case "Capacit�s":        cmdCapacit�es_Click    ' ajout PC 22/10/2001
    Case "PurgeCache":      cmdPurgCache_Click   ' ajout PC 23/10/2001
    
    Case "Web":               cmdWeb_Click
    Case "Impr":              cmdImpr_Click
    Case "Aper�u":            cmdAper�u_Click
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
