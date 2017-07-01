VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmDirReg 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des directions régionales"
   ClientHeight    =   6630
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
   Icon            =   "frmDirReg.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   442
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   608
   Tag             =   "Données"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7080
      Top             =   1020
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^drg_optedition"
      Height          =   315
      Index           =   18
      Left            =   1740
      MaxLength       =   5
      TabIndex        =   26
      Top             =   3720
      Width           =   795
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^drg_optlabo"
      Height          =   315
      Index           =   17
      Left            =   4140
      MaxLength       =   5
      TabIndex        =   28
      Top             =   3720
      Width           =   795
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^drg_bdist"
      Height          =   315
      Index           =   12
      Left            =   2520
      MaxLength       =   37
      TabIndex        =   14
      Top             =   1920
      Width           =   4275
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^*drg_nom"
      Height          =   315
      Index           =   4
      Left            =   1740
      MaxLength       =   41
      TabIndex        =   7
      Top             =   840
      Width           =   5055
   End
   Begin TablesServeur.BDCombo bdcPays 
      Height          =   330
      Left            =   6540
      TabIndex        =   19
      Top             =   2280
      Width           =   2535
      _extentx        =   4471
      _extenty        =   582
      font            =   "frmDirReg.frx":014A
      datafield       =   "drg_pays"
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^drg_etat"
      Height          =   315
      Index           =   1
      Left            =   3360
      TabIndex        =   3
      Top             =   480
      Width           =   315
   End
   Begin TablesServeur.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   47
      Top             =   0
      Width           =   9120
      _extentx        =   16087
      _extenty        =   767
      font            =   "frmDirReg.frx":0172
   End
   Begin TablesServeur.BDCombo bdcDirNat 
      Height          =   330
      Left            =   1740
      TabIndex        =   20
      Top             =   2640
      Width           =   6015
      _extentx        =   10610
      _extenty        =   582
      font            =   "frmDirReg.frx":019A
      datafield       =   "*drg_numdna"
   End
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   1695
      Left            =   60
      TabIndex        =   33
      Top             =   4920
      Width           =   9015
      Begin TablesServeur.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3780
         TabIndex        =   37
         Top             =   240
         Width           =   5115
         _extentx        =   9022
         _extenty        =   582
         font            =   "frmDirReg.frx":01C2
         datafield       =   "drg_opercreat"
      End
      Begin TablesServeur.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3780
         TabIndex        =   41
         Top             =   600
         Width           =   5115
         _extentx        =   9022
         _extenty        =   582
         font            =   "frmDirReg.frx":01EA
         datafield       =   "drg_opermodif"
      End
      Begin TablesServeur.BDCombo bdcOperValid 
         Height          =   330
         Left            =   3780
         TabIndex        =   44
         Top             =   960
         Width           =   5115
         _extentx        =   9022
         _extenty        =   582
         font            =   "frmDirReg.frx":0212
         datafield       =   "drg_opervalid"
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1680
         TabIndex        =   46
         Top             =   1320
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
         DataField       =   "drg_tsvalid"
         Height          =   315
         Index           =   25
         Left            =   1680
         TabIndex        =   43
         Top             =   960
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
         DataField       =   "drg_datecreat"
         Height          =   315
         Index           =   23
         Left            =   1680
         TabIndex        =   35
         Top             =   240
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "drg_heurecreat"
         Height          =   315
         Index           =   22
         Left            =   2760
         TabIndex        =   36
         Top             =   240
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "drg_datemodif"
         Height          =   315
         Index           =   21
         Left            =   1680
         TabIndex        =   39
         Top             =   600
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "drg_heuremodif"
         Height          =   315
         Index           =   20
         Left            =   2760
         TabIndex        =   40
         Top             =   600
         Width           =   975
         _ExtentX        =   1720
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
         TabIndex        =   45
         Top             =   1380
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Validé le :"
         Height          =   210
         Index           =   19
         Left            =   120
         TabIndex        =   42
         Top             =   1020
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   34
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   38
         Top             =   660
         Width           =   1020
      End
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_interloc"
      Height          =   315
      Index           =   19
      Left            =   1740
      TabIndex        =   24
      Top             =   3360
      Width           =   5115
      _ExtentX        =   9022
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_cpost"
      Height          =   315
      Index           =   16
      Left            =   1740
      TabIndex        =   13
      Top             =   1920
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   5
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_fax"
      Height          =   315
      Index           =   13
      Left            =   3840
      TabIndex        =   17
      Top             =   2280
      Width           =   1995
      _ExtentX        =   3519
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   16
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_corresp"
      Height          =   315
      Index           =   9
      Left            =   1740
      TabIndex        =   22
      Top             =   3000
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   49
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_tel"
      Height          =   315
      Index           =   7
      Left            =   1740
      TabIndex        =   16
      Top             =   2280
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   16
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_loc"
      Height          =   315
      Index           =   6
      Left            =   1740
      TabIndex        =   11
      Top             =   1560
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_rue"
      Height          =   315
      Index           =   5
      Left            =   1740
      TabIndex        =   9
      Top             =   1200
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_fdr"
      Height          =   555
      Index           =   10
      Left            =   1740
      TabIndex        =   32
      Top             =   4440
      Width           =   7350
      _ExtentX        =   12965
      _ExtentY        =   979
      _Version        =   393216
      ScrollBars      =   2
      MultiLine       =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_origine"
      Height          =   315
      Index           =   3
      Left            =   4860
      TabIndex        =   5
      Top             =   480
      Width           =   4215
      _ExtentX        =   7435
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   30
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "drg_comment"
      Height          =   315
      Index           =   2
      Left            =   1740
      TabIndex        =   30
      Top             =   4080
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*drg_numdrg"
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
      Caption         =   "Direction nat. :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   210
      Index           =   9
      Left            =   60
      MousePointer    =   10  'Up Arrow
      TabIndex        =   48
      ToolTipText     =   "Affiche la direction nationale"
      Top             =   2700
      Width           =   1470
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Pays :"
      Height          =   210
      Index           =   15
      Left            =   5880
      TabIndex        =   18
      Top             =   2340
      Width           =   585
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Interlocuteur :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   23
      Top             =   3420
      Width           =   1365
   End
   Begin VB.Label lblOptions 
      AutoSize        =   -1  'True
      Caption         =   "Options édition:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   210
      Index           =   1
      Left            =   60
      MousePointer    =   10  'Up Arrow
      TabIndex        =   25
      Top             =   3780
      Width           =   1575
   End
   Begin VB.Label lblOptions 
      AutoSize        =   -1  'True
      Caption         =   "Options labo:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   210
      Index           =   2
      Left            =   2700
      MousePointer    =   10  'Up Arrow
      TabIndex        =   27
      Top             =   3780
      Width           =   1320
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Correspondant :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   21
      Top             =   3060
      Width           =   1560
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Localité :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   10
      Top             =   1620
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rue :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   8
      Top             =   1260
      Width           =   495
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   6
      Top             =   900
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Feuille de route :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   31
      Top             =   4500
      Width           =   1605
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Tel / Fax :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   15
      Top             =   2340
      Width           =   930
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "CPost / BD :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   12
      Top             =   1980
      Width           =   1140
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine :"
      Height          =   210
      Index           =   3
      Left            =   3960
      TabIndex        =   4
      Top             =   540
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   29
      Top             =   4140
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "État :"
      Height          =   210
      Index           =   1
      Left            =   2700
      TabIndex        =   2
      Top             =   540
      Width           =   525
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
Attribute VB_Name = "frmDirReg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmDirReg
' Feuille de gestion des directions régionales
' 10/05/1999 PV
'  6/08/1999 PV synchrodelete
' 23/11/1999 PV Accès direct, liens internes, www.silliker
'  8/02/2000 PV Avertissement avant le passage à l'état S
' 26/05/2000 PV Mécanisme de mémorisation (F5)
'  5/09/2000 PV Sélection hiérarchique; AfficheDirReg via where-part
' 13/02/2001 PV Traçabilité des opérations générales
' 18/05/2001 PV bOpérationGénérale
' 21/05/2001 PV Modification de requête avancée; état supprimé correctement géré en query
' 31/11/2001 FF Historique des modifications
' 03/12/2001 FF Historique des suppressions et des destructions
' 04/12/2001 FF Historique des créations
' 05/12/2001 FF Historique des récupérations d'enregistrement
' 06/12/2001 PV sMéthodesGlobales (menu commande contextuel)

Option Explicit

Private cDrg As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean            ' Vrai si changement sur la sélection

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private colHistorique As New Collection   ' Trace des modifications pour l'historique

Private Const sTable = "dirreg"


'=================================================================================
' Méthodes globales implémentées par ce module, pour l'affichage du menu Commandes

Public Property Get sMéthodesGlobales() As String
  sMéthodesGlobales = "Historique,Récupère,SélectionAttachementsNmoins1,SélectionAttachementsEtablissements"
End Property


'=================================================================================
' Accès direct

Public Sub AfficheDirReg(ByVal sWP As String)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmDirReg
    F.AfficheDirReg sWP
    Exit Sub
  End If
  
  EffaceFormulaire
  BDActiveFormulaire colChamps, True
  iMode = meQuery
  ValidateQuery sWP
End Sub



'=================================================================================
' Actions de validation

Private Sub ValidateQuery(Optional ByVal sWP As String)
  Assert iMode = meQuery
  
  Dim t As Control
  Dim bWPIntègreEtat As Boolean
  bWPIntègreEtat = False
  
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
      If t.DataField = "drg_etat" Then bWPIntègreEtat = True
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  If Not bWPIntègreEtat Then sWP = sWP & " and drg_etat is null"
  
  If bShiftPressed Then
    sWP = InputBox("Modification avancée de la requête", "Sélection", sWP)
    If sWP = "" Then Exit Sub
  End If

  
  Dim cDrgQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from dirreg where " & sWP

  cDrgQuery.OpenCurseur sQuery
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
  If Not cDrg Is Nothing Then cDrg.CloseCurseur
  Set cDrg = cDrgQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cDrg.EOF And cDrg.BOF) Then
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
  
  ' On contrôle que le pays est valide
  If bdcPays.ListIndex < 0 Then
    bdcPays.Synchronise
    If bdcPays.ListIndex < 0 Then
      MsgBox "Pays inconnu !", vbExclamation, App.Title
      bdcPays.SetFocus
      Exit Function
    End If
  End If
  
  ' On contrôle le niveau hiérarchique supérieur
  If bdcDirNat.ListIndex < 0 Then
    SynchroDna
    If bdcDirNat.ListIndex < 0 Then
      MsgBox "Direction nationale inconnue !", vbExclamation, App.Title
      bdcDirNat.SetFocus
      Exit Function
    End If
  End If
  
  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select drg_numdrg from dirreg where drg_nom=" & sFormToSQL(colChamps("drg_nom"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("drg_numdrg") Then
    MsgBox "ATTENTION - Cette direction régionale existe déjà sous le n° " & iSer, vbExclamation, App.Title
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
  
  If bdcPays <> "" Then
    bdcPays.Synchronise
    If bdcPays.ListIndex < 0 Then
      MsgBox "Pays inconnu !", vbExclamation, App.Title
      bdcPays.SetFocus
      Exit Function
    End If
  End If
  
  If bdcDirNat <> "" Then
    SynchroDna
    If bdcDirNat.ListIndex < 0 Then
      MsgBox "Direction nationale inconnue !", vbExclamation, App.Title
      bdcDirNat.SetFocus
      Exit Function
    End If
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeursOpGen = True
End Function



Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  TrimCrLf colChamps("drg_fdr")
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  ' Génération du n° de série (mécanisme inhabituel)
  If colChamps("drg_numdrg") = "" Then colChamps("drg_numdrg") = iGetSerial("drg")
  
  Dim cDrgAdd As New BDCurseur
  cDrgAdd.OpenCurseur "select * from dirreg where drg_numdrg=0"
  cDrgAdd.AddNew
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "drg", True
  
  ' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "drg_numdrg", True
  
  If Not bPrépareEditAdd(cDrgAdd, colColonnes, colChamps) Then
    cDrgAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "drg_numdrg", False
    Exit Sub
  End If
  cDrgAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cDrg Is Nothing Then cDrg.CloseCurseur
  Set cDrg = New BDCurseur
  
  sFinalWP = "drg_numdrg=" & colChamps("drg_numdrg")
  sQuery = "select * from dirreg where " & sFinalWP
  cDrg.OpenCurseur sQuery
  cDrg.MoveFirst
  
  
  ' Historique
  Dim sMsgTrace As String
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      ' On enregistre uniquement si les champs ne sont pas vides
      If ValeurContrôle(c) <> "" Then
        If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
        sMsgTrace = sMsgTrace & c.DataField & ":" & ValeurContrôle(c)
      End If
    End If
  Next
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("drg_numdrg"), "créé", sMsgTrace
  End If
    
    
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
  Assert Not cDrg Is Nothing

  TrimCrLf colChamps("drg_fdr")
  
  If bOpGénérale Then
    Dim sSQL As String
    
    If Not bOkValeursOpGen Then Exit Sub
    
    sSQL = "update dirreg set "
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
    
    sSQL = sSQL & ",timestamp=current,drg_datemodif=current,drg_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",drg_opermodif=" & iNumOpérateur & " where " & sFinalWP
    If Not bOpérationGénérale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    ' On ré-exécute la requête, sinon la bufférisation locale empêche l'affichage des champs modifiés
    SetMessage "Lecture des données modifiées, patientez…"
    Screen.MousePointer = vbHourglass
    If Not cDrg Is Nothing Then cDrg.CloseCurseur
    cDrg.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cDrg.Edit
      
    ' Traçabilité ancien style
    InitTraçabilité colChamps, "drg", False
    ActiveTraçabilité True     ' Pour mettre à jour la base
    
    If Not bPrépareEditAdd(cDrg, colColonnes, colChamps) Then
      ActiveTraçabilité False
      Exit Sub
    End If
    
    ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
    If iMode = meChange Then
      Dim c As Control
      Dim sMsgTrace As String
      For Each c In Controls
        If DataFieldEx(c) <> "" Then
          If colHistorique(c.DataField) <> ValeurContrôle(c) Then  ' Modifié !
            If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
            sMsgTrace = sMsgTrace & c.DataField & ":" & colHistorique(c.DataField) & "->" & ValeurContrôle(c)
          End If
        End If
      Next
      If sMsgTrace <> "" Then
         JournalUnix sTable & " " & colChamps("drg_numdrg"), "changé", sMsgTrace
      End If
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
  If Not cDrg Is Nothing Then
    If Not (cDrg.EOF And cDrg.BOF) Then
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
  
  colChamps("drg_numdrg").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cDrg Is Nothing
  
  ' Opération générale = Shift+Changement
  bOpGénérale = bShiftPressed
  
  If cDrg.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "drg_numdrg", False
  ActiveChamp "drg_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  If bOpGénérale Then
    ActiveChamp "drg_nom", False
  End If
  
  colChamps("drg_origine").SetFocus
  AutoSelect colChamps("drg_origine"), True
  bdSél.TabStop = False
  
  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colHistorique
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      colHistorique.Add ValeurContrôle(c), c.DataField
    End If
  Next
   
  If bOpGénérale Then
    SetMessage "OPÉRATION GÉNÉRALE - Définissez les champs modifiés, puis validez [Entrée] ou abandonnez [Échap]"
    EffaceFormulaire
  Else
    SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
  End If
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "drg_numdrg", False
  ActiveChamp "drg_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  ' Valeurs par défaut
  bdcPays = iSystèmePays
  
  colChamps("drg_origine").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cDrg Is Nothing
  
  If cDrg.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  If bShiftPressed Then
    ActionDétruit             ' Détruit l'enregistrement
  Else
    ActionSupprime            ' Marque l'enregistrement supprimé (état S)
  End If
