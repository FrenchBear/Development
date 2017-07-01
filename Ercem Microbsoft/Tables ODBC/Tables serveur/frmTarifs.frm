VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form frmTarif 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des tarifs"
   ClientHeight    =   5685
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9465
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmTarifs.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   379
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   631
   Tag             =   "Donn�es"
   Begin VB.CommandButton btnRollback 
      Caption         =   "Rollback"
      Height          =   315
      Left            =   7200
      TabIndex        =   21
      Top             =   2340
      Width           =   1275
   End
   Begin TablesServeur.BDS�lecteurTableau bdS�lTab 
      Height          =   2040
      Left            =   60
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   3060
      Width           =   390
      _ExtentX        =   688
      _ExtentY        =   3598
   End
   Begin TrueOleDBGrid60.TDBGrid tdgD�tail 
      Height          =   2955
      Left            =   540
      OleObjectBlob   =   "frmTarifs.frx":014A
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   3060
      Width           =   8895
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   6240
      Top             =   2280
   End
   Begin TablesServeur.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   20
      Top             =   0
      Width           =   9465
      _ExtentX        =   16695
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
      DataField       =   "tar_remisec"
      Height          =   315
      Index           =   1
      Left            =   1500
      TabIndex        =   10
      Top             =   1560
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "tar_idmodif"
      Height          =   315
      Index           =   10
      Left            =   1500
      TabIndex        =   15
      Top             =   2280
      Width           =   3750
      _ExtentX        =   6615
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "tar_comment"
      Height          =   315
      Index           =   5
      Left            =   1500
      TabIndex        =   13
      Top             =   1920
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   65
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "tar_remiseb"
      Height          =   315
      Index           =   3
      Left            =   1500
      TabIndex        =   7
      Top             =   1200
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtNomTarifBase 
      Height          =   315
      Left            =   2340
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   840
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "tar_tarifbase"
      Height          =   315
      Index           =   2
      Left            =   1500
      TabIndex        =   4
      Top             =   840
      Width           =   795
      _ExtentX        =   1402
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
      Left            =   1500
      TabIndex        =   17
      Top             =   2640
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
      DataField       =   "*tar_libelle"
      Height          =   315
      Index           =   4
      Left            =   2340
      TabIndex        =   2
      Top             =   480
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*tar_numtarif"
      Height          =   315
      Index           =   0
      Left            =   1500
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
      Caption         =   "Remise C :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   9
      Top             =   1620
      Width           =   1005
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "% sur le tarif de base [chimie]"
      Height          =   210
      Index           =   4
      Left            =   2340
      TabIndex        =   11
      Top             =   1620
      Width           =   2835
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "% sur le tarif de base (ex: -2,5 pour 2,5% de remise) [bact�rio]"
      Height          =   210
      Index           =   2
      Left            =   2340
      TabIndex        =   8
      Top             =   1260
      Width           =   6000
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   14
      Top             =   2340
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remise B :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   990
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   16
      Top             =   2700
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   12
      Top             =   1980
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Tarif de base :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   1365
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Num�ro :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   870
   End
End
Attribute VB_Name = "frmTarif"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTarifs
' Gestion des tarifs
'  1/09/2000 PV
' 12/01/2001 PV sLiboption
' 13/02/2001 PV Tra�abilit� des op�rations g�n�rales
' 15/02/2001 PV Acc�s direct
'  1/03/2001 PV td_serial dans tarifdetail
' 17/04/2001 PV Gestion du mode lecture seule au niveau du tableau
' 28/05/2001 PV Annulation de transaction (btnRollback)
' 18/05/2001 PV bOp�rationG�n�rale
'  7/08/2001 PV Fin des prix Satti
'  8/12/2001 PV Tra�abilit� historique


Option Explicit

Private cTar As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private colColonnesD�tail As New Collection ' Colonnes de la table de d�tail (pour r�cup�rer la description)
Private iMode As eMode�dition             ' Mode du formulaire
Private bOpG�n�rale As Boolean

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private colHistorique As New Collection   ' Trace des modifications pour l'historique

Public xaTab As XArrayDB                  ' Donn�es du tableau
Public bTabModifi� As Boolean             ' Optimisation de la gestion du tableau
Public bTabModifSimple As Boolean         ' Vrai tant qu'il n'y a ni ajout ni suppression d'items

Const MAXCOL = 10

Private Const sTable = "tarif"


'=================================================================================
' M�thodes globales impl�ment�es par ce module, pour l'affichage du menu Commandes

Public Property Get sM�thodesGlobales() As String
  sM�thodesGlobales = "Historique"
End Property


'=================================================================================
' Acc�s direct

