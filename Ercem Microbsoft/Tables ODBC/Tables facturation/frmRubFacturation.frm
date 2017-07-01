VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmRubFacturation 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des rubriques de facturation"
   ClientHeight    =   6615
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8100
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmRubFacturation.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   441
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   540
   Tag             =   "Données"
   Begin TablesFacturation.BDCombo ruf_langue 
      Height          =   330
      Left            =   4680
      TabIndex        =   3
      Top             =   480
      Width           =   2055
      _ExtentX        =   3625
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
      ForeColor       =   -2147483630
      DataField       =   "ruf_langue"
   End
   Begin TablesFacturation.BDSélecteurTableau bdSélTab 
      Height          =   2040
      Left            =   60
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   3960
      Width           =   390
      _ExtentX        =   688
      _ExtentY        =   3598
   End
   Begin TrueOleDBGrid60.TDBGrid tdgVentilation 
      Height          =   2595
      Left            =   540
      OleObjectBlob   =   "frmRubFacturation.frx":014A
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   3960
      Width           =   7515
   End
   Begin TablesFacturation.BDCombo bdcVentilation 
      Height          =   330
      Left            =   1740
      TabIndex        =   13
      Top             =   2400
      Width           =   6315
      _ExtentX        =   11139
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
      DataField       =   "ruf_ventil"
   End
   Begin TablesFacturation.BDCombo bdcTauxTVA 
      Height          =   330
      Left            =   1740
      TabIndex        =   11
      Top             =   2040
      Width           =   3075
      _ExtentX        =   5424
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
      DataField       =   "ruf_codetva"
   End
   Begin TablesFacturation.BDCheck bckRRRA 
      Height          =   285
      Left            =   1740
      TabIndex        =   7
      Top             =   1680
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   503
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DataField       =   "ruf_rrra"
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7620
      Top             =   420
   End
   Begin TablesFacturation.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   21
      Top             =   0
      Width           =   8100
      _ExtentX        =   14288
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
   Begin TablesFacturation.BDCombo bdcClasseDoc 
      Height          =   330
      Left            =   4080
      TabIndex        =   9
      Top             =   1680
      Width           =   3975
      _ExtentX        =   7011
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
      DataField       =   "*ruf_classe"
   End
   Begin VB.Label lblInfoRubrique 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   435
      Left            =   1740
      TabIndex        =   24
      Top             =   1200
      Width           =   6315
   End
   Begin VB.Label lblLangue 
      Caption         =   "Langue :"
      Height          =   255
      Left            =   3480
      TabIndex        =   2
      Top             =   540
      Width           =   975
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Classe document :"
      Height          =   210
      Index           =   7
      Left            =   2160
      TabIndex        =   8
      Top             =   1740
      Width           =   1755
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   23
      Top             =   3540
      Width           =   1200
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "ruf_comment"
      Height          =   315
      Index           =   2
      Left            =   1740
      TabIndex        =   22
      Top             =   3480
      Width           =   6315
      _ExtentX        =   11139
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   65
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtVentileComme 
      Height          =   315
      Left            =   2280
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   3120
      Width           =   5775
      _ExtentX        =   10186
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "ruf_ventilecomme"
      Height          =   315
      Index           =   1
      Left            =   1740
      TabIndex        =   17
      Top             =   3120
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   1740
      TabIndex        =   15
      Top             =   2760
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*ruf_libelle"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   5
      Top             =   840
      Width           =   6315
      _ExtentX        =   11139
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   60
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*ruf_numruf"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
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
      Caption         =   "Ventile comme :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   16
      Top             =   3180
      Width           =   1500
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   14
      Top             =   2820
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Taux de TVA :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   10
      Top             =   2100
      Width           =   1290
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Ventilation :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   12
      Top             =   2460
      Width           =   1140
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "RRRA :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   6
      Top             =   1740
      Width           =   615
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libellé :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   4
      Top             =   900
      Width           =   735
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Numéro :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   870
   End