End Sub


Public Sub ActionSupprime()   ' Marque l'enregistrement supprimé (état S)
  If colChamps("drg_etat") <> "" Then
    MsgBox "Déjà supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from secteur where sec_etat is null and sec_numdrg=" & colChamps("drg_numdrg"))
  If iNb > 0 Then
    MsgBox "Impossible de basculer la direction régionale à l'état S, il reste " & iNb & " secteur(s) rattaché(s) pas l'état S.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, vous allez basculer l'enregistrement à l'état S (supprimé)." & vbCrLf & "Vous pourrez ultérieurement restaurer l'enregistrement à l'état normal en choisissant le menu Commandes, Récupère un enregistrement supprimé." & vbCrLf & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub

  cDrg.Edit
  cDrg!drg_etat = "S"
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "drg", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cDrg, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' On spécifie dans l'historique des modifications que le numéro X est passé à l'état de supprimé
  Dim sMsgTrace As String
  sMsgTrace = colChamps("drg_numdrg") & " -> Etat S"
    If cDrg!drg_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("drg_numdrg"), "supprimé", sMsgTrace
       End If
    End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub


Public Sub Récupère()   ' Récupère un enregistrement supprimé (état S)
  If colChamps("drg_etat") <> "S" Then
    MsgBox "Vous ne pouvez récupérer qu'un enregistrement supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cDrg.Edit
  cDrg!drg_etat = Null
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "drg", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cDrg, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' Si on veut récupérer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("drg_numdrg") & " -> Récup"
  If sMsgTrace <> "" Then
        JournalUnix sTable & " " & colChamps("drg_numdrg"), "récupéré", sMsgTrace
  End If
  
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub

  
Public Sub ActionDétruit()    ' Détruit l'enregistrement
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("drg_etat") <> "S" Then
    MsgBox "Vous ne pouvez pas détruire un enregistrement sans l'avoir au préalable supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from secteur where sec_numdrg=" & colChamps("drg_numdrg"))
  If iNb > 0 Then
    MsgBox "Impossible de basculer la direction régionale à l'état S, il reste " & iNb & " secteur(s) rattaché(s).", vbExclamation, App.Title
    Exit Sub
  End If

  ' Historique
  Dim sMsgTrace As String
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      If ValeurContrôle(c) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & c.DataField & ":" & ValeurContrôle(c)
         End If
      End If
  Next
  
  On Error Resume Next
  cDrg.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' On garde la trace de la destruction
  JournalUnix sTable & " " & colChamps("drg_numdrg"), "détruit", sMsgTrace
  
  ' synchrodelete est mis à jour par un trigger
  
  cDrg.MoveNext
  If cDrg.EOF Then
    cDrg.MovePrevious
    If cDrg.BOF Then
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
  ActiveChamp "drg_datecreat", bEnable
  ActiveChamp "drg_heurecreat", bEnable
  ActiveChamp "drg_opercreat", bEnable
  ActiveChamp "drg_datemodif", bEnable
  ActiveChamp "drg_heuremodif", bEnable
  ActiveChamp "drg_opermodif", bEnable
  ActiveChamp "drg_tsvalid", bEnable
  ActiveChamp "drg_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cDrg Is Nothing

  bdSél.ButtonEnabled("First") = cDrg.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cDrg.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cDrg.EOF
  bdSél.ButtonEnabled("Last") = Not cDrg.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cDrg.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cDrg.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cDrg.MoveNext
  AjusteMouvements
  If cDrg.EOF Then cDrg.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cDrg.MovePrevious
  AjusteMouvements
  If cDrg.BOF Then cDrg.MoveFirst
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
  Dim c As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set c = ActiveControl
          c = colMémoireDirReg(ActiveControl.DataField)
          c.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each c In colChamps
        If Not c.Locked Then      ' On ne remplit pas les champs verrouillés
          c = colMémoireDirReg(c.DataField)
        End If
      Next
    End If
  Else
    bdSél.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub

' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDIServeur.mnuCommandes
  End If
End Sub

Private Sub lblChamp_Click(Index As Integer)
  If bdcDirNat <> "" Then frmDirNat.AfficheDirNat "dna_numdna=" & Chr(34) & bdcDirNat & Chr(34)
End Sub

' Filtrage des Entrée intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
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
  Dim p As Pays
  For Each p In colPays
    bdcPays.AddItem p.pay_pays, p.pay_libelle
  Next
  
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
    bdcOperValid.AddItem u.uti_numuti, u.uti_nom
  Next

  
  ' Formulaire en mode initial
  Set cDrg = Nothing
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
  If Not cDrg Is Nothing Then cDrg.CloseCurseur
  MDIServeur.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub

' Aide des options
Private Sub lblOptions_Click(Index As Integer)
  If Index = 1 Then
    FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/optedcra.htm"
  Else
    FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/optlabo.htm"
  End If
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cDrg Is Nothing Then
    EffaceFormulaire
  ElseIf cDrg.BOF And cDrg.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cDrg.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cDrg.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cDrg.AbsolutePosition
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cDrg.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  If bdcDirNat.ListIndex < 0 Then
    SynchroDna
  End If
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


' Pour ajouter un établissement avec n° imposé
Private Sub txtChamp_DblClick(Index As Integer)
  If txtChamp(Index).DataField = "drg_numdrg" And iMode = meAdd Then
    BDActiveChamp txtChamp(Index), True
  End If
