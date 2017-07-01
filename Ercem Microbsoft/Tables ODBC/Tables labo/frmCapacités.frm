VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmCapacité 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des capacités des laboratoires"
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
   Icon            =   "frmCapacités.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   248
   ScaleMode       =   0  'User
   ScaleWidth      =   505.223
   Tag             =   "Données"
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
      Tag             =   "Date et heure de dernière modification de l'information"
      Top             =   3300
      Width           =   2940
   End
   Begin VB.TextBox txtNoSerie 
      DataField       =   "*cap_serial"
      Height          =   330
      Left            =   1440
      TabIndex        =   6
      Tag             =   "N° de série interne de l'incident"
      Top             =   2940
      Width           =   901
   End
   Begin TablesLabo.BDSélecteur BDSél 
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
      Tag             =   "Origine de la dernière modification"
      Top             =   3300
      Width           =   2940
   End
   Begin TablesLabo.BDCombo bdcPar 
      Height          =   330
      Left            =   1425
      TabIndex        =   0
      Tag             =   "Germe concerné par la méthode"
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
      Tag             =   "Germe concerné par la méthode"
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
      Tag             =   "Code labo dont il faut gérer la capacité"
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
      Tag             =   "Labo sous-traitant (le cas échéant)"
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
      Tag             =   "Code regroupement (équipement ou personne)"
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
      Tag             =   "Poste traitant (unité de base de production)"
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
      Caption         =   "No de série :"
      Height          =   270
      Index           =   0
      Left            =   75
      TabIndex        =   20
      Top             =   3000
      Width           =   1500
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Paramètre :"
      Height          =   255
      Index           =   1
      Left            =   75
      TabIndex        =   19
      Tag             =   "Code paramètre (ou germe en microbio)"
      Top             =   495
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Méthode :"
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
      Caption         =   "Capacité :"
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
      Caption         =   "Équipe :"
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
      Tag             =   "Capacité de production (nombre de paramètres/semaine)"
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
      Tag             =   "Code secteur (laitier, aliments, carnés, ...)"
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
   Begin VB.Label lblTracabilité 
      Alignment       =   2  'Center
      Caption         =   "Traçabilité"
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
Attribute VB_Name = "frmCapacité"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCapacités
' Gestion des capacités des laboratoires

' 17/10/2001 PC v° 1.0
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des déstructions et des créations

Option Explicit

Private cInc As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private colPar As New Collection          ' sous table paramètres
Private colMet As New Collection          ' sous-sous table Methode

Private iAncPar As Integer                ' ancien paramètre
Private iMode As eModeÉdition
Private sFinalSQL As String               ' Requête SQL courante
Private colChange As New Collection       ' Trace des modifications
Private coldétruit As New Collection      ' Trace de l'enregistrement qui va être détruit
Private colCréé As New Collection         ' Trace de la création de l'enregistrement

Private Const cCoulFondOblig = &HC0E0FF  ' couleur de fond pour les champs obligatoires
Private Const sTable = "capacite"
Private Const sCléPrimaire = "cap_serial"

Private Sub SynchroniseFormulaire()

  timSynchroBdc.Enabled = False ' arrêt timer
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
    
    BDSél.NumRec = cInc.AbsolutePosition
    timSynchroBdc.Enabled = True  ' démarre timer
  End If
Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cInc.bEffacé = True
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
  BDSél.NumRec = ""
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
  
  ' MsgBox "Where-part: " & sWP
  
  Dim cIncQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours . . ."
  
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from " & sTable & " where " & sWP & " order by " & sCléPrimaire
  cIncQuery.OpenCurseur sSQL
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
  If Not cInc Is Nothing Then cInc.CloseCurseur
  Set cInc = cIncQuery
  sFinalSQL = sSQL
  
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  BDSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cInc.EOF And cInc.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  BDSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  BDSél.SetFocus
End Sub

' Supprime les CrLf en fin de chaîne
Sub TrimCrLf(C As TextBox)
  Do While Len(C) > 2
    If Right(C, Len(C) - 1) = vbCrLf Then
      C = Left(C, Len(C) - 2)
    Else
      Exit Do
    End If
  Loop
End Sub

' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
 
' controles de champs
  If iMode <> meQuery Then  ' si pas en mode interrogation. Test facultatif, fonction non appelée en interrogation
    ' contrôle du champ cap_labo
    If Not IsLabo(colChamps("cap_labo")) Then
      MsgBox "Ce champ est obligatoire", vbInformation + vbOKOnly, App.EXEName
      bOkValeurs = False  ' valeur incorrecte
      colChamps("cap_labo").SetFocus
      Exit Function
    End If
    
    If sNomParamètreCache(colChamps("cap_refpar")) = "" Or _
      Not IsParamètre(colChamps("cap_refpar")) Then
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
    Else  ' paramètre renseigné
      If colChamps("cap_methode") <> "" And _
        sNomMéthodeCache(colChamps("cap_refpar"), colChamps("cap_methode")) = "" Then ' And  Not IsMéthode(colChamps("cap_refpar"))
        MsgBox "Cette méthode n'existe pas", vbInformation + vbOKOnly, App.EXEName
        bOkValeurs = False  ' valeur incorrecte
        colChamps("cap_methode").SetFocus
        Exit Function
      End If
    End If
        
  End If

  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True

End Function

Private Sub ValidateAdd()

  Dim sReqSql As String, bOkAdd As Boolean
  Dim cIncAdd As New BDCurseur
  Dim cMax As New BDCurseur, iMax As Long
  
  Assert iMode = meAdd
  
' contrôle valeurs des champs
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
' positionnement dans la base
  sReqSql = "select * from " & sTable & " where " & sCléPrimaire & "=0"
  cIncAdd.OpenCurseur sReqSql ' ouverture d'un curseur
  cIncAdd.AddNew                      ' ajout d'un nouvel enreg
  bOkAdd = bPrépareEditAdd(cIncAdd, colColonnes, colChamps)
  cIncAdd.CloseCurseur
  If Not bOkAdd Then Exit Sub
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cInc Is Nothing Then cInc.CloseCurseur
  Set cInc = New BDCurseur
  
  ' Astuce : pour récupérer un sérial, on lit le max…
  cMax.OpenCurseur "select max(" & sCléPrimaire & ") from " & sTable
  If cMax.EOF Then iMax = 1 Else iMax = cMax(0)
  cMax.CloseCurseur
  sFinalSQL = "select * from " & sTable & " where " & sCléPrimaire & "=" & iMax
  cInc.OpenCurseur sFinalSQL
  cInc.MoveFirst
  
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
      JournalUnix sTable & " " & colChamps("cap_serial"), "créé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  BDSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  BDSél.EmpêcheMouvements
  
  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub

Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cInc Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cInc.Edit
  If Not bPrépareEditAdd(cInc, colColonnes, colChamps) Then Exit Sub

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
      JournalUnix sTable & " " & colChamps("cap_serial"), "changé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  BDSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDSél.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub

Private Sub ActionValidate()
  timSynchroBdc.Enabled = False ' arrêt timer
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub

Private Sub ActionCancel()
  timSynchroBdc.Enabled = False ' arrêt timer
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cInc Is Nothing Then
    If Not (cInc.EOF And cInc.BOF) Then
      iMode = meNavigate
    End If
  End If
  BDSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub

'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("cap_refpar").SetFocus
  BDSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub

Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing
  
  If cInc.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "cap_serial", False
  ActiveChamp "cap_idmodif", False
  ActiveChamp "timestamp", False
  
  MajCoulOblig  ' mise à jour couleur de fond champs obligatoires
  
  colChamps("cap_refpar").SetFocus
  
  BDSél.TabStop = False
  
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
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  MajCoulOblig  ' mise à jour couleur de fond champs obligatoires
  ActiveChamp "cap_serial", False
  ActiveChamp "cap_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("cap_refpar").SetFocus
  
  BDSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"

End Sub

Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing

  If cInc.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", _
      vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & _
    "Confirmez-vous cette opération ?", vbYesNo + vbQuestion + vbDefaultButton2, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' Mémorisation de la trace de l'enregistrement qui va être détruit
  EffaceCollection coldétruit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      coldétruit.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Tri des données à conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContrôle(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & coldétruit(C.DataField)
         End If
      End If
  Next
  
  ' On répertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("cap_serial"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cInc.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
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
  
  BDSél.ActiveMouvements iMode = meNavigate
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing

  BDSél.ButtonEnabled("First") = cInc.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Previous") = cInc.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Next") = Not cInc.EOF
  BDSél.ButtonEnabled("Last") = Not cInc.EOF
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
  colChamps("cap_labo").ForeColor = vbWindowText ' couleur du texte par défaut
  SetStatus bdcLabo.Tag
End Sub

Private Sub bdcLabo_LostFocus()
  Dim bTmp As Boolean
  
  bdcLabo.Synchronise
  colChamps("cap_labo") = UCase(colChamps("cap_labo"))
  bTmp = IsLabo(colChamps("cap_labo"))

End Sub

Private Sub bdcMethode_GotFocus()
  
  colChamps("cap_methode").ForeColor = vbWindowText ' couleur du texte par défaut
  SyncroBdcMeth ' synchronisation Paramètre/méthode
  SetStatus bdcMethode.Tag

End Sub

Private Sub bdcMethode_LostFocus()
  bdcMethode.Synchronise
End Sub

Private Sub bdcPar_GotFocus()
  
  colChamps("cap_refpar").ForeColor = vbWindowText ' couleur du texte par défaut
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
  
  bTmp = IsParamètre(colChamps("cap_refpar"))
  bdcPar.Synchronise
End Sub

'=================================================================================
' Actions du sélecteur

Private Sub bdSél_ActionAdd(): ActionAdd: End Sub

Private Sub bdSél_ActionCancel(): ActionCancel: End Sub

Private Sub bdSél_ActionChange(): ActionChange: End Sub

Private Sub bdSél_ActionDelete(): ActionDelete: End Sub

Private Sub bdSél_ActionFirst(): ActionFirst: End Sub

Private Sub bdSél_ActionLast(): ActionLast: End Sub

Private Sub bdSél_ActionNext(): ActionNext: End Sub

Private Sub bdSél_ActionPrevious(): ActionPrevious: End Sub

Private Sub bdSél_ActionQuery():  ActionQuery: End Sub

Private Sub bdSél_ActionValidate():  ActionValidate: End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  BDSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then BDSél.KeyPress KeyAscii
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

  Dim p As Paramètre
  
  Show
  SetStatus "Chargement en cours, patientez…"
  Me.Refresh

  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  ' Chargement des combos
  Set colPar = colParamètreCache
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
  With BDSél
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
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
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
  MDILabo.cmdAperçu.Enabled = True
  MDILabo.AjusteMenus -1
  
  EffaceCollection colChamps
  EffaceCollection colColonnes
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
  BDCopieSélection cInc, colChamps, BDSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage

End Sub

Private Sub MajCoulOblig()
' les champs obligatoires ont une couleur de fond spécifique
  
  Dim C As BDColonne

  For Each C In colColonnes
    If C.bRequired Then colChamps(C.sNom).BackColor = cCoulFondOblig
  Next

End Sub

Private Function IsParamètre(s As Variant) As Boolean
  If Not IsNumeric(s) Then Exit Function
  If CDbl(s) < -500 Or CDbl(s) > 5000 Or CDbl(s) <> CLng(s) Then Exit Function
  IsParamètre = True
End Function

Private Function IsMéthode(s As String) As Boolean
  If Len(s) <> 1 Then Exit Function
  If s >= "1" And s <= "9" Then IsMéthode = True: Exit Function
  If s <> "*" And (s < "a" Or s > "z") Then Exit Function
  IsMéthode = True
End Function

Private Function IsLabo(sLabo As String) As Boolean
' validation de la valeur du champ cap_labo

  Dim iMaxListLabo As Integer, i As Integer
  
  IsLabo = False
  colChamps("cap_labo").ForeColor = vbRed ' couleur du texte en rouge
  iMaxListLabo = colChamps("cap_labo").ListCount
  For i = 0 To iMaxListLabo
    If sLabo = Left(colChamps("cap_labo").List(i), 1) Then
      colChamps("cap_labo").ForeColor = vbWindowText ' couleur du texte par défaut
      IsLabo = True
      Exit For
    End If
  Next i

End Function
'=================================================================================

Private Sub timSynchroBdc_Timer()
  timSynchroBdc.Enabled = False ' arrêt timer
  SyncroBdcMeth ' synchronisation Paramètre/méthode
End Sub

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub


Private Sub SyncroBdcMeth()
' PC 23/10/2001
' synchronisation des BDCombo Paramètre et Méthode
    
  Dim i As Integer, iCodParam As Integer, iGerme As Integer
  Dim sMeth As String, sLib As String
  Dim vParam As Variant
  Dim sOldMethode As String
  
  If iMode <> meQuery Then  ' si pas en mode interrogation
    ' vérif paramètre renseigné
    vParam = colChamps("cap_refpar")
    If IIf(IsNull(vParam), False, vParam <> "") And _
      sNomParamètreCache(vParam) <> "" Then   ' paramètre renseignée
      If IIf(IsNull(colChamps("cap_methode")), False, colChamps("cap_methode")) <> "" Then  'méthode renseignée
        If iAncPar <> vParam Then  ' changement de paramètre
          iCodParam = CInt(vParam): GoSub ChargMeth
          iAncPar = vParam
        End If
        
      Else  ' méthode non renseignée
        iCodParam = CInt(vParam): GoSub ChargMeth
      End If
    End If
  End If
Exit Sub
    
' Chargement des méthodes du paramètre
ChargMeth:
  sOldMethode = colChamps("cap_methode")
  bdcMethode.Clear  ' effacement du contenu du combo
  For i = 1 To colMéthodeCache.Count  ' on parcours toute la collection
' l'ndex de la collection n'est pas accessible si on en connait qu'une partie
' pas de méthode pour connaitre l'index d'une collection
    iGerme = colMéthodeCache.Item(i).met_germe
    If iCodParam = iGerme Then
      sMeth = colMéthodeCache.Item(i).met_methode
      sLib = colMéthodeCache.Item(i).met_libelle
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



