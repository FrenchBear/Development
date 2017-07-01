VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmGroupement 
   BackColor       =   &H8000000B&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des groupements"
   ClientHeight    =   5235
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
   Icon            =   "frmGroupement.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   349
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   608
   Tag             =   "Données"
   Begin TablesFacturation.BDCombo grf_langue 
      Height          =   330
      Left            =   6720
      TabIndex        =   13
      Top             =   3000
      Width           =   1515
      _ExtentX        =   2672
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
      BackColor       =   -2147483644
      ForeColor       =   -2147483630
      DataField       =   "grf_langue"
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   8340
      Top             =   1020
   End
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   675
      Left            =   60
      TabIndex        =   29
      Top             =   4500
      Width           =   9015
      Begin MSWLess.WLText txtChamp 
         DataField       =   "grf_idmodif"
         Height          =   315
         Index           =   1
         Left            =   5160
         TabIndex        =   21
         Tag             =   "Champ interne de synchronisation, format AAAA-MM-JJ HH:MM:SS"
         Top             =   240
         Width           =   3750
         _ExtentX        =   6615
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Orig modif :"
         Height          =   210
         Index           =   1
         Left            =   4020
         TabIndex        =   20
         Top             =   300
         Width           =   1095
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1680
         TabIndex        =   19
         Tag             =   "Champ interne de synchronisation, format AAAA-MM-JJ HH:MM:SS"
         Top             =   240
         Width           =   2175
         _ExtentX        =   3836
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
         TabIndex        =   30
         Top             =   300
         Width           =   1155
      End
   End
   Begin TablesFacturation.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   31
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
   Begin VB.TextBox txtChampTxt 
      BackColor       =   &H8000000F&
      DataField       =   "^grf_devise"
      ForeColor       =   &H80000012&
      Height          =   315
      Index           =   13
      Left            =   4920
      MaxLength       =   1
      TabIndex        =   12
      Tag             =   "Devise d'édition de la facture (E=Euro, F=Franc)"
      Top             =   3000
      Width           =   735
   End
   Begin VB.TextBox txtChampTxt 
      BackColor       =   &H8000000F&
      DataField       =   "*^grf_nom"
      ForeColor       =   &H80000012&
      Height          =   315
      Index           =   4
      Left            =   1740
      MaxLength       =   41
      TabIndex        =   2
      Tag             =   "Nom du groupement"
      Top             =   840
      Width           =   6495
   End
   Begin VB.TextBox txtChampTxt 
      BackColor       =   &H8000000F&
      DataField       =   "*^grf_numgrf"
      ForeColor       =   &H80000012&
      Height          =   315
      Index           =   0
      Left            =   1740
      MaxLength       =   6
      TabIndex        =   1
      Tag             =   "Numéro de série du groupement"
      Top             =   480
      Width           =   975
   End
   Begin VB.Label lblChamp 
      BackColor       =   &H8000000B&
      Caption         =   "Langue:"
      Height          =   255
      Index           =   3
      Left            =   5880
      TabIndex        =   39
      Top             =   3060
      Width           =   795
   End
   Begin MSWLess.WLText txtDerligne 
      Height          =   315
      Left            =   2520
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   3720
      Width           =   5715
      _ExtentX        =   10081
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_rab"
      Height          =   315
      Index           =   17
      Left            =   1740
      TabIndex        =   16
      Tag             =   "N° de libellé dernière ligne de facture, ou vide"
      Top             =   3720
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtBanque 
      Height          =   315
      Left            =   2520
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   3360
      Width           =   5715
      _ExtentX        =   10081
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_banque"
      Height          =   315
      Index           =   10
      Left            =   1740
      TabIndex        =   14
      Tag             =   "Code de banque de règlement pour les établissements rattachés à ce groupement"
      Top             =   3360
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_nbex"
      Height          =   315
      Index           =   11
      Left            =   1740
      TabIndex        =   11
      Tag             =   "Nb d'exemplaires client de la facture (l'exempl. interne est imprimé en plus)"
      Top             =   3000
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_tauxescompte"
      Height          =   315
      Index           =   8
      Left            =   7560
      TabIndex        =   10
      Tag             =   "Taux d'escompte accordé, vide si aucun"
      Top             =   2640
      Width           =   675
      _ExtentX        =   1191
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*grf_situation"
      Height          =   315
      Index           =   7
      Left            =   4920
      TabIndex        =   9
      Tag             =   "Situation client"
      Top             =   2640
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_condregl"
      Height          =   315
      Index           =   19
      Left            =   1740
      TabIndex        =   8
      Tag             =   "Délai de relance"
      Top             =   2640
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_cpost"
      Height          =   315
      Index           =   16
      Left            =   1740
      TabIndex        =   5
      Tag             =   "Code postal"
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
      DataField       =   "grf_bdist"
      Height          =   315
      Index           =   12
      Left            =   2520
      TabIndex        =   6
      Tag             =   "Bureau distributeur"
      Top             =   1920
      Width           =   5715
      _ExtentX        =   10081
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   37
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_corresp"
      Height          =   315
      Index           =   9
      Left            =   1740
      TabIndex        =   7
      Tag             =   "Nom de correspondant"
      Top             =   2280
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_loc"
      Height          =   315
      Index           =   6
      Left            =   1740
      TabIndex        =   4
      Tag             =   "Localité (2ème ligne d'adresse)"
      Top             =   1560
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_rue"
      Height          =   315
      Index           =   5
      Left            =   1740
      TabIndex        =   3
      Tag             =   "Rue (1ère ligne d'adresse)"
      Top             =   1200
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "grf_comment"
      Height          =   315
      Index           =   2
      Left            =   1740
      TabIndex        =   18
      Tag             =   "Commentaire libre"
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
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Der ligne :"
      Height          =   210
      Index           =   20
      Left            =   60
      TabIndex        =   38
      Top             =   3780
      Width           =   975
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Banque :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   37
      Top             =   3420
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Devise facture :"
      Height          =   210
      Index           =   18
      Left            =   3360
      TabIndex        =   36
      Top             =   3060
      Width           =   1485
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nb exempl :"
      Height          =   210
      Index           =   15
      Left            =   60
      TabIndex        =   35
      Top             =   3060
      Width           =   1125
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Taux escompte :"
      Height          =   210
      Index           =   11
      Left            =   5880
      TabIndex        =   34
      Top             =   2700
      Width           =   1560
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Situation :"
      Height          =   210
      Index           =   9
      Left            =   3360
      TabIndex        =   33
      Top             =   2700
      Width           =   975
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "jours"
      Height          =   210
      Index           =   5
      Left            =   2640
      TabIndex        =   32
      Top             =   2700
      Width           =   480
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Cond regl :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   27
      Top             =   2700
      Width           =   1050
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Correspondant :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   26
      Top             =   2340
      Width           =   1560
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Localité :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   24
      Top             =   1620
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rue :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   23
      Top             =   1260
      Width           =   495
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   22
      Top             =   900
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "CPost / BD :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   25
      Top             =   1980
      Width           =   1140
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   28
      Top             =   4140
      Width           =   1200
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
Attribute VB_Name = "frmGroupement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmGroupement
' Feuille de gestion des groupements
' 25/08/1999 NC
' 30/12/1999 PV N° de groupement alphanumérique
' 17/05/2001 PV bOpérationGénérale

Option Explicit

Private cGrf As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean            ' Vrai si changement sur la sélection

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "groupement"


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
  
  Dim cGrfQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from Groupement where " & sWP
  
  cGrfQuery.OpenCurseur sQuery
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
  If Not cGrf Is Nothing Then cGrf.CloseCurseur
  Set cGrf = cGrfQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cGrf.EOF And cGrf.BOF) Then
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
  
  If colChamps("grf_devise") <> "E" And colChamps("grf_devise") <> "F" Then
    MsgBox "Code devise incorrect." & vbCrLf & vbCrLf & "Le code devise doit être F (Franc) ou E (Euro).", vbExclamation, App.Title
    colChamps("grf_devise").SetFocus
    AutoSelect colChamps("grf_devise"), True
    Exit Function
  End If

  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select grf_numgrf from groupement where grf_nom=" & sFormToSQL(colChamps("grf_nom"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("grf_numgrf") Then
    MsgBox "ATTENTION - Ce groupement existe déjà sous le n° " & iSer, vbExclamation, App.Title
    colChamps("grf_nom").SetFocus
    AutoSelect colChamps("grf_nom"), True
    Exit Function
  End If
  
  '
  If colChamps("grf_situation") < 0 Or colChamps("grf_situation") > 4 Then
    MsgBox "Le code situation doit être compris entre 0 et 4 ", vbExclamation, App.Title
    colChamps("grf_situation").SetFocus
    AutoSelect colChamps("grf_situation"), True
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

  ' Génération du n° de série (mécanisme inhabituel)
  If colChamps("grf_numgrf") = "" Then colChamps("grf_numgrf") = iGetSerial("grf")
  
  Dim cGrfAdd As New BDCurseur
  cGrfAdd.OpenCurseur "select * from groupement where grf_numgrf='0'"
  cGrfAdd.AddNew

' Seuls les champs actif sont mis à jour
  ActiveChamp "grf_numgrf", True
  
  If Not bPrépareEditAdd(cGrfAdd, colColonnes, colChamps) Then
    cGrfAdd.CloseCurseur
    ActiveChamp "grf_numgrf", False
    Exit Sub
  End If
  cGrfAdd.CloseCurseur
 
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cGrf Is Nothing Then cGrf.CloseCurseur
  Set cGrf = New BDCurseur
  
  sFinalWP = "grf_numgrf='" & colChamps("grf_numgrf") & "'"
  sQuery = "select * from Groupement where " & sFinalWP
  cGrf.OpenCurseur sQuery
  cGrf.MoveFirst
  
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
  Assert Not cGrf Is Nothing

  If bOpGénérale Then
    Dim sSQL As String
    
    If Not bOkValeursOpGen Then Exit Sub
    
    sSQL = "update groupement set "
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
    
    sSQL = sSQL & ",timestamp=current where " & sFinalWP
    If Not bOpérationGénérale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    ' On ré-exécute la requête, sinon la bufférisation locale empêche l'affichage des champs modifiés
    SetMessage "Lecture des données modifiées, patientez…"
    Screen.MousePointer = vbHourglass
    If Not cGrf Is Nothing Then cGrf.CloseCurseur
    cGrf.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cGrf.Edit
      
    If Not bPrépareEditAdd(cGrf, colColonnes, colChamps) Then
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
  If Not cGrf Is Nothing Then
    If Not (cGrf.EOF And cGrf.BOF) Then
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
  
  colChamps("grf_numgrf").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cGrf Is Nothing
  
  ' Opération générale = Shift+Changement
  bOpGénérale = bShiftPressed
  
  colChamps("grf_nom").SetFocus
  AutoSelect colChamps("grf_nom"), True
  
  If cGrf.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "grf_numgrf", False
  ActiveChamp "timestamp", False
  ActiveChamp "grf_idmodif", False
  
  If bOpGénérale Then
    ActiveChamp "grf_nom", False
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
  colChamps("grf_nom").SetFocus
  
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "grf_numgrf", False
  ActiveChamp "timestamp", False
  ActiveChamp "grf_idmodif", False
    
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
  
  ' Valeurs par défaut
  colChamps("grf_condregl") = 60
  colChamps("grf_nbex") = 3
  colChamps("grf_banque") = 1
  txtBanque = sGetBanque(colChamps("grf_banque"))
  txtBanque.Refresh
  colChamps("grf_devise") = "F"
  grf_langue = cLangage
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cGrf Is Nothing
  
  If cGrf.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from etablissement where etb_numgrf='" & colChamps("grf_numgrf") & "'")
  If iNb > 0 Then
    MsgBox "Impossible de supprimer le groupement, il reste " & iNb & " établissement(s) rattaché(s).", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cGrf.Delete
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
'  cSD!sd_wherepart = "grf_numgrf=" & sFormToSQL(colChamps("grf_numgrf"), BDTypeCHAR)
'  cSD.Update
'  cSD.CloseCurseur
  
  cGrf.MoveNext
  If cGrf.EOF Then
    cGrf.MovePrevious
    If cGrf.BOF Then
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
  Assert Not cGrf Is Nothing

  bdSél.ButtonEnabled("First") = cGrf.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cGrf.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cGrf.EOF
  bdSél.ButtonEnabled("Last") = Not cGrf.EOF
End Sub


Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cGrf.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cGrf.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cGrf.MoveNext
  AjusteMouvements
  If cGrf.EOF Then cGrf.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cGrf.MovePrevious
  AjusteMouvements
  If cGrf.BOF Then cGrf.MoveFirst
  SynchroniseFormulaire
End Sub
Private Sub grf_langue_Change()
  ToMaj grf_langue
End Sub

Private Sub grf_langue_LostFocus()
  grf_langue.Synchronise
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


' Pour ajouter un groupement avec n° imposé
Private Sub txtChamp_DblClick(Index As Integer)
  If txtChamp(Index).DataField = "grf_numgrf" And iMode = meAdd Then
    BDActiveChamp txtChamp(Index), True
  End If
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
    grf_langue.AddItem l.lan_code, l.lan_langue
  Next
  
  ' Chargement des combos
  ' Rien !

  ' Formulaire en mode initial
  Set cGrf = Nothing
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
  If Not cGrf Is Nothing Then cGrf.CloseCurseur
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
  If cGrf Is Nothing Then
    EffaceFormulaire
  ElseIf cGrf.BOF And cGrf.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cGrf.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cGrf.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cGrf.AbsolutePosition
    
    'On efface les champs qui seront affichés par le timer
    txtBanque = ""
    txtDerligne = ""
        
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
    
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cGrf.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  ' Affichage des champs satellites
  If colChamps("grf_banque") <> "" Then
    txtBanque = sGetBanque(colChamps("grf_banque"))
    txtBanque.Refresh
  End If
  If colChamps("grf_rab") <> "" Then
    txtDerligne = sGetLibfcent(colChamps("grf_rab"))
    txtDerligne.Refresh
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  txtBanque = ""
  txtDerligne = ""
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
Private Sub grf_Langue_GotFocus()
  SetStatus grf_langue.Tag
End Sub


Private Sub txtChamp_LostFocus(Index As Integer)
  ' Mise à jour des champs pendant la saisie
  
  ' Mise à jour du champ txt_banque
  If txtChamp(Index).DataField = "grf_banque" Then
    If IsNumeric(txtChamp(Index)) Then
      txtBanque = sGetBanque(txtChamp(Index))
    Else
      txtBanque = ""
    End If
  End If
  
  ' Mise à jour du champ txt_derligne
  If txtChamp(Index).DataField = "grf_rab" Then
    If IsNumeric(txtChamp(Index)) Then
      txtDerligne = sGetLibfcent(txtChamp(Index))
    Else
      txtDerligne = ""
    End If
  End If
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
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
  BDCopieSélection cGrf, colChamps, bdSél
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
  
  iChoix = frmMessageChoix.ChoixEtat("Groupements (simple)", "Groupements (détaillé)")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from groupement where " & sFinalWP

  Select Case iChoix
    Case 1: BDEtat sSQL, drGroupementSimple, bImpression
    Case 2: BDEtat sSQL, drGroupementDétaillé, bImpression
  End Select
End Sub