End Sub


'=================================================================================
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub txtChampVB_GotFocus(Index As Integer)
  AutoSelect txtChampVB(Index)
  SetStatus txtChampVB(Index).Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

Private Sub bdcPays_GotFocus()
  SetStatus bdcPays.Tag
End Sub

Private Sub bdcPays_LostFocus()
  bdcPays.Synchronise
End Sub

Private Sub bdcDirNat_GotFocus()
  SetStatus bdcDirNat.Tag
End Sub

Private Sub bdcDirNat_LostFocus()
  If bdcDirNat <> "" Then
    bdcDirNat.Synchronise
    If bdcDirNat.ListIndex < 0 Then SynchroDna
  End If
End Sub

Private Sub SynchroDna()
  Dim iNum As Long, sNom As String
  iNum = Int(Val(bdcDirNat))
  sNom = BDCurseurExpress("select dna_nom from dirnat where dna_numdna=" & iNum)
  If sNom <> "" Then bdcDirNat.AddItem iNum, sNom
End Sub

Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcOperModif.Tag
End Sub

Private Sub bdcOperValid_GotFocus()
  SetStatus bdcOperValid.Tag
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
  BDCopieSélection cDrg, colChamps, bdSél
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
  On Error GoTo pb
  
  Dim iChoix As Integer
  iChoix = frmMessageChoix.ChoixEtat("&Simple", "&Détaillé", "S&tructure")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
  Exit Sub
  
