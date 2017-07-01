VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmCodesTVA 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des codes TVA"
   ClientHeight    =   2775
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8805
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmCodesTVA.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   185
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   587
   Tag             =   "Données"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   3840
      Top             =   480
   End
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   735
      Left            =   60
      TabIndex        =   9
      Top             =   1980
      Width           =   8700
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1440
         TabIndex        =   5
         Tag             =   "Champ interne de synchronisation, format AAAA-MM-JJ HH:MM:SS"
         Top             =   240
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   10
         Top             =   300
         Width           =   1155
      End
   End
   Begin TablesFacturation.BDSélecteur bdSél 
      Align           =   3  'Align Left
      Height          =   435
      Left            =   0
      TabIndex        =   11
      Top             =   0
      Width           =   9270
      _ExtentX        =   16351
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "tva_codecompta"
      Height          =   315
      Index           =   6
      Left            =   1500
      TabIndex        =   4
      Tag             =   "Code absolu de TVA de la compta"
      Top             =   1560
      Width           =   480
      _ExtentX        =   847
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   2
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*tva_comptag"
      Height          =   315
      Index           =   5
      Left            =   1500
      TabIndex        =   3
      Tag             =   "Compte général de ventilation"
      Top             =   1200
      Width           =   1365
      _ExtentX        =   2408
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   10
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*tva_taux"
      Height          =   315
      Index           =   4
      Left            =   1500
      TabIndex        =   2
      Tag             =   "Valeur du taux (ex: 18,6)"
      Top             =   840
      Width           =   900
      _ExtentX        =   1588
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   6
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*tva_numtaux"
      Height          =   315
      Index           =   0
      Left            =   1500
      TabIndex        =   1
      Tag             =   "Code du taux de TVA, de 1 à 9"
      Top             =   480
      Width           =   480
      _ExtentX        =   847
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "(obsolète pour Sage 500)"
      Height          =   210
      Index           =   2
      Left            =   2160
      TabIndex        =   15
      Top             =   1620
      Width           =   2430
   End
   Begin VB.Label lblWarning 
      BackColor       =   &H00000000&
      Caption         =   $"frmCodesTVA.frx":014A
      ForeColor       =   &H00FFFFFF&
      Height          =   885
      Index           =   2
      Left            =   4800
      TabIndex        =   14
      Top             =   780
      Width           =   3930
   End
   Begin VB.Label lblWarning 
      BackColor       =   &H00000080&
      Caption         =   "ATTENTION !"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   210
      Index           =   1
      Left            =   4800
      TabIndex        =   13
      Top             =   540
      Width           =   3930
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "%"
      Height          =   210
      Index           =   1
      Left            =   2520
      TabIndex        =   12
      Top             =   900
      Width           =   195
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Code compta :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   8
      Top             =   1620
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "ComptaG :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   7
      Top             =   1260
      Width           =   1005
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Taux :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   6
      Top             =   900
      Width           =   585
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
Attribute VB_Name = "frmCodesTVA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCodesTVA
' Feuille de gestion des codes TVA
' 25/08/1999 NC
' 17/05/2001 PV bopérationGénérale

Option Explicit

Private cTva As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean            ' Vrai si changement sur la sélection

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "tva"


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  Dim bWPIntègreEtat As Boolean
  
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
  
  Dim cTvaQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from tva where " & sWP
  
  cTvaQuery.OpenCurseur sQuery
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cTva Is Nothing Then cTva.CloseCurseur
  Set cTva = cTvaQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cTva.EOF And cTva.BOF) Then
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


' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  
  bOkValeurs = False
  
'  ' On contrôle que le pays est valide
'  If bdcPays.ListIndex < 0 Then
'    bdcPays.Synchronise
'    If bdcPays.ListIndex < 0 Then
'      MsgBox "Pays inconnu !", vbExclamation, App.Title
'      bdcPays.SetFocus
'      Exit Function
'    End If
'  End If
  

  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select tva_numtaux from tva where tva_taux=" & sFormToSQL(colChamps("tva_taux"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("tva_numtaux") Then
    MsgBox "ATTENTION - Ce tva existe déjà sous le n° " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


' Vérifie que les champs contiennent des valeurs légales pour une OpGen
' La valeur vide est toujours légale
Private Function bOkValeursOpGen() As Boolean
  Dim iOld As Integer
  
  bOkValeursOpGen = False
  
'  If bdcPays <> "" Then
'    bdcPays.Synchronise
'    If bdcPays.ListIndex < 0 Then
'      MsgBox "Pays inconnu !", vbExclamation, App.Title
'      bdcPays.SetFocus
'      Exit Function
'    End If
'  End If
'

  ' Tous les tests ont été passés avec succès !
  bOkValeursOpGen = True
