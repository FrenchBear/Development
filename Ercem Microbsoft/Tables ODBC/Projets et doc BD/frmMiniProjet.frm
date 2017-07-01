VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMiniProjet 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des mini-projets"
   ClientHeight    =   5535
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8775
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMiniProjet.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   369
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   585
   Tag             =   "Données"
   Begin MSComDlg.CommonDialog cdImpr 
      Left            =   60
      Top             =   1620
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "inc_idmodif"
      Height          =   315
      Index           =   6
      Left            =   2040
      TabIndex        =   19
      Tag             =   "Origine de la dernière modification"
      Top             =   4800
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "inc_modetatle"
      Height          =   315
      Index           =   5
      Left            =   6660
      TabIndex        =   13
      Tag             =   "Date+heure de dernière modification de l'état"
      Top             =   3000
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "inc_resolution"
      Height          =   1035
      Index           =   4
      Left            =   2040
      MaxLength       =   250
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   17
      Tag             =   "Commentaires sur la résolution de l'incident"
      Top             =   3720
      Width           =   6690
   End
   Begin VB.TextBox txtSoumisLe 
      DataField       =   "*inc_soumisle"
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "dd/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1036
         SubFormatType   =   3
      EndProperty
      Height          =   315
      Left            =   2040
      TabIndex        =   9
      Tag             =   "Date+heure de l'incident"
      Top             =   2640
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "inc_description"
      Height          =   1035
      Index           =   2
      Left            =   2040
      MaxLength       =   250
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Tag             =   "Complément de description / Description détaillée"
      Top             =   1200
      Width           =   6690
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*inc_titre"
      Height          =   315
      Index           =   1
      Left            =   2040
      MaxLength       =   60
      TabIndex        =   3
      Tag             =   "Titre (description en une ligne)"
      Top             =   840
      Width           =   6690
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   2040
      TabIndex        =   21
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   5160
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*inc_serie"
      Height          =   315
      Index           =   0
      Left            =   2040
      TabIndex        =   1
      Tag             =   "N° de série interne de l'incident"
      Top             =   480
      Width           =   1095
   End
   Begin Projets.BDCombo bdcSoumisPar 
      Height          =   330
      Left            =   2040
      TabIndex        =   7
      Tag             =   "Personne qui a signalé l'incident"
      Top             =   2280
      Width           =   6675
      _extentx        =   11774
      _extenty        =   582
      font            =   "frmMiniProjet.frx":0442
      datafield       =   "*inc_soumispar"
   End
   Begin Projets.BDCombo bdcEtat 
      Height          =   330
      Left            =   2040
      TabIndex        =   11
      Tag             =   "Avancement du traitement de l'incident"
      Top             =   3000
      Width           =   3255
      _extentx        =   5741
      _extenty        =   582
      font            =   "frmMiniProjet.frx":046A
      datafield       =   "*inc_etat"
   End
   Begin Projets.BDCombo bdcTraitéPar 
      Height          =   330
      Left            =   2040
      TabIndex        =   15
      Tag             =   "Personne assurant le traitement de l'incident"
      Top             =   3360
      Width           =   6675
      _extentx        =   11774
      _extenty        =   582
      font            =   "frmMiniProjet.frx":0492
      datafield       =   "inc_traitepar"
   End
   Begin Projets.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   22
      Top             =   0
      Width           =   8775
      _extentx        =   15478
      _extenty        =   767
      font            =   "frmMiniProjet.frx":04BA
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   18
      Top             =   4860
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Description :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   1185
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   20
      Top             =   5220
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Modifié le :"
      Height          =   210
      Index           =   11
      Left            =   5520
      TabIndex        =   12
      Top             =   3060
      Width           =   1020
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Résolution :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   16
      Top             =   3780
      Width           =   1125
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Traité par :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   14
      Top             =   3420
      Width           =   1050
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "État :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   10
      Top             =   3060
      Width           =   525
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Soumis le :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   8
      Top             =   2700
      Width           =   1035
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Soumis par :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   2340
      Width           =   1185
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Serial :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   660
   End
End
Attribute VB_Name = "frmMiniProjet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmMiniProjet
' Gestion des mini-projets (ex-incidents)
'  4/01/1999 PV
' 15/01/1999 PV Valeurs par défaut lors d'un ajout (soumis par, soumis le); TrimCrLf
'  1/04/1999 PV Impressions
' 22/04/1999 PV Incidents -> miniprojets; changement de l'orientation de l'imprimante

Option Explicit

Private cInc As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition
Private sFinalSQL As String               ' Requête SQL courante

Private Const sTable = "incident"


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
  
  ' MsgBox "Where-part: " & sWP
  
  Dim cIncQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from incident where " & sWP & " order by inc_serie"
  cIncQuery.OpenCurseur sSQL
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
  If Not cInc Is Nothing Then cInc.CloseCurseur
  Set cInc = cIncQuery
  sFinalSQL = sSQL
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cInc.EOF And cInc.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  bdSél.SetFocus
End Sub

