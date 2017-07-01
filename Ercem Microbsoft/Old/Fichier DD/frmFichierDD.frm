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
   Tag             =   "Donn�es"
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
      Tag             =   "Code RDIA de l'�tablissement"
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
      Tag             =   "Code APE (num�rique !) de l'�tablissement"
      Top             =   4080
      Width           =   720
   End
   Begin VB.Frame Frame1 
      Caption         =   "Identification �tablissement"
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
         Tag             =   "Indice du libell�"
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1500
         TabIndex        =   14
         Tag             =   "Date+heure de derni�re modification de l'information"
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
         Tag             =   "Libell� complet"
         Top             =   600
         Width           =   7260
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*etb_cpost"
         Height          =   315
         Index           =   3
         Left            =   1500
         TabIndex        =   7
         Tag             =   "Code postal de l'�tablissement"
         Top             =   960
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "etb_datecreat"
         Height          =   315
         Index           =   5
         Left            =   1500
         TabIndex        =   9
         Tag             =   "Date de cr�ation de l'�tablissement"
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
         Tag             =   "Libell� complet"
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
         Caption         =   "N� etb :"
         Height          =   210
         Index           =   0
         Left            =   120
         TabIndex        =   1
         Top             =   300
         Width           =   750
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Pr�fixe+Nom :"
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
         Caption         =   "Cr�� le :"
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
   Begin FichierDD.BDS�lecteur bdS�l 
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
' 30/07/1998 PV Optimisation des op�rations g�n�rales (modif via un seul update)

Option Explicit

Private cEtb As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private bOpG�n�rale As Boolean            ' Vrai si changement sur la s�lection
Private iMode As eMode�dition

Private sFinalWP                          ' Where-part de la s�lection en cours
Private sQuery As String                  ' Query de la s�lection en cours

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
        MsgBox "Erreur dans la requ�te !" & vbCrLf & sMsg, vbExclamation, sNomApp
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & sFinal
    End If
  Next
  
  If sWP = "" Then
    MsgBox "La lecture compl�te du fichier �tablissement n'est pas permise (plus de 20000 enregistrements).", vbExclamation, sNomApp
    Exit Sub
'    Dim iRep As VbMsgBoxResult
'    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, sNomApp)
'    If iRep = vbNo Then Exit Sub
'    sWP = "1=1"
  End If
  
  Screen.MousePointer = vbHourglass
  Dim cEtbQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  ' On m�morise la where-part finale pour les op�rations g�n�rales
  sFinalWP = sWP & " and etb_etat is null"
  sQuery = "select etb_numetb,etb_prefixe,etb_nom,etb_cpost,etb_datecreat,etb_numsec,etb_ddclient,etb_ape,etb_rdia,etb_ddmarque,timestamp from etablissement where " & sFinalWP & " order by etb_prefixe,etb_nom"
  cEtbQuery.OpenCurseur sQuery
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  Screen.MousePointer = vbDefault
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, sNomApp
    ActiveFormulaire True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cEtb Is Nothing Then cEtb.CloseCurseur
  Set cEtb = cEtbQuery
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cEtb.EOF And cEtb.BOF) Then
    iMode = meNavigate
    SetMessage ""
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a �t� s�lectionn�"
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  bdS�l.ButtonEnabled("Delete") = False
    
  bdS�l.SetFocus
End Sub


