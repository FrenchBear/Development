VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmType 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des types"
   ClientHeight    =   3975
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9060
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmType.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   265
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   604
   Tag             =   "Données"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   6420
      Top             =   3420
   End
   Begin TablesServeur.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   22
      Top             =   0
      Width           =   9060
      _ExtentX        =   15981
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
      DataField       =   "lnt_idmodif"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   19
      Top             =   3240
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
      DataField       =   "timestamp"
      Height          =   315
      Index           =   22
      Left            =   1740
      TabIndex        =   21
      Top             =   3600
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtType 
      Height          =   315
      Index           =   4
      Left            =   2580
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   1560
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtType 
      Height          =   315
      Index           =   3
      Left            =   2580
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   1200
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtType 
      Height          =   315
      Index           =   2
      Left            =   2580
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   840
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtType 
      Height          =   315
      Index           =   1
      Left            =   2580
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   480
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "lnt_comment"
      Height          =   315
      Index           =   16
      Left            =   1740
      TabIndex        =   17
      Top             =   2880
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*lnt_t5"
      Height          =   315
      Index           =   14
      Left            =   1740
      TabIndex        =   13
      Top             =   1920
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
      DataField       =   "*lnt_t4"
      Height          =   315
      Index           =   12
      Left            =   1740
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
      DataField       =   "*lnt_t3"
      Height          =   315
      Index           =   10
      Left            =   1740
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*lnt_t2"
      Height          =   315
      Index           =   8
      Left            =   1740
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
      DataField       =   "*lnt_t1"
      Height          =   315
      Index           =   6
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*lnt_libelle"
      Height          =   555
      Index           =   3
      Left            =   1740
      TabIndex        =   15
      Top             =   2280
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   979
      _Version        =   393216
      MaxLength       =   120
      ScrollBars      =   2
      MultiLine       =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   18
      Top             =   3300
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   20
      Top             =   3660
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   16
      Top             =   2940
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T5 (état) :"
      Height          =   210
      Index           =   18
      Left            =   60
      TabIndex        =   12
      Top             =   1980
      Width           =   960
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T4 :"
      Height          =   210
      Index           =   15
      Left            =   60
      TabIndex        =   9
      Top             =   1620
      Width           =   360
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T3 :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   360
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T2 :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   360
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T1 (secteur) :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   1275
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nouveau n° :"
      Height          =   210
      Index           =   9
      Left            =   0
      TabIndex        =   26
      Top             =   60
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      Caption         =   "Critère :"
      Height          =   255
      Index           =   8
      Left            =   0
      TabIndex        =   25
      Top             =   0
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   5
      Left            =   0
      TabIndex        =   24
      Top             =   0
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   4
      Left            =   0
      TabIndex        =   23
      Top             =   0
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libellé :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   14
      Top             =   2340
      Width           =   735
   End
End
Attribute VB_Name = "frmType"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmType
' Feuille de gestion des types
' 03/08/1999 PV
' 31/11/2001 FF Historique des modifications
' 03/12/2001 FF Historique des suppressions et des destructions
' 04/12/2001 FF Historique des créations

Option Explicit

Private cTyp As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private colHistorique As New Collection   ' Trace des modifications pour l'historique

Private Const sTable = "libntype"


'=================================================================================
' Méthodes globales implémentées par ce module, pour l'affichage du menu Commandes

Public Property Get sMéthodesGlobales() As String
  sMéthodesGlobales = "Historique"
