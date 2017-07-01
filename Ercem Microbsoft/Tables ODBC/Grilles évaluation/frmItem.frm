VERSION 5.00
Begin VB.Form frmItem 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des items"
   ClientHeight    =   5535
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9015
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmItem.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   369
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   601
   Tag             =   "Donn�es"
   Begin GrillesEvaluation.BDCombo bdcEdLangue 
      Height          =   330
      Left            =   3300
      TabIndex        =   3
      Top             =   480
      Width           =   2355
      _ExtentX        =   4154
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
      DataField       =   "^*it_langue"
   End
   Begin VB.TextBox txtSousRubrique 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2400
      Locked          =   -1  'True
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   1920
      Width           =   6555
   End
   Begin VB.TextBox txtRubrique 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2400
      Locked          =   -1  'True
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   1560
      Width           =   6555
   End
   Begin VB.TextBox txtSecteur 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2400
      Locked          =   -1  'True
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   1200
      Width           =   6555
   End
   Begin VB.TextBox txtTh�me 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2400
      Locked          =   -1  'True
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   840
      Width           =   6555
   End
   Begin VB.CheckBox chkContr�leDoublons 
      Caption         =   "&Contr�ler les doublons de libell�s"
      Height          =   255
      Left            =   4800
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   2340
      Value           =   1  'Checked
      Width           =   4095
   End
   Begin VB.CommandButton btnUtil 
      Caption         =   "&Utilisation de l'item"
      Height          =   315
      Left            =   6660
      TabIndex        =   33
      TabStop         =   0   'False
      ToolTipText     =   "Utilisation de l'item s�lectionn�"
      Top             =   480
      Width           =   2295
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*it_libelle"
      Height          =   1035
      Index           =   10
      Left            =   1560
      MaxLength       =   180
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   20
      Top             =   2640
      Width           =   7395
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "it_comment"
      Height          =   315
      Index           =   9
      Left            =   1560
      MaxLength       =   60
      TabIndex        =   22
      Top             =   3720
      Width           =   7395
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "it_sousrub"
      Height          =   315
      Index           =   1
      Left            =   1560
      TabIndex        =   15
      Top             =   1920
      Width           =   795
   End
   Begin GrillesEvaluation.BDS�lecteur bdS�l 
      Height          =   435
      Left            =   0
      TabIndex        =   34
      Top             =   0
      Width           =   9075
      _ExtentX        =   16007
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
   Begin VB.TextBox txtChamp 
      DataField       =   "^it_titre"
      Height          =   315
      Index           =   2
      Left            =   1560
      MaxLength       =   1
      TabIndex        =   18
      Top             =   2280
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*it_rubrique"
      Height          =   315
      Index           =   8
      Left            =   1560
      TabIndex        =   12
      Top             =   1560
      Width           =   795
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   960
      Top             =   540
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*it_secteur"
      Height          =   315
      Index           =   6
      Left            =   1560
      TabIndex        =   9
      Top             =   1200
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*^it_theme"
      Height          =   315
      Index           =   4
      Left            =   1560
      TabIndex        =   6
      Top             =   840
      Width           =   795
   End
   Begin VB.Frame frlTra�abilit� 
      Caption         =   "Tra�abilit�"
      Height          =   1395
      Left            =   60
      TabIndex        =   35
      Top             =   4080
      Width           =   8895
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   22
         Left            =   1500
         TabIndex        =   32
         Top             =   960
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "it_datecreat"
         Height          =   315
         Index           =   17
         Left            =   1500
         TabIndex        =   24
         Top             =   240
         Width           =   1095
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "it_heurecreat"
         Height          =   315
         Index           =   18
         Left            =   2640
         TabIndex        =   25
         Top             =   240
         Width           =   915
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "it_datemodif"
         Height          =   315
         Index           =   19
         Left            =   1500
         TabIndex        =   28
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "it_heuremodif"
         Height          =   315
         Index           =   20
         Left            =   2640
         TabIndex        =   29
         Top             =   600
         Width           =   915
      End
      Begin GrillesEvaluation.BDCombo bdcoperModif 
         Height          =   330
         Left            =   3600
         TabIndex        =   30
         Top             =   600
         Width           =   5175
         _ExtentX        =   9128
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
         DataField       =   "it_opermodif"
      End
      Begin GrillesEvaluation.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3600
         TabIndex        =   26
         Top             =   240
         Width           =   5175
         _ExtentX        =   9128
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
         DataField       =   "it_opercreat"
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   31
         Top             =   1020
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Cr�� le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   23
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifi� le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   27
         Top             =   660
         Width           =   1020
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*it_numit"
      Height          =   315
      Index           =   0
      Left            =   1560
      TabIndex        =   1
      Top             =   480
      Width           =   795
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Sous-rubrique :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   14
      Top             =   1980
      Width           =   1470
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   21
      Top             =   3780
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Type :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   17
      Top             =   2340
      Width           =   585
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rubrique :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   11
      Top             =   1620
      Width           =   975
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Secteur :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   8
      Top             =   1260
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Langue :"
      Height          =   210
      Index           =   10
      Left            =   2400
      TabIndex        =   2
      Top             =   540
      Width           =   840
   End
   Begin VB.Label lblChamp 
      Caption         =   "Th�me :"
      Height          =   195
      Index           =   7
      Left            =   60
      TabIndex        =   5
      Top             =   900
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libell� :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   19
      Top             =   2700
      Width           =   735
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
Attribute VB_Name = "frmItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmItem
' Feuille de gestion des items
' 16/11/1999 NC
' 13/12/1999 NC Purge du cache des items utilis� par la gestion des grilles et sc�narios
' 27/12/1999 PV Affichage des th�mes et secteurs
' 10/03/2000 PV Import
'  5/06/2000 PV M�moire F5
' 20/10/2000 PV G�n�ralisation de l'import


Option Explicit

Private cItem As BDCurseur                ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private Const sTable = "items"


'=================================================================================
' Acc�s direct

Public Sub AfficheItem(ByVal sWP As String)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmItem
    F.AfficheItem sWP
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
  Dim bRequ�teVide As Boolean
  
  bRequ�teVide = (sWP = "")
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
      If t.DataField <> "it_langue" Then bRequ�teVide = False
    End If
  Next
  
  If bRequ�teVide Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    If sWP = "" Then sWP = "1=1"    ' Ne pas modifier, ce n'est pas une erreur !
  End If
  
  Dim cItemQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from items where " & sWP


  cItemQuery.OpenCurseur sQuery
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
  If Not cItem Is Nothing Then cItem.CloseCurseur
  Set cItem = cItemQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cItem.EOF And cItem.BOF) Then
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
  
  ' On regarde si le nom n'existe pas d�j� (parmi les items de la langue)
  If chkContr�leDoublons = vbChecked Then
    Dim iSer As Long
    Dim sSQL As String
    
    sSQL = "select it_numit from items where it_libelle=" & sFormToSQL(colChamps("it_libelle"), BDTypeCHAR) & " and it_langue=" & sFormToSQL(colChamps("it_langue"), BDTypeCHAR)
    If colChamps("it_numit") <> "" Then sSQL = sSQL & " and it_numit<>" & colChamps("it_numit")
    iSer = BDCurseurExpress(sSQL)
    If iSer <> 0 Then
      MsgBox "ATTENTION - Cet item existe d�j� sous le n� " & iSer, vbExclamation, App.Title
      Exit Function
    End If
  End If
  
  ' On v�rifie que si it_titre=F l'item contient une formule
   If colChamps("it_titre") = "F" Then
      If InStr(1, colChamps("it_libelle"), "|") = 0 Then
        MsgBox "ATTENTION - Cet item est de type formule mais le libell� de l'item ne contient pas de formule", vbExclamation, App.Title
        colChamps("it_titre").SetFocus
        AutoSelect colChamps("it_titre"), True
        Exit Function
      End If
   End If
      
   ' On v�rifie que si l'item contient une formule it_titre="F"
   If InStr(1, colChamps("it_libelle"), "|") > 0 Then
      If colChamps("it_titre") <> "F" Then
        MsgBox "ATTENTION - Cet item contient une formule mais n'est pas de type formule", vbExclamation, App.Title
        colChamps("it_titre").SetFocus
        AutoSelect colChamps("it_titre"), True
        Exit Function
      End If
   End If
      
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim iSerie As Long
  
  Assert iMode = meAdd
  
  ' On �limine les retours � la ligne intempestifs
  TrimCrLf colChamps("it_libelle"), ""
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cItemAdd As New BDCurseur
  cItemAdd.OpenCurseur "select * from items where it_numit=0"
  cItemAdd.AddNew
  
  ' G�n�ration du n� d'item
  If colChamps("it_numit") = "" Then
    RunSQL "insert into serialitem values(0)"
    iSerie = BDCurseurExpress("select max(serialitem) from serialitem")
    If iSerie < 10 Then   ' S�curit� nouvelles bases
      RunSQL "insert into serialitem values(10)"
      iSerie = 10
    End If
    colChamps("it_numit") = iSerie
    ' On purge les enregistrements ajout�s dans serialitem pour la g�n�ration des n�s de s�rie
    RunSQL "delete from serialitem where serialitem<" & iSerie
  End If

  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "it", True

' Seuls les champs actifs sont mis � jour
  ActiveTra�abilit� True
  ActiveChamp "it_numit", True
  
  If Not bPr�pareEditAdd(cItemAdd, colColonnes, colChamps) Then
    cItemAdd.CloseCurseur
    ActiveTra�abilit� False
    ActiveChamp "it_numit", False
    Exit Sub
  End If
  cItemAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cItem Is Nothing Then cItem.CloseCurseur
  Set cItem = New BDCurseur
  
  sFinalWP = "it_numit=" & colChamps("it_numit")
  sQuery = "select * from items where it_numit=" & sFormToSQL(colChamps("it_numit"), BDTypeINTEGER) & " and it_langue=" & sFormToSQL(colChamps("it_langue"), BDTypeCHAR)
  cItem.OpenCurseur sQuery
  cItem.MoveFirst
  
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True   ' Active mouvements + change + delete
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements
  
  ' On purge le cache pour cet item
  PurgeCacheItems colChamps("it_numit"), colChamps("it_langue")
  
  M�morise
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cItem Is Nothing
  
  ' On �limine les retours � la ligne intempestifs
  TrimCrLf colChamps("it_libelle"), ""
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cItem.Edit
      
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "it", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
    
  If Not bPr�pareEditAdd(cItem, colColonnes, colChamps) Then
    ActiveTra�abilit� False
    Exit Sub
  End If
  
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements
  
  ' On purge le cache pour cet item
  PurgeCacheItems colChamps("it_numit"), colChamps("it_langue")

  M�morise
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


Private Sub ActionValidate()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
 
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub



Private Sub ActionCancel()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  BDActiveFormulaire colChamps, False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cItem Is Nothing Then
    If Not (cItem.EOF And cItem.BOF) Then
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
  
  ' Valeur par d�faut
  bdcEdLangue = cLangage
    
  colChamps("it_numit").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cItem Is Nothing
  
  If cItem.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "it_numit", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False


  colChamps("it_libelle").SetFocus
  AutoSelect colChamps("it_libelle"), True
  bdS�l.TabStop = False

  iMode = meChange

  SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"

End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "it_numit", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
    
    ' Valeur par d�faut
  bdcEdLangue = cLangage
  colChamps("it_theme") = "W"
  colChamps("it_secteur") = 1
  colChamps("it_rubrique") = 1
  
  colChamps("it_titre").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub



Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cItem Is Nothing
  
  If cItem.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cItem.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cItem.MoveNext
  If cItem.EOF Then
    cItem.MovePrevious
    If cItem.BOF Then
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

Private Sub ActiveTra�abilit�(bEnable As Boolean)
  ActiveChamp "it_datecreat", bEnable
  ActiveChamp "it_heurecreat", bEnable
  ActiveChamp "it_opercreat", bEnable
  ActiveChamp "it_datemodif", bEnable
  ActiveChamp "it_heuremodif", bEnable
  ActiveChamp "it_opermodif", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cItem Is Nothing

  bdS�l.ButtonEnabled("First") = cItem.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cItem.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cItem.EOF
  bdS�l.ButtonEnabled("Last") = Not cItem.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cItem.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cItem.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cItem.MoveNext
  AjusteMouvements
  If cItem.EOF Then cItem.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cItem.MovePrevious
  AjusteMouvements
  If cItem.BOF Then cItem.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub bdcEdLangue_Change()
  ToMaj bdcEdLangue
End Sub

Private Sub bdcEdLangue_LostFocus()
  bdcEdLangue.Synchronise
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



Private Sub btnUtil_Click()
    If IsNumeric(colChamps("it_numit")) Then frmUtiliseItem.AfficheUtiliseItem colChamps("it_numit")
End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim c As Control
  
  If KeyCode = vbKeyF5 Then   ' M�moire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set c = ActiveControl
          c = colM�moireItem(ActiveControl.DataField)
          c.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each c In colChamps
        If Not c.Locked Then      ' On ne remplit pas les champs verrouill�s
          c = colM�moireItem(c.DataField)
        End If
      Next
    End If
  Else
    bdS�l.KeyDown KeyCode
  End If
End Sub

Private Sub Form_Keypress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
  If KeyAscii = 13 Then KeyAscii = 0
End Sub

' Filtrage des Entr�e intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub

Private Sub txtChamp_KeyPress(Index As Integer, KeyAscii As Integer)
  If KeyAscii = 13 Then KeyAscii = 0
End Sub

' M�canisme de type formule automatique si | dans le libell�
Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "it_libelle" And InStr(txtChamp(Index), "|") <> 0 Then
    colChamps("it_titre") = "F"
  End If
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos
  
  ' Utilisateurs
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
  Next
  
  ' Langues
  Dim l As Langue
  For Each l In colLangue
    bdcEdLangue.AddItem l.lan_code, l.lan_langue
  Next
  
  
  ' Formulaire en mode initial
  Set cItem = Nothing
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
  If Not cItem Is Nothing Then cItem.CloseCurseur
  MDIGrilles.AjusteMenus -1
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
  If cItem Is Nothing Then
    EffaceFormulaire
  ElseIf cItem.BOF And cItem.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cItem.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cItem.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cItem.AbsolutePosition
    
    txtTh�me = ""
    txtSecteur = ""
    txtRubrique = ""
    txtSousRubrique = ""
    ActiveTimer mtRapide      ' Mise � jour en arri�re plan

  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cItem.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

  If colChamps("it_theme") <> "" Then
    txtTh�me = sGetTh�me(colChamps("it_theme"))
    If colChamps("it_secteur") <> "" Then
      txtSecteur = sGetSecteur(colChamps("it_theme"), colChamps("it_secteur"))
      If colChamps("it_rubrique") <> "" Then
        txtRubrique = sGetRubrique(colChamps("it_theme"), colChamps("it_secteur"), colChamps("it_rubrique"))
        If colChamps("it_sousrub") <> "" Then txtSousRubrique = sGetSousRub(colChamps("it_theme"), colChamps("it_secteur"), colChamps("it_rubrique"), colChamps("it_sousrub"))
      End If
    End If
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  txtTh�me = ""
  txtSecteur = ""
  txtRubrique = ""
  txtSousRubrique = ""
  bdS�l.NumRec = ""
End Sub


' Activation du timer de mise � jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
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

Private Sub bdcEdLangue_GotFocus()
  SetStatus bdcEdLangue.Tag
End Sub

Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcOperModif.Tag
End Sub


' Double-clic sur n� d'item
Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "it_numit" Then
    ActiveChamp "it_numit", True
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
  BDCopieS�lection cItem, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  Etat True
End Sub

Public Sub Aper�u()
  Etat False
End Sub

Private Sub Etat(ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from items where " & sFinalWP & " order by it_libelle"

  BDEtat sSQL, drItems, bImpression
End Sub


'=================================================================================
' Import de donn�es

Private Sub Cl�sImport(Optional ByRef tsCl�sLigne1 As Variant, Optional tsCl�sBase As Variant, Optional tsD�faut As Variant)
  If Not IsMissing(tsCl�sLigne1) Then tsCl�sLigne1 = Array("Langue", "Th�me", "Secteur", "Rubrique", "Sous-rubrique", "Titre", "*Libell�")
  If Not IsMissing(tsCl�sBase) Then tsCl�sBase = Array("it_langue", "it_theme", "it_secteur", "it_rubrique", "it_sousrub", "it_titre", "it_libelle")
  If Not IsMissing(tsD�faut) Then tsD�faut = Array(cLangage, "K", "1", "1", "", "", "")
End Sub

Public Sub Importer()
  Dim tsCl�sL1 As Variant     ' Tableau des cl�s, * en pr�fixe des cl�s obligatoires
  Dim tsD�faut As Variant     ' Tableau des valeurs par d�faut, de m�me taille que le tableau des cl�s
  
  Cl�sImport tsCl�sLigne1:=tsCl�sL1, tsD�faut:=tsD�faut
  Pr�pareImport Me, "Import d'items", tsCl�sL1, tsD�faut, frmImport
End Sub


Public Sub ImportCallBack()
  Dim x As ListItem
  Dim h As ColumnHeaders
  Dim iSerial As Long
  Dim s
  Dim tsCl�sL1 As Variant     ' Tableau des cl�s, * en pr�fixe des cl�s obligatoires
  Dim tsCl�sBase As Variant   ' Tableau des colonnes de la base
  Dim i As Integer
  
  frmImport.btnAnnuler.Enabled = False
  frmImport.btnImporter.Enabled = False
  SetStatus "Import en cours, patientez..."
  
  Cl�sImport tsCl�sLigne1:=tsCl�sL1, tsCl�sBase:=tsCl�sBase
  Set h = frmImport.lvImport.ColumnHeaders
  For Each x In frmImport.lvImport.ListItems
    iSerial = BDCurseurExpress("select it_numit from items where it_langue='" & x.SubItems(1) & "' and it_libelle=" & sFormToSQL(x.SubItems(7), BDTypeCHAR))
    If iSerial = 0 Then
      x.Text = "A cr�er"
      
      EffaceFormulaire
      BDActiveFormulaire colChamps, True
      ActiveChamp "it_numit", False
      ActiveChamp "timestamp", False
      ActiveTra�abilit� False
      iMode = meAdd
      For i = 1 To UBound(tsCl�sL1)
        colChamps(tsCl�sBase(i)) = Trim(x.SubItems(h(tsCl�sL1(i)).Index - 1))
      Next
      colChamps("it_comment") = "Item import�"
      ValidateAdd
      If colChamps("it_numit") <> "" Then
        x.Text = "Cr�� sous le n�" & colChamps("it_numit")
      Else
        x.Text = "*** NON CR�� !"
      End If
    Else
      x.Text = "Existe d�j� sous le n�" & iSerial
    End If
    AjusteListView frmImport, frmImport.lvImport
  Next
  
  frmImport.btnAnnuler.Enabled = True
  frmImport.btnAnnuler.Caption = "Fermer"
  SetStatus
End Sub


Public Function iCr�eItemD�faut(cLangue As String, cTexte As String) As Long
  Show
  EffaceFormulaire
  BDActiveFormulaire colChamps, True
  ActiveChamp "it_numit", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  iMode = meAdd
  colChamps("it_langue") = cLangue
  colChamps("it_libelle") = cTexte
  colChamps("it_comment") = "Item import�"
  colChamps("it_theme") = "K"
  colChamps("it_secteur") = "1"
  colChamps("it_rubrique") = "1"
  chkContr�leDoublons.Value = vbUnchecked
  ValidateAdd
  ActiveTimer mtStop
  If colChamps("it_numit") <> "" Then
    iCr�eItemD�faut = colChamps("it_numit")
  Else
    iCr�eItemD�faut = 0
  End If
  Hide
  DoEvents
End Function


'=================================================================================
' M�morisation

Public Sub M�morise()
  EffaceCollection colM�moireItem
  
  Dim t As Control
  For Each t In colChamps
    colM�moireItem.Add (t), t.DataField
  Next
End Sub

