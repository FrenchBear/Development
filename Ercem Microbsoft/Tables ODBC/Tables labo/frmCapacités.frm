VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmCapacit� 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des capacit�s des laboratoires"
   ClientHeight    =   3720
   ClientLeft      =   2445
   ClientTop       =   1725
   ClientWidth     =   7590
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmCapacit�s.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   248
   ScaleMode       =   0  'User
   ScaleWidth      =   505.223
   Tag             =   "Donn�es"
   Begin VB.Timer timSynchroBdc 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   6120
      Top             =   1740
   End
   Begin VB.TextBox txtTimeStamp 
      DataField       =   "*timestamp"
      Height          =   330
      Left            =   4575
      TabIndex        =   24
      Tag             =   "Date et heure de derni�re modification de l'information"
      Top             =   3300
      Width           =   2940
   End
   Begin VB.TextBox txtNoSerie 
      DataField       =   "*cap_serial"
      Height          =   330
      Left            =   1440
      TabIndex        =   6
      Tag             =   "N� de s�rie interne de l'incident"
      Top             =   2940
      Width           =   901
   End
   Begin TablesLabo.BDS�lecteur BDS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Width           =   7590
      _ExtentX        =   13388
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
   Begin VB.TextBox txtOrigineModif 
      DataField       =   "*cap_idmodif"
      Height          =   330
      Left            =   1440
      TabIndex        =   7
      Tag             =   "Origine de la derni�re modification"
      Top             =   3300
      Width           =   2940
   End
   Begin TablesLabo.BDCombo bdcPar 
      Height          =   330
      Left            =   1425
      TabIndex        =   0
      Tag             =   "Germe concern� par la m�thode"
      Top             =   480
      Width           =   6075
      _ExtentX        =   10716
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
      DataField       =   "*cap_refpar"
   End
   Begin TablesLabo.BDCombo bdcMethode 
      Height          =   330
      Left            =   1425
      TabIndex        =   1
      Tag             =   "Germe concern� par la m�thode"
      Top             =   870
      Width           =   6075
      _ExtentX        =   10716
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
      DataField       =   "cap_methode"
   End
   Begin TablesLabo.BDCombo bdcLabo 
      Height          =   330
      Left            =   1425
      TabIndex        =   2
      Tag             =   "Code labo dont il faut g�rer la capacit�"
      Top             =   1245
      Width           =   6075
      _ExtentX        =   10716
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
      DataField       =   "*cap_labo"
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "^cap_soustraitant"
      Height          =   330
      Index           =   5
      Left            =   4575
      TabIndex        =   25
      Tag             =   "Labo sous-traitant (le cas �ch�ant)"
      Top             =   2400
      Width           =   2940
      _ExtentX        =   5186
      _ExtentY        =   582
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cap_regroupement"
      Height          =   330
      Index           =   1
      Left            =   4560
      TabIndex        =   23
      Tag             =   "Code regroupement (�quipement ou personne)"
      Top             =   1635
      Width           =   900
      _ExtentX        =   1588
      _ExtentY        =   582
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cap_poste"
      Height          =   330
      Index           =   3
      Left            =   4560
      TabIndex        =   22
      Tag             =   "Poste traitant (unit� de base de production)"
      Top             =   2017
      Width           =   900
      _ExtentX        =   1588
      _ExtentY        =   582
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblTimeStamp 
      Caption         =   "Timestamp :"
      Height          =   270
      Left            =   4620
      TabIndex        =   21
      Top             =   3000
      Width           =   1320
   End
   Begin VB.Label lblChamp 
      Caption         =   "No de s�rie :"
      Height          =   270
      Index           =   0
      Left            =   75
      TabIndex        =   20
      Top             =   3000
      Width           =   1500
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Param�tre :"
      Height          =   255
      Index           =   1
      Left            =   75
      TabIndex        =   19
      Tag             =   "Code param�tre (ou germe en microbio)"
      Top             =   495
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "M�thode :"
      Height          =   255
      Index           =   3
      Left            =   75
      TabIndex        =   18
      Top             =   870
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Labo :"
      Height          =   255
      Index           =   2
      Left            =   75
      TabIndex        =   17
      Top             =   1245
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Capacit� :"
      Height          =   255
      Index           =   4
      Left            =   75
      TabIndex        =   16
      Top             =   1620
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Secteur :"
      Height          =   255
      Index           =   6
      Left            =   75
      TabIndex        =   15
      Top             =   2040
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "�quipe :"
      Height          =   255
      Index           =   8
      Left            =   75
      TabIndex        =   14
      Top             =   2400
      Width           =   1260
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cap_capacite"
      Height          =   330
      Index           =   0
      Left            =   1425
      TabIndex        =   3
      Tag             =   "Capacit� de production (nombre de param�tres/semaine)"
      Top             =   1620
      Width           =   900
      _ExtentX        =   1588
      _ExtentY        =   582
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cap_secteur"
      Height          =   330
      Index           =   2
      Left            =   1425
      TabIndex        =   4
      Tag             =   "Code secteur (laitier, aliments, carn�s, ...)"
      Top             =   2016
      Width           =   900
      _ExtentX        =   1588
      _ExtentY        =   582
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cap_equipe"
      Height          =   330
      Index           =   4
      Left            =   1425
      TabIndex        =   5
      Tag             =   "Equipe traitante (peut regrouper plusieurs postes)"
      Top             =   2400
      Width           =   900
      _ExtentX        =   1588
      _ExtentY        =   582
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Sous-traitant :"
      Height          =   255
      Index           =   9
      Left            =   3015
      TabIndex        =   13
      Top             =   2400
      Width           =   1500
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Poste :"
      Height          =   330
      Index           =   7
      Left            =   3015
      TabIndex        =   12
      Top             =   2010
      Width           =   1500
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Regroupement :"
      Height          =   330
      Index           =   5
      Left            =   3015
      TabIndex        =   11
      Top             =   1620
      Width           =   1500
   End
   Begin VB.Label lblTracabilit� 
      Alignment       =   2  'Center
      Caption         =   "Tra�abilit�"
      Height          =   255
      Left            =   3060
      TabIndex        =   9
      Top             =   2670
      Width           =   1500
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000018&
      X1              =   -179.724
      X2              =   499.232
      Y1              =   186
      Y2              =   186
   End
   Begin VB.Label lblOrigineModif 
      AutoSize        =   -1  'True
      Caption         =   "Origine :"
      Height          =   270
      Left            =   75
      TabIndex        =   8
      Top             =   3360
      Width           =   1500
   End
