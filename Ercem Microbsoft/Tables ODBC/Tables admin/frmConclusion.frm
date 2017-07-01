VERSION 5.00
Begin VB.Form frmConclusion 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des conclusions"
   ClientHeight    =   4590
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9090
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmConclusion.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   306
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   606
   Tag             =   "Donn�es"
   Begin VB.TextBox txtChamp 
      DataField       =   "*con_libellecourt"
      Height          =   315
      Index           =   2
      Left            =   1740
      MaxLength       =   30
      TabIndex        =   5
      Top             =   1200
      Width           =   5715
   End
   Begin TablesAdmin.BDCombo bdcLangue 
      Height          =   330
      Left            =   5160
      TabIndex        =   3
      Top             =   480
      Width           =   2295
      _ExtentX        =   4048
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
      DataField       =   "^*con_langue"
   End
   Begin TablesAdmin.BDS�lecteur bdS�l 
      Height          =   435
      Left            =   -60
      TabIndex        =   28
      Top             =   0
      Width           =   9135
      _ExtentX        =   16113
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
      DataField       =   "con_options"
      Height          =   315
      Index           =   8
      Left            =   1740
      TabIndex        =   8
      Top             =   2280
      Width           =   795
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   960
      Top             =   540
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "con_comment"
      Height          =   315
      Index           =   16
      Left            =   1740
      TabIndex        =   9
      Top             =   2640
      Width           =   7275
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "con_abrege"
      Height          =   315
      Index           =   6
      Left            =   1740
      TabIndex        =   7
      Top             =   1920
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*con_cprin"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   6
      Top             =   1560
      Width           =   795
   End
   Begin VB.Frame frlTra�abilit� 
      Caption         =   "Tra�abilit�"
      Height          =   1395
      Left            =   60
      TabIndex        =   19
      Top             =   3120
      Width           =   8955
      Begin TablesAdmin.BDCombo bdcoperModif 
         Height          =   330
         Left            =   3780
         TabIndex        =   15
         Top             =   600
         Width           =   5115
         _ExtentX        =   9022
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
         DataField       =   "con_opermodif"
      End
      Begin TablesAdmin.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3780
         TabIndex        =   12
         Top             =   240
         Width           =   5115
         _ExtentX        =   9022
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
         DataField       =   "con_opercreat"
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   22
         Left            =   1680
         TabIndex        =   16
         Top             =   960
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "con_datecreat"
         Height          =   315
         Index           =   17
         Left            =   1680
         TabIndex        =   10
         Top             =   240
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "con_heurecreat"
         Height          =   315
         Index           =   18
         Left            =   2760
         TabIndex        =   11
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "con_datemodif"
         Height          =   315
         Index           =   19
         Left            =   1680
         TabIndex        =   13
         Top             =   600
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "con_heuremodif"
         Height          =   315
         Index           =   20
         Left            =   2760
         TabIndex        =   14
         Top             =   600
         Width           =   975
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   22
         Top             =   1020
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Cr�� le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   20
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifi� le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   21
         Top             =   660
         Width           =   1020
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*con_libelle"
      Height          =   315
      Index           =   3
      Left            =   1740
      MaxLength       =   70
      TabIndex        =   4
      Top             =   840
      Width           =   7275
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "con_etat"
      Height          =   315
      Index           =   1
      Left            =   3540
      TabIndex        =   2
      Top             =   480
      Width           =   315
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "con_indice"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
      Top             =   480
      Width           =   795
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libell� court :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   29
      Top             =   1260
      Width           =   1275
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   27
      Top             =   2700
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Options :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   26
      Top             =   2340
      Width           =   870
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Abr�g� : "
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   25
      Top             =   1980
      Width           =   870
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Langue :"
      Height          =   210
      Index           =   10
      Left            =   4200
      TabIndex        =   24
      Top             =   540
      Width           =   840
   End
   Begin VB.Label lblChamp 
      Caption         =   "C. Prin :"
      Height          =   195
      Index           =   7
      Left            =   60
      TabIndex        =   23
      Top             =   1620
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libell� :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   18
      Top             =   900
      Width           =   735
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "�tat :"
      Height          =   210
      Index           =   1
      Left            =   2880
      TabIndex        =   17
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
Attribute VB_Name = "frmConclusion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmConclusion
' Feuille de gestion des conclusions
' 01/06/1999 NC
' 04/01/2000 NC Choix du n� de conclusion autoris� - Multilangue
' 12/01/2001 PV M�morisation, langue par d�faut
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des cr�ations
' 05/12/2001 FF Historique des r�cup�rations d'enregistrement

