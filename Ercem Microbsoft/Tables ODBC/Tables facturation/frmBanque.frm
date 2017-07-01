VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmBanque 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des banques"
   ClientHeight    =   3150
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9120
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmBanque.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   210
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   608
   Tag             =   "Données"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7080
      Top             =   1020
   End
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   735
      Left            =   60
      TabIndex        =   11
      Top             =   2340
      Width           =   9015
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1680
         TabIndex        =   6
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
         TabIndex        =   12
         Top             =   300
         Width           =   1155
      End
   End
   Begin TablesFacturation.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   13
      Top             =   0
      Width           =   9120
      _ExtentX        =   16087
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
      DataField       =   "ban_l4"
      Height          =   315
      Index           =   16
      Left            =   1740
      TabIndex        =   5
      Tag             =   "4ème ligne de banque"
      Top             =   1920
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   35
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "ban_l3"
      Height          =   315
      Index           =   6
      Left            =   1740
      TabIndex        =   4
      Tag             =   "3ème ligne de banque"
      Top             =   1560
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   35
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "ban_l2"
      Height          =   315
      Index           =   5
      Left            =   1740
      TabIndex        =   3
      Tag             =   "2ème ligne de banque"
      Top             =   1200
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   35
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*^ban_l1"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   2
      Tag             =   "1ère ligne de banque"
      Top             =   840
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   35
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*ban_numbanque"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
      Tag             =   "Numéro de série du groupement"
      Top             =   480
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Ligne 3 :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   9
      Top             =   1620
      Width           =   825
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Ligne 2 :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   8
      Top             =   1260
      Width           =   825
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Ligne 1 :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   7
      Top             =   900
      Width           =   825
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Ligne 4 :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   10
      Top             =   1980
      Width           =   825
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
Attribute VB_Name = "frmBanque"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmBanque
' Feuille de gestion des banques
' 25/08/1999 NC
' 17/05/2001 PV bopérationGénérale


Option Explicit