End Function



Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

' Génération du n° de série
  
  Dim cTvaAdd As New BDCurseur
  cTvaAdd.OpenCurseur "select * from tva where tva_numtaux=0"
  cTvaAdd.AddNew

  Dim cnumtva As New BDCurseur
  cnumtva.OpenCurseur "select max (tva_numtaux) from tva"
  colChamps("tva_numtaux") = cnumtva.Fields(0) + 1
  cTvaAdd!tva_numtaux = cnumtva.Fields(0) + 1
  cnumtva.CloseCurseur
  
' Seuls les champs actif sont mis à jour
  ActiveChamp "tva_numtaux", True
  
  If Not bPrépareEditAdd(cTvaAdd, colColonnes, colChamps) Then
    cTvaAdd.CloseCurseur
    ActiveChamp "tva_numtaux", False
    Exit Sub
  End If
  cTvaAdd.CloseCurseur
 
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cTva Is Nothing Then cTva.CloseCurseur
  Set cTva = New BDCurseur
  
  sFinalWP = "tva_numtaux=" & colChamps("tva_numtaux")
  sQuery = "select * from tva where " & sFinalWP
  cTva.OpenCurseur sQuery
  cTva.MoveFirst
  
  BDActiveFormulaire colChamps, False
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
  Assert Not cTva Is Nothing

  If bOpGénérale Then
    Dim sSQL As String
    
    If Not bOkValeursOpGen Then Exit Sub
    
    sSQL = "update tva set "
    Dim t As Control, iNbChamp As Integer
    Dim sVal As String, sValSQL As String, sValInterne As String, sMsg As String
    For Each t In colChamps
      If t.Text = "=" Then
        sSQL = sSQL & t.DataField & "=NULL"
        iNbChamp = iNbChamp + 1
      ElseIf t.Text <> "" Then
        bOkValType t.Text, colColonnes(t.DataField).iType, sValSQL, sValInterne, sMsg
        If iNbChamp > 0 Then sSQL = sSQL & ","
        sSQL = sSQL & t.DataField & "=" & sValSQL
        iNbChamp = iNbChamp + 1
      End If
    Next
    If iNbChamp = 0 Then
      MsgBox "Opération générale sans modification !" & vbCrLf & "Vous devez modifier au moins un champ pour lancer une opération générale, sinon annulez l'opération générale en cours.", vbExclamation, App.Title
      Exit Sub
    End If
    
    sSQL = sSQL & ",timestamp=current,tva_datemodif=current,tva_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",tva_opermodif=" & iNumOpérateur & " where " & sFinalWP
    
    Screen.MousePointer = vbHourglass
    If Not bOpérationGénérale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    ' On ré-exécute la requête, sinon la bufférisation locale empêche l'affichage des champs modifiés
    SetMessage "Lecture des données modifiées, patientez…"
    Screen.MousePointer = vbHourglass
    If Not cTva Is Nothing Then cTva.CloseCurseur
    cTva.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cTva.Edit
      
    ' Traçabilité ancien style
'    InitTraçabilité colChamps, "grf", False
'    ActiveTraçabilité True     ' Pour mettre à jour la base
'
    If Not bPrépareEditAdd(cTva, colColonnes, colChamps) Then
      ActiveTraçabilité False
      Exit Sub
    End If
  
  End If
  
  BDActiveFormulaire colChamps, False
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
  ActiveTimer mtStop
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop

  BDActiveFormulaire colChamps, False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cTva Is Nothing Then
    If Not (cTva.EOF And cTva.BOF) Then
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
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True
  
  colChamps("tva_numtaux").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cTva Is Nothing
  
  ' Opération générale = Shift+Changement
  bOpGénérale = bShiftPressed
  
  colChamps("tva_taux").SetFocus
  AutoSelect colChamps("tva_taux"), True
  
  If cTva.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "tva_numtaux", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  If bOpGénérale Then
    ActiveChamp "tva_taux", False
  End If
  
  iMode = meChange
  
  If bOpGénérale Then
    SetMessage "OPÉRATION GÉNÉRALE - Définissez les champs modifiés, puis validez [Entrée] ou abandonnez [Échap]"
    EffaceFormulaire
  Else
    SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
  End If
End Sub


Public Sub ActionAdd()
  colChamps("tva_taux").SetFocus
  
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "tva_numtaux", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  ' Valeurs par défaut
'  bdcPays = iSystèmePays
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cTva Is Nothing
  
  If cTva.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cTva.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' On place un enregistrement dans synchrodelete