End
Attribute VB_Name = "frmCapacit�"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCapacit�s
' Gestion des capacit�s des laboratoires

' 17/10/2001 PC v� 1.0
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des d�structions et des cr�ations

Option Explicit

Private cInc As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private colPar As New Collection          ' sous table param�tres
Private colMet As New Collection          ' sous-sous table Methode

Private iAncPar As Integer                ' ancien param�tre
Private iMode As eMode�dition
Private sFinalSQL As String               ' Requ�te SQL courante
Private colChange As New Collection       ' Trace des modifications
Private cold�truit As New Collection      ' Trace de l'enregistrement qui va �tre d�truit
Private colCr�� As New Collection         ' Trace de la cr�ation de l'enregistrement

Private Const cCoulFondOblig = &HC0E0FF  ' couleur de fond pour les champs obligatoires
Private Const sTable = "capacite"
Private Const sCl�Primaire = "cap_serial"

Private Sub SynchroniseFormulaire()

  timSynchroBdc.Enabled = False ' arr�t timer
  If cInc Is Nothing Then
    EffaceFormulaire
  ElseIf cInc.BOF And cInc.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cInc.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cInc.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    
    BDS�l.NumRec = cInc.AbsolutePosition
    timSynchroBdc.Enabled = True  ' d�marre timer
  End If
Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cInc.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub

Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  BDS�l.NumRec = ""
End Sub

Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim C As Control
  For Each C In colChamps
    BDActiveChamp C, bEnabled
  Next
End Sub

Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub

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
  
  ' MsgBox "Where-part: " & sWP
  
  Dim cIncQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours . . ."
  
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from " & sTable & " where " & sWP & " order by " & sCl�Primaire
  cIncQuery.OpenCurseur sSQL
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cInc Is Nothing Then cInc.CloseCurseur
  Set cInc = cIncQuery
  sFinalSQL = sSQL
  
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  BDS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cInc.EOF And cInc.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a �t� s�lectionn�"
  End If
  BDS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  BDS�l.SetFocus
End Sub

' Supprime les CrLf en fin de cha�ne
Sub TrimCrLf(C As TextBox)
  Do While Len(C) > 2
    If Right(C, Len(C) - 1) = vbCrLf Then
      C = Left(C, Len(C) - 2)
    Else
      Exit Do
    End If
  Loop
End Sub

' V�rifie que les champs contiennent des valeurs l�gales
' Le contr�le des NULL et des types a d�j� �t� fait
Private Function bOkValeurs() As Boolean
 
' controles de champs
  If iMode <> meQuery Then  ' si pas en mode interrogation. Test facultatif, fonction non appel�e en interrogation
    ' contr�le du champ cap_labo
    If Not IsLabo(colChamps("cap_labo")) Then
      MsgBox "Ce champ est obligatoire", vbInformation + vbOKOnly, App.EXEName
      bOkValeurs = False  ' valeur incorrecte
      colChamps("cap_labo").SetFocus
      Exit Function
    End If
    
    If sNomParam�treCache(colChamps("cap_refpar")) = "" Or _
      Not IsParam�tre(colChamps("cap_refpar")) Then
      MsgBox "Ce champ est obligatoire", vbInformation + vbOKOnly, App.EXEName
      bOkValeurs = False  ' valeur incorrecte
      colChamps("cap_refpar").SetFocus
      Exit Function
    End If
    
    If colChamps("cap_refpar") = "" Then
      If colChamps("cap_methode") <> "" Then
        MsgBox "Ce champ est obligatoire", vbInformation + vbOKOnly, App.EXEName
        bOkValeurs = False  ' valeur incorrecte
        colChamps("cap_refpar").SetFocus
        Exit Function
      End If
    Else  ' param�tre renseign�
      If colChamps("cap_methode") <> "" And _
        sNomM�thodeCache(colChamps("cap_refpar"), colChamps("cap_methode")) = "" Then ' And  Not IsM�thode(colChamps("cap_refpar"))
        MsgBox "Cette m�thode n'existe pas", vbInformation + vbOKOnly, App.EXEName
        bOkValeurs = False  ' valeur incorrecte
        colChamps("cap_methode").SetFocus
        Exit Function
      End If
    End If
        
  End If

  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True

End Function

Private Sub ValidateAdd()

  Dim sReqSql As String, bOkAdd As Boolean
  Dim cIncAdd As New BDCurseur
  Dim cMax As New BDCurseur, iMax As Long
  
  Assert iMode = meAdd
  
' contr�le valeurs des champs
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
' positionnement dans la base
  sReqSql = "select * from " & sTable & " where " & sCl�Primaire & "=0"
  cIncAdd.OpenCurseur sReqSql ' ouverture d'un curseur
  cIncAdd.AddNew                      ' ajout d'un nouvel enreg
  bOkAdd = bPr�pareEditAdd(cIncAdd, colColonnes, colChamps)
  cIncAdd.CloseCurseur
  If Not bOkAdd Then Exit Sub
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cInc Is Nothing Then cInc.CloseCurseur
  Set cInc = New BDCurseur
  
  ' Astuce : pour r�cup�rer un s�rial, on lit le max�
  cMax.OpenCurseur "select max(" & sCl�Primaire & ") from " & sTable
  If cMax.EOF Then iMax = 1 Else iMax = cMax(0)
  cMax.CloseCurseur
  sFinalSQL = "select * from " & sTable & " where " & sCl�Primaire & "=" & iMax
  cInc.OpenCurseur sFinalSQL
  cInc.MoveFirst
  
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
      JournalUnix sTable & " " & colChamps("cap_serial"), "cr��", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  BDS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  BDS�l.Emp�cheMouvements
  
  SetMessage
  SetStatus
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub

Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cInc Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cInc.Edit
  If Not bPr�pareEditAdd(cInc, colColonnes, colChamps) Then Exit Sub

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
      JournalUnix sTable & " " & colChamps("cap_serial"), "chang�", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  BDS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDS�l.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub

Private Sub ActionValidate()
  timSynchroBdc.Enabled = False ' arr�t timer
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub

Private Sub ActionCancel()
  timSynchroBdc.Enabled = False ' arr�t timer
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  BDS�l.ActiveValidation False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cInc Is Nothing Then
    If Not (cInc.EOF And cInc.BOF) Then
      iMode = meNavigate
    End If
  End If
  BDS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub

'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("cap_refpar").SetFocus
  BDS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub

Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing
  
  If cInc.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "cap_serial", False
  ActiveChamp "cap_idmodif", False
  ActiveChamp "timestamp", False
  
  MajCoulOblig  ' mise � jour couleur de fond champs obligatoires
  
  colChamps("cap_refpar").SetFocus
  
  BDS�l.TabStop = False
  
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
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  MajCoulOblig  ' mise � jour couleur de fond champs obligatoires
  ActiveChamp "cap_serial", False
  ActiveChamp "cap_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("cap_refpar").SetFocus
  
  BDS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"

End Sub

Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing

  If cInc.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", _
      vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & _
    "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion + vbDefaultButton2, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' M�morisation de la trace de l'enregistrement qui va �tre d�truit
  EffaceCollection cold�truit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      cold�truit.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Tri des donn�es � conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContr�le(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & cold�truit(C.DataField)
         End If
      End If
  Next
  
  ' On r�pertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("cap_serial"), "d�truit", sMsgTrace
  End If
  
  On Error Resume Next
  cInc.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
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
  
  BDS�l.ActiveMouvements iMode = meNavigate
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing

  BDS�l.ButtonEnabled("First") = cInc.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Previous") = cInc.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Next") = Not cInc.EOF
  BDS�l.ButtonEnabled("Last") = Not cInc.EOF
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

' * * *
' * * * EVENEMENTS SUR LES COMBOS * * *
' * * *

Private Sub bdcLabo_GotFocus()
  colChamps("cap_labo").ForeColor = vbWindowText ' couleur du texte par d�faut
  SetStatus bdcLabo.Tag
End Sub

Private Sub bdcLabo_LostFocus()
  Dim bTmp As Boolean
  
  bdcLabo.Synchronise
  colChamps("cap_labo") = UCase(colChamps("cap_labo"))
  bTmp = IsLabo(colChamps("cap_labo"))

End Sub

Private Sub bdcMethode_GotFocus()
  
  colChamps("cap_methode").ForeColor = vbWindowText ' couleur du texte par d�faut
  SyncroBdcMeth ' synchronisation Param�tre/m�thode
  SetStatus bdcMethode.Tag

End Sub

Private Sub bdcMethode_LostFocus()
  bdcMethode.Synchronise
End Sub

Private Sub bdcPar_GotFocus()
  
  colChamps("cap_refpar").ForeColor = vbWindowText ' couleur du texte par d�faut
  SetStatus bdcPar.Tag
  
  If iMode <> meQuery Then  ' si pas en mode interrogation
    If IIf(IsNull(colChamps("cap_refpar")), True, colChamps("cap_refpar") = "") Then
      iAncPar = -1
    Else
      iAncPar = NZ(colChamps("cap_refpar")) ' sauvegarde de la valeur du champ
    End If
  End If
  
End Sub

Private Sub bdcPar_LostFocus()
  Dim bTmp As Boolean
  
  bTmp = IsParam�tre(colChamps("cap_refpar"))
  bdcPar.Synchronise
End Sub

'=================================================================================
' Actions du s�lecteur

Private Sub bdS�l_ActionAdd(): ActionAdd: End Sub

Private Sub bdS�l_ActionCancel(): ActionCancel: End Sub

Private Sub bdS�l_ActionChange(): ActionChange: End Sub

Private Sub bdS�l_ActionDelete(): ActionDelete: End Sub

Private Sub bdS�l_ActionFirst(): ActionFirst: End Sub

Private Sub bdS�l_ActionLast(): ActionLast: End Sub

Private Sub bdS�l_ActionNext(): ActionNext: End Sub

Private Sub bdS�l_ActionPrevious(): ActionPrevious: End Sub

Private Sub bdS�l_ActionQuery():  ActionQuery: End Sub

Private Sub bdS�l_ActionValidate():  ActionValidate: End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  BDS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then BDS�l.KeyPress KeyAscii
End Sub
' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDILabo.mnuCommandes
  End If
End Sub

'=================================================================================
' Fonctions de service

