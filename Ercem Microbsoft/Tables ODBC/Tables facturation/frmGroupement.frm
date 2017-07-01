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
   Tag             =   "Donn�es"
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
   Begin VB.Frame frlTra�abilit� 
      Caption         =   "Tra�abilit�"
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
   Begin TablesFacturation.BDS�lecteur bdS�l 
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
      Tag             =   "Devise d'�dition de la facture (E=Euro, F=Franc)"
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
      Tag             =   "Num�ro de s�rie du groupement"
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
      Tag             =   "N� de libell� derni�re ligne de facture, ou vide"
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
      Tag             =   "Code de banque de r�glement pour les �tablissements rattach�s � ce groupement"
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
      Tag             =   "Nb d'exemplaires client de la facture (l'exempl. interne est imprim� en plus)"
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
      Tag             =   "Taux d'escompte accord�, vide si aucun"
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
      Tag             =   "D�lai de relance"
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
      Tag             =   "Localit� (2�me ligne d'adresse)"
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
      Tag             =   "Rue (1�re ligne d'adresse)"
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
      Caption         =   "Localit� :"
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
' 30/12/1999 PV N� de groupement alphanum�rique
' 17/05/2001 PV bOp�rationG�n�rale

Option Explicit

Private cGrf As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private bOpG�n�rale As Boolean            ' Vrai si changement sur la s�lection

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private Const sTable = "groupement"


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  Dim bWPInt�greEtat As Boolean
  
  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
      Dim sFinal As String, sMsg As String
      If Not bQueryToWP(t.DataField, t.Text, colColonnes(t.DataField).iType, sFinal, sMsg) Then
        MsgBox "Erreur dans la requ�te !" & vbCrLf & sMsg, vbExclamation, App.Title
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
      End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cGrfQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from Groupement where " & sWP
  
  cGrfQuery.OpenCurseur sQuery
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cGrf Is Nothing Then cGrf.CloseCurseur
  Set cGrf = cGrfQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cGrf.EOF And cGrf.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a �t� s�lectionn�"
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  bdS�l.SetFocus
End Sub


' V�rifie que les champs contiennent des valeurs l�gales
' Le contr�le des NULL et des types a d�j� �t� fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  
  bOkValeurs = False
  
  If colChamps("grf_devise") <> "E" And colChamps("grf_devise") <> "F" Then
    MsgBox "Code devise incorrect." & vbCrLf & vbCrLf & "Le code devise doit �tre F (Franc) ou E (Euro).", vbExclamation, App.Title
    colChamps("grf_devise").SetFocus
    AutoSelect colChamps("grf_devise"), True
    Exit Function
  End If

  ' On regarde si le nom n'existe pas d�j�
  Dim iSer As Long
  iSer = BDCurseurExpress("select grf_numgrf from groupement where grf_nom=" & sFormToSQL(colChamps("grf_nom"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("grf_numgrf") Then
    MsgBox "ATTENTION - Ce groupement existe d�j� sous le n� " & iSer, vbExclamation, App.Title
    colChamps("grf_nom").SetFocus
    AutoSelect colChamps("grf_nom"), True
    Exit Function
  End If
  
  '
  If colChamps("grf_situation") < 0 Or colChamps("grf_situation") > 4 Then
    MsgBox "Le code situation doit �tre compris entre 0 et 4 ", vbExclamation, App.Title
    colChamps("grf_situation").SetFocus
    AutoSelect colChamps("grf_situation"), True
    Exit Function
  End If
  
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


' V�rifie que les champs contiennent des valeurs l�gales pour une OpGen
' La valeur vide est toujours l�gale
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

  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeursOpGen = True
End Function



Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  ' G�n�ration du n� de s�rie (m�canisme inhabituel)
  If colChamps("grf_numgrf") = "" Then colChamps("grf_numgrf") = iGetSerial("grf")
  
  Dim cGrfAdd As New BDCurseur
  cGrfAdd.OpenCurseur "select * from groupement where grf_numgrf='0'"
  cGrfAdd.AddNew

' Seuls les champs actif sont mis � jour
  ActiveChamp "grf_numgrf", True
  
  If Not bPr�pareEditAdd(cGrfAdd, colColonnes, colChamps) Then
    cGrfAdd.CloseCurseur
    ActiveChamp "grf_numgrf", False
    Exit Sub
  End If
  cGrfAdd.CloseCurseur
 
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cGrf Is Nothing Then cGrf.CloseCurseur
  Set cGrf = New BDCurseur
  
  sFinalWP = "grf_numgrf='" & colChamps("grf_numgrf") & "'"
  sQuery = "select * from Groupement where " & sFinalWP
  cGrf.OpenCurseur sQuery
  cGrf.MoveFirst
  
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cGrf Is Nothing

  If bOpG�n�rale Then
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
      MsgBox "Op�ration g�n�rale sans modification !" & vbCrLf & "Vous devez modifier au moins un champ pour lancer une op�ration g�n�rale, sinon annulez l'op�ration g�n�rale en cours.", vbExclamation, App.Title
      Exit Sub
    End If
    
    sSQL = sSQL & ",timestamp=current where " & sFinalWP
    If Not bOp�rationG�n�rale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    ' On r�-ex�cute la requ�te, sinon la buff�risation locale emp�che l'affichage des champs modifi�s
    SetMessage "Lecture des donn�es modifi�es, patientez�"
    Screen.MousePointer = vbHourglass
    If Not cGrf Is Nothing Then cGrf.CloseCurseur
    cGrf.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cGrf.Edit
      
    If Not bPr�pareEditAdd(cGrf, colColonnes, colChamps) Then
      Exit Sub
    End If
  
  End If
  
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
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
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cGrf Is Nothing Then
    If Not (cGrf.EOF And cGrf.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
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
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True
  
  colChamps("grf_numgrf").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cGrf Is Nothing
  
  ' Op�ration g�n�rale = Shift+Changement
  bOpG�n�rale = bShiftPressed
  
  colChamps("grf_nom").SetFocus
  AutoSelect colChamps("grf_nom"), True
  
  If cGrf.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "grf_numgrf", False
  ActiveChamp "timestamp", False
  ActiveChamp "grf_idmodif", False
  
  If bOpG�n�rale Then
    ActiveChamp "grf_nom", False
  End If
  
  iMode = meChange
  
  If bOpG�n�rale Then
    SetMessage "OP�RATION G�N�RALE - D�finissez les champs modifi�s, puis validez [Entr�e] ou abandonnez [�chap]"
    EffaceFormulaire
  Else
    SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
  End If
End Sub


Public Sub ActionAdd()
  colChamps("grf_nom").SetFocus
  
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "grf_numgrf", False
  ActiveChamp "timestamp", False
  ActiveChamp "grf_idmodif", False
    
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
  
  ' Valeurs par d�faut
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
  
  If cGrf.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from etablissement where etb_numgrf='" & colChamps("grf_numgrf") & "'")
  If iNb > 0 Then
    MsgBox "Impossible de supprimer le groupement, il reste " & iNb & " �tablissement(s) rattach�(s).", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cGrf.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
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
  
  bdS�l.ActiveMouvements iMode = meNavigate
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cGrf Is Nothing

  bdS�l.ButtonEnabled("First") = cGrf.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cGrf.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cGrf.EOF
  bdS�l.ButtonEnabled("Last") = Not cGrf.EOF
End Sub


Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cGrf.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
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
' Actions du s�lecteur

Private Sub bdS�l_ActionAdd():      ActionAdd:      End Sub
Private Sub bdS�l_ActionCancel():   ActionCancel:   End Sub
Private Sub bdS�l_ActionChange():   ActionChange:   End Sub
Private Sub bdS�l_ActionDelete():   ActionDelete:   End Sub
Private Sub bdS�l_ActionFirst():    ActionFirst:    End Sub
Private Sub bdS�l_ActionLast():     ActionLast:     End Sub
Private Sub bdS�l_ActionNext():     ActionNext:     End Sub
Private Sub bdS�l_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdS�l_ActionQuery():    ActionQuery:    End Sub
Private Sub bdS�l_ActionValidate(): ActionValidate: End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
End Sub


' Filtrage des Entr�e intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub


' Pour ajouter un groupement avec n� impos�
Private Sub txtChamp_DblClick(Index As Integer)
  If txtChamp(Index).DataField = "grf_numgrf" And iMode = meAdd Then
    BDActiveChamp txtChamp(Index), True
  End If
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas pr�sente dans la base de donn�es courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  Show
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
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
  bdS�l.LectureSeule = bLectureSeule
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  bdS�l.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, App.Title
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
    
    bdS�l.NumRec = cGrf.AbsolutePosition
    
    'On efface les champs qui seront affich�s par le timer
    txtBanque = ""
    txtDerligne = ""
        
    ActiveTimer mtRapide      ' Mise � jour en arri�re plan
    
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cGrf.bEffac� = True
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
  bdS�l.NumRec = ""
End Sub


' Activation du timer de mise � jour des champs satellites
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
  ' Mise � jour des champs pendant la saisie
  
  ' Mise � jour du champ txt_banque
  If txtChamp(Index).DataField = "grf_banque" Then
    If IsNumeric(txtChamp(Index)) Then
      txtBanque = sGetBanque(txtChamp(Index))
    Else
      txtBanque = ""
    End If
  End If
  
  ' Mise � jour du champ txt_derligne
  If txtChamp(Index).DataField = "grf_rab" Then
    If IsNumeric(txtChamp(Index)) Then
      txtDerligne = sGetLibfcent(txtChamp(Index))
    Else
      txtDerligne = ""
    End If
  End If
End Sub

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub


'=================================================================================
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cGrf, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  DoEtat True
End Sub

Public Sub Aper�u()
  DoEtat False
End Sub

Private Sub DoEtat(ByVal bImpression As Boolean)
  Dim iChoix As Integer
  
  iChoix = frmMessageChoix.ChoixEtat("Groupements (simple)", "Groupements (d�taill�)")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from groupement where " & sFinalWP

  Select Case iChoix
    Case 1: BDEtat sSQL, drGroupementSimple, bImpression
    Case 2: BDEtat sSQL, drGroupementD�taill�, bImpression
  End Select
End Sub