Public Sub AfficheTarif(ByVal sWP As String)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmTarif
    F.AfficheTarif sWP
    Exit Sub
  End If
  
  EffaceFormulaire
  BDActiveFormulaire colChamps, True
  iMode = meQuery
  ValidateQuery sWP
End Sub


'=================================================================================
' Fonction d'assistance, bug VB sans doute

Public Sub SetxaTab(ByVal iLigne As Integer, ByVal iColonne As Integer, ByVal v As Variant)
  xaTab(iLigne, iColonne) = v
End Sub


'=================================================================================
' Actions de validation

Private Sub ValidateQuery(Optional ByVal sWP As String)
  Assert iMode = meQuery
  
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
  
  Dim cTarQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from tarif where " & sWP & " order by tar_numtarif"
  
  cTarQuery.OpenCurseur sQuery
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
  If Not cTar Is Nothing Then cTar.CloseCurseur
  Set cTar = cTarQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cTar.EOF And cTar.BOF) Then
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
  
  ' On regarde si le nom n'existe pas d�j�
  Dim iSer As Long
  iSer = BDCurseurExpress("select tar_numtarif from tarif where tar_libelle=" & sFormToSQL(colChamps("tar_libelle"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("tar_numtarif") Then
    MsgBox "ATTENTION - Ce tarif existe d�j� sous le n� " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  If IsNumeric(colChamps("tar_tarifbase")) Then
    Dim tb As Integer
    tb = Val(colChamps("tar_tarifbase"))
    If tb < 1 Or tb = Val(colChamps("tar_numtarif")) Then
      MsgBox "Tarif de base invalide.", vbExclamation, App.Title
      colChamps("tar_tarifbase").SetFocus
      Exit Function
    End If
    iSer = BDCurseurExpress("select tar_numtarif from tarif where tar_numtarif=" & tb)
    If iSer = 0 Then
      MsgBox "Tarif de base inexistant.", vbExclamation, App.Title
      colChamps("tar_tarifbase").SetFocus
      Exit Function
    End If
  End If
  
  If (colChamps("tar_remiseb") <> "" Or colChamps("tar_remisec") <> "") And colChamps("tar_tarifbase") = "" Then
    MsgBox "La remise n'a de sens qu'avec un tarif de base."
    colChamps("tar_remiseb").SetFocus
    Exit Function
  End If


  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Function bOkValeursOpGen() As Boolean
  bOkValeursOpGen = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cTarAdd As New BDCurseur
  cTarAdd.OpenCurseur "select * from tarif where tar_numtarif=0"
  cTarAdd.AddNew
  
  ' G�n�ration du n� de s�rie
  Dim cNumTar As New BDCurseur
  cNumTar.OpenCurseur "select max(tar_numtarif) from tarif where tar_numtarif<25000"
  If IsNull(cNumTar.Fields(0)) Then
    colChamps("tar_numtarif") = "10"
  Else
    colChamps("tar_numtarif") = cNumTar.Fields(0) + 1
  End If
  cTarAdd!tar_numtarif = cNumTar.Fields(0) + 1
  cNumTar.CloseCurseur

' ' Seuls les champs actifs sont mis � jour
  ActiveChamp "tar_numtarif", True

  If Not bPr�pareEditAdd(cTarAdd, colColonnes, colChamps) Then
    cTarAdd.CloseCurseur
    ActiveChamp "tar_numtarif", False
    Exit Sub
  End If
  cTarAdd.CloseCurseur
  
   
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cTar Is Nothing Then cTar.CloseCurseur
  Set cTar = New BDCurseur
  
  sFinalWP = "tar_numtarif=" & colChamps("tar_numtarif")
  sQuery = "select * from tarif where " & sFinalWP
  cTar.OpenCurseur sQuery
  cTar.MoveFirst
  
  
  ' Historique
  Dim sMsgTrace As String
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      ' On enregistre uniquement si les champs ne sont pas vides
      If ValeurContr�le(c) <> "" Then
        If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
        sMsgTrace = sMsgTrace & c.DataField & ":" & ValeurContr�le(c)
      End If
    End If
  Next
  JournalUnix sTable & " " & colChamps("tar_numtarif"), "cr��", sMsgTrace


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
  Assert Not cTar Is Nothing

  If bOpG�n�rale Then
    Dim sSQL As String
    
    If Not bOkValeursOpGen Then Exit Sub
    
    sSQL = "update tarif set "
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
    
    sSQL = sSQL & ",timestamp=current,tar_datemodif=current,tar_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",tar_opermodif=" & iNumOp�rateur & " where " & sFinalWP
    If Not bOp�rationG�n�rale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    
    ' On r�-ex�cute la requ�te, sinon la buff�risation locale emp�che l'affichage des champs modifi�s
    SetMessage "Lecture des donn�es modifi�es, patientez�"
    Screen.MousePointer = vbHourglass
    If Not cTar Is Nothing Then cTar.CloseCurseur
    cTar.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cTar.Edit
      
    If Not bPr�pareEditAdd(cTar, colColonnes, colChamps) Then Exit Sub
    
    ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a �t� chang�
    Dim c As Control
    Dim sMsgTrace As String
    For Each c In Controls
      If DataFieldEx(c) <> "" Then
        If colHistorique(c.DataField) <> ValeurContr�le(c) Then  ' Modifi� !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
             sMsgTrace = sMsgTrace & c.DataField & ":" & colHistorique(c.DataField) & "->" & ValeurContr�le(c)
        End If
      End If
     Next
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("tar_numtarif"), "chang�", sMsgTrace
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
  If Not cTar Is Nothing Then
    If Not (cTar.EOF And cTar.BOF) Then
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
  
  bdS�lTab.ButtonEnabled = False    ' Pas d'action tableau pendant une interrogation
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True
  
  colChamps("tar_numtarif").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cTar Is Nothing
  
  ' Op�ration g�n�rale = Shift+Changement
  bOpG�n�rale = bShiftPressed
  
  colChamps("tar_libelle").SetFocus
  AutoSelect colChamps("tar_libelle"), True
  
  If cTar.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  bdS�lTab.ButtonEnabled = False    ' Pas d'action tableau pendant un changement de t�te
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "tar_numtarif", False
  ActiveChamp "tar_idmodif", False
  ActiveChamp "timestamp", False
  
  If bOpG�n�rale Then
    ActiveChamp "tar_libelle", False
  Else
    ' On m�morise les valeurs avant le changement
    EffaceCollection colHistorique
    Dim c As Control
    For Each c In Controls
      If DataFieldEx(c) <> "" Then
        colHistorique.Add ValeurContr�le(c), c.DataField
      End If
    Next
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
  colChamps("tar_libelle").SetFocus
  
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  bdS�lTab.ButtonEnabled = False    ' Pas d'action tableau pendant un ajout
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "tar_numtarif", False
  ActiveChamp "timestamp", False
  ActiveChamp "tar_idmodif", False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cTar Is Nothing
  
  If cTar.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from etablissement where etb_tarif=" & colChamps("tar_numtarif"))
  If iNb > 0 Then
    MsgBox "Impossible de supprimer la fiche tarif, il reste " & iNb & " �tablissement(s) rattach�(s) � cette fiche.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  
  ' Historique
  Dim sMsgTrace As String
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      If ValeurContr�le(c) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & c.DataField & ":" & ValeurContr�le(c)
         End If
      End If
  Next
  ' On garde la trace de la destruction
  JournalUnix sTable & " " & colChamps("tar_numtarif"), "d�truit", sMsgTrace

  
  ' Synchrodelete sur tarif/tarifdetail est g�r� par des triggers
  
  ' On efface d'abord le d�tail
  RunSQL "delete from tarifdetail where td_numtarif=" & colChamps("tar_numtarif")
  
  On Error Resume Next
  cTar.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cTar.MoveNext
  If cTar.EOF Then
    cTar.MovePrevious
    If cTar.BOF Then
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
  Assert Not cTar Is Nothing

  bdS�l.ButtonEnabled("First") = cTar.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cTar.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cTar.EOF
  bdS�l.ButtonEnabled("Last") = Not cTar.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cTar.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cTar.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cTar.MoveNext
  AjusteMouvements
  If cTar.EOF Then cTar.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cTar.MovePrevious
  AjusteMouvements
  If cTar.BOF Then cTar.MoveFirst
  SynchroniseFormulaire
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


'=================================================================================

Public Sub ActionTabChange()
  If iMode <> meNavigate Then Exit Sub
  
  Assert Not cTar Is Nothing
  
  BDActiveChamp tdgD�tail, True
  tdgD�tail.AllowAddNew = False
  tdgD�tail.AllowUpdate = True
  bdS�l.ActiveMouvements False
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False

  bdS�lTab.ButtonEnabled("Change") = False
  bdS�lTab.ActiveValidation True
  bdS�lTab.ButtonEnabled("InsertRow") = True
  bdS�lTab.ButtonEnabled("DeleteRow") = True
  
  iMode = meChangeTab
  bTabModifi� = False
  bTabModifSimple = True        ' Par d�faut
  S�lectionneCellule 1, 3
  tdgD�tail_RowcolHistorique 0, 3   ' Affiche la ligne d'info
  tdgD�tail.SetFocus
  If xaTab.UpperBound(1) = 0 Then tdgD�tail_ButtonClick 1
End Sub

Private Sub ActionTabDeleteRow()
  Assert iMode = meChangeTab
  Assert Not cTar Is Nothing
  
  Dim fr As Integer, r As Integer
  If tdgD�tail.FirstRow = "" Then Exit Sub
  fr = tdgD�tail.FirstRow
  r = tdgD�tail.Row
  If fr + r <= xaTab.UpperBound(1) Then
    xaTab.DeleteRows fr + r
    tdgD�tail.ReBind
    tdgD�tail.FirstRow = fr
    On Error Resume Next
    tdgD�tail.Row = xaTab.UpperBound(1) - 1     ' On se positionne sur la derni�re ligne
    On Error GoTo 0
  End If
  bTabModifi� = True
  bTabModifSimple = False
  
  tdgD�tail.SetFocus
End Sub

Private Sub ActionTabInsertRow()
  Assert iMode = meChangeTab
  Assert Not cTar Is Nothing
  
  Dim fr As Integer, r As Integer
  If tdgD�tail.FirstRow = "" Then
    fr = 1
  Else
    fr = tdgD�tail.FirstRow
  End If
  r = tdgD�tail.Row
  If r < 0 Then r = 0         ' Cas o� le tableau est vide
  xaTab.InsertRows fr + r
  tdgD�tail.ReBind
  tdgD�tail.FirstRow = fr
  tdgD�tail.Row = r
  bTabModifi� = True
  bTabModifSimple = False
  
  tdgD�tail.SetFocus
End Sub


Private Function iCalcIndex(i As Integer) As Long
  Dim Index As Long
  
  ' Ordre de tri
  Index = xaTab(i, colNiveau) * 100000
  Select Case xaTab(i, colNiveau)
    Case 2:           ' Rubriques fixes par n� de rubrique
      Index = Index + xaTab(i, colOption)
      
    Case 20, 21, 22   ' Crit�res, FDA, EH: ordre de saisie
      Index = Index + i
    
    Case 30           ' Germes: par germe, m�thode, puis ordre de saisie
      Dim v As Variant
      v = Split(xaTab(i, colOption), "/")
      Index = Index + Abs(v(0)) * 100 + Asc(LCase(v(1))) - Asc("a")
    
    Case 40           ' Tarifs libres: ordre de saisie
      ' Nop
  
    Case 50, 51, 52, 53:        ' Rubriques fixes par n� de rubrique
      Index = Index + xaTab(i, colOption)
  End Select

  iCalcIndex = Index
End Function


Private Sub ActionTabValidate()
  Assert iMode = meChangeTab
  Assert Not cTar Is Nothing
  
  If tdgD�tail.DataChanged Then tdgD�tail.Update
  
  If bTabModifi� Then   ' Optimisation si pas de modif
  
    ' Cas sp�cial interdit d'enregistrement: la fiche vide !
    If xaTab.UpperBound(1) = 0 Then
      MsgBox "Le corps du tarif est vide, l'enregistrement est interdit.", vbExclamation, App.Title
      If Not bShiftPressed Then Exit Sub
    End If
    
    ' Contr�le g�n�ral des donn�es
    Dim i As Integer, j As Integer
    For i = 1 To xaTab.UpperBound(1)
      If Not IsEmpty(xaTab(i, colNiveau)) Then
      
        ' Devise incorrecte
        If Not IsNull(xaTab(i, colDevise)) Then
          Select Case UCase(xaTab(i, colDevise))
            Case "F", "E", "�": ' Ok
            Case Null, "":
              If IsNull(xaTab(i, colPrix)) Or xaTab(i, colPrix) = "" Then
                ' Ok
              Else
                MsgBox "Unit� mon�taire incorrecte si le prix est d�fini.", vbExclamation, App.Title
                S�lectionneCellule i, colPrix
                Exit Sub
              End If
          End Select
        End If
      
        ' D�tection de doublons
        For j = i + 1 To xaTab.UpperBound(1)
          If Val(xaTab(i, colNiveau)) = Val(xaTab(j, colNiveau)) Then
            If (Val(xaTab(i, colNiveau)) < 20 And Val(xaTab(i, colNiveau)) <> 2) Or (Val(xaTab(i, colNiveau)) >= 31 And Val(xaTab(i, colNiveau)) <= 33) Then
              MsgBox "Tarif forfaitaire d�fini deux fois.", vbExclamation, App.Title
              S�lectionneCellule i, 4
              Exit Sub
            End If
            
            If xaTab(i, colOption) = xaTab(j, colOption) Then
              MsgBox "Tarif " & xaTab(i, colNiveau) & ": " & xaTab(i, colOption) & " d�fini deux fois.", vbExclamation, App.Title
              S�lectionneCellule i, 4
              Exit Sub
            End If
          End If
        Next
  
      End If    ' if not isempty
    Next
    
    
    ' Tests Ok, on peut mettre � jour la base de donn�es
    Screen.MousePointer = vbHourglass
    Dim dBDTime As Date
    dBDTime = BDTime
    
    Dim cR As New BDCurseur
    If bTabModifSimple Then
      SetStatus "Mise � jour simple de la base de donn�es�"
      ' Mise � jour simplifi�e
      For i = 1 To xaTab.UpperBound(1)
        If Not IsEmpty(xaTab(i, colNiveau)) Then
          If xaTab(i, ColIndex) < 0 Then
            If xaTab(i, colSerial) <> 0 Then
              cR.OpenCurseur "select * from tarifdetail where td_serial=" & xaTab(i, colSerial)
              cR.Edit
            Else
              cR.OpenCurseur "select * from tarifdetail where td_serial=0"
              cR.AddNew
              cR!td_serial = 0
              cR!td_numtarif = colChamps("tar_numtarif")
              cR!td_index = iCalcIndex(i)
            End If
            cR!td_niveau = xaTab(i, colNiveau)
            cR!td_option = xaTab(i, colOption)
            cR!td_montant = VN(xaTab(i, colPrix))
            Select Case UCase(xaTab(i, colDevise))
              Case "F":      cR!td_devise = "F"
              Case "�", "E": cR!td_devise = "E"
              Case Else:     cR!td_devise = Null
            End Select
            cR!td_remise = VN(xaTab(i, colRemise))
            cR!td_comment = VN(xaTab(i, colComment))
            cR!td_idmodif = xaTab(i, colIdModif)
            cR!timestamp = dBDTime   ' Now + tOffsetNow

            cR.Update
            cR.CloseCurseur
          End If
        End If
      Next
    Else
      SetStatus "Mise � jour compl�te de la base de donn�es�"
      ' Mise � jour lourde
      Dim iSerie As Long
      Dim iTarif As Long
      Dim bTransactionInterrompue As Boolean
      
      iTarif = colChamps("tar_numtarif")
      
      ' On sauvegarde les donn�es d'origine (transaction manuelle !)
      bTransactionInterrompue = False
      RunSQL "update tarifdetail set td_niveau=td_niveau+1000 where td_numtarif=" & iTarif
      
      cR.OpenCurseur "select * from tarifdetail where td_numtarif=0"
      For i = 1 To xaTab.UpperBound(1)
        If Not IsEmpty(xaTab(i, colNiveau)) Then
          SetStatus "Mise � jour compl�te de la base de donn�es� " & i & "/" & xaTab.UpperBound(1)
          cR.AddNew
          
          cR!td_serial = 0
          cR!td_numtarif = colChamps("tar_numtarif")
          cR!td_index = iCalcIndex(i)
          cR!td_niveau = xaTab(i, colNiveau)
          cR!td_option = xaTab(i, colOption)
          cR!td_montant = VN(xaTab(i, colPrix))
          Select Case UCase(xaTab(i, colDevise))
            Case "F":       cR!td_devise = "F"
            Case "�", "E":  cR!td_devise = "E"
            Case Else:      cR!td_devise = Null
          End Select
          cR!td_remise = VN(xaTab(i, colRemise))
          cR!td_comment = VN(xaTab(i, colComment))
          cR!td_idmodif = xaTab(i, colIdModif)
          cR!timestamp = dBDTime   ' Now + tOffsetNow

          Dim iErr As Long, sErr As String
          On Error Resume Next
          cR.Update
          iErr = Err.Number
          If iErr Then sErr = sAjusteMessageODBC(Error)
          On Error GoTo 0
          If iErr Then
            cR.CancelUpdate
            ' Rollback de la transaction manuelle
            bTransactionInterrompue = True
            RunSQL "delete from tarifdetail where td_niveau<1000 and td_numtarif=" & iTarif
            RunSQL "update tarifdetail set td_niveau=td_niveau-1000 where td_numtarif=" & iTarif
            
            MsgBox "�chec lors de l'�criture des donn�es. Les donn�es n'ont pas �t� enregistr�es" & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
            Exit For
          End If
        End If
      Next
      cR.CloseCurseur
      
      ' On efface les donn�es d'origine
      If Not bTransactionInterrompue Then
        RunSQL "delete from tarifdetail where td_niveau>=1000 and td_numtarif=" & iTarif
      End If
    End If
    
    ' Touch de la t�te pour garter un timestamp de t�te en phase avec le corps
    RunSQL "update tarif set timestamp=current where tar_numtarif=" & iTarif   ' touch de la t�te
    
    Screen.MousePointer = vbDefault
    SetStatus
  End If    ' if bTabModifi�
  
  BDActiveChamp tdgD�tail, False
  tdgD�tail.AllowAddNew = False
  tdgD�tail.AllowUpdate = False
  bdS�lTab.ButtonEnabled = False
  bdS�lTab.ButtonEnabled("Change") = True
  
  bdS�l.ActiveMouvements True
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.SetFocus
  
  If bTabModifi� Then SynchroniseFormulaire     ' R�ffiche la liste tri�e
  
  iMode = meNavigate
End Sub

Private Sub S�lectionneCellule(i As Integer, c As Integer)
  On Error Resume Next
  tdgD�tail.Row = i - tdgD�tail.FirstRow
  If Err Then
    tdgD�tail.FirstRow = i
    tdgD�tail.Row = 0
  End If
  On Error GoTo 0
  tdgD�tail.col = c
  tdgD�tail.SetFocus
End Sub

Private Sub ActionTabCancel()
  Assert iMode = meChangeTab
  Assert Not cTar Is Nothing
  
  BDActiveChamp tdgD�tail, False
  tdgD�tail.AllowAddNew = False
  tdgD�tail.AllowUpdate = False
  bdS�lTab.ButtonEnabled = False
  bdS�lTab.ButtonEnabled("Change") = True
  
  bdS�l.ActiveMouvements True
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.SetFocus
  
  If bTabModifi� Or tdgD�tail.DataChanged Then SynchroniseFormulaire  ' Restore le tableau pr�c�dent
  
  iMode = meNavigate
End Sub

' Rollback manuel d'une transaction manuelle
Private Sub btnRollback_Click()
  If iMode <> meNavigate Then Exit Sub
  
  ' On v�rifie qu'il y a des enregistrements de tarifdetail de niveau >=1000
  Dim iTarif As Long, iNb As Integer
  iTarif = colChamps("tar_numtarif")
  iNb = BDCurseurExpress("select count(*) from tarifdetail where td_niveau>=1000 and td_numtarif=" & iTarif)
  If iNb = 0 Then
    MsgBox "La commande d'annulation de transaction ne fonctionne que sur les fiches-tarif contenant des enregistrements de d�tail de niveau>=1000, ce qui n'est pas le cas de cette fiche.", vbExclamation, App.Title
    Exit Sub
  End If

  ' C'est parti !
  RunSQL "delete from tarifdetail where td_niveau<1000 and td_numtarif=" & iTarif
  RunSQL "update tarifdetail set td_niveau=td_niveau-1000,timestamp=current where td_numtarif=" & iTarif
  RunSQL "update tarif set timestamp=current where tar_numtarif=" & iTarif   ' touch de la t�te
  RelitCorpsTarif
  
  ' Un peu de tra�abilit�
  JournalUnix "Tarif", "Rollback", "Tarif=" & iTarif
  
  MsgBox "Annulation de transaction bien r�alis�e.", vbInformation, App.Title
End Sub

Private Sub tdgD�tail_AfterInsert()
  bTabModifi� = True
  bTabModifSimple = False
End Sub

Private Sub tdgD�tail_AfterUpdate()
  bTabModifi� = True
  
  If iMode = meChangeTab Then
    Dim fr As Integer, r As Integer
    If tdgD�tail.FirstRow = "" Then
      fr = 1
    Else
      fr = tdgD�tail.FirstRow
    End If
    If tdgD�tail.Row = -1 Then
      r = xaTab.UpperBound(1)
    Else
      r = fr + tdgD�tail.Row
    End If

    ' On marque la ligne pour les modifs rapides
    If xaTab(r, ColIndex) > 0 Then xaTab(r, ColIndex) = -xaTab(r, ColIndex)
  End If
End Sub


'=================================================================================
' Actions du s�lecteur tableau

Private Sub bdS�lTab_ActionTabChange():     ActionTabChange:    End Sub
Private Sub bdS�lTab_ActionTabDeleteRow():  ActionTabDeleteRow: End Sub
Private Sub bdS�lTab_ActionTabInsertRow():  ActionTabInsertRow: End Sub
Private Sub bdS�lTab_ActionTabValidate():   ActionTabValidate:  End Sub
Private Sub bdS�lTab_ActionTabCancel():     ActionTabCancel:    End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  ResetChienDeGarde
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("t") Or KeyAscii = Asc("T") Then
    If bdS�lTab.ButtonEnabled("Change") Then
      KeyAscii = 0
      ActionTabChange
    End If
  Else
    If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
  End If
End Sub

' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDIServeur.mnuCommandes
  End If
End Sub

Private Sub tdgD�tail_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
  ' Contr�le manuel, pour pouvoir saisir directement un code unit�
  If ColIndex = 0 Or ColIndex = 1 Then
    Dim t As String
    t = tdgD�tail.Text
    If t = "" Then Exit Sub
    Dim i As Integer
    With tdgD�tail.Columns(ColIndex)
      For i = 0 To .ValueItems.Count - 1
        With .ValueItems(i)
          If t = .DisplayValue Then Exit Sub
          If t = .Value Then
            tdgD�tail.Text = .DisplayValue
            Exit Sub
          End If
        End With
      Next
    End With
    
    MsgBox "Valeur incorrecte ou inconnue.", vbExclamation, App.Title
    Cancel = True
  End If
End Sub

Private Sub tdgD�tail_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 Then
    tdgD�tail_ButtonClick 1
  Else
    bdS�lTab.KeyDown KeyCode, Shift
  End If
End Sub

' Filtrage des Entr�e intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub

Public Sub ZoomTableau()
  tdgD�tail_ButtonClick 1
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
'  If Not bExisteTable(sTable) Then
'    MsgBox "La table '" & sTable & "' n'est pas pr�sente dans la base de donn�es courante, affichage impossible.", vbCritical, App.Title
'    Unload Me
'    Exit Sub
'  End If

  ' Annulation manuelle de transaction brutalement interrompue
  ' R�serv� � PV pour l'instant !
  btnRollback.Visible = (iNumOp�rateur = 46)
  
  Show
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos
  ' nop
  
  ' Pr�paration de la grille
  With tdgD�tail
    .AllowRowSelect = False
    .AllowColSelect = False
    .AllowAddNew = False
    .AllowUpdate = False
    .AllowDelete = False
    .RecordSelectors = False
    .HighlightRowStyle.BackColor = RGB(180, 180, 255)
    .HighlightRowStyle.ForeColor = &H80000008
    .TabAction = 2    ' Grid navigation
    
    
    With .Columns(colSerial)
      .Caption = "Serial"
      .Width = 0
      .Visible = False
    End With
    
    With .Columns(ColIndex)
      .Caption = "Index"
      .Width = 18
      .Button = True
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With
    
    With .Columns(colNiveau)
      .Caption = "Niv"
      .Width = 25
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With
    
    With .Columns(colOption)
      .Caption = "Option"
      .Width = 1
      .Visible = False
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With
    
    With .Columns(colOptionClair)
      .Caption = "�l�ment"
      .Width = 210
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With
    
    With .Columns(colPrix)
      .Caption = "Prix"
      .Width = 80
    End With
  
    With .Columns(colDevise)
      .Caption = "Devise"
      .Width = 15
    End With
    
    With .Columns(colRemise)
      .Caption = "Remise"
      .Width = 70
    End With
    
    With .Columns(colComment)
      .Caption = "Commentaire"
      .Width = 160
    End With
  
    With .Columns(colIdModif)
      .Caption = "IDModif"
      .Width = 100
      .Visible = False
    End With
    
    With .Columns(colTimestamp)
      .Caption = "Timestamp"
      .Width = 150
      .Visible = False
    End With
  End With
    
  Set xaTab = New XArrayDB
  xaTab.ReDim 1, 0, 0, MAXCOL
  tdgD�tail.Array = xaTab
  
  BDActiveChamp tdgD�tail, False

  ' Formulaire en mode initial
  Set cTar = Nothing
  BDActiveFormulaire colChamps, False
  bdS�l.LectureSeule = bLectureSeule
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�lTab.ButtonEnabled = False
  bdS�lTab.LectureSeule = bLectureSeule

  iMode = meEmpty
    
  bdS�l.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_Resize()
  tdgD�tail.Height = ScaleHeight - tdgD�tail.Top - 3
End Sub



Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meChangeTab Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cTar Is Nothing Then cTar.CloseCurseur
  MDIServeur.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================
' D�tail des tarifs

Private Sub tdgD�tail_ButtonClick(ByVal ColIndex As Integer)
  If xaTab.UpperBound(1) = 0 And iMode <> meChangeTab Then Exit Sub
  tdgD�tail.AllowAddNew = True
  frmTarifD�tail.DoTarif Val(tdgD�tail.FirstRow) + tdgD�tail.Row, iMode = meChangeTab
  tdgD�tail.AllowAddNew = False
  tdgD�tail.ReBind    ' Quoi qu'il arrive
  If xaTab.UpperBound(1) = 0 Then ActionTabCancel
End Sub

Private Sub tdgD�tail_DblClick()
  tdgD�tail_ButtonClick 1
End Sub



'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cTar Is Nothing Then
    EffaceFormulaire
  ElseIf cTar.BOF And cTar.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cTar.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cTar.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cTar.AbsolutePosition
    ActiveTimer mtRapide              ' Mise � jour en arri�re plan
    bdS�lTab.ButtonEnabled = False    ' Aucune commande de tableau disponible
    xaTab.ReDim 1, 0, 0, MAXCOL       ' Efface le tableau
    tdgD�tail.ReBind             ' R�affichage de la grille
    txtNomTarifBase = ""
  End If
  Exit Sub

pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cTar.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Relecture du d�tail de la fiche tarif, suite � une annulation de transaction par exemple
Private Sub RelitCorpsTarif()
  xaTab.ReDim 1, 0, 0, MAXCOL       ' Efface le tableau
  tdgD�tail.ReBind                  ' R�affichage de la grille

  timSatellites_Timer
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  If colChamps("tar_tarifbase") <> "" Then
    txtNomTarifBase = sNomTarif(Val(colChamps("tar_tarifbase")))
  End If

  BDActiveChamp tdgD�tail, False
  
  Dim cV As New BDCurseur
  ' Le val �lite les probl�mes si le champ est vide
  cV.OpenCurseur "select * from tarifdetail " & _
                 "  where td_numtarif=" & Val(colChamps("tar_numtarif")) & _
                 "  order by td_niveau,td_index"
  Dim iRec As Integer
  iRec = 1
  Do Until cV.EOF
    xaTab.InsertRows iRec
    xaTab(iRec, colSerial) = cV!td_serial
    xaTab(iRec, ColIndex) = cV!td_index
    xaTab(iRec, colNiveau) = cV!td_niveau
    xaTab(iRec, colOption) = cV!td_option
    xaTab(iRec, colOptionClair) = sLibOption(CInt(cV!td_niveau), NV(cV!td_option))
    If IsNull(cV!td_montant) Then
      xaTab(iRec, colPrix) = cV!td_montant
    Else
      xaTab(iRec, colPrix) = Format(cV!td_montant, "0.00")
    End If
    xaTab(iRec, colDevise) = sDevise(NV(cV!td_devise))
    xaTab(iRec, colRemise) = cV!td_remise
    xaTab(iRec, colComment) = cV!td_comment
    xaTab(iRec, colIdModif) = cV!td_idmodif
    xaTab(iRec, colTimestamp) = cV!timestamp

    cV.MoveNext
    iRec = iRec + 1
  Loop
  cV.CloseCurseur
  tdgD�tail.Array = xaTab
  tdgD�tail.ReBind
  bdS�lTab.ButtonEnabled("change") = True
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdS�l.NumRec = ""
  xaTab.ReDim 1, 0, 0, 3
  tdgD�tail.ReBind
  txtNomTarifBase = ""
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

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

Private Sub tdgD�tail_RowcolHistorique(LastRow As Variant, ByVal LastCol As Integer)
  If iMode = meChangeTab Or tdgD�tail Is ActiveControl Then
    If colColonnesD�tail.Count = 0 Then BDD�critTable "tarifdetail", colColonnesD�tail

    Select Case tdgD�tail.col
      Case colSerial:     SetStatus colColonnesD�tail("td_serial").sDescription
      Case ColIndex:      SetStatus colColonnesD�tail("td_index").sDescription
      Case colNiveau:     SetStatus colColonnesD�tail("td_niveau").sDescription
      Case colOption:     SetStatus colColonnesD�tail("td_option").sDescription
      Case colDevise:     SetStatus colColonnesD�tail("td_devise").sDescription
      Case colPrix:       SetStatus colColonnesD�tail("td_montant").sDescription
      Case colRemise:     SetStatus colColonnesD�tail("td_remise").sDescription
      Case colComment:    SetStatus colColonnesD�tail("td_comment").sDescription
      Case colIdModif:    SetStatus colColonnesD�tail("td_idmodif").sDescription
      Case colTimestamp:  SetStatus colColonnesD�tail("timestamp").sDescription
      
      Case Else: SetStatus
    End Select
  End If
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
  BDCopieS�lection cTar, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

Public Sub CopieTableau()
  gtCopieTableau tdgD�tail, xaTab
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
  
  iChoix = frmMessageChoix.ChoixEtat("Liste des t�rifs s�lectionn�s", "D�tail du tarif courant")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String

  Select Case iChoix
    Case 1:
      sSQL = "select * from tarift where " & sFinalWP & " order by tar_numtarif"
      'BDEtat sSQL, drListeTarifs, bImpression
    
    Case 2:
      DoFormatageTarif cTar, bImpression, Me, 2
  End Select
End Sub


' Callback de l'aper�u avant impression
Public Sub PrintReport(ByVal iChoix As Integer)
  Etat iChoix, True
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("tar_numtarif") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