Private Sub Form_Load()

  Dim p As Param�tre
  
  Show
  SetStatus "Chargement en cours, patientez�"
  Me.Refresh

  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  ' Chargement des combos
  Set colPar = colParam�treCache
  For Each p In colPar
    bdcPar.AddItem p.ger_indice, p.ger_libelle
  Next
  
  bdcLabo.AddItem "O", "Osny"
  bdcLabo.AddItem "R", "Fontaine"
  bdcLabo.AddItem "T", "La Rochelle"
  bdcLabo.AddItem "C", "Cergy"
  bdcLabo.AddItem "H", "Roanne"
  
  ' Formulaire en mode initial
  ActiveFormulaire False
  Set cInc = Nothing
  With BDS�l
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
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, App.Title
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
  
  MDILabo.cmdImpr.Enabled = True
  MDILabo.cmdAper�u.Enabled = True
  MDILabo.AjusteMenus -1
  
  EffaceCollection colChamps
  EffaceCollection colColonnes
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
  BDCopieS�lection cInc, colChamps, BDS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage

End Sub

Private Sub MajCoulOblig()
' les champs obligatoires ont une couleur de fond sp�cifique
  
  Dim C As BDColonne

  For Each C In colColonnes
    If C.bRequired Then colChamps(C.sNom).BackColor = cCoulFondOblig
  Next

End Sub

Private Function IsParam�tre(s As Variant) As Boolean
  If Not IsNumeric(s) Then Exit Function
  If CDbl(s) < -500 Or CDbl(s) > 5000 Or CDbl(s) <> CLng(s) Then Exit Function
  IsParam�tre = True
End Function

Private Function IsM�thode(s As String) As Boolean
  If Len(s) <> 1 Then Exit Function
  If s >= "1" And s <= "9" Then IsM�thode = True: Exit Function
  If s <> "*" And (s < "a" Or s > "z") Then Exit Function
  IsM�thode = True
End Function

Private Function IsLabo(sLabo As String) As Boolean
' validation de la valeur du champ cap_labo

  Dim iMaxListLabo As Integer, i As Integer
  
  IsLabo = False
  colChamps("cap_labo").ForeColor = vbRed ' couleur du texte en rouge
  iMaxListLabo = colChamps("cap_labo").ListCount
  For i = 0 To iMaxListLabo
    If sLabo = Left(colChamps("cap_labo").List(i), 1) Then
      colChamps("cap_labo").ForeColor = vbWindowText ' couleur du texte par d�faut
      IsLabo = True
      Exit For
    End If
  Next i

End Function
'=================================================================================

Private Sub timSynchroBdc_Timer()
  timSynchroBdc.Enabled = False ' arr�t timer
  SyncroBdcMeth ' synchronisation Param�tre/m�thode
End Sub

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub


Private Sub SyncroBdcMeth()
' PC 23/10/2001
' synchronisation des BDCombo Param�tre et M�thode
    
  Dim i As Integer, iCodParam As Integer, iGerme As Integer
  Dim sMeth As String, sLib As String
  Dim vParam As Variant
  Dim sOldMethode As String
  
  If iMode <> meQuery Then  ' si pas en mode interrogation
    ' v�rif param�tre renseign�
    vParam = colChamps("cap_refpar")
    If IIf(IsNull(vParam), False, vParam <> "") And _
      sNomParam�treCache(vParam) <> "" Then   ' param�tre renseign�e
      If IIf(IsNull(colChamps("cap_methode")), False, colChamps("cap_methode")) <> "" Then  'm�thode renseign�e
        If iAncPar <> vParam Then  ' changement de param�tre
          iCodParam = CInt(vParam): GoSub ChargMeth
          iAncPar = vParam
        End If
        
      Else  ' m�thode non renseign�e
        iCodParam = CInt(vParam): GoSub ChargMeth
      End If
    End If
  End If
Exit Sub
    
' Chargement des m�thodes du param�tre
ChargMeth:
  sOldMethode = colChamps("cap_methode")
  bdcMethode.Clear  ' effacement du contenu du combo
  For i = 1 To colM�thodeCache.Count  ' on parcours toute la collection
' l'ndex de la collection n'est pas accessible si on en connait qu'une partie
' pas de m�thode pour connaitre l'index d'une collection
    iGerme = colM�thodeCache.Item(i).met_germe
    If iCodParam = iGerme Then
      sMeth = colM�thodeCache.Item(i).met_methode
      sLib = colM�thodeCache.Item(i).met_libelle
      bdcMethode.AddItem sMeth, sLib
    End If
  Next i
  If sOldMethode <> "" Then colChamps("cap_methode") = sOldMethode
Return

End Sub

'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("cap_serial") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub



