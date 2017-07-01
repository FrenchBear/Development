VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmOldFME 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des FME"
   ClientHeight    =   5220
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8865
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmOldFME.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   348
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   591
   Tag             =   "Données"
   Begin TablesFEU.BDSélecteur bdSél 
      Height          =   435
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   8835
      _ExtentX        =   15584
      _ExtentY        =   767
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
   Begin VB.CommandButton btnDestinataires 
      Caption         =   "&Destinataires…"
      Enabled         =   0   'False
      Height          =   375
      Left            =   60
      TabIndex        =   14
      Top             =   2820
      Width           =   1995
   End
   Begin MSComctlLib.ListView lwDestinataires 
      Height          =   1935
      Left            =   60
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   3240
      Width           =   8775
      _ExtentX        =   15478
      _ExtentY        =   3413
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "N°"
         Object.Width           =   794
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Destinataire"
         Object.Width           =   9234
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Fréquence"
         Object.Width           =   1323
      EndProperty
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*fme_titre"
      Height          =   315
      Index           =   2
      Left            =   2100
      MaxLength       =   65
      TabIndex        =   5
      Tag             =   "Titre de la FME"
      Top             =   1200
      Width           =   6720
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fme_origine"
      Height          =   315
      Index           =   1
      Left            =   2100
      MaxLength       =   30
      TabIndex        =   3
      Tag             =   "Origine de la modification"
      Top             =   840
      Width           =   2895
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fme_tscreation"
      Height          =   315
      Index           =   11
      Left            =   6780
      TabIndex        =   13
      Tag             =   "Date+heure de création"
      Top             =   2280
      Width           =   2055
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7740
      Top             =   480
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   2100
      TabIndex        =   11
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   2280
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fme_idmodif"
      Height          =   315
      Index           =   12
      Left            =   2100
      TabIndex        =   9
      Tag             =   "Origine de la modification"
      Top             =   1920
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fme_comment"
      Height          =   315
      Index           =   8
      Left            =   2100
      TabIndex        =   7
      Tag             =   "Commentaire libre quelconque"
      Top             =   1560
      Width           =   6720
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*fme_numfme"
      Height          =   315
      Index           =   0
      Left            =   2100
      TabIndex        =   1
      Tag             =   "N° de FME"
      Top             =   480
      Width           =   915
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Créé le :"
      Height          =   210
      Index           =   8
      Left            =   5640
      TabIndex        =   12
      Top             =   2340
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   10
      Top             =   2340
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "FME :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   510
   End
End
Attribute VB_Name = "frmOldFME"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmFME
' Gestion des FME
' 12/07/1998 PV
' 15/08/1998 PV BDActiveChamp

Option Explicit

Private cFME As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition

Private Const sTable = "fme"


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
        MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, App.Title
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cFMEQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cFMEQuery.OpenCurseur "select * from fme where " & sWP & " order by fme_numfme"
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cFME Is Nothing Then cFME.CloseCurseur
  Set cFME = cFMEQuery
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cFME.EOF And cFME.BOF) Then
    iMode = meNavigate
    SetMessage
    btnDestinataires.Enabled = True
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  bdSél.SetFocus
End Sub


' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  bOkValeurs = False
  
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim sType As String
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cFMEAdd As New BDCurseur
  cFMEAdd.OpenCurseur "select * from fme where fme_numfme=0"
  cFMEAdd.AddNew
  cFMEAdd!fme_idmodif = sBDIdModif
  cFMEAdd!fme_tscreation = Now
  If Not bPrépareEditAdd(cFMEAdd, colColonnes, colChamps) Then cFMEAdd.CloseCurseur: Exit Sub
  cFMEAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  ' On lit le max, faute de pouvoir obtenir le serial réel…
  Dim iSérie As Long
  iSérie = BDCurseurExpress("select max(fme_numfme) from fme")

  If Not cFME Is Nothing Then cFME.CloseCurseur
  Set cFME = New BDCurseur
  cFME.OpenCurseur "select * from fme where fme_numfme=" & iSérie
  cFME.MoveFirst
  
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  btnDestinataires.Enabled = True
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Dim sType As String
  Assert iMode = meChange
  Assert Not cFME Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cFME.Edit
  cFME!fme_idmodif = sBDIdModif
  If Not bPrépareEditAdd(cFME, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements

  btnDestinataires.Enabled = True

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:   ValidateAdd
    Case meQuery: ValidateQuery
  End Select
End Sub



Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop

  ActiveFormulaire False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cFME Is Nothing Then
    If Not (cFME.EOF And cFME.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  btnDestinataires.Enabled = (iMode = meNavigate)
  
  SetMessage
  SetStatus
  
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
  btnDestinataires.Enabled = False
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("fme_numfme").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing
  
  If cFME.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  btnDestinataires.Enabled = False
  
  ActiveFormulaire True
  ActiveChamp "fme_numfme", False
  ActiveChamp "fme_idmodif", False
  ActiveChamp "fme_tscreation", False
  ActiveChamp "timestamp", False
  
  colChamps("fme_origine").SetFocus
  AutoSelect colChamps("fme_origine"), True
  bdSél.TabStop = False
  
  iMode = meChange
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  btnDestinataires.Enabled = False
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "fme_numfme", False
  ActiveChamp "fme_idmodif", False
  ActiveChamp "fme_tscreation", False
  ActiveChamp "timestamp", False

  colChamps("fme_origine").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing

  If cFME.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from fmedest where fmd_numfme=" & cFME!fme_numfme)
  If iNb > 0 Then
    MsgBox "Vous ne pouvez pas supprimer cette FME, il y " & iNb & " destinataires rattachés." & vbCrLf & vbCrLf & "Supprimez les destinataires avant de supprimer la FME.", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cFME.Delete
  cFME.MoveNext
  
  ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = "fme"
  cSD!sd_timestamp = Now
  cSD!sd_wherepart = "fme_numfme=" & sFormToSQL(colChamps("fme_numfme"), BDTypeINTEGER)
  cSD.Update
  cSD.CloseCurseur
  
  If cFME.EOF Then
    cFME.MovePrevious
    If cFME.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdSél.ActiveMouvements iMode = meNavigate
  btnDestinataires.Enabled = iMode = meNavigate
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing

  bdSél.ButtonEnabled("First") = cFME.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cFME.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cFME.EOF
  bdSél.ButtonEnabled("Last") = Not cFME.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cFME.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cFME.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cFME.MoveNext
  AjusteMouvements
  If cFME.EOF Then cFME.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cFME.MovePrevious
  AjusteMouvements
  If cFME.BOF Then cFME.MoveFirst
  SynchroniseFormulaire
End Sub



'=================================================================================
' Actions du sélecteur

Private Sub bdSél_ActionAdd():      ActionAdd:      End Sub
Private Sub bdSél_ActionCancel():   ActionCancel:   End Sub
Private Sub bdSél_ActionChange():   ActionChange:   End Sub
Private Sub bdSél_ActionDelete():   ActionDelete:   End Sub
Private Sub bdSél_ActionFirst():    ActionFirst:    End Sub
Private Sub bdSél_ActionLast():     ActionLast:     End Sub
Private Sub bdSél_ActionNext():     ActionNext:     End Sub
Private Sub bdSél_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdSél_ActionQuery():    ActionQuery:    End Sub
Private Sub bdSél_ActionValidate(): ActionValidate: End Sub


'=================================================================================
' Détail

Private Sub btnDestinataires_Click()
  frmDest.AfficheDestinataires cFME!fme_numfme
End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSél.KeyDown KeyCode
End Sub

Private Sub Form_Keypress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable "fme", colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  
  ' Chargement des combos
  ' …
  
  
  ' Formulaire en mode initial
  Set cFME = Nothing
  ActiveFormulaire False
  With bdSél
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  iMode = meEmpty
  SetMessage
  SetStatus
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
    Cancel = True
    Exit Sub
  End If
  
  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cFME Is Nothing Then cFME.CloseCurseur
  MDIFEU.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cFME Is Nothing Then
    EffaceFormulaire
  ElseIf cFME.BOF And cFME.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cFME.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cFME.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cFME.AbsolutePosition
    
    lwDestinataires.ListItems.Clear
       
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
    cFME.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


Private Sub lwDestinataires_DblClick()
  If Not lwDestinataires.SelectedItem Is Nothing Then
    frmDest.AfficheDestinataires cFME!fme_numfme, lwDestinataires.SelectedItem.Text
  End If
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  ' On affiche la liste des destinataires
  If lwDestinataires.ListItems.Count = 0 Then
    Dim itmX As ListItem
    Dim cDest As New BDCurseur
    cDest.OpenCurseur "select fmd_numcr,cr_nom,fmd_frequence from fmedest,centrereception where fmd_numfme=" & cFME!fme_numfme & " and cr_numcr=fmd_numcr order by fmd_numcr"
    If cDest.EOF Then
      Set itmX = lwDestinataires.ListItems.Add
      itmX.Text = "Aucun destinataire."
    Else
      While Not cDest.EOF
        Set itmX = lwDestinataires.ListItems.Add
        itmX.Text = cDest!fmd_numcr
        itmX.SubItems(1) = cDest!cr_nom
        itmX.SubItems(2) = cDest!fmd_frequence
        cDest.MoveNext
      Wend
    End If
    cDest.CloseCurseur
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdSél.NumRec = ""
  lwDestinataires.ListItems.Clear
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
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub


'=================================================================================

Private Sub txtChamp_Change(Index As Integer)
  ' Titre en majuscules
  If txtChamp(Index).DataField = "fme_titre" Then ToMaj txtChamp(Index)
End Sub


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cFME, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression des données

Public Sub Imprime()
  If cFME Is Nothing Then
    MsgBox "Effectuez une sélection avant d'imprimer les données.", vbExclamation, App.Title
    Exit Sub
  End If
  
  EffaceFormulaire
  SetMessage "Impression en cours…"
  
  Dim sData As String
  Dim t As Control, bFirst As Boolean
  
  Screen.MousePointer = vbHourglass
  cFME.MoveFirst
  bFirst = True
  Do Until cFME.EOF
    SynchroniseFormulaire   ' Affiche le premier enregistrement
    If bFirst Then
      Printer.Orientation = vbPRORPortrait
    Else
      Printer.NewPage
    End If
    Imprime1FME
    bFirst = False
    cFME.MoveNext
  Loop
  
  cFME.MoveFirst
  Screen.MousePointer = vbDefault
  EffaceFormulaire
  Printer.EndDoc
  
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


Private Sub Imprime1FME()
  Printer.Font = "Courier New"
  Printer.FontSize = 10
  
  Printer.FontBold = True
  Printer.Print "FICHE MODALITÉ D'ENVOI"
  Printer.FontBold = False
  
  Printer.Print
  Printer.Print "N°      "; cFME!fme_numfme
  Printer.Print "Titre   "; cFME!fme_titre
  Printer.Print "Comment "; NV(cFME!fme_comment)
  
  Printer.Print
  Printer.FontUnderline = True
  Printer.Print "Destinataires"
  Printer.FontUnderline = False
  
  Dim cDest As New BDCurseur
  cDest.OpenCurseur "select fmd_numfme,fmd_numcr,cr_nom,cr_rue,cr_loc,cr_cpost,cr_bdist,cr_interloc,fmd_frequence,fmd_comment from fmedest,centrereception where fmd_numfme=" & cFME!fme_numfme & " and cr_numcr=fmd_numcr order by fmd_numcr"
  While Not cDest.EOF
    Printer.Print
    Printer.FontBold = True
    Printer.Print cDest!fmd_numcr & ": " & cDest!cr_nom
    If Not IsNull(cDest!cr_rue) Then Printer.Print NV(cDest!cr_rue)
    If Not IsNull(cDest!cr_loc) Then Printer.Print NV(cDest!cr_loc)
    If Not IsNull(cDest!cr_cpost) Or Not IsNull(cDest!cr_bdist) Then Printer.Print NV(cDest!cr_cpost); " "; NV(cDest!cr_bdist)
    If Not IsNull(cDest!cr_interloc) Then Printer.Print "Interlocuteur: "; NV(cDest!cr_interloc)
    Printer.Print
    Printer.FontBold = False
    Printer.Print "Fréquence "; cDest!fmd_frequence
    Printer.Print "Comment   "; NV(cDest!fmd_comment)
    
    Dim cDoc As New BDCurseur
    cDoc.OpenCurseur "select fmo_classe,fmo_nbex,fmo_options,fmo_comment from fmedoc where fmo_numfme=" & cDest!fmd_numfme & " and fmo_numcr=" & cDest!fmd_numcr
    While Not cDoc.EOF
      Printer.Print "   Classe  "; cDoc!fmo_classe
      Printer.Print "   NbEx    "; cDoc!fmo_nbex
      Printer.Print "   Options "; NV(cDoc!fmo_options)
      Printer.Print "   Comment "; NV(cDoc!fmo_comment)
      
      cDoc.MoveNext
    Wend
    cDoc.CloseCurseur

    cDest.MoveNext
  Wend
  cDest.CloseCurseur
End Sub