End Property


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
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cTypQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from libntype where " & sWP

  cTypQuery.OpenCurseur sQuery
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
  If Not cTyp Is Nothing Then cTyp.CloseCurseur
  Set cTyp = cTypQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cTyp.EOF And cTyp.BOF) Then
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
  
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  TrimCrLf colChamps("lnt_libelle")
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cTypAdd As New BDCurseur
  cTypAdd.OpenCurseur "select * from libntype where lnt_t1<0"
  cTypAdd.AddNew
  cTypAdd!lnt_idmodif = sBDIdModif
  If Not bPrépareEditAdd(cTypAdd, colColonnes, colChamps) Then
    cTypAdd.CloseCurseur
    Exit Sub
  End If
  cTypAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cTyp Is Nothing Then cTyp.CloseCurseur
  Set cTyp = New BDCurseur
  
  sFinalWP = "lnt_t1=" & colChamps("lnt_t1") & " and lnt_t2=" & colChamps("lnt_t2") & " and lnt_t3=" & colChamps("lnt_t3") & " and lnt_t4=" & colChamps("lnt_t4") & " and lnt_t5=" & colChamps("lnt_t5")
  sQuery = "select * from libntype where " & sFinalWP
  cTyp.OpenCurseur sQuery
  cTyp.MoveFirst
    
  
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
  JournalUnix sTable & " " & colChamps("lnt_t1") & " " & colChamps("lnt_t2") & " " & colChamps("lnt_t3") & " " & colChamps("lnt_t4"), "créé", sMsgTrace
    
    
  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  ' On purge le cache
  EffaceCacheTypes
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cTyp Is Nothing
  
  TrimCrLf colChamps("lnt_libelle")
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cTyp.Edit
  cTyp!lnt_idmodif = sBDIdModif
  If Not bPrépareEditAdd(cTyp, colColonnes, colChamps) Then
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
       JournalUnix sTable & " " & colChamps("lnt_t1") & " " & colChamps("lnt_t2") & " " & colChamps("lnt_t3") & " " & colChamps("lnt_t4"), "changé", sMsgTrace
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
  
  ' On purge le cache
  EffaceCacheTypes

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
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
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cTyp Is Nothing Then
    If Not (cTyp.EOF And cTyp.BOF) Then
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
  
  colChamps("lnt_t1").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cTyp Is Nothing
  
  If cTyp.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "lnt_idmodif", False
  ActiveChamp "timestamp", False
  
  txtType(1) = ""
  txtType(2) = ""
  txtType(3) = ""
  txtType(4) = ""

  colChamps("lnt_t1").SetFocus
  AutoSelect colChamps("lnt_t1"), True
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
 
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"

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
  ActiveChamp "lnt_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("lnt_t1").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub



Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cTyp Is Nothing
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
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
  ' On garde la trace de la destruction
  JournalUnix sTable & " " & colChamps("lnt_t1") & " " & colChamps("lnt_t2") & " " & colChamps("lnt_t3") & " " & colChamps("lnt_t4"), "détruit", sMsgTrace
  
  On Error Resume Next
  cTyp.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' On purge le cache
  EffaceCacheTypes
  
  ' La mise à jour de synchrodelete est assurée par un trigger
  
  cTyp.MoveNext
  If cTyp.EOF Then
    cTyp.MovePrevious
    If cTyp.BOF Then
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
  Assert Not cTyp Is Nothing

  bdSél.ButtonEnabled("First") = cTyp.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cTyp.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cTyp.EOF
  bdSél.ButtonEnabled("Last") = Not cTyp.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cTyp.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cTyp.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cTyp.MoveNext
  AjusteMouvements
  If cTyp.EOF Then cTyp.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cTyp.MovePrevious
  AjusteMouvements
  If cTyp.BOF Then cTyp.MoveFirst
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
  ResetChienDeGarde
  bdSél.KeyDown KeyCode
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
  
  
  ' Formulaire en mode initial
  Set cTyp = Nothing
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
  If Not cTyp Is Nothing Then cTyp.CloseCurseur
  MDIServeur.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cTyp Is Nothing Then
    EffaceFormulaire
  ElseIf cTyp.BOF And cTyp.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cTyp.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cTyp.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cTyp.AbsolutePosition
    
    ' On efface les champs qui seront affichés par le timer
    txtType(1) = ""
    txtType(2) = ""
    txtType(3) = ""
    txtType(4) = ""
    
    ActiveTimer mtRapide      ' Mise à jour en arrière plan

  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cTyp.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

  If colChamps("lnt_t1") <> "" Then
    txtType(1) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("lnt_t1") & " and lnt_t2=0 and lnt_t3=0 and lnt_t4=0 and lnt_t5=0")
    txtType(2) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("lnt_t1") & " and lnt_t2=" & colChamps("lnt_t2") & " and lnt_t3=0 and lnt_t4=0 and lnt_t5=0")
    txtType(3) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("lnt_t1") & " and lnt_t2=" & colChamps("lnt_t2") & " and lnt_t3=" & colChamps("lnt_t3") & " and lnt_t4=0 and lnt_t5=0")
    txtType(4) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("lnt_t1") & " and lnt_t2=" & colChamps("lnt_t2") & " and lnt_t3=" & colChamps("lnt_t3") & " and lnt_t4=" & colChamps("lnt_t4") & " and lnt_t5=0")
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  txtType(1) = ""
  txtType(2) = ""
  txtType(3) = ""
  txtType(4) = ""
  bdSél.NumRec = ""
End Sub


' Activation du timer de mise à jour des champs satellites
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
  BDCopieSélection cTyp, colChamps, bdSél
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
  sSQL = "select lnt_t1,lnt_t2,lnt_t3,lnt_t4,lnt_t5,lnt_libelle from libntype where " & sFinalWP & " order by lnt_t1,lnt_t2,lnt_t3,lnt_t4,lnt_t5"
  On Error Resume Next
  BDEtat sSQL, drType, bImpression
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("lnt_t1") & " " & colChamps("lnt_t2") & " " & colChamps("lnt_t3") & " " & colChamps("lnt_t4") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub
