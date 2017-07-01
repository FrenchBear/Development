VERSION 5.00
Begin VB.Form frmLettres 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des Lettres"
   ClientHeight    =   4095
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8760
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmLettres.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   273
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   584
   Tag             =   "Données"
   Begin VB.CommandButton btnLettresDisponibles 
      Caption         =   "Lettres &disponibles"
      Height          =   315
      Left            =   2760
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   480
      Width           =   2160
   End
   Begin TablesAdmin.BDCombo bdcUnité 
      Height          =   330
      Left            =   2040
      TabIndex        =   10
      Tag             =   "Unité à laquelle est rattachée l'assistant pour les lettres indiquées"
      Top             =   1920
      Width           =   6675
      _ExtentX        =   11774
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
      DataField       =   "let_unite"
   End
   Begin TablesAdmin.BDCombo bdcSystème 
      Height          =   330
      Left            =   2040
      TabIndex        =   6
      Tag             =   "Système Unix gérant les lettres indiquées"
      Top             =   1200
      Width           =   2895
      _ExtentX        =   5106
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
      DataField       =   "*^let_systeme"
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7680
      Top             =   480
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   2040
      TabIndex        =   20
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   3720
      Width           =   2235
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "let_idmodif"
      Height          =   315
      Index           =   12
      Left            =   2040
      TabIndex        =   18
      Tag             =   "Origine de la modification"
      Top             =   3360
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "let_comment"
      Height          =   315
      Index           =   8
      Left            =   2040
      TabIndex        =   16
      Tag             =   "Commentaire libre quelconque"
      Top             =   3000
      Width           =   6675
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*^let_lettres"
      Height          =   315
      Index           =   0
      Left            =   2040
      MaxLength       =   2
      TabIndex        =   1
      Tag             =   "Deux lettres majuscules"
      Top             =   480
      Width           =   615
   End
   Begin TablesAdmin.BDCombo bdcPersonne 
      Height          =   330
      Left            =   2040
      TabIndex        =   8
      Tag             =   "Assistant à qui sont affectées les lettres"
      Top             =   1560
      Width           =   6675
      _ExtentX        =   11774
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
      DataField       =   "*let_pers"
   End
   Begin TablesAdmin.BDCombo bdcSecrétaire 
      Height          =   330
      Left            =   2040
      TabIndex        =   12
      Tag             =   "Code secrétaire assurant la saisie de l'assistant"
      Top             =   2280
      Width           =   6675
      _ExtentX        =   11774
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
      DataField       =   "let_secret"
   End
   Begin TablesAdmin.BDCombo bdcLabo 
      Height          =   330
      Left            =   2040
      TabIndex        =   14
      Tag             =   "Labo traitant les échantillons"
      Top             =   2640
      Width           =   6675
      _ExtentX        =   11774
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
      DataField       =   "let_labo"
   End
   Begin TablesAdmin.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   21
      Top             =   0
      Width           =   8760
      _ExtentX        =   15452
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
   Begin TablesAdmin.BDCombo bdcSecrétariat 
      Height          =   330
      Left            =   2040
      TabIndex        =   4
      Tag             =   "Système Unix gérant les lettres indiquées"
      Top             =   840
      Width           =   4575
      _ExtentX        =   8070
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
      DataField       =   "*let_secretariat"
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Secrétariat :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   1170
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   19
      Top             =   3780
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   17
      Top             =   3420
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   15
      Top             =   3060
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Labo :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   13
      Top             =   2700
      Width           =   600
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Secrétaire :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   11
      Top             =   2340
      Width           =   1095
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Unité :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   9
      Top             =   1980
      Width           =   630
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Personne :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   7
      Top             =   1620
      Width           =   1035
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Système :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   5
      Top             =   1260
      Width           =   945
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Lettres :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   810
   End
End
Attribute VB_Name = "frmLettres"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmLettres
' Gestion des lettres
' 31/01/1998 PV
' 04/02/1998 PV Feuille MDI child
'  7/07/1998 PV Copie des données dans le presse-papiers
'  5/08/1998 PV Contrôles avec bOkUtilisateur
' 15/08/1998 PV DoActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 30/03/1999 PV Impression
'  9/08/2001 PV Contrôle - 4 lettres maximum par personne
' 22/08/2001 PV Possibilité de relecture des utilisateurs si n° utilisateur inconnu
'  8/11/2001 PV let_secretariat
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des créations


Option Explicit

Private cLet As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition
Private sFinalWP As String                ' Where-part de la requête SQL courante

Private colChange As New Collection       ' Trace des modifications
Private colDétruit As New Collection      ' Trace des déstructions d'enregistrement
Private colCréé As New Collection         ' Trace des créations

Private Const sTable = "lettre"


'=================================================================================
' Accès direct

Public Sub AfficheLettres(ByVal sWP As String)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmLettres
    F.AfficheLettres sWP
    Exit Sub
  End If
  
  Me.ZOrder 0
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
  
  Dim cLetQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cLetQuery.OpenCurseur "select * from lettre where " & sWP & " order by let_systeme,let_lettres"
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cLet Is Nothing Then cLet.CloseCurseur
  Set cLet = cLetQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cLet.EOF And cLet.BOF) Then
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
  Dim i As Integer
  
  bOkValeurs = False
  
Retry:
  If bdcPersonne.Text <> "" And sNomUtilisateur(bdcPersonne.Text) = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Utilisateur '" & bdcPersonne.Text & "' inconnu." & vbCrLf & vbCrLf & "Voulez-vous relire la liste des utilisateurs ?", vbExclamation + vbYesNo + vbDefaultButton2, App.Title)
    If iRep = vbYes Then
      Dim sOld As String
      sOld = bdcPersonne.Text
      InvalideColUtilisateur
      bdcPersonne.Clear
      Dim u As Utilisateur
      For Each u In colUtilisateur
        bdcPersonne.AddItem u.sNumUti, u.uti_nom
      Next
      bdcPersonne.Text = sOld
      GoTo Retry
    End If
    bdcPersonne.SetFocus
    Exit Function
  End If
  
  If Len(colChamps("let_lettres").Text) <> 2 Then
    MsgBox "Lettres incorrectes ! (Deux lettres majuscules)", vbExclamation, App.Title
    Exit Function
  End If
  If Left(colChamps("let_lettres"), 1) < "A" Or Left(colChamps("let_lettres"), 1) > "Z" Or Right(colChamps("let_lettres"), 1) < "A" Or Right(colChamps("let_lettres"), 1) > "Z" Then
    MsgBox "Lettres incorrectes ! (Deux lettres majuscules)", vbExclamation, App.Title
    Exit Function
  End If
  
  If bdcSecrétariat.Text <> UCase(bdcSecrétariat.Text) Then bdcSecrétariat.Text = UCase(bdcSecrétariat.Text)
  If sNomSecrétariat(bdcSecrétariat.Text) = "" Then
    MsgBox "Secrétariat d'édition '" & bdcSecrétariat.Text & "' inconnu !", vbExclamation, App.Title
    Exit Function
  End If
  
  If bdcSystème.Text <> UCase(bdcSystème.Text) Then bdcSystème.Text = UCase(bdcSystème.Text)
  If sNomSystème(bdcSystème.Text) = "" Then
    MsgBox "Système de gestion des lettres '" & bdcSystème.Text & "' inconnu !", vbExclamation, App.Title
    Exit Function
  End If

  If bdcUnité.Text <> "" And sNomUnité(bdcUnité.Text) = "" Then
    MsgBox "Unité '" & bdcUnité.Text & "' inconnue !", vbExclamation, App.Title
    Exit Function
  End If
  
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from lettre where let_pers=" & sFormToSQL(colChamps("let_pers"), BDTypeINTEGER) & " and let_lettres<>" & sFormToSQL(colChamps("let_lettres"), BDTypeCHAR))
  If iNb >= 4 Then
    MsgBox "Attention - L'utilisateur " & bdcPersonne & " a déja au moins quatre autres lettres différentes affectées. Impossible d'en affecter plus (débordement de szLettres dans idinitbd.ec)", vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cLetAdd As New BDCurseur
  cLetAdd.OpenCurseur "select * from lettre where let_lettres='@@'"
  cLetAdd.AddNew
  ActiveChamp "let_systeme", True
  If Not bPrépareEditAdd(cLetAdd, colColonnes, colChamps) Then
    ActiveChamp "let_systeme", False
    cLetAdd.CloseCurseur
    Exit Sub
  End If
  ActiveChamp "let_systeme", False
  cLetAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cLet Is Nothing Then cLet.CloseCurseur
  Set cLet = New BDCurseur
  sFinalWP = "let_lettres=" & sFormToSQL(colChamps("let_lettres"), BDTypeCHAR)
  cLet.OpenCurseur "select * from lettre where " & sFinalWP
  cLet.MoveFirst
  
    
  ' On mémorise toutes les valeurs saisie par l'utilisateur
  EffaceCollection colCréé
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colCréé.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Si on est en train d'ajouter un enregistrement, on recence ds l'historique la valeur des différents paramètres
  If iMode = meAdd Then
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        ' On enregistre uniquement si les champs ne sont pas vides
        If ValeurContrôle(C) <> "" Then
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colCréé(C.DataField)
        End If
      End If
    Next
    ' On enregistre dans le journal la trace de la création
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("let_lettres"), "créé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
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
  Assert Not cLet Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cLet.Edit
  If Not bPrépareEditAdd(cLet, colColonnes, colChamps) Then Exit Sub
' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
  If iMode = meChange Then
    Dim C As Control
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        If colChange(C.DataField) <> ValeurContrôle(C) Then  ' Modifié !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colChange(C.DataField) & "->" & ValeurContrôle(C)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("let_lettres"), "changé", sMsgTrace
    End If
  End If
  ActiveFormulaire False
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

  ActiveFormulaire False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cLet Is Nothing Then
    If Not (cLet.EOF And cLet.BOF) Then
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
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  
  colChamps("let_lettres").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cLet Is Nothing
  
  If cLet.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "let_lettres", False
  ActiveChamp "let_systeme", False
  ActiveChamp "timestamp", False
  ActiveChamp "let_idmodif", False
  
  colChamps("let_secretariat").SetFocus
  bdSél.TabStop = False
  
  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colChange
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colChange.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "let_systeme", False
  ActiveChamp "timestamp", False
  ActiveChamp "let_idmodif", False

  colChamps("let_lettres").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cLet Is Nothing

  If cLet.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
' Mémorisation de la trace de l'enregistrement qui va être détruit
  EffaceCollection colDétruit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colDétruit.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Tri des données à conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContrôle(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & colDétruit(C.DataField)
         End If
      End If
  Next
  
  ' On répertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("let_lettres"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cLet.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cLet.MoveNext
  If cLet.EOF Then
    cLet.MovePrevious
    If cLet.BOF Then
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
  Assert Not cLet Is Nothing

  bdSél.ButtonEnabled("First") = cLet.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cLet.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cLet.EOF
  bdSél.ButtonEnabled("Last") = Not cLet.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cLet.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cLet.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cLet.MoveNext
  AjusteMouvements
  If cLet.EOF Then cLet.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cLet.MovePrevious
  AjusteMouvements
  If cLet.BOF Then cLet.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub btnLettresDisponibles_Click()
  frmLettresDisponibles.Show
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
  Dim C As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = RTrim(colMémoireLettres(ActiveControl.DataField))
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouillés
          C = RTrim(colMémoireLettres(C.DataField))
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
    PopupMenu MDIAdministration.mnuCommandes
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
  
  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPersonne.AddItem u.sNumUti, u.uti_nom
    bdcSecrétaire.AddItem u.sNumUti, u.uti_nom
  Next
  
  Dim s As Système
  For Each s In colSystème
    bdcSystème.AddItem s.sys_systeme, s.sys_nom
    If Not IsNull(s.sys_adrlabo1) Then
      bdcLabo.AddItem s.sys_systeme, s.sys_adrlabo1
    End If
  Next
  
  Dim n As Unité
  For Each n In colUnité
    bdcUnité.AddItem n.sNumUni, n.uni_titre
  Next
  
  Dim st As Secrétariat
  For Each st In colSecrétariat
    bdcSecrétariat.AddItem st.sec_secretariat, st.sec_libelle
  Next
  
  
  ' Formulaire en mode initial
  Set cLet = Nothing
  ActiveFormulaire False
  With bdSél
    .LectureSeule = bLectureSeule
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  iMode = meEmpty
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
  If Not cLet Is Nothing Then
    cLet.CloseCurseur
    Set cLet = Nothing
  End If
  MDIAdministration.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cLet Is Nothing Then
    EffaceFormulaire
  ElseIf cLet.BOF And cLet.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cLet.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cLet.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cLet.AbsolutePosition
       
    ' Mise à jour en arrière plan
    ActiveTimer mtRapide
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cLet.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  If bdcUnité.Text <> "" And InStr(bdcUnité.Text, bdcUnité.Séparateur) = 0 Then
    bdcUnité.AddItem bdcUnité.Text, sNomUnité(bdcUnité.Text)
  End If
  
  If bdcSystème.Text <> "" And InStr(bdcSystème.Text, bdcSystème.Séparateur) = 0 Then
    bdcSystème.AddItem bdcSystème.Text, sNomSystème(bdcSystème.Text)
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  bdSél.NumRec = ""
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

' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
End Sub


Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub


Private Sub bdcSecrétariat_GotFocus()
  SetStatus bdcSecrétariat.Tag
End Sub

Private Sub bdcSecrétariat_LostFocus()
  bdcSecrétariat.Synchronise
  If iMode = meChange Or iMode = meAdd Then
    Dim s As Secrétariat
    On Error GoTo Problème
    Set s = colSecrétariat(bdcSecrétariat)
    bdcSystème = s.sec_systeme
  End If
  Exit Sub
Problème:
  bdcSystème = ""
End Sub


Private Sub bdcSystème_GotFocus()
  SetStatus bdcSystème.Tag
End Sub

Private Sub bdcSystème_LostFocus()
  bdcSystème.Synchronise
End Sub

Private Sub bdcUnité_GotFocus()
  SetStatus bdcUnité.Tag
End Sub

Private Sub bdcUnité_LostFocus()
  bdcUnité.Synchronise
End Sub


Private Sub bdcPersonne_GotFocus()
  SetStatus bdcPersonne.Tag
End Sub

Private Sub bdcPersonne_LostFocus()
  bdcPersonne.Synchronise
End Sub


Private Sub bdcSecrétaire_GotFocus()
  SetStatus bdcSecrétaire.Tag
End Sub

Private Sub bdcSecrétaire_LostFocus()
  bdcSecrétaire.Synchronise
End Sub


Private Sub bdcLabo_LostFocus()
  bdcLabo.Synchronise
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub


Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "let_lettres" Then ToMaj txtChamp(Index)
End Sub

Private Sub bdcSecrétariat_Change()
  ToMin bdcSecrétariat
End Sub

Private Sub bdcSystème_Change()
  ToMaj bdcSystème
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
  BDCopieSélection cLet, colChamps, bdSél
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
  sSQL = "select *,secret.uti_nom as nomsec,pers.uti_nom as nompers from lettre,utilisateur as pers,outer utilisateur as secret,outer unite where uni_numunite=let_unite and pers.uti_numuti=let_pers and secret.uti_numuti=let_secret and " & sFinalWP & " order by let_lettres"
  BDEtat sSQL, drLettres, bImpression
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireLettres
  
  Dim t As Control
  For Each t In colChamps
    colMémoireLettres.Add (t), t.DataField
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
  sWP = "jou_domaine='" & sTable & " " & colChamps("let_lettres") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