' V�rifie que les champs contiennent des valeurs l�gales
' Le contr�le des NULL et des types a d�j� �t� fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  Dim i As Integer
  
  bOkValeurs = False
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cEtb Is Nothing
  
  If bOpG�n�rale Then
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
      MsgBox "Op�ration g�n�rale sans modification !" & vbCrLf & "Vous devez modifier au moins un champ pour lancer une op�ration g�n�rale, sinon annulez l'op�ration g�n�rale en cours.", vbExclamation, sNomApp
      Exit Sub
    End If
    
    sSQL = sSQL & ",timestamp=current,etb_datemodif=current,etb_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",etb_opermodif=" & iNumOp�rateur & " where " & sFinalWP
    
    Screen.MousePointer = vbHourglass
    SetMessage "Ex�cution de l'op�ration g�n�rale en cours, patientez�"
    On Error Resume Next
    RunSQL sSQL
    If Err Then
      Screen.MousePointer = vbDefault
      SetMessage ""
      MsgBox "�chec lors de la requ�te update" & vbCrLf & vbCrLf & sSQL & vbCrLf & vbCrLf & "Erreur " & Err & ": " & sAjusteMessageODBC(Error), vbExclamation, sNomApp
      Exit Sub
    End If
    On Error GoTo 0
    
    ' On r�-ex�cute la requ�te, sinon la buff�risation locale emp�che l'affichage des champs modifi�s
    SetMessage "Lecture des donn�es modifi�es, patientez�"
    If Not cEtb Is Nothing Then cEtb.CloseCurseur
    cEtb.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  Else  ' Modification classique
    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cEtb.Edit
    cEtb!TimeStamp = Now
    If Not bPr�pareEditAdd(cEtb, colColonnes, colChamps) Then Exit Sub
  End If
  
  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = False
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp ou le 1er enregistrement
  iMode = meNavigate
    
  bdS�l.ActiveMouvements True
  AjusteMouvements
  bdS�l.ButtonEnabled("Delete") = False

  SetMessage ""
  SetStatus ""
  bdS�l.TabStop = True
  bdS�l.SetFocus
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
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = False
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cEtb Is Nothing Then
    If Not (cEtb.EOF And cEtb.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  bdS�l.ButtonEnabled("Delete") = False

  SetMessage ""
  SetStatus ""
  
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("etb_numetb").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cEtb Is Nothing
  
  ' Op�ration g�n�rale = Shift+Changement
  bOpG�n�rale = bShiftPressed
  
  If cEtb.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "timestamp", False
  ActiveChamp "etb_numetb", False
  ActiveChamp "etb_prefixe", False
  ActiveChamp "etb_nom", False
  ActiveChamp "etb_cpost", False
  ActiveChamp "etb_datecreat", False
  ActiveChamp "etb_numsec", False
  
  colChamps("etb_ddclient").SetFocus
  bdS�l.TabStop = False
  
  iMode = meChange
  
  If bOpG�n�rale Then
    SetMessage "OP�RATION G�N�RALE - D�finissez les champs modifi�s, puis validez [Entr�e] ou abandonnez [�chap]"
    EffaceFormulaire
  Else
    SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
    AutoSelect colChamps("etb_ddclient"), True
  End If
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cEtb Is Nothing

  bdS�l.ButtonEnabled("First") = cEtb.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cEtb.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cEtb.EOF
  bdS�l.ButtonEnabled("Last") = Not cEtb.EOF
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
' Actions du s�lecteur

Private Sub bdS�l_ActionCancel():   ActionCancel:   End Sub
Private Sub bdS�l_ActionChange():   ActionChange:   End Sub
Private Sub bdS�l_ActionFirst():    ActionFirst:    End Sub
Private Sub bdS�l_ActionLast():     ActionLast:     End Sub
Private Sub bdS�l_ActionNext():     ActionNext:     End Sub
Private Sub bdS�l_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdS�l_ActionQuery():    ActionQuery:    End Sub
Private Sub bdS�l_ActionValidate(): ActionValidate: End Sub

Private Sub bdS�l_GotFocus()
  SetStatus ""
End Sub

' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable "etablissement", colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  
  ' Formulaire en mode initial
  Set cEtb = Nothing
  ActiveFormulaire False
  With bdS�l
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
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, sNomApp
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
    bdS�l.NumRec = cEtb.AbsolutePosition
    
    ' Mise � jour en arri�re plan
    ActiveTimer mtRapide
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cEtb.bEffac� = True
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
  bdS�l.NumRec = ""
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

' Activation du timer de mise � jour des champs satellites
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
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=etablissement"
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cEtb, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage ""
End Sub


'=================================================================================
' Impression des donn�es

Public Sub Imprime()
  MsgBox "L'impression n'est pas encore disponible." & vbCrLf & "Copiez les donn�es dans Excel pour les imprimer.", vbExclamation, sNomApp
End Sub