End
Attribute VB_Name = "frmRubFacturation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmRubFacturation
' Feuille de gestion des rubriques de facturation
' 30/08/1999 NC
'  3/11/1999 PV Grille de ventilation
' 23/12/2000 PV Colonne Labo
' 11/01/2001 NC Ajout du champ ruf_comment
' 17/04/2001 PV Gestion du mode lecture seule au niveau du tableau
' 17/05/2001 PV bopérationGénérale
' 31/07/2001 PV Classes de document
'  9/08/2001 PV Classe Le
' 25/10/2001 PV 10 colonnes pour les comptes Analytiques
' 18/12/2001 PV Contrôle des n°s de rubrique/pays


Option Explicit

Private cRF As BDCurseur                  ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "rubfac"

Private xaTab As XArrayDB                 ' Données du tableau
Private bTabModifié As Boolean            ' Optimisation de la gestion du tableau


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
  
  Dim cRFQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from rubfac where " & sWP & " order by ruf_numruf"
  
  cRFQuery.OpenCurseur sQuery
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
  If Not cRF Is Nothing Then cRF.CloseCurseur
  Set cRF = cRFQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cRF.EOF And cRF.BOF) Then
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
  
  ' On contrôle que le code TVA est valide
  If bdcTauxTVA.ListIndex < 0 Then
    bdcTauxTVA.Synchronise
    If bdcTauxTVA.ListIndex < 0 Then
      MsgBox "Code de taux de TVA inconnu.", vbExclamation, App.Title
      bdcTauxTVA.SetFocus
      Exit Function
    End If
  End If
  
  ' On contrôle que la rubrique de ventilation est valide
  If bdcVentilation.ListIndex < 0 Then
    bdcVentilation.Synchronise
    If bdcVentilation.ListIndex < 0 Then
      MsgBox "Rubrique de ventilation inconnue.", vbExclamation, App.Title
      bdcVentilation.SetFocus
      Exit Function
    End If
  End If
  

  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select ruf_numruf from rubfac where ruf_libelle=" & sFormToSQL(colChamps("ruf_libelle"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("ruf_numruf") Then
    MsgBox "ATTENTION - Cette rubrique de facturation existe déjà sous le n° " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  
  ' Restrictions sur le n° de rubrique par pays
  ' France:      0.. 999
  ' Belgique: 1000..1999
  ' Italie:   2000..2000
  Dim iMin As Integer
  Select Case iSystèmePays
    Case 0:  iMin = 0       ' France
    Case 2:  iMin = 1000    ' Belgique
    Case 7:  iMin = 2000    ' Italie
    Case Else:
      MsgBox "Création de rubriques non autorisée sur ce système, prévenez le service informatique." & vbCrLf & "iSystèmePays=" & iSystèmePays, vbExclamation, App.Title
      Exit Function
  End Select
  Dim iRub As Long
  iRub = CLng(colChamps("ruf_numruf"))
  If iRub < iMin Or iRub > iMin + 999 Then
    MsgBox "N° de rubrique invalide." & vbCrLf & "Sur ce système, vous devez utiliser un n° de rubrique compris entre " & iMin & " et " & iMin + 999 & ".", vbExclamation, App.Title
    Exit Function
  End If
  
  
  ' Tous les tests ont été passés avec succès !
    bOkValeurs = True
End Function