pb:
  intlMessageErreurEtat
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String, sSQLTête As String, sSQLCorps As String
  sSQLTête = "select unique drg_numdna,dna_nom from dirreg,dirnat where " & sFinalWP & " and drg_numdna=dna_numdna"
  sSQLCorps = "select * from dirreg where " & sFinalWP
  sSQL = "SHAPE {" & sSQLTête & "} AS Tête APPEND ({" & sSQLCorps & "} AS Corps RELATE 'drg_numdna' TO 'drg_numdna') AS Corps"

  Select Case iChoix
    Case 1: On Error Resume Next: BDEtat sSQL, drDirRegSimple, bImpression
    Case 2: On Error Resume Next: BDEtat sSQL, drDirRegDétaillé, bImpression
    Case 3: FormateStructure sFinalWP, bImpression, Me, iChoix
  End Select
End Sub


' Callback de l'aperçu avant impression
Public Sub PrintReport(ByVal iChoix As Integer)
  Etat iChoix, True
End Sub



'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireDirReg
  
  Dim t As Control
  For Each t In colChamps
    colMémoireDirReg.Add (t), t.DataField
  Next
End Sub




'========================================================
' Sélection hiérarchique

Public Sub cmdSélectionAttachements(bEtb As Boolean)
  If iMode <> meNavigate Then
    MsgBox "La sélection hiérarchique N-1 ne fonctionne qu'après une sélection d'enregistrements.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "sec_numdrg in ("
  
  EffaceFormulaire
  Refresh
  cDrg.MoveFirst
  Do Until cDrg.EOF
    If cDrg.AbsolutePosition Mod 10 = 0 Then
      bdSél.NumRec = cDrg.AbsolutePosition
      bdSél.RefreshNumRec
    End If
    sWP = sWP & Chr(34) & cDrg!drg_numdrg & Chr(34) & ","
    cDrg.MoveNext
  Loop
  cDrg.MoveFirst
  SynchroniseFormulaire
  
  Mid(sWP, Len(sWP), 1) = ")"   ' On remplace la , finale par une )
  If bEtb Then
    sWP = "etb_etat is null and etb_numsec in (select sec_numsec from secteur where sec_etat is null and " & sWP & ")"
    frmEtablissement.AfficheEtablissement sWP
  Else
    frmSecteur.AfficheSecteur sWP
  End If
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("drg_numdrg") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