Private cBanque As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean            ' Vrai si changement sur la sélection

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "banque"


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
  
  Dim cBanqueQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from banque where " & sWP
  
  cBanqueQuery.OpenCurseur sQuery
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
  If Not cBanque Is Nothing Then cBanque.CloseCurseur
  Set cBanque = cBanqueQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cBanque.EOF And cBanque.BOF) Then
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
  iSer = BDCurseurExpress("select ban_numbanque from banque where ban_l1=" & sFormToSQL(colChamps("ban_l1"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("ban_numbanque") Then
    MsgBox "ATTENTION - Ce banque existe déjà sous le n° " & iSer, vbExclamation, App.Title
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
  
  Dim cBanqueAdd As New BDCurseur
  cBanqueAdd.OpenCurseur "select * from banque where ban_numbanque=0"
  cBanqueAdd.AddNew

  Dim cnumbanque As New BDCurseur
  cnumbanque.OpenCurseur "select max(ban_numbanque) from banque"
  If IsNull(cnumbanque.Fields(0)) Then
    colChamps("ban_numbanque") = "1"
  Else
    colChamps("ban_numbanque") = cnumbanque.Fields(0) + 1
  End If
  cBanqueAdd!ban_numbanque = cnumbanque.Fields(0) + 1
  cnumbanque.CloseCurseur
  
' Seuls les champs actif sont mis à jour
  ActiveChamp "ban_numbanque", True
  
  If Not bPrépareEditAdd(cBanqueAdd, colColonnes, colChamps) Then
    cBanqueAdd.CloseCurseur
    ActiveChamp "ban_numbanque", False
    Exit Sub
  End If
  cBanqueAdd.CloseCurseur
 
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cBanque Is Nothing Then cBanque.CloseCurseur
  Set cBanque = New BDCurseur
  
  sFinalWP = "ban_numbanque=" & colChamps("ban_numbanque")
  sQuery = "select * from banque where " & sFinalWP
  cBanque.OpenCurseur sQuery
  cBanque.MoveFirst
  
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
  Assert Not cBanque Is Nothing

  If bOpGénérale Then
    Dim sSQL As String
    
    If Not bOkValeursOpGen Then Exit Sub
    
    sSQL = "update banque set "
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
    
    sSQL = sSQL & ",timestamp=current,ban_datemodif=current,ban_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",ban_opermodif=" & iNumOpérateur & " where " & sFinalWP
    
    Screen.MousePointer = vbHourglass
    If Not bOpérationGénérale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    ' On ré-exécute la requête, sinon la bufférisation locale empêche l'affichage des champs modifiés
    SetMessage "Lecture des données modifiées, patientez…"
    Screen.MousePointer = vbHourglass
    If Not cBanque Is Nothing Then cBanque.CloseCurseur
    cBanque.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cBanque.Edit
      
    ' Traçabilité ancien style
'    InitTraçabilité colChamps, "grf", False
'    ActiveTraçabilité True     ' Pour mettre à jour la base
    
    If Not bPrépareEditAdd(cBanque, colColonnes, colChamps) Then
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
  If Not cBanque Is Nothing Then
    If Not (cBanque.EOF And cBanque.BOF) Then
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
  
  colChamps("ban_numbanque").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cBanque Is Nothing
  
  ' Opération générale = Shift+Changement
  bOpGénérale = bShiftPressed
  
  colChamps("ban_l1").SetFocus
  AutoSelect colChamps("ban_l1"), True
  
  If cBanque.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ban_numbanque", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  If bOpGénérale Then
    ActiveChamp "ban_l1", False
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
  colChamps("ban_l1").SetFocus
  
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ban_numbanque", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  ' Valeurs par défaut
'  bdcPays = iSystèmePays
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cBanque Is Nothing
  
  If cBanque.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cBanque.Delete
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
'  cSD!sd_wherepart = "ban_numbanque=" & sFormToSQL(colChamps("ban_numbanque"), BDTypeINTEGER)
'  cSD.Update
'  cSD.CloseCurseur
  
  cBanque.MoveNext
  If cBanque.EOF Then
    cBanque.MovePrevious
    If cBanque.BOF Then
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
'  ActiveChamp "ban_datecreat", bEnable
'  ActiveChamp "ban_heurecreat", bEnable
'  ActiveChamp "ban_opercreat", bEnable
'  ActiveChamp "ban_datemodif", bEnable
'  ActiveChamp "ban_heuremodif", bEnable
'  ActiveChamp "ban_opermodif", bEnable
'  ActiveChamp "ban_tsvalid", bEnable
'  ActiveChamp "ban_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cBanque Is Nothing

  bdSél.ButtonEnabled("First") = cBanque.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cBanque.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cBanque.EOF
  bdSél.ButtonEnabled("Last") = Not cBanque.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cBanque.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cBanque.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cBanque.MoveNext
  AjusteMouvements
  If cBanque.EOF Then cBanque.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cBanque.MovePrevious
  AjusteMouvements
  If cBanque.BOF Then cBanque.MoveFirst
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
'    bdcOperCreat.AddItem u.uti_numuti, u.uti_l1
'    bdcOperModif.AddItem u.uti_numuti, u.uti_l1
'    bdcOperValid.AddItem u.uti_numuti, u.uti_l1
'  Next

  
  ' Formulaire en mode initial
  Set cBanque = Nothing
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
  If Not cBanque Is Nothing Then cBanque.CloseCurseur
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
  If cBanque Is Nothing Then
    EffaceFormulaire
  ElseIf cBanque.BOF And cBanque.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cBanque.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cBanque.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cBanque.AbsolutePosition
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cBanque.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  'NC
  '  If bdcBanque.ListIndex < 0 Then
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
'Private Sub bdcBanque_GotFocus()
'  SetStatus bdcBanque.Tag
'End Sub

'NC
'Private Sub bdcBanque_LostFocus()
'  If bdcBanque <> "" Then
'    bdcBanque.Synchronise
'    If bdcBanque.ListIndex < 0 Then Synchrobanque
'  End If
'End Sub

'NC
'Private Sub Synchrobanque()
'  Dim iNum As Long, sNom As String
'  iNum = Int(Val(bdcBanque))
'  sNom = BDCurseurExpress("select ban_l1 from banque where ban_numbanque=" & iNum)
'  If sNom <> "" Then bdcBanque.AddItem iNum, sNom
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
  BDCopieSélection cBanque, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  DoEtat True
End Sub

Public Sub Aperçu()
  DoEtat False
End Sub

Private Sub DoEtat(ByVal bImpression As Boolean)
  Dim iChoix As Integer
  
  iChoix = frmMessageChoix.ChoixEtat("Banques (simple)", "Banques (détaillé)")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from banque where " & sFinalWP

  Select Case iChoix
    Case 1: BDEtat sSQL, drBanqueSimple, bImpression
    Case 2: BDEtat sSQL, drBanqueDétaillé, bImpression
  End Select
End Sub