Option Explicit

Private cConc As BDCurseur                ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private colChange As New Collection       ' Trace des modifications
Private colD�truit As New Collection      ' Trace des d�structions d'enregistrement
Private colCr�� As New Collection         ' Trace des cr�ations

Private Const sTable = "conclusion"


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
      If t.DataField = "con_etat" Then bWPInt�greEtat = True
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cConcQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from conclusion where " & sWP
  'sQuery = "select * from conclusion where con_indice=" & sFormToSQL(colChamps("con_indice"), BDTypeINTEGER) & " and con_langue=" & sFormToSQL(colChamps("con_langue"), BDTypeCHAR)
  If Not bWPInt�greEtat Then sQuery = sQuery & " and con_etat is null"
  sQuery = sQuery & " order by con_indice"

  cConcQuery.OpenCurseur sQuery
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
  If Not cConc Is Nothing Then cConc.CloseCurseur
  Set cConc = cConcQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cConc.EOF And cConc.BOF) Then
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
  iSer = BDCurseurExpress("select con_indice from conclusion where con_libelle=" & sFormToSQL(colChamps("con_libelle"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("con_indice") Then
    MsgBox "ATTENTION - Ce conclusion existe d�j� sous le n� " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  ' G�n�ration du n� de s�rie
  
  Dim cConcAdd As New BDCurseur
  cConcAdd.OpenCurseur "select * from conclusion where con_indice=0"
  cConcAdd.AddNew
  
  ' G�n�ration du n� de s�rie
  
  If colChamps("con_indice") = "" Then
    Dim cnumcon As New BDCurseur
    cnumcon.OpenCurseur "select max (con_indice) from conclusion"
    colChamps("con_indice") = cnumcon.Fields(0) + 1
    cConcAdd!con_indice = cnumcon.Fields(0) + 1
    cnumcon.CloseCurseur
  End If
  
' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "con", True

' Seuls les champs actifs sont mis � jour
  ActiveTra�abilit� True
  ActiveChamp "con_indice", True
  
  If Not bPr�pareEditAdd(cConcAdd, colColonnes, colChamps) Then
    cConcAdd.CloseCurseur
    ActiveTra�abilit� False
    ActiveChamp "con_indice", False
    Exit Sub
  End If
  cConcAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cConc Is Nothing Then cConc.CloseCurseur
  Set cConc = New BDCurseur
  
  sFinalWP = "con_indice=" & colChamps("con_indice")
  ' sQuery = "select * from conclusion where " & sFinalWP
  sQuery = "select * from conclusion where con_indice=" & sFormToSQL(colChamps("con_indice"), BDTypeINTEGER) & " and con_langue=" & sFormToSQL(colChamps("con_langue"), BDTypeCHAR)
  cConc.OpenCurseur sQuery
  cConc.MoveFirst
  
  ' On m�morise toutes les valeurs saisie par l'utilisateur
  EffaceCollection colCr��
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colCr��.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Si on est en train d'ajouter un enregistrement, on recence ds l'historique la valeur des diff�rents param�tres
  If iMode = meAdd Then
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        ' On enregistre uniquement si les champs ne sont pas vides
        If ValeurContr�le(C) <> "" Then
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colCr��(C.DataField)
        End If
      End If
    Next
    ' On enregistre dans le journal la trace de la cr�ation
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "cr��", sMsgTrace
    End If
  End If
    
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements
  
  M�morise
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cConc Is Nothing
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cConc.Edit
      
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "con", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
    
  If Not bPr�pareEditAdd(cConc, colColonnes, colChamps) Then
    ActiveTra�abilit� False
    Exit Sub
  End If
  
  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a �t� chang�
  If iMode = meChange Then
    Dim C As Control
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        If colChange(C.DataField) <> ValeurContr�le(C) Then  ' Modifi� !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colChange(C.DataField) & "->" & ValeurContr�le(C)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "chang�", sMsgTrace
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
  If Not cConc Is Nothing Then
    If Not (cConc.EOF And cConc.BOF) Then
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
  
  colChamps("con_indice").SetFocus
  bdS�l.TabStop = False
  bdcLangue = cSyst�meLang
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cConc Is Nothing
  
  If cConc.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "con_indice", False
  ActiveChamp "con_etat", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False


  colChamps("con_libelle").SetFocus
  AutoSelect colChamps("con_libelle"), True
  bdS�l.TabStop = False

  iMode = meChange
  
' On m�morise les valeurs avant le changement
  EffaceCollection colChange
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colChange.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
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
  ActiveChamp "con_indice", False
  ActiveChamp "con_etat", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  bdcLangue = cSyst�meLang
  colChamps("con_libelle").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub



Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cConc Is Nothing
  
  If cConc.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  If bShiftPressed Then
    ActionD�truit             ' D�truit l'enregistrement
  Else
    ActionSupprime            ' Marque l'enregistrement supprim� (�tat S)
  End If
End Sub


Public Sub ActionSupprime()   ' Marque l'enregistrement supprim� (�tat S)
  If colChamps("con_etat") <> "" Then
    MsgBox "D�j� supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cConc.Edit
  cConc!con_etat = "S"
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "con", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  bPr�pareEditAdd cConc, colColonnes, colChamps
  ActiveTra�abilit� False
  
  ' On sp�cifie dans l'historique des modifications que le num�ro X est pass� � l'�tat de supprim�
  Dim sMsgTrace As String
  sMsgTrace = colChamps("con_indice") & "-> Etat S"
    If cConc!con_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "Supprim�", sMsgTrace
       End If
    End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub


Public Sub R�cup�re()   ' R�cup�re un enregistrement supprim� (�tat S)
  If colChamps("con_etat") <> "S" Then
    MsgBox "Vous ne pouvez r�cup�rer qu'un enregistrement supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cConc.Edit
  cConc!con_etat = Null
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "con", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  bPr�pareEditAdd cConc, colColonnes, colChamps
  ActiveTra�abilit� False
  
  ' Si on veut r�cup�rer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("con_indice") & " " & colChamps("con_langue") & " -> R�cup"
  If sMsgTrace <> "" Then
        JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "R�cup�r�", sMsgTrace
  End If
  
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub

  
Public Sub ActionD�truit()    ' D�truit l'enregistrement
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("con_etat") <> "S" Then
    MsgBox "Vous ne pouvez pas d�truire un enregistrement sans l'avoir au pr�alable supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  ' M�morisation de la trace de l'enregistrement qui va �tre d�truit
  EffaceCollection colD�truit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colD�truit.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Tri des donn�es � conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContr�le(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & colD�truit(C.DataField)
         End If
      End If
  Next
  
  ' On r�pertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "d�truit", sMsgTrace
  End If
  
  On Error Resume Next
  cConc.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cConc.MoveNext
  If cConc.EOF Then
    cConc.MovePrevious
    If cConc.BOF Then
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
  ActiveChamp "con_datecreat", bEnable
  ActiveChamp "con_heurecreat", bEnable
  ActiveChamp "con_opercreat", bEnable
  ActiveChamp "con_datemodif", bEnable
  ActiveChamp "con_heuremodif", bEnable
  ActiveChamp "con_opermodif", bEnable
'  ActiveChamp "con_tsvalid", bEnable
'  ActiveChamp "con_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cConc Is Nothing

  bdS�l.ButtonEnabled("First") = cConc.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cConc.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cConc.EOF
  bdS�l.ButtonEnabled("Last") = Not cConc.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cConc.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cConc.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cConc.MoveNext
  AjusteMouvements
  If cConc.EOF Then cConc.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cConc.MovePrevious
  AjusteMouvements
  If cConc.BOF Then cConc.MoveFirst
  SynchroniseFormulaire
End Sub

Private Sub bdcLangue_Change()
  ToMaj bdcLangue
End Sub

Private Sub bdcLangue_LostFocus()
  bdcLangue.Synchronise
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
  Dim C As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' M�moire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = colM�moireConclusion(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouill�s
          C = colM�moireConclusion(C.DataField)
        End If
      Next
    End If
  Else
    bdS�l.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
End Sub

' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDIAdministration.mnuCommandes
  End If
End Sub

Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "con_indice" Then
    ActiveChamp "con_indice", True
  End If
  
End Sub

' Filtrage des Entr�e intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
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
  '  bdcOperValid.AddItem u.uti_numuti, u.uti_nom
  Next
  
  ' Langues
  Dim l As Langue
  For Each l In colLangue
    bdcLangue.AddItem l.lan_code, l.lan_langue
  Next
  
  
  ' Formulaire en mode initial
  Set cConc = Nothing
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
  If Not cConc Is Nothing Then cConc.CloseCurseur
  MDIAdministration.AjusteMenus -1
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
  If cConc Is Nothing Then
    EffaceFormulaire
  ElseIf cConc.BOF And cConc.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cConc.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cConc.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cConc.AbsolutePosition
    
    ActiveTimer mtRapide      ' Mise � jour en arri�re plan

  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cConc.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

'  ' Affichage des champs satellites
'  If colChamps("con_critere") <> "" Then
'    txtCrit�re = BDCurseurExpress("select cri_titre1 from critere where cri_critere='" & colChamps("con_critere") & "'")
'  End If
'
'  If colChamps("con_t1") <> "" Then
'    txtType(1) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=0 and lnt_t3=0 and lnt_t4=0 and lnt_t5=0")
'    txtType(2) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=" & colChamps("con_t2") & " and lnt_t3=0 and lnt_t4=0 and lnt_t5=0")
'    txtType(3) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=" & colChamps("con_t2") & " and lnt_t3=" & colChamps("con_t3") & " and lnt_t4=0 and lnt_t5=0")
'    txtType(4) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=" & colChamps("con_t2") & " and lnt_t3=" & colChamps("con_t3") & " and lnt_t4=" & colChamps("con_t4") & " and lnt_t5=0")
'    txtType(5) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=" & colChamps("con_t2") & " and lnt_t3=" & colChamps("con_t3") & " and lnt_t4=" & colChamps("con_t4") & " and lnt_t5=" & colChamps("con_t5"))
'  End If
End Sub



Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  
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

Private Sub bdcLangue_GotFocus()
  SetStatus bdcLangue.Tag
End Sub

Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcOperModif.Tag
End Sub

'Private Sub bdcOperValid_GotFocus()
'  SetStatus bdcOperValid.Tag
'End Sub


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
  BDCopieS�lection cConc, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sQuery, drConSimple, True
End Sub

Public Sub Aper�u()
  BDEtat sQuery, drConSimple, False
End Sub


'=================================================================================
' M�morisation

Public Sub M�morise()
  EffaceCollection colM�moireConclusion
  
  Dim t As Control
  For Each t In colChamps
    colM�moireConclusion.Add (t), t.DataField
  Next
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

