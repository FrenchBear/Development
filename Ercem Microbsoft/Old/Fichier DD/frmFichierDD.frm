VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmFichierDD 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Fichier DD"
   ClientHeight    =   4830
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   10485
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmFichierDD.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   322
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   699
   Tag             =   "Données"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   9960
      Top             =   3360
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etb_rdia"
      Height          =   315
      Index           =   9
      Left            =   1560
      MaxLength       =   3
      TabIndex        =   22
      Tag             =   "Code RDIA de l'établissement"
      Top             =   4440
      Width           =   660
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etb_ape"
      Height          =   315
      Index           =   6
      Left            =   1560
      MaxLength       =   5
      TabIndex        =   20
      Tag             =   "Code APE (numérique !) de l'établissement"
      Top             =   4080
      Width           =   720
   End
   Begin VB.Frame Frame1 
      Caption         =   "Identification établissement"
      Height          =   2475
      Left            =   60
      TabIndex        =   0
      Top             =   780
      Width           =   10335
      Begin VB.TextBox txtChamp 
         DataField       =   "*etb_numetb"
         Height          =   315
         Index           =   0
         Left            =   1500
         TabIndex        =   2
         Tag             =   "Indice du libellé"
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1500
         TabIndex        =   14
         Tag             =   "Date+heure de dernière modification de l'information"
         Top             =   2040
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*etb_prefixe"
         Height          =   315
         Index           =   1
         Left            =   1500
         TabIndex        =   4
         Tag             =   "Code de saisie rapide"
         Top             =   600
         Width           =   1395
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*etb_nom"
         Height          =   315
         Index           =   2
         Left            =   2940
         TabIndex        =   5
         Tag             =   "Libellé complet"
         Top             =   600
         Width           =   7260
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*etb_cpost"
         Height          =   315
         Index           =   3
         Left            =   1500
         TabIndex        =   7
         Tag             =   "Code postal de l'établissement"
         Top             =   960
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "etb_datecreat"
         Height          =   315
         Index           =   5
         Left            =   1500
         TabIndex        =   9
         Tag             =   "Date de création de l'établissement"
         Top             =   1320
         Width           =   975
      End
      Begin VB.TextBox txtNomSec 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2520
         Locked          =   -1  'True
         TabIndex        =   12
         TabStop         =   0   'False
         Tag             =   "Libellé complet"
         Top             =   1680
         Width           =   7680
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*etb_numsec"
         Height          =   315
         Index           =   7
         Left            =   1500
         TabIndex        =   11
         Tag             =   "Code de saisie rapide"
         Top             =   1680
         Width           =   975
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "N° etb :"
         Height          =   210
         Index           =   0
         Left            =   120
         TabIndex        =   1
         Top             =   300
         Width           =   750
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Préfixe+Nom :"
         Height          =   210
         Index           =   1
         Left            =   120
         TabIndex        =   3
         Top             =   660
         Width           =   1335
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Code postal :"
         Height          =   210
         Index           =   3
         Left            =   120
         TabIndex        =   6
         Top             =   1020
         Width           =   1275
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   13
         Top             =   2100
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
         Height          =   210
         Index           =   4
         Left            =   120
         TabIndex        =   8
         Top             =   1380
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Secteur :"
         Height          =   210
         Index           =   5
         Left            =   120
         TabIndex        =   10
         Top             =   1740
         Width           =   855
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etb_ddclient"
      Height          =   315
      Index           =   4
      Left            =   1560
      MaxLength       =   15
      TabIndex        =   16
      Tag             =   "Code client DD"
      Top             =   3360
      Width           =   1860
   End
   Begin MSComctlLib.StatusBar sbMessage 
      Align           =   1  'Align Top
      Height          =   315
      Left            =   0
      TabIndex        =   23
      Top             =   405
      Width           =   10485
      _ExtentX        =   18494
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etb_ddmarque"
      Height          =   315
      Index           =   8
      Left            =   1560
      MaxLength       =   15
      TabIndex        =   18
      Tag             =   "Code marque DD"
      Top             =   3720
      Width           =   1860
   End
   Begin FichierDD.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   405
      Left            =   0
      TabIndex        =   24
      Top             =   0
      Width           =   10485
      _ExtentX        =   18494
      _ExtentY        =   714
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
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "RDIA :"
      Height          =   210
      Index           =   7
      Left            =   180
      TabIndex        =   21
      Top             =   4500
      Width           =   585
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "APE :"
      Height          =   210
      Index           =   6
      Left            =   180
      TabIndex        =   19
      Top             =   4140
      Width           =   495
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Client :"
      Height          =   210
      Index           =   2
      Left            =   180
      TabIndex        =   15
      Top             =   3420
      Width           =   675
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Marque :"
      Height          =   210
      Index           =   10
      Left            =   180
      TabIndex        =   17
      Top             =   3780
      Width           =   840
   End
End
Attribute VB_Name = "frmFichierDD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Gestion du Fichier DD
' Pas d'ajout ni de suppression, mais copie dans le presse-papiers
'  6/07/1998 PV
' 30/07/1998 PV Optimisation des opérations générales (modif via un seul update)

Option Explicit

Private cEtb As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private bOpGénérale As Boolean            ' Vrai si changement sur la sélection
Private iMode As eModeÉdition

Private sFinalWP                          ' Where-part de la sélection en cours
Private sQuery As String                  ' Query de la sélection en cours

'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
      Dim sFinal As String, sMsg As String
      If Not bQueryToWP(t.DataField, t.Text, colColonnes(t.DataField).iType, sFinal, sMsg) Then
        MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, sNomApp
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & sFinal
    End If
  Next
  
  If sWP = "" Then
    MsgBox "La lecture complète du fichier établissement n'est pas permise (plus de 20000 enregistrements).", vbExclamation, sNomApp
    Exit Sub
'    Dim iRep As VbMsgBoxResult
'    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, sNomApp)
'    If iRep = vbNo Then Exit Sub
'    sWP = "1=1"
  End If
  
  Screen.MousePointer = vbHourglass
  Dim cEtbQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  ' On mémorise la where-part finale pour les opérations générales
  sFinalWP = sWP & " and etb_etat is null"
  sQuery = "select etb_numetb,etb_prefixe,etb_nom,etb_cpost,etb_datecreat,etb_numsec,etb_ddclient,etb_ape,etb_rdia,etb_ddmarque,timestamp from etablissement where " & sFinalWP & " order by etb_prefixe,etb_nom"
  cEtbQuery.OpenCurseur sQuery
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  Screen.MousePointer = vbDefault
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, sNomApp
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cEtb Is Nothing Then cEtb.CloseCurseur
  Set cEtb = cEtbQuery
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cEtb.EOF And cEtb.BOF) Then
    iMode = meNavigate
    SetMessage ""
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  bdSél.ButtonEnabled("Delete") = False
    
  bdSél.SetFocus
End Sub


' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  Dim i As Integer
  
  bOkValeurs = False
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cEtb Is Nothing
  
  If bOpGénérale Then
    Dim sSQL As String
    
    If Not bOkValeurs Then Exit Sub
    
    sSQL = "update etablissement set "
    Dim t As Control, iNbChamp As Integer
    Dim sVal As String, sValSQL As String, sValInterne As String, sMsg As String
    For Each t In colChamps
      If t.Text <> "" Then
        bOkValType t.Text, colColonnes(t.DataField).iType, sValSQL, sValInterne, sMsg
        If iNbChamp > 0 Then sSQL = sSQL & ","
        sSQL = sSQL & t.DataField & "=" & sValSQL
        iNbChamp = iNbChamp + 1
      End If
    Next
    If iNbChamp = 0 Then
      MsgBox "Opération générale sans modification !" & vbCrLf & "Vous devez modifier au moins un champ pour lancer une opération générale, sinon annulez l'opération générale en cours.", vbExclamation, sNomApp
      Exit Sub
    End If
    
    sSQL = sSQL & ",timestamp=current,etb_datemodif=current,etb_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",etb_opermodif=" & iNumOpérateur & " where " & sFinalWP
    
    Screen.MousePointer = vbHourglass
    SetMessage "Exécution de l'opération générale en cours, patientez…"
    On Error Resume Next
    RunSQL sSQL
    If Err Then
      Screen.MousePointer = vbDefault
      SetMessage ""
      MsgBox "Échec lors de la requête update" & vbCrLf & vbCrLf & sSQL & vbCrLf & vbCrLf & "Erreur " & Err & ": " & sAjusteMessageODBC(Error), vbExclamation, sNomApp
      Exit Sub
    End If
    On Error GoTo 0
    
    ' On ré-exécute la requête, sinon la bufférisation locale empêche l'affichage des champs modifiés
    SetMessage "Lecture des données modifiées, patientez…"
    If Not cEtb Is Nothing Then cEtb.CloseCurseur
    cEtb.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  Else  ' Modification classique
    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cEtb.Edit
    cEtb!TimeStamp = Now
    If Not bPrépareEditAdd(cEtb, colColonnes, colChamps) Then Exit Sub
  End If
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = False
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp ou le 1er enregistrement
  iMode = meNavigate
    
  bdSél.ActiveMouvements True
  AjusteMouvements
  bdSél.ButtonEnabled("Delete") = False

  SetMessage ""
  SetStatus ""
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop

  Select Case iMode
    Case meChange:  ValidateEdit
    Case meQuery:   ValidateQuery
    Case Else:      Stop
  End Select
End Sub