' Supprime les CrLf en fin de chaîne
Sub TrimCrLf(c As TextBox)
  Do While Len(c) > 2
    If Right(c, Len(c) - 1) = vbCrLf Then
      c = Left(c, Len(c) - 2)
    Else
      Exit Do
    End If
  Loop
End Sub

' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  Dim i As Integer
  
  bOkValeurs = False
  
  ' On supprime les retours à la ligne en fin de description et de commentaires
  TrimCrLf colChamps("inc_description")
  TrimCrLf colChamps("inc_resolution")
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cIncAdd As New BDCurseur
  cIncAdd.OpenCurseur "select * from incident where inc_serie=0"
  cIncAdd.AddNew
  If Not bPrépareEditAdd(cIncAdd, colColonnes, colChamps) Then cIncAdd.CloseCurseur: Exit Sub
  cIncAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cInc Is Nothing Then cInc.CloseCurseur
  Set cInc = New BDCurseur
  
  ' triche: pour récupérer un sérial, on lit le max…
  Dim cMax As New BDCurseur, iMax As Long
  cMax.OpenCurseur "select max(inc_serie) from incident"
  If cMax.EOF Then iMax = 1 Else iMax = cMax(0)
  cMax.CloseCurseur
  sFinalSQL = "select * from incident where inc_serie=" & iMax
  cInc.OpenCurseur sFinalSQL
  cInc.MoveFirst
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub

Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cInc Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cInc.Edit
  If Not bPrépareEditAdd(cInc, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub

Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub

Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cInc Is Nothing Then
    If Not (cInc.EOF And cInc.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
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
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("inc_serie").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub

Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing
  
  If cInc.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "inc_serie", False
  ActiveChamp "inc_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("inc_titre").SetFocus
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
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "inc_serie", False
  ActiveChamp "inc_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("inc_soumisle") = Today
  colChamps("inc_soumispar") = iNumOpérateur

  colChamps("inc_titre").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub

Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing

  If cInc.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cInc.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cInc.MoveNext
  If cInc.EOF Then
    cInc.MovePrevious
    If cInc.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing

  bdSél.ButtonEnabled("First") = cInc.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cInc.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cInc.EOF
  bdSél.ButtonEnabled("Last") = Not cInc.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cInc.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cInc.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cInc.MoveNext
  AjusteMouvements
  If cInc.EOF Then cInc.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cInc.MovePrevious
  AjusteMouvements
  If cInc.BOF Then cInc.MoveFirst
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
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcSoumisPar.AddItem u.uti_numuti, u.uti_nom
    bdcTraitéPar.AddItem u.uti_numuti, u.uti_nom
  Next
  bdcEtat.AddItem 0, "Soumis"
  bdcEtat.AddItem 1, "Traitement en cours"
  bdcEtat.AddItem 2, "Traité"
  bdcEtat.AddItem 3, "Pas/Plus de suivi"
  
  
  
  ' Formulaire en mode initial
  Set cInc = Nothing
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
  sFinalSQL = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If
  
  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
' SetPrinterOrientation cdlPortrait

  If Not cInc Is Nothing Then cInc.CloseCurseur
  MDIProjets.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cInc Is Nothing Then
    EffaceFormulaire
  ElseIf cInc.BOF And cInc.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cInc.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cInc.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cInc.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cInc.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub

Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
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

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub


Private Sub bdcSoumisPar_GotFocus()
  SetStatus bdcSoumisPar.Tag
End Sub

Private Sub bdcSoumisPar_LostFocus()
  bdcSoumisPar.Synchronise
End Sub


Private Sub bdcTraitéPar_GotFocus()
  SetStatus bdcTraitéPar.Tag
End Sub

Private Sub bdcTraitéPar_LostFocus()
  bdcTraitéPar.Synchronise
End Sub


Private Sub bdcEtat_GotFocus()
  SetStatus bdcEtat.Tag
End Sub

Private Sub bdcEtat_LostFocus()
  bdcEtat.Synchronise
End Sub


Private Sub txtChamp_Change(Index As Integer)
  ' Pas de champs en majuscules
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
  BDCopieSélection cInc, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  SetPrinterOrientation cdlLandscape
  BDEtat sFinalSQL, drMiniProjet, True
  SetPrinterOrientation cdlPortrait
End Sub

Public Sub Aperçu()
  SetPrinterOrientation cdlLandscape
  BDEtat sFinalSQL, drMiniProjet, False
  SetPrinterOrientation cdlPortrait
End Sub


Private Sub SetPrinterOrientation(Orientation As PrinterOrientationConstants)
  cdImpr.Orientation = Orientation
  SendKeys "{Enter}"
  cdImpr.ShowPrinter
End Sub