'  Dim cSD As New BDCurseur
'  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
'  cSD.AddNew
'  cSD!sd_table = sTable
'  cSD!sd_timestamp = BDTime
'  cSD!sd_wherepart = "tva_numtaux=" & sFormToSQL(colChamps("tva_numtaux"), BDTypeINTEGER)
'  cSD.Update
'  cSD.CloseCurseur
  
  cTva.MoveNext
  If cTva.EOF Then
    cTva.MovePrevious
    If cTva.BOF Then
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

Private Sub ActiveTraçabilité(bEnable As Boolean)
'  ActiveChamp "tva_datecreat", bEnable
'  ActiveChamp "tva_heurecreat", bEnable
'  ActiveChamp "tva_opercreat", bEnable
'  ActiveChamp "tva_datemodif", bEnable
'  ActiveChamp "tva_heuremodif", bEnable
'  ActiveChamp "tva_opermodif", bEnable
'  ActiveChamp "tva_tsvalid", bEnable
'  ActiveChamp "tva_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cTva Is Nothing

  bdSél.ButtonEnabled("First") = cTva.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cTva.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cTva.EOF
  bdSél.ButtonEnabled("Last") = Not cTva.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cTva.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cTva.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cTva.MoveNext
  AjusteMouvements
  If cTva.EOF Then cTva.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cTva.MovePrevious
  AjusteMouvements
  If cTva.BOF Then cTva.MoveFirst
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

' Filtrage des Entrée intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas présente dans la base de données courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  Show
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos
'  Dim p As Pays
'  For Each p In colPays
'    bdcPays.AddItem p.pay_pays, p.pay_libelle
'  Next
'
'  Dim u As Utilisateur
'  For Each u In colUtilisateur
'    bdcOperCreat.AddItem u.uti_numuti, u.uti_taux
'    bdcOperModif.AddItem u.uti_numuti, u.uti_taux
'    bdcOperValid.AddItem u.uti_numuti, u.uti_taux
'  Next

  
  ' Formulaire en mode initial
  Set cTva = Nothing
  BDActiveFormulaire colChamps, False
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  bdSél.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
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
  If Not cTva Is Nothing Then cTva.CloseCurseur
  MDIFacturation.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub

' Aide des options
Private Sub lblOptions_Click(Index As Integer)
  If Index = 1 Then
    FileShellExecute hWnd, "http://www.silliker/microbsoft/secretariat/frmoptcr.htm"
  Else
    FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/optlabo.htm"
  End If
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cTva Is Nothing Then
    EffaceFormulaire
  ElseIf cTva.BOF And cTva.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cTva.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cTva.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cTva.AbsolutePosition
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cTva.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  'NC
  '  If bdcTva.ListIndex < 0 Then
  '   Synchrobanque
  '  End If
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdSél.NumRec = ""
End Sub


' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop:    timSatellites.Enabled = False
    Case mtLent:    timSatellites.Interval = 1000:  timSatellites.Enabled = True
    Case mtRapide:  timSatellites.Interval = 250:   timSatellites.Enabled = True
  End Select
End Sub


Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
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

'Private Sub bdcPays_GotFocus()
'  SetStatus bdcPays.Tag
'End Sub

'Private Sub bdcPays_LostFocus()
'  bdcPays.Synchronise
'End Sub

'NC
'Private Sub bdcTva_GotFocus()
'  SetStatus bdcTva.Tag
'End Sub

'NC
'Private Sub bdcTva_LostFocus()
'  If bdcTva <> "" Then
'    bdcTva.Synchronise
'    If bdcTva.ListIndex < 0 Then Synchrobanque
'  End If
'End Sub

'NC
'Private Sub Synchrobanque()
'  Dim iNum As Long, sNom As String
'  iNum = Int(Val(bdcTva))
'  sNom = BDCurseurExpress("select tva_taux from tva where tva_numtaux=" & iNum)
'  If sNom <> "" Then bdcTva.AddItem iNum, sNom
'End Sub

'Private Sub bdcOperCreat_GotFocus()
'  SetStatus bdcOperCreat.Tag
'End Sub
'
'Private Sub bdcOperModif_GotFocus()
'  SetStatus bdcOperModif.Tag
'End Sub
'
'Private Sub bdcOperValid_GotFocus()
'  SetStatus bdcOperValid.Tag
'End Sub
'

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
  BDCopieSélection cTva, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  Etat True
End Sub

Public Sub Aperçu()
  Etat False
End Sub

Private Sub Etat(ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from tva where " & sFinalWP
  BDEtat sSQL, drCTva, bImpression
End Sub