Private Sub ActionCancel()
  Assert (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop

  ActiveFormulaire False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = False
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cEtb Is Nothing Then
    If Not (cEtb.EOF And cEtb.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  bdSél.ButtonEnabled("Delete") = False

  SetMessage ""
  SetStatus ""
  
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("etb_numetb").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cEtb Is Nothing
  
  ' Opération générale = Shift+Changement
  bOpGénérale = bShiftPressed
  
  If cEtb.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "timestamp", False
  ActiveChamp "etb_numetb", False
  ActiveChamp "etb_prefixe", False
  ActiveChamp "etb_nom", False
  ActiveChamp "etb_cpost", False
  ActiveChamp "etb_datecreat", False
  ActiveChamp "etb_numsec", False
  
  colChamps("etb_ddclient").SetFocus
  bdSél.TabStop = False
  
  iMode = meChange
  
  If bOpGénérale Then
    SetMessage "OPÉRATION GÉNÉRALE - Définissez les champs modifiés, puis validez [Entrée] ou abandonnez [Échap]"
    EffaceFormulaire
  Else
    SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
    AutoSelect colChamps("etb_ddclient"), True
  End If
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cEtb Is Nothing

  bdSél.ButtonEnabled("First") = cEtb.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cEtb.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cEtb.EOF
  bdSél.ButtonEnabled("Last") = Not cEtb.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cEtb.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  Screen.MousePointer = vbHourglass
  cEtb.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
  Screen.MousePointer = vbDefault
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cEtb.MoveNext
  AjusteMouvements
  If cEtb.EOF Then cEtb.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cEtb.MovePrevious
  AjusteMouvements
  If cEtb.BOF Then cEtb.MoveFirst
  SynchroniseFormulaire
End Sub


'=================================================================================
' Actions du sélecteur

Private Sub bdSél_ActionCancel():   ActionCancel:   End Sub
Private Sub bdSél_ActionChange():   ActionChange:   End Sub
Private Sub bdSél_ActionFirst():    ActionFirst:    End Sub
Private Sub bdSél_ActionLast():     ActionLast:     End Sub
Private Sub bdSél_ActionNext():     ActionNext:     End Sub
Private Sub bdSél_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdSél_ActionQuery():    ActionQuery:    End Sub
Private Sub bdSél_ActionValidate(): ActionValidate: End Sub

Private Sub bdSél_GotFocus()
  SetStatus ""
End Sub

' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable "etablissement", colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  
  ' Formulaire en mode initial
  Set cEtb = Nothing
  ActiveFormulaire False
  With bdSél
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = False
    .SetFocus
  End With
  
  iMode = meEmpty
  SetMessage ""
  SetStatus ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, sNomApp
    Cancel = True
    Exit Sub
  End If
  
  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cEtb Is Nothing Then cEtb.CloseCurseur
  MDIFichierDD.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cEtb Is Nothing Then
    EffaceFormulaire
  ElseIf cEtb.BOF And cEtb.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cEtb.Item(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cEtb.Item(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    txtNomSec = sNomSecteurDuCache(CLng(txtChamp(7)))
    bdSél.NumRec = cEtb.AbsolutePosition
    
    ' Mise à jour en arrière plan
    ActiveTimer mtRapide
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cEtb.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  If txtChamp(7) <> "" And txtNomSec = "" Then
    txtNomSec = sNomSecteur(CLng(txtChamp(7)))
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  txtNomSec = ""
  bdSél.NumRec = ""
End Sub


Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim c As Control
  For Each c In colChamps
    BDActiveChamp c, bEnabled
  Next
End Sub


Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub

'=================================================================================

' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
End Sub

'=================================================================================

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub


Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "etb_ddclient" Or _
     txtChamp(Index).DataField = "etb_ddmarque" Or _
     txtChamp(Index).DataField = "etb_rdia" Or _
     txtChamp(Index).DataField = "etb_prefixe" Or _
     txtChamp(Index).DataField = "etb_nom" Then
    Dim txtFichierDD As TextBox
    Set txtFichierDD = txtChamp(Index)
    ' On convertit le code en majuscules
    If txtFichierDD <> UCase(txtFichierDD) Then
      Dim sStart As Integer, sLength As Integer
      sStart = txtFichierDD.SelStart
      sLength = txtFichierDD.SelLength
      txtFichierDD = UCase(txtFichierDD)
      txtFichierDD.SelStart = sStart
      txtFichierDD.SelLength = sLength
    End If
  End If
End Sub


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=etablissement"
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cEtb, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage ""
End Sub


'=================================================================================
' Impression des données

Public Sub Imprime()
  MsgBox "L'impression n'est pas encore disponible." & vbCrLf & "Copiez les données dans Excel pour les imprimer.", vbExclamation, sNomApp
End Sub