Private Function bOkValeursOpGen() As Boolean
  bOkValeursOpGen = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cRFAdd As New BDCurseur
  cRFAdd.OpenCurseur "select * from rubfac where ruf_numruf=0"
  cRFAdd.AddNew

  If Not bPrépareEditAdd(cRFAdd, colColonnes, colChamps) Then
    cRFAdd.CloseCurseur
    Exit Sub
  End If
  cRFAdd.CloseCurseur
 
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cRF Is Nothing Then cRF.CloseCurseur
  Set cRF = New BDCurseur
  
  sFinalWP = "ruf_numruf=" & colChamps("ruf_numruf")
  sQuery = "select * from rubfac where " & sFinalWP
  cRF.OpenCurseur sQuery
  cRF.MoveFirst
  
  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  Mémorise
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cRF Is Nothing

  If bOpGénérale Then
    Dim sSQL As String
    
    If Not bOkValeursOpGen Then Exit Sub
    
    sSQL = "update rubfac set "
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
    
    sSQL = sSQL & ",timestamp=current,ruf_datemodif=current,ruf_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",ruf_opermodif=" & iNumOpérateur & " where " & sFinalWP
    If Not bOpérationGénérale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    ' On ré-exécute la requête, sinon la bufférisation locale empêche l'affichage des champs modifiés
    SetMessage "Lecture des données modifiées, patientez…"
    Screen.MousePointer = vbHourglass
    If Not cRF Is Nothing Then cRF.CloseCurseur
    cRF.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cRF.Edit
      
    If Not bPrépareEditAdd(cRF, colColonnes, colChamps) Then Exit Sub
  
  End If
  
  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements
  
  Mémorise
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
  If Not cRF Is Nothing Then
    If Not (cRF.EOF And cRF.BOF) Then
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
  
  bdSélTab.ButtonEnabled = False    ' Pas d'action tableau pendant une interrogation
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True
  

  colChamps("ruf_numruf").SetFocus
  bdSél.TabStop = False
 
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cRF Is Nothing
  
  ' Opération générale = Shift+Changement
  bOpGénérale = bShiftPressed
  
  colChamps("ruf_libelle").SetFocus
  AutoSelect colChamps("ruf_libelle"), True
  
  If cRF.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  bdSélTab.ButtonEnabled = False    ' Pas d'action tableau pendant un changement de tête
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ruf_numruf", False
  ActiveChamp "timestamp", False
  ActiveChamp "ruf_langue", False
  
  If bOpGénérale Then
    ActiveChamp "ruf_libelle", False
  Else
  
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
  colChamps("ruf_numruf").SetFocus
  
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  bdSélTab.ButtonEnabled = False    ' Pas d'action tableau pendant un ajout
  
  EffaceFormulaire
  colChamps("ruf_rrra") = "N"
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "timestamp", False
  ruf_langue = cLangage
    
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cRF Is Nothing
  
  If cRF.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cRF.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' La gestion de synchrodelete est faite par un trigger
   
  cRF.MoveNext
  If cRF.EOF Then
    cRF.MovePrevious
    If cRF.BOF Then
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
  Assert Not cRF Is Nothing

  bdSél.ButtonEnabled("First") = cRF.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cRF.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cRF.EOF
  bdSél.ButtonEnabled("Last") = Not cRF.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cRF.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cRF.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cRF.MoveNext
  AjusteMouvements
  If cRF.EOF Then cRF.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cRF.MovePrevious
  AjusteMouvements
  If cRF.BOF Then cRF.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub ruf_langue_Change()
  ToMaj ruf_langue
End Sub

Private Sub ruf_langue_LostFocus()
  ruf_langue.Synchronise
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

Public Sub ActionTabChange()
  Assert iMode = meNavigate
  Assert Not cRF Is Nothing
  
  BDActiveChamp tdgVentilation, True
  tdgVentilation.AllowAddNew = True
  tdgVentilation.AllowUpdate = True
  bdSél.ActiveMouvements False
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False

  bdSélTab.ButtonEnabled("Change") = False
  bdSélTab.ActiveValidation True
  bdSélTab.ButtonEnabled("InsertRow") = True
  bdSélTab.ButtonEnabled("DeleteRow") = True
  
  iMode = meChangeTab
  bTabModifié = False
  SélectionneCellule 1, 0
  tdgVentilation.SetFocus
End Sub

Private Sub ActionTabDeleteRow()
  Assert iMode = meChangeTab
  Assert Not cRF Is Nothing
  
  Dim fr As Integer, r As Integer
  If tdgVentilation.FirstRow = "" Then Exit Sub
  fr = tdgVentilation.FirstRow
  r = tdgVentilation.Row
  If fr + r <= xaTab.UpperBound(1) Then
    xaTab.DeleteRows fr + r
    tdgVentilation.ReBind
    tdgVentilation.FirstRow = fr
    tdgVentilation.Row = r
  End If
  bTabModifié = True
  
  tdgVentilation.SetFocus
End Sub

Private Sub ActionTabInsertRow()
  Assert iMode = meChangeTab
  Assert Not cRF Is Nothing
  
  Dim fr As Integer, r As Integer
  If tdgVentilation.FirstRow = "" Then
    fr = 1
  Else
    fr = tdgVentilation.FirstRow
  End If
  r = tdgVentilation.Row
  xaTab.InsertRows fr + r
  tdgVentilation.ReBind
  tdgVentilation.FirstRow = fr
  tdgVentilation.Row = r
  bTabModifié = True
  
  tdgVentilation.SetFocus
End Sub

Private Sub ActionTabValidate()
  Assert iMode = meChangeTab
  Assert Not cRF Is Nothing
  
  If tdgVentilation.DataChanged Then tdgVentilation.Update
  
  If bTabModifié Then   ' Optimisation si pas de modif
    
    ' Contrôle général des données
    Dim i As Integer, j As Integer
    For i = 1 To xaTab.UpperBound(1)
      If Not IsEmpty(xaTab(i, 0)) Or Not IsEmpty(xaTab(i, 1)) Or Not IsEmpty(xaTab(i, 2)) Or Not IsEmpty(xaTab(i, 3)) Or Not IsEmpty(xaTab(i, 4)) Then
        ' Détection de doublons
        For j = i + 1 To xaTab.UpperBound(1)
          If Val(xaTab(i, 0)) = Val(xaTab(j, 0)) And Val(xaTab(i, 1)) = Val(xaTab(j, 1)) And xaTab(i, 2) = xaTab(j, 2) Then
            MsgBox "La ventilation unité " & xaTab(i, 0) & ", pays " & xaTab(i, 1) & ", labo " & xaTab(i, 2) & " définie plusieurs fois. Supprimez les définitions multiples avant de valider.", vbExclamation, App.Title
            SélectionneCellule i, 0
            Exit Sub
          End If
        Next
        
        If xaTab(i, 0) = "" Then
          MsgBox "L'unité doit être définie.", vbExclamation, App.Title
          SélectionneCellule i, 0
          Exit Sub
        End If
        
        If xaTab(i, 1) = "" Then
          MsgBox "Le pays doit être défini.", vbExclamation, App.Title
          SélectionneCellule i, 1
          Exit Sub
        End If
        
        If xaTab(i, 2) = "" Then
          MsgBox "Le labo doit être défini.", vbExclamation, App.Title
          SélectionneCellule i, 2
          Exit Sub
        End If
        
        If Trim(xaTab(i, 3)) = "" Or Trim(xaTab(i, 4)) = "" Then
          MsgBox "Le compte général et le compte analytique doivent être définis.", vbExclamation, App.Title
          If Trim(xaTab(i, 3)) = "" Then
            SélectionneCellule i, 3
          Else
            SélectionneCellule i, 4
          End If
          Exit Sub
        End If
        
        If InStr(1, Trim(xaTab(i, 3)), " ") <> 0 Or InStr(Trim(xaTab(i, 4)), " ") <> 0 Then
          MsgBox "Le compte général et le compte analytique ne peuvent contenir d'espace.", vbExclamation, App.Title
          If InStr(1, Trim(xaTab(i, 3)), " ") <> 0 Then
            SélectionneCellule i, 3
          Else
            SélectionneCellule i, 4
          End If
          Exit Sub
        End If
  
      End If    ' if not isempty
    Next
    
    ' Tests Ok, on peut mettre à jour la base de données
    SetStatus "Mise à jour de la base de données..."
    Screen.MousePointer = vbHourglass
    Dim dBDTime As Date
    dBDTime = BDTime
    
