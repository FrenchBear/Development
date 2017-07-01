VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmSaisieH5 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Enregistrement H5 (sortie d'�tuve) par supers�rie"
   ClientHeight    =   5880
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7710
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmR�sultatsN�gatifs.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5880
   ScaleWidth      =   7710
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnALire 
      Caption         =   "A lire�"
      Height          =   375
      Left            =   6180
      TabIndex        =   20
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton btnInitialiser 
      Caption         =   "Initialiser (F3)"
      Height          =   375
      Left            =   6180
      TabIndex        =   19
      Top             =   540
      Width           =   1455
   End
   Begin VB.CommandButton btnRechercher 
      Caption         =   "&Rechercher"
      Height          =   390
      Left            =   4380
      TabIndex        =   16
      Top             =   60
      Width           =   1215
   End
   Begin VB.ComboBox cboJour 
      Height          =   330
      ItemData        =   "frmR�sultatsN�gatifs.frx":014A
      Left            =   1680
      List            =   "frmR�sultatsN�gatifs.frx":0163
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Tag             =   "S�lectionner le jour de la supers�rie sortie d'�tuve"
      Top             =   60
      Width           =   675
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info3"
      Height          =   315
      Index           =   3
      Left            =   1680
      TabIndex        =   12
      Tag             =   "Info compl�mentaire"
      Top             =   2100
      Width           =   2715
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info2"
      Height          =   315
      Index           =   2
      Left            =   1680
      MaxLength       =   10
      TabIndex        =   10
      Tag             =   "Info compl�mentaire"
      Top             =   1740
      Width           =   2715
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info1"
      Height          =   315
      Index           =   1
      Left            =   1680
      MaxLength       =   20
      TabIndex        =   8
      Tag             =   "Info compl�mentaire"
      Top             =   1380
      Width           =   2715
   End
   Begin VB.CommandButton btnValider 
      Caption         =   "Valider (F2)"
      Height          =   375
      Left            =   6180
      TabIndex        =   18
      Top             =   60
      Width           =   1455
   End
   Begin VB.TextBox txtNumSS 
      Height          =   315
      Left            =   2400
      TabIndex        =   2
      Top             =   60
      Width           =   495
   End
   Begin SaisieLabo.BDCombo bdcPers 
      Height          =   330
      Left            =   1680
      TabIndex        =   6
      Tag             =   "Code personne ayant signal� l'�v�nement"
      Top             =   1020
      Width           =   4275
      _ExtentX        =   7541
      _ExtentY        =   582
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DataField       =   "*evt_pers"
   End
   Begin SaisieLabo.BDCombo bdcMilieu 
      Height          =   330
      Left            =   1680
      TabIndex        =   4
      Tag             =   "ASR ou Salmonella"
      Top             =   540
      Width           =   4275
      _ExtentX        =   7541
      _ExtentY        =   582
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DataField       =   "*evt_pers"
      Text            =   "09: Hektoen"
   End
   Begin MSComctlLib.ListView lvD�tail 
      Height          =   2925
      Left            =   60
      TabIndex        =   15
      Top             =   2880
      Width           =   7575
      _ExtentX        =   13361
      _ExtentY        =   5159
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "S�rie"
         Object.Width           =   1940
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "H5"
         Object.Width           =   582
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Date+Heure"
         Object.Width           =   423
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Pers"
         Object.Width           =   441
      EndProperty
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "�"
      BeginProperty Font 
         Name            =   "Wingdings"
         Size            =   20.25
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5640
      TabIndex        =   17
      Top             =   50
      Width           =   435
   End
   Begin VB.Label lbhDHS�rie 
      AutoSize        =   -1  'True
      Caption         =   "S�ries pr�par�es le :"
      Height          =   210
      Left            =   2700
      TabIndex        =   14
      Top             =   2580
      Width           =   1980
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "D�tails sur les s�ries :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   13
      Top             =   2580
      Width           =   2100
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "Info &3 :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   11
      Top             =   2160
      Width           =   690
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "Info &2 :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   9
      Top             =   1800
      Width           =   690
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "Info &1 :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   7
      Top             =   1440
      Width           =   690
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Technicienne :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   5
      Top             =   1080
      Width           =   1350
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Milieu :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   3
      Top             =   600
      Width           =   660
   End
   Begin VB.Label lblSS 
      AutoSize        =   -1  'True
      Caption         =   "&Supers�rie :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   1155
   End
End
Attribute VB_Name = "frmSaisieH5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmSaisieH5
' Enregistrement collectif des r�sultats n�gatifs par supers�rie et par milieu
' 25/08/1998 PV
'  8/04/1999 PV G�n�ralisation de la saisie du H5
' 18/04/1999 PV S�lection de evt_ts au lieu de timestamp; bouton ALire

Option Explicit


Private Sub btnALire_Click()
  frmALire.Show
End Sub

Private Sub btnInitialiser_Click()
  cboJour.ListIndex = -1
  txtNumSS = ""
  bdcMilieu = ""
  bdcPers = ""
  txtInfo(1) = ""
  txtInfo(2) = ""
  txtInfo(3) = ""
  cboJour.SetFocus
End Sub

Private Sub btnRechercher_Click()
  Dim iNbD�j�Valid�s As Integer
  
  lvD�tail.ListItems.Clear
  
  ' V�rification du n� de supers�rie
  If Not bCheckNoSS(txtNumSS) Then Exit Sub
  If cboJour.ListIndex < 0 Then
    MsgBox "Vous devez choisir le jour de la supers�rie.", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdcMilieu.Synchronise
  If bdcMilieu.ListIndex < 0 Then
    MsgBox "Vous devez s�lectionner un milieu de la liste.", vbExclamation, App.Title
    bdcMilieu.SetFocus
    Exit Sub
  End If
  
  Screen.MousePointer = vbHourglass
  SetStatus "Recherche en cours, patientez�"
  
  Dim sSQL As String, cH5 As New BDCurseur
  sSQL = "select ser_numserie,ser_dh,evt_evenement,evt_pers,evt_ts,evt_milieu,evt_info1,evt_info2,evt_info3 from c_serielabo,outer c_evenement where evt_serielabo=ser_numserie and ser_superserie=" & txtNumSS & " and ser_dh between today-7 and today and weekday(ser_dh)=" & cboJour.ListIndex & " and evt_evenement=""H5"" and evt_milieu=" & iIndiceMilieu(bdcMilieu)
  cH5.OpenCurseur sSQL
  While Not cH5.EOF
    If lvD�tail.ListItems.Count = 0 Then
      lbhDHS�rie = "S�ries pr�par�es le " & Format(cH5!ser_dh, "ddd d/mm hh:mm")
    End If
    
    Dim x As ListItem
    Set x = lvD�tail.ListItems.Add
    x.Text = cH5!ser_numserie
    If IsNull(cH5!evt_evenement) Then
      x.SubItems(1) = "-"
    Else
      iNbD�j�Valid�s = iNbD�j�Valid�s + 1
      x.SubItems(1) = "H5." & sAbr�g�Milieu(cH5!evt_milieu)
      x.SubItems(2) = Format(cH5!evt_ts, "dd/mm hh:mm")
      x.SubItems(3) = cH5!evt_pers & ": " & sNomUtilisateur(cH5!evt_pers)
    End If
    
    cH5.MoveNext
  Wend
  cH5.CloseCurseur
  AjusteListView Me, lvD�tail
  
  Screen.MousePointer = vbDefault
  SetStatus
  
  If lvD�tail.ListItems.Count = 0 Then
    MsgBox "Supers�rie non trouv�e dans la base, saisie de l'�v�nement H5 impossible.", vbExclamation, App.Title
    Exit Sub
  End If
  
  If lvD�tail.ListItems.Count = iNbD�j�Valid�s Then
    MsgBox "L'�v�nement H5." & bdcMilieu & " a d�j� �t� enregistr� pour toutes les s�ries attach�es � cette supers�rie, saisie impossible.", vbExclamation, App.Title
    Exit Sub
  End If
  
  btnValider.Enabled = True
  btnValider.Default = True
  
 ' R�initialisation du chien de garde d'inactivit�
  RAZTimerInactif
End Sub


Private Sub btnValider_Click()
  Dim iMilieu As Integer    ' Milieu s�lectionn� (Ok, toujours TSN)
  
  bdcPers.Synchronise
  If bdcPers.ListIndex < 0 Then
    MsgBox "Vous devez s�lectionner une personne de la liste.", vbExclamation, App.Title
    bdcPers.Synchronise
    Exit Sub
  End If
  
  btnValider.Enabled = False
  iMilieu = iIndiceMilieu(bdcMilieu)
  
  Screen.MousePointer = vbHourglass
  SetStatus "Enregistrement des �v�nements en cours, patientez�"

  ' G�n�ration des �v�nements pour les s�ries concern�es
  Dim x As ListItem
  Dim i As Integer
  Dim cEvt As New BDCurseur
  
  Dim dBDTime As Date
  dBDTime = BDTime
  
  i = 0
  cEvt.OpenCurseur "select * from c_evenement where evt_serie=0"
  For Each x In lvD�tail.ListItems
    i = i + 1
    If x.SubItems(1) = "-" Then
      ' A cr�er
      
      SetStatus "Enregistrement de l'�v�nement� " & i & "/" & lvD�tail.ListItems.Count
      cEvt.AddNew
      cEvt!evt_date = Today
      cEvt!evt_evenement = "H5"
      cEvt!evt_milieu = iMilieu
      cEvt!evt_pers = bdcPers
      cEvt!evt_serielabo = x.Text
      cEvt!evt_info1 = txtInfo(1)
      cEvt!evt_info2 = txtInfo(2)
      cEvt!evt_info3 = txtInfo(3)
      cEvt!timestamp = dBDTime
      On Error Resume Next
      cEvt.Update
      If Err Then MsgBox "�chec lors de l'enregistrement de l'�v�nement H5 pour la s�rie " & x.Text & "." & vbCrLf & vbCrLf & "Erreur " & Err.Number & ": " & Err.Source & ": " & sAjusteMessageODBC(Err.Description), vbExclamation, App.Title
      On Error GoTo 0
    End If
  Next
  cEvt.CloseCurseur
  
  ' R�initialisation du chien de garde d'inactivit�
  RAZTimerInactif
  
  lvD�tail.ListItems.Clear
  btnRechercher.Enabled = True
  txtNumSS = ""
  txtNumSS.SetFocus
  
  Screen.MousePointer = vbDefault
  SetStatus
End Sub

Private Sub ARechercher()
  btnValider.Enabled = False
  btnRechercher.Default = True
  lvD�tail.ListItems.Clear
  lbhDHS�rie = ""
End Sub

Private Sub cboJour_Change()
  ARechercher
End Sub

Private Sub cboJour_Click()
  ARechercher
End Sub

Private Sub cboJour_GotFocus()
  SetStatus cboJour.Tag
End Sub

Private Sub txtNumSS_Change()
  ARechercher
End Sub

Private Sub bdcMilieu_Click()
  ARechercher
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez�"
  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPers.AddItem u.uti_numuti, u.uti_nom
  Next
  
  'BDActiveChamp bdcMilieu, False
  RemplitComboMilieux bdcMilieu, 0

  btnValider.Enabled = False    ' Tant qu'on n'a pas fait la recherche
  SetStatus
  
  AjusteListView Me, lvD�tail
  
  btnALire.Visible = bShiftPressed Or Environ("SYSTEMID") = "Athos3"
End Sub

Private Sub Form_Unload(Cancel As Integer)
  SetStatus
  MDISaisieLabo.AjusteMenus -1
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF2 Then
    KeyCode = 0
    If btnValider.Enabled Then btnValider_Click
  ElseIf KeyCode = vbKeyF3 Then
    KeyCode = 0
    btnInitialiser_Click
  End If
End Sub



Private Sub bdcPers_GotFocus()
  SetStatus "Entrer le num�ro de personne, ou s�lectionner dans la liste (F4)"
End Sub

Private Sub bdcPers_LostFocus()
  bdcPers.Synchronise
End Sub


Private Sub bdcMilieu_GotFocus()
  SetStatus "Entrer le code g�lose, ou s�lectionner dans la liste (F4)"
End Sub

Private Sub bdcMilieu_LostFocus()
  bdcMilieu.Synchronise
End Sub

Private Sub txtInfo_GotFocus(Index As Integer)
  SetStatus txtInfo(Index).Tag
  AutoSelect txtInfo(Index)
End Sub

Private Sub btnValider_GotFocus()
  SetStatus "Enregistrer les donn�es"
End Sub

Private Sub btnAnnuler_GotFocus()
  SetStatus "Fermer le formulaire"
End Sub


Private Sub txtNumSS_GotFocus()
  AutoSelect txtNumSS
  SetStatus "Entrez le n� de la supers�rie"
End Sub