'    BDBeginTrans
    RunSQL "delete from rubcompta where ruc_numruf=" & colChamps("ruf_numruf")
    Dim cR As New BDCurseur
    cR.OpenCurseur "select * from rubcompta where ruc_numruf=0"
    For i = 1 To xaTab.UpperBound(1)
      SetStatus "Mise à jour de la base de données... " & i & "/" & xaTab.UpperBound(1)
      If Not IsEmpty(xaTab(i, 0)) Or Not IsEmpty(xaTab(i, 1)) Or Not IsEmpty(xaTab(i, 2)) Or Not IsEmpty(xaTab(i, 3)) Or Not IsEmpty(xaTab(i, 4)) Then
        cR.AddNew
        cR!ruc_numruf = colChamps("ruf_numruf")
        cR!ruc_unite = xaTab(i, 0)
        cR!ruc_pays = xaTab(i, 1)
        cR!ruc_labo = Trim(xaTab(i, 2))
        cR!ruc_comptag = Trim(xaTab(i, 3))
        cR!ruc_comptaa = Trim(xaTab(i, 4))
        cR!timestamp = dBDTime
        cR.Update
      End If
    Next
    cR.CloseCurseur
'    BDCommitTrans
    Screen.MousePointer = vbDefault
    SetStatus
  End If    ' if bTabModifié
  
  BDActiveChamp tdgVentilation, False
  tdgVentilation.AllowAddNew = False
  tdgVentilation.AllowUpdate = False
  bdSélTab.ButtonEnabled = False
  bdSélTab.ButtonEnabled("Change") = True
  
  bdSél.ActiveMouvements True
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.SetFocus
  
  If bTabModifié Then SynchroniseFormulaire     ' Réffiche la liste triée
  
  iMode = meNavigate
End Sub

Private Sub SélectionneCellule(i As Integer, c As Integer)
  On Error Resume Next
  tdgVentilation.Row = i - tdgVentilation.FirstRow
  If Err Then
    tdgVentilation.FirstRow = i
    tdgVentilation.Row = 0
  End If
  On Error GoTo 0
  tdgVentilation.col = c
  tdgVentilation.SetFocus
End Sub

Private Sub ActionTabCancel()
  Assert iMode = meChangeTab
  Assert Not cRF Is Nothing
  
  BDActiveChamp tdgVentilation, False
  tdgVentilation.AllowAddNew = False
  tdgVentilation.AllowUpdate = False
  bdSélTab.ButtonEnabled = False
  bdSélTab.ButtonEnabled("Change") = True
  
  bdSél.ActiveMouvements True
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.SetFocus
  
  If bTabModifié Or tdgVentilation.DataChanged Then SynchroniseFormulaire  ' Restore le tableau précédent
  
  iMode = meNavigate
End Sub

Private Sub tdgVentilation_AfterInsert()
  bTabModifié = True
End Sub

Private Sub tdgVentilation_AfterUpdate()
  bTabModifié = True
End Sub


'=================================================================================
' Actions du sélecteur tableau

Private Sub bdSélTab_ActionTabChange():     ActionTabChange:    End Sub
Private Sub bdSélTab_ActionTabDeleteRow():  ActionTabDeleteRow: End Sub
Private Sub bdSélTab_ActionTabInsertRow():  ActionTabInsertRow: End Sub
Private Sub bdSélTab_ActionTabValidate():   ActionTabValidate:  End Sub
Private Sub bdSélTab_ActionTabCancel():     ActionTabCancel:    End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim c As Control
  
' Changement d'onglet avec PgPrec/PgSuiv
  If KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set c = ActiveControl
          c = Trim(colMémoireRubfac(ActiveControl.DataField))
          c.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each c In colChamps
        If Not c.Locked Then      ' On ne remplit pas les champs verrouillés
          c = Trim(colMémoireRubfac(c.DataField))
        End If
      Next
    End If
  Else
    bdSél.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("t") Or KeyAscii = Asc("T") Then
    If bdSélTab.ButtonEnabled("Change") Then
      KeyAscii = 0
      ActionTabChange
    End If
  Else
    If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
  End If
End Sub

Private Sub tdgVentilation_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
  ' Contrôle manuel, pour pouvoir saisir directement un code unité
  If ColIndex = 0 Or ColIndex = 1 Then
    Dim t As String
    t = tdgVentilation.Text
    If t = "" Then Exit Sub
    Dim i As Integer
    With tdgVentilation.Columns(ColIndex)
      For i = 0 To .ValueItems.Count - 1
        With .ValueItems(i)
          If t = .DisplayValue Then Exit Sub
          If t = .Value Then
            tdgVentilation.Text = .DisplayValue
            Exit Sub
          End If
        End With
      Next
    End With
    
    MsgBox "Valeur incorrecte ou inconnue.", vbExclamation, App.Title
    Cancel = True
  End If
End Sub

Private Sub tdgVentilation_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSélTab.KeyDown KeyCode, Shift
End Sub

Private Sub txtChamp_Change(Index As Integer)
  If Index = 1 Then txtVentileComme = ""
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
  
' Langues
  Dim l As Langue
  For Each l In colLangue
    ruf_langue.AddItem l.lan_code, l.lan_langue
  Next
  
  ' Chargement des combos
  Dim rv As RubVentilation
  For Each rv In colRubVentilation
    bdcVentilation.AddItem rv.sNumRuv, rv.ruv_libelle
  Next

  bdcTauxTVA.AddItem 0, "(sans TVA)"
  Dim cTva As New BDCurseur
  cTva.OpenCurseur "select tva_numtaux,tva_taux from tva order by tva_numtaux"
  Do Until cTva.EOF
    If cTva!tva_numtaux = 1 Then
      bdcTauxTVA.AddItem 1, "20,6% (Taux général)"
    Else
      bdcTauxTVA.AddItem cTva!tva_numtaux, cTva!tva_taux & "%"
    End If
    cTva.MoveNext
  Loop
  cTva.CloseCurseur
  
  bdcClasseDoc.AddItem "AB", "Analyse Bactério Standard"
  bdcClasseDoc.AddItem "EH", "Evaluation Hygiène"
  bdcClasseDoc.AddItem "BS", "Bactério Spéciale"
  bdcClasseDoc.AddItem "FS", "Frottis de surface"
  bdcClasseDoc.AddItem "Li", "Listéria"
  bdcClasseDoc.AddItem "Hu", "Huile"
  bdcClasseDoc.AddItem "Ch", "Chimie"
  bdcClasseDoc.AddItem "CR", "Compte-Rendu générique (autre)"
  bdcClasseDoc.AddItem "BM", "Biologie Moléculaire"
  bdcClasseDoc.AddItem "ES", "ESB (Prionics-Check)"
  bdcClasseDoc.AddItem "AV", "ABVT"
  bdcClasseDoc.AddItem "Le", "Légionelle"
  bdcClasseDoc.AddItem "FD", "Frais de déplacement"
  bdcClasseDoc.AddItem "XX", "Autre"
  
  ' Préparation de la grille
  With tdgVentilation
    .AllowRowSelect = False
    .AllowColSelect = False
    .AllowAddNew = False
    .AllowUpdate = False
    .AllowDelete = False
    .RecordSelectors = False
    .HighlightRowStyle.BackColor = RGB(180, 180, 255)
    .HighlightRowStyle.ForeColor = &H80000008
    .TabAction = 2    ' Grid navigation
    
    '.Splits(0).MarqueeStyle = 2
    .Columns(0).Caption = "Unité"
    .Columns(1).Caption = "Pays"
    .Columns(2).Caption = "Labo"
    .Columns(3).Caption = "Compte G"
    .Columns(4).Caption = "Compte A"
    
    .Columns(0).Width = 130
    .Columns(1).Width = 130
    .Columns(2).Width = 40
    .Columns(2).DataWidth = 1
    .Columns(3).Width = 100
    .Columns(3).DataWidth = 10
    .Columns(4).Width = 80
    .Columns(4).DataWidth = 10
  
    Dim v As ValueItem
    Dim u As Unité
    For Each u In colUnité
      Set v = New ValueItem
      v.Value = u.uni_numunite
      v.DisplayValue = u.uni_numunite & ": " & u.uni_code
      .Columns(0).ValueItems.Add v
    Next
    Set v = New ValueItem
    v.Value = 99
    v.DisplayValue = "99: Toutes unités"
    .Columns(0).ValueItems.Add v
    .Columns(0).ValueItems.Translate = True
    .Columns(0).ValueItems.Presentation = 2
    '.Columns(0).ValueItems.Validate = True       ' Valid manuelle
    .Columns(0).ValueItems.MaxComboItems = 10
  
    Dim p As Pays
    For Each p In colPays
      Set v = New ValueItem
      v.Value = p.pay_pays
      v.DisplayValue = p.pay_pays & ": " & p.pay_libelle
      .Columns(1).ValueItems.Add v
    Next
    Set v = New ValueItem
    v.Value = 99
    v.DisplayValue = "99: Tous pays"
    .Columns(1).ValueItems.Add v
    .Columns(1).ValueItems.Translate = True
    .Columns(1).ValueItems.Presentation = 2
    '.Columns(1).ValueItems.Validate = True       ' Valid manuelle
    .Columns(1).ValueItems.MaxComboItems = 10
  End With
  
  Set xaTab = New XArrayDB
  xaTab.ReDim 1, 0, 0, 4
  tdgVentilation.Array = xaTab
  
  BDActiveChamp tdgVentilation, False

  ' Formulaire en mode initial
  Set cRF = Nothing
  BDActiveFormulaire colChamps, False
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSélTab.ButtonEnabled = False
  bdSélTab.LectureSeule = bLectureSeule

  iMode = meEmpty
    
  bdSél.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_Resize()
  tdgVentilation.Height = ScaleHeight - tdgVentilation.Top - 3
End Sub



Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meChangeTab Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cRF Is Nothing Then cRF.CloseCurseur
  MDIFacturation.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cRF Is Nothing Then
    EffaceFormulaire
  ElseIf cRF.BOF And cRF.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cRF.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cRF.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cRF.AbsolutePosition
    ActiveTimer mtRapide              ' Mise à jour en arrière plan
    bdSélTab.ButtonEnabled = False    ' Aucune commande de tableau disponible
    xaTab.ReDim 1, 0, 0, 4            ' Efface le tableau
    tdgVentilation.ReBind             ' Réaffichage de la grille
    txtVentileComme = ""
    
    Dim iRuf As Integer
    iRuf = colChamps("ruf_numruf")
    If iRuf = 212 Or iRuf = 1 Or iRuf = 3 Or iRuf = 8 Or iRuf = 137 Or iRuf = 40 Or iRuf = 5 Or iRuf = 9 Or iRuf = 2 Or iRuf = 4 Or iRuf = 208 Or iRuf = 210 Or iRuf = 209 Then
      lblInfoRubrique = "ATTENTION - Rubrique utilisée par la préparation automatique des factures, ne pas modifier."
    Else
      lblInfoRubrique = ""
    End If
    
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cRF.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  'xaTab.ReDim 1, 0, 0, 4      ' On efface le tableau
  
  If colChamps("ruf_ventilecomme") <> "" And colChamps("ruf_langue") <> "" Then
    tdgVentilation.ReBind             ' Réaffichage du tableau
    txtVentileComme = BDCurseurExpress("select ruf_libelle from rubfac where (ruf_numruf=" & colChamps("ruf_ventilecomme") & " and ruf_langue='" & ruf_langue & "')")
    Exit Sub
  End If

  BDActiveChamp tdgVentilation, False
  
  Dim cV As New BDCurseur
  cV.OpenCurseur "select ruc_unite, ruc_pays, ruc_labo, ruc_comptag, ruc_comptaa" & _
                 "  from rubcompta" & _
                 "  where ruc_numruf=" & colChamps("ruf_numruf") & _
                 "  order by ruc_unite, ruc_pays"
  Dim iRec As Integer
  iRec = 1
  Do Until cV.EOF
    xaTab.InsertRows iRec
    xaTab(iRec, 0) = cV!ruc_unite
    xaTab(iRec, 1) = cV!ruc_pays
    xaTab(iRec, 2) = cV!ruc_labo
    xaTab(iRec, 3) = cV!ruc_comptag
    xaTab(iRec, 4) = cV!ruc_comptaa
    cV.MoveNext
    iRec = iRec + 1
  Loop
  cV.CloseCurseur
  tdgVentilation.Array = xaTab
  tdgVentilation.ReBind
  bdSélTab.ButtonEnabled("change") = True
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdSél.NumRec = ""
  xaTab.ReDim 1, 0, 0, 4
  tdgVentilation.ReBind
  txtVentileComme = ""
  lblInfoRubrique = ""
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

Private Sub ruf_langue_GotFocus()
  SetStatus ruf_langue.Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

Private Sub bdcTauxTVA_GotFocus()
  SetStatus bdcTauxTVA.Tag
End Sub

Private Sub bdcTauxTVA_lostFocus()
  bdcTauxTVA.Synchronise
End Sub


Private Sub bdcVentilation_GotFocus()
  SetStatus bdcVentilation.Tag
End Sub

Private Sub bdcVentilation_lostFocus()
  bdcVentilation.Synchronise
End Sub


Private Sub txtChamp_LostFocus(Index As Integer)
  If Index = 1 Then
    On Error Resume Next
    txtVentileComme = BDCurseurExpress("select ruf_libelle from rubfac where ruf_numruf=" & colChamps("ruf_ventilecomme") & " and ruf_langue='" & ruf_langue & "')")
    If Err Then txtVentileComme = ""
  End If
End Sub

Private Sub bckRRRA_GotFocus()
  SetStatus bckRRRA.Tag
End Sub


Private Sub tdgVentilation_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Select Case tdgVentilation.col
    Case 0: SetStatus "Code unité"
    Case 1: SetStatus "Code pays"
    Case 2: SetStatus "Code du labo"
    Case 3: SetStatus "Code du compte général"
    Case 4: SetStatus "Code du compte analytique"
  End Select
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
  BDCopieSélection cRF, colChamps, bdSél
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
  
  iChoix = frmMessageChoix.ChoixEtat("Rubrique de Facturation (simple)", "Détail de ventilation")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String

  Select Case iChoix
    Case 1:
      sSQL = "select rubfac.*,ruv_libelle from rubfac,outer rubvent where " & sFinalWP & " and ruf_ventil=ruv_numruv order by ruf_numruf"
      BDEtat sSQL, drRubFactSimple, bImpression
    
    Case 2:
      Dim sSQLTête As String, sSQLCorps As String
      sSQLTête = "select * from rubfac where " & sFinalWP
      sSQLCorps = "select * from rubcompta"
      sSQL = "SHAPE {" & sSQLTête & "} AS Tête APPEND ({" & sSQLCorps & "} AS Corps RELATE 'ruf_numruf' TO 'ruc_numruf') AS Corps"
      BDEtat sSQL, drRubFactDétaillé, bImpression
  End Select
End Sub



'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireRubfac
  
  Dim t As Control
  For Each t In colChamps
    colMémoireRubfac.Add (t), t.DataField
  Next
End Sub


